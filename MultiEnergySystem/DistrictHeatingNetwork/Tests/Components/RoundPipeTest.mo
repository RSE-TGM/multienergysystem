within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;
model RoundPipeTest
  extends Modelica.Icons.Example;
  parameter Integer n = 7 "number of volumes";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 6000;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 2400;

  DistrictHeatingNetwork.Components.Pipes.round1DFV rpipe1(
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
    n=n,
    nPipes=1,
    kc=1,
    k=1500) annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP(
    p0=110000,
    use_T=true,
    T0=323.15)
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP(
    p0=101000,
    use_T=true,
    T0=303.15)
    annotation (Placement(transformation(extent={{58,70},{78,90}})));
  DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(n=n, Twall=308.15)
    annotation (Placement(transformation(extent={{-10,114},{10,134}})));
  DistrictHeatingNetwork.Components.Pipes.round1DFV rpipe2(
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
    n=n,
    nPipes=1,
    kc=1,
    k=1500) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  DistrictHeatingNetwork.Components.Thermal.Wall.Wall_inputQ wall_inputQ(n=n, Twall=308.15)
    annotation (Placement(transformation(extent={{-10,44},{10,64}})));
  Modelica.Blocks.Sources.RealExpression Q(y=50000)
    annotation (Placement(transformation(extent={{-32,58},{-12,78}})));
  inner System system
    annotation (Placement(transformation(extent={{80,120},{100,140}})));
  DistrictHeatingNetwork.Components.Pipes.round1DFV hotside(
    L=0.7073,
    thermalInertia=false,
    cm=500,
    rhom(displayUnit="g/cm3") = 7990,
    lambdam=16.3,
    m_flow_start=0.6154,
    pin_start=110000,
    pout_start=101000,
    hin_start=1e5,
    Tin_start=353.15,
    Tout_start=333.15,
    Di=0.03,
    n=n,
    nPipes=1,
    kc=1,
    k=4162.27,
    Stot=0.5,
    gamma_nom=gamma_nom_hot)
    annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
  DistrictHeatingNetwork.Components.Pipes.round1DFV coldside(
    L=0.96275,
    thermalInertia=false,
    rhom(displayUnit="kg/m3"),
    m_flow_start=5,
    pin_start=110000,
    pout_start=101000,
    hin_start=1e5,
    Tin_start=323.15,
    Tout_start=303.15,
    Di=0.023,
    n=n,
    nPipes=1,
    kc=1,
    k=13923.8,
    Stot=0.5,
    gamma_nom=gamma_nom_cold)
    annotation (Placement(transformation(extent={{10,30},{-10,10}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceHot(
    p0(displayUnit="kPa") = 110000,
    use_T=true,
    T0=353.15)
    annotation (Placement(transformation(extent={{-80,-42},{-60,-22}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkHot(
    p0(displayUnit="kPa") = 1000*(110 - 2.5),
    use_T=true,
    T0=303.15) annotation (Placement(transformation(extent={{62,-42},{82,-22}})));
  DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV metalWallFV(
    Nw=n,
    M=500,
    cm=500,
    Tstartbar=318.15,
    Tstart1=333.15,
    TstartN=303.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologyFV heatExchangerTopologyFV(Nw=n,
      redeclare model HeatExchangerTopology =
        MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologies.CounterCurrentFlow)
    annotation (Placement(transformation(extent={{-10,-26},{10,-6}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCold(
    p0(displayUnit="kPa") = 1000*(110 - 19.3),
    use_T=true,
    T0=288.75)
    annotation (Placement(transformation(extent={{-60,10},{-80,30}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceCold(
    p0(displayUnit="kPa") = 110000,
    use_T=true,
    T0=280.15) annotation (Placement(transformation(extent={{82,10},{62,30}})));
equation
  connect(wall_FixedT.MultiPort, rpipe1.wall)
    annotation (Line(points={{0,124},{0,105.1}},
                                               color={255,238,44}));
  connect(sourceP.outlet, rpipe1.inlet) annotation (Line(points={{-60,80},{-40,80},
          {-40,100},{-10,100}},
                              color={168,168,168}));
  connect(rpipe1.outlet, sinkP.inlet) annotation (Line(points={{10,100},{40,100},
          {40,80},{58,80}},
                         color={168,168,168}));
  connect(wall_inputQ.MultiPort, rpipe2.wall)
    annotation (Line(points={{0,54},{0,45.1}},color={255,238,44}));
  connect(Q.y, wall_inputQ.S) annotation (Line(points={{-11,68},{0,68},{0,58}},
                          color={0,0,127}));
  connect(sourceP.outlet, rpipe2.inlet)
    annotation (Line(points={{-60,80},{-40,80},{-40,40},{-10,40}},
                                               color={168,168,168}));
  connect(rpipe2.outlet, sinkP.inlet)
    annotation (Line(points={{10,40},{40,40},{40,80},{58,80}},
                                             color={168,168,168}));
  connect(sourceHot.outlet, hotside.inlet)
    annotation (Line(points={{-60,-32},{-10,-32}}, color={168,168,168}));
  connect(sinkHot.inlet, hotside.outlet)
    annotation (Line(points={{62,-32},{10,-32}}, color={168,168,168}));
  connect(heatExchangerTopologyFV.side2, hotside.wall)
    annotation (Line(points={{0,-19.1},{0,-26.9}}, color={255,238,44}));
  connect(metalWallFV.ext, heatExchangerTopologyFV.side1)
    annotation (Line(points={{0,-3.1},{0,-13}},  color={255,238,44}));
  connect(coldside.wall, metalWallFV.int)
    annotation (Line(points={{0,14.9},{0,3}},    color={255,238,44}));
  connect(sinkCold.inlet, coldside.outlet)
    annotation (Line(points={{-60,20},{-10,20}},   color={168,168,168}));
  connect(coldside.inlet, sourceCold.outlet)
    annotation (Line(points={{10,20},{62,20}},   color={168,168,168}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{100,140}})),
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end RoundPipeTest;
