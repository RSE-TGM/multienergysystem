within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_source2_PID
  extends Rete_Gas_2i_source2(
  redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    m_flow_H1(offset=0.0001),
    Immissione_2(X0={0,1}));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.93*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-151,-14},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-124,-32},{-104,-12}})));
equation
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-140,-14},{-140,
          -18},{-122,-18}},      color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-135.8,4},{-168,4},{-168,-32},{-132,-32},{-132,
          -26},{-122,-26}},      color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-103,-22},{-103,-24},{-96,-24},{-96,8},{-104,8},{-104,
          18},{-102,18}},      color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=48000, __Dymola_Algorithm="Dassl"));
end RG2i_source2_PID;
