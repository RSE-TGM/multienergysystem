within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
partial model GasBoilerOLSystem2
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
    P101(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, etanom = Pump.P101.etanom, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, qnom_inm3h = 15.60340167, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom)
                     annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-220,-21})));
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
    Tout_start(displayUnit="K") = 82 + 273.15,
    a=Pump.P901.a,
    b=Pump.P901.b,
    dpnom(displayUnit="Pa") = Pump.P901.dpnom,
    etaelec=Pump.P901.etaelec,
    etamech=Pump.P901.etamech,
    etanom=Pump.P901.etanom,
    hin_start=Pump.P901.hin_start,
    m_flow_nom=Pump.P901.m_flow_nom,
    omeganom=Pump.P901.omeganom,
    pin_start(displayUnit="Pa") = 2.5e5,
    pout_start(displayUnit="Pa") = 2.9e5,
    qnom_inm3h=19,
    rhonom(displayUnit="kg/m3") = Pump.P901.rhonom,
    headmax=27,
    headmin=11,
    qnom_inm3h_min=10,
    use_in_omega=true)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=0,
        origin={-169,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV901(
    allowFlowReversal=false,
    nomOpening=1,
    Kv=Kv_FCV901,
    dp_nom(displayUnit="Pa") = 5000,
    Tin_start(displayUnit="K") = 80 + 273.15,
    pin_start=290000)
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
        origin={-20,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot,                                                                                     k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
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
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot,                                                                                     k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
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
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot,                                                                                     k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={120,-29.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot,                                                                                     k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={200,-30.5})));
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
        origin={60,10})));
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
        origin={140,10})));
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
  Sources.SinkMassFlow sinkCold_701(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={-60,-83},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_701(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={-20,-80},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_1(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={20,-83},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_1(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={60,-80},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_2(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={100,-83},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_2(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={140,-80},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkMassFlow sinkCold_3(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold) annotation (Placement(visible=true,
        transformation(
        origin={180,-83},
        extent={{13,-13},{-13,13}},
        rotation=90)));
  Sources.SourcePressure sourceCold_3(
    T0=BPHE.E701.Tin_start_cold,
    p0=BPHE.E701.pin_start_cold,
    h0=BPHE.E701.hin_start_cold)
    annotation (Placement(visible=true, transformation(
        origin={220,-80},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Sources.RealExpression FCV_thetaconsumers(y=1)
    annotation (Placement(transformation(extent={{311,0},{291,20}})));
  Modelica.Blocks.Sources.RealExpression FCV101_theta(y=1)
    annotation (Placement(transformation(extent={{-180,0},{-200,20}})));
  Modelica.Blocks.Sources.RealExpression FCV901_theta(y=1) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-140,60})));
  Modelica.Blocks.Sources.RealExpression P101_m_flow(y=m_flow_total)
    annotation (Placement(transformation(extent={{-271,-36},{-251,-16}})));
  Modelica.Blocks.Sources.RealExpression P901_omega(y=0.6*Pump.P901.omeganom)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-174,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=333.15,
    pin_start=180000,
    pout_start=179000) annotation (Placement(visible=true, transformation(
        origin={-230,-95},
        extent={{-25,-25},{25,25}},
        rotation=0)));
  Sources.SourcePressure sourceP(T0(displayUnit="K") = 80 + 273.15, p0(
        displayUnit="bar") = 175549.79)
                                   annotation (Placement(visible=true,
        transformation(
        origin={-195,44},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Sources.SinkPressure sinkPressure(p0=175549.79, T0(displayUnit="K") = 80 +
      273.15)                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-166,19})));
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
  connect(sourceCold_701.outlet, EX701.incold) annotation (Line(
      points={{-20,-70},{-20,-39.25},{-19.7,-39.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_701.inlet, EX701.outcold) annotation (Line(
      points={{-60,-70},{-60,-39.25},{-60.3,-39.25}},
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
  connect(sinkCold_1.inlet, EX711.outcold) annotation (Line(
      points={{20,-70},{20,-52},{19.7,-52},{19.7,-38.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, sourceCold_1.outlet) annotation (Line(
      points={{60.3,-38.25},{60.3,-54.125},{60,-54.125},{60,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold_2.inlet, EX721.outcold) annotation (Line(
      points={{100,-70},{100,-54.125},{99.7,-54.125},{99.7,-38.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_2.outlet, EX721.incold) annotation (Line(
      points={{140,-70},{140,-54.125},{140.3,-54.125},{140.3,-38.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet, roundPipe1DFV11.inlet) annotation (Line(
      points={{-100,90},{-50,90}},
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
    annotation (Line(points={{290,10},{228,10}}, color={0,0,127}));
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
  connect(sinkCold_3.inlet, EX731.outcold) annotation (Line(
      points={{180,-70},{180,-39.25},{179.7,-39.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, sourceCold_3.outlet) annotation (Line(
      points={{220.3,-39.25},{220.3,-38},{220,-38},{220,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.in_omega, P901_omega.y) annotation (Line(points={{-173.8,84},{
          -173.8,77.5},{-174,77.5},{-174,71}}, color={0,0,127}));

  connect(sourceP.outlet, roundPipe1DFV3.inlet) annotation (Line(
      points={{-195,54},{-195,59},{-218,59},{-218,60},{-220,60}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, FCV101.outlet) annotation (Line(
      points={{-166,29},{-166,38},{-186,38},{-186,29},{-220,29},{-220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet, GB101.inlet) annotation (Line(
      points={{-240,-60},{-240,-74},{-240,-75},{-237.5,-75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV.inlet, GB101.outlet) annotation (Line(
      points={{-220,-60},{-220,-81},{-220,-75},{-222.5,-75}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-400,-160},{400,160}}, grid={1,1})), Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end GasBoilerOLSystem2;
