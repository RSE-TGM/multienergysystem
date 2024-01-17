within MultiEnergySystem.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemI_E
  "Gas & Electric Boiler, Water Tanks & CHP"
  extends CentralisedSystemI_D;

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
  parameter Real P501qm3h[:,:] = [0, 2; 100, 2];

  parameter Real Pchpomega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real Pchpqm3h[:,:] = [0, 1; 100, 1];

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

  parameter DistrictHeatingNetwork.Types.Power PeCHP[:,:]=[0,30e3; 100,30e3];
  parameter Real FCVchptheta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

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
        origin={-632,-195},
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
        origin={-612,-145})));
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
        origin={-652,-243})));
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
        origin={-612,-243})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-7.5,-7.5},{7.5,7.5}},
        rotation=90,
        origin={-654.5,-219.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={-609,-219})));
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
        origin={-612,-67})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=51e-3,
      D_o=Di_S5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-612,-36})));
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
        origin={-652,-67})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=51e-3,
      D_o=Di_S5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-652,-36})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
      Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-609.5,-85.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start=
        Tout_User_start_S5) annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={-609.5,-116.5})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-655,-155})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-654.5,-86.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start=
        Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
        transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-654.5,-105.5})));
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
        origin={-652,-127})));
  DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP
    annotation (Placement(transformation(extent={{-652,-334},{-610,-292}})));
  Modelica.Blocks.Sources.TimeTable Pe_CHP(table=PeCHP)
    annotation (Placement(transformation(extent={{-690,-306},{-670,-286}})));
  DistrictHeatingNetwork.Sources.PumpInput P501_input(
    useOmega=false,
    omega=P501omega,
    q_m3h=P501qm3h)
    annotation (Placement(transformation(extent={{-576,-161},{-596,-140}})));
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P1(
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
        origin={-582,-297})));
  DistrictHeatingNetwork.Sources.PumpInput PCHP_input(
    useOmega=false,
    omega=Pchpomega,
    q_m3h=Pchpqm3h)
    annotation (Placement(transformation(extent={{-548,-311},{-568,-290}})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV1(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,

    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-582,-270})));
  Modelica.Blocks.Sources.TimeTable FCVchp_theta(table=FCVchptheta)
    annotation (Placement(transformation(extent={{-548,-280},{-568,-260}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCHP(
    T0(displayUnit="K") = 15 + 273.15,
    p0=210000,
    R=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-685,-269})));
equation
  connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
      points={{-652,-233},{-652,-203.5},{-651.6,-203.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
      points={{-652,-233},{-652,-225.25},{-651.5,-225.25},{-651.5,-219.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
      points={{-612,-233},{-612,-225.25},{-611.8,-225.25},{-611.8,-219}},
      color={140,56,54},
      thickness=0.5));
  connect(TT504.inlet,E501. inhot) annotation (Line(
      points={{-611.8,-219},{-611.8,-218.25},{-612.4,-218.25},{-612.4,-203.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
      Line(
      points={{-612,-57},{-612,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
      Line(
      points={{-652,-46},{-652,-57}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
      points={{-612,-77},{-612,-82.25},{-611.7,-82.25},{-611.7,-85.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT502.inlet,TT502. inlet) annotation (Line(
      points={{-611.7,-85.5},{-611.7,-116.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT502.inlet,P501. outlet) annotation (Line(
      points={{-611.7,-116.5},{-611.7,-100.95},{-612,-100.95},{-612,-135.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet,E501. incold) annotation (Line(
      points={{-652.2,-159.2},{-652.2,-172.85},{-651.6,-172.85},{-651.6,-186.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
      points={{-652,-77},{-652,-81.75},{-652.3,-81.75},{-652.3,-86.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet,TT501. inlet) annotation (Line(
      points={{-652.3,-86.5},{-652.3,-105.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
      points={{-652.2,-150.8},{-652.2,-143.9},{-652,-143.9},{-652,-137}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
      points={{-652.3,-105.5},{-652.3,-111.25},{-652,-111.25},{-652,-117}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.inlet,E501. outcold) annotation (Line(
      points={{-612,-154.6},{-612,-165.55},{-612.4,-165.55},{-612.4,-186.5}},
      color={140,56,54},
      thickness=0.5));
  connect(S5_PL_CHP_EX501_cold.outlet,CHP. inlet) annotation (Line(
      points={{-652,-253},{-652,-284},{-660,-284},{-660,-313},{-652,-313}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
      Line(
      points={{-652,-26},{-652,-10},{-492,-10},{-492,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-612,-26},{-612,-18},{-482,-18},{-482,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(Pe_CHP.y, CHP.PelectricRef) annotation (Line(points={{-669,-296},{-660.5,
          -296},{-660.5,-296.2},{-652,-296.2}}, color={0,0,127}));
  connect(P501_input.y, P501.in_q_m3hr) annotation (Line(points={{-597,-150.5},{
          -606.48,-150.5},{-606.48,-149.8}}, color={0,0,127}));
  connect(P1.in_q_m3hr, PCHP_input.y) annotation (Line(points={{-576.48,-301.8},
          {-574.74,-301.8},{-574.74,-300.5},{-569,-300.5}}, color={0,0,127}));
  connect(P1.outlet, FCV1.inlet) annotation (Line(
      points={{-582,-287.4},{-582,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(CHP.outlet, P1.inlet) annotation (Line(
      points={{-610,-313},{-596,-313},{-596,-314},{-582,-314},{-582,-306.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV1.outlet, S5_PL_CHP_EX501_hot.inlet) annotation (Line(
      points={{-582,-260},{-582,-258},{-612,-258},{-612,-253}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV1.opening, FCVchp_theta.y)
    annotation (Line(points={{-574,-270},{-569,-270}}, color={0,0,127}));
  connect(sinkCHP.inlet, CHP.inlet) annotation (Line(
      points={{-675,-269},{-652,-269},{-652,-284},{-660,-284},{-660,-313},{-652,
          -313}},
      color={140,56,54},
      thickness=0.5));
end CentralisedSystemI_E;
