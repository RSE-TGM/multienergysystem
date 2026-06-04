within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR00_CL
  extends Modelica.Icons.Example;



  parameter Integer n = 3 "Number of volumes";
  parameter Types.MassFlowRate m_flow_total = 2.4;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;


  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=
      EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

  // EX711
  parameter Real EX711_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=
      EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;

  // EX721
  parameter Real EX721_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=
      EX721_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15;

  // EX731
  parameter Real EX731_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=0.5*1000/
      3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;


  //1. Cooling System

  parameter Types.Pressure pin_start_Cool = 0.92e5;
  parameter Types.Pressure pout_start_Cool = 0.92e5;
  parameter Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter Types.Pressure pout_start_PR01 = 2e5;
  parameter Types.Temperature Tin_start_Cool = 16 + 273.15;
  parameter Types.Temperature Tout_start_Cool = 8 + 273.15;
  parameter Types.MassFlowRate m_flow_Cool = 8.88;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter Types.Length t_RR = 1.5e-3;
  parameter Types.Length Di_RR = 85e-3;
  parameter Real Kvalve(unit = "m3/h") = 90;
  parameter Types.PerUnit cf = 4e-3;
  parameter Types.Pressure dp_RR01 = 0.5e5;
  parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];
  parameter Real PR01omega[:,:] = [0, 2*3.141592653*50; 100, 2*3.141592653*50];
  parameter Real PTR01_profile[:,:] = [0, 1.23e5; 1780, 1.23e5; 1780, 1.03e5; 3000, 1.03e5];
  parameter Real TTR01_profile[:,:] = [0, 16 + 273.15; 500, 16 + 273.15; 1000, 25 + 273.15; 3000, 16 + 273.15; 4000, 16 + 273.15];
  parameter Real TTRSP_profile[:,:] = [0, 15 + 273.15; 3000, 15 + 273.15];
  parameter Real PTR02_profile[:,:] = [0, 2.2e5; 3000, 2.2e5];

  //2. Users System
  parameter Types.Pressure pin_start_Users = 3e5;
  parameter Types.Pressure pout_start_Users = 2.5e5;
  parameter Types.Temperature T_start_UserIn = 7 + 273.15;
  parameter Real q_Users_total(unit = "m3/h") = 20;
  parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
  parameter Types.Length t_Users = 1.5e-3;
  parameter Types.Length Di_Users = 32e-3;
  parameter Types.Length t_Rack = 1.5e-3;
  parameter Types.Length Di_Rack = 51e-3;
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

   // Lengths of pipelines source side
  parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
  parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8;
  parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
  parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35;
  parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
  parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
  parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
  parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
  parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
  parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
  parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
  parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
  parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
  parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1;
  parameter DistrictHeatingNetwork.Types.Length L_TTR02_VER901=0.43;
  parameter DistrictHeatingNetwork.Types.Length h_TTR02_VER901=0;

  parameter DistrictHeatingNetwork.Types.Length L_UsersIn_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersIn_EX721=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_cold=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_cold=0.50*1;

  parameter DistrictHeatingNetwork.Types.Length L_UsersOut_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersOut_EX721=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_hot=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_hot=0;

  parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.85;
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.85; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.80;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.80; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=1.25;//0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=1.25; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.40; //0.65;

  parameter DistrictHeatingNetwork.Types.Length L_TCV701_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV701_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV711_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV711_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV721_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV721_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV731_rUsersOut=1 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_TCV731_rUsersOut=1;

  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT703=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT703=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT713=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT713=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT723=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT723=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT733=1.65 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT733=-1.65*0.1;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersIn=0.8 + 1.2 + 0.5 + 2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersIn=0.8 + 0.6;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersOut=2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersOut=0;


  parameter Real m_flow_Cool_approx[:, :] = [0, 6; 1E3, 6];


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
    headnom=Pump.PR01.headnom,
    qnom_inm3h=Pump.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.PR01.rhonom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_in_omega=true)                           annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={277,40})));
  Sources.SinkPressure PTR02_Source(
    use_in_p0=true,
    p0=220000,
    T0(displayUnit="K") = 14.76 + 273.15,
    R=1E-3)                                                                       "Reference pressure at PTR02"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={235,-35})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PTR01_FTR01(
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={389,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={389,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={389,50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR01_RR01(
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_RR01_PR01(
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={277,75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={274,-35})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={274,-25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={277,-5})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{237,35},{257,55}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)
             "Chiller"
    annotation (Placement(transformation(extent={{297,101},{367,171}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{405,33},{446,68}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_6(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{408,-27},{449,8}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_7(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{257,-15},{216,20}})));
  Modelica.Blocks.Sources.TimeTable PTR02_TimeTable(table=PTR02_profile)
                                                                     annotation (Placement(transformation(extent={{197,-50},{217,-30}})));
  Modelica.Blocks.Sources.TimeTable TTSP_TimeTable(table=TTRSP_profile) annotation (Placement(transformation(extent={{366,166},{346,186}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working"
    annotation (Placement(transformation(extent={{257,126},{277,146}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX701(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-361,34.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-338,104})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT702(T_start=EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-382,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-382,98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX711(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-59,31.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-38,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT712(T_start=EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX721(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.8257757,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.8257757,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={99,31.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={122,106})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT722(T_start=EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={78,98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX731(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=TestFacility.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=TestFacility.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=TestFacility.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=TestFacility.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=TestFacility.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=TestFacility.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-201,32.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,88})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-178,102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT732(T_start=EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-222,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-222,98})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV731(
    Kv=TestFacility.Data.ValveData.TCV731.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV731.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV731.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV731.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV731.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV731.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-220,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-222.5,-19.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT734_TCV731(
    L=L_TT734_TCV731,
    h=h_TT734_TCV731,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-220,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT703(
    L=L_rUsersIn_TT703,
    h=h_rUsersIn_TT703,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-340,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT723(
    L=L_rUsersIn_TT723,
    h=h_rUsersIn_TT723,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={120,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV721(
    Kv=TestFacility.Data.ValveData.TCV721.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV721.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV721.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={79.5,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT723(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={117,-21})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={78,-22})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT724_TCV721(
    L=L_TT724_TCV721,
    h=h_TT724_TCV721,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-40,-69})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV711(
    Kv=TestFacility.Data.ValveData.TCV711.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV711.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV711.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV711.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV711.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV711.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-80,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT713(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-43,-18})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-82,-18})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT714_TCV711(
    L=L_TT714_TCV711,
    h=h_TT714_TCV711,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV701(
    Kv=TestFacility.Data.ValveData.TCV701.Kv,
    dp_nom=TestFacility.Data.ValveData.TCV701.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=TestFacility.Data.ValveData.TCV701.Tin_start,
    pin_start=TestFacility.Data.ValveData.TCV701.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-380,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-382,-19})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TT704_TCV701(
    L=L_TT704_TCV701,
    h=h_TT704_TCV701,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-380,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT703(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-344,-14})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_rackUsersIn_TT733(
    L=L_rUsersIn_TT733,
    h=h_rUsersIn_TT733,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=m_flow_Cool_approx[1, 1]/4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-180,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT733(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-183,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX721_EX711_cold(
    L=L_EX721_EX711_cold,
    h=h_EX721_EX711_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={8,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX701_EX731_cold(
    L=L_EX701_EX731_cold,
    h=h_EX701_EX731_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-120,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX711_EX701_cold(
    L=L_EX711_EX701_cold,
    h=h_EX711_EX701_cold,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-280,-111})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV701_rackUsersOut(
    L=L_TCV701_rUsersOut,
    h=h_TCV701_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-380,-128})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV731_rackUsersOut(
    L=L_TCV731_rUsersOut,
    h=h_TCV731_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-220,-128})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX711_EX701_hot(
    L=L_EX711_EX701_hot,
    h=h_EX711_EX701_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-160,-150})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV711_rackUsersOut(
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-128})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX721_EX711_hot(
    L=L_EX721_EX711_hot,
    h=h_EX721_EX711_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=3*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={0,-150})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_EX701_EX731_hot(
    L=L_EX701_EX731_hot,
    h=h_EX701_EX731_hot,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=2*q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-310,-150})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_TCV721_rackUsersOut(
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={80,-129})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_UsersIn_EX721(
    L=L_UsersIn_EX721,
    h=h_UsersIn_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={144,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
                                                        PL_UsersOut_EX721(
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=m_flow_Cool_approx[1, 1],
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={119,-150})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)     annotation (Placement(transformation(extent={{-422,-80},{-402,-60}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)     annotation (Placement(transformation(extent={{-262,-80},{-242,-60}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)     annotation (Placement(transformation(extent={{-121,-80},{-101,-60}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)     annotation (Placement(transformation(extent={{39,-80},{59,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCVR01(
    Kv=Kvalve,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = 2.77476e5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={327,-107})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_VER901_FCVR01(
    L=L_VER901_FCVR01,
    h=h_VER901_FCVR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={297,-107})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FCVR01_FTR03(
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={357,-107})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=0,
        origin={377,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={275,-85})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR03_PTR01(
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n,
    cf=cf)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={387,-87})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{362,-85},{342,-65}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{202,-120},{182,-100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{182,-162},{202,-142}})));
protected
  Modelica.Blocks.Sources.TimeTable EX701_T(table=[0,EX701_Tin_hot; 1E4,EX701_Tin_hot])
    annotation (Placement(transformation(extent={{-434,214},{-414,234}})));
  Modelica.Blocks.Sources.TimeTable EX711_T(table=[0,EX711_Tin_hot; 1E4,EX711_Tin_hot])
    annotation (Placement(transformation(extent={{-142,214},{-122,234}})));
  Modelica.Blocks.Sources.TimeTable EX721_T(table=[0,EX721_Tin_hot; 1E4,EX721_Tin_hot])
    annotation (Placement(transformation(extent={{18,208},{38,228}})));
  Modelica.Blocks.Sources.TimeTable EX731_T(table=[0,EX731_Tin_hot; 1E4,EX731_Tin_hot])
    annotation (Placement(transformation(extent={{-284,214},{-264,234}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow(table=[0,m_flow_EX731_cold; 1E4,m_flow_EX731_cold])
    annotation (Placement(transformation(extent={{-146,170},{-166,190}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow(table=[0,m_flow_EX711_cold; 1E4,m_flow_EX711_cold])
    annotation (Placement(transformation(extent={{4,168},{-16,188}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow(table=[0,m_flow_EX721_cold; 1E4,m_flow_EX721_cold])
    annotation (Placement(transformation(extent={{168,168},{148,188}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow(table=[0,m_flow_EX701_cold; 1E4,m_flow_EX701_cold])
    annotation (Placement(transformation(extent={{-298,168},{-318,188}})));
  Sources.SourcePressure sourceP0(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-418,128},{-398,148}})));
  Sources.SourcePressure sourceP1(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-118,128},{-98,148}})));
  Sources.SourcePressure sourceP2(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{42,128},{62,148}})));
  Sources.SourcePressure sourceP3(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-256,128},{-236,148}})));
  Sources.SinkMassFlow                        sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-174,128},{-154,148}})));
  Sources.SinkMassFlow                        sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-30,128},{-10,148}})));
  Sources.SinkMassFlow                        sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{134,128},{154,148}})));
  Sources.SinkMassFlow                        sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-332,128},{-312,148}})));
  inner MultiEnergySystem.System system
    annotation (Placement(transformation(extent={{410,442},{430,462}})));
equation
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{277,65},{277,50.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{277,29.6},{277,5}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{277,-15},{277,-20},{276.4,-20},{276.4,-25}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{276.4,-25},{276.4,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{386.6,-20},{386.6,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{386.6,-10},{386.6,7.5},{387,7.5},{387,15}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{387,35},{387,47}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{387,53},{387,65}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{387,85},{387,96},{353,96},{353,115}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold,RR00_PL_RR01_PR01. inlet) annotation (Line(
      points={{311,115},{311,95},{277,95},{277,85}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr,FTR01_. numberPort) annotation (Line(points={{395.5,50},{398.712,50},{398.712,50.5},{401.925,50.5}},
                                                       color={0,0,127}));
  connect(PTR01.p,FTR01_6. numberPort) annotation (Line(points={{396.8,-10},{400.862,-10},{400.862,-9.5},{404.925,-9.5}},
                                                      color={0,0,127}));
  connect(FTR01_7.numberPort,PTR02. p) annotation (Line(points={{260.075,2.5},{266.2,2.5},{266.2,-25}},
                                    color={0,0,127}));
  connect(PR01_omega.y,PR01. in_omega) annotation (Line(points={{258,45},{264.25,45},{264.25,45.2},{270.5,45.2}},
                                           color={0,0,127}));
  connect(PTR02_Source.inlet,TTR02. inlet) annotation (Line(
      points={{235,-45},{235,-53},{276.4,-53},{276.4,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02_TimeTable.y,PTR02_Source. in_p0) annotation (Line(points={{218,-40},{226.6,-40},{226.6,-39}},    color={0,0,127}));
  connect(TTSP_TimeTable.y,RR01. in_Tout_cold_set) annotation (Line(points={{345,176},{332,176},{332,160.5}},color={0,0,127}));
  connect(RR101_Status.y,RR01. cold_on) annotation (Line(points={{278,136},{293.5,136}}, color={255,0,255}));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-380,58},{-380,98}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{-80,58},{-80,98}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-340,104},{-340,90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-340,90},{-340,77}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{-40,106},{-40,92}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{-40,79},{-40,92}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{80,58},{80,98}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-220,58},{-220,98}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{120,106},{120,92}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{120,79},{120,92}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-180,102},{-180,88}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-180,88},{-180,75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{-220,-30},{-220,-25},{-220.3,-25},{-220.3,-19.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{-220,-60},{-220,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{-80,-50},{-80,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet,TT713. inlet) annotation (Line(
      points={{-40,-59},{-40,-38.5},{-40.6,-38.5},{-40.6,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{-380,-50},{-380,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet,TT703. inlet) annotation (Line(
      points={{-340,-30},{-340,-22},{-341.6,-22},{-341.6,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{80,-50},{80,-55},{79.5,-55},{79.5,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-2,-110},{-40,-110},{-40,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.inlet,PL_rackUsersIn_TT723. inlet) annotation (
      Line(
      points={{18,-110},{120,-110},{120,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.inlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-110,-110},{-40,-110},{-40,-79}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-130,-110},{-180,-110},{-180,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-270,-111},{-180,-111},{-180,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.inlet,PL_rackUsersIn_TT703. inlet) annotation (
      Line(
      points={{-290,-111},{-340,-111},{-340,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{-380,-80},{-380,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{-220,-80},{-220,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{-80,-80},{-80,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet,PL_TCV711_rackUsersOut. outlet) annotation (
      Line(
      points={{-10,-150},{-80,-150},{-80,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{79.5,-80},{79.5,-90.5},{80,-90.5},{80,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV721_rackUsersOut.outlet,PL_EX721_EX711_hot. outlet) annotation (
     Line(
      points={{80,-139},{80,-150},{10,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet,PL_TCV711_rackUsersOut. outlet) annotation (
     Line(
      points={{-150,-150},{-80,-150},{-80,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet,PL_TCV731_rackUsersOut. outlet) annotation (
      Line(
      points={{-170,-150},{-220,-150},{-220,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet,PL_TCV731_rackUsersOut. outlet) annotation (
     Line(
      points={{-300,-150},{-220,-150},{-220,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{-320,-150},{-380,-150},{-380,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet,PL_rackUsersIn_TT723. inlet) annotation (Line(
      points={{134,-110},{120,-110},{120,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet,PL_EX721_EX711_hot. outlet) annotation (Line(
      points={{109,-150},{10,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_T.y,sourceP0. in_T0)
    annotation (Line(points={{-413,224},{-404,224},{-404,146.4}},
                                                          color={0,0,127}));
  connect(EX711_T.y,sourceP1. in_T0)
    annotation (Line(points={{-121,224},{-104,224},{-104,146.4}},
                                                             color={0,0,127}));
  connect(EX721_T.y,sourceP2. in_T0)
    annotation (Line(points={{39,218},{56,218},{56,146.4}},  color={0,0,127}));
  connect(EX731_T.y,sourceP3. in_T0)
    annotation (Line(points={{-263,224},{-242,224},{-242,146.4}},
                                                             color={0,0,127}));
  connect(EX731_mflow.y,sinkMassFlowP3. in_m_flow)
    annotation (Line(points={{-167,180},{-170,180},{-170,143}},
                                                           color={0,0,127}));
  connect(EX711_mflow.y,sinkMassFlowP1. in_m_flow)
    annotation (Line(points={{-17,178},{-26,178},{-26,143}},
                                                           color={0,0,127}));
  connect(EX721_mflow.y,sinkMassFlowP2. in_m_flow)
    annotation (Line(points={{147,178},{138,178},{138,143}},
                                                           color={0,0,127}));
  connect(EX701_mflow.y,sinkMassFlowP0. in_m_flow)
    annotation (Line(points={{-319,178},{-328,178},{-328,143}},
                                                           color={0,0,127}));
  connect(TCV731_theta.y,TCV731. opening)
    annotation (Line(points={{-241,-70},{-228,-70}}, color={0,0,127}));
  connect(TCV711_theta.y,TCV711. opening)
    annotation (Line(points={{-100,-70},{-88,-70}},  color={0,0,127}));
  connect(TCV721_theta.y,TCV721. opening)
    annotation (Line(points={{60,-70},{71.1,-70}},     color={0,0,127}));
  connect(TCV701_theta.y,TCV701. opening)
    annotation (Line(points={{-401,-70},{-388,-70}}, color={0,0,127}));
  connect(sourceP0.outlet,PT702. inlet) annotation (Line(
      points={{-398,138},{-380,138},{-380,98}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,sinkMassFlowP0. inlet) annotation (Line(
      points={{-340,104},{-340,138},{-332,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet,sourceP3. outlet) annotation (Line(
      points={{-220,98},{-220,138},{-236,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,sinkMassFlowP3. inlet) annotation (Line(
      points={{-180,102},{-180,138},{-174,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,sourceP1. outlet) annotation (Line(
      points={{-80,98},{-80,138},{-98,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,sinkMassFlowP1. inlet) annotation (Line(
      points={{-40,106},{-40,138},{-30,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,sourceP2. outlet) annotation (Line(
      points={{80,98},{80,138},{62,138}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,sinkMassFlowP2. inlet) annotation (Line(
      points={{120,106},{120,138},{134,138}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.inhot,TT702. inlet) annotation (Line(
      points={{-381.3,43.25},{-381.3,50},{-380,50},{-380,58}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outhot,FT701. inlet) annotation (Line(
      points={{-340.7,43.25},{-340,43.25},{-340,71}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.inhot,TT732. inlet) annotation (Line(
      points={{-221.3,41.25},{-221.3,50},{-220,50},{-220,58}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot,FT731. inlet) annotation (Line(
      points={{-180.7,41.25},{-180,41.25},{-180,69}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.inhot,TT712. inlet) annotation (Line(
      points={{-79.3,40.25},{-79.3,49.125},{-80,49.125},{-80,58}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outhot,FT711. inlet) annotation (Line(
      points={{-38.7,40.25},{-38.7,56.625},{-40,56.625},{-40,73}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.inhot,TT722. inlet) annotation (Line(
      points={{78.7,40.25},{78.7,50},{80,50},{80,58}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot,FT721. inlet) annotation (Line(
      points={{119.3,40.25},{119.3,58},{120,58},{120,73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT733.outlet,TT733. inlet) annotation (Line(
      points={{-180,-60},{-180,-40},{-180.6,-40},{-180.6,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.outlet,TT723. inlet) annotation (Line(
      points={{120,-60},{120,-40.5},{119.4,-40.5},{119.4,-21}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723.inlet,EX721. incold) annotation (Line(
      points={{119.4,-21},{119.4,0.875},{119.3,0.875},{119.3,22.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.inlet,TT724. inlet) annotation (Line(
      points={{80,-30},{80,-26},{80.4,-26},{80.4,-22}},
      color={140,56,54},
      thickness=0.5));
  connect(TT724.inlet,EX721. outcold) annotation (Line(
      points={{80.4,-22},{80,-22},{80,10},{78,10},{78,22.75},{78.7,22.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.inlet,TT714. inlet) annotation (Line(
      points={{-80,-30},{-80,-24},{-79.6,-24},{-79.6,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{-40.6,-18},{-40.6,2.375},{-38.7,2.375},{-38.7,22.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TT714.inlet,EX711. outcold) annotation (Line(
      points={{-79.6,-18},{-79.6,2.375},{-79.3,2.375},{-79.3,22.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733.inlet,EX731. incold) annotation (Line(
      points={{-180.6,-20},{-180.6,1.875},{-180.7,1.875},{-180.7,23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.inlet,EX731. outcold) annotation (Line(
      points={{-220.3,-19.5},{-220.3,2.125},{-221.3,2.125},{-221.3,23.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{-341.6,-14},{-341.6,5.875},{-340.7,5.875},{-340.7,25.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.inlet,TT704. inlet) annotation (Line(
      points={{-380,-30},{-380,-24.5},{-379.6,-24.5},{-379.6,-19}},
      color={140,56,54},
      thickness=0.5));
  connect(TT704.inlet,EX701. outcold) annotation (Line(
      points={{-379.6,-19},{-380,-19},{-380,8},{-381.3,8},{-381.3,25.75}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.inlet, TTR02.inlet) annotation (Line(
      points={{275,-75},{275,-54},{276.4,-54},{276.4,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{287,-107},{275,-107},{275,-95}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.inlet, RR00_PL_VER901_FCVR01.outlet) annotation (Line(
      points={{317,-107},{307,-107}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FCVR01_FTR03.inlet, FCVR01.outlet) annotation (Line(
      points={{347,-107},{337,-107}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet, RR00_PL_FCVR01_FTR03.outlet) annotation (Line(
      points={{374,-107},{367,-107}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{380,-107},{382,-107},{382,-106},{387,-106},{387,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{341,-75},{327,-75},{327,-99}},    color={0,0,127}));
  connect(RR00_PL_FTR03_PTR01.outlet, TTR01.inlet) annotation (Line(
      points={{387,-77},{387,-48.5},{386.6,-48.5},{386.6,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.inlet, suddenAreaChange.outlet) annotation (Line(
      points={{154,-110},{182,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{202,-110},{238,-110},{238,-106},{275,-106},{275,-95}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{182,-152},{182,-150},{129,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{202,-152},{386,-152},{386,-106},{387,-106},{387,-97}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-500,-500},{500,500}})),
    experiment(StopTime=800, __Dymola_Algorithm="Dassl"));
end RR00_CL;
