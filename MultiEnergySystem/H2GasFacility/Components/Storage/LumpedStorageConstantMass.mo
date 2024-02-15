within MultiEnergySystem.H2GasFacility.Components.Storage;
model LumpedStorageConstantMass

  extends
    MultiEnergySystem.H2GasFacility.Components.BaseClass.PartialLumpedVolume;

  // Insulation parameters
  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density";
  parameter H2GasFacility.Types.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter H2GasFacility.Types.Length dIns = 0.15 "Insulation thickness";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";

  // Variables
  Types.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  Types.HeatFlowRate Q_amb "Heat losses to ambient";

  Modelica.Units.SI.HeatFlowRate Q_flow "Heat flowing from the pipe";

  Modelica.Blocks.Interfaces.RealOutput temperatureMixVolume annotation (
    Placement(visible = true, transformation(origin = {60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));


equation
    // Fluid definition
    fluidIn.p = inlet.p;
    //fluidIn.h = inStream(inlet.h_out);
    fluidIn.T = T_a_inflow;
    fluidIn.Xi = inStream(inlet.Xi);

    fluidOut.p = outlet.p;
    fluidOut.T = T_b_outflow;
    fluidOut.Xi = outlet.Xi;


    // Boundary Conditions
    inlet.h_out = inStream(inlet.h_out);

    // Mass Balance
    inlet.m_flow + outlet.m_flow = 0 "No mass dynamics";

    // Energy Balance
    M_id * fluidIn.cp * der(Ttilde) = m_flow_in * fluidIn.cp * (T_a_inflow - T_b_outflow) - Q_amb "Ideal perfectly mixed fluid";

    // Pressure at the bottom of the tank is increased as Stevino
    inlet.p - outlet.p = rho_nom*H*g_n;

    // Computation of heat loss to ambient
    Q_amb = 1/(R_lateral + 2*R_flat)*(Ttilde - T_ext) "Insulation all around";

    // Output variable
    temperatureMixVolume = Ttilde - 273.15;

    // Boundary equations
    outlet.h_out = T_b_outflow * fluidOut.cp;
    if not allowFlowReversal or m_flow_in > 0 then
      T_a_inflow = inStream(inlet.h_out) / fluidIn.cp;
      T_b_outflow = Ttilde;
    else
      T_a_inflow = Ttilde;
      T_b_outflow = inStream(outlet.h_out) / fluidOut.cp;
    end if;

initial equation
    der(Ttilde) = 0;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={                                                                                                                                                                                                        Rectangle(                  lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent={{-100,98},
              {100,-82}}),                                                                                                                                                                                                        Ellipse(origin={0,99},     lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}), Ellipse(origin={0,-83},    lineColor = {145, 145, 145}, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}),                                                                                                                                                                          Rectangle(origin={-71,50},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin={-69,-56},    lineColor = {0, 0, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}),
                                                                                                                                                  Rectangle(origin={-68,-120},    fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}),                                                                                                                                                                                                        Polygon(origin={-55,-126},    fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin={73,-126},    fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-11, -14}, {-21, 12}, {-13, 14}, {-1, -14}, {-1, -14}, {-11, -14}}),
                     Rectangle(origin={74,-120},    fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-4, 20}, {4, -20}}),                                                                                                                                                                                                        Polygon(origin={5,-126},    fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, points = {{-13, -14}, {-13, 22}, {3, 22}, {3, -14}, {3, -14}, {-13, -14}}),
                                                                                                                                                                                                        Text(origin={2,-158},    extent = {{-100, 20}, {100, -20}}, textString = "%name",
          textColor={244,125,35})}),                             Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LumpedStorageConstantMass;
