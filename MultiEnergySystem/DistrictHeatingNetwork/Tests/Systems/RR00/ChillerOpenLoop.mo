within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model ChillerOpenLoop "Ideal Chiller test connected to a pump"
  extends Modelica.Icons.Example;
  parameter Integer n = 3 "Number of volumes";
  parameter Types.MassFlowRate m_flow_total = 2.4;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Downstream "Location of pressure state";

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
  parameter Types.Length L_VER901_FCVR01 = 1;
  parameter Types.Length h_VER901_FCVR01 = -0.8;
  parameter Types.Length L_FCVR01_FTR03 = 2.95;
  parameter Types.Length h_FCVR01_FTR03 = 2.35;
  parameter Types.Length L_FTR03_PTR01 = 1.05;
  parameter Types.Length h_FTR03_PTR01 = 0.25;
  parameter Types.Length L_PTR01_FTR01 = 1.90;
  parameter Types.Length h_PTR01_FTR01 = -1.90;
  parameter Types.Length L_FTR01_RR01 = 1.97;
  parameter Types.Length h_FTR01_RR01 = -0.72;
  parameter Types.Length L_RR01_PR01 = 1.275;
  parameter Types.Length h_RR01_PR01 = 0;
  parameter Types.Length L_PR01_PTR02 = 2.8;
  parameter Types.Length h_PR01_PTR02 = 1;
  parameter Types.Length L_TTR02_VER901 = 0.43;
  parameter Types.Length h_TTR02_VER901 = 0;

  parameter Types.Length L_UsersIn_EX721 = 0.75;
  parameter Types.Length h_UsersIn_EX721 = 0;
  parameter Types.Length L_EX721_EX711_cold = 1.50;
  parameter Types.Length h_EX721_EX711_cold = 0;
  parameter Types.Length L_EX711_EX701_cold = 0.50;
  parameter Types.Length h_EX711_EX701_cold = 0;
  parameter Types.Length L_EX701_EX731_cold = 0.50;
  parameter Types.Length h_EX701_EX731_cold = 0;

  parameter Types.Length L_UsersOut_EX721 = 0.75;
  parameter Types.Length h_UsersOut_EX721 = 0;
  parameter Types.Length L_EX721_EX711_hot = 1.50;
  parameter Types.Length h_EX721_EX711_hot = 0;
  parameter Types.Length L_EX711_EX701_hot = 0.50;
  parameter Types.Length h_EX711_EX701_hot = 0;
  parameter Types.Length L_EX701_EX731_hot = 0.50;
  parameter Types.Length h_EX701_EX731_hot = 0;

  parameter Types.Length L_TT704_TCV701 = 0.65;
  parameter Types.Length h_TT704_TCV701 = 0.65;
  parameter Types.Length L_TT714_TCV711 = 0.65;
  parameter Types.Length h_TT714_TCV711 = 0.65;
  parameter Types.Length L_TT724_TCV721 = 0.65;
  parameter Types.Length h_TT724_TCV721 = 0.65;
  parameter Types.Length L_TT734_TCV731 = 0.65;
  parameter Types.Length h_TT734_TCV731 = 0.65;

  parameter Types.Length L_TCV701_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV701_rUsersOut = 1;
  parameter Types.Length L_TCV711_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV711_rUsersOut = 1;
  parameter Types.Length L_TCV721_rUsersOut = 1 + 0.45;
  parameter Types.Length h_TCV721_rUsersOut = 1;
  parameter Types.Length L_TCV731_rUsersOut = 1 + 0.66 + 0.66;
  parameter Types.Length h_TCV731_rUsersOut = 1;

  parameter Types.Length L_rUsersIn_TT703 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT703 = -1.65;
  parameter Types.Length L_rUsersIn_TT713 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT713 = -1.65;
  parameter Types.Length L_rUsersIn_TT723 = 1.65 + 0.45;
  parameter Types.Length h_rUsersIn_TT723 = -1.65;
  parameter Types.Length L_rUsersIn_TT733 = 1.65 + 0.66 + 0.66;
  parameter Types.Length h_rUsersIn_TT733 = -1.65;

  parameter Types.Length L_RR_UsersIn = 0.8+1.2+0.5+2;
  parameter Types.Length h_RR_UsersIn = 0.8+0.6;

  parameter Types.Length L_RR_UsersOut = 2;
  parameter Types.Length h_RR_UsersOut = 0;

  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={290,210},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
        origin={-55,24})));
  Sources.SinkPressure PTR02_Source(
    use_in_p0=true,
    p0=220000,
    T0(displayUnit="K") = 14.76 + 273.15)                                         "Reference pressure at PTR02"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-97,-51})));
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
        origin={55,9})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={57,-36})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={57,-26})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={57,34})));
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
        origin={55,59})));
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
        origin={-55,59})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool,p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-58,-51})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-58,-41})));
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
        origin={-55,-21})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{-95,19},{-75,39}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    use_in_Tout_cold_set=true,
    Tout_cold_nom(displayUnit="K") = 15 + 273.15,
         dp_cold_start=dp_RR01, m_flow_cold_start=m_flow_Cool,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{-35,85},{35,155}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{73,17},{114,52}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_6(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{76,-43},{117,-8}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_7(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-75,-31},{-116,4}})));
  Sources.SinkPressure PTR01_Source(
    use_in_p0=true,
    use_in_T0=true,
    p0=123000,
    T0(displayUnit="K") = 16.5 + 273.15)                                          "Reference pressure at PTR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={76,-53})));
  Modelica.Blocks.Sources.TimeTable PTR02_TimeTable(table=PTR02_profile)
                                                                     annotation (Placement(transformation(extent={{-135,-66},{-115,-46}})));
  Modelica.Blocks.Sources.TimeTable PTR01_TimeTable(table=PTR01_profile)
                                                                     annotation (Placement(transformation(extent={{114,-67},{94,-47}})));
  Modelica.Blocks.Sources.TimeTable TTR01_TimeTable(table=TTR01_profile) annotation (Placement(transformation(extent={{115,-99},{95,-79}})));
  Modelica.Blocks.Sources.TimeTable TTSP_TimeTable(table=TTRSP_profile) annotation (Placement(transformation(extent={{34,150},{14,170}})));
  Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working"
    annotation (Placement(transformation(extent={{-75,110},{-55,130}})));
equation
  connect(RR00_PL_RR01_PR01.outlet, PR01.inlet) annotation (Line(
      points={{-55,49},{-55,34.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet, RR00_PL_PR01_PTR02.inlet) annotation (Line(
      points={{-55,13.6},{-55,-11}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet, PTR02.inlet) annotation (Line(
      points={{-55,-31},{-55,-36},{-55.6,-36},{-55.6,-41}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet, TTR02.inlet) annotation (Line(
      points={{-55.6,-41},{-55.6,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet, PTR01.inlet) annotation (Line(
      points={{54.6,-36},{54.6,-26}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet, RR00_PL_PTR01_FTR01.inlet) annotation (Line(
      points={{54.6,-26},{54.6,-8.5},{55,-8.5},{55,-1}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet, FTR01.inlet) annotation (Line(
      points={{55,19},{55,31}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{55,37},{55,49}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet, RR01.incold) annotation (Line(
      points={{55,69},{55,80},{21,80},{21,99}},
      color={140,56,54},
      thickness=0.5));
  connect(RR01.outcold, RR00_PL_RR01_PR01.inlet) annotation (Line(
      points={{-21,99},{-21,79},{-55,79},{-55,69}},
      color={140,56,54},
      thickness=0.5));

  connect(FTR01.q_m3hr, FTR01_.numberPort) annotation (Line(points={{63.5,34},{66.712,34},{66.712,34.5},{69.925,34.5}},
                                                       color={0,0,127}));
  connect(PTR01.p, FTR01_6.numberPort) annotation (Line(points={{64.8,-26},{68.862,-26},{68.862,-25.5},{72.925,-25.5}},
                                                      color={0,0,127}));
  connect(FTR01_7.numberPort, PTR02.p) annotation (Line(points={{-71.925,-13.5},{-65.8,-13.5},{-65.8,-41}},
                                    color={0,0,127}));
  connect(PR01_omega.y, PR01.in_omega) annotation (Line(points={{-74,29},{-67.75,29},{-67.75,29.2},{-61.5,29.2}},
                                           color={0,0,127}));
  connect(PTR01_Source.inlet, TTR01.inlet) annotation (Line(
      points={{76,-63},{76,-67},{54.6,-67},{54.6,-36}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02_Source.inlet, TTR02.inlet) annotation (Line(
      points={{-97,-61},{-97,-69},{-55.6,-69},{-55.6,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01_TimeTable.y, PTR01_Source.in_p0) annotation (Line(points={{93,-57},{84.4,-57}}, color={0,0,127}));
  connect(PTR02_TimeTable.y, PTR02_Source.in_p0) annotation (Line(points={{-114,-56},{-105.4,-56},{-105.4,-55}}, color={0,0,127}));
  connect(TTR01_TimeTable.y, PTR01_Source.in_T0) annotation (Line(points={{94,-89},{91,-89},{91,-53},{85.6,-53}}, color={0,0,127}));
  connect(TTSP_TimeTable.y, RR01.in_Tout_cold_set) annotation (Line(points={{13,160},{0,160},{0,144.5}},     color={0,0,127}));
  connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{-54,120},{-38.5,120}}, color={255,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-300,-220},{300,220}}, grid={1,1})),
      experiment(
      StopTime=4000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ChillerOpenLoop;
