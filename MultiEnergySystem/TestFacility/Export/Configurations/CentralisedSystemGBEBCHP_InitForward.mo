within MultiEnergySystem.TestFacility.Export.Configurations;
model CentralisedSystemGBEBCHP_InitForward
  extends CentralisedSystemGBEB_InitForward(
    h_FT701_rackL2L3=-0.85,
    h_FT711_rackL3L4=-1,
    h_FT721_rackL4L5=-1,
    h_FT731_rackL6L7=-1.25,
    h_FTR03_PTR01=0.25*0,
    h_PTR01_FTR01=-1.9*0,
    h_FTR01_RR01=-0.72*0,
    sourceGas(computeEnergyVariables=true),
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
  DHTF.Subsystems.HeatGeneration.CHP S500(
    n=n,
    Tin_low_start=Tin_Source_start_S5,
    Tout_low_start=Tout_Source_start_S5,
    Tin_high_start=Tin_User_start_S5,
    Tout_high_start=Tout_User_start_S5,
    Pel_SP=PeCHP) annotation (Placement(transformation(extent={{-614,-324},{-528,-238}})));
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
equation
  connect(PL_S500_rCD_hot.outlet, suddenAreaChange2.outlet) annotation (Line(
      points={{-552,-197},{-552,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.outlet, PL_S500_rCD_cold.inlet) annotation (Line(
      points={{-588,-186},{-588,-197}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_cold.outlet, S500.inlet) annotation (Line(
      points={{-588,-217},{-588,-224.275},{-587.77,-224.275},{-587.77,-231.55}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_hot.inlet, S500.outlet) annotation (Line(
      points={{-552,-217},{-552,-224.275},{-553.37,-224.275},{-553.37,-231.55}},
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
  connect(CHP501Status.y, S500.status) annotation (Line(points={{-661,-278},{-620,-278},{-620,-276.7},{-618.3,-276.7}}, color={255,0,255}));
  connect(m_flow_ref_CHP.y, S500.m_flow_CHP) annotation (Line(points={{-659,-340},{-638,-340},{-638,-293.9},{-618.3,-293.9}}, color={0,0,127}));
  connect(PelSP.y, S500.Pelset) annotation (Line(points={{-659,-310},{-644,-310},{-644,-285.3},{-618.3,-285.3}}, color={0,0,127}));
  connect(FCV501theta.y, S500.theta) annotation (Line(points={{-659,-236},{-642,-236},{-642,-259.5},{-618.3,-259.5}}, color={0,0,127}));
  connect(sourceGas.outlet, S500.inletFuel) annotation (Line(
      points={{-250,-362},{-506,-362},{-506,-330.88},{-571,-330.88}},
      color={182,109,49},
      thickness=0.5));
  connect(S500.outletPower, sourceVoltage.outlet) annotation (Line(
      points={{-618.3,-305.94},{-630,-305.94},{-630,-454},{-400,-454}},
      color={56,93,138},
      thickness=1));
  connect(S500.Toutset, controlSignalBus.ToutCHP501) annotation (Line(points={{
          -618.3,-268.1},{-874,-268.1},{-874,-3},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S500.pumpset, controlSignalBus.omegaP501) annotation (Line(points={{
          -618.3,-250.9},{-645,-250.9},{-645,-204},{-865,-204},{-865,-3},{-897,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S500.m_flow_, processVariableBus.FT501) annotation (Line(points={{
          -523.7,-250.9},{-456,-250.9},{-456,-60},{896,-60},{896,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S500.TTout, processVariableBus.TT502) annotation (Line(points={{
          -523.7,-268.1},{-458,-268.1},{-458,-74},{896,-74},{896,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (experiment(StopTime=2000, __Dymola_Algorithm="Dassl"),  Diagram(coordinateSystem(extent={{-900,-540},{900,320}}, grid={1,1})));
end CentralisedSystemGBEBCHP_InitForward;
