within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
partial model Sequence9
  extends Sequence8;

  // General Pipeline Data
  parameter Types.Length Di_S5 = 39e-3;
  parameter Types.Length t_S5 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S5 = q_m3h_S3_Source*990/3600;
  parameter Real q_m3h_S5_Source = 4;
  parameter Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
  parameter Real q_m3h_S5_User = 6;

  parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P501qm3h[:,:] = [0, 6.033898; 100, 6.033898];


  parameter Types.Pressure pin_Source_start_S5 = 2e5;
  parameter Types.Pressure pout_Source_start_S5 = 1.9e5;
  parameter Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
  parameter Types.Temperature Tout_Source_start_S5 = 70 + 273.15;

  parameter Types.Pressure pin_User_start_S5 = 1.69e5;
  parameter Types.Pressure pout_User_start_S5 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S5 = 70 + 273.15;
  parameter Types.Temperature Tout_User_start_S5 = 75 + 273.15;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
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
    Placement(visible = true, transformation(origin={-612,-189},  extent={{-17,
            -28.0002},{17,28.0001}},                                                               rotation=-90)));

  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P501(
    Tin_start(displayUnit="K") = Tout_User_start_S5,
    Tout_start(displayUnit="K") = Tout_User_start_S5,
    use_in_omega=true,
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
    qnom_inm3h_max=Pump.P501.qnommax_inm3h) annotation (Placement(
        transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-592,-145})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(
    L=L_S3_PL7,
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
        origin={-632,-243})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(
    L=L_S3_PL6,
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
        origin={-592,-243})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT503(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=90,
        origin={-634.5,-219.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT504(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-589,-219})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(
    L=L_S3_PL6,
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
        origin={-592,-61})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange
    suddenAreaChange(D_i=51e-3, D_o=Di_S5)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-592,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(
    L=L_S3_PL7,
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
        origin={-632,-61})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange
    suddenAreaChange1(D_i=51e-3, D_o=Di_S5)
                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-632,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502
    annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-589.5,-79.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT502(T_start=Tout_User_start_S5) annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-589.5,-110.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-635,-149})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501
    annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-634.5,-80.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT501(T_start=Tin_User_start_S5, p_start=pin_User_start_S5) annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-634.5,-99.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(
    L=L_S3_PL7,
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
        origin={-632,-121})));
  Modelica.Blocks.Interaction.Show.RealValue TT501_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-652,-127},{-700,-74}})));
  Modelica.Blocks.Interaction.Show.RealValue TT502_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-574,-137},{-526,-84}})));
  Sources.PumpInput P501_input(omega=P501omega, q_m3h=P501qm3h)
    annotation (Placement(transformation(extent={{-556,-160},{-576,-140}})));
  Modelica.Blocks.Interaction.Show.RealValue TT504_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-570,-247},{-522,-194}})));
  Modelica.Blocks.Interaction.Show.RealValue TT503_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-654,-247},{-702,-194}})));
  Sources.SinkMassFlow                                          sinkHot_E501(
    T0=BPHE.E501.Tout_start_hot,
    m_flow0=BPHE.E501.m_flow_start_hot,
    p0=BPHE.E501.pout_start_hot,
    pin_start=BPHE.E501.pout_start_hot)                                                                                                                                                                                annotation (
    Placement(visible = true, transformation(origin={-633,-289},   extent = {{-13, -13}, {13, 13}}, rotation=-90)));
  Sources.SourcePressure                                          sourceHot_E501(T0=BPHE.E501.Tin_start_hot,
      p0=BPHE.E501.pin_start_hot)                                                                                                            annotation (
    Placement(visible = true, transformation(origin={-592,-286},  extent = {{10, -10}, {-10, 10}}, rotation=-90)));
equation
  connect(S5_PL_CHP_EX501_cold.inlet, E501.outhot) annotation (Line(
      points={{-632,-233},{-632,-197.5},{-631.6,-197.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.inlet, TT503.inlet) annotation (Line(
      points={{-632,-233},{-632,-225.25},{-631.5,-225.25},{-631.5,-219.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot.outlet, TT504.inlet) annotation (Line(
      points={{-592,-233},{-592,-225.25},{-591.8,-225.25},{-591.8,-219}},
      color={140,56,54},
      thickness=0.5));
  connect(TT504.inlet, E501.inhot) annotation (Line(
      points={{-591.8,-219},{-591.8,-218.25},{-592.4,-218.25},{-592.4,-197.5}},
      color={140,56,54},
      thickness=0.5));

  connect(S5_PL_CHP_EX501_hot1.outlet, suddenAreaChange.outlet) annotation (
      Line(
      points={{-592,-51},{-592,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet, S5_PL_CHP_EX501_cold1.inlet) annotation (
      Line(
      points={{-632,-40},{-632,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.inlet, PT502.inlet) annotation (Line(
      points={{-592,-71},{-592,-76.25},{-591.7,-76.25},{-591.7,-79.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT502.inlet, TT502.inlet) annotation (Line(
      points={{-591.7,-79.5},{-591.7,-110.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT502.inlet, P501.outlet) annotation (Line(
      points={{-591.7,-110.5},{-591.7,-94.95},{-592,-94.95},{-592,-135.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet, E501.incold) annotation (Line(
      points={{-632.2,-153.2},{-632.2,-166.85},{-631.6,-166.85},{-631.6,-180.5}},
      color={140,56,54},
      thickness=0.5));

  connect(S5_PL_CHP_EX501_cold1.outlet, PT501.inlet) annotation (Line(
      points={{-632,-71},{-632,-75.75},{-632.3,-75.75},{-632.3,-80.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet, TT501.inlet) annotation (Line(
      points={{-632.3,-80.5},{-632.3,-99.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.inlet, S5_PL_CHP_EX501_cold2.outlet) annotation (Line(
      points={{-632.2,-144.8},{-632.2,-137.9},{-632,-137.9},{-632,-131}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.inlet, S5_PL_CHP_EX501_cold2.inlet) annotation (Line(
      points={{-632.3,-99.5},{-632.3,-105.25},{-632,-105.25},{-632,-111}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.inlet, E501.outcold) annotation (Line(
      points={{-592,-154.6},{-592,-159.55},{-592.4,-159.55},{-592.4,-180.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.T, TT501_.numberPort) annotation (Line(points={{-641.65,-99.5},{
          -641.65,-100.5},{-648.4,-100.5}}, color={0,0,127}));
  connect(TT502.T, TT502_.numberPort) annotation (Line(points={{-582.35,-110.5},
          {-577.6,-110.5}}, color={0,0,127}));
  connect(P501_input.y, P501.in_omega) annotation (Line(points={{-577,-150},{-579.5,
          -150},{-579.5,-149.8},{-586,-149.8}}, color={0,0,127}));
  connect(suddenAreaChange1.inlet, rackCD_Cold_S500_S300.outlet) annotation (
      Line(
      points={{-632,-20},{-632,-10},{-498,-10},{-498,5.25},{-506.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-592,-20},{-592,-14},{-484,-14},{-484,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(TT504.T, TT504_.numberPort) annotation (Line(points={{-579.9,-219},{-579.9,
          -220.5},{-573.6,-220.5}}, color={0,0,127}));
  connect(TT503.T, TT503_.numberPort) annotation (Line(points={{-644.25,-219.5},
          {-647.325,-219.5},{-647.325,-220.5},{-650.4,-220.5}}, color={0,0,127}));
  connect(sourceHot_E501.outlet, S5_PL_CHP_EX501_hot.inlet) annotation (Line(
      points={{-592,-276},{-592,-253}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.outlet, sinkHot_E501.inlet) annotation (Line(
      points={{-632,-253},{-632,-264.5},{-633,-264.5},{-633,-276}},
      color={140,56,54},
      thickness=0.5));
end Sequence9;
