within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedThreeGenGBEBCHP
  extends CentralizedTwoGenGBEB;
  // System S500

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3 annotation (
    Dialog(group = "S500"));
  parameter Real q_m3h_S5_Source = 4 annotation (
    Dialog(group = "S500"));
  parameter Real q_m3h_S5_User = 4 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 69 + 273.15 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15 annotation (
    Dialog(group = "S500"));
  parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];

  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*985/3600 annotation (
    Dialog(group = "S500"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*985/3600 annotation (
    Dialog(group = "S500"));

  Subsystems.HeatGeneration.CHP      S500(
    redeclare model Medium = WaterHot,
    redeclare model Gas = Gas,
    n=n,
    Tin_low_start=Tin_Source_start_S5,
    Tout_low_start=Tout_Source_start_S5,
    Tin_high_start=Tin_User_start_S5,
    Tout_high_start=Tout_User_start_S5,
    Pel_SP=PeCHP) annotation (Placement(transformation(extent={{56,-50},{146,40}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_hot(
    redeclare model Medium = WaterHot,
    L=5,
    t=t_S5,
    set_m_flow_start=true,
    m_flow_start=m_flow_User_S5,
    pin_start=pin_User_start_S5 - 0.04e5,
    Tin_start=Tout_User_start_S5,
    Tout_start=Tout_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_User,
    n=n,
    hctype=hctype,
    cf=cf)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={120,71})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange2(D_i=51e-3, D_o=Di_S5)    annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={120,102})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_cold(
    redeclare model Medium = WaterHot,
    L=5,
    t=t_S5,
    set_m_flow_start=true,
    m_flow_start=m_flow_User_S5,
    pin_start=pin_User_start_S5 - 0.02e5,
    Tin_start=Tin_User_start_S5,
    Tout_start=Tin_User_start_S5,
    Di=Di_S5,
    q_m3h_start=q_m3h_S5_User,
    n=n,
    hctype=hctype,
    cf=cf)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={84,71})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange3(D_i=51e-3, D_o=Di_S5)     annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={84,102})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{16,38},{36,58}})));
equation
  connect(PL_S500_rCD_hot.outlet,suddenAreaChange2. outlet) annotation (Line(
      points={{120,81},{120,92}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.outlet,PL_S500_rCD_cold. inlet) annotation (Line(
      points={{84,92},{84,81}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_cold.outlet,S500. inlet) annotation (Line(
      points={{84,61},{84,53.725},{83.45,53.725},{83.45,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_hot.inlet,S500. outlet) annotation (Line(
      points={{120,61},{120,53.725},{119.45,53.725},{119.45,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.inlet, returncold) annotation (Line(
      points={{84,112},{86,112},{86,198},{-16,198},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange2.inlet, senthot) annotation (Line(
      points={{120,112},{120,214},{38,214},{38,282},{36,282}},
      color={140,56,54},
      thickness=0.5));
  connect(inletGas, S500.inletFuel) annotation (Line(
      points={{0,-282},{0,-298},{101,-298},{101,-57.2}},
      color={182,109,49},
      thickness=0.5));
  connect(controlSignalBus.mflowCHP, S500.m_flow_CHP) annotation (Line(
      points={{-290,-2},{-296,-2},{-296,-102},{44,-102},{44,-18.5},{51.5,-18.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.PtCHP501, S500.Pelset) annotation (Line(
      points={{-290,-2},{-290,-4},{-294,-4},{-294,-100},{42,-100},{42,-9.5},{51.5,-9.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.statusCHP501, S500.status) annotation (Line(
      points={{-290,-2},{-290,-98},{40,-98},{40,-0.5},{51.5,-0.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutCHP501, S500.Toutset) annotation (Line(
      points={{-290,-2},{-288,-2},{-288,-96},{38,-96},{38,8.5},{51.5,8.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaP501, S500.pumpset) annotation (Line(
      points={{-290,-2},{-290,-94},{36,-94},{36,26.5},{51.5,26.5}},
      color={255,204,51},
      thickness=0.5));
  connect(const.y, S500.theta) annotation (Line(points={{37,48},{40,48},{40,17.5},{51.5,17.5}}, color={0,0,127}));
  connect(electricPortInlet, S500.outletPower) annotation (Line(
      points={{30,-280},{30,-31.1},{51.5,-31.1}},
      color={56,93,138},
      thickness=1));
end CentralizedThreeGenGBEBCHP;
