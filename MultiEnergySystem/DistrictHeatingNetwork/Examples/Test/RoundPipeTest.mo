within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model RoundPipeTest
  Components.Pipes.round1DFV rpipe1(
    L=2,
    thermalInertia=false,
    rhom(displayUnit="kg/m3"),
    m_flow_start=5,
    pin_start=110000,
    pout_start=101000,
    hin_start=1e5,
    Tin_start=323.15,
    Tout_start=303.15,
    Di=0.1,
    n=5,
    nPipes=1,
    kc=1,
    k=1500) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Sources.SourcePressure sourceP(
    p0=110000,
    use_T=true,
    T=323.15)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Sources.SinkPressure sinkP(
    p0=101000,
    use_T=true,
    T=303.15)
    annotation (Placement(transformation(extent={{62,-10},{82,10}})));
  Components.Thermal.Wall.Wall_FixedT wall_FixedT(n=5, Twall=308.15)
    annotation (Placement(transformation(extent={{-10,74},{10,94}})));
equation
  connect(rpipe1.outlet, sinkP.inlet) annotation (Line(points={{10,0},{62,0}},
                          color={168,168,168}));
  connect(sourceP.outlet, rpipe1.inlet) annotation (Line(points={{-60,0},{-10,0}},
                              color={168,168,168}));
  connect(wall_FixedT.MultiPort, rpipe1.wall)
    annotation (Line(points={{0,84},{0,5.1}},  color={255,238,44}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end RoundPipeTest;
