within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model BaseHeatingSystem
  "Case in which there isn't any source of heat"
  extends Modelica.Icons.Example;

  //General parameters of pipes
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Types.Temperature T_start_cold = T_start;
  parameter Types.Temperature T_start_hot = T_start;
  parameter Types.Temperature T_start = 15 + 273.15;

  parameter Types.MassFlowRate m_flow_total = 2.5;


  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
//   parameter Types.Length L_Users = 2;
//   parameter Types.Length Di_Users = 32e-3;
//   parameter Types.Length t_Users = 1.5e-3;

  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 50000;

  // Rack CD
  parameter Types.Length t_rCD = 2e-3;
  parameter Types.Length Di_rCD = 72e-3;
  parameter Types.Pressure pin_start_rCD = 1.69e5;
  parameter Types.Pressure pout_start_rCD = 1.60e5;
  parameter Types.Pressure pin_start_rCD_cold = 1.69e5;
  parameter Types.Pressure pout_start_rCD_cold = 1.60e5;

    // Cold Side Rack CD
  parameter Types.Length L_rCD_C1 = 12 "To be define";
  parameter Types.Length L_rCD_C2 = 2.85;
  parameter Types.Length L_rCD_C3 = 0.84;
  parameter Types.Length L_rCD_C4 = 0.84;
  parameter Types.Length L_rCD_C5 = 0.65;
  parameter Types.Length L_rCD_C6 = 1.5;
  parameter Types.Length L_rCD_C7 = 1.2;
  parameter Types.Length L_rCD_C8 = 1.0;

    // Hot Side Rack CD
  parameter Types.Length L_rCD_H1 = 1;
  parameter Types.Length L_rCD_H2 = 0.6;
  parameter Types.Length L_rCD_H3 = 2;
  parameter Types.Length L_rCD_H4 = 1.37;
  parameter Types.Length L_rCD_H5 = 1.4;
  parameter Types.Length L_rCD_H6 = 1.25;
  parameter Types.Length L_rCD_H7 = 15;

    // Cold Side L2-L3-L4-L5-L6-L7
  parameter Types.Length L_rL2L3_rL3L4_C = 4.5;
  parameter Types.Length L_rL3L4_FCVC01_C = 3;
  parameter Types.Length L_FCVC01_rL4L5_C = 1.5;
  parameter Types.Length L_rL4L5_rL5L6_C = 3;
  parameter Types.Length L_rL5L6_rL6L7_C = 3;
  parameter Types.Length L_rL6L7_FCVC02_C = 1.8;
  parameter Types.Length t_rL_C = 1.5e-3;
  parameter Types.Length Di_rL_C = 51e-3;

    // Hot side Rack L2-L3-L4-L5-L6-L7
  parameter Types.Length L_rL2L3_rL3L4_H = 4.5;
  parameter Types.Length L_rL3L4_FCVC01_H = 3;
  parameter Types.Length L_FCVC01_rL4L5_H = 1.5;
  parameter Types.Length L_rL4L5_rL5L6_H = 3;
  parameter Types.Length L_rL5L6_rL6L7_H = 3;
  parameter Types.Length L_rL6L7_FCVC02_H = 1.8;
  parameter Types.Length t_rL_H = 1.5e-3;
  parameter Types.Length Di_rL_H = 51e-3;


  //rackCD_Cold_S100_FV933
  //rackCD_Cold_S400_S100
  //rackCD_Cold_S300_S400
  //rackCD_Cold_S300_S300
  //rackCD_Cold_S500_S300
  //rackCD_Cold_S500_S500
  //rackCD_Cold_S200_S500
  //rackCD_Cold_S900_S200

  parameter Types.Length t = 1.5e-3;
  parameter Types.Length Di = 51e-3;
  parameter Types.Length L_v = 1;
  parameter Types.Length L_RL2L3 = 4.53;
  parameter Types.Length L_RL3L4 = 3.02;
  parameter Types.Length L_RL4L5 = 2.5;
  parameter Types.Length L_RL5L6 = 2.5;
  parameter Types.Length L_RL6L7 = 3;


  parameter Types.MassFlowRate m_flow_start = 4.04;

  parameter Types.Pressure pin_start = 1.69e5;
  parameter Types.Pressure pout_start = 3e5;



  // System S900

  parameter Types.Pressure pin_start_S9 = 2.3e5;
  parameter Types.Pressure pout_start_S9 = 3.2e5;
  parameter Types.Temperature Tin_start_S9 = 80 + 273.15;
  parameter Types.Temperature Tout_start_S9 = 80 + 273.15;

  parameter Types.Length L_S9 = 10;
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
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;
  parameter Types.MassFlowRate m_flow_Users_total = 5.553528*3600/1000;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;
  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;



  // Valves Nominal Data
  parameter Real Kv_FCVC01(unit = "m3/h") = 30.55/2;
  parameter Real Kv_FCVC02(unit = "m3/h") = 30.55;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={788,290},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Sources.SourcePressure VE901(p0=164000, T0(displayUnit="K") = 30 + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-760,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(
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
    use_in_omega=true)                              annotation (
    Placement(visible = true, transformation(                 extent={{-10,10},{
            10,-10}},                                                                          rotation=90,
        origin={-659,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901(T_start=
        Tout_start_S9, p_start=pout_start_S9)
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-661,152})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-661,159.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-660.75,167.25})));
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
        origin={-659,126})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-720.75,147.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-721,137.5})));
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
        origin={-719,76})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV901(
    Kv=Valve.FCV901.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV901.dp_nom,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-659,86})));
  Modelica.Blocks.Sources.Ramp q_P901(
    height=q_P901_computed*0.5*0,
    duration=100,
    offset=q_P901_computed,
    startTime=400)
    annotation (Placement(transformation(extent={{-580,40},{-601,60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FV933(
    Kv=15,
    dp_nom=50000,
    Tin_start=T_start,
    pin_start=pin_start) annotation (Placement(visible=true,
        transformation(
        origin={-120,0},
        extent={{5,5},{-5,-5}},
        rotation=90)));
  Modelica.Blocks.Sources.Ramp FV933_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600) annotation (Placement(transformation(extent={{-89,-10},{-109,
            10}})));

  Modelica.Blocks.Sources.Ramp FCV901_theta(
    height=0,
    duration=100,
    offset=1,
    startTime=600)
    annotation (Placement(transformation(extent={{-621,76},{-641,96}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
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
    height=-0.4*0,
    duration=0,
    offset=1,
    startTime=200)
    annotation (Placement(transformation(extent={{799,200},{779,220}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
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
        displayUnit="K") = T_start,n=n)                                                                            annotation (
    Placement(visible = true, transformation(origin={170,269},  extent = {{-10, 10}, {10, -10}}, rotation=180)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT Wall_S9(Twall(
        displayUnit="K") = T_start, n=n) annotation (Placement(visible=true,
        transformation(
        origin={-740,76},
        extent={{-10,10},{10,-10}},
        rotation=270)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S100_S400(
    L=L_rCD_H1,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of gas boiler and the outlet of electric boiler"
    annotation (Placement(transformation(
        extent={{-10.25,10.25},{10.25,-10.25}},
        rotation=180,
        origin={-169.75,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S400_S300(
    L=L_rCD_H2,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of the electric boiler and the outlet of heat pump HP301"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-250,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S300_S500(
    L=L_rCD_H3,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-330,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S500_SXXX(
    L=L_rCD_H4,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-412,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SXXX_SYYY(
    L=L_rCD_H5,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-490,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SYYY_S200(
    L=L_rCD_H6,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10.25},{10,-10.25}},
        rotation=180,
        origin={-570,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(
    L=L_rCD_H7,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10.25},{10,-10.25}},
        rotation=180,
        origin={-639,19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S400_S100(
    L=L_rCD_C7,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S400 and S100 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-239.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S100_FV933(
    L=L_rCD_C8,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting System 100 with valve cold side"
    annotation (Placement(transformation(
        extent={{10.5,10.25},{-10.5,-10.25}},
        rotation=180,
        origin={-159.5,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S400(
    L=L_rCD_C6,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-321.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S300(
    L=L_rCD_C5,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-361.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S300(
    L=L_rCD_C4,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-419.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S500(
    L=L_rCD_C3,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S300 and S400 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-459.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S200_S500(
    L=L_rCD_C2,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S200 and S500 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-559.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(
    L=L_rCD_C1,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    pout_start=pout_start_rCD_cold,
    Tin_start=T_start,
    Tout_start=T_start,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S200 and S500 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-629.25,-19.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(
    L=L_S9,
    t=t_S9,
    m_flow_start=m_flow_total,
    pin_start=pin_start_Users + 0.01e5,
    pout_start=pin_start_Users,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={20,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_hot(
    L=L_rL2L3_rL3L4_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={140,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(
    L=L_rL3L4_FCVC01_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={260,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_hot(
    L=L_FCVC01_rL4L5_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={360,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(
    L=L_rL4L5_rL5L6_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={480,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_hot(
    L=L_rL5L6_rL6L7_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={600,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(
    L=L_rL6L7_FCVC02_H,
    t=t_rL_H,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={720,180})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(
    L=L_S9,
    t=t_S9,
    m_flow_start=m_flow_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_cold(
    L=L_rL2L3_rL3L4_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(
    L=L_rL3L4_FCVC01_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={290,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_cold(
    L=L_FCVC01_rL4L5_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={390,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(
    L=L_rL4L5_rL5L6_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={510,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_cold(
    L=L_rL5L6_rL6L7_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={630,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(
    L=L_rL6L7_FCVC02_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={730,240})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12
    "Flow sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{736,182},{744,174}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA20 "Pressure sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{752,182},{760,174}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA19 "Pressure sensor at the outlet of valve FCVC02"
    annotation (Placement(transformation(extent={{748,238},{756,246}})));



  Modelica.Blocks.Sources.Ramp omega_P901(
    height=-2*3.141592654*6.5,
    duration=100,
    offset=2*3.141592654*40,
    startTime=200)
    annotation (Placement(transformation(extent={{-620,44},{-641,64}})));
equation
  connect(rackL2L3_rackL3L4_cold.outlet,S900_rackL2L3_cold. inlet) annotation (
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
      points={{-659,155},{-659,159.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet,TT902. inlet) annotation (Line(
      points={{-659,159.5},{-659,167.25},{-658.85,167.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-659,149},{-659,136}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet,PT901. inlet) annotation (Line(
      points={{-719,86},{-719,137.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet,TT901. inlet) annotation (Line(
      points={{-719,137.5},{-719,142.375},{-718.85,142.375},{-718.85,147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet,PL4_S901. inlet) annotation (Line(
      points={{-659,96},{-659,116}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet,FCV901. inlet) annotation (Line(
      points={{-659,66},{-659,76}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S100_FV933.inlet, rackCD_Cold_S400_S100.outlet)
    annotation (Line(
      points={{-170,-19.75},{-228.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet, PT901.inlet) annotation (Line(
      points={{-760,170},{-760,112},{-719,112},{-719,137.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, S900_rackL3L4_hot.inlet) annotation (Line(
      points={{-658.85,167.25},{-658.85,180},{10,180}},
      color={140,56,54},
      thickness=0.5));
  connect(TT901.inlet,S900_rackL2L3_cold. outlet) annotation (Line(
      points={{-718.85,147.25},{-718.85,240},{40,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933_theta.y, FV933.opening)
    annotation (Line(points={{-110,0},{-116,0}}, color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-642,86},{-651,86}},   color={0,0,127}));
  connect(FCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{320,220},{320,240},{300,240}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{338,210},{328,
          210}},                     color={0,0,127}));
  connect(FCVC02_theta.y, FCVC02.opening)
    annotation (Line(points={{778,210},{768,210}}, color={0,0,127}));
  connect(Wall_S9.MultiPort, PL2_S901.wall)
    annotation (Line(points={{-740,76},{-723.3,76}}, color={255,238,44}));
  connect(rackCD_Hot_S400_S300.outlet, rackCD_Hot_S300_S500.inlet) annotation (
      Line(
      points={{-260,20},{-320,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S300_S500.outlet, rackCD_Hot_S500_SXXX.inlet) annotation (
      Line(
      points={{-340,20},{-402,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S500_SXXX.outlet, rackCD_Hot_SXXX_SYYY.inlet) annotation (
      Line(
      points={{-422,20},{-480,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SXXX_SYYY.outlet, rackCD_Hot_SYYY_S200.inlet) annotation (
      Line(
      points={{-500,20},{-529.5,20},{-529.5,19.75},{-560,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S100_S400.outlet, rackCD_Hot_S400_S300.inlet) annotation (
      Line(
      points={{-180,19.75},{-210,19.75},{-210,20},{-240,20}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S100_S400.inlet, FV933.inlet) annotation (Line(
      points={{-159.5,19.75},{-120,19.75},{-120,5}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S100_FV933.outlet, FV933.outlet) annotation (Line(
      points={{-149,-19.75},{-120,-19.75},{-120,-5}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.inlet, rackCD_Cold_S300_S400.outlet)
    annotation (Line(
      points={{-250,-19.75},{-310.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SYYY_S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (
      Line(
      points={{-580,19.75},{-629,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (Line(
      points={{-649,19.75},{-659,19.75},{-659,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, rackCD_Cold_S900_S200.inlet) annotation (Line(
      points={{-719,66},{-719,-19.75},{-640,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S900_S200.outlet, rackCD_Cold_S200_S500.inlet)
    annotation (Line(
      points={{-618.5,-19.75},{-570,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S200_S500.outlet, rackCD_Cold_S500_S500.inlet)
    annotation (Line(
      points={{-548.5,-19.75},{-470,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S500.outlet, rackCD_Cold_S500_S300.inlet)
    annotation (Line(
      points={{-448.5,-19.75},{-430,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S300.outlet, rackCD_Cold_S300_S300.inlet)
    annotation (Line(
      points={{-408.5,-19.75},{-372,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S300_S300.outlet, rackCD_Cold_S300_S400.inlet)
    annotation (Line(
      points={{-350.5,-19.75},{-332,-19.75}},
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
  connect(omega_P901.y, P901.in_omega)
    annotation (Line(points={{-642.05,54},{-654,54}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-800,-320},{800,320}}, grid={1,1}),
                                                              graphics={
        Text(
          extent={{50,192},{110,154}},
          textColor={28,108,200},
          textString="RackL2L3_hot"),
        Text(
          extent={{80,266},{140,226}},
          textColor={28,108,200},
          textString="RackL2L3_cold"),
        Text(
          extent={{-492,80},{-362,42}},
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
          textString="RackL6L7_hot"),
        Text(
          extent={{200,266},{260,226}},
          textColor={28,108,200},
          textString="RackL3L4_cold"),
        Text(
          extent={{420,266},{480,226}},
          textColor={28,108,200},
          textString="RackL4L5_cold"),
        Text(
          extent={{540,266},{600,226}},
          textColor={28,108,200},
          textString="RackL5L6_cold"),
        Text(
          extent={{652,266},{712,226}},
          textColor={28,108,200},
          textString="RackL6L7_cold")}),                                   Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end BaseHeatingSystem;
