within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
model CentralisedSystem_GBEBCHP_III
  extends CentralisedSystem_GBEB_III;
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

  DHTF.Subsystems.HeatGeneration.CHP S500(
    n=n,
    Tin_low_start=Tin_Source_start_S5,
    Tout_low_start=Tout_Source_start_S5,
    Tin_high_start=Tin_User_start_S5,
    Tout_high_start=Tout_User_start_S5,
    Pel_SP=PeCHP) annotation (Placement(transformation(extent={{-568,-330},{-482,-244}})));
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
        origin={-506,-213})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange2(D_i=51e-3, D_o=Di_S5)    annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-506,-182})));
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
        origin={-542,-213})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange3(D_i=51e-3, D_o=Di_S5)     annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-542,-182})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-656,-276},{-636,-256}})));
equation
  connect(PL_S500_rCD_hot.outlet,suddenAreaChange2. outlet) annotation (Line(
      points={{-506,-203},{-506,-192}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.outlet,PL_S500_rCD_cold. inlet) annotation (Line(
      points={{-542,-192},{-542,-203}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_cold.outlet,S500. inlet) annotation (Line(
      points={{-542,-223},{-542,-230.275},{-541.77,-230.275},{-541.77,-237.55}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_rCD_hot.inlet,S500. outlet) annotation (Line(
      points={{-506,-223},{-506,-230.275},{-507.37,-230.275},{-507.37,-237.55}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange3.inlet, rackCD_Cold_S300_S300.inlet) annotation (Line(
      points={{-542,-172},{-542,-26},{-502,-26},{-502,5.25},{-470,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange2.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
      points={{-506,-172},{-508,-172},{-508,-46},{-488,-46},{-488,45},{-500,45}},
      color={140,56,54},
      thickness=0.5));
  connect(S500.inletFuel, inletGas) annotation (Line(
      points={{-525,-336.88},{-525,-350},{-250,-350},{-250,-366}},
      color={182,109,49},
      thickness=0.5));
  connect(controlSignalBus.omegaP501, S500.omega) annotation (Line(
      points={{-339,399},{-339,346},{-586,346},{-586,-256.9},{-572.3,-256.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutCHP501, S500.Toutset) annotation (Line(
      points={{-339,399},{-339,346},{-598,346},{-598,-274.1},{-572.3,-274.1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(const.y, S500.theta) annotation (Line(points={{-635,-266},{-603.65,-266},{-603.65,-265.5},{-572.3,-265.5}}, color={0,0,127}));
  connect(controlSignalBus.statusCHP501, S500.status) annotation (Line(
      points={{-339,399},{-339,354},{-602,354},{-602,-282.7},{-572.3,-282.7}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtCHP501, S500.Pelset) annotation (Line(
      points={{-339,399},{-339,358},{-606,358},{-606,-291.3},{-572.3,-291.3}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.omegaP501, S500.m_flow_CHP) annotation (Line(
      points={{-339,399},{-339,358},{-610,358},{-610,-299.9},{-572.3,-299.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S500.outletPower, electricPortInlet) annotation (Line(
      points={{-572.3,-311.94},{-594,-311.94},{-594,-440},{-432,-440},{-432,-490}},
      color={56,93,138},
      thickness=1));
end CentralisedSystem_GBEBCHP_III;
