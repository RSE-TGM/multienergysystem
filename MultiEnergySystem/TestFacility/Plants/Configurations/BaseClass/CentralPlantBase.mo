within MultiEnergySystem.TestFacility.Plants.Configurations.BaseClass;
partial model CentralPlantBase
  "Base Case considering rack CD and the pipelines connecting to the loads"

  //Constants
  parameter Real pi = Modelica.Constants.pi;

  //General parameters of pipes
  parameter Integer n = 2 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Types.Temperature T_start_cold=T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_hot=T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start=15 + 273.15;

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_total=2.5;

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start_Users=
      m_flow_total/4;

  parameter Real rL2L3cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL3L4cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL5L6cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL6L7cold_mflow_start(unit = "m3/h") = 1;

  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_UsersValve=50000;

  // Rack CD
  parameter DistrictHeatingNetwork.Types.Length t_rCD=2e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rCD=72e-3;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD=1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD=1.60e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD_cold=1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD_cold=1.60e5;

    // Cold Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C1=10.8;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_C1=-0.3+1.3;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C2=2.85;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C3=0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C4=0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C5=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C6=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C7=1.2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C8=1.0;

    // Hot Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H1=1;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H2=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H3=2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H4=1.37;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H5=1.4;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H6=1.25;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H7=15;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_H7=1.8-0.3-2.2;

    // Cold Side L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_C=4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_C=3;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_C=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_C=3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_C=3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_C=1.8;
  parameter DistrictHeatingNetwork.Types.Length t_rL_C=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_C=51e-3;

    // Hot side Rack L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_H=4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_H=3;
  parameter DistrictHeatingNetwork.Types.Length h_rL3L4_FCVC01_H=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_H=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_H=3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_H=3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_H=1.8;
  parameter DistrictHeatingNetwork.Types.Length t_rL_H=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_H=51e-3;

  parameter DistrictHeatingNetwork.Types.Length t=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di=51e-3;
  parameter DistrictHeatingNetwork.Types.Length L_v=1;
  parameter DistrictHeatingNetwork.Types.Length L_RL2L3=4.53;
  parameter DistrictHeatingNetwork.Types.Length L_RL3L4=3.02;
  parameter DistrictHeatingNetwork.Types.Length L_RL4L5=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL5L6=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL6L7=3;

  parameter Real q_m3h_rackCold(unit = "m3/h") = q_m3h_S9;
  parameter Real q_m3h_rackHot(unit = "m3/h") = q_m3h_S9;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start=4.04;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start=1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start=3e5;

  // System S900

  parameter DistrictHeatingNetwork.Types.Pressure p_VE901=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9=p_VE901;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9=2.7e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_P901=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_P901=3.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9=17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9=17 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length L_S9=10;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL1=0.82;
  //parameter DistrictHeatingNetwork.Types.Length L_S9_PL2=2.3;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL2=0.5;
  parameter DistrictHeatingNetwork.Types.Length h_S9_PL2=0.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL3=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL4=0.65;
  parameter DistrictHeatingNetwork.Types.Length Di_S9=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S9=1.5e-3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9=4.04;
  parameter Real q_m3h_S9(unit = "m3/h") = 14;

  // Cooling System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users=3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users=2.5e5;
  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;

  // Valves Nominal Data
  parameter Real Kv_FCVC01(unit = "m3/h") = 30.55;
  parameter Real Kv_FCVC02(unit = "m3/h") = 30.55;

  parameter Boolean FV933_state = true;

  parameter Real FCV901theta[:,:] = [0, 1];
  parameter Real FCVC01theta[:,:] = [0, 1];
  parameter Real FCVC02theta[:,:] = [0, 1];

  //Pumps
  parameter Real P901omega[:,:] = [0, 2*3.141592654*40];
  parameter Real P901qm3h[:,:] = [0, 12];

  DistrictHeatingNetwork.Sources.SourcePressure VE901(p0=p_VE901, T0(
        displayUnit="K") = 30 + 273.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-849,131})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(
    Tin_start=DistrictHeatingNetwork.Data.PumpData.P901.Tin_start,
    Tout_start=DistrictHeatingNetwork.Data.PumpData.P901.Tout_start,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P901.hin_start,
    pin_start=pin_start_S9,
    pout_start=pout_start_S9,
    a=DistrictHeatingNetwork.Data.PumpData.P901.a,
    b=DistrictHeatingNetwork.Data.PumpData.P901.b,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P901.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P901.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P901.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P901.etanom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P901.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P901.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P901.headnommin,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P901.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P901.omeganom,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P901.qnom_inm3h,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3")=DistrictHeatingNetwork.Data.PumpData.P901.rhonom,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P901.qnommax_inm3h,
    use_in_omega=true)                                                   annotation (
    Placement(visible = true, transformation(                 extent={{-20.5,
            20.5},{20.5,-20.5}},                                                               rotation=90,
        origin={-757.5,74.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901(T_start=
        Tout_start_S9, p_start=pout_start_S9)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-755,166})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-755,181.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(T_start=Tout_start_S9, p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.75,4.75},{4.75,-4.75}},
        rotation=90,
        origin={-754.75,196.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(
    L=L_S9_PL3,
    t=t_S9,
    pin_start=pout_start_S9,
    Tin_start=Tout_start_S9,
    Tout_start=Tout_start_S9,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-757,146})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(T_start=Tin_start_S9, p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-809.75,200.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-810,162.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(
    L=L_S9_PL2,
    h=h_S9_PL2,
    t=t_S9,
    pin_start=pin_start_S9,
    Tin_start=Tin_start_S9,
    Tout_start=Tin_start_S9,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-808,101})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV901(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV901.Kv,
    dp_nom(displayUnit="Pa")=DistrictHeatingNetwork.Data.ValveData.FCV901.dp_nom,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV901.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV901.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S9,
    pin_start=pout_start_S9,
    q_m3h_start=q_m3h_S9)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-757,115})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV933(
    Kv=33,
    dp_nom=50000,
    Tin_start=T_start,
    pin_start=pin_start) annotation (Placement(visible=true,
        transformation(
        origin={-218,45},
        extent={{-5,5},{5,-5}},
        rotation=180)));

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVC02(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCVC02.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = T_start_hot,
    pin_start=200000,
    q_m3h_start=q_m3h_rackHot)
                      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={690,235})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVC01(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCVC01.Kv,
    dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
    Tin_start(displayUnit="K") = 60 + 273.15,
    pin_start=200000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={250,235})));
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
    hctype=hctype) "Pipe connecting the outlet of gas boiler and the outlet of electric boiler"
    annotation (Placement(transformation(
        extent={{-10.25,10.25},{10.25,-10.25}},
        rotation=180,
        origin={-267.75,44.75})));
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
        origin={-348,45})));
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
        origin={-428,45})));
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
        origin={-510,45})));
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
        origin={-588,45})));
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
        origin={-668,44.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(
    L=L_rCD_H7,
    h=h_rCD_H7,
    t=t_rCD,
    pin_start=pin_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    q_m3h_start=q_m3h_S9,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system"
    annotation (Placement(transformation(
        extent={{-10,10.25},{10,-10.25}},
        rotation=180,
        origin={-737,44.75})));
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
        origin={-337.25,5.25})));
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
        origin={-419.25,5.25})));
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
        origin={-459.25,5.25})));
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
        origin={-517.25,5.25})));
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
        origin={-557.25,5.25})));
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
        origin={-657.25,5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(
    L=L_rCD_C1,
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
        origin={-727.25,5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(
    L=L_S9,
    t=t_S9,
    pin_start=pin_start_Users + 0.01e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-50,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_hot(
    L=L_rL2L3_rL3L4_H,
    t=t_rL_H,
    pin_start=pin_start_Users,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={70,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(
    L=L_rL3L4_FCVC01_H,
    t=t_rL_H,
    pin_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={190,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_hot(
    L=L_FCVC01_rL4L5_H,
    t=t_rL_H,
    pin_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={290,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(
    L=L_rL4L5_rL5L6_H,
    t=t_rL_H,
    pin_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={410,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_hot(
    L=L_rL5L6_rL6L7_H,
    t=t_rL_H,
    pin_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={530,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(
    L=L_rL6L7_FCVC02_H,
    h=h_rL3L4_FCVC01_H,
    t=t_rL_H,
    pin_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di_rL_H,
    q_m3h_start=q_m3h_rackHot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={650,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(
    L=L_S9,
    t=t_S9,
    pin_start=pout_start_Users - 0.03e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-20,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_cold(
    L=L_rL2L3_rL3L4_C,
    t=t_rL_C,
    pin_start=pout_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={100,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(
    L=L_rL3L4_FCVC01_C,
    t=t_rL_C,
    m_flow_start=m_flow_start_Users*2,
    pin_start=pout_start_Users - 0.01e5,
    pout_start=pout_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={220,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_cold(
    L=L_FCVC01_rL4L5_C,
    t=t_rL_C,
    pin_start=pin_start_Users - 0.01e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={320,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(
    L=L_rL4L5_rL5L6_C,
    t=t_rL_C,
    pin_start=pout_start_Users,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={440,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_cold(
    L=L_rL5L6_rL6L7_C,
    t=t_rL_C,
    pin_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={560,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(
    L=L_rL6L7_FCVC02_C,
    t=t_rL_C,
    pin_start=pin_start_Users - 0.02e5,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di_rL_C,
    q_m3h_start=q_m3h_rackCold,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={660,265})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12(T_start=
        T_start_hot)
    "Flow sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{666,207},{674,199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA20 "Pressure sensor at the inlet of valve FCVC02"
    annotation (Placement(transformation(extent={{677,207},{685,199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTA19 "Pressure sensor at the outlet of valve FCVC02"
    annotation (Placement(transformation(extent={{678,263},{686,271}})));

  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA08
    "Pressure sensor at the inlet of valve FCVC01"
    annotation (Placement(transformation(extent={{220,207},{228,199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA07
    "Pressure sensor at the outlet of valve FCVC01"
    annotation (Placement(transformation(extent={{234,263},{242,271}})));
equation
  connect(rackL3L4_FCVC01_cold.outlet, rackL2L3_rackL3L4_cold.inlet)
    annotation (Line(
      points={{210,265},{110,265}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL2L3_rackL3L4_hot.outlet, rackL3L4_FCVC01_hot.inlet) annotation (
      Line(
      points={{80,205},{180,205}},
      color={140,56,54},
      thickness=0.5));

  connect(S900_rackL3L4_hot.outlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{-40,205},{60,205}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.outlet,PT902. inlet) annotation (Line(
      points={{-757,169},{-757,181.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet,TT902. inlet) annotation (Line(
      points={{-757,181.5},{-757,194.875},{-756.65,194.875},{-756.65,196.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FT901.inlet,PL4_S901. outlet) annotation (Line(
      points={{-757,163},{-757,156}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet,PT901. inlet) annotation (Line(
      points={{-808,111},{-808,162.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet,TT901. inlet) annotation (Line(
      points={{-808,162.5},{-808,167.375},{-807.85,167.375},{-807.85,200.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.outlet,PL4_S901. inlet) annotation (Line(
      points={{-757,125},{-757,136}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet,FCV901. inlet) annotation (Line(
      points={{-757.5,90.9},{-757.5,98.15},{-757,98.15},{-757,105}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, S900_rackL3L4_hot.inlet) annotation (Line(
      points={{-756.65,196.25},{-756.65,205},{-60,205}},
      color={140,56,54},
      thickness=0.5));
  connect(TT901.inlet,S900_rackL2L3_cold. outlet) annotation (Line(
      points={{-807.85,200.25},{-807.85,265},{-30,265}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{250,245},{250,265},{230,265}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S400_S300.outlet, rackCD_Hot_S300_S500.inlet) annotation (
      Line(
      points={{-358,45},{-418,45}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S300_S500.outlet, rackCD_Hot_S500_SXXX.inlet) annotation (
      Line(
      points={{-438,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S500_SXXX.outlet, rackCD_Hot_SXXX_SYYY.inlet) annotation (
      Line(
      points={{-520,45},{-578,45}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SXXX_SYYY.outlet, rackCD_Hot_SYYY_S200.inlet) annotation (
      Line(
      points={{-598,45},{-627.5,45},{-627.5,44.75},{-658,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S100_S400.outlet, rackCD_Hot_S400_S300.inlet) annotation (
      Line(
      points={{-278,44.75},{-308,44.75},{-308,45},{-338,45}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.inlet, rackCD_Cold_S300_S400.outlet)
    annotation (Line(
      points={{-348,5.25},{-408.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_SYYY_S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (
      Line(
      points={{-678,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (Line(
      points={{-747,44.75},{-757.5,44.75},{-757.5,58.1}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, rackCD_Cold_S900_S200.inlet) annotation (Line(
      points={{-808,91},{-808,5.25},{-738,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S900_S200.outlet, rackCD_Cold_S200_S500.inlet)
    annotation (Line(
      points={{-716.5,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S200_S500.outlet, rackCD_Cold_S500_S500.inlet)
    annotation (Line(
      points={{-646.5,5.25},{-568,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S500.outlet, rackCD_Cold_S500_S300.inlet)
    annotation (Line(
      points={{-546.5,5.25},{-528,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S500_S300.outlet, rackCD_Cold_S300_S300.inlet)
    annotation (Line(
      points={{-506.5,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S300_S300.outlet, rackCD_Cold_S300_S400.inlet)
    annotation (Line(
      points={{-448.5,5.25},{-430,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_hot.outlet, FCVC01_rackL4L5_hot.inlet) annotation (
      Line(
      points={{200,205},{280,205}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_rackL4L5_hot.outlet, rackL4L5_rackL5L6_hot.inlet) annotation (
      Line(
      points={{300,205},{400,205}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01.inlet, FCVC01_rackL4L5_hot.inlet) annotation (Line(
      points={{250,225},{250,205},{280,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_hot.outlet, rackL5L6_rackL6L7_hot.inlet)
    annotation (Line(
      points={{420,205},{520,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL5L6_rackL6L7_hot.outlet, rackL6L7_FCVC02_hot.inlet) annotation (
      Line(
      points={{540,205},{640,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (Line(
      points={{660,205},{666,205},{666,204.6},{667.6,204.6}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (Line(
      points={{670,265},{690,265},{690,245}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA19.inlet, rackL6L7_FCVC02_cold.inlet) annotation (Line(
      points={{682,265.4},{675,265.4},{675,265},{670,265}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.inlet, rackL5L6_rackL6L7_cold.outlet)
    annotation (Line(
      points={{450,265},{550,265}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL5L6_rackL6L7_cold.inlet, rackL6L7_FCVC02_cold.outlet)
    annotation (Line(
      points={{570,265},{650,265}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.outlet, FCVC01_rackL4L5_cold.inlet)
    annotation (Line(
      points={{430,265},{330,265}},
      color={140,56,54},
      thickness=0.5));
  connect(FTA12.outlet, FCVC02.inlet) annotation (Line(
      points={{672.4,204.6},{690,204.6},{690,225}},
      color={140,56,54},
      thickness=0.5));
  connect(FTA12.outlet, PTA20.inlet) annotation (Line(
      points={{672.4,204.6},{681,204.6}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_hot.outlet, PTA08.inlet) annotation (Line(
      points={{200,205},{212,205},{212,204.6},{224,204.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01.outlet, PTA07.inlet) annotation (Line(
      points={{250,245},{250,265},{238,265.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVC01_rackL4L5_cold.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
      Line(
      points={{310,265},{230,265}},
      color={140,56,54},
      thickness=0.5));
  connect(S900_rackL2L3_cold.inlet, rackL2L3_rackL3L4_cold.outlet) annotation (
      Line(
      points={{-10,265},{90,265}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet, PT901.inlet) annotation (Line(
      points={{-839,131},{-808,131},{-808,162.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{-223,45},{-237.75,45},{-237.75,44.75},{-257.5,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.outlet, FV933.inlet) annotation (Line(
      points={{-326.5,5.25},{-200,5.25},{-200,45},{-213,45}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-900,-500},{900,320}}), graphics={
        Text(
          extent={{-20,217},{40,179}},
          textColor={28,108,200},
          textString="RackL2L3_hot"),
        Text(
          extent={{10,291},{70,251}},
          textColor={28,108,200},
          textString="RackL2L3_cold"),
        Text(
          extent={{-590,105},{-460,67}},
          textColor={28,108,200},
          textString="Rack C/D"),
        Text(
          extent={{100,217},{160,179}},
          textColor={28,108,200},
          textString="RackL3L4_hot"),
        Text(
          extent={{320,217},{380,179}},
          textColor={28,108,200},
          textString="RackL4L5_hot"),
        Text(
          extent={{442,217},{502,179}},
          textColor={28,108,200},
          textString="RackL5L6_hot"),
        Text(
          extent={{558,217},{618,179}},
          textColor={28,108,200},
          textString="RackL6L7_hot"),
        Text(
          extent={{130,291},{190,251}},
          textColor={28,108,200},
          textString="RackL3L4_cold"),
        Text(
          extent={{350,291},{410,251}},
          textColor={28,108,200},
          textString="RackL4L5_cold"),
        Text(
          extent={{470,291},{530,251}},
          textColor={28,108,200},
          textString="RackL5L6_cold")}),                                   Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end CentralPlantBase;
