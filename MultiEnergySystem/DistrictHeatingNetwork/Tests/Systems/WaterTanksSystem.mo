within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model WaterTanksSystem "System of two tanks"

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

  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Types.Length L_Users = 10;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Real Kv_UsersValve(unit = "m3/h") = 2.5 "Metri Flow Coefficient ";
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 0.5e5;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    P101(
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start=(80 + 273.15) + 273.15,
    a=Pump.P101.a,
    b=Pump.P101.b,
    m_flow_start=m_flow_total,
    dpnom=Pump.P101.dpnom,
    etaelec=Pump.P101.etaelec,
    etamech=Pump.P101.etamech,
    etanom=Pump.P101.etanom,
    hin_start=Pump.P101.hin_start,
    m_flow_nom=Pump.P101.m_flow_nom,
    omeganom=Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=15.60340167,
    rhonom(displayUnit="kg/m3") = Pump.P101.rhonom)
                     annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-124,-39})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV101(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.1e5,
    Tin_start(displayUnit="K") = 80 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-124,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=BPHE.E301.pin_start_cold,
    pout_start=BPHE.E301.pin_start_cold - 0.01e5,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1)     annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-124,-68})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV1(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=20000000000,
    pout_start=19000000000,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-144,-68})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV3(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=30000000000,
    pout_start=29000000000,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-124,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV4(
    L=L_S9,
    t=t_S9,
    m_flow_start=m_flow_total,
    pin_start=29000000000,
    pout_start=28000000000,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-104,72})));
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
        origin={-73,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
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
        origin={-44,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5(
    L=L_S9,
    t=t_S9,
    m_flow_start=m_flow_total,
    pin_start=pin_start_Users + 0.01e5,
    pout_start=pin_start_Users,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S9)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-14,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV7(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={36,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={76,-8})));
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
        origin={56,-48.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV11(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={56,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV12(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={76,92})));
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
        origin={136,-47.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV13(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={116,52})));
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
        origin={216,-47.5})));
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
        origin={296,-48.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV711(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={156,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV721(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={236,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV731(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={316,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV18(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={156,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV19(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pin_start_Users - 0.01e5,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={136,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV20(
    L=L_S1,
    t=t_S1,
    m_flow_start=m_flow_total,
    pin_start=pout_start_Users - 0.03e5,
    pout_start=pout_start_Users - 0.04e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_S1)       annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={16,112})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV21(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*3,
    pin_start=pout_start_Users - 0.02e5,
    pout_start=pout_start_Users - 0.03e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={96,112})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV26(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={196,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV30(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={236,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV31(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={176,112})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV33(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users - 0.02e5,
    pout_start=pin_start_Users - 0.03e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={216,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV35(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={276,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV39(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users + 0.01e5,
    pout_start=pout_start_Users,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={316,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV40(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pout_start_Users,
    pout_start=pout_start_Users - 0.01e5,
    Tin_start=Tout_start_Users,
    Tout_start=Tout_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={256,112})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{367,-18},{347,2}})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{-84,-18},{-104,2}})));
  Modelica.Blocks.Sources.RealExpression FCV901_theta(y=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-44,42})));
  Modelica.Blocks.Sources.RealExpression P101_m_flow(y=m_flow_total)
    annotation (Placement(transformation(extent={{-84,-54},{-104,-34}})));
  Modelica.Blocks.Sources.RealExpression P901_omega(y=0.6*Pump.P901.omeganom)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-78,42})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=333.15,
    pin_start=180000,
    pout_start=179000) annotation (Placement(visible=true, transformation(
        origin={-134,-113},
        extent={{-25,-25},{25,25}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.ClosedLoopInitializer
    closedLoopInitializer(
    p_start(displayUnit="Pa") = 2.333038e5,
    T_start(displayUnit="K") = 80.32302 + 273.15,
    m_flow_start=m_flow_total) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={16,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV2(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={36,-166})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV6(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={116,-166})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV8(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={196,-166})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV9(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={276,-166})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV10(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={76,-196})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV14(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={156,-196})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV15(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={236,-196})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV16(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.1e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={76,-106})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV17(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.1e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={156,-106})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV22(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.1e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={236,-106})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV23(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.1e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={316,-106})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV24(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.01e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={96,-136})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV25(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*2,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.01e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={176,-136})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV27(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*3,
    pin_start=pin_start_CoolingPipes,
    pout_start=pin_start_CoolingPipes - 0.01e5,
    Tin_start=Tin_start_CoolingPipes,
    Tout_start=Tin_start_CoolingPipes,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={256,-136})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    PR01(
    Tin_start(displayUnit="K") = 28 + 273.15,
    Tout_start(displayUnit="K") = 29 + 273.15,
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
    pout_start(displayUnit="Pa") = 2.7e5,
    qnom_inm3h=32.34652403,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom)
                     annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={366,-106})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=if time < 100 then 9
         elseif time < 500 then 8 else 10)
    annotation (Placement(transformation(extent={{383,-54},{363,-34}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV701(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=pin_start_CoolingValve)
                      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={36,-98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV711(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=pin_start_CoolingValve)
                      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={116,-98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV721(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=pin_start_CoolingValve)
                      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={196,-98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV731(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=pin_start_CoolingValve)
                      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={276,-98})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers1(y=1)
    annotation (Placement(transformation(extent={{-14,-108},{6,-88}})));
  Sources.SinkPressure sinkCold_HX(
    p0(displayUnit="Pa") = 2e5,
    T0=(36.7 + 273.15) + 273.15,
    R=1e-3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={377,-196})));
  Sources.SourcePressure sourceColdP_HX(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 28 + 273.15,
    h0=BPHE.E701.hin_start_cold,
    R=1e-3) annotation (Placement(transformation(extent={{416,-98},{396,-78}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D201(H=4, D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000,
    m_flow_start=0.1)
    annotation (Placement(transformation(extent={{-296,-154},{-248,-78}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    P201(
      Tin_start(displayUnit="K") = Pump.P201.Tin_start,
      Tout_start=Pump.P201.Tout_start,
      a=Pump.P201.a,
      b=Pump.P201.b,
      m_flow_start=Pump.P201.m_flow_nom,
      dpnom=Pump.P201.dpnom,
      etaelec=Pump.P201.etaelec,
      etamech=Pump.P201.etamech,
      etanom=Pump.P201.etanom,
      hin_start=Pump.P201.hin_start,
      m_flow_nom=Pump.P201.m_flow_nom,
      omeganom=Pump.P201.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=16.5,
      rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=15.5)      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-326,-31})));
  Modelica.Blocks.Sources.RealExpression P201_m_flow(y=0.15)
    annotation (Placement(transformation(extent={{-364,-36},{-344,-16}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D202(
    H=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000,
    m_flow_start=0.1)
         annotation (Placement(transformation(extent={{-225,-154},{-177,-78}})));
equation
  connect(P101.inlet,roundPipe1DFV. outlet) annotation (Line(
      points={{-124,-48.6},{-124,-58}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,P101. outlet) annotation (Line(
      points={{-124,-18},{-124,-29.4}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.outlet,roundPipe1DFV4. inlet) annotation (Line(
      points={{-124,62},{-124,72},{-114,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV4.outlet,P901. inlet) annotation (Line(
      points={{-94,72},{-82.6,72}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet,FCV901. inlet) annotation (Line(
      points={{-63.4,72},{-54,72}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet,roundPipe1DFV5. inlet) annotation (Line(
      points={{-34,72},{-24,72}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,EX701. outhot) annotation (Line(
      points={{76,-18},{76,-39.75},{76.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,EX711. outhot) annotation (Line(
      points={{156,-18},{156,-28.375},{156.3,-28.375},{156.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,EX721. outhot) annotation (Line(
      points={{236,-18},{236,-28.875},{236.3,-28.875},{236.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,EX731. outhot) annotation (Line(
      points={{316,-18},{316,-28.875},{316.3,-28.875},{316.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{76,102},{76,112},{26,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV21.outlet,roundPipe1DFV20. inlet) annotation (Line(
      points={{86,112},{26,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.inlet,roundPipe1DFV20. outlet) annotation (Line(
      points={{-144,-58},{-144,112},{6,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{156,102},{156,112},{106,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV31.outlet,roundPipe1DFV21. inlet) annotation (Line(
      points={{166,112},{106,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{246,112},{186,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.outlet,roundPipe1DFV31. inlet) annotation (Line(
      points={{236,102},{236,112},{186,112}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.inlet,roundPipe1DFV39. outlet) annotation (Line(
      points={{266,112},{316,112},{316,102}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.outlet,EX701. inhot) annotation (Line(
      points={{36,42},{36,-38.875},{35.7,-38.875},{35.7,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.outlet,EX711. inhot) annotation (Line(
      points={{116,42},{116,-38.75},{115.7,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.outlet,EX721. inhot) annotation (Line(
      points={{196,42},{196,-38.75},{195.7,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV35.outlet,EX731. inhot) annotation (Line(
      points={{276,42},{276,-39.75},{275.7,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.inlet,roundPipe1DFV11. inlet) annotation (Line(
      points={{36,62},{36,72},{46,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.outlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{66,72},{126,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.inlet,roundPipe1DFV19. inlet) annotation (Line(
      points={{116,62},{116,72},{126,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV19.outlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{146,72},{206,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.inlet,roundPipe1DFV33. inlet) annotation (Line(
      points={{196,62},{196,72},{206,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV33.outlet,roundPipe1DFV35. inlet) annotation (Line(
      points={{226,72},{276,72},{276,62}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.inlet,FCV701. outlet) annotation (Line(
      points={{76,82},{76,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.inlet,FCV711. outlet) annotation (Line(
      points={{156,82},{156,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.inlet,FCV721. outlet) annotation (Line(
      points={{236,82},{236,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV39.inlet,FCV731. outlet) annotation (Line(
      points={{316,82},{316,2}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers.y,FCV731. opening)
    annotation (Line(points={{346,-8},{324,-8}}, color={0,0,127}));
  connect(FCV721.opening,FCV731. opening) annotation (Line(points={{244,-8},{256,
          -8},{256,12},{336,12},{336,-8},{324,-8}}, color={0,0,127}));
  connect(FCV711.opening,FCV731. opening) annotation (Line(points={{164,-8},{176,
          -8},{176,12},{336,12},{336,-8},{324,-8}},
                                               color={0,0,127}));
  connect(FCV701.opening,FCV731. opening) annotation (Line(points={{84,-8},{96,-8},
          {96,12},{336,12},{336,-8},{324,-8}},color={0,0,127}));
  connect(FCV101_theta.y,FCV101. opening)
    annotation (Line(points={{-105,-8},{-116,-8}}, color={0,0,127}));
  connect(FCV901_theta.y,FCV901. opening)
    annotation (Line(points={{-44,53},{-44,64}},   color={0,0,127}));
  connect(P901.in_omega,P901_omega. y) annotation (Line(points={{-77.8,66},{-77.8,
          59.5},{-78,59.5},{-78,53}},          color={0,0,127}));
  connect(roundPipe1DFV3.inlet,FCV101. outlet) annotation (Line(
      points={{-124,42},{-124,2}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet,closedLoopInitializer. inlet) annotation (Line(
      points={{-4,72},{1,72},{1,71.8},{6,71.8}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.inlet,closedLoopInitializer. outlet) annotation (Line(
      points={{46,72},{26,72}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet,GB101. inlet) annotation (Line(
      points={{-144,-78},{-144,-92},{-144,-93},{-141.5,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV.inlet,GB101. outlet) annotation (Line(
      points={{-124,-78},{-124,-99},{-124,-93},{-126.5,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV2.outlet,roundPipe1DFV10. inlet) annotation (Line(
      points={{36,-176},{36,-196},{66,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV10.outlet,roundPipe1DFV6. outlet) annotation (Line(
      points={{86,-196},{116,-196},{116,-176}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV14.inlet,roundPipe1DFV6. outlet) annotation (Line(
      points={{146,-196},{116,-196},{116,-176}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.outlet,roundPipe1DFV14. outlet) annotation (Line(
      points={{196,-176},{196,-196},{166,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV15.inlet,roundPipe1DFV14. outlet) annotation (Line(
      points={{226,-196},{166,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV15.outlet,roundPipe1DFV9. outlet) annotation (Line(
      points={{246,-196},{276,-196},{276,-176}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold,roundPipe1DFV16. outlet) annotation (Line(
      points={{76.3,-57.25},{76.3,-73},{76,-73},{76,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold,roundPipe1DFV17. outlet) annotation (Line(
      points={{156.3,-56.25},{156.3,-84.125},{156,-84.125},{156,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,roundPipe1DFV22. outlet) annotation (Line(
      points={{236.3,-56.25},{236.3,-84.125},{236,-84.125},{236,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,roundPipe1DFV23. outlet) annotation (Line(
      points={{316.3,-57.25},{316.3,-84.625},{316,-84.625},{316,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV24.outlet,roundPipe1DFV16. inlet) annotation (Line(
      points={{86,-136},{76,-136},{76,-116}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV17.inlet,roundPipe1DFV24. inlet) annotation (Line(
      points={{156,-116},{156,-136},{106,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV25.outlet,roundPipe1DFV24. inlet) annotation (Line(
      points={{166,-136},{106,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV22.inlet,roundPipe1DFV25. inlet) annotation (Line(
      points={{236,-116},{236,-136},{186,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV27.outlet,roundPipe1DFV25. inlet) annotation (Line(
      points={{246,-136},{186,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV23.inlet,roundPipe1DFV27. inlet) annotation (Line(
      points={{316,-116},{316,-136},{266,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,roundPipe1DFV27. inlet) annotation (Line(
      points={{366,-116.4},{366,-136},{266,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TCV701. inlet) annotation (Line(
      points={{35.7,-57.25},{36,-57.25},{36,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,roundPipe1DFV2. inlet) annotation (Line(
      points={{36,-108},{36,-156}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TCV711. inlet) annotation (Line(
      points={{115.7,-56.25},{116,-56.25},{116,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,roundPipe1DFV6. inlet) annotation (Line(
      points={{116,-108},{116,-156}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TCV721. inlet) annotation (Line(
      points={{195.7,-56.25},{196,-56.25},{196,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,roundPipe1DFV8. inlet) annotation (Line(
      points={{196,-108},{196,-156}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TCV731. inlet) annotation (Line(
      points={{275.7,-57.25},{275.7,-82},{276,-82},{276,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,roundPipe1DFV9. inlet) annotation (Line(
      points={{276,-108},{276,-156}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers1.y,TCV701. opening)
    annotation (Line(points={{7,-98},{28,-98}},    color={0,0,127}));
  connect(FCV_thetaconsumers1.y,TCV711. opening) annotation (Line(points={{7,-98},
          {16,-98},{16,-78},{96,-78},{96,-98},{108,-98}},color={0,0,127}));
  connect(FCV_thetaconsumers1.y,TCV721. opening) annotation (Line(points={{7,-98},
          {16,-98},{16,-78},{176,-78},{176,-98},{188,-98}},color={0,0,127}));
  connect(FCV_thetaconsumers1.y,TCV731. opening) annotation (Line(points={{7,-98},
          {16,-98},{16,-78},{256,-78},{256,-98},{268,-98}},   color={0,0,127}));
  connect(roundPipe1DFV15.outlet,sinkCold_HX. inlet) annotation (Line(
      points={{246,-196},{367,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceColdP_HX.outlet,PR01. inlet) annotation (Line(
      points={{396,-88},{366,-88},{366,-95.6}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet, D201.inlet) annotation (Line(
      points={{-326,-40.6},{-327,-40.6},{-327,-135},{-296,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-326,-21.4},{-325,-21.4},{-325,112},{6,112}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet, roundPipe1DFV4.inlet) annotation (Line(
      points={{-296,-97},{-310,-97},{-310,72},{-114,72}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.inlet, D201.inlet) annotation (Line(
      points={{-225,-135},{-233,-135},{-233,-130},{-239,-130},{-239,-172},{-327,
          -172},{-327,-135},{-296,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.outlet, roundPipe1DFV4.inlet) annotation (Line(
      points={{-225,-97},{-232,-97},{-232,-101},{-239,-101},{-239,72},{-114,72}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-440,-240},{440,240}}, grid={1,1})), Icon(
        coordinateSystem(extent={{-440,-240},{440,240}})),
    experiment(
      StopTime=100,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end WaterTanksSystem;
