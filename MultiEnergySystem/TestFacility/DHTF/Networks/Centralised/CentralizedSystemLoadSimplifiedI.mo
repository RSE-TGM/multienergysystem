within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
partial model CentralizedSystemLoadSimplifiedI "System with only Gas Boiler as source of heat"
  extends DHTF.Networks.BaseClass.CentralizedNetworkBaseLoadSimplified;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

  // System S100
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S1 = 10;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL1 = 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL2 = 0.8;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL3 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL4 = 0.7;
  parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
  parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
  //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
  parameter Real q_m3h_S1 = 9;
  parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
  parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:, :] = [0, 1];
  parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(redeclare
      model                                                                           Medium = WaterHot, Tin_start(displayUnit = "K") = TestFacility.Data.PumpData.P101.Tin_start, Tout_start(displayUnit = "K") = TestFacility.Data.PumpData.P101.Tout_start, a = TestFacility.Data.PumpData.P101.a, b = TestFacility.Data.PumpData.P101.b, m_flow_start = m_flow_total, dpnom = TestFacility.Data.PumpData.P101.dpnom, etaelec = TestFacility.Data.PumpData.P101.etaelec, etamech = TestFacility.Data.PumpData.P101.etamech, etanom = TestFacility.Data.PumpData.P101.etanom, hin_start = TestFacility.Data.PumpData.P101.hin_start, m_flow_nom = TestFacility.Data.PumpData.P101.m_flow_nom, omeganom = TestFacility.Data.PumpData.P101.omeganom, pin_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P101.pin_start, pout_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P101.pout_start, qnom_inm3h = TestFacility.Data.PumpData.P101.qnom_inm3h, rhonom(displayUnit = "kg/m3") = TestFacility.Data.PumpData.P101.rhonom, headnom = TestFacility.Data.PumpData.P101.headnom, headmax = TestFacility.Data.PumpData.P101.headnommax, headmin = TestFacility.Data.PumpData.P101.headnommin, qnom_inm3h_min = TestFacility.Data.PumpData.P101.qnommin_inm3h, qnom_inm3h_max = TestFacility.Data.PumpData.P101.qnommax_inm3h, use_in_omega = true) annotation (
    Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-240, -175})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(redeclare
      model                                                                            Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV101.Kv,
    openingChar=TestFacility.Data.ValveData.FCV101.openingChar,                                                    dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, rho_nom = TestFacility.Data.ValveData.FCV101.rho_nom, q_m3h_nom = TestFacility.Data.ValveData.FCV101.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S1, pin_start = pout_start_S1, q_m3h_start = TestFacility.Data.PumpData.P101.qnom_inm3h) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -110})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(redeclare
      model                                                                                   Medium = WaterHot, Tin_start = Tin_start_S1, pin_start = pin_start_S1, pout_start = pout_start_S1, Tout_start = Tout_start_S1)              annotation (
    Placement(visible = true, transformation(origin = {-257, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(redeclare
      model                                                                           Medium = WaterHot, T_start = Tout_start_S1, p_start = pout_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-238, -72})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102 "Pressure sensor at the outlet of valve FCV101" annotation (
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-238, -84})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101 "Pressure sensor at the inlet of gas boiler" annotation (
    Placement(transformation(origin = {-278, -124}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(redeclare
      model                                                                           Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-278, -94})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(redeclare model Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) annotation (
    Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-279, -195})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(redeclare
      model                                                                             Medium = WaterHot, L = L_S1_rCD_hot, h = h_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -40})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(redeclare
      model                                                                              Medium = WaterHot, L = L_S1_rCD_cold, h = h_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -40})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_GB101_P101(redeclare
      model                                                                                Medium = WaterHot, L = L_GB101_P101, h = h_GB101_P101, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -230})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_FT101_GB101(redeclare
      model                                                                                 Medium = WaterHot, L = L_FT101_GB101, h = h_FT101_GB101, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -230})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_TT101_FT101(redeclare
      model                                                                                 Medium = WaterHot, L = L_TT101_FT101, h = h_TT101_FT101, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -162})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_P101_FCV101(redeclare
      model                                                                                 Medium = WaterHot, L = L_P101_FCV101, h = h_P101_FCV101, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -142})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true) annotation (Placement(transformation(
        extent={{9,-9},{-9,9}},
        rotation=0,
        origin={-205,-301})));
equation
  connect(TT102.inlet, PT102.inlet) annotation (
    Line(points = {{-240.4, -72}, {-240.4, -84}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT101.inlet, TT101.inlet) annotation (
    Line(points={{-275.6,-124},{-275.6,-112},{-275.6,-112},{-275.6,-94}},      color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (
    Line(points = {{-240, -50}, {-240, -72}, {-240.4, -72}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT101.inlet, PL_S100_rCD_cold.outlet) annotation (
    Line(points = {{-275.6, -94}, {-275.6, -89}, {-276, -89}, {-276, -50}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
    Line(points = {{-276, -30}, {-276, 5.25}, {-326.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (
    Line(points = {{-240, -30}, {-242, -30}, {-242, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (
    Line(points = {{-240, -184.6}, {-240, -220}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (
    Line(points = {{-276.2, -199.2}, {-276.2, -220}, {-276, -220}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_FT101_GB101.outlet, GB101.inlet) annotation (
    Line(points = {{-276, -240}, {-276, -252}, {-267.5, -252}, {-267.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (
    Line(points = {{-240, -240}, {-240, -252}, {-246.5, -252}, {-246.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCV101.outlet, PT102.inlet) annotation (
    Line(points = {{-240, -100}, {-240, -92}, {-240.4, -92}, {-240.4, -84}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FT101.inlet, PL_S100_TT101_FT101.outlet) annotation (
    Line(points = {{-276.2, -190.8}, {-276.2, -184}, {-276, -184}, {-276, -172}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (
    Line(points={{-276,-152},{-276,-138},{-276,-124},{-275.6,-124}},
                                                color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (
    Line(points = {{-240, -152}, {-240, -165.4}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (
    Line(points = {{-240, -120}, {-240, -132}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceGas.outlet, GB101.inletfuel) annotation (Line(
      points={{-214,-301},{-236,-301}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CentralizedSystemLoadSimplifiedI;
