within MultiEnergySystem.CaseStudies.Report_062025;
model RG2i_source2_PID
  extends RG2i_source2(
    valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*1e5))),
      m_flow_H1(offset=0.0001));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.92*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-137,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  H2GasFacility.Controllers.AWPIDContinuous
                              aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-110,-28},{-90,-8}})));
equation
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-126,-10},{
          -126,-14},{-108,-14}}, color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-135.8,8},{-156,8},{-156,-36},{-108,-36},{
          -108,-22}},            color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-89,-18},{-89,-20},{-80,-20},{-80,8},{-104,8},{
          -104,18},{-102,18}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
end RG2i_source2_PID;
