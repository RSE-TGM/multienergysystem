within MultiEnergySystem.H2GasFacility.Components.Pipes;
model PipePF
  extends Components.Pipes.BaseClass.PartialRoundTube;

  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);

  BaseClass.DirectionalHeatLossPlugFlow directionalHeatLossPlugFlow(
    L=L,
    H=H,
    t=t,
    pmax=pmax,
    tIns=tIns,
    lambdaIns=lambdaIns,
    thermalInertia=thermalInertia,
    cm=cm,
    rhom=rhom,
    lambdam=lambdam,
    T_ext=T_ext,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pout_start,
    hin_start=hin_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    Di=Di) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-76,6},{-46,-8}},
          textColor={244,125,35},
          textString="InletHeatLoss
"),     Text(
          extent={{50,6},{80,-8}},
          textColor={244,125,35},
          textString="OutletHeatLoss
"),     Text(
          extent={{-12,14},{26,-12}},
          textColor={244,125,35},
          textString="PlugFlowCore"),
        Text(
          extent={{28,-16},{74,-42}},
          textColor={244,125,35},
          textString="ThermalInertia
"),     Text(
          extent={{-28,54},{34,30}},
          textColor={244,125,35},
          textString="TimeDelay
")}));
end PipePF;
