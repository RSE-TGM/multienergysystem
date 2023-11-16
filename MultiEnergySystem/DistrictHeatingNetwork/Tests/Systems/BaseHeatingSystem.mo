within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model BaseHeatingSystem
  "Case in which there isn't any source of heat"
  extends Modelica.Icons.Example;

  //General parameters of pipes
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";


  parameter Types.Length L_S1 = 10;
  parameter Types.Length L_S9 = 10;
  //parameter Types.MassFlowRate m_flow_total = 2.4095388;
  parameter Types.MassFlowRate m_flow_total = 2.5;

  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;

  parameter Types.Temperature Tcool = 27 + 273.15;
  parameter Types.Temperature Tcool_out = 32 + 273.15;
  parameter Types.MassFlowRate m_flow_cool = 1.75;

  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Types.Length L_Users = 2;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Real Kv_UsersValve(unit = "m3/h") = 4 "Metri Flow Coefficient ";
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 50000;

  parameter Real theta1change = 0;
  parameter Real theta2change = 0;
  parameter Real theta3change = 0;
  parameter Real thetachange = -0.98;

  // Rack

  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;
  parameter Types.Pressure pin_start = 1.69e5;
  parameter Types.Pressure pout_start = 3e5;
  parameter Types.Temperature T_start = 25 + 273.15;
  parameter Types.MassFlowRate m_flow_start = 4.04;

  // System S100

  parameter Types.Pressure pin_start_S1 = 1.695e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;

  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;

  // System S900

  parameter Types.Pressure pin_start_S9 = 2.3e5;
  parameter Types.Pressure pout_start_S9 = 3.2e5;
  parameter Types.Temperature Tin_start_S9 = 80 + 273.15;
  parameter Types.Temperature Tout_start_S9 = 80 + 273.15;

  parameter Types.Length L_S9_PL1 = 0.82;
  parameter Types.Length L_S9_PL2 = 2.3;
  parameter Types.Length L_S9_PL3 = 1.5;
  parameter Types.Length L_S9_PL4 = 0.65;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_S9 = 4.04;
  parameter Types.VolumeFlowRate q_P901_computed = 8.1;

  // Cooling System
  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;

  parameter Types.Temperature T_start_hot_Source = 80 + 273.15;
  parameter Types.Temperature T_start_cold_Source = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;

  parameter Types.Temperature T_start_cold_Users = 7 + 273.15;
  parameter Types.Temperature T_start_hot_Users = 15.6 + 273.15;
  parameter Types.MassFlowRate m_flow_Users_total = 5.553528*3600/1000;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;
  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;
  parameter Types.Power Pchiller = -148751*0;
  parameter Types.Power Pchillervar = 0;
  parameter Types.MassFlowRate m_flow_cold = 0.05;

  parameter Types.Temperature T_start_cold = 13 + 273.15;
  parameter Types.Temperature Tout_cold = 32.09+273.15;
  parameter Real Kv_FCVC01(unit = "m3/h") = 14;
  parameter Real Kv_FCVC02(unit = "m3/h") = 14;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={788,290},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(
    L=L_S9,
    t=t_S9,
    m_flow_start=m_flow_total,
    pin_start=pin_start_Users + 0.01e5,
    pout_start=pin_start_Users,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={20,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={140,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={260,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_cold(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_S1,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={290,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={480,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={510,240})));
  Sources.SourcePressure VE901(p0=164000, T0(displayUnit="K") = 30 + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-764,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P901(
    Tin_start=Pump.P901.Tin_start,
    Tout_start=Pump.P901.Tout_start,
    hin_start=Pump.P901.hin_start,
    pin_start=Pump.P901.pin_start,
    pout_start=Pump.P901.pout_start,
    a=Pump.P901.a,
    b=Pump.P901.b,
    dpnom=Pump.P901.dpnom,
    etaelec=Pump.P901.etaelec,
    etamech=Pump.P901.etamech,
    etanom=Pump.P901.etanom,
    headmax=Pump.P901.headnommax,
    headmin=Pump.P901.headnommin,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    qnom_inm3h=Pump.P901.qnom_inm3h,
    qnom_inm3h_min=Pump.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    qnom_inm3h_max=Pump.P901.qnommax_inm3h,
    use_q_m3hr=true)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                 extent={{-10,10},{
            10,-10}},                                                                          rotation=90,
        origin={-663,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-665,152})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-665,159.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-664.75,167.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(
    L=L_S9_PL3,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pout_start_S9,
    pout_start=pout_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-663,126})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-724.75,147.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-725,137.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(
    L=L_S9_PL2,
    t=t_S9,
    m_flow_start=m_flow_S9,
    pin_start=pin_start_S9,
    pout_start=pin_start_S9,
    Tin_start=Tin_start_S9,
    Tout_start=Tin_start_S9,
    Di=Di_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-723,76})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV901(
    Kv=Valve.FCV901.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-663,86})));
  Modelica.Blocks.Sources.Ramp q_P901(
    height=q_P901_computed*0.5*0,
    duration=100,
    offset=q_P901_computed,
    startTime=400)
    annotation (Placement(transformation(extent={{-624,40},{-645,60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FV933(
    Kv=11.5,
    dp_nom=50000,
    Tin_start=T_start,
    pin_start=pin_start) annotation (Placement(visible=true,
        transformation(
        origin={-124,0},
        extent={{5,5},{-5,-5}},
        rotation=90)));
  Modelica.Blocks.Sources.Ramp FV933_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600) annotation (Placement(transformation(extent={{-93,-10},{-113,
            10}})));

  Modelica.Blocks.Sources.Ramp FCV901_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600)
    annotation (Placement(transformation(extent={{-625,76},{-645,96}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVC02(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_FCVC02,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={760,210})));
  Modelica.Blocks.Sources.Ramp FCVC02_theta(
    height=-0.4,
    duration=0,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{801,200},{781,220}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVC01(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_FCVC01,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={320,210})));
  Modelica.Blocks.Sources.Ramp FCVC01_theta(
    height=0,
    duration=100,
    offset=0,
    startTime=400)
    annotation (Placement(transformation(extent={{359,200},{339,220}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall(
        displayUnit="K") = T_start_cold,n=n)                                                                            annotation (
    Placement(visible = true, transformation(origin={270,268},  extent = {{-10, 10}, {10, -10}}, rotation=180)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT Wall_S9(Twall(
        displayUnit="K") = T_start_cold, n=n) annotation (Placement(visible=true,
        transformation(
        origin={-744,76},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S100_S400(
    L=1,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of gas boiler and the outlet of electric boiler"
    annotation (Placement(transformation(
        extent={{-10.25,10.25},{10.25,-10.25}},
        rotation=180,
        origin={-173.75,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S400_S300(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of the electric boiler and the outlet of heat pump HP301"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-254,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S300_S500(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-334,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S500_SXXX(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-414,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SXXX_SYYY(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-494,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SYYY_S200(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10.25},{10,-10.25}},
        rotation=180,
        origin={-574,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(
    L=4.5,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10.25},{10,-10.25}},
        rotation=180,
        origin={-642,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S400_S100(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S400 and S100 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-243.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S100_FV933(
    L=0.8,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting System 100 with valve cold side"
    annotation (Placement(transformation(
        extent={{10.5,10.25},{-10.5,-10.25}},
        rotation=180,
        origin={-165.5,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S400(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-325.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S300(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-365.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S300(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-423.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S500(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-463.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S200_S500(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S200 and S500 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-563.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(
    L=4,
    h=0,
    t=t,
    m_flow_start=m_flow_start,
    pin_start=pout_start,
    pout_start=pout_start,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S200 and S500 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-633.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={360,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={600,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={720,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12
    "Flow sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{736,182},{744,174}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA20 "Pressure sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{752,182},{760,174}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA19 "Pressure sensor at the outlet of valve FCVC02"
    annotation (Placement(transformation(extent={{748,238},{756,246}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={730,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={630,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_cold(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={390,240})));
equation
  connect(rackL2L3_rackL3L4_cold.outlet, S900_rackL3L4_cold.inlet) annotation (
      Line(
      points={{160,240},{60,240}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_cold.outlet, rackL2L3_rackL3L4_cold.inlet)
    annotation (Line(
      points={{280,240},{180,240}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL2L3_rackL3L4_hot.outlet, rackL3L4_FCVC01_hot.inlet) annotation (
      Line(
      points={{150,180},{250,180}},
      color={140,56,54},
      thickness=0.5));

  connect(S900_rackL3L4_hot.outlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{30,180},{130,180}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.outlet,PT902. inlet) annotation (Line(
      points={{-663,155},{-663,159.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet,TT902. inlet) annotation (Line(
      points={{-663,159.5},{-663,167.25},{-662.85,167.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-663,149},{-663,136}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet,PT901. inlet) annotation (Line(
      points={{-723,86},{-723,137.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet,TT901. inlet) annotation (Line(
      points={{-723,137.5},{-723,142.375},{-722.85,142.375},{-722.85,147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet,PL4_S901. inlet) annotation (Line(
      points={{-663,96},{-663,116}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet,FCV901. inlet) annotation (Line(
      points={{-663,66},{-663,76}},
      color={140,56,54},
      thickness=0.5));
  connect(q_P901.y, P901.in_q_m3hr)
    annotation (Line(points={{-646.05,50},{-658.4,50},{-658.4,54}},
                                                         color={0,0,127}));
  connect(rackCD_Cold_S100_FV933.inlet, rackCD_Cold_S400_S100.outlet)
    annotation (Line(
      points={{-176,-19.75},{-232.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet, PT901.inlet) annotation (Line(
      points={{-764,170},{-764,112},{-723,112},{-723,137.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, S900_rackL3L4_hot.inlet) annotation (Line(
      points={{-662.85,167.25},{-662.85,180},{10,180}},
      color={140,56,54},
      thickness=0.5));
  connect(TT901.inlet, S900_rackL3L4_cold.outlet) annotation (Line(
      points={{-722.85,147.25},{-722.85,240},{40,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933_theta.y, FV933.opening)
    annotation (Line(points={{-114,0},{-120,0}}, color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-646,86},{-655,86}},   color={0,0,127}));
  connect(FCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{320,220},{320,240},{300,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{338,210},{328,
          210}},                     color={0,0,127}));
  connect(FCVC02_theta.y, FCVC02.opening)
    annotation (Line(points={{780,210},{768,210}}, color={0,0,127}));
  connect(Wall_S9.MultiPort, PL2_S901.wall)
    annotation (Line(points={{-744,76},{-727.3,76}}, color={255,238,44}));
  connect(rackCD_Hot_S400_S300.outlet, rackCD_Hot_S300_S500.inlet) annotation (
      Line(
      points={{-264,20},{-324,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S300_S500.outlet, rackCD_Hot_S500_SXXX.inlet) annotation (
      Line(
      points={{-344,20},{-404,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S500_SXXX.outlet, rackCD_Hot_SXXX_SYYY.inlet) annotation (
      Line(
      points={{-424,20},{-484,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SXXX_SYYY.outlet, rackCD_Hot_SYYY_S200.inlet) annotation (
      Line(
      points={{-504,20},{-533.5,20},{-533.5,19.75},{-564,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S100_S400.outlet, rackCD_Hot_S400_S300.inlet) annotation (
      Line(
      points={{-184,19.75},{-214,19.75},{-214,20},{-244,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S100_S400.inlet, FV933.inlet) annotation (Line(
      points={{-163.5,19.75},{-124,19.75},{-124,5}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S100_FV933.outlet, FV933.outlet) annotation (Line(
      points={{-155,-19.75},{-124,-19.75},{-124,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.inlet, rackCD_Cold_S300_S400.outlet)
    annotation (Line(
      points={{-254,-19.75},{-314.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SYYY_S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (
      Line(
      points={{-584,19.75},{-632,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (Line(
      points={{-652,19.75},{-663,19.75},{-663,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, rackCD_Cold_S900_S200.inlet) annotation (Line(
      points={{-723,66},{-723,-19.75},{-644,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S900_S200.outlet, rackCD_Cold_S200_S500.inlet)
    annotation (Line(
      points={{-622.5,-19.75},{-574,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S200_S500.outlet, rackCD_Cold_S500_S500.inlet)
    annotation (Line(
      points={{-552.5,-19.75},{-474,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S500.outlet, rackCD_Cold_S500_S300.inlet)
    annotation (Line(
      points={{-452.5,-19.75},{-434,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S300.outlet, rackCD_Cold_S300_S300.inlet)
    annotation (Line(
      points={{-412.5,-19.75},{-376,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S300_S300.outlet, rackCD_Cold_S300_S400.inlet)
    annotation (Line(
      points={{-354.5,-19.75},{-336,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_hot.outlet, FCVC01_rackL4L5_hot.inlet) annotation (
      Line(
      points={{270,180},{350,180}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_rackL4L5_hot.outlet, rackL4L5_rackL5L6_hot.inlet) annotation (
      Line(
      points={{370,180},{470,180}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01.inlet, FCVC01_rackL4L5_hot.inlet) annotation (Line(
      points={{320,200},{320,180},{350,180}},
      color={140,56,54},
      thickness=0.5));
  connect(wall_FixedT.MultiPort, rackL2L3_rackL3L4_cold.wall) annotation (Line(
        points={{270,268},{270,260},{170,260},{170,244.3}}, color={255,238,44}));
  connect(rackL4L5_rackL5L6_hot.outlet, rackL5L6_rackL6L7_hot.inlet)
    annotation (Line(
      points={{490,180},{590,180}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL5L6_rackL6L7_hot.outlet, rackL6L7_FCVC02_hot.inlet) annotation (
      Line(
      points={{610,180},{710,180}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (Line(
      points={{730,180},{736,180},{736,179.6},{737.6,179.6}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (Line(
      points={{740,240},{760,240},{760,220}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA19.inlet, rackL6L7_FCVC02_cold.inlet) annotation (Line(
      points={{752,240.4},{745,240.4},{745,240},{740,240}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.inlet, rackL5L6_rackL6L7_cold.outlet)
    annotation (Line(
      points={{520,240},{620,240}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL5L6_rackL6L7_cold.inlet, rackL6L7_FCVC02_cold.outlet)
    annotation (Line(
      points={{640,240},{720,240}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.outlet, FCVC01_rackL4L5_cold.inlet)
    annotation (Line(
      points={{500,240},{400,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_rackL4L5_cold.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
      Line(
      points={{380,240},{300,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FTA12.outlet, FCVC02.inlet) annotation (Line(
      points={{742.4,179.6},{760,179.6},{760,200}},
      color={140,56,54},
      thickness=0.5));
  connect(FTA12.outlet, PTA20.inlet) annotation (Line(
      points={{742.4,179.6},{756,179.6}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-800,-300},{800,300}}), graphics={
        Text(
          extent={{50,192},{110,154}},
          textColor={28,108,200},
          textString="RackL2L3_hot"),
        Text(
          extent={{78,268},{138,228}},
          textColor={28,108,200},
          textString="RackL2L3_cold"),
        Text(
          extent={{-496,80},{-366,42}},
          textColor={28,108,200},
          textString="Rack C/D"),
        Text(
          extent={{170,192},{230,154}},
          textColor={28,108,200},
          textString="RackL3L4_hot"),
        Text(
          extent={{390,192},{450,154}},
          textColor={28,108,200},
          textString="RackL4L5_hot"),
        Text(
          extent={{512,192},{572,154}},
          textColor={28,108,200},
          textString="RackL5L6_hot"),
        Text(
          extent={{628,192},{688,154}},
          textColor={28,108,200},
          textString="RackL6L7_hot")}),                                    Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end BaseHeatingSystem;
