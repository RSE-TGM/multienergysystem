within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence5
  extends Sequence3(GB101(Tout_ref=353.15), EB401(Tout_ref=353.15));

  //1. Cooling System

  parameter Types.Pressure pin_start_Cool = 0.92e5;
  parameter Types.Pressure pout_start_Cool = 0.92e5;
  parameter Types.Pressure pin_start_PR01 = pout_start_Cool;
  parameter Types.Pressure pout_start_PR01 = 2e5;
  parameter Types.Temperature Tin_start_Cool = 16 + 273.15;
  parameter Types.Temperature Tout_start_Cool = 7 + 273.15;
  parameter Types.MassFlowRate m_flow_Cool = 8.88+0.3;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter Types.Length t_RR = 1.5e-3;
  parameter Types.Length Di_RR = 85e-3;
  parameter Real Kvalve = 90;
  parameter Real FCVR01theta[:,:] = [0, 0.5; 100, 0.5];
  //parameter Real PR01omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40; 300, 2*3.141592654*40; 400, 2*3.141592654*40];
  parameter Real PR01omega[:,:] = [0, 32.5; 100, 32.5];


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


  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV731(
    Kv=Valve.TCV731.Kv,
    dp_nom=Valve.TCV731.dp_nom,
    rho_nom=Valve.TCV731.rho_nom,
    q_m3h_nom=Valve.TCV731.q_nom_m3h,
    Tin_start=Valve.TCV731.Tin_start,
    pin_start=Valve.TCV731.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={260,-240})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{224,-250},{244,-230}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT734(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={257.5,-189.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT734_TCV731(
    L=L_TT734_TCV731,
    h=h_TT734_TCV731,
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
        origin={260,-210})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT703(
    L=L_rUsersIn_TT703,
    h=h_rUsersIn_TT703,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={140,-210})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT723(
    L=L_rUsersIn_TT723,
    h=h_rUsersIn_TT723,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={600,-240})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV721(
    Kv=Valve.TCV721.Kv,
    dp_nom=Valve.TCV721.dp_nom,
    rho_nom=Valve.TCV721.rho_nom,
    q_m3h_nom=Valve.TCV721.q_nom_m3h,
    Tin_start=Valve.TCV721.Tin_start,
    pin_start=Valve.TCV721.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={559.5,-240})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{519,-250},{539,-230}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT723(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={597,-191})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT724(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={558,-192})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT724_TCV721(
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
        origin={560,-210})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT713(
    L=L_rUsersIn_TT713,
    h=h_rUsersIn_TT713,
    t=t_Users,
    pin_start=pin_start_Users,
    pout_start=pin_start_Users - 0.1e5,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={440,-239})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV711(
    Kv=Valve.TCV711.Kv,
    dp_nom=Valve.TCV711.dp_nom,
    rho_nom=Valve.TCV711.rho_nom,
    q_m3h_nom=Valve.TCV711.q_nom_m3h,
    Tin_start=Valve.TCV711.Tin_start,
    pin_start=Valve.TCV711.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={400,-240})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{365,-250},{385,-230}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT713(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={437,-188})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT714(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={398,-188})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT714_TCV711(
    L=L_TT714_TCV711,
    h=h_TT714_TCV711,
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
        origin={400,-210})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV701(
    Kv=Valve.TCV701.Kv,
    dp_nom=Valve.TCV701.dp_nom,
    rho_nom=Valve.TCV701.rho_nom,
    q_m3h_nom=Valve.TCV701.q_nom_m3h,
    Tin_start=Valve.TCV701.Tin_start,
    pin_start=Valve.TCV701.pin_start,
    q_m3h_start=q_Users)                annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={100,-240})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{66,-250},{86,-230}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT704(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side"
                                                       annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={98,-189})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT704_TCV701(
    L=L_TT704_TCV701,
    h=h_TT704_TCV701,
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
        origin={100,-210})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT703(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={136,-184})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT733(
    L=L_rUsersIn_TT733,
    h=h_rUsersIn_TT733,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={300,-240})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT733(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={297,-190})));
  Modelica.Blocks.Interaction.Show.RealValue TT704_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{80,-211},{42,-166}})));
  Modelica.Blocks.Interaction.Show.RealValue TT734_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{240,-211},{200,-166}})));
  Modelica.Blocks.Interaction.Show.RealValue TT714_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{380,-214},{342,-172}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_24(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{538,-203},{498,-164}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_cold(
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
        origin={488,-292})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_cold(
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
        origin={360,-292})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_cold(
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
        origin={200,-293})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV701_rackUsersOut(
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
        origin={100,-320})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV731_rackUsersOut(
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
        origin={260,-320})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX711_EX701_hot(
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
        origin={320,-360})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV711_rackUsersOut(
    L=L_TCV711_rUsersOut,
    h=h_TCV711_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={400,-320})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX721_EX711_hot(
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
        origin={480,-360})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_EX701_EX731_hot(
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
        origin={170,-360})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TCV721_rackUsersOut(
    L=L_TCV721_rUsersOut,
    h=h_TCV721_rUsersOut,
    t=t_Users,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Users,
    q_m3h_start=q_Users,
    hctype=hctype,
    n=n)           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={560,-321})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersIn_EX721(
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
        origin={624,-292})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_RR_UsersIn(
    L=L_RR_UsersIn,
    h=h_RR_UsersIn,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={664,-292})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX721(
    L=L_UsersOut_EX721,
    h=h_UsersOut_EX721,
    t=t_Rack,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_Rack,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={599,-360})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_RR_UsersOut(
    L=L_RR_UsersOut,
    h=h_RR_UsersOut,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={648,-360})));
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
        origin={768,-292})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{809,-252},{789,-232}})));
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
        origin={738,-292})));
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
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={798,-292})));
  Sources.SinkPressure sinkCold1(
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={663,-263})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=
        Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={820,-290})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_25(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{844,-296},{890,-254}})));
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
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={828,-174})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR01(T_start=Tin_start_Cool, p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={830,-219})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR01 "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={830,-209})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(T_start=
        Tin_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={830,-149})));
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
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={828,-124})));
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
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={828,-254})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_(significantDigits=4)
    annotation (Placement(transformation(extent={{846,-166},{888,-116}})));
  Modelica.Blocks.Interaction.Show.RealValue PTR01_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{853,-212},{894,-168}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR02(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={703,-206})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PTR02 "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={703,-196})));
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
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={706,-176})));
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
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={706,-226})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_27(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{682,-242},{640,-198}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_28(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{682,-214},{640,-168}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
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
    headnom=Pump.PR01.headnom,
    headmax=Pump.PR01.headnommax,
    headmin=Pump.PR01.headnommin,
    qnom_inm3h_min=Pump.PR01.qnommin_inm3h,
    qnom_inm3h_max=Pump.PR01.qnommax_inm3h,
    use_q_m3hr=true)                                             annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=-90,
        origin={706,-133})));
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
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={706,-98})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{666,-138},{686,-118}})));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    Tout_cold_set=Tout_start_Cool,
    dp_cold_start=50000,
    m_flow_cold_start=m_flow_Cool)
    annotation (Placement(transformation(extent={{734,-74},{805,-3}})));
  Modelica.Blocks.Interaction.Show.RealValue TT703_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{147,-185},{188,-146}})));
  Modelica.Blocks.Interaction.Show.RealValue TT733_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{309,-189},{348,-148}})));
  Modelica.Blocks.Interaction.Show.RealValue TT713_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{451,-189},{488,-152}})));
  Modelica.Blocks.Interaction.Show.RealValue TT723_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{608,-188},{648,-144}})));
  Modelica.Blocks.Interaction.Show.RealValue TTR01_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{853,-242},{894,-196}})));
equation
  connect(TCV731.opening,TCV731_theta. y)
    annotation (Line(points={{252,-240},{245,-240}},
                                                   color={0,0,127}));
  connect(PL_TT734_TCV731.inlet,TT734. inlet) annotation (Line(
      points={{260,-200},{260,-195},{259.7,-195},{259.7,-189.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.inlet,PL_TT734_TCV731. outlet) annotation (Line(
      points={{260,-230},{260,-220}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold, TT734.inlet) annotation (Line(
      points={{258.7,-146.25},{258.7,-167.875},{259.7,-167.875},{259.7,-189.5}},
      color={140,56,54},
      thickness=0.5));

  connect(EX721.incold,PL_rackUsersIn_TT723. outlet) annotation (Line(
      points={{599.3,-147.25},{599.3,-218.125},{600,-218.125},{600,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,TT723. inlet) annotation (Line(
      points={{599.3,-147.25},{599.3,-181.125},{599.4,-181.125},{599.4,-191}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TT724. inlet) annotation (Line(
      points={{558.7,-147.25},{560.4,-147.25},{560.4,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,PL_TT724_TCV721. inlet) annotation (Line(
      points={{558.7,-147.25},{560,-147.25},{560,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.opening,TCV711_theta. y)
    annotation (Line(points={{392,-240},{386,-240}},
                                                   color={0,0,127}));
  connect(EX711.outcold,TT714. inlet) annotation (Line(
      points={{400.7,-147.25},{400.4,-147.25},{400.4,-188}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,PL_TT714_TCV711. inlet) annotation (Line(
      points={{400.7,-147.25},{400,-147.25},{400,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT714_TCV711.outlet,TCV711. inlet) annotation (Line(
      points={{400,-220},{400,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT713.outlet, TT713.inlet) annotation (Line(
      points={{440,-229},{440,-208.5},{439.4,-208.5},{439.4,-188}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet, EX711.incold) annotation (Line(
      points={{439.4,-188},{439.4,-167.625},{441.3,-167.625},{441.3,-147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701_theta.y,TCV701. opening)
    annotation (Line(points={{87,-240},{92,-240}},   color={0,0,127}));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{98.7,-144.25},{100.4,-144.25},{100.4,-189}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,PL_TT704_TCV701. inlet) annotation (Line(
      points={{98.7,-144.25},{100,-144.25},{100,-200}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT704_TCV701.outlet,TCV701. inlet) annotation (Line(
      points={{100,-220},{100,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT703.outlet, TT703.inlet) annotation (Line(
      points={{140,-200},{140,-192},{138.4,-192},{138.4,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet, EX701.incold) annotation (Line(
      points={{138.4,-184},{138.4,-164.125},{139.3,-164.125},{139.3,-144.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,PL_rackUsersIn_TT733. outlet) annotation (Line(
      points={{299.3,-146.25},{299.3,-203.625},{300,-203.625},{300,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,TT733. inlet) annotation (Line(
      points={{299.3,-146.25},{299.3,-168.125},{299.4,-168.125},{299.4,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{540,-240},{551.1,-240}}, color={0,0,127}));
  connect(PL_TT724_TCV721.outlet, TCV721.inlet) annotation (Line(
      points={{560,-220},{560,-225},{559.5,-225},{559.5,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(TT734.T, TT734_.numberPort) annotation (Line(points={{250.35,-189.5},
          {246.675,-189.5},{246.675,-188.5},{243,-188.5}}, color={0,0,127}));
  connect(TT714.T, TT714_.numberPort) annotation (Line(points={{390.2,-188},{
          390.2,-193},{382.85,-193}}, color={0,0,127}));
  connect(TT724.T, FTR01_24.numberPort) annotation (Line(points={{550.2,-192},{
          541,-192},{541,-183.5}},                      color={0,0,127}));
  connect(PL_EX721_EX711_cold.outlet, PL_rackUsersIn_TT713.inlet) annotation (
      Line(
      points={{478,-292},{440,-292},{440,-249}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_cold.inlet, PL_rackUsersIn_TT723.inlet) annotation (
      Line(
      points={{498,-292},{600,-292},{600,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.inlet, PL_rackUsersIn_TT713.inlet) annotation (
      Line(
      points={{370,-292},{440,-292},{440,-249}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_cold.outlet, PL_rackUsersIn_TT733.inlet) annotation (
      Line(
      points={{350,-292},{300,-292},{300,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.outlet, PL_rackUsersIn_TT733.inlet) annotation (
      Line(
      points={{210,-293},{300,-293},{300,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_cold.inlet, PL_rackUsersIn_TT703.inlet) annotation (
      Line(
      points={{190,-293},{140,-293},{140,-220}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV701.outlet, PL_TCV701_rackUsersOut.inlet) annotation (Line(
      points={{100,-250},{100,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV731.outlet, PL_TCV731_rackUsersOut.inlet) annotation (Line(
      points={{260,-250},{260,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV711.outlet, PL_TCV711_rackUsersOut.inlet) annotation (Line(
      points={{400,-250},{400,-310}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX721_EX711_hot.inlet, PL_TCV711_rackUsersOut.outlet) annotation (
      Line(
      points={{470,-360},{400,-360},{400,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721.outlet, PL_TCV721_rackUsersOut.inlet) annotation (Line(
      points={{559.5,-250},{559.5,-280.5},{560,-280.5},{560,-311}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TCV721_rackUsersOut.outlet, PL_EX721_EX711_hot.outlet) annotation (
     Line(
      points={{560,-331},{560,-360},{490,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.outlet, PL_TCV711_rackUsersOut.outlet) annotation (
     Line(
      points={{330,-360},{400,-360},{400,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX711_EX701_hot.inlet, PL_TCV731_rackUsersOut.outlet) annotation (
      Line(
      points={{310,-360},{260,-360},{260,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.outlet, PL_TCV731_rackUsersOut.outlet) annotation (
     Line(
      points={{180,-360},{260,-360},{260,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_EX701_EX731_hot.inlet, PL_TCV701_rackUsersOut.outlet) annotation (
      Line(
      points={{160,-360},{100,-360},{100,-330}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersIn.outlet,PL_UsersIn_EX721. inlet) annotation (Line(
      points={{654,-292},{634,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersIn_EX721.outlet, PL_rackUsersIn_TT723.inlet) annotation (Line(
      points={{614,-292},{600,-292},{600,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.outlet,PL_RR_UsersOut. inlet) annotation (Line(
      points={{609,-360},{638,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX721.inlet, PL_EX721_EX711_hot.outlet) annotation (Line(
      points={{589,-360},{490,-360}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{748,-292},{758,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,RR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{778,-292},{788,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01_theta.y,FCVR01. opening)
    annotation (Line(points={{788,-242},{768,-242},{768,-284}},
                                                           color={0,0,127}));
  connect(RR00_PL_VER901_FCVR01.inlet, PL_RR_UsersIn.inlet) annotation (Line(
      points={{728,-292},{674,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold1.inlet, PL_RR_UsersIn.inlet) annotation (Line(
      points={{673,-263},{686,-263},{686,-292},{674,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_RR_UsersOut.outlet, FTR03.outlet) annotation (Line(
      points={{658,-360},{828,-360},{828,-292},{823,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet, RR00_PL_FCVR01_FTR03.outlet) annotation (Line(
      points={{817,-292},{808,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01_25.numberPort, FTR03.q_m3hr) annotation (Line(points={{840.55,
          -275},{840.55,-283.5},{820,-283.5}},
                                    color={0,0,127}));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{827.6,-219},{827.6,-209}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{827.6,-209},{827.6,-191.5},{828,-191.5},{828,-184}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{828,-164},{828,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{828,-146},{828,-134}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,RR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{827.6,-219},{828,-219},{828,-244}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.q_m3hr,FTR01_. numberPort) annotation (Line(points={{836.5,-149},
          {836.5,-145},{842.85,-145},{842.85,-141}},   color={0,0,127}));
  connect(PTR01.p, PTR01_.numberPort) annotation (Line(points={{837.8,-209},{
          837.8,-190},{849.925,-190}}, color={0,0,127}));
  connect(RR00_PL_FTR03_PTR01.inlet, FTR03.outlet) annotation (Line(
      points={{828,-264},{828,-292},{823,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{706,-186},{706,-191},{705.4,-191},{705.4,-196}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{705.4,-196},{706,-196},{706,-206},{705.4,-206}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,RR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{705.4,-206},{706,-206},{706,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet, PL_RR_UsersIn.inlet) annotation (Line(
      points={{706,-236},{706,-292},{674,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01_27.numberPort, TTR02.T) annotation (Line(points={{685.15,-220},
          {685.15,-206},{695.2,-206}},           color={0,0,127}));
  connect(PTR02.p, FTR01_28.numberPort) annotation (Line(points={{695.2,-196},{
          692,-196},{692,-191},{685.15,-191}},  color={0,0,127}));
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{706,-108},{706,-122.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01_omega.y,PR01. in_q_m3hr) annotation (Line(points={{687,-128},{693.51,
          -128},{693.51,-127.8},{700.02,-127.8}},
                                            color={0,0,127}));
  connect(PR01.outlet, RR00_PL_PR01_PTR02.inlet) annotation (Line(
      points={{706,-143.4},{706,-166}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet, RR01.incold) annotation (Line(
      points={{828,-114},{828,-82},{792,-82},{792,-59.8},{790.8,-59.8}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.inlet, RR01.outcold) annotation (Line(
      points={{706,-88},{708,-88},{708,-78},{750,-78},{750,-59.8},{748.2,-59.8}},
      color={140,56,54},
      thickness=0.5));

  connect(TT704.T, TT704_.numberPort) annotation (Line(points={{90.2,-189},{
          82.85,-189},{82.85,-188.5}}, color={0,0,127}));
  connect(TT703.T, TT703_.numberPort) annotation (Line(points={{128.2,-184},{
          143.925,-184},{143.925,-165.5}}, color={0,0,127}));
  connect(TT733_.numberPort, TT733.T) annotation (Line(points={{306.075,-168.5},
          {306.075,-184},{289.2,-184},{289.2,-190}}, color={0,0,127}));
  connect(TT713.T, TT713_.numberPort) annotation (Line(points={{429.2,-188},{
          428,-188},{428,-170},{448.225,-170},{448.225,-170.5}}, color={0,0,127}));
  connect(TT723_.numberPort, TT723.T) annotation (Line(points={{605,-166},{605,
          -184},{589.2,-184},{589.2,-191}}, color={0,0,127}));
  connect(TTR01.T, TTR01_.numberPort)
    annotation (Line(points={{837.8,-219},{849.925,-219}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-900,-380},{900,380}})));
end Sequence5;
