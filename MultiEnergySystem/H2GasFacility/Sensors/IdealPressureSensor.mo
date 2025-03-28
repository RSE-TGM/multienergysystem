within MultiEnergySystem.H2GasFacility.Sensors;
model IdealPressureSensor "Ideal pressure sensor"
  extends MultiEnergySystem.H2GasFacility.Sensors.BaseClass.PartialIdealFlowSensor;

  parameter Types.Temperature T_start = 15 + 273.15;
  parameter Types.Pressure p_start = 4.93e5;

  parameter Types.MassFlowRate m_flow_start "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));

  Modelica.Blocks.Interfaces.RealOutput p_meas "Measured pressure"
    annotation (Placement(transformation(extent={{28,64},{48,84}}), iconTransformation(extent={{28,64},{48,84}})));
equation
  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;

  // Mass composition balance
  inStream(inlet.Xi) = outlet.Xi;
  inStream(outlet.Xi) = inlet.Xi;
  // Momentum balance (no pressure losses)
  0 = inlet.p - outlet.p;
  // Mass flow balance
  0 = inlet.m_flow + outlet.m_flow;
  // Enthalpy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

  //
  p_meas = inlet.p;
                    annotation (Line(points={{38,74},{38,74}},
                                                         color={0,0,127}),
              Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,18},{80,-16}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-28,100},{28,46}},
          lineColor={0,0,0},
          lineThickness=1),
        Text(
          extent={{-18,94},{22,50}},
          textColor={0,0,0},
          textString="P"),
        Line(
          points={{0,46},{0,18}},
          color={0,0,0},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealPressureSensor;
