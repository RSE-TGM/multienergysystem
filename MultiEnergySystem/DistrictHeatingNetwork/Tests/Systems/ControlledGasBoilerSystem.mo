within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model ControlledGasBoilerSystem
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
  //parameter Types.MassFlowRate m_flow_total = 2.4095388;
  parameter Types.MassFlowRate m_flow_total = 2.5;

  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Temperature Tin_start_Users = 80 + 273.15;
  parameter Types.Temperature Tout_start_Users = 60 + 273.15;

  parameter Types.Temperature Tcool = 8 + 273.15;
  parameter Types.MassFlowRate m_flow_cool = 1.75;

  parameter Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Types.Length L_Users = 10;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Real Kv_UsersValve(unit = "m3/h") = 4 "Metri Flow Coefficient ";
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Types.Pressure dp_nom_UsersValve = 50000;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    P101(
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start=(80 + 273.15) + 273.15,                                       a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_total,                                                                                 dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    qnom_inm3h=Pump.P101.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom,
    headmax=Pump.P101.headnommax,
    headmin=Pump.P101.headnommin,
    qnom_inm3h_min=Pump.P101.qnommin_inm3h,
    qnom_inm3h_max=Pump.P101.qnommax_inm3h,
    use_m_flow=true) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-220,-21})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV101(
    allowFlowReversal=true,
    Kv=9.69,
    dp_nom(displayUnit="Pa") = 0.1e5,
    Tin_start(displayUnit="K") = 80 + 273.15,
    pin_start=200000)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    PL101_HotSide(
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
    PL101_ColdSide(
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
    qnom_inm3h=Pump.P901.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    headmax=Pump.P901.headnommax,
    headmin=Pump.P901.headnommin,
    qnom_inm3h_min=Pump.P901.qnommin_inm3h,
    qnom_inm3h_max=Pump.P901.qnommax_inm3h,
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
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers4(y=1)
    annotation (Placement(transformation(extent={{311,0},{291,20}})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{-180,0},{-200,20}})));
  Modelica.Blocks.Sources.RealExpression FCV901_theta(y=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-140,60})));
  Modelica.Blocks.Sources.RealExpression P101_m_flow(y=if time < 60 then
        m_flow_total else m_flow_total)
    annotation (Placement(transformation(extent={{-180,-36},{-200,-16}})));
  Modelica.Blocks.Sources.RealExpression P901_omega(y=0.6*Pump.P901.omeganom)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-190,59})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=333.15,
    pin_start=180000,
    pout_start=179000,
    HH=55.5e6)         annotation (Placement(visible=true, transformation(
        origin={-230,-95},
        extent={{-25,-25},{25,25}},
        rotation=-90)));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers2(y=1)
    annotation (Placement(transformation(extent={{312,24},{292,44}})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers1(y=1)
    annotation (Placement(transformation(extent={{313,37},{293,57}})));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers3(y=1)
    annotation (Placement(transformation(extent={{312,12},{292,32}})));
  Sources.SinkMassFlow sinkCold_701(
    use_in_m_flow=true,
    T0=Tcool,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={-60,-84},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_701(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={-20,-81},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_1(
    use_in_m_flow=true,
    T0=Tcool,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={20,-84},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_1(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={60,-81},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_2(
    use_in_m_flow=true,
    T0=Tcool,
    m_flow0=BPHE.E701.m_flow_start_cold*0.8,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={100,-84},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_2(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={140,-81},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_3(
    use_in_m_flow=true,
    T0=Tcool,
    m_flow0=BPHE.E701.m_flow_start_cold*0.8,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={180,-84},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_3(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={220,-81},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.Ramp ramp(
    height=m_flow_total*0.32*0,
    duration=200,
    offset=m_flow_total,
    startTime=1500)
    annotation (Placement(transformation(extent={{-180,-55},{-200,-35}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-0.5*0,
    duration=100,
    offset=1,
    startTime=500)
    annotation (Placement(transformation(extent={{311,-20},{291,0}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    height=-0.5*0,
    duration=100,
    offset=1,
    startTime=600)
    annotation (Placement(transformation(extent={{311,-48},{291,-28}})));
  Modelica.Blocks.Sources.Ramp ramp3(
    height=-BPHE.E701.m_flow_start_cold*0.99*0,
    duration=100,
    offset=m_flow_cool,
    startTime=500)
    annotation (Placement(transformation(extent={{110,-130},{90,-110}})));
  Modelica.Blocks.Sources.Ramp ramp4(
    height=-BPHE.E701.m_flow_start_cold*0.99*0,
    duration=100,
    offset=m_flow_cool,
    startTime=600)
    annotation (Placement(transformation(extent={{190,-130},{170,-110}})));
  Modelica.Blocks.Sources.Ramp ramp5(
    height=0.4*Pump.P901.omeganom*0,
    duration=200,
    offset=0.8*Pump.P901.omeganom/0.8,
    startTime=1200)
    annotation (Placement(transformation(extent={{-148,28},{-168,48}})));
  Modelica.Blocks.Sources.Ramp ramp6(
    height=-BPHE.E701.m_flow_start_cold*0.99*0,
    duration=100,
    offset=m_flow_cool,
    startTime=500)
    annotation (Placement(transformation(extent={{30,-130},{10,-110}})));
  Modelica.Blocks.Sources.Ramp ramp7(
    height=-BPHE.E701.m_flow_start_cold*0.99*0,
    duration=100,
    offset=m_flow_cool,
    startTime=500)
    annotation (Placement(transformation(extent={{-50,-130},{-70,-110}})));
  Sources.SourcePressure VE901(p0=169000, T0(displayUnit="K") = 60 + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-140,152})));
equation
  connect(P101.inlet,PL101_HotSide. outlet) annotation (Line(
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
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-201,10},{-212,10}}, color={0,0,127}));
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-140,71},{-140,82}}, color={0,0,127}));

  connect(roundPipe1DFV3.inlet, FCV101.outlet) annotation (Line(
      points={{-220,60},{-220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL101_ColdSide.outlet, GB101.inlet) annotation (Line(
      points={{-240,-60},{-240,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL101_HotSide.inlet, GB101.outlet) annotation (Line(
      points={{-220,-60},{-220,-80}},
      color={140,56,54},
      thickness=0.5));

  connect(FCV_thetaconsumers2.y, FCV711.opening) annotation (Line(points={{291,34},
          {80,34},{80,10},{68,10}}, color={0,0,127}));
  connect(FCV_thetaconsumers1.y, FCV701.opening) annotation (Line(points={{292,47},
          {-1,47},{-1,10},{-12,10}}, color={0,0,127}));
  connect(sinkCold_701.inlet, EX701.outcold) annotation (Line(
      points={{-60,-71},{-60,-54},{-74,-54},{-74,-39.25},{-60.3,-39.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_701.outlet, EX701.incold) annotation (Line(
      points={{-20,-71},{-20,-54},{-4,-54},{-4,-39.25},{-19.7,-39.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, sinkCold_1.inlet) annotation (Line(
      points={{19.7,-38.25},{19.7,-54.625},{20,-54.625},{20,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, sourceCold_1.outlet) annotation (Line(
      points={{60.3,-38.25},{60.3,-54.625},{60,-54.625},{60,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, sinkCold_2.inlet) annotation (Line(
      points={{99.7,-38.25},{99.7,-54.625},{100,-54.625},{100,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, sourceCold_2.outlet) annotation (Line(
      points={{140.3,-38.25},{140.3,-54.625},{140,-54.625},{140,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, sinkCold_3.inlet) annotation (Line(
      points={{179.7,-39.25},{164,-39.25},{164,-64},{180,-64},{180,-71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, sourceCold_3.outlet) annotation (Line(
      points={{220.3,-39.25},{220.3,-38},{234,-38},{234,-64},{220,-64},{220,-71}},
      color={140,56,54},
      thickness=0.5));

  connect(ramp.y, P101.in_m_flow) annotation (Line(points={{-201,-45},{-208,-45},
          {-208,-25.8},{-214.48,-25.8}}, color={0,0,127}));
  connect(ramp1.y, FCV731.opening) annotation (Line(points={{290,-10},{277,-10},
          {277,-9},{265,-9},{265,10},{228,10}}, color={0,0,127}));
  connect(ramp2.y, FCV721.opening) annotation (Line(points={{290,-38},{268,-38},
          {268,-34},{249,-34},{249,-6},{162,-6},{162,10},{148,10}}, color={0,0,
          127}));
  connect(ramp3.y, sinkCold_2.in_m_flow) annotation (Line(points={{89,-120},{84,
          -120},{84,-76.2},{93.5,-76.2}}, color={0,0,127}));
  connect(ramp4.y, sinkCold_3.in_m_flow) annotation (Line(points={{169,-120},{165,
          -120},{165,-121},{163,-121},{163,-76.2},{173.5,-76.2}},     color={0,
          0,127}));
  connect(ramp5.y, P901.in_omega) annotation (Line(points={{-169,38},{-173,38},
          {-173,84},{-173.8,84}}, color={0,0,127}));
  connect(ramp7.y, sinkCold_701.in_m_flow) annotation (Line(points={{-71,-120},{
          -80,-120},{-80,-76.2},{-66.5,-76.2}}, color={0,0,127}));
  connect(ramp6.y, sinkCold_1.in_m_flow) annotation (Line(points={{9,-120},{0,-120},
          {0,-76.2},{13.5,-76.2}}, color={0,0,127}));
  connect(roundPipe1DFV5.outlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{-100,90},{-50,90}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-140,142},{-140,130},{-90,130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL101_ColdSide.inlet, roundPipe1DFV20.outlet) annotation (Line(
      points={{-240,-40},{-240,130},{-90,130}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-400,-160},{400,160}}, grid={1,1})), Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=6000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ControlledGasBoilerSystem;