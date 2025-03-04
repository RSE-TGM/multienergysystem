within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand_D
  extends PaperCaseI_Demand_A(sourceP1(use_in_X0=true), X_start = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X,
    sourceP18(use_in_X0=true));
  Modelica.Blocks.Sources.Ramp ramp[nX](
    height={-0.035,0,0,0,0,0,0.035},
                    each duration=0, offset=X_start,
    each startTime=30000)                    annotation (Placement(transformation(extent={{20,82},{0,102}})));
  Modelica.Blocks.Sources.Ramp ramp1
                                   [nX](
    height={0.015,0,0,0,0,0,-0.015},
    each duration=0,
    offset=X_start,
    each startTime=38000)                    annotation (Placement(transformation(extent={{-92,20},{-112,40}})));
  TestFacility.Plants.Thermal.Systems.GasBoiler
                                   gasBoiler(redeclare model Gas = Medium,
    Pmaxnom=147.6e3*0.78)                                   annotation (Placement(transformation(extent={{120,74},{144,98}})));
  DistrictHeatingNetwork.Sources.SourcePressure
                         source(
    use_in_p0=false,
    use_in_T0=false,
    p0(displayUnit="Pa") = 1.67e5,
    T0(displayUnit="K") = 60 + 273.15,
    R=1e-3)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={120,124})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
    use_in_m_flow=false,
    pin_start(displayUnit="Pa") = 2.17e5,
    p0(displayUnit="Pa") = 2.17e5,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=2.2955973,
    G=1e-8)                      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={144,126})));
  Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=[0,80 + 273.15; +1e6,80 + 273.15])
    annotation (Placement(transformation(extent={{78,88},{90,100}})));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table={20e3,1e6}, startValue=false)
    "Input to decide whether or nor the gas boiler is working"
    annotation (Placement(transformation(extent={{78,70},{90,82}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=[0,1; 1e6,1])
    annotation (Placement(transformation(extent={{78,106},{90,118}})));
  Modelica.Blocks.Sources.TimeTable P101_omega(table=[0,2*3.141592654*30; 1e6,2*3.141592654*30])
    annotation (Placement(transformation(extent={{78,124},{90,136}})));
equation
  connect(ramp.y, sourceP1.in_X0) annotation (Line(points={{-1,92},{-11.6,92}},                 color={0,0,127}));
  connect(ramp1.y, sourceP18.in_X0) annotation (Line(points={{-113,30},{-128,30},{-128,8.4}}, color={0,0,127}));
  connect(gasBoiler.inletFuel, pipe14.inlet) annotation (Line(
      points={{132,72.08},{132,60},{40,60},{40,-40},{45,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(source.outlet, gasBoiler.inlet) annotation (Line(
      points={{120,114},{120,108},{127.32,108},{127.32,99.8}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkMassFlow.inlet, gasBoiler.outlet) annotation (Line(
      points={{144,116},{144,106},{136.92,106},{136.92,99.8}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101_Status.y, gasBoiler.status) annotation (Line(points={{90.6,76},{108,76},{108,87.2},{118.8,87.2}},   color={255,0,255}));
  connect(GB101_ToutSP.y, gasBoiler.Toutset) annotation (Line(points={{90.6,94},{100,94},{100,89.6},{118.8,89.6}},     color={0,0,127}));
  connect(FCV101_theta.y, gasBoiler.theta) annotation (Line(points={{90.6,112},{102,112},{102,92},{118.8,92}},   color={0,0,127}));
  connect(P101_omega.y, gasBoiler.omega) annotation (Line(points={{90.6,130},{104,130},{104,94.4},{118.8,94.4}},   color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_Demand_D;
