within MultiEnergySystem.TestFacility.Export.Linearization;
model CentralisedSystemGBEBCHP_onoff_InitForward
  "CHP can be switched on or off"
  extends Export.Linearization.CentralisedSystemGBEB_InitForward(
    h_FT701_rackL2L3=-0.85,
    h_FT711_rackL3L4=-1,
    h_FT721_rackL4L5=-1,
    h_FT731_rackL6L7=-1.25,
    h_FTR03_PTR01=0.25*0,
    h_PTR01_FTR01=-1.9*0,
    h_FTR01_RR01=-0.72*0,
    sourceGas(computeEnergyVariables=true),
    FCVC02Dynamics(k=1*0),
    FCVC01Dynamics(k=0),
    S701(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S711(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S721(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    S731(TCV7X1(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)),
    PR01(b=b_PR01),
    S701(TN_wall_start=25 + 273.15),
    S731(TN_wall_start=25 + 273.15),
    S711(TN_wall_start=25 + 273.15),
    S721(TN_wall_start=25 + 273.15));
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;

  parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
  parameter Real q_m3h_S5_Source = 4;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
  parameter Real q_m3h_S5_User = 4;
  parameter Real P501omega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P501qm3h[:, :] = [0, 8; 100, 8];
  parameter Real Pchpomega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real Pchpqm3h[:, :] = [0, 3.94; 100, 3.94];
  parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 69 + 273.15;
  parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15;
  parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];
  parameter Real FCVchptheta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

  parameter Boolean fixomegaP501 = ForwardInit;
  parameter Boolean fixToutTT502 = ForwardInit;
  parameter Boolean fixFT501 = not fixomegaP501;
  parameter Boolean fixTT502 = not fixToutTT502;

  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP501_nom = 2*Modelica.Constants.pi*50;

  parameter DistrictHeatingNetwork.Types.Temperature TT502_nom = 100 + 273.15 "Nominal temperature at the outlet of S500";
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_nom= TestFacility.Data.PumpData.P501.qnommax_inm3h*980/3600;

  parameter DistrictHeatingNetwork.Types.Temperature TT502_des = 80 + 273.15 "Desired temperature at the outlet of S500";
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_des= TestFacility.Data.PumpData.P501.qnom_inm3h*980/3600;
  parameter Real b_PR01[3] = TestFacility.Data.PumpData.PR01.b;
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_hot(
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
        origin={-552,-207})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange2(D_i=51e-3, D_o=Di_S5)    annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-552,-176})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_cold(
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
        origin={-588,-207})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange3(D_i=51e-3, D_o=Di_S5)     annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-588,-176})));
  Modelica.Blocks.Sources.BooleanConstant CHP501Status
                                                      annotation (Placement(transformation(extent={{-682,-288},{-662,-268}})));
  Export.Utilities.InputOffset omegaP501Offset(
    fixInput=fixomegaP501,
    u_norm=omegaP501_nom,
    u_start=omegaP501_nom) annotation (Placement(visible=true, transformation(
        origin={-706,-210},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder P501Dynamics(
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    y_start=2*Modelica.Constants.pi*30) annotation (Placement(transformation(extent={{-680,-220},{-660,-200}})));
  Modelica.Blocks.Sources.Ramp FCV501theta(
    height=0,
    duration=0,
    offset=0) annotation (Placement(transformation(extent={{-680,-246},{-660,-226}})));
  Modelica.Blocks.Sources.Ramp PelSP(
    height=5e3*0,
    duration=0,
    offset=35e3,
    startTime=1000)
                 annotation (Placement(transformation(extent={{-680,-320},{-660,-300}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref_CHP(table=[0,2.5; 1e6,2.5])       annotation (Placement(transformation(extent={{-680,-350},{-660,-330}})));
  Export.Utilities.InputOffset ToutCHP501Offset(
    fixInput=fixToutTT502,
    u_norm=TT502_nom,
    u_start=TT502_des) annotation (Placement(visible=true, transformation(
        origin={-706,-256},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Export.Utilities.OutputOffset FT501Offset(
    fixOutput=fixFT501,
    y_fixed=FT501_des,
    y_norm=FT501_nom) annotation (Placement(visible=true, transformation(
        origin={-505,-251},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  Export.Utilities.OutputOffset TT502Offset(
    fixOutput=fixTT502,
    y_fixed=TT502_des,
    y_norm=TT502_nom) annotation (Placement(visible=true, transformation(
        origin={-505,-268},
        extent={{-5,-5},{5,5}},
        rotation=0)));
  DHTF.Subsystems.HeatGeneration.CHP_on_off cHP_on_off
    annotation (Placement(transformation(extent={{-606,-305},{-536,-235}})));
equation
  connect(PL_S500_rCD_hot.outlet, suddenAreaChange2.outlet) annotation (Line(
      points={{-552,-197},{-552,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.outlet, PL_S500_rCD_cold.inlet) annotation (Line(
      points={{-588,-186},{-588,-197}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.inlet, rackCD_Cold_S300_S300.inlet) annotation (Line(
      points={{-588,-166},{-588,-18},{-496,-18},{-496,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange2.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-552,-166},{-552,-36},{-484,-36},{-484,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(P501Dynamics.u, omegaP501Offset.u) annotation (Line(points={{-682,-210},{-697,-210}}, color={0,0,127}));
  connect(omegaP501Offset.deltaUnorm, controlSignalBus.domegaP501)
    annotation (Line(points={{-714,-210},{-786,-210},{-786,-212},{-897,-212},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(ToutCHP501Offset.deltaUnorm, controlSignalBus.dToutCHP501)
    annotation (Line(points={{-714,-256},{-897,-256},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FT501Offset.deltaYnorm, processVariableBus.dFT501)
    annotation (Line(points={{-500.5,-251},{-496,-251},{-496,-151},{-468,-151},{-468,-3},{896,-3}},
                                                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT502Offset.deltaYnorm, processVariableBus.dTT502)
    annotation (Line(points={{-500.5,-268},{-480,-268},{-480,-158},{-462,-158},{-462,-3},{896,-3}},
                                                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(cHP_on_off.outletPower, sourceVoltage.outlet) annotation (Line(
      points={{-609.5,-290.3},{-608,-290.3},{-608,-384},{-400,-384},{-400,-454}},

      color={56,93,138},
      thickness=1));
  connect(cHP_on_off.inletFuel, sourceGas.outlet) annotation (Line(
      points={{-571,-310.6},{-571,-328},{-320,-328},{-320,-416},{-224,-416},{
          -224,-362},{-250,-362}},
      color={182,109,49},
      thickness=0.5));
  connect(TT502Offset.y, cHP_on_off.TTout) annotation (Line(points={{-509,-268},
          {-509,-259.5},{-532.5,-259.5}}, color={0,0,127}));
  connect(cHP_on_off.m_flow_, FT501Offset.y) annotation (Line(points={{-532.5,
          -245.5},{-536,-251},{-509,-251}}, color={0,0,127}));
  connect(m_flow_ref_CHP.y, cHP_on_off.m_flow_CHP) annotation (Line(points={{
          -659,-340},{-659,-341},{-626,-341},{-626,-280},{-610,-280},{-610,
          -280.5},{-609.5,-280.5}}, color={0,0,127}));
  connect(PelSP.y, cHP_on_off.Pelset) annotation (Line(points={{-659,-310},{
          -632,-310},{-632,-273.5},{-609.5,-273.5}}, color={0,0,127}));
  connect(CHP501Status.y, cHP_on_off.status) annotation (Line(points={{-661,
          -278},{-656,-278},{-656,-279},{-650,-279},{-650,-266.5},{-609.5,
          -266.5}}, color={255,0,255}));
  connect(ToutCHP501Offset.u, cHP_on_off.Toutset) annotation (Line(points={{
          -697,-256},{-697,-257},{-636,-257},{-636,-258},{-610,-258},{-610,
          -259.5},{-609.5,-259.5}}, color={0,0,127}));
  connect(FCV501theta.y, cHP_on_off.theta) annotation (Line(points={{-659,-236},
          {-659,-240},{-632,-240},{-632,-252.5},{-609.5,-252.5}}, color={0,0,
          127}));
  connect(P501Dynamics.y, cHP_on_off.pumpset) annotation (Line(points={{-659,
          -210},{-649,-210},{-649,-231},{-609.5,-231},{-609.5,-245.5}}, color={
          0,0,127}));
  connect(cHP_on_off.inlet, PL_S500_rCD_cold.outlet) annotation (Line(
      points={{-584.65,-229.75},{-588,-232},{-588,-217}},
      color={140,56,54},
      thickness=0.5));
  connect(cHP_on_off.outlet, PL_S500_rCD_hot.inlet) annotation (Line(
      points={{-556.65,-229.75},{-560,-229.75},{-560,-217},{-552,-217}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=2000, __Dymola_Algorithm="Dassl"),  Diagram(coordinateSystem(extent={{-900,-540},{900,320}}, grid={1,1})));
end CentralisedSystemGBEBCHP_onoff_InitForward;
