within MultiEnergySystem.H2GasFacility.Components.Pipes;
model PipePF
  Interfaces.FluidPortInlet                                 inlet(m_flow(min=
          if allowFlowReversal then -Modelica.Constants.inf else 0))                                                                    annotation (
    Placement(visible = true, transformation(origin={-100,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.FluidPortOutlet                                 outlet(m_flow(max=
          if allowFlowReversal then +Modelica.Constants.inf else 0))                                                                      annotation (
    Placement(visible = true, transformation(origin={100,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-76,6},{-46,-8}},
          textColor={244,125,35},
          textString="InletHeatLoss
"),
        Text(
          extent={{50,6},{80,-8}},
          textColor={244,125,35},
          textString="OutletHeatLoss
"),
        Text(
          extent={{-12,14},{26,-12}},
          textColor={244,125,35},
          textString="PlugFlowCore"),
        Text(
          extent={{28,-16},{74,-42}},
          textColor={244,125,35},
          textString="ThermalInertia
"),
        Text(
          extent={{-28,54},{34,30}},
          textColor={244,125,35},
          textString="TimeDelay
")}));
end PipePF;
