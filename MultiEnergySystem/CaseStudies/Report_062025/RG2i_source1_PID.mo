within MultiEnergySystem.CaseStudies.Report_062025;
model RG2i_source1_PID
  extends RG2i_source1(
    valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*1e5))),
    Immissione_1(X0={1,0}));

  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.92*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-141,-6},
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
    annotation (Placement(transformation(extent={{-114,-24},{-94,-4}})));
equation
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-130,-6},{
          -130,-10},{-112,-10}}, color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-152,18.6},{-152,12},{-160,12},{-160,-28},{
          -124,-28},{-124,-18},{-112,-18}},
                                 color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-93,-14},{-93,-16},{-76,-16},{-76,8},{-104,8},{
          -104,18},{-102,18}}, color={0,0,127}));
  annotation (experiment(
      StopTime=28800,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"));
end RG2i_source1_PID;
