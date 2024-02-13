within MultiEnergySystem.H2GasFacility.Components.Pipes;
model PipePF
  extends Components.Pipes.BaseClass.PartialRoundTube;

  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
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
    Di=Di) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,0})));
  BaseClass.PlugFlowCore plugFlowCore
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  BaseClass.DirectionalHeatLossPlugFlow directionalHeatLossPlugFlow1
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,0})));
  Storage.LumpedStorageConstantMass lumpedStorageConstantMass
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Sensors.IdealMassFlowSensor idealMassFlowSensor
    annotation (Placement(transformation(extent={{-56,-6},{-36,14}})));
  BaseClass.TimeDelayPlugFlow timeDelayPlugFlow
    annotation (Placement(transformation(extent={{-8,42},{12,62}})));
equation
  connect(lumpedStorageConstantMass.outlet, outlet) annotation (Line(
      points={{60,-20},{60,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(idealMassFlowSensor.outlet, plugFlowCore.inlet) annotation (Line(
      points={{-40,0},{-20,0}},
      color={182,109,49},
      thickness=0.5));
  connect(idealMassFlowSensor.m_flow, timeDelayPlugFlow.m_flow) annotation (
      Line(points={{-39,10},{-28,10},{-28,56.4},{-6.2,56.4}}, color={0,0,127}));
  connect(timeDelayPlugFlow.tau_rev, directionalHeatLossPlugFlow.tau)
    annotation (Line(points={{11.5,48.5},{18,48.5},{18,32},{-66,32},{-66,6}},
        color={0,0,127}));
  connect(timeDelayPlugFlow.tau, directionalHeatLossPlugFlow1.tau) annotation (
      Line(points={{11.3,56.3},{24,56.3},{24,20},{10,20},{10,-22},{22,-22},{22,
          -6}}, color={0,0,127}));
  connect(directionalHeatLossPlugFlow1.outlet, lumpedStorageConstantMass.inlet)
    annotation (Line(
      points={{40,0},{50,0},{50,-40},{60,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow1.inlet, plugFlowCore.outlet) annotation (
      Line(
      points={{20,0},{0,0}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow.outlet, inlet) annotation (Line(
      points={{-84,7.77156e-16},{-91,7.77156e-16},{-91,0},{-100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow.inlet, idealMassFlowSensor.inlet)
    annotation (Line(
      points={{-64,-1.66533e-15},{-56,-1.66533e-15},{-56,0},{-52,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-86,-8},{-64,-18}},
          textColor={244,125,35},
          textString="InletHeatLoss
"),     Text(
          extent={{-22,-10},{0,-20}},
          textColor={244,125,35},
          textString="PlugFlowCore"),
        Text(
          extent={{54,-40},{86,-54}},
          textColor={244,125,35},
          textString="ThermalInertia
"),     Text(
          extent={{-24,74},{24,62}},
          textColor={244,125,35},
          textString="TimeDelay
"),     Text(
          extent={{-56,-6},{-36,-20}},
          textColor={244,125,35},
          textString="MassFlowSensor
")}));
end PipePF;
