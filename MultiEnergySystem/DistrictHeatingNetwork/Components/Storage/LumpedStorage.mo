within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model LumpedStorage "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  // Insulation parameters
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";

  //Variables
  Modelica.Units.SI.Mass M(start = M_id) "Total mass in the tank";
  Modelica.Units.SI.Density rho "Density of the fluid in the tank (at the outlet)";
  SI.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  SI.HeatFlowRate Q_amb "Heat losses to ambient";

  Medium fluidIn(T_start = T_start, p_start = pin_start), fluidOut(T_start = T_start, p_start = pin_start + 995*H*Modelica.Constants.g_n);


equation
// Fluid
//   fluidIn = Medium.setState_phX(pin, inlet.h_out);
//   fluidOut = Medium.setState_pTX(pout, Tout);
//   rho = Medium.density(fluidOut);

  {fluidIn.p, fluidIn.h} = {pin, inlet.h_out};
  {fluidOut.p, fluidOut.T} = {pout, Tout};
  rho = fluidOut.rho;

  Tin = fluidIn.T;
  outlet.h_out = fluidOut.h;
  Ttilde = Tout;

  // Mass Balance
  //der(M) = inlet.m_flow + outlet.m_flow;
  V*(fluidOut.drho_dT*der(Ttilde) + 1e-5*der(pout)) = inlet.m_flow + outlet.m_flow;
  M = rho*V;

  // Energy Balance
  M*fluidOut.cp*der(Ttilde) = m_flow_in*fluidOut.cp*(Tin - Tout) - Q_amb;

  // Pressure at the bottom of the tank is increased as Stevino
  pin - pout = rho*H*g_n;

  // Computation of heat loss to ambient
  Q_amb = 1/(R_lateral + 2*R_flat)*(Ttilde - T_ext) "Insulation all around";

initial equation
  der(Ttilde) = 0;
  der(pout) = 0;
  annotation (
    Icon(graphics={  Rectangle(origin={76,-180},    fillColor={140,56,54},       fillPattern=
              FillPattern.Solid,                                                                                  extent = {{-4, 20}, {4, -20}}), Rectangle(origin={-76,-180},    fillColor={140,56,
              54},                                                                                                                                                                                             fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        extent = {{-4, 20}, {4, -20}}), Text(origin={0,-220},    extent = {{-100, 20}, {100, -20}},
          textString="%name",
          textColor={140,56,54}),                                                                                                                                                                                                        Rectangle(                  lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent={{-100,
              160},{100,-140}}),                                                                                                                                                                                                        Ellipse(origin={0,163},    lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        extent = {{-100, 37}, {100, -37}}), Ellipse(origin={0,-141},   lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}),                                                                                                                                                                          Rectangle(origin={-71,100},   lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin={-71,-98},    lineColor = {0, 0, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Polygon(origin={-61,-186},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin={73,-186},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-11, -14}, {-21, 12}, {-13, 14}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin={5,-186},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-13, -14}, {-13, 22}, {3, 22}, {3, -14}, {3, -14}, {-13, -14}})}, coordinateSystem(extent={{-100,
            -200},{100,200}})));
end LumpedStorage;
