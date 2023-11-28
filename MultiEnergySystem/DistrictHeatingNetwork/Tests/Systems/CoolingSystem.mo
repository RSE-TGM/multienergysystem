within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model CoolingSystem
  "Users Systems and some pipelines connected on the heating side"

  parameter Integer n = 3 "Number of volumes";
  parameter Real m_flow_factor = 0.5;
  parameter Types.MassFlowRate m_flow_total = 1.6;

  parameter Integer gammahotovercold_factor = 1;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;


  // Pressures
  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Pressure pin_start_Source = 2e5;
  parameter Types.Pressure pout_start_Source = 1.8e5;

  parameter Types.Pressure pin_start_Cool = 0.92e5;
  parameter Types.Pressure pout_start_Cool = 0.92e5;
  parameter Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter Types.Pressure pout_start_PR01 = 2e5;

  parameter Types.Temperature Tin_start_Cool = 35 + 273.15;
  parameter Types.Temperature Tout_start_Cool = 25 + 273.15;


  parameter Types.Temperature T_start_SourceIn = 80 + 273.15;
  parameter Types.Temperature T_start_SourceOut = 60 + 273.15;
  parameter Types.MassFlowRate m_flow_Source_total = 2.4095388;
  final parameter Types.MassFlowRate  m_flow_Source = m_flow_Source_total/4;

  parameter Types.Temperature T_start_UserIn = 7 + 273.15;
  parameter Types.MassFlowRate m_flow_Users_total = 5.553528*3600/1000;
  final parameter Types.MassFlowRate m_flow_Users = m_flow_Users_total/4;

  parameter Real q_m3h(unit = "m3/h") = 8*3600/1000;

  parameter Types.Power Pchiller = -148751;
  parameter Types.Power Pchillervar = 0;

  parameter Types.Length L_Users = 3;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Users = 1.5e-3;

  parameter Types.Length t_RR = 1.5e-3;
  parameter Types.Length Di_RR = 85e-3;
  parameter Types.MassFlowRate m_flow_Cool = 8.88;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state";


  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];
  parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];

  parameter Real PR01omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];

  // Lengths of pipelines source side
  parameter Types.Length L_VER901_FCVR01 = 1;
  parameter Types.Length h_VER901_FCVR01 = -0.9;
  parameter Types.Length L_FCVR01_FTR03 = 2.6;
  parameter Types.Length h_FCVR01_FTR03 = 2.170;
  parameter Types.Length L_FTR03_PTR01 = 1;
  parameter Types.Length h_FTR03_PTR01 = 0.265;
  parameter Types.Length L_PTR01_FTR01 = 1.85+0.50;
  parameter Types.Length h_PTR01_FTR01 = -1.8;
  parameter Types.Length L_FTR01_RR01 = 0.72;
  parameter Types.Length h_FTR01_RR01 = -0.72;
  parameter Types.Length L_RR01_PR01 = 1.275;
  parameter Types.Length h_RR01_PR01 = 0.000;
  parameter Types.Length L_PR01_PTR02 = 0.425+1.242+0.850;
  parameter Types.Length h_PR01_PTR02 = 1.242;
  parameter Types.Length L_TTR02_VER901 = 1.062;
  parameter Types.Length h_TTR02_VER901 = 0;


  // Internal diameters & thickness
  parameter Types.Length t_Source = 1.5e-3;
  parameter Types.Length Di_Source = 32e-3;

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={290,210},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-221,66.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX711(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-131,67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-41,67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=5,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={49,66.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-240,-60})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-150,-60})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-59})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_HotOut(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,-59})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_HotOut_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-200,-90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_HotOut_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-110,-90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-19,-90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-200,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-110,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-20,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_ColdSide_ColdIn(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={70,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_ColdSide_ColdIn_PL711(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-180,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL711_ColdSide_ColdIn_PL721(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*2,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-80,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn_PL731(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={10,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    PR01(
    Tin_start(displayUnit="K") = Tout_start_Cool,
    Tout_start(displayUnit="K") = Tout_start_Cool,
    a=Pump.PR01.a,
    b=Pump.PR01.b,
    m_flow_start=m_flow_Cool,
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
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={150,75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV701(
      Kv=Valve.TCV701.Kv,
      dp_nom=Valve.TCV701.dp_nom,
      rho_nom=Valve.TCV701.rho_nom,
      Tin_start=Valve.TCV701.Tin_start,
      pin_start=Valve.TCV701.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-240,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV711(
      Kv=Valve.TCV711.Kv,
      dp_nom=Valve.TCV711.dp_nom,
      rho_nom=Valve.TCV711.rho_nom,
      Tin_start=Valve.TCV711.Tin_start,
      pin_start=Valve.TCV711.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-150,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV721(
      Kv=Valve.TCV721.Kv,
      dp_nom=Valve.TCV721.dp_nom,
      rho_nom=Valve.TCV721.rho_nom,
      Tin_start=Valve.TCV721.Tin_start,
      pin_start=Valve.TCV721.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-60,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV731(
      Kv=Valve.TCV731.Kv,
      dp_nom=Valve.TCV731.dp_nom,
      rho_nom=Valve.TCV731.rho_nom,
      Tin_start=Valve.TCV731.Tin_start,
      pin_start=Valve.TCV731.pin_start) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={30,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVR01(
    Kv=15,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={200,-30})));
  Sources.SinkPressure VER901(p0=200000, T0(displayUnit="K") = 30 + 273.15)
    "Expansion Vessel for cooling circuit" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={120,10})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{-274,-10},{-254,10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-242,36})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-202,35})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{-185,-10},{-165,10}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{-95,-10},{-75,10}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{241,10},{221,30}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-113,37})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-23,39})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={67,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-152,37})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-62,38})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={28,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_VER901_FCVR01(
    L=L_VER901_FCVR01,
    h=h_VER901_FCVR01,
    t=t_RR,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={170,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FCVR01_FTR03(
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
    t=t_RR,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={230,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={250,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_PTR01_FTR01(
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,60})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={262,25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={262,35})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={262,85})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FTR01_RR01(
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_RR01_PR01(
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={150,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={147,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={147,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={150,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={150,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV SR00_PL_FTR03_PTR01(
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    m_flow_start=m_flow_Cool,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.02e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_ColdIn_PL3(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={90,-30})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{110,70},{130,90}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_ColdSide_HotOut_PL1(
    L=L_Users,
    t=t_Users,
    m_flow_start=m_flow_Users*3,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.01e5,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={70,-90})));
  Sources.SourceMassFlow sourceHot(
    p0=280000,
    T0(displayUnit="K") = 80 + 273.15,
    m_flow0=m_flow_total) annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={-241,138})));
  Sources.SinkPressure sinkHot(p0=200000, T0=(60 + 273.15) + 273.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-203,139})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(Tout_cold_set=Tout_start_Cool,
    dp_cold_start=20000,                m_flow_cold_start=m_flow_Cool)
    annotation (Placement(transformation(extent={{170,134},{241,205}})));
equation
  connect(PL701_ColdSide_HotOut.outlet, PL701_ColdSide_HotOut_PL711.inlet)
    annotation (Line(
      points={{-240,-70},{-240,-90},{-210,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_HotOut_PL711.outlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-190,-90},{-150,-90},{-150,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_HotOut_PL721.inlet, PL711_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-120,-90},{-150,-90},{-150,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut.outlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{-60,-69},{-60,-90},{-100,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.inlet, PL711_ColdSide_HotOut_PL721.outlet)
    annotation (Line(
      points={{-29,-90},{-100,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL731.outlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{-9,-90},{30,-90},{30,-69}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.incold, PL701_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-200.7,57.75},{-200.7,33},{-200,33},{-200,10}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.incold, PL711_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-110.7,58.75},{-110.7,22.875},{-110,22.875},{-110,11}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, PL721_ColdSide_ColdIn.outlet) annotation (Line(
      points={{-20.7,58.75},{-20.7,21.875},{-20,21.875},{-20,10}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, PL731_ColdSide_ColdIn.outlet) annotation (Line(
      points={{69.3,57.75},{69.3,30.375},{70,30.375},{70,10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_ColdSide_ColdIn_PL711.outlet, PL701_ColdSide_ColdIn.inlet)
    annotation (Line(
      points={{-190,-30},{-200,-30},{-200,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn.inlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-110,-9},{-110,-30},{-170,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_ColdSide_ColdIn_PL721.outlet, PL701_ColdSide_ColdIn_PL711.inlet)
    annotation (Line(
      points={{-90,-30},{-170,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn.inlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{-20,-10},{-20,-30},{-70,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL731.outlet, PL711_ColdSide_ColdIn_PL721.inlet)
    annotation (Line(
      points={{0,-30},{-70,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_ColdSide_ColdIn.inlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{70,-10},{70,-30},{20,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold, TCV701.inlet) annotation (Line(
      points={{-241.3,57.75},{-240,57.75},{-240,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL701_ColdSide_HotOut.inlet) annotation (Line(
      points={{-240,-10},{-240,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TCV711.inlet) annotation (Line(
      points={{-151.3,58.75},{-150,58.75},{-150,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL711_ColdSide_HotOut.inlet) annotation (Line(
      points={{-150,-10},{-150,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TCV721.inlet) annotation (Line(
      points={{-61.3,58.75},{-60,58.75},{-60,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL721_ColdSide_HotOut.inlet) annotation (Line(
      points={{-60,-10},{-60,-49}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TCV731.inlet) annotation (Line(
      points={{28.7,57.75},{28.7,58},{30,58},{30,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL731_ColdSide_HotOut.inlet) annotation (Line(
      points={{30,-10},{30,-49}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{-253,0},{-248,0}},     color={0,0,127}));
  connect(EX701.incold, TT703.inlet) annotation (Line(
      points={{-200.7,57.75},{-200.7,37},{-199.6,37},{-199.6,35}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening, TCV711_theta.y)
    annotation (Line(points={{-158,0},{-164,0}},   color={0,0,127}));
  connect(EX701.outcold, TT704.inlet) annotation (Line(
      points={{-241.3,57.75},{-239.6,57.75},{-239.6,36}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.opening, TCV721_theta.y)
    annotation (Line(points={{-68,0},{-74,0}},   color={0,0,127}));
  connect(TCV731.opening, TCV731_theta.y)
    annotation (Line(points={{22,0},{15,0}},       color={0,0,127}));
  connect(EX711.incold, TT713.inlet) annotation (Line(
      points={{-110.7,58.75},{-110.7,47.875},{-110.6,47.875},{-110.6,37}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold, TT723.inlet) annotation (Line(
      points={{-20.7,58.75},{-20.7,48.875},{-20.6,48.875},{-20.6,39}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold, TT733.inlet) annotation (Line(
      points={{69.3,57.75},{69.3,48.875},{69.4,48.875},{69.4,40}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold, TT714.inlet) annotation (Line(
      points={{-151.3,58.75},{-150,58.75},{-149.6,37}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold, TT724.inlet) annotation (Line(
      points={{-61.3,58.75},{-60,58.75},{-59.6,38}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{28.7,57.75},{28.7,58},{30,58},{30.4,40}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_VER901_FCVR01.outlet, FCVR01.inlet) annotation (Line(
      points={{180,-30},{190,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_RR01_PR01.outlet, PR01.inlet) annotation (Line(
      points={{150,100},{150,85.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, SR00_PL_PR01_PTR02.inlet) annotation (Line(
      points={{150,64.6},{150,50}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_PR01_PTR02.outlet, PTR02.inlet) annotation (Line(
      points={{150,30},{150,25},{149.4,25},{149.4,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet, TTR02.inlet) annotation (Line(
      points={{149.4,20},{149.4,10}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet, SR00_PL_TTR02_VER901.inlet) annotation (Line(
      points={{149.4,10},{149.4,5},{150,5},{150,0}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_TTR02_VER901.outlet, SR00_PL_VER901_FCVR01.inlet) annotation (
     Line(
      points={{150,-20},{150,-30},{160,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet, SR00_PL_FCVR01_FTR03.inlet) annotation (Line(
      points={{210,-30},{220,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_FCVR01_FTR03.outlet, FTR03.inlet) annotation (Line(
      points={{240,-30},{247,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, SR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{253,-30},{260,-30},{260,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet, PTR01.inlet) annotation (Line(
      points={{259.6,25},{259.6,35}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet, SR00_PL_PTR01_FTR01.inlet) annotation (Line(
      points={{259.6,35},{259.6,42.5},{260,42.5},{260,50}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_PTR01_FTR01.outlet, FTR01.inlet) annotation (Line(
      points={{260,70},{260,82}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,SR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{260,88},{260,100}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y, FCVR01.opening)
    annotation (Line(points={{220,20},{200,20},{200,-22}}, color={0,0,127}));
  connect(PL721_ColdSide_ColdIn_PL3.outlet, PL721_ColdSide_ColdIn_PL731.inlet)
    annotation (Line(
      points={{80,-30},{20,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_ColdIn_PL3.inlet, SR00_PL_VER901_FCVR01.inlet)
    annotation (Line(
      points={{100,-30},{160,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_omega.y, PR01.in_omega) annotation (Line(points={{131,80},{137.25,
          80},{137.25,80.2},{143.5,80.2}}, color={0,0,127}));
  connect(PL721_ColdSide_HotOut_PL1.inlet, PL731_ColdSide_HotOut.outlet)
    annotation (Line(
      points={{60,-90},{30,-90},{30,-69}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_ColdSide_HotOut_PL1.outlet, SR00_PL_FTR03_PTR01.inlet)
    annotation (Line(
      points={{80,-90},{260,-90},{260,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, EX701.inhot) annotation (Line(
      points={{-241,125},{-241.3,125},{-241.3,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, EX711.inhot) annotation (Line(
      points={{-241,125},{-241,98},{-151.3,98},{-151.3,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot.outlet, EX721.inhot) annotation (Line(
      points={{-241,125},{-241,98},{-61.3,98},{-61.3,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, EX701.outhot) annotation (Line(
      points={{-203,129},{-203,90},{-186,90},{-186,75.25},{-200.7,75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot.inlet, EX711.outhot) annotation (Line(
      points={{-203,129},{-203,112},{-110.7,112},{-110.7,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot, EX711.outhot) annotation (Line(
      points={{-20.7,76.25},{-20.7,112},{-110.7,112},{-110.7,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot, EX711.outhot) annotation (Line(
      points={{69.3,75.25},{69.3,112},{-110.7,112},{-110.7,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.inhot, EX721.inhot) annotation (Line(
      points={{28.7,75.25},{28.7,98},{-61.3,98},{-61.3,76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet, SR00_PL_FTR03_PTR01.outlet) annotation (Line(
      points={{259.6,25},{260,25},{260,-3.55271e-15}},
      color={140,56,54},
      thickness=0.5));
  connect(VER901.inlet, SR00_PL_VER901_FCVR01.inlet) annotation (Line(
      points={{120,0},{120,-30},{160,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(SR00_PL_FTR01_RR01.outlet, RR01.incold) annotation (Line(
      points={{260,120},{260,131},{227,131},{227,148.2},{226.8,148.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold, SR00_PL_RR01_PR01.inlet) annotation (Line(
      points={{184.2,148.2},{184.2,130},{150,130},{150,120}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-300,-220},{300,220}}, grid={1,1})),
      experiment(StopTime=300, __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-300,-220},{300,220}}, grid={1,1})));
end CoolingSystem;
