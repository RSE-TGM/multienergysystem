within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence8
  extends Sequence7(
    P901omega = [0, 2*3.141592654*45;  60, 2*3.141592654*45],
    ToutcoolSP = [0, 17; 50, 17; 60, 17; 100, 17],
    T_start_hot = 80 + 273.15,
    T_start_cold = 72 + 273.15,
    Tin_start_Cool = 30 + 273.15,
    Tout_start_Cool = 17 + 273.15,
    FV201_state = false,
    FV202_state = true,
    FV203_state = false,
    FV204_state = true,
    FV205_state = true,
    FV206_state = true,
    FV207_state = false,
    FV208_state = true,
    FV209_state = true);
  parameter Real TCV601theta[:,:] = [0, 1; 100, 1];
  parameter Real P301omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
  parameter Real P301qm3h[:,:] = [0, 6.4882274; 100, 6.4882274];
  parameter Real P302omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real P302qm3h[:,:] = [0, 5.581444; 100, 5.581444];
  parameter Real P601omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real P601qm3h[:,:] = [0, 11.351553; 100, 11.351553];
  parameter Real P602omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P602qm3h[:,:] = [0, 6.033898; 100, 6.033898];


  final parameter Types.Pressure pin_start_S3_tank = pout_User_start_S3_pump;
  final parameter Types.Pressure pout_start_S3_tank = pin_start_S3_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S3 = 2e5;
  parameter Types.Pressure pout_Source_start_S3 = 1.9e5;
  parameter Types.Temperature Tin_Source_start_S3 = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3 = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3 = 1.69e5;
  parameter Types.Pressure pout_User_start_S3 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3 = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3 = 80 + 273.15;

  // Heat Pump
  parameter Types.Pressure pin_Source_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S3_hp = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3_hp = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3_hp = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3_hp = 80 + 273.15;

  // Water Pump P301
  parameter Types.Pressure pin_User_start_S3_pump = pin_User_start_S3;
  parameter Types.Pressure pout_User_start_S3_pump = pin_User_start_S3_pump + 1.22e5;

  // Water Pump P302
  parameter Types.Pressure pin_Source_start_S3_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_pump = pin_Source_start_S3_pump + 0.88e5;

  // General Pipeline Data
  parameter Types.Length Di_S3 = 51e-3;
  parameter Types.Length t_S3 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S3 = q_m3h_S3_Source*990/3600;
  parameter Real q_m3h_S3_Source = 6;
  parameter Types.MassFlowRate m_flow_User_S3 = q_m3h_S3_User*990/3600;
  parameter Real q_m3h_S3_User = 2.23;

  // Pipe length
  parameter Types.Length L_S3_PL1 = 3;
  parameter Types.Length L_S3_PL2 = 3;
  parameter Types.Length L_S3_PL3 = 3;
  parameter Types.Length L_S3_PL4 = 3;
  parameter Types.Length L_S3_PL5 = 3;
  parameter Types.Length L_S3_PL6 = 3;
  parameter Types.Length L_S3_PL7 = 3;
  parameter Types.Length L_S3_PL8 = 3;
  parameter Types.Length L_S3_PL9 = 3;
  parameter Types.Length L_S3_PL10 = 3;

  final parameter Types.Pressure pin_start_S6_tank = pout_User_start_S6_pump;
  final parameter Types.Pressure pout_start_S6_tank = pin_start_S6_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S6 = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6 = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S6 = 14 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6 = 7 + 273.15;

  parameter Types.Pressure pin_User_start_S6 = 2.67e5;
  parameter Types.Pressure pout_User_start_S6 = 3e5;
  parameter Types.Temperature Tin_User_start_S6 = 40 + 273.15;
  parameter Types.Temperature Tout_User_start_S6 = 45 + 273.15;

  // Heat Pump
  parameter Types.Pressure pin_Source_start_S6_hp = 2.22e5;
  parameter Types.Pressure pout_Source_start_S6_hp = 2.04e5;
  parameter Types.Temperature Tin_Source_start_S6_hp = 14 + 273.15;
  parameter Types.Temperature Tout_Source_start_S6_hp = 7 + 273.15;

  parameter Types.Pressure pin_User_start_S6_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S6_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S6_hp = 40 + 273.15;
  parameter Types.Temperature Tout_User_start_S6_hp = 45 + 273.15;

  // Cooling System Side
  parameter Types.Pressure pin_cool_start_S6_HX = 2.8e5;
  parameter Types.Pressure pout_cool_start_S6_HX = 2e5;
  parameter Types.Temperature Tin_cool_start_S6_HX = 17 + 273.15;
  parameter Types.Temperature Tout_cool_start_S6_HX = 15 + 273.15;
  parameter Types.MassFlowRate m_flow_cool_S6 = 4.166666667;

  // Water Pump P601
  parameter Types.Pressure pin_User_start_S6_pump = pin_User_start_S6;
  parameter Types.Pressure pout_User_start_S6_pump = pin_User_start_S6_pump + 1.22e5;

  // Water Pump P602
  parameter Types.Pressure pin_Source_start_S6_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S6_pump = pin_Source_start_S6_pump + 0.88e5;

  // General Pipeline Data
  parameter Types.Length Di_S6 = 51e-3;
  parameter Types.Length t_S6 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S6 = 1.369047619;
  parameter Types.MassFlowRate m_flow_User_S6 = 2.444444444;
  parameter Real q_m3h_S6_Source(unit = "m3/h") = 6.3149476;

  // Pipe length
  parameter Types.Length L_S6_PL1 = 3;
  parameter Types.Length L_S6_PL2 = 3;
  parameter Types.Length L_S6_PL3 = 3;
  parameter Types.Length L_S6_PL4 = 3;
  parameter Types.Length L_S6_PL5 = 3;
  parameter Types.Length L_S6_PL6 = 3;
  parameter Types.Length L_S6_PL7 = 3;
  parameter Types.Length L_S6_PL8 = 3;
  parameter Types.Length L_S6_PL9 = 3;
  parameter Types.Length L_S6_PL10 = 3;

//   parameter Types.Pressure pin_start_S4 = 1.695e5;
//   parameter Types.Pressure pout_start_S4 = 1.6e5;
//   parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
//   parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

//   parameter Types.MassFlowRate m_flow_S4 = 1.2;
  parameter Boolean FV605_state = false;
  parameter Boolean FV606_state = false;
  parameter Boolean FV403_state = false;
  parameter Boolean FV404_state = false;


  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX601(
    hctype_hot=hctype,
    Di_cold=BPHE.E601.Di_cold,
    Di_hot=BPHE.E601.Di_hot,
    L_cold=BPHE.E601.L_cold,
    L_hot=BPHE.E601.L_hot,
    hctype_cold=hctype,
    MWall=BPHE.E601.MWall,
    Stot_cold=BPHE.E601.Stot_cold,
    Stot_hot=BPHE.E601.Stot_hot,
    Tin_start_cold=BPHE.E601.Tin_start_cold,
    Tin_start_hot=Tin_cool_start_S6_HX,
    Tout_start_cold=BPHE.E601.Tout_start_cold,
    Tout_start_hot=Tout_cool_start_S6_HX,
    cpm_cold=BPHE.E601.cpm_cold,
    cpm_hot=BPHE.E601.cpm_hot,
    t_cold=BPHE.E601.t_cold,
    t_hot=BPHE.E601.t_hot,
    gamma_nom_cold=BPHE.E601.gamma_nom_cold,
    gamma_nom_hot=BPHE.E601.gamma_nom_hot,
    h_cold=BPHE.E601.h_cold,
    h_hot=BPHE.E601.h_hot,
    hin_start_cold=BPHE.E601.hin_start_cold,
    hin_start_hot=BPHE.E601.hin_start_hot,
    k_cold=BPHE.E601.k_cold,
    k_hot=BPHE.E601.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E601.lambdam_cold,
    lambdam_hot=BPHE.E601.lambdam_hot,
    m_flow_start_cold=BPHE.E601.m_flow_start_cold,
    m_flow_start_hot=BPHE.E601.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E601.nPipes_cold,
    nPipes_hot=BPHE.E601.nPipes_hot,
    nPlates=BPHE.E601.nPlates,
    pin_start_cold=BPHE.E601.pin_start_cold,
    pin_start_hot=BPHE.E601.pin_start_hot,
    pout_start_cold=BPHE.E601.pout_start_cold,
    pout_start_hot=BPHE.E601.pout_start_hot,
    rho_nom_cold=(BPHE.E601.rhoin_nom_cold + BPHE.E601.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E601.rhoin_nom_hot + BPHE.E601.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E601.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E601.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E601.u_nom_cold,
    u_nom_hot=BPHE.E601.u_nom_hot) annotation (Placement(visible=true,
        transformation(
        origin={588,-378},
        extent={{18.0001,30},{-18.0002,-30.0007}},
        rotation=90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_rackUsersIn_TT605(
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
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={688,-358})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT605(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX601 - hot side" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={611,-405})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    TCV601(
    Kv=Valve.TCV721.Kv,
    dp_nom=Valve.TCV721.dp_nom,
    rho_nom=Valve.TCV721.rho_nom,
    q_m3h_nom=Valve.TCV721.q_nom_m3h,
    Tin_start=Valve.TCV721.Tin_start,
    pin_start=Valve.TCV721.pin_start,
    q_m3h_start=q_Users) annotation (Placement(transformation(
        extent={{-10,10.5},{10,-10.5}},
        rotation=-90,
        origin={565.5,-460})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_TT724_TCV1(
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
        origin={566,-426})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT606(T_start=Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX601 - hot side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={564,-406})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_UsersOut_EX601(
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
        origin={621,-480})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TTR05(T_start=Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX601 - hot side" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={691,-483})));
  Modelica.Blocks.Sources.TimeTable TCV601_theta(table=TCV601theta)
    annotation (Placement(transformation(extent={{529,-470},{549,-450}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV605(Kv=Valve.FCV401.Kv) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-148,-288})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV606(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pin_start_S4)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-148,-308})));
  Modelica.Blocks.Sources.BooleanConstant FV605_OnOff(k=FV605_state)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-148,-266})));
  Modelica.Blocks.Sources.BooleanConstant FV606_OnOff(k=FV606_state)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-148,-330})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV605_Status annotation (
      Placement(transformation(
        extent={{-19.25,-19.75},{19.25,19.75}},
        rotation=90,
        origin={-148.25,-255.25})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV606_Status annotation (
      Placement(transformation(
        extent={{19.25,-19.75},{-19.25,19.75}},
        rotation=90,
        origin={-148.25,-341.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP301(
    Tin_hot_start=Tin_User_start_S3_hp,
    Tin_cold_start=Tin_Source_start_S3_hp,
    Tout_cold_start=Tout_Source_start_S3_hp,
    Tout_hot_set=Tout_User_start_S3_hp,
    pin_hot_start=pin_User_start_S3_hp,
    pin_cold_start=pin_Source_start_S3_hp,
    dp_hot_start=15000,
    dp_cold_start=15000,
    m_flow_hot_start=m_flow_User_S3,
    m_flow_cold_start=m_flow_Source_S3)
          annotation (Placement(transformation(extent={{-475,-269},{-441,-235}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserOut(
    L=L_S3_PL6,
    t=t_S3,
    pin_start=pin_User_start_S3 - 0.04e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-217})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D301(
    H=2,
    T_start=Tout_User_start_S3,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
         annotation (Placement(transformation(extent={{-432,-158},{-408,-112}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P301(
    Tin_start(displayUnit="K") = Pump.P301.Tin_start,
    Tout_start=Pump.P301.Tout_start,
    a=Pump.P301.a,
    b=Pump.P301.b,
    m_flow_start=m_flow_User_S3,
    dpnom=Pump.P301.dpnom,
    etaelec=Pump.P301.etaelec,
    etamech=Pump.P301.etamech,
    etanom=Pump.P301.etanom,
    hin_start=Pump.P301.hin_start,
    m_flow_nom=Pump.P301.m_flow_nom,
    omeganom=Pump.P301.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    headnom=Pump.P301.headnom,
    qnom_inm3h=Pump.P301.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P301.rhonom,
    headmax=Pump.P301.headnommax,
    headmin=Pump.P301.headnommin,
    qnom_inm3h_min=Pump.P301.qnommin_inm3h,
    qnom_inm3h_max=Pump.P301.qnommax_inm3h,
    use_in_omega=true)
     "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-186})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-445.5,-67.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302(T_start=Tout_User_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-445.5,-76.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_P301_D301(
    L=L_S3_PL4,
    t=t_S3,
    pin_start=pout_User_start_S3_pump,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-161})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_D301out(
    L=L_S3_PL3,
    t=t_S3,
    pin_start=pout_User_start_S3_pump - 0.2e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-448,-109})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_H(
    L=L_S3_PL1,
    t=t_S3,
    pin_start=pout_User_start_S3_pump - 0.21e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-48})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-470.5,-142.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301(T_start=Tin_User_start_S3, p_start=pin_User_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-470.5,-151.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301(T_start=
        Tin_User_start_S3, p_start=pin_User_start_S3)
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-470,-194})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserIn(
    L=L_S3_PL7,
    t=t_S3,
    pin_start=pin_User_start_S3 - 0.02e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-468,-217})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301Sensors_C(
    L=L_S3_PL5,
    t=t_S3,
    pin_start=pin_User_start_S3,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-468,-172})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_C(
    L=L_S3_PL2,
    pin_start=pin_User_start_S3,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-468,-48})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P302(
    Tin_start(displayUnit="K") = Pump.P302.Tin_start,
    Tout_start=Pump.P302.Tout_start,
    a=Pump.P302.a,
    b=Pump.P302.b,
    m_flow_start=m_flow_Source_S3,
    dpnom=Pump.P302.dpnom,
    etaelec=Pump.P302.etaelec,
    etamech=Pump.P302.etamech,
    etanom=Pump.P302.etanom,
    hin_start=Pump.P302.hin_start,
    m_flow_nom=Pump.P302.m_flow_nom,
    omeganom=Pump.P302.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    headnom=Pump.P302.headnom,
    qnom_inm3h=Pump.P302.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P302.rhonom,
    headmax=Pump.P302.headnommax,
    headmin=Pump.P302.headnommin,
    qnom_inm3h_min=Pump.P302.qnommin_inm3h,
    qnom_inm3h_max=Pump.P302.qnommax_inm3h,
    use_in_omega=true)                        "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-305})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-445.5,-276.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304(T_start=Tin_Source_start_S3, p_start=pin_Source_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-445.5,-285.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_H(
    L=L_S3_PL9,
    t=t_S3,
    pin_start=pout_Source_start_S3_pump - 0.1e5,
    Tin_start=Tin_Source_start_S3,
    Tout_start=Tin_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-448,-343})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303(T_start=Tout_Source_start_S3, p_start=pout_Source_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-470.5,-307.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302(T_start=
        Tout_Source_start_S3, p_start=pout_Source_start_S3)
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-470,-321})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_SourceOut(
    L=L_S3_PL8,
    t=t_S3,
    pin_start=pout_Source_start_S3,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-468,-287})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_C(
    L=L_S3_PL10,
    t=t_S3,
    pin_start=pout_Source_start_S3,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-468,-343})));
  Modelica.Blocks.Interaction.Show.RealValue TT301_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-486,-179},{-534,-126}})));
  Modelica.Blocks.Interaction.Show.RealValue TT302_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-430,-101},{-382,-48}})));
  Modelica.Blocks.Interaction.Show.RealValue TT303_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-488,-333},{-536,-280}})));
  Modelica.Blocks.Interaction.Show.RealValue TT304_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-430,-311},{-382,-258}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP601(
    Tin_hot_start=Tin_User_start_S6_hp,
    Tin_cold_start=Tin_Source_start_S6_hp,
    Tout_cold_start=Tout_Source_start_S6_hp,
    Tout_hot_set=Tout_User_start_S6_hp,
    pin_hot_start=pin_User_start_S6_hp,
    pin_cold_start=pin_Source_start_S6_hp,
    dp_hot_start=15000,
    dp_cold_start=15000,
    m_flow_hot_start=m_flow_User_S6,
    m_flow_cold_start=m_flow_Source_S6)
                 "Heat pump of system 600"
          annotation (Placement(transformation(extent={{-101,-201},{-67,-167}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_UserOut(
    L=L_S6_PL6,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.04e5,
    pout_start=pin_User_start_S6 - 0.05e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-155})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P601(
    Tin_start(displayUnit="K") = Pump.P601.Tin_start,
    Tout_start=Pump.P601.Tout_start,
    a=Pump.P601.a,
    b=Pump.P601.b,
    m_flow_start=m_flow_User_S6,
    dpnom=Pump.P601.dpnom,
    etaelec=Pump.P601.etaelec,
    etamech=Pump.P601.etamech,
    etanom=Pump.P601.etanom,
    hin_start=Pump.P601.hin_start,
    m_flow_nom=Pump.P601.m_flow_nom,
    omeganom=Pump.P601.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    headnom=Pump.P601.headnom,
    qnom_inm3h=Pump.P601.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P601.rhonom,
    headmax=Pump.P601.headnommax,
    headmin=Pump.P601.headnommin,
    qnom_inm3h_min=Pump.P601.qnommin_inm3h,
    qnom_inm3h_max=Pump.P601.qnommax_inm3h,
    use_in_omega=true) "Pump of System 600"
                          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-126})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT602 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-71.5,-60.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT602(T_start=Tout_User_start_S6, p_start=pout_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-71.5,-69.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_P301_D301(
    L=L_S6_PL4,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pout_User_start_S6_pump,
    pout_start=pout_User_start_S6_pump - 0.01e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-92})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_rCD_H(
    L=L_S6_PL1,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pout_User_start_S6_pump - 0.21e5,
    pout_start=pout_User_start_S6_pump - 0.22e5,
    Tin_start=Tout_User_start_S6,
    Tout_start=Tout_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-41})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT601 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-96.5,-80.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT601(T_start=Tin_User_start_S6, p_start=pin_User_start_S6)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-96.5,-89.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT601(T_start=
        Tin_User_start_S6, p_start=pin_User_start_S6)
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-96,-132})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_UserIn(
    L=L_S6_PL7,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.02e5,
    pout_start=pin_User_start_S6 - 0.03e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-94,-155})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP301Sensors_C(
    L=L_S6_PL5,
    t=t_S6,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6 - 0.01e5,
    pout_start=pin_User_start_S6 - 0.02e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-94,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_rCD_C(
    L=L_S6_PL2,
    m_flow_start=m_flow_User_S6,
    pin_start=pin_User_start_S6,
    pout_start=pin_User_start_S6 - 0.01e5,
    Tin_start=Tin_User_start_S6,
    Tout_start=Tin_User_start_S6,
    Di=Di_S6,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-94,-41})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P602(
    Tin_start(displayUnit="K") = Pump.P602.Tin_start,
    Tout_start=Pump.P602.Tout_start,
    a=Pump.P602.a,
    b=Pump.P602.b,
    m_flow_start=m_flow_Source_S6,
    dpnom=Pump.P602.dpnom,
    etaelec=Pump.P602.etaelec,
    etamech=Pump.P602.etamech,
    etanom=Pump.P602.etanom,
    hin_start=Pump.P602.hin_start,
    m_flow_nom=Pump.P602.m_flow_nom,
    omeganom=Pump.P602.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    pout_start(displayUnit="Pa") = 1.9920743e5,
    headnom=Pump.P602.headnom,
    qnom_inm3h=Pump.P602.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P602.rhonom,
    headmax=Pump.P602.headnommax,
    headmin=Pump.P602.headnommin,
    qnom_inm3h_min=Pump.P602.qnommin_inm3h,
    qnom_inm3h_max=Pump.P602.qnommax_inm3h,
    use_in_omega=true)
      "Pump of System 600" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-286})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT603 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-71.5,-240.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT604(T_start=Tin_Source_start_S6_hp, p_start=pin_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-71.5,-260.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_H(
    L=L_S6_PL9,
    t=t_S6,
    pin_start=pout_Source_start_S6_pump - 0.1e5,
    Tin_start=Tin_Source_start_S6,
    Tout_start=Tin_Source_start_S6,
    Di=Di_S6,
    q_m3h_start=q_m3h_S6_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-325})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT603(T_start=Tout_Source_start_S6_hp)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-96.5,-241.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT602(T_start=
        Tout_Source_start_S6_hp, p_start=pout_Source_start_S6_hp)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=270,
        origin={-96,-261})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_HP601_SourceOut(
    L=L_S6_PL8,
    t=t_S6,
    pin_start=pout_Source_start_S6_hp,
    Tin_start=Tout_Source_start_S6,
    Tout_start=Tout_Source_start_S6,
    Di=Di_S6,
    q_m3h_start=q_m3h_S6_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-94,-220})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_C(
    L=L_S6_PL10,
    t=t_S6,
    pin_start=pout_Source_start_S6_pump + 0.1e5,
    Tin_start=Tout_Source_start_S6,
    Tout_start=Tout_Source_start_S6,
    Di=Di_S6,
    q_m3h_start=q_m3h_S6_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-94,-325})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S6_PL_S600_S600_H1(
    L=L_S6_PL9,
    t=t_S6,
    pin_start=pout_Source_start_S6_pump - 0.1e5,
    Tin_start=Tin_Source_start_S6,
    Tout_start=Tin_Source_start_S6,
    Di=Di_S6,
    q_m3h_start=q_m3h_S6_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-74,-220})));
  Modelica.Blocks.Interaction.Show.RealValue TT601_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-114,-115},{-162,-62}})));
  Modelica.Blocks.Interaction.Show.RealValue TT602_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-54,-97},{-6,-44}})));
  Modelica.Blocks.Interaction.Show.RealValue TT603_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-114,-257},{-162,-204}})));
  Modelica.Blocks.Interaction.Show.RealValue TT604_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-50,-287},{-2,-234}})));
  Modelica.Blocks.Interaction.Show.RealValue TT606_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{548,-433},{500,-380}})));
  Modelica.Blocks.Interaction.Show.RealValue TT605_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{628,-431},{676,-378}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV603(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=9) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-140,-10})));
  Modelica.Blocks.Sources.BooleanConstant FV603_OnOff(k=FV402_state)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-140,10})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV603_Status annotation (
      Placement(transformation(
        extent={{-18.5,-18},{18.5,18}},
        rotation=90,
        origin={-140.5,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV604(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=9) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-110,-20})));
  Modelica.Blocks.Sources.BooleanConstant FV604_OnOff(k=FV402_state)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-110,10})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV604_Status annotation (
      Placement(transformation(
        extent={{-18.5,-18},{18.5,18}},
        rotation=90,
        origin={-110.5,22})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D302(
    H=1,
    T_start(displayUnit="K") = 45 + 273.15,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
    annotation (Placement(transformation(extent={{-418,-400},{-390,-344}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV403(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-192,-46})));
  Modelica.Blocks.Sources.BooleanConstant FV403_OnOff(k=FV403_state)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-192,-26})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV401_Status4
    annotation (Placement(transformation(extent={{-18.5,-18},{18.5,18}},
        rotation=90,
        origin={-192.5,-16})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV404(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=3) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-192,-82})));
  Modelica.Blocks.Sources.BooleanConstant FV404_OnOff(k=FV404_state)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-192,-102})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV404_Status annotation (
      Placement(transformation(
        extent={{18.5,-18},{-18.5,18}},
        rotation=90,
        origin={-192.5,-114})));
  Sources.PumpInput P601_input(omega=P601omega, q_m3h=P601qm3h)
    annotation (Placement(transformation(extent={{-40,-140},{-60,-120}})));
  Sources.PumpInput P602_input(omega=P602omega, q_m3h=P602qm3h)
    annotation (Placement(transformation(extent={{-42,-300},{-62,-280}})));
  Sources.PumpInput P302_input(omega=P302omega, q_m3h=P302qm3h)
    annotation (Placement(transformation(extent={{-412,-320},{-432,-300}})));
  Sources.PumpInput P301_input(omega=P301omega, q_m3h=P301qm3h)
    annotation (Placement(transformation(extent={{-416,-200},{-436,-180}})));
equation
  connect(PL_rackUsersIn_TT605.outlet, EX601.inhot) annotation (Line(
      points={{688,-368},{688,-416},{609.001,-416},{609.001,-387}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT605.outlet, TT605.inlet) annotation (Line(
      points={{688,-368},{688,-416},{608.6,-416},{608.6,-405}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_rackUsersIn_TT605.inlet, PL_RR_UsersIn.inlet) annotation (Line(
      points={{688,-348},{688,-280},{674,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(TT606.inlet, EX601.outhot) annotation (Line(
      points={{566.4,-406},{566.4,-396.5},{567,-396.5},{567,-387}},
      color={140,56,54},
      thickness=0.5));
  connect(TT606.inlet, PL_TT724_TCV1.inlet) annotation (Line(
      points={{566.4,-406},{566.4,-411},{566,-411},{566,-416}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_TT724_TCV1.outlet, TCV601.inlet) annotation (Line(
      points={{566,-436},{566,-441},{565.5,-441},{565.5,-450}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601.outlet, PL_UsersOut_EX601.inlet) annotation (Line(
      points={{565.5,-470},{565.5,-480},{611,-480}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_UsersOut_EX601.outlet, TTR05.inlet) annotation (Line(
      points={{631,-480},{661,-480},{661,-480.6},{691,-480.6}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV601_theta.y, TCV601.opening)
    annotation (Line(points={{550,-460},{557.1,-460}}, color={0,0,127}));
  connect(FV605_OnOff.y, FV605.u)
    annotation (Line(points={{-148,-277},{-148,-284.8}}, color={255,0,255}));
  connect(FV606_OnOff.y, FV606.u)
    annotation (Line(points={{-148,-319},{-148,-311.2}}, color={255,0,255}));

  connect(FV605_OnOff.y, FV605_Status.activePort) annotation (Line(points={{-148,
          -277},{-148.25,-277},{-148.25,-277.387}}, color={255,0,255}));
  connect(FV606_OnOff.y, FV606_Status.activePort) annotation (Line(points={{-148,
          -319},{-164.125,-319},{-164.125,-319.113},{-148.25,-319.113}}, color={
          255,0,255}));
  connect(FV605.outlet, PL_S400_rCD_cold.outlet) annotation (Line(
      points={{-158,-288},{-220,-288},{-220,-190},{-352,-190},{-352,-80},{-362,
          -80},{-362,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(FV606.inlet, PL_S400_rCD_hot.inlet) annotation (Line(
      points={{-158,-308},{-178,-308},{-178,-198},{-252,-198},{-252,-52},{-322,
          -52}},
      color={140,56,54},
      thickness=0.5));

  connect(PT301.inlet,TT301. inlet) annotation (Line(
      points={{-468.3,-142.5},{-468.3,-151.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot,S3_PL_HP301_UserOut. inlet) annotation (Line(
      points={{-447.8,-241.8},{-447.8,-234.4},{-448,-234.4},{-448,-227}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserOut.outlet,P301. inlet) annotation (Line(
      points={{-448,-207},{-448,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet,S3_PL_P301_D301. inlet) annotation (Line(
      points={{-448,-178},{-448,-171}},
      color={140,56,54},
      thickness=0.5));
  connect(D301.outlet,S3_PL_D301out. inlet) annotation (Line(
      points={{-432,-123.5},{-448,-123.5},{-448,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_D301out.outlet,TT302. inlet) annotation (Line(
      points={{-448,-99},{-448,-80.75},{-447.7,-80.75},{-447.7,-76.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet,PT302. inlet) annotation (Line(
      points={{-447.7,-76.5},{-447.7,-67.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet,S3_PL_S300_rCD_H. inlet) annotation (Line(
      points={{-447.7,-67.5},{-447.7,-62.75},{-448,-62.75},{-448,-58}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold,PT303. inlet) annotation (Line(
      points={{-447.8,-262.2},{-447.8,-269.35},{-447.7,-269.35},{-447.7,-276.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet,TT304. inlet) annotation (Line(
      points={{-447.7,-276.5},{-447.7,-285.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet,P302. outlet) annotation (Line(
      points={{-447.7,-285.5},{-447.7,-290.25},{-448,-290.25},{-448,-297}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outcold,S3_PL_HP301_SourceOut. inlet) annotation (Line(
      points={{-468.2,-262.2},{-468.2,-269.6},{-468,-269.6},{-468,-277}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_SourceOut.outlet,TT303. inlet) annotation (Line(
      points={{-468,-297},{-468,-302.25},{-468.3,-302.25},{-468.3,-307.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S300_rCD_C.outlet,PT301. inlet) annotation (Line(
      points={{-468,-58},{-468,-142.5},{-468.3,-142.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet,S3_PL_HP301Sensors_C. inlet) annotation (Line(
      points={{-468.3,-151.5},{-468.3,-156.75},{-468,-156.75},{-468,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301Sensors_C.outlet,FT301. inlet) annotation (Line(
      points={{-468,-182},{-468,-191}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.outlet,S3_PL_HP301_UserIn. inlet) annotation (Line(
      points={{-468,-197},{-468,-207}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserIn.outlet,HP301. inhot) annotation (Line(
      points={{-468,-227},{-468,-234.4},{-468.2,-234.4},{-468.2,-241.8}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.T,TT301_. numberPort) annotation (Line(points={{-477.65,-151.5},
          {-482.062,-151.5},{-482.062,-152.5},{-482.4,-152.5}},
                                                color={0,0,127}));
  connect(TT302.T,TT302_. numberPort) annotation (Line(points={{-438.35,-76.5},
          {-438.35,-74.5},{-433.6,-74.5}},          color={0,0,127}));
  connect(TT303.T,TT303_. numberPort) annotation (Line(points={{-477.65,-307.5},
          {-482,-307.5},{-482,-306.5},{-484.4,-306.5}},
                                                    color={0,0,127}));
  connect(TT304_.numberPort,TT304. T) annotation (Line(points={{-433.6,-284.5},
          {-433.6,-285.5},{-438.35,-285.5}},
                                   color={0,0,127}));
  connect(S3_PL_S300_rCD_H.outlet, rackCD_Hot_S300_S500.inlet) annotation (Line(
      points={{-448,-38},{-448,-20},{-402,-20},{-402,45},{-418,45}},
      color={140,56,54},
      thickness=0.5));
  connect(PT601.inlet,TT601. inlet) annotation (Line(
      points={{-94.3,-80.5},{-94.3,-89.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outhot,S6_PL_HP601_UserOut. inlet) annotation (Line(
      points={{-73.8,-173.8},{-73.8,-172.4},{-74,-172.4},{-74,-165}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserOut.outlet,P601. inlet) annotation (Line(
      points={{-74,-145},{-74,-134}},
      color={140,56,54},
      thickness=0.5));
  connect(P601.outlet,S6_PL_P301_D301. inlet) annotation (Line(
      points={{-74,-118},{-74,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(TT602.inlet,PT602. inlet) annotation (Line(
      points={{-73.7,-69.5},{-73.7,-60.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT602.inlet,S6_PL_S600_rCD_H. inlet) annotation (Line(
      points={{-73.7,-60.5},{-73.7,-55.75},{-74,-55.75},{-74,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(P602.inlet,S6_PL_S600_S600_H. outlet) annotation (Line(
      points={{-74,-294},{-74,-315}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_SourceOut.outlet,TT603. inlet) annotation (Line(
      points={{-94,-230},{-94,-236.25},{-94.3,-236.25},{-94.3,-241.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_rCD_C.outlet,PT601. inlet) annotation (Line(
      points={{-94,-51},{-94,-80.5},{-94.3,-80.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT601.inlet,S6_PL_HP301Sensors_C. inlet) annotation (Line(
      points={{-94.3,-89.5},{-94.3,-94.75},{-94,-94.75},{-94,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP301Sensors_C.outlet,FT601. inlet) annotation (Line(
      points={{-94,-120},{-94,-129}},
      color={140,56,54},
      thickness=0.5));
  connect(FT601.outlet,S6_PL_HP601_UserIn. inlet) annotation (Line(
      points={{-94,-135},{-94,-145}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_HP601_UserIn.outlet,HP601. inhot) annotation (Line(
      points={{-94,-165},{-94,-172.4},{-94.2,-172.4},{-94.2,-173.8}},
      color={140,56,54},
      thickness=0.5));
  connect(TT602.inlet,S6_PL_P301_D301. outlet) annotation (Line(
      points={{-73.7,-69.5},{-73.7,-75.75},{-74,-75.75},{-74,-82}},
      color={140,56,54},
      thickness=0.5));
  connect(TT604.inlet,P602. outlet) annotation (Line(
      points={{-73.7,-260.5},{-73.7,-254.25},{-74,-254.25},{-74,-278}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet,TT604. inlet) annotation (Line(
      points={{-73.7,-240.5},{-73.7,-260.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT603.inlet,S6_PL_S600_S600_H1. inlet) annotation (Line(
      points={{-73.7,-240.5},{-73.7,-236.25},{-74,-236.25},{-74,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H1.outlet,HP601. incold) annotation (Line(
      points={{-74,-210},{-74,-211.1},{-73.8,-211.1},{-73.8,-194.2}},
      color={140,56,54},
      thickness=0.5));
  connect(TT603.inlet,FT602. inlet) annotation (Line(
      points={{-94.3,-241.5},{-94.3,-244.75},{-94,-244.75},{-94,-258}},
      color={140,56,54},
      thickness=0.5));
  connect(FT602.outlet,S6_PL_S600_S600_C. inlet) annotation (Line(
      points={{-94,-264},{-94,-315}},
      color={140,56,54},
      thickness=0.5));
  connect(TT601.T, TT601_.numberPort) annotation (Line(points={{-103.65,-89.5},
          {-107.025,-89.5},{-107.025,-88.5},{-110.4,-88.5}},
                                                 color={0,0,127}));
  connect(FV605.inlet, S6_PL_S600_S600_C.inlet) annotation (Line(
      points={{-138,-288},{-94,-288},{-94,-315}},
      color={140,56,54},
      thickness=0.5));
  connect(FV606.outlet, S6_PL_S600_S600_H.outlet) annotation (Line(
      points={{-138,-308},{-74,-308},{-74,-315}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_H.inlet, EX601.outcold) annotation (Line(
      points={{-74,-335},{-74,-344},{609.001,-344},{609.001,-369}},
      color={140,56,54},
      thickness=0.5));
  connect(S6_PL_S600_S600_C.outlet, EX601.incold) annotation (Line(
      points={{-94,-335},{-94,-356},{556,-356},{556,-369},{567,-369}},
      color={140,56,54},
      thickness=0.5));
  connect(TT603.T, TT603_.numberPort) annotation (Line(points={{-103.65,-241.5},
          {-110.4,-241.5},{-110.4,-230.5}},
                                         color={0,0,127}));
  connect(TT604.T, TT604_.numberPort) annotation (Line(points={{-64.35,-260.5},
          {-53.6,-260.5}},                                  color={0,0,127}));
  connect(TT606.T, TT606_.numberPort) annotation (Line(points={{556.2,-406},{
          546.9,-406},{546.9,-406.5},{551.6,-406.5}},
                                                color={0,0,127}));
  connect(TT605.T, TT605_.numberPort) annotation (Line(points={{618.8,-405},{
          623.6,-405},{623.6,-404.5},{624.4,-404.5}},
                                                color={0,0,127}));
  connect(TTR05.inlet, FTR03.outlet) annotation (Line(
      points={{691,-480.6},{716,-480.6},{716,-320},{828,-320},{828,-280},{823,-280}},
      color={140,56,54},
      thickness=0.5));

  connect(TT602.T, TT602_.numberPort) annotation (Line(points={{-64.35,-69.5},{
          -60.975,-69.5},{-60.975,-70.5},{-57.6,-70.5}},
                                                 color={0,0,127}));
  connect(TT303.inlet, FT302.inlet) annotation (Line(
      points={{-468.3,-307.5},{-468.3,-318},{-468,-318}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet, S3_PL_S600_S300_C.inlet) annotation (Line(
      points={{-468,-324},{-468,-333}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet, S3_PL_S600_S300_H.outlet) annotation (Line(
      points={{-448,-313},{-448,-333}},
      color={140,56,54},
      thickness=0.5));

  connect(S3_PL_S600_S300_H.inlet, FV603.outlet) annotation (Line(
      points={{-448,-353},{-448,-362},{-166,-362},{-166,-10},{-150,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(FV603.inlet, S6_PL_S600_rCD_H.outlet) annotation (Line(
      points={{-130,-10},{-74,-10},{-74,-31}},
      color={140,56,54},
      thickness=0.5));
  connect(FV603_OnOff.y, FV603_Status.activePort) annotation (Line(points={{-140,-1},
          {-138.25,-1},{-138.25,-1.275},{-140.5,-1.275}},     color={255,0,255}));
  connect(FV603_OnOff.y, FV603.u)
    annotation (Line(points={{-140,-1},{-140,-6.8}}, color={255,0,255}));
  connect(FV604.outlet, S6_PL_S600_rCD_C.inlet) annotation (Line(
      points={{-100,-20},{-94,-20},{-94,-31}},
      color={140,56,54},
      thickness=0.5));
  connect(FV604_OnOff.y, FV604.u)
    annotation (Line(points={{-110,-1},{-110,-16.8}},
                                                    color={255,0,255}));
  connect(FV604_OnOff.y, FV604_Status.activePort) annotation (Line(points={{-110,-1},
          {-110,0.725},{-110.5,0.725}},   color={255,0,255}));
  connect(S3_PL_S600_S300_H.inlet, D302.outlet) annotation (Line(
      points={{-448,-353},{-448,-358},{-418,-358}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_C.outlet, D302.inlet) annotation (Line(
      points={{-468,-353},{-468,-386},{-418,-386}},
      color={140,56,54},
      thickness=0.5));
  connect(FV604.inlet, D302.inlet) annotation (Line(
      points={{-120,-20},{-130,-20},{-130,-406},{-432,-406},{-432,-386},{-418,
          -386}},
      color={140,56,54},
      thickness=0.5));

  connect(FV403_OnOff.y, FV401_Status4.activePort) annotation (Line(points={{-192,
          -37},{-190.25,-37},{-190.25,-37.275},{-192.5,-37.275}}, color={255,0,255}));
  connect(FV403_OnOff.y, FV403.u)
    annotation (Line(points={{-192,-37},{-192,-42.8}}, color={255,0,255}));
  connect(FV403.inlet, D302.inlet) annotation (Line(
      points={{-182,-46},{-130,-46},{-130,-406},{-432,-406},{-432,-386},{-418,
          -386}},
      color={140,56,54},
      thickness=0.5));

  connect(FV403.outlet, FV401.outlet) annotation (Line(
      points={{-202,-46},{-214,-46},{-214,-24},{-362,-24},{-362,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FV404_OnOff.y, FV404.u)
    annotation (Line(points={{-192,-91},{-192,-85.2}}, color={255,0,255}));
  connect(FV404_OnOff.y, FV404_Status.activePort) annotation (Line(points={{-192,
          -91},{-192,-97.862},{-192.5,-97.862},{-192.5,-92.725}}, color={255,0,255}));
  connect(FV404.inlet, FV402.inlet) annotation (Line(
      points={{-202,-82},{-218,-82},{-218,-28},{-322,-28},{-322,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FV404.outlet, FV603.outlet) annotation (Line(
      points={{-182,-82},{-166,-82},{-166,-10},{-150,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(HP601.outcold, S6_PL_HP601_SourceOut.inlet) annotation (Line(
      points={{-94.2,-194.2},{-94.2,-202.1},{-94,-202.1},{-94,-210}},
      color={140,56,54},
      thickness=0.5));

  connect(P601_input.y, P601.in_omega)
    annotation (Line(points={{-61,-130},{-69,-130}}, color={0,0,127}));
  connect(P602_input.y, P602.in_omega)
    annotation (Line(points={{-63,-290},{-69,-290}}, color={0,0,127}));
  connect(P302_input.y, P302.in_omega) annotation (Line(points={{-433,-310},{
          -438,-310},{-438,-309},{-443,-309}},
                                          color={0,0,127}));
  connect(P301_input.y, P301.in_omega)
    annotation (Line(points={{-437,-190},{-443,-190}}, color={0,0,127}));
  connect(D301.inlet, S3_PL_P301_D301.outlet) annotation (Line(
      points={{-432,-146.5},{-448,-146.5},{-448,-151}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S300_rCD_C.inlet, rackCD_Cold_S300_S300.outlet) annotation (
      Line(
      points={{-468,-38},{-468,-12},{-442,-12},{-442,5.25},{-448.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(
      StopTime=50,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Sequence8;
