within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence5
  extends Sequence3;

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
  parameter Real Kvalve = 90;
  parameter Real FCVR01theta[:,:] = [0, 1; 100, 1];
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
        origin={297,-174})));
  Sources.SinkPressure sinkCold2(p0=EX721_pout_cold, T0=EX721_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={539,-293})));
  Sources.SourceMassFlow sourceCold2(
    p0=EX721_pin_cold,
    T0(displayUnit="K") = EX721_Tin_cold,
    m_flow0=m_flow_EX721_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={625,-292})));
  Sources.SinkPressure sinkCold3(p0=EX731_pout_cold, T0=EX731_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={243,-293})));
  Sources.SourceMassFlow sourceCold3(
    p0=EX731_pin_cold,
    T0(displayUnit="K") = EX731_Tin_cold,
    m_flow0=m_flow_EX731_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={329,-292})));
  Sources.SinkPressure sinkCold(p0=EX701_pout_cold, T0=EX701_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={77,-293})));
  Sources.SourceMassFlow sourceCold(
    p0=EX701_pin_cold,
    T0(displayUnit="K") = EX701_Tin_cold,
    m_flow0=m_flow_EX701_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={169,-294})));
  Sources.SourceMassFlow sourceCold1(
    p0=EX711_pin_cold,
    T0(displayUnit="K") = EX711_Tin_cold,
    m_flow0=m_flow_EX711_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={461,-290})));
  Sources.SinkPressure sinkCold1(p0=EX711_pout_cold, T0=EX711_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={383,-291})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_21(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{80,-201},{51,-177}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_22(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{236,-201},{207,-177}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_23(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{380,-201},{351,-177}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_24(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{538,-203},{509,-179}})));
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
      points={{299.3,-146.25},{299.3,-160.125},{299.4,-160.125},{299.4,-174}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold.inlet, TCV701.outlet) annotation (Line(
      points={{87,-293},{100,-293},{100,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold.outlet, PL_rackUsersIn_TT703.inlet) annotation (Line(
      points={{156,-294},{140,-294},{140,-220}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold3.inlet, TCV731.outlet) annotation (Line(
      points={{253,-293},{260,-293},{260,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold3.outlet, PL_rackUsersIn_TT733.inlet) annotation (Line(
      points={{316,-292},{300,-292},{300,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold1.inlet, TCV711.outlet) annotation (Line(
      points={{393,-291},{400,-291},{400,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold1.outlet, PL_rackUsersIn_TT713.inlet) annotation (Line(
      points={{448,-290},{440,-290},{440,-249}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold2.outlet, PL_rackUsersIn_TT723.inlet) annotation (Line(
      points={{612,-292},{600,-292},{600,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{540,-240},{551.1,-240}}, color={0,0,127}));
  connect(PL_TT724_TCV721.outlet, TCV721.inlet) annotation (Line(
      points={{560,-220},{560,-225},{559.5,-225},{559.5,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold2.inlet, TCV721.outlet) annotation (Line(
      points={{549,-293},{559.5,-293},{559.5,-250}},
      color={140,56,54},
      thickness=0.5));
  connect(TT704.T, FTR01_21.numberPort)
    annotation (Line(points={{90.2,-189},{82.175,-189}}, color={0,0,127}));
  connect(TT734.T, FTR01_22.numberPort) annotation (Line(points={{250.35,-189.5},
          {244.263,-189.5},{244.263,-189},{238.175,-189}}, color={0,0,127}));
  connect(TT714.T, FTR01_23.numberPort) annotation (Line(points={{390.2,-188},{
          386,-188},{386,-189},{382.175,-189}}, color={0,0,127}));
  connect(TT724.T, FTR01_24.numberPort) annotation (Line(points={{550.2,-192},{
          545.188,-192},{545.188,-191},{540.175,-191}}, color={0,0,127}));
end Sequence5;
