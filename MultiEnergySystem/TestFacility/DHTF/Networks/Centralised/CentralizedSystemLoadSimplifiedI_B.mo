within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
partial model CentralizedSystemLoadSimplifiedI_B
  extends CentralizedSystemLoadSimplifiedI;
  // System 400
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 72 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
  parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
  parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;
  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter Real q_m3h_S4 = 5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
  parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
  parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
  parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;
  parameter Boolean FV401_startValue = true;
  parameter Boolean FV402_startValue = true;
  parameter Real FV401_s[:] = {5e6};
  parameter Real FV402_s[:] = {5e6};
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(redeclare model Medium = WaterHot, Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
    Placement(visible = true, transformation(origin = {-337, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(redeclare model Medium = WaterHot, Tin_start(displayUnit = "K") = TestFacility.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = TestFacility.Data.PumpData.P401.Tout_start, a = TestFacility.Data.PumpData.P401.a, b = TestFacility.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = TestFacility.Data.PumpData.P401.dpnom, etaelec = TestFacility.Data.PumpData.P401.etaelec, etamech = TestFacility.Data.PumpData.P401.etamech, etanom = TestFacility.Data.PumpData.P401.etanom, hin_start = TestFacility.Data.PumpData.P401.hin_start, m_flow_nom = TestFacility.Data.PumpData.P401.m_flow_nom, omeganom = TestFacility.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P401.pout_start, qnom_inm3h = TestFacility.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = TestFacility.Data.PumpData.P401.rhonom, headnom = TestFacility.Data.PumpData.P401.headnom, headmax = TestFacility.Data.PumpData.P401.headnommax, headmin = TestFacility.Data.PumpData.P401.headnommin, qnom_inm3h_min = TestFacility.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = TestFacility.Data.PumpData.P401.qnommax_inm3h, use_in_omega = true) annotation (
    Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-318, -171})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(redeclare model Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV401.Kv,
    openingChar=TestFacility.Data.ValveData.FCV401.openingChar,                                                    dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV401.dp_nom, rho_nom = TestFacility.Data.ValveData.FCV401.rho_nom, q_m3h_nom = TestFacility.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
    Placement(transformation(origin = {-318, -110}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(redeclare model Medium = WaterHot, L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -232})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(redeclare model Medium = WaterHot, L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -234})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(redeclare model Medium = WaterHot, L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(origin = {-318, -142}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(redeclare model Medium = WaterHot, T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-316, -70})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-316, -82})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -114})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(redeclare model Medium = WaterHot, T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -102})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(redeclare model Medium = WaterHot, T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
    Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-361, -191})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(redeclare model Medium = WaterHot, L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -162})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(redeclare model Medium = WaterHot, L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -48})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(redeclare model Medium = WaterHot, L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -50})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-358, -16})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -16})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-302,-350})));
equation
  connect(P401.inlet, PL3_S401.outlet) annotation (
    Line(points = {{-318, -180.6}, {-318, -222}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT402.inlet, PT402.inlet) annotation (
    Line(points = {{-318.4, -70}, {-318.4, -82}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FT401.outlet, PL2_S401.inlet) annotation (
    Line(points = {{-358.2, -195.2}, {-358.2, -203.6}, {-358, -203.6}, {-358, -224}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL1_S401.outlet, FT401.inlet) annotation (
    Line(points = {{-358, -172}, {-358, -179.4}, {-358.2, -179.4}, {-358.2, -186.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL1_S401.inlet, PT401.inlet) annotation (
    Line(points = {{-358, -152}, {-358, -114}, {-357.6, -114}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT401.inlet, TT401.inlet) annotation (
    Line(points = {{-357.6, -114}, {-357.6, -102}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EB401.outlet, PL3_S401.inlet) annotation (
    Line(points = {{-326.5, -273}, {-326.5, -256}, {-318, -256}, {-318, -242}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
    Line(points = {{-318.4, -70}, {-318, -70}, {-318, -58}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
    Line(points = {{-357.6, -102}, {-358, -102}, {-358, -60}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
    Line(points = {{-358, -40}, {-358, -26}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
    Line(points = {{-318, -38}, {-318, -26}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
    Line(points = {{-358, -6}, {-358, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
    Line(points = {{-318, -6}, {-318, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL2_S401.outlet, EB401.inlet) annotation (
    Line(points = {{-358, -244}, {-358, -258}, {-347.5, -258}, {-347.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
  connect(
      P401.outlet, PL4_S401.inlet) annotation (
    Line(points={{-318,-161.4},{-318,-152}},    color = {140, 56, 54}));
  connect(
      PL4_S401.outlet, FCV401.inlet) annotation (
    Line(points = {{-318, -132}, {-318, -120}}, color = {140, 56, 54}));
  connect(
      FCV401.outlet, PT402.inlet)
    annotation (
    Line(points={{-318,-100},{-318,-92},{-318,-82},{-318.4,-82}},
                                               color = {140, 56, 54}));
  connect(sourceVoltage.outlet, EB401.inletPower) annotation (Line(
      points={{-302,-334},{-302,-301},{-312.5,-301}},
      color={56,93,138},
      thickness=1));
end CentralizedSystemLoadSimplifiedI_B;
