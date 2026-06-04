within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_source1_PID
  extends RG2i_source1;
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.93*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-165,8},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-120,-6},{-100,14}})));
equation
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-154,8},{-118,
          8}},                   color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-152,18.6},{-152,44},{-52,44},{-52,8},{-92,8},
          {-92,-10},{-128,-10},{-128,0},{-118,0}},
                                 color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-99,4},{-102,4},{-102,18}},
                               color={0,0,127}));
  annotation (experiment(
      StopTime=28800,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_source1_PID;
