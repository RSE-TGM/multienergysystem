within MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemI_F
  extends CentralisedSystemI_B;

  // S500

  // General Pipeline Data
  parameter Types.Length Di_S5 = 39e-3;
  parameter Types.Length t_S5 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
  parameter Real q_m3h_S5_Source = 4;
  parameter Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
  parameter Real q_m3h_S5_User = 6;

  parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P501qm3h[:,:] = [0, 8; 100, 8];

  parameter Real Pchpomega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real Pchpqm3h[:,:] = [0, 3.94; 100, 3.94];



  parameter Types.Pressure pin_Source_start_S5 = 2e5;
  parameter Types.Pressure pout_Source_start_S5 = 1.9e5;
  parameter Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
  parameter Types.Temperature Tout_Source_start_S5 = 70 + 273.15;

  parameter Types.Pressure pin_User_start_S5 = 1.69e5;
  parameter Types.Pressure pout_User_start_S5 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S5 = 70 + 273.15;
  parameter Types.Temperature Tout_User_start_S5 = 75 + 273.15;

  parameter Types.Power PeCHP[:,:] = [0, 30e3; 100, 30e3];
  parameter Real FCVchptheta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];


  Components.Pipes.BrazedPlateHeatExchanger E501(
    Di_cold=BPHE.E501.Di_cold,
    Di_hot=BPHE.E501.Di_hot,
    L_cold=BPHE.E501.L_cold,
    L_hot=BPHE.E501.L_hot,
    MWall=BPHE.E501.MWall,
    Stot_cold=BPHE.E501.Stot_cold,
    Stot_hot=BPHE.E501.Stot_hot,
    Tin_start_cold=BPHE.E501.Tin_start_cold,
    Tin_start_hot=BPHE.E501.Tin_start_hot,
    Tout_start_cold=BPHE.E501.Tout_start_cold,
    Tout_start_hot=BPHE.E501.Tout_start_hot,
    cpm_cold=BPHE.E501.cpm_cold,
    cpm_hot=BPHE.E501.cpm_hot,
    t_cold=BPHE.E501.t_cold,
    t_hot=BPHE.E501.t_hot,
    gamma_nom_cold=BPHE.E501.gamma_nom_cold,
    gamma_nom_hot=BPHE.E501.gamma_nom_hot,
    h_cold=BPHE.E501.h_cold,
    h_hot=BPHE.E501.h_hot,
    hctype_cold=hctype,
    hctype_hot=hctype,
    hin_start_cold=BPHE.E501.hin_start_cold,
    hin_start_hot=BPHE.E501.hin_start_hot,
    k_cold=BPHE.E501.k_cold,
    k_hot=BPHE.E501.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E501.lambdam_cold,
    lambdam_hot=BPHE.E501.lambdam_hot,
    m_flow_start_cold=BPHE.E501.m_flow_start_cold,
    m_flow_start_hot=BPHE.E501.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E501.nPipes_cold,
    nPipes_hot=BPHE.E501.nPipes_hot,
    nPlates=BPHE.E501.nPlates,
    pin_start_cold=BPHE.E501.pin_start_cold,
    pin_start_hot=BPHE.E501.pin_start_hot,
    pout_start_cold=BPHE.E501.pout_start_cold,
    pout_start_hot=BPHE.E501.pout_start_hot,
    rho_nom_cold=(BPHE.E501.rhoin_nom_cold + BPHE.E501.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E501.rhoin_nom_hot + BPHE.E501.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E501.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E501.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E501.u_nom_cold,
    u_nom_hot=BPHE.E501.u_nom_hot)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-636,-189},  extent={{-17,
            -28.0002},{17,28.0001}},                                                               rotation=-90)));
  Components.TurboMachines.ControlledPump
    P501(
    Tin_start(displayUnit="K") = Tout_User_start_S5,
    Tout_start(displayUnit="K") = Tout_User_start_S5,
    a=Pump.P501.a,
    b=Pump.P501.b,
    m_flow_start=m_flow_User_S5,
    dpnom=Pump.P501.dpnom,
    etaelec=Pump.P501.etaelec,
    etamech=Pump.P501.etamech,
    etanom=Pump.P501.etanom,
    hin_start=Pump.P501.hin_start,
    m_flow_nom=Pump.P501.m_flow_nom,
    omeganom=Pump.P501.omeganom,
    pin_start(displayUnit="Pa") = Pump.P501.pin_start,
    pout_start(displayUnit="Pa") = Pump.P501.pout_start,
    qnom_inm3h=Pump.P501.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P501.rhonom,
    headnom=Pump.P501.headnom,
    headmax=Pump.P501.headnommax,
    headmin=Pump.P501.headnommin,
    qnom_inm3h_min=Pump.P501.qnommin_inm3h,
    qnom_inm3h_max=Pump.P501.qnommax_inm3h,
    use_q_m3hr=true)                        annotation (Placement(
        transformation(
        extent={{-14,14},{14,-14}},
        rotation=90,
        origin={-616,-142})));
  Components.Pipes.RoundPipe1DFV                                          S5_PL_CHP_EX501_cold(
    L=5,
    t=t_S5,
    pin_start=pin_User_start_S5 - 0.02e5,
    Tin_start=Tin_User_start_S5,
    Tout_start=Tin_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_Source,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-656,-237})));
  Components.Pipes.RoundPipe1DFV                                          S5_PL_CHP_EX501_hot(
    L=5,
    t=t_S5,
    pin_start=pin_User_start_S5 - 0.04e5,
    Tin_start=Tout_User_start_S5,
    Tout_start=Tout_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_Source,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-616,-237})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT503(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=90,
        origin={-658.5,-213.5})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT504(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-613,-213})));
  Components.Pipes.RoundPipe1DFV                                          S5_PL_CHP_EX501_hot1(
    L=5,
    t=t_S5,
    pin_start=pin_User_start_S5 - 0.04e5,
    Tin_start=Tout_User_start_S5,
    Tout_start=Tout_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_User,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-616,-61})));
  Components.Fittings.SuddenAreaChange
    suddenAreaChange(D_i=51e-3, D_o=Di_S5)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-616,-30})));
  Components.Pipes.RoundPipe1DFV                                          S5_PL_CHP_EX501_cold1(
    L=5,
    t=t_S5,
    pin_start=pin_User_start_S5 - 0.02e5,
    Tin_start=Tin_User_start_S5,
    Tout_start=Tin_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_User,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-656,-61})));
  Components.Fittings.SuddenAreaChange
    suddenAreaChange1(D_i=51e-3, D_o=Di_S5)
                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-656,-30})));
  Sensors.IdealAbsolutePressureSensor                                          PT502
    annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-613.5,-79.5})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT502(T_start=Tout_User_start_S5) annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-613.5,-110.5})));
  Sensors.IdealMassFlowSensor                                          FT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-659,-149})));
  Sensors.IdealAbsolutePressureSensor                                          PT501
    annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-658.5,-80.5})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT501(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-658.5,-99.5})));
  Components.Pipes.RoundPipe1DFV                                          S5_PL_CHP_EX501_cold2(
    L=5,
    t=t_S5,
    pin_start=pin_User_start_S5 - 0.02e5,
    Tin_start=Tin_User_start_S5,
    Tout_start=Tin_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_User,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-656,-121})));
  Modelica.Blocks.Sources.TimeTable Pe_CHP(table=PeCHP)
    annotation (Placement(transformation(extent={{-700,-370},{-680,-350}})));
  Sources.PumpInput P501_input(
    useOmega=false,
    omega=P501omega,
    q_m3h=P501qm3h)
    annotation (Placement(transformation(extent={{-580,-159},{-600,-138}})));
  Components.TurboMachines.ControlledPump
    P1(
    Tin_start(displayUnit="K") = Tout_User_start_S5,
    Tout_start(displayUnit="K") = Tout_User_start_S5,
    a=Pump.P501.a,
    b=Pump.P501.b,
    m_flow_start=m_flow_User_S5,
    dpnom=Pump.P501.dpnom,
    etaelec=Pump.P501.etaelec,
    etamech=Pump.P501.etamech,
    etanom=Pump.P501.etanom,
    hin_start=Pump.P501.hin_start,
    m_flow_nom=Pump.P501.m_flow_nom,
    omeganom=Pump.P501.omeganom,
    pin_start(displayUnit="Pa") = Pump.P501.pin_start,
    pout_start(displayUnit="Pa") = Pump.P501.pout_start,
    qnom_inm3h=Pump.P501.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P501.rhonom,
    headnom=Pump.P501.headnom,
    headmax=Pump.P501.headnommax,
    headmin=Pump.P501.headnommin,
    qnom_inm3h_min=Pump.P501.qnommin_inm3h,
    qnom_inm3h_max=Pump.P501.qnommax_inm3h,
    use_q_m3hr=true)                        annotation (Placement(
        transformation(
        extent={{-12.5,12},{12.5,-12}},
        rotation=90,
        origin={-616,-291.5})));
  Sources.PumpInput PCHP_input(
    useOmega=false,
    omega=Pchpomega,
    q_m3h=Pchpqm3h)
    annotation (Placement(transformation(extent={{-580,-307},{-600,-286}})));
  Components.Valves.FlowCoefficientValve
    FCV1(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    rho_nom=Valve.FCV401.rho_nom,
    q_m3h_nom=Valve.FCV401.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-616,-264})));
  Modelica.Blocks.Sources.TimeTable FCVchp_theta(table=FCVchptheta)
    annotation (Placement(transformation(extent={{-580,-274},{-600,-254}})));
  Sources.SinkPressure sinkCHP(
    T0(displayUnit="K") = 15 + 273.15,
    p0=210000,
    R=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-679,-281})));
  Components.ThermalMachines.ControlledCHP CHP "Cogenerator"
    annotation (Placement(transformation(extent={{-670,-394},{-602,-326}})));
  Modelica.Blocks.Sources.BooleanTable CHP_Status(table={1000}, startValue=true)
    "Input to decide whether or nor the CHP is working"
    annotation (Placement(transformation(extent={{-572,-370},{-592,-350}})));
equation
  connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
      points={{-656,-227},{-656,-197.5},{-655.6,-197.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
      points={{-656,-227},{-656,-219.25},{-655.5,-219.25},{-655.5,-213.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
      points={{-616,-227},{-616,-219.25},{-615.8,-219.25},{-615.8,-213}},
      color={140,56,54},
      thickness=0.5));
  connect(TT504.inlet,E501. inhot) annotation (Line(
      points={{-615.8,-213},{-615.8,-212.25},{-616.4,-212.25},{-616.4,-197.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
      Line(
      points={{-616,-51},{-616,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
      Line(
      points={{-656,-40},{-656,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
      points={{-616,-71},{-616,-76.25},{-615.7,-76.25},{-615.7,-79.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT502.inlet,TT502. inlet) annotation (Line(
      points={{-615.7,-79.5},{-615.7,-110.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT502.inlet,P501. outlet) annotation (Line(
      points={{-615.7,-110.5},{-615.7,-94.95},{-616,-94.95},{-616,-130.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet,E501. incold) annotation (Line(
      points={{-656.2,-153.2},{-656.2,-166.85},{-655.6,-166.85},{-655.6,-180.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
      points={{-656,-71},{-656,-75.75},{-656.3,-75.75},{-656.3,-80.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet,TT501. inlet) annotation (Line(
      points={{-656.3,-80.5},{-656.3,-99.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
      points={{-656.2,-144.8},{-656.2,-137.9},{-656,-137.9},{-656,-131}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
      points={{-656.3,-99.5},{-656.3,-105.25},{-656,-105.25},{-656,-111}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.inlet,E501. outcold) annotation (Line(
      points={{-616,-153.2},{-616,-159.55},{-616.4,-159.55},{-616.4,-180.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P501_input.y,P501. in_q_m3hr) annotation (Line(points={{-601,-148.5},{
          -609.56,-148.5},{-609.56,-147.6}}, color={0,0,127}));
  connect(P1.in_q_m3hr,PCHP_input. y) annotation (Line(points={{-610.48,-296.5},
          {-601,-296.5}},                                   color={0,0,127}));
  connect(P1.outlet,FCV1. inlet) annotation (Line(
      points={{-616,-281.5},{-616,-274}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV1.outlet,S5_PL_CHP_EX501_hot. inlet) annotation (Line(
      points={{-616,-254},{-616,-247}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV1.opening,FCVchp_theta. y)
    annotation (Line(points={{-608,-264},{-601,-264}}, color={0,0,127}));
  connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
      Line(
      points={{-656,-20},{-658,-20},{-658,-10},{-492,-10},{-492,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));

  connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-616,-20},{-616,-14},{-484,-14},{-484,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(CHP.outlet, P1.inlet) annotation (Line(
      points={{-625.8,-332.8},{-625.8,-314},{-616,-314},{-616,-301.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (Line(
      points={{-656,-247},{-656,-314},{-646.2,-314},{-646.2,-332.8}},
      color={140,56,54},
      thickness=0.5));
  connect(Pe_CHP.y, CHP.Pelectric_in)
    annotation (Line(points={{-679,-360},{-663.2,-360}}, color={0,0,127}));
  connect(sinkCHP.inlet, CHP.inlet) annotation (Line(
      points={{-669,-281},{-656,-281},{-656,-314},{-646.2,-314},{-646.2,-332.8}},
      color={140,56,54},
      thickness=0.5));

  connect(CHP_Status.y, CHP.heat_on)
    annotation (Line(points={{-593,-360},{-608.8,-360}}, color={255,0,255}));
  annotation (experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
end CentralisedSystemI_F;
