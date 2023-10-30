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
    Tout_start=(80 + 273.15) + 273.15,                                       a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_total,                                                                                 dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,                                                                                                                                                                                                        qnom_inm3h = 15.60340167, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom,
    use_m_flow=true) annotation (Placement(transformation(
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV7(L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
                              Di=Di_Users)
                   annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-60,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-20,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-40,-30.5})));
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
        origin={-40,90})));
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
        origin={-20,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={40,-29.5})));
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
        origin={20,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={120,-29.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={200,-30.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV711(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={60,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Kv_UsersValve,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={220,10})));
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
        origin={60,110})));
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
        origin={40,90})));
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
        origin={-80,130})));
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
        origin={0,130})));
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
        origin={100,70})));
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
        origin={140,110})));
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
        origin={80,130})));
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
        origin={120,90})));
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
        origin={180,70})));
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
        origin={220,110})));
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
        origin={160,130})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{299,0},{279,20}})));
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
        origin={-60,-148})));
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
        origin={20,-148})));
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
        origin={100,-148})));
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
        origin={180,-148})));
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
        origin={-20,-178})));
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
        origin={60,-178})));
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
        origin={140,-178})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV16(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-20,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV17(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={60,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV22(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV23(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={220,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV24(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={0,-118})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV25(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={80,-118})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV27(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_start_cooling*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Users,
    Tout_start=Tin_start_Users,
    Di=Di_Users)    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={160,-118})));
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
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    use_m_flow=true) annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={270,-88})));
  Modelica.Blocks.Sources.RealExpression PR01_m_flow(y=if time < 100 then 9
         elseif time < 500 then 8 else 10)
    annotation (Placement(transformation(extent={{287,-36},{267,-16}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV701(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-60,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV711(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={20,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV721(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={100,-80})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    TCV731(
    allowFlowReversal=true,
    Kv=12,
    dp_nom(displayUnit="Pa") = 0.17e5,
    Tin_start(displayUnit="K") = 36.7 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={180,-80})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers1(y=1)
    annotation (Placement(transformation(extent={{-110,-90},{-90,-70}})));
  Sources.SinkPressure sinkCold_HX(
    p0(displayUnit="Pa") = 2e5,
    T0=(36.7 + 273.15) + 273.15,
    R=1e-3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={278,-178})));
  Sources.SourcePressure sourceColdP_HX(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 28 + 273.15,
    h0=BPHE.E701.hin_start_cold,
    R=1e-3) annotation (Placement(transformation(extent={{320,-68},{300,-48}})));
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
  connect(FCV701.inlet, EX701.outhot) annotation (Line(
      points={{-20,0},{-20,-21.75},{-19.7,-21.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet, EX711.outhot) annotation (Line(
      points={{60,1.77636e-15},{60,-10.375},{60.3,-10.375},{60.3,-20.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet, EX721.outhot) annotation (Line(
      points={{140,1.77636e-15},{140,-10.875},{140.3,-10.875},{140.3,-20.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet, EX731.outhot) annotation (Line(
      points={{220,1.77636e-15},{220,-10.875},{220.3,-10.875},{220.3,-21.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.outlet, roundPipe1DFV20.inlet) annotation (Line(
      points={{-20,120},{-20,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV21.outlet, roundPipe1DFV20.inlet) annotation (Line(
      points={{-10,130},{-70,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-240,-40},{-240,130},{-90,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.outlet, roundPipe1DFV21.inlet) annotation (Line(
      points={{60,120},{60,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV31.outlet, roundPipe1DFV21.inlet) annotation (Line(
      points={{70,130},{10,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.outlet, roundPipe1DFV31.inlet) annotation (Line(
      points={{150,130},{90,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.outlet, roundPipe1DFV31.inlet) annotation (Line(
      points={{140,120},{140,130},{90,130}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV40.inlet, roundPipe1DFV39.outlet) annotation (Line(
      points={{170,130},{220,130},{220,120}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.outlet, EX701.inhot) annotation (Line(
      points={{-60,60},{-60,-20.875},{-60.3,-20.875},{-60.3,-21.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.outlet, EX711.inhot) annotation (Line(
      points={{20,60},{20,-20.75},{19.7,-20.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.outlet, EX721.inhot) annotation (Line(
      points={{100,60},{100,-20.75},{99.7,-20.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV35.outlet, EX731.inhot) annotation (Line(
      points={{180,60},{180,-21.75},{179.7,-21.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV7.inlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{-60,80},{-60,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV11.outlet, roundPipe1DFV19.inlet) annotation (Line(
      points={{-30,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV13.inlet, roundPipe1DFV19.inlet) annotation (Line(
      points={{20,80},{20,90},{30,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV19.outlet, roundPipe1DFV33.inlet) annotation (Line(
      points={{50,90},{110,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV26.inlet, roundPipe1DFV33.inlet) annotation (Line(
      points={{100,80},{100,90},{110,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV33.outlet, roundPipe1DFV35.inlet) annotation (Line(
      points={{130,90},{180,90},{180,80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV12.inlet, FCV701.outlet) annotation (Line(
      points={{-20,100},{-20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV18.inlet, FCV711.outlet) annotation (Line(
      points={{60,100},{60,20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV30.inlet, FCV721.outlet) annotation (Line(
      points={{140,100},{140,20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV39.inlet, FCV731.outlet) annotation (Line(
      points={{220,100},{220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers.y, FCV731.opening)
    annotation (Line(points={{278,10},{228,10}}, color={0,0,127}));
  connect(FCV721.opening, FCV731.opening) annotation (Line(points={{148,10},{160,
          10},{160,30},{270,30},{270,10},{228,10}}, color={0,0,127}));
  connect(FCV711.opening, FCV731.opening) annotation (Line(points={{68,10},{80,10},
          {80,30},{270,30},{270,10},{228,10}}, color={0,0,127}));
  connect(FCV701.opening, FCV731.opening) annotation (Line(points={{-12,10},{0,10},
          {0,30},{270,30},{270,10},{228,10}}, color={0,0,127}));
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
  connect(roundPipe1DFV11.inlet, closedLoopInitializer.outlet) annotation (Line(
      points={{-50,90},{-70,90}},
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
  connect(P101.in_m_flow, P101_m_flow.y) annotation (Line(points={{-214.48,-25.8},
          {-201,-25.8},{-201,-26}}, color={0,0,127}));
  connect(roundPipe1DFV2.outlet, roundPipe1DFV10.inlet) annotation (Line(
      points={{-60,-158},{-60,-178},{-30,-178}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV10.outlet, roundPipe1DFV6.outlet) annotation (Line(
      points={{-10,-178},{20,-178},{20,-158}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV14.inlet, roundPipe1DFV6.outlet) annotation (Line(
      points={{50,-178},{20,-178},{20,-158}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.outlet, roundPipe1DFV14.outlet) annotation (Line(
      points={{100,-158},{100,-178},{70,-178}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV15.inlet, roundPipe1DFV14.outlet) annotation (Line(
      points={{130,-178},{70,-178}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV15.outlet, roundPipe1DFV9.outlet) annotation (Line(
      points={{150,-178},{180,-178},{180,-158}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, roundPipe1DFV16.outlet) annotation (Line(
      points={{-19.7,-39.25},{-19.7,-55},{-20,-55},{-20,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold,roundPipe1DFV17. outlet) annotation (Line(
      points={{60.3,-38.25},{60.3,-66.125},{60,-66.125},{60,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,roundPipe1DFV22. outlet) annotation (Line(
      points={{140.3,-38.25},{140.3,-66.125},{140,-66.125},{140,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,roundPipe1DFV23. outlet) annotation (Line(
      points={{220.3,-39.25},{220.3,-66.625},{220,-66.625},{220,-78}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV24.outlet, roundPipe1DFV16.inlet) annotation (Line(
      points={{-10,-118},{-20,-118},{-20,-98}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV17.inlet,roundPipe1DFV24. inlet) annotation (Line(
      points={{60,-98},{60,-118},{10,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV25.outlet,roundPipe1DFV24. inlet) annotation (Line(
      points={{70,-118},{10,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV22.inlet,roundPipe1DFV25. inlet) annotation (Line(
      points={{140,-98},{140,-118},{90,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV27.outlet,roundPipe1DFV25. inlet) annotation (Line(
      points={{150,-118},{90,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV23.inlet,roundPipe1DFV27. inlet) annotation (Line(
      points={{220,-98},{220,-118},{170,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,roundPipe1DFV27. inlet) annotation (Line(
      points={{270,-98.4},{270,-118},{170,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_m_flow.y, PR01.in_m_flow) annotation (Line(points={{266,-26},{265,
          -26},{265,-25},{255,-25},{255,-82.8},{264.02,-82.8}}, color={0,0,127}));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-60.3,-39.25},{-60,-39.25},{-60,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, roundPipe1DFV2.inlet) annotation (Line(
      points={{-60,-90},{-60,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{19.7,-38.25},{20,-38.25},{20,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, roundPipe1DFV6.inlet) annotation (Line(
      points={{20,-90},{20,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{99.7,-38.25},{100,-38.25},{100,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, roundPipe1DFV8.inlet) annotation (Line(
      points={{100,-90},{100,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{179.7,-39.25},{179.7,-64},{180,-64},{180,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, roundPipe1DFV9.inlet) annotation (Line(
      points={{180,-90},{180,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV_thetaconsumers1.y, TCV701.opening)
    annotation (Line(points={{-89,-80},{-68,-80}}, color={0,0,127}));
  connect(FCV_thetaconsumers1.y, TCV711.opening) annotation (Line(points={{-89,-80},
          {-80,-80},{-80,-60},{0,-60},{0,-80},{12,-80}}, color={0,0,127}));
  connect(FCV_thetaconsumers1.y, TCV721.opening) annotation (Line(points={{-89,-80},
          {-80,-80},{-80,-60},{80,-60},{80,-80},{92,-80}}, color={0,0,127}));
  connect(FCV_thetaconsumers1.y, TCV731.opening) annotation (Line(points={{-89,-80},
          {-80,-80},{-80,-60},{160,-60},{160,-80},{172,-80}}, color={0,0,127}));
  connect(roundPipe1DFV15.outlet, sinkCold_HX.inlet) annotation (Line(
      points={{150,-178},{268,-178}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.inlet, sourceColdP_HX.outlet) annotation (Line(
      points={{270,-77.6},{270,-58},{300,-58}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-400,-200},{400,200}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerCompleteSystem;
