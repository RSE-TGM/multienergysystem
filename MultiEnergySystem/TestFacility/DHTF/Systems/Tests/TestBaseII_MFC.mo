within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseII_MFC
  extends TestBaseI(
    redeclare HeatGeneration.CentralizedThreeGenGBEBCHP_FC heatGen(
      pout_start_S100=220000,
      pout_start_S400=220000),
    actuator(omegaP101(table=[0,1.6; 1e3,1.6]),
    domegaP401(table=[0,1; 1e3,1]),
      domegaP501_var(y=1.0)),
    ramp(
      height=0.2e5*0,
      duration=5000,
      offset=2.2e5),
    sinkPressure(
      use_in_p0=true,
      p0=2.2e5,
      R=1e-4));

 parameter Real m_flow_S2 = 2;
  Subsystems.HeatGeneration.TESFC S200(
    Tin_start=338.15,
    Tout_start=338.15,                 q_m3h_S2=8,
    FCV201(dp_nom=0.5e5))                          "Subsystem S200 - Thermal Storage System" annotation (Placement(transformation(extent={{134,-86},{224,4}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
    L=24.5,
    t=1.5e-3,
    set_m_flow_start=true,
    m_flow_start=2,
    pin_start(displayUnit="Pa") = 2e5,
    Tin_start(displayUnit="K") = 65 + 273.15,
    Tout_start(displayUnit="K") = 65 + 273.15,
    Di=51e-3,
    q_m3h_start=7,
    n=3,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle)
                   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={162,34})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    L=21.5,
    t=1.5e-3,
    set_m_flow_start=true,
    m_flow_start=2,
    pin_start(displayUnit="Pa") = 2.1e5,
    Tin_start(displayUnit="K") = 65 + 273.15,
    Tout_start(displayUnit="K") = 65 + 273.15,
    Di=51e-3,
    q_m3h_start=5,
    n=3,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle)
                   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={196,34})));
  Modelica.Blocks.Sources.IntegerExpression S200status(y=2)    annotation (
    Placement(transformation(extent={{62,-72},{82,-52}})));
  Modelica.Blocks.Sources.RealExpression domegaP201_var(y=2)         annotation (
    Placement(transformation(extent={{62,-88},{83,-67}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV201_var(y=1)   annotation (
    Placement(transformation(extent={{62,-102},{82,-82}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourcePressure1(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 65 + 273.15,
    R=1e-3)                                                    annotation (Placement(transformation(extent={{186,48},{166,68}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure1(
    p0(displayUnit="Pa") = 2e5,
    use_in_p0=true,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-3)                                                annotation (Placement(transformation(extent={{208,44},{228,64}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false)         annotation (
    Placement(transformation(extent={{26,24},{17,33}})));
equation
  connect(PL_S200_rCD_cold.outlet,S200. inlet) annotation (Line(
      points={{162,24},{162,17.875},{161.45,17.875},{161.45,10.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,S200. outlet) annotation (Line(
      points={{196,24},{196,17.375},{197.45,17.375},{197.45,10.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S200status.y, S200.status) annotation (Line(points={{83,-62},{106,-62},{106,-42},{129.5,-42},{129.5,-36.5}}, color={255,127,0}));
  connect(domegaP201_var.y, S200.pumpset) annotation (Line(points={{84.05,-77.5},{106,-77.5},{106,-9.5},{129.5,-9.5}}, color={0,0,127}));
  connect(dthetaFCV201_var.y, S200.theta) annotation (Line(points={{83,-92},{112,-92},{112,-18.5},{129.5,-18.5}}, color={0,0,127}));
  connect(ramp.y, sinkPressure1.in_p0) annotation (Line(points={{63,-16},{62,-16},{62,2},{60,2},{60,72},{214,72},{214,62.4}}, color={0,0,127}));
  connect(PL_S200_rCD_cold.inlet, heatGen.returncold) annotation (Line(
      points={{162,44},{162,42},{2,42},{2,13.6},{-8,13.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, heatGen.senthot) annotation (Line(
      points={{196,44},{196,52},{186,52},{186,20},{42,20},{42,-4},{12,-4},{12,-18},{2,-18},{2,-17.6},{-8,-17.6}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(
      StopTime=5500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestBaseII_MFC;
