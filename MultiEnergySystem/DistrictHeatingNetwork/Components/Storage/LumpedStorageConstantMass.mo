within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model LumpedStorageConstantMass "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  // Insulation parameters
  parameter Types.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Types.Length dIns = 0.15 "Insulation thickness";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";

  // Variables
  Types.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  Types.HeatFlowRate Q_amb "Heat losses to ambient";

  Modelica.Blocks.Interfaces.RealOutput temperatureMixVolume annotation (
    Placement(visible = true, transformation(origin = {60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  // Mass Balance
  inlet.m_flow + outlet.m_flow = 0 "No mass dynamics";

  // Energy Balance
  M_id * cp * der(Ttilde) = m_flow_in * cp * (Tin - Tout) - Q_amb "Ideal perfectly mixed fluid";

  // Pressure at the bottom of the tank is increased as Stevino
  inlet.p - outlet.p = rho0*H*g_n;

  // Computation of heat loss to ambient
  Q_amb = 1/(R_lateral + 2*R_flat)*(Ttilde - T_ext) "Insulation all around";

  // Output variable
  temperatureMixVolume = Ttilde - 273.15;

  // Boundary equations
  outlet.h_out = Tout * cp;
  if not allowFlowReversal or m_flow_in > 0 then
    Tin = inStream(inlet.h_out) / cp;
    Tout = Ttilde;
  else
    Tin = Ttilde;
    Tout = inStream(outlet.h_out) / cp;
  end if;

initial equation
  der(Ttilde) = 0;


  annotation (
    Icon(graphics={  Rectangle(origin = {76, -120}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}), Rectangle(origin = {-76, -120}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}), Text(origin = {0, -160}, extent = {{-100, 20}, {100, -20}}, textString = "%name"), Rectangle(origin = {0, 10}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 90}, {100, -90}}), Ellipse(origin = {0, 103}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}), Ellipse(origin = {0, -83}, lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}), Polygon(origin = {-61, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Rectangle(origin = {-71, 54}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin = {-71, -60}, lineColor = {0, 0, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Polygon(origin = {-61, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin = {73, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {-21, 12}, {-13, 14}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin = {5, -126}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-13, -14}, {-13, 22}, {3, 22}, {3, -14}, {3, -14}, {-13, -14}})}, coordinateSystem(extent = {{-100, -140}, {100, 140}})));
end LumpedStorageConstantMass;
