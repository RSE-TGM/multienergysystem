within MultiEnergySystem.TestFacility.Networks.Configurations.Centralised;
partial model CentralizedSystemIV
  extends BaseClass.CentralizedNetworkBase;

  // S500

  // General Pipeline Data
  parameter DistrictHeatingNetwork.Types.Length Di_S5=39e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S5=1.5e-3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5=
      q_m3h_S5_Source*990/3600;
  parameter Real q_m3h_S5_Source = 4;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5=
      q_m3h_S5_User*990/3600;
  parameter Real q_m3h_S5_User = 6;

  parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P501qm3h[:,:] = [0, 6.033898; 100, 6.033898];

  parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5=1.9e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5=80 +
      273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5=70 +
      273.15;

  parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5=1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5=2.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5=70 +
      273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5=75 +
      273.15;

  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E501.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E501.L_hot,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E501.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot,
    Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold,
    Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot,
    Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold,
    Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E501.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E501.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E501.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E501.h_hot,
    hctype_cold=hctype,
    hctype_hot=hctype,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E501.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E501.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot,
    n=5,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E501.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
      Placement(visible=true, transformation(
        origin={-608,-197},
        extent={{-17,-28.0002},{17,28.0001}},
        rotation=-90)));

  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(
    Tin_start(displayUnit="K") = Tout_User_start_S5,
    Tout_start(displayUnit="K") = Tout_User_start_S5,
    a=DistrictHeatingNetwork.Data.PumpData.P501.a,
    b=DistrictHeatingNetwork.Data.PumpData.P501.b,
    m_flow_start=m_flow_User_S5,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
    use_q_m3hr=true) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-588,-153})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(
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
        origin={-628,-251})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(
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
        origin={-588,-251})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=90,
        origin={-630.5,-227.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-585,-227})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(
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
        origin={-588,-69})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=51e-3,
      D_o=Di_S5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-588,-38})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(
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
        origin={-628,-69})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=51e-3,
      D_o=Di_S5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-628,-38})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
      Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-585.5,-87.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start=
        Tout_User_start_S5) annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-585.5,-118.5})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-631,-157})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-630.5,-88.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-630.5,-107.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(
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
        origin={-628,-129})));
  DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP
    annotation (Placement(transformation(extent={{-628,-336},{-586,-294}})));
equation
  connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
      points={{-628,-241},{-628,-205.5},{-627.6,-205.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
      points={{-628,-241},{-628,-233.25},{-627.5,-233.25},{-627.5,-227.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
      points={{-588,-241},{-588,-233.25},{-587.8,-233.25},{-587.8,-227}},
      color={140,56,54},
      thickness=0.5));
  connect(TT504.inlet,E501. inhot) annotation (Line(
      points={{-587.8,-227},{-587.8,-226.25},{-588.4,-226.25},{-588.4,-205.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
      Line(
      points={{-588,-59},{-588,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
      Line(
      points={{-628,-48},{-628,-59}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
      points={{-588,-79},{-588,-84.25},{-587.7,-84.25},{-587.7,-87.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT502.inlet,TT502. inlet) annotation (Line(
      points={{-587.7,-87.5},{-587.7,-118.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT502.inlet,P501. outlet) annotation (Line(
      points={{-587.7,-118.5},{-587.7,-102.95},{-588,-102.95},{-588,-143.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet,E501. incold) annotation (Line(
      points={{-628.2,-161.2},{-628.2,-174.85},{-627.6,-174.85},{-627.6,-188.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
      points={{-628,-79},{-628,-83.75},{-628.3,-83.75},{-628.3,-88.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet,TT501. inlet) annotation (Line(
      points={{-628.3,-88.5},{-628.3,-107.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
      points={{-628.2,-152.8},{-628.2,-145.9},{-628,-145.9},{-628,-139}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
      points={{-628.3,-107.5},{-628.3,-113.25},{-628,-113.25},{-628,-119}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.inlet,E501. outcold) annotation (Line(
      points={{-588,-162.6},{-588,-167.55},{-588.4,-167.55},{-588.4,-188.5}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
      Line(
      points={{-628,-28},{-628,-12},{-498,-12},{-498,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-588,-28},{-588,-20},{-492,-20},{-492,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot.inlet, CHP.outlet) annotation (Line(
      points={{-588,-261},{-588,-286},{-578,-286},{-578,-315},{-586,-315}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (Line(
      points={{-628,-261},{-628,-286},{-636,-286},{-636,-315},{-628,-315}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralizedSystemIV;
