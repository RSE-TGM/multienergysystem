within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerCompleteSystem
  "Case in which the gas boiler is the only source of heat"

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter Integer gammahotovercold_factor = 1;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;

  parameter Types.Pressure pin_start_S1 = 1.85e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter Types.Length L_S1 = 10;
  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;
  parameter Types.Length L_S9 = 10;
  parameter Types.Length Di_S9 = 51e-3;
  parameter Types.Length t_S9 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_total = 1.6;

  parameter Types.MassFlowRate m_flow_start_cooling = 2;
  parameter Types.Pressure pin_start_CoolingValve = 3.6e5;
  parameter Types.Pressure pin_start_CoolingPipes = 5e5;
  parameter Types.Temperature Tin_start_CoolingPipes = 28+273.15;

  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;
  parameter Types.Length L_Users = 10;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;


  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;

  parameter Types.Temperature T_start_hot_Source = 80 + 273.15;
  parameter Types.Temperature T_start_cold_Source = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;

  parameter Types.Temperature T_start_cold_Users = 7 + 273.15;
  parameter Types.Temperature T_start_hot_Users = 15.6 + 273.15;
  parameter Types.MassFlowRate m_flow_Users_total = 5.553528;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;

  parameter Types.Power Pchiller = -200251.2;
  parameter Real Kv_UsersValve(unit = "m3/h") = 2.5 "Metri Flow Coefficient ";
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 0.5e5;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={438,208},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    P101(
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start=(80 + 273.15) + 273.15,                                       a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_total,                                                                                 dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,                                                                                                                                                                                                        qnom_inm3h = 15.60340167, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-220,-21})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV101(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.1e5,
    Tin_start(displayUnit="K") = 80 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV(
    L=L_S1,
    t=t_S1,       m_flow_start=m_flow_total,
    pin_start=BPHE.E301.pin_start_cold,
    pout_start=BPHE.E301.pin_start_cold - 0.01e5,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1)     annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV1(
    L=L_S1,
    t=t_S1,        m_flow_start=m_flow_total,
    pin_start=20000000000,
    pout_start=19000000000,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-240,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV3(
    L=L_S1,
    t=t_S1,        m_flow_start=m_flow_total,
    pin_start=30000000000,
    pout_start=29000000000,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV4(
    L=L_S9,
    t=t_S9,        m_flow_start=m_flow_total,
    pin_start=29000000000,
    pout_start=28000000000,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-200,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P901(
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start(displayUnit="K") = 80 + 273.15,
    a=Pump.P901.a,
    b=Pump.P901.b,
    m_flow_start=m_flow_total,
    dpnom(displayUnit="Pa") = Pump.P901.dpnom,
    etaelec=Pump.P901.etaelec,
    etamech=Pump.P901.etamech,
    etanom=Pump.P901.etanom,
    hin_start=Pump.P901.hin_start,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    pin_start(displayUnit="Pa") = 1.73e5,
    pout_start(displayUnit="Pa") = 2.569662e5,
    qnom_inm3h=19,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    headmax=27,
    headmin=11,
    qnom_inm3h_min=10,
    use_in_omega=true)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=0,
        origin={-169,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV901(
    allowFlowReversal=true,
    nomOpening=1,
    Kv=Kv_FCV901,
    dp_nom(displayUnit="Pa") = 5000,
    Tin_start(displayUnit="K") = 80 + 273.15,
    pin_start(displayUnit="Pa") = 2.5e5)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-140,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5(
    L=L_S9,
    t=t_S9,        m_flow_start=m_flow_total,
    pin_start=pin_start_Users + 0.01e5,
    pout_start=pin_start_Users,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-110,90})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{-180,0},{-200,20}})));
  Modelica.Blocks.Sources.RealExpression FCV901_theta(y=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-140,60})));
  Modelica.Blocks.Sources.RealExpression P101_m_flow(y=m_flow_total)
    annotation (Placement(transformation(extent={{-180,-36},{-200,-16}})));
  Modelica.Blocks.Sources.RealExpression P901_omega(y=0.6*Pump.P901.omeganom)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-174,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.GasBoiler
    GB101(
    Tin_start=333.15,
    pin_start=180000,
    pout_start=179000) annotation (Placement(visible=true, transformation(
        origin={-230,-95},
        extent={{-25,-25},{25,25}},
        rotation=-90)));
  Sources.SourceMassFlow CH4(
    T0=333.15,
    m_flow0=0.002370206,
    p0(displayUnit="Pa") = 2000,
    use_in_m_flow=true)                                                                                                    annotation (
    Placement(visible = true, transformation(origin={-186,-95},  extent={{10,10},
            {-10,-10}},                                                                           rotation = 0)));
  Modelica.Blocks.Sources.Ramp fuel_flow(
    duration=20,
    height=0.002370206*0.2*0,
    offset=0.0037212234*0.7,
    startTime=50)                                                                                                       annotation (
    Placement(visible = true, transformation(origin={-180,-130}, extent={{10,-10},
            {-10,10}},                                                                            rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    closedLoopInitializer(
    p_start(displayUnit="Pa") = 2.333038e5,
    T_start(displayUnit="K") = 80.32302 + 273.15,
    m_flow_start=m_flow_total) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-80,90})));
  Sources.SinkPressure sinkCold_HX(
    p0(displayUnit="Pa") = 2e5,
    T0=(36.7 + 273.15) + 273.15,
    R=1e-3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={375,-127})));
  Sources.SourcePressure sourceColdP_HX(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 28 + 273.15,
    h0=BPHE.E701.hin_start_cold,
    R=1e-3) annotation (Placement(transformation(extent={{385,-112},{365,-92}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={7,31})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-14,-7.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={66,-6.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={146,-6.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={226,-7.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={87,31})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={167,31})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=true,
    Kv=2.04,
    dp_nom(displayUnit="Pa") = 50000,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={247,31})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{336,41},{316,61}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-33,71})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_HotIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-13,91})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={7,111})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={47,71})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={87,111})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_HotIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={67,91})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL700_HotSide_ColdOut(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_Source_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-53,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_HotSide_ColdOut_PL701(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={27,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={127,71})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={167,111})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_ColdOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={107,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_HotSide_HotIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={147,91})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_HotIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Source,
    Tout_start=T_start_hot_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={207,71})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_ColdOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={247,111})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_HotSide_ColdOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Source,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=T_start_cold_Source,
    Tout_start=T_start_cold_Source,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={187,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-33,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={47,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={127,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={207,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={7,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={87,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot_Users,
    Tout_start=T_start_hot_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={167,-139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={7,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={87,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={167,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={247,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={27,-79})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={107,-79})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold_Users,
    Tout_start=T_start_cold_Users,
    Di=Di_Users) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={187,-79})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=m_flow_Users_total)
    annotation (Placement(transformation(extent={{316,0},{296,20}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    coolingInit(
    p_start(displayUnit="Pa") = 2e5,
    T_start(displayUnit="K") = 15.7 + 273.15,
    m_flow_start=5.553528)
    annotation (Placement(transformation(extent={{222,-149},{242,-129}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    PR01(
    Tin_start(displayUnit="K") = 15 + 273.15,
    Tout_start(displayUnit="K") = 16 + 273.15,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    m_flow_start=8.977481,
    dpnom=Pump.PR01.dpnom,
    etaelec=Pump.PR01.etaelec,
    etamech=Pump.PR01.etamech,
    etanom=Pump.PR01.etanom,
    hin_start=Pump.PR01.hin_start,
    m_flow_nom=Pump.PR01.m_flow_nom,
    omeganom=Pump.PR01.omeganom,
    pin_start(displayUnit="Pa") = 2e5,
    pout_start(displayUnit="Pa") = 2.6e5,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom)
                     annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={297,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
    Kv=Valve.TCV701.Kv,
    dp_nom=Valve.TCV701.dp_nom,
    rho_nom=Valve.TCV701.rho_nom,
    Tin_start=Valve.TCV701.Tin_start,
    pin_start=Valve.TCV701.pin_start)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-33,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
    Kv=Valve.TCV711.Kv,
    dp_nom=Valve.TCV711.dp_nom,
    rho_nom=Valve.TCV711.rho_nom,
    Tin_start=Valve.TCV711.Tin_start,
    pin_start=Valve.TCV711.pin_start)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={47,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
    Kv=Valve.TCV721.Kv,
    dp_nom=Valve.TCV721.dp_nom,
    rho_nom=Valve.TCV721.rho_nom,
    Tin_start=Valve.TCV721.Tin_start,
    pin_start=Valve.TCV721.pin_start)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={127,-49})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
    Kv=Valve.TCV731.Kv,
    dp_nom=Valve.TCV731.dp_nom,
    rho_nom=Valve.TCV731.rho_nom,
    Tin_start=Valve.TCV731.Tin_start,
    pin_start=Valve.TCV731.pin_start)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={207,-49})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers1(y=1)
    annotation (Placement(transformation(extent={{-83,-59},{-63,-39}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer
    powerTransfer
    annotation (Placement(transformation(extent={{327,-29},{307,-9}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer4(y=Pchiller) annotation (Placement(transformation(extent={{284,-14},
            {300,2}})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers2(y=0.87)
    annotation (Placement(transformation(extent={{-83,-74},{-63,-54}})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers3(y=0.6)
    annotation (Placement(transformation(extent={{-83,-88},{-63,-68}})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers4(y=0.42)
    annotation (Placement(transformation(extent={{-83,-103},{-63,-83}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCVR01(
    Kv=9.5339,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = 7 + 273.15,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={317,-79})));
  Modelica.Blocks.Sources.RealExpression Ptransfer1(y=if time < 800 then 0
         else 0.5)                                              annotation (Placement(transformation(extent={{290,
            -107},{306,-91}})));
equation
  connect(P101.inlet, roundPipe1DFV.outlet) annotation (Line(
      points={{-220,-30.6},{-220,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet, P101.outlet) annotation (Line(
      points={{-220,0},{-220,-11.4}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.outlet, roundPipe1DFV4.inlet) annotation (Line(
      points={{-220,80},{-220,90},{-210,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV4.outlet, P901.inlet) annotation (Line(
      points={{-190,90},{-178.6,90}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet, FCV901.inlet) annotation (Line(
      points={{-159.4,90},{-150,90}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet, roundPipe1DFV5.inlet) annotation (Line(
      points={{-130,90},{-120,90}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-201,10},{-212,10}}, color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-140,71},{-140,82}}, color={0,0,127}));
  connect(P901.in_omega, P901_omega.y) annotation (Line(points={{-173.8,84},{
          -173.8,77.5},{-174,77.5},{-174,71}}, color={0,0,127}));

  connect(roundPipe1DFV3.inlet, FCV101.outlet) annotation (Line(
      points={{-220,60},{-220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet, closedLoopInitializer.inlet) annotation (Line(
      points={{-100,90},{-95,90},{-95,89.8},{-90,89.8}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet, GB101.inlet) annotation (Line(
      points={{-240,-60},{-240,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV.inlet, GB101.outlet) annotation (Line(
      points={{-220,-60},{-220,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(CH4.outlet, GB101.inletfuel) annotation (Line(
      points={{-196,-95},{-210,-95}},
      color={140,56,54},
      thickness=0.5));
  connect(CH4.in_m_flow, fuel_flow.y)
    annotation (Line(points={{-180,-100},{-180,-119}}, color={0,0,127}));
  connect(FCV701.inlet,EX701. outhot) annotation (Line(
      points={{7,21},{7,1.25},{6.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,EX711. outhot) annotation (Line(
      points={{87,21},{87,12.625},{86.3,12.625},{86.3,2.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,EX721. outhot) annotation (Line(
      points={{167,21},{167,12.125},{166.3,12.125},{166.3,2.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,EX731. outhot) annotation (Line(
      points={{247,21},{247,12.125},{246.3,12.125},{246.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers.y,FCV731. opening)
    annotation (Line(points={{315,51},{267,51},{267,31},{255,31}},
                                                 color={0,0,127}));
  connect(FCV721.opening,FCV731. opening) annotation (Line(points={{175,31},{187,
          31},{187,51},{267,51},{267,31},{255,31}}, color={0,0,127}));
  connect(FCV711.opening,FCV731. opening) annotation (Line(points={{95,31},{107,
          31},{107,51},{267,51},{267,31},{255,31}},
                                               color={0,0,127}));
  connect(FCV701.opening,FCV731. opening) annotation (Line(points={{15,31},{27,31},
          {27,51},{267,51},{267,31},{255,31}},color={0,0,127}));
  connect(PL701_HotSide_ColdOut.outlet,PL700_HotSide_ColdOut. inlet)
    annotation (Line(
      points={{7,121},{7,131},{-43,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut_PL701.outlet,PL700_HotSide_ColdOut. inlet)
    annotation (Line(
      points={{17,131},{-43,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut.outlet,PL711_HotSide_ColdOut_PL701. inlet)
    annotation (Line(
      points={{87,121},{87,131},{37,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut_PL711.outlet,PL711_HotSide_ColdOut_PL701. inlet)
    annotation (Line(
      points={{97,131},{37,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut_PL721.outlet,PL721_HotSide_ColdOut_PL711. inlet)
    annotation (Line(
      points={{177,131},{117,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut.outlet,PL721_HotSide_ColdOut_PL711. inlet)
    annotation (Line(
      points={{167,121},{167,131},{117,131}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut_PL721.inlet,PL731_HotSide_ColdOut. outlet)
    annotation (Line(
      points={{197,131},{247,131},{247,121}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn.outlet,EX701. inhot) annotation (Line(
      points={{-33,61},{-33,-20.875},{-34.3,-20.875},{-34.3,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn.outlet,EX711. inhot) annotation (Line(
      points={{47,61},{47,2.25},{45.7,2.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn.outlet,EX721. inhot) annotation (Line(
      points={{127,61},{127,2.25},{125.7,2.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_HotIn.outlet,EX731. inhot) annotation (Line(
      points={{207,61},{207,1.25},{205.7,1.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn.inlet,PL701_HotSide_HotIn_PL711. inlet)
    annotation (Line(
      points={{-33,81},{-33,91},{-23,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_HotIn_PL711.outlet,PL711_HotSide_HotIn_PL721. inlet)
    annotation (Line(
      points={{-3,91},{57,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn.inlet,PL711_HotSide_HotIn_PL721. inlet)
    annotation (Line(
      points={{47,81},{47,91},{57,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_HotIn_PL721.outlet,PL721_HotSide_HotIn_PL731. inlet)
    annotation (Line(
      points={{77,91},{137,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn.inlet,PL721_HotSide_HotIn_PL731. inlet)
    annotation (Line(
      points={{127,81},{127,91},{137,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_HotIn_PL731.outlet,PL731_HotSide_HotIn. inlet)
    annotation (Line(
      points={{157,91},{207,91},{207,81}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_HotSide_ColdOut.inlet,FCV701. outlet) annotation (Line(
      points={{7,101},{7,41}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_HotSide_ColdOut.inlet,FCV711. outlet) annotation (Line(
      points={{87,101},{87,41}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_HotSide_ColdOut.inlet,FCV721. outlet) annotation (Line(
      points={{167,101},{167,41}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_HotSide_ColdOut.inlet,FCV731. outlet) annotation (Line(
      points={{247,101},{247,41}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut.outlet,PL701_ColdSide_HotOut_PL711. inlet)
    annotation (Line(
      points={{-33,-119},{-33,-139},{-3,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet,PL711_ColdSide_HotOut. outlet)
    annotation (Line(
      points={{17,-139},{47,-139},{47,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet,PL711_ColdSide_HotOut. outlet)
    annotation (Line(
      points={{77,-139},{47,-139},{47,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet,PL711_ColdSide_HotOut_PL721. outlet)
    annotation (Line(
      points={{127,-119},{127,-139},{97,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet,PL711_ColdSide_HotOut_PL721. outlet)
    annotation (Line(
      points={{157,-139},{97,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet,PL731_ColdSide_HotOut. outlet)
    annotation (Line(
      points={{177,-139},{207,-139},{207,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold,PL701_ColdSide_ColdIn. outlet) annotation (Line(
      points={{6.3,-16.25},{6.3,-16},{7,-16},{7,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold,PL711_ColdSide_ColdIn. outlet) annotation (Line(
      points={{86.3,-15.25},{86.3,-27.125},{87,-27.125},{87,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,PL721_ColdSide_ColdIn. outlet) annotation (Line(
      points={{166.3,-15.25},{166.3,-27.125},{167,-27.125},{167,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,PL731_ColdSide_ColdIn. outlet) annotation (Line(
      points={{246.3,-16.25},{246.3,-27.625},{247,-27.625},{247,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet,PL701_ColdSide_ColdIn. inlet)
    annotation (Line(
      points={{17,-79},{7,-79},{7,-59}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet,PL701_ColdSide_ColdIn_PL711. inlet)
    annotation (Line(
      points={{87,-59},{87,-79},{37,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet,PL701_ColdSide_ColdIn_PL711. inlet)
    annotation (Line(
      points={{97,-79},{37,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet,PL711_ColdSide_ColdIn_PL721. inlet)
    annotation (Line(
      points={{167,-59},{167,-79},{117,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet,PL711_ColdSide_ColdIn_PL721. inlet)
    annotation (Line(
      points={{177,-79},{117,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet,PL721_ColdSide_ColdIn_PL731. inlet)
    annotation (Line(
      points={{247,-59},{247,-79},{197,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet,coolingInit. inlet) annotation (
      Line(
      points={{177,-139},{215,-139},{215,-139.2},{222,-139.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,PL721_ColdSide_ColdIn_PL731. inlet) annotation (Line(
      points={{297,-59.4},{297,-79},{197,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TCV701. inlet) annotation (Line(
      points={{-34.3,-16.25},{-33,-16.25},{-33,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL701_ColdSide_HotOut. inlet) annotation (Line(
      points={{-33,-59},{-33,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TCV711. inlet) annotation (Line(
      points={{45.7,-15.25},{47,-15.25},{47,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL711_ColdSide_HotOut. inlet) annotation (Line(
      points={{47,-59},{47,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TCV721. inlet) annotation (Line(
      points={{125.7,-15.25},{127,-15.25},{127,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL721_ColdSide_HotOut. inlet) annotation (Line(
      points={{127,-59},{127,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TCV731. inlet) annotation (Line(
      points={{205.7,-16.25},{205.7,-25},{207,-25},{207,-39}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL731_ColdSide_HotOut. inlet) annotation (Line(
      points={{207,-59},{207,-99}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers1.y,TCV701. opening)
    annotation (Line(points={{-62,-49},{-41,-49}},   color={0,0,127}));
  connect(powerTransfer.outlet,PR01. inlet) annotation (Line(
      points={{307,-19},{297,-19},{297,-38.6}},
      color={140,56,54},
      thickness=0.5));
  connect(coolingInit.outlet,powerTransfer. inlet) annotation (Line(
      points={{242,-139},{337,-139},{337,-19},{327,-19}},
      color={140,56,54},
      thickness=0.5));
  connect(Ptransfer4.y,powerTransfer. Ptransfer)
    annotation (Line(points={{300.8,-6},{317,-6},{317,-11}}, color={0,0,127}));
  connect(FCV_thetaconsumers2.y,TCV711. opening) annotation (Line(points={{-62,-64},
          {28,-64},{28,-49},{39,-49}},         color={0,0,127}));
  connect(FCV_thetaconsumers3.y,TCV721. opening) annotation (Line(points={{-62,-78},
          {-49,-78},{-49,-35},{107,-35},{107,-49},{119,-49}},   color={0,0,127}));
  connect(FCV_thetaconsumers4.y,TCV731. opening) annotation (Line(points={{-62,-93},
          {-53,-93},{-53,-33},{193,-33},{193,-49},{199,-49}},     color={0,0,
          127}));
  connect(FCVR01.inlet,PL721_ColdSide_ColdIn_PL731. inlet) annotation (Line(
      points={{307,-79},{197,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,powerTransfer. inlet) annotation (Line(
      points={{327,-79},{337,-79},{337,-19},{327,-19}},
      color={140,56,54},
      thickness=0.5));
  connect(Ptransfer1.y,FCVR01. opening) annotation (Line(points={{306.8,-99},{312,
          -99},{312,-100},{317,-100},{317,-87}},      color={0,0,127}));
  connect(closedLoopInitializer.outlet, PL701_HotSide_HotIn_PL711.inlet)
    annotation (Line(
      points={{-70,90},{-63,90},{-63,91},{-23,91}},
      color={140,56,54},
      thickness=0.5));
  connect(PL700_HotSide_ColdOut.outlet, roundPipe1DFV1.inlet) annotation (Line(
      points={{-63,131},{-240,131},{-240,-40}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-400,-200},{400,200}}, grid={1,1})), Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerCompleteSystem;
