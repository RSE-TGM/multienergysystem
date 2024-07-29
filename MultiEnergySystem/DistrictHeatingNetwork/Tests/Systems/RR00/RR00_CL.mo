within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR00_CL
  extends Modelica.Icons.Example;



  parameter Integer n = 3 "Number of volumes";
  parameter Types.MassFlowRate m_flow_total = 2.4;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;


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

  parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.4; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=1.8;//0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=1.8; //0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.45; //0.65;

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
        origin={241,-60})));
  Sources.SinkPressure PTR02_Source(
    use_in_p0=true,
    p0=220000,
    T0(displayUnit="K") = 14.76 + 273.15,
    R=1E-3)                                                                       "Reference pressure at PTR02"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={199,-135})));
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
        origin={351,-75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={353,-120})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={353,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={353,-50})));
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
        origin={351,-25})));
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
        origin={241,-25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={238,-135})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={238,-125})));
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
        origin={241,-105})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{201,-65},{221,-45}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool,
    V=0.001,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)
             "Chiller"
    annotation (Placement(transformation(extent={{261,1},{331,71}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{369,-67},{410,-32}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_6(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{372,-127},{413,-92}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_7(use_numberPort=true, significantDigits=4)
    annotation (Placement(transformation(extent={{221,-115},{180,-80}})));
  Modelica.Blocks.Sources.TimeTable PTR02_TimeTable(table=PTR02_profile)
                                                                     annotation (Placement(transformation(extent={{161,-150},{181,-130}})));
  Modelica.Blocks.Sources.TimeTable TTSP_TimeTable(table=TTRSP_profile) annotation (Placement(transformation(extent={{330,66},{310,86}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working"
    annotation (Placement(transformation(extent={{221,26},{241,46}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX701(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-397,-65.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-374,-26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT701(T_start=EX701_Tout_hot, p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-374,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-374,4})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT702(T_start=EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-418,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-418,-2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX711(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=11200.497,
    gamma_nom_hot=4313.9346,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-95,-68.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-74,-24})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT711(T_start=EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-74,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-74,6})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT712(T_start=EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-118,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-118,-2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX721(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.8257757,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.8257757,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={63,-68.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,-24})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={86,6})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT722(T_start=EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={42,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={42,-2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
                                                                   EX731(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=0.67402256,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=0.67402256,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=9520.42245,
    gamma_nom_hot=3666.84441,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-237,-67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor
                                                     FT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,-28})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,-12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-214,2})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT732(T_start=EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-258,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
                                                             PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-258,-2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV731(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV731.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV731.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV731.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-256,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-258.5,-119.5})));
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
        origin={-256,-140})));
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
        origin={-376,-140})));
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
        origin={84,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV721(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV721.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV721.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={43.5,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT723(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={81,-121})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={42,-122})));
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
        origin={44,-140})));
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
        origin={-76,-169})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV711(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV711.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV711.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV711.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-116,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT713(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-79,-118})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-118,-118})));
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
        origin={-116,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
                                                                TCV701(
    Kv=DistrictHeatingNetwork.Data.ValveData.TCV701.Kv,
    dp_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.Tin_start,
    pin_start=DistrictHeatingNetwork.Data.ValveData.TCV701.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-416,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-418,-119})));
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
        origin={-416,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT703(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-380,-114})));
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
        origin={-216,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
                                                                TT733(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-219,-120})));
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
        origin={-28,-210})));
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
        origin={-156,-210})));
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
        origin={-316,-211})));
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
        origin={-416,-228})));
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
        origin={-256,-228})));
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
        origin={-196,-250})));
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
        origin={-116,-228})));
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
        origin={-36,-250})));
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
        origin={-346,-250})));
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
        origin={44,-229})));
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
        origin={108,-210})));
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
        origin={83,-250})));
  Sources.SourcePressure                        VER901(
    use_in_p0=true,
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={141,-185})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)     annotation (Placement(transformation(extent={{-458,-180},{-438,-160}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)     annotation (Placement(transformation(extent={{-298,-180},{-278,-160}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)     annotation (Placement(transformation(extent={{-157,-180},{-137,-160}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)     annotation (Placement(transformation(extent={{3,-180},{23,-160}})));
  Modelica.Blocks.Sources.TimeTable TTcool_T(table=TTRSP_profile)
                                                               annotation (Placement(transformation(extent={{100,-172},{120,-152}})));
  Modelica.Blocks.Sources.TimeTable PTcool_p(table=PTR02_profile)
                                                               annotation (Placement(transformation(extent={{100,-140},{120,-120}})));
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
        origin={291,-207})));
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
        origin={261,-207})));
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
        origin={321,-207})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=0,
        origin={341,-209})));
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
        origin={239,-185})));
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
        origin={351,-187})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{326,-185},{306,-165}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=Di_Rack, D_o=Di_RR) annotation (Placement(transformation(extent={{166,-220},{146,-200}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=Di_RR, D_o=Di_Rack) annotation (Placement(transformation(extent={{146,-262},{166,-242}})));
protected
  Modelica.Blocks.Sources.TimeTable EX701_T(table=[0,EX701_Tin_hot; 1E4,EX701_Tin_hot])
    annotation (Placement(transformation(extent={{-470,114},{-450,134}})));
  Modelica.Blocks.Sources.TimeTable EX711_T(table=[0,EX711_Tin_hot; 1E4,EX711_Tin_hot])
    annotation (Placement(transformation(extent={{-178,114},{-158,134}})));
  Modelica.Blocks.Sources.TimeTable EX721_T(table=[0,EX721_Tin_hot; 1E4,EX721_Tin_hot])
    annotation (Placement(transformation(extent={{-18,108},{2,128}})));
  Modelica.Blocks.Sources.TimeTable EX731_T(table=[0,EX731_Tin_hot; 1E4,EX731_Tin_hot])
    annotation (Placement(transformation(extent={{-320,114},{-300,134}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow(table=[0,m_flow_EX731_cold; 1E4,m_flow_EX731_cold])
    annotation (Placement(transformation(extent={{-182,70},{-202,90}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow(table=[0,m_flow_EX711_cold; 1E4,m_flow_EX711_cold])
    annotation (Placement(transformation(extent={{-32,68},{-52,88}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow(table=[0,m_flow_EX721_cold; 1E4,m_flow_EX721_cold])
    annotation (Placement(transformation(extent={{132,68},{112,88}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow(table=[0,m_flow_EX701_cold; 1E4,m_flow_EX701_cold])
    annotation (Placement(transformation(extent={{-334,68},{-354,88}})));
  Sources.SourcePressure sourceP0(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-454,28},{-434,48}})));
  Sources.SourcePressure sourceP1(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-154,28},{-134,48}})));
  Sources.SourcePressure sourceP2(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{6,28},{26,48}})));
  Sources.SourcePressure sourceP3(
    use_in_p0=false,
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-292,28},{-272,48}})));
  Sources.SinkMassFlow                        sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-210,28},{-190,48}})));
  Sources.SinkMassFlow                        sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-66,28},{-46,48}})));
  Sources.SinkMassFlow                        sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{98,28},{118,48}})));
  Sources.SinkMassFlow                        sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{-368,28},{-348,48}})));
  inner System                        system
    annotation (Placement(transformation(extent={{410,442},{430,462}})));
equation
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{241,-35},{241,-49.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{241,-70.4},{241,-95}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{241,-115},{241,-120},{240.4,-120},{240.4,-125}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{240.4,-125},{240.4,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{350.6,-120},{350.6,-110}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{350.6,-110},{350.6,-92.5},{351,-92.5},{351,-85}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{351,-65},{351,-53}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{351,-47},{351,-35}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{351,-15},{351,-4},{317,-4},{317,15}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold,RR00_PL_RR01_PR01. inlet) annotation (Line(
      points={{275,15},{275,-5},{241,-5},{241,-15}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr,FTR01_. numberPort) annotation (Line(points={{359.5,-50},{362.712,-50},{362.712,-49.5},{365.925,-49.5}},
                                                       color={0,0,127}));
  connect(PTR01.p,FTR01_6. numberPort) annotation (Line(points={{360.8,-110},{364.862,-110},{364.862,-109.5},{368.925,-109.5}},
                                                      color={0,0,127}));
  connect(FTR01_7.numberPort,PTR02. p) annotation (Line(points={{224.075,-97.5},{230.2,-97.5},{230.2,-125}},
                                    color={0,0,127}));
  connect(PR01_omega.y,PR01. in_omega) annotation (Line(points={{222,-55},{228.25,-55},{228.25,-54.8},{234.5,-54.8}},
                                           color={0,0,127}));
  connect(PTR02_Source.inlet,TTR02. inlet) annotation (Line(
      points={{199,-145},{199,-153},{240.4,-153},{240.4,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02_TimeTable.y,PTR02_Source. in_p0) annotation (Line(points={{182,-140},{190.6,-140},{190.6,-139}}, color={0,0,127}));
  connect(TTSP_TimeTable.y,RR01. in_Tout_cold_set) annotation (Line(points={{309,76},{296,76},{296,60.5}},   color={0,0,127}));
  connect(RR101_Status.y,RR01. cold_on) annotation (Line(points={{242,36},{257.5,36}},   color={255,0,255}));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-416,-42},{-416,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{-116,-42},{-116,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-376,4},{-376,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-376,-10},{-376,-23}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{-76,6},{-76,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{-76,-21},{-76,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{44,-42},{44,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-256,-42},{-256,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{84,6},{84,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{84,-21},{84,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-216,2},{-216,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-216,-12},{-216,-25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{-256,-130},{-256,-125},{-256.3,-125},{-256.3,-119.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{-256,-160},{-256,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{-116,-150},{-116,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet,TT713. inlet) annotation (Line(
      points={{-76,-159},{-76,-138.5},{-76.6,-138.5},{-76.6,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{-416,-150},{-416,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet,TT703. inlet) annotation (Line(
      points={{-376,-130},{-376,-122},{-377.6,-122},{-377.6,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.outlet,TCV721. inlet) annotation (Line(
      points={{44,-150},{44,-155},{43.5,-155},{43.5,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.outlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-38,-210},{-76,-210},{-76,-179}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.inlet,PL_rackUsersIn_TT723. inlet) annotation (
      Line(
      points={{-18,-210},{84,-210},{84,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.inlet,PL_rackUsersIn_TT713. inlet) annotation (
      Line(
      points={{-146,-210},{-76,-210},{-76,-179}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-166,-210},{-216,-210},{-216,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet,PL_rackUsersIn_TT733. inlet) annotation (
      Line(
      points={{-306,-211},{-216,-211},{-216,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.inlet,PL_rackUsersIn_TT703. inlet) annotation (
      Line(
      points={{-326,-211},{-376,-211},{-376,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet,PL_TCV701_rackUsersOut. inlet) annotation (Line(
      points={{-416,-180},{-416,-218}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet,PL_TCV731_rackUsersOut. inlet) annotation (Line(
      points={{-256,-180},{-256,-218}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet,PL_TCV711_rackUsersOut. inlet) annotation (Line(
      points={{-116,-180},{-116,-218}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet,PL_TCV711_rackUsersOut. outlet) annotation (
      Line(
      points={{-46,-250},{-116,-250},{-116,-238}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet,PL_TCV721_rackUsersOut. inlet) annotation (Line(
      points={{43.5,-180},{43.5,-190.5},{44,-190.5},{44,-219}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV721_rackUsersOut.outlet,PL_EX721_EX711_hot. outlet) annotation (
     Line(
      points={{44,-239},{44,-250},{-26,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet,PL_TCV711_rackUsersOut. outlet) annotation (
     Line(
      points={{-186,-250},{-116,-250},{-116,-238}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet,PL_TCV731_rackUsersOut. outlet) annotation (
      Line(
      points={{-206,-250},{-256,-250},{-256,-238}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet,PL_TCV731_rackUsersOut. outlet) annotation (
     Line(
      points={{-336,-250},{-256,-250},{-256,-238}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet,PL_TCV701_rackUsersOut. outlet) annotation (
      Line(
      points={{-356,-250},{-416,-250},{-416,-238}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet,PL_rackUsersIn_TT723. inlet) annotation (Line(
      points={{98,-210},{84,-210},{84,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet,PL_EX721_EX711_hot. outlet) annotation (Line(
      points={{73,-250},{-26,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_T.y,sourceP0. in_T0)
    annotation (Line(points={{-449,124},{-440,124},{-440,46.4}},
                                                          color={0,0,127}));
  connect(EX711_T.y,sourceP1. in_T0)
    annotation (Line(points={{-157,124},{-140,124},{-140,46.4}},
                                                             color={0,0,127}));
  connect(EX721_T.y,sourceP2. in_T0)
    annotation (Line(points={{3,118},{20,118},{20,46.4}},    color={0,0,127}));
  connect(EX731_T.y,sourceP3. in_T0)
    annotation (Line(points={{-299,124},{-278,124},{-278,46.4}},
                                                             color={0,0,127}));
  connect(EX731_mflow.y,sinkMassFlowP3. in_m_flow)
    annotation (Line(points={{-203,80},{-206,80},{-206,43}},
                                                           color={0,0,127}));
  connect(EX711_mflow.y,sinkMassFlowP1. in_m_flow)
    annotation (Line(points={{-53,78},{-62,78},{-62,43}},  color={0,0,127}));
  connect(EX721_mflow.y,sinkMassFlowP2. in_m_flow)
    annotation (Line(points={{111,78},{102,78},{102,43}},  color={0,0,127}));
  connect(EX701_mflow.y,sinkMassFlowP0. in_m_flow)
    annotation (Line(points={{-355,78},{-364,78},{-364,43}},
                                                           color={0,0,127}));
  connect(TCV731_theta.y,TCV731. opening)
    annotation (Line(points={{-277,-170},{-264,-170}},
                                                     color={0,0,127}));
  connect(TCV711_theta.y,TCV711. opening)
    annotation (Line(points={{-136,-170},{-124,-170}},
                                                     color={0,0,127}));
  connect(TCV721_theta.y,TCV721. opening)
    annotation (Line(points={{24,-170},{35.1,-170}},   color={0,0,127}));
  connect(TCV701_theta.y,TCV701. opening)
    annotation (Line(points={{-437,-170},{-424,-170}},
                                                     color={0,0,127}));
  connect(sourceP0.outlet,PT702. inlet) annotation (Line(
      points={{-434,38},{-416,38},{-416,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,sinkMassFlowP0. inlet) annotation (Line(
      points={{-376,4},{-376,38},{-368,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT732.inlet,sourceP3. outlet) annotation (Line(
      points={{-256,-2},{-256,38},{-272,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,sinkMassFlowP3. inlet) annotation (Line(
      points={{-216,2},{-216,38},{-210,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT712.inlet,sourceP1. outlet) annotation (Line(
      points={{-116,-2},{-116,38},{-134,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,sinkMassFlowP1. inlet) annotation (Line(
      points={{-76,6},{-76,38},{-66,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,sourceP2. outlet) annotation (Line(
      points={{44,-2},{44,38},{26,38}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,sinkMassFlowP2. inlet) annotation (Line(
      points={{84,6},{84,38},{98,38}},
      color={140,56,54},
      thickness=0.5));
  connect(TTcool_T.y,VER901. in_T0) annotation (Line(points={{121,-162},{121,-176.6},{137,-176.6}},
                         color={0,0,127}));
  connect(EX701.inhot,TT702. inlet) annotation (Line(
      points={{-417.3,-56.75},{-417.3,-50},{-416,-50},{-416,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outhot,FT701. inlet) annotation (Line(
      points={{-376.7,-56.75},{-376,-56.75},{-376,-29}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.inhot,TT732. inlet) annotation (Line(
      points={{-257.3,-58.75},{-257.3,-50},{-256,-50},{-256,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outhot,FT731. inlet) annotation (Line(
      points={{-216.7,-58.75},{-216,-58.75},{-216,-31}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.inhot,TT712. inlet) annotation (Line(
      points={{-115.3,-59.75},{-115.3,-50.875},{-116,-50.875},{-116,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outhot,FT711. inlet) annotation (Line(
      points={{-74.7,-59.75},{-74.7,-43.375},{-76,-43.375},{-76,-27}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.inhot,TT722. inlet) annotation (Line(
      points={{42.7,-59.75},{42.7,-50},{44,-50},{44,-42}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outhot,FT721. inlet) annotation (Line(
      points={{83.3,-59.75},{83.3,-42},{84,-42},{84,-27}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT733.outlet,TT733. inlet) annotation (Line(
      points={{-216,-160},{-216,-140},{-216.6,-140},{-216.6,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT723.outlet,TT723. inlet) annotation (Line(
      points={{84,-160},{84,-140.5},{83.4,-140.5},{83.4,-121}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723.inlet,EX721. incold) annotation (Line(
      points={{83.4,-121},{83.4,-99.125},{83.3,-99.125},{83.3,-77.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV721.inlet,TT724. inlet) annotation (Line(
      points={{44,-130},{44,-126},{44.4,-126},{44.4,-122}},
      color={140,56,54},
      thickness=0.5));
  connect(TT724.inlet,EX721. outcold) annotation (Line(
      points={{44.4,-122},{44,-122},{44,-90},{42,-90},{42,-77.25},{42.7,-77.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.inlet,TT714. inlet) annotation (Line(
      points={{-116,-130},{-116,-124},{-115.6,-124},{-115.6,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{-76.6,-118},{-76.6,-97.625},{-74.7,-97.625},{-74.7,-77.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT714.inlet,EX711. outcold) annotation (Line(
      points={{-115.6,-118},{-115.6,-97.625},{-115.3,-97.625},{-115.3,-77.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733.inlet,EX731. incold) annotation (Line(
      points={{-216.6,-120},{-216.6,-98.125},{-216.7,-98.125},{-216.7,-76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.inlet,EX731. outcold) annotation (Line(
      points={{-256.3,-119.5},{-256.3,-97.875},{-257.3,-97.875},{-257.3,-76.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{-377.6,-114},{-377.6,-94.125},{-376.7,-94.125},{-376.7,-74.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.inlet,TT704. inlet) annotation (Line(
      points={{-416,-130},{-416,-124.5},{-415.6,-124.5},{-415.6,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(TT704.inlet,EX701. outcold) annotation (Line(
      points={{-415.6,-119},{-416,-119},{-416,-92},{-417.3,-92},{-417.3,-74.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PTcool_p.y,VER901. in_p0) annotation (Line(points={{121,-130},{140,-130},{140,-164},{145,-164},{145,-176.6}},
                                                                                                color={0,0,127}));
  connect(RR00_PL_TTR02_VER901.inlet, TTR02.inlet) annotation (Line(
      points={{239,-175},{239,-154},{240.4,-154},{240.4,-135}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{251,-207},{239,-207},{239,-195}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.inlet, RR00_PL_VER901_FCVR01.outlet) annotation (Line(
      points={{281,-207},{271,-207}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FCVR01_FTR03.inlet, FCVR01.outlet) annotation (Line(
      points={{311,-207},{301,-207}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet, RR00_PL_FCVR01_FTR03.outlet) annotation (Line(
      points={{338,-207},{331,-207}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{344,-207},{346,-207},{346,-206},{351,-206},{351,-197}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{305,-175},{291,-175},{291,-199}}, color={0,0,127}));
  connect(RR00_PL_FTR03_PTR01.outlet, TTR01.inlet) annotation (Line(
      points={{351,-177},{351,-148.5},{350.6,-148.5},{350.6,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.inlet, suddenAreaChange.outlet) annotation (Line(
      points={{118,-210},{146,-210}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, RR00_PL_TTR02_VER901.outlet) annotation (Line(
      points={{166,-210},{202,-210},{202,-206},{239,-206},{239,-195}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, PL_UsersOut_EX721.outlet) annotation (Line(
      points={{146,-252},{146,-250},{93,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, RR00_PL_FTR03_PTR01.inlet) annotation (Line(
      points={{166,-252},{350,-252},{350,-206},{351,-206},{351,-197}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-500,-500},{500,500}})));
end RR00_CL;
