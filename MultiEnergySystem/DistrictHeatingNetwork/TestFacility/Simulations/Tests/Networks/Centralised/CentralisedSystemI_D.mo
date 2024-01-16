within MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemI_D
  "Gas Boiler, Electric Boiler & Water Tanks"
  extends CentralisedSystemI_B;
  // System S200

  parameter Boolean FV201_state = true;
  parameter Boolean FV202_state = true;
  parameter Boolean FV203_state = true;
  parameter Boolean FV204_state = true;
  parameter Boolean FV205_state = true;
  parameter Boolean FV206_state = false;
  parameter Boolean FV207_state = false;
  parameter Boolean FV208_state = true;
  parameter Boolean FV209_state = true;

  parameter Types.Pressure pin_start_S2 = 2.1e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 6;
  final parameter Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
  parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

  parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];


  // Pipe length
  parameter Types.Length L_S2_PL0 = 24.5;
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;
  parameter Types.Length L_S2_PL7 = 2;
  parameter Types.Length L_S2_PL8 = 3;
  parameter Types.Length L_S2_PL9 = 21.5;

  parameter Types.Length L_S2_S201_S202 = 2.5;
  parameter Types.Length h_S2_S201_S202 = 0;
  parameter Types.Length L_S2_Tanks_High = 2.5;
  parameter Types.Length h_S2_Tanks_High = -2.5;
  parameter Types.Length L_S2_S201_FT201 = 1;
  parameter Types.Length h_S2_S201_FT201 = 0;
  parameter Types.Length L_S2_D201_FT201 = 2;
  parameter Types.Length h_S2_D201_FT201 = 0;

  Components.Storage.StratifiedStorage
    D201(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-762,-460},{-818,-348}})));
  Components.TurboMachines.ControlledPump
    P201(
    pout_start(displayUnit="Pa") = 3e5,
    Tin_start(displayUnit="K") = Pump.P201.Tin_start,
    Tout_start=Pump.P201.Tout_start,
    a=Pump.P201.a,
    b=Pump.P201.b,
    m_flow_start=m_flow_S2,
    dpnom=Pump.P201.dpnom,
    etaelec=Pump.P201.etaelec,
    etamech=Pump.P201.etamech,
    etanom=Pump.P201.etanom,
    hin_start=Pump.P201.hin_start,
    m_flow_nom=Pump.P201.m_flow_nom,
    omeganom=Pump.P201.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    headnom=Pump.P201.headnom,
    qnom_inm3h=Pump.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h,
    use_q_m3hr=true)                                              annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-794,-192})));
              Components.Storage.StratifiedStorage                                      D202(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-700,-460},{-644,-348}})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-795.75,-50.75})));
  Sensors.IdealAbsolutePressureSensor                                          PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-796,-70.5})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_TT201_FV201(
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-794,-92})));
  Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-854,-182})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FCV201_FV202(
    L=L_S2_PL3,
    t=L_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-854,-152})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_P201_FV209(
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-794,-224})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV209_FCV201(
    L=L_S2_PL4,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-854,-212})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-752,-52})));
  Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-752,-122})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_rCD_hot(
    L=L_S2_PL9,
    t=t_S2,
    pin_start=pout_start_S2,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-754,-32})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D202_High(
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-714,-396})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_rCD_cold(
    L=L_S2_PL0,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-794,-32})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_High(
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-748,-396})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_D202_High(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-730,-424})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_D202_Low(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-730,-440})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV209_D201(
    L=L_S2_PL6,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-822,-474})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_FT201(
    L=L_S2_D201_FT201,
    h=h_S2_D201_FT201,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-834,-424})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV201_P201(
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-794,-154})));
  Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-824,-112})));
  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-824,-100})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-824,-94})));
  Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-794,-132})));
  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-812,-138},{-800,-126}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-802,-142},{-822,-122}})));
  Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-774,-170})));
  Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-774,-156})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-774,-150})));
  Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-794,-252})));
  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=0,
        origin={-806.5,-252})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-812,-252})));
  Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-774,-238})));
  Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-754,-202})));
  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-734,-208},{-745,-196}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-732,-202})));
  Sensors.IdealMassFlowSensor                                          FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-751,-263})));
  Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={-774,-248})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-774,-252})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-888,-192},{-868,-172}})));
  Sources.PumpInput P201_input(
    useOmega=false,
    omega=P201omega,
    q_m3h=P201qm3h)
    annotation (Placement(transformation(extent={{-834,-198},{-814,-178}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-794,-70.5},{-794,-61.625},{-793.85,-61.625},{-793.85,-50.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
      points={{-794,-82},{-794,-70.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
      points={{-794,-201.6},{-794,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-754.4,-52},{-754.4,-122}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
      points={{-754,-42},{-754,-52},{-754.4,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
      points={{-794,-42},{-794,-53.375},{-793.85,-53.375},{-793.85,-50.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
      points={{-762,-369},{-748,-369},{-748,-386}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
      Line(
      points={{-720,-424},{-714,-424},{-714,-406}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
      Line(
      points={{-740,-424},{-748,-424},{-748,-406}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
      points={{-714,-386},{-714,-369},{-700,-369}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
      points={{-740,-440},{-756,-440},{-756,-439},{-762,-439}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
      points={{-720,-440},{-716,-440},{-716,-439},{-700,-439}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
      points={{-812,-474},{-748,-474},{-748,-439},{-762,-439}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
      points={{-854,-202},{-854,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
      points={{-854,-172},{-854,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
      points={{-794,-164},{-794,-182.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
      points={{-854,-142},{-854,-112},{-830,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
      points={{-794,-102},{-794,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
      points={{-794,-138},{-794,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet,FV201. inlet) annotation (Line(
      points={{-818,-112},{-794,-112},{-794,-126}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet,P201. inlet) annotation (Line(
      points={{-780,-170},{-794,-170},{-794,-182.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
      points={{-794,-234},{-794,-246}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet,FV209. inlet) annotation (Line(
      points={{-780,-238},{-794,-238},{-794,-246}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet,FV203. inlet) annotation (Line(
      points={{-768,-238},{-754,-238},{-754,-208}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet,FV203. outlet) annotation (Line(
      points={{-768,-170},{-754,-170},{-754,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FV203. outlet) annotation (Line(
      points={{-754.4,-122},{-754,-122},{-754,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.outlet,FV203. inlet) annotation (Line(
      points={{-753.8,-258.8},{-754,-238},{-754,-208}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-867,-182},{
          -862,-182}},                                 color={0,0,127}));
  connect(FV207.u,FV207_Status. activePort)
    annotation (Line(points={{-774,-239.92},{-774,-242.8}},
                                                        color={255,0,255}));
  connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-774,
          -243.6},{-774,-242.8}},                          color={255,0,255}));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
      Line(
      points={{-854,-222},{-854,-474},{-832,-474}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206_OnOff.y,FV206_Status. activePort)
    annotation (Line(points={{-774,-162.6},{-774,-161.5}}, color={255,0,255}));
  connect(FV206_OnOff.y,FV206. u) annotation (Line(points={{-774,-162.6},{-774,-168.08}},
                     color={255,0,255}));
  connect(FV203_OnOff.y,FV203. u) annotation (Line(points={{-745.55,-202},{-752.08,
          -202}},         color={255,0,255}));
  connect(FV203_OnOff.y,FV203_Status. activePort) annotation (Line(points={{-745.55,
          -202},{-745.8,-202}},         color={255,0,255}));
  connect(PL_S200_D201_FT201.inlet,FT201. inlet) annotation (Line(
      points={{-844,-424},{-848,-424},{-848,-334},{-753.8,-334},{-753.8,-267.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
      points={{-824,-424},{-748,-424},{-748,-406}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
      points={{-794,-258},{-794,-314},{-854,-314},{-854,-474},{-832,-474}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201_OnOff.y,FV201. u) annotation (Line(points={{-799.4,-132},{-795.92,
          -132}},         color={255,0,255}));
  connect(FV201_OnOff.y,FV201_Status. activePort)
    annotation (Line(points={{-799.4,-132},{-800.5,-132}}, color={255,0,255}));
  connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-824,-106.6},{-824,-110.08}},
                     color={255,0,255}));
  connect(FV202_OnOff.y,FV202_Status. activePort)
    annotation (Line(points={{-824,-106.6},{-824,-105.5}}, color={255,0,255}));
  connect(FV209_OnOff.y,FV209. u) annotation (Line(points={{-800.45,-252},{-795.92,
          -252}},         color={255,0,255}));
  connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-800.45,
          -252},{-800.5,-252}},         color={255,0,255}));
  connect(P201_input.y,P201. in_q_m3hr) annotation (Line(points={{-813,-188},{-806.26,
          -188},{-806.26,-187.2},{-799.52,-187.2}}, color={0,0,127}));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-794,-22},{-796,-22},{-796,-8},{-708,-8},{-708,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-754,-22},{-754,-14},{-700,-14},{-700,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
end CentralisedSystemI_D;
