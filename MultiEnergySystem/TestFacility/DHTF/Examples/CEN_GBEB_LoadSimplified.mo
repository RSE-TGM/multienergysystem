within MultiEnergySystem.TestFacility.DHTF.Examples;
model CEN_GBEB_LoadSimplified
  extends DHTF.Examples.CEN_GB_LoadSimplified(
    coldSourcePEX721(T0=15 + 273.15),
    FV933_state=false,
    P901omega=[0,2*pi*30; 500,2*pi*30],
    P101omega=[0,2*pi*30; 1000,2*pi*30],
    pin_start_rCD_cold=1.66e5,
    VE901(p0(displayUnit="Pa") = 166000),
    P101qm3h=[0,14; 100,14],
    T_start_cold=72 + 273.15,
    T_start_hot=80 + 273.15,
    Tin_start_S1=72 + 273.15,
    Tout_start_S1=80 + 273.15,
    FCV101theta=[0,1; 100,1],
    FCVC01theta=[0,0; 100,0],
    FCVC02theta=[0,0; 100,0],
    FCV701theta=[0,1; 100,1],
    FCV711theta=[0,1; 100,1],
    FCV721theta=[0,1; 100,1],
    FCV731theta=[0,1; 100,1],
    FCVR01theta=[0,0.2; 8000,0.2; 8000,0.5; 10000,0.5],
    EX701_TinCold=[0,22 + 273.15; 100,22 + 273.15],
    EX711_TinCold=[0,22 + 273.15; 100,22 + 273.15],
    EX721_TinCold=[0,22 + 273.15; 100,22 + 273.15],
    EX731_TinCold=[0,22 + 273.15; 100,22 + 273.15],
    EX701q_m3h_cold=[0,4.2; 100,4.2],
    EX711q_m3h_cold=[0,4.2; 100,4.2],
    EX721q_m3h_cold=[0,4.2; 100,4.2],
    EX731q_m3h_cold=[0,4.2; 100,4.2],
    GB101(Pmaxnom=147.6e3*0.8),
    ToutcoolSP=[0,25.5; 500,25.5; 500,12; 1000,12],
    EX701(Tin_start_hot=T_start_hot),
    EX731(Tin_start_hot=T_start_hot),
    FCV901(Kv=20));
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
  parameter Real P401omega[:, :] = [0, 2*3.141592654*30; 100, 2*3.141592654*30; 100, 2*3.141592654*30; 200, 2*3.141592654*30];
  parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
  parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
  parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;
  parameter Boolean FV401_startValue = true;
  parameter Boolean FV402_startValue = true;
  parameter Real FV401_s[:] = {5e6};
  parameter Real FV402_s[:] = {5e6};
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
    Placement(visible = true, transformation(origin = {-342, -302}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(Tin_start(displayUnit = "K") = TestFacility.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = TestFacility.Data.PumpData.P401.Tout_start, a = TestFacility.Data.PumpData.P401.a, b = TestFacility.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = TestFacility.Data.PumpData.P401.dpnom, etaelec = TestFacility.Data.PumpData.P401.etaelec, etamech = TestFacility.Data.PumpData.P401.etamech, etanom = TestFacility.Data.PumpData.P401.etanom, hin_start = TestFacility.Data.PumpData.P401.hin_start, m_flow_nom = TestFacility.Data.PumpData.P401.m_flow_nom, omeganom = TestFacility.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = TestFacility.Data.PumpData.P401.pout_start, qnom_inm3h = TestFacility.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = TestFacility.Data.PumpData.P401.rhonom, headnom = TestFacility.Data.PumpData.P401.headnom, headmax = TestFacility.Data.PumpData.P401.headnommax, headmin = TestFacility.Data.PumpData.P401.headnommin, qnom_inm3h_min = TestFacility.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = TestFacility.Data.PumpData.P401.qnommax_inm3h, use_in_omega = true) annotation (
    Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-322, -175})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = TestFacility.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV401.dp_nom, rho_nom = TestFacility.Data.ValveData.FCV401.rho_nom, q_m3h_nom = TestFacility.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -110})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -236})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -238})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -142})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-320, -74})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-320, -86})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -118})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -106})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
    Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-365, -195})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -166})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(L = L_S4_rCD_hot, h = h_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -52})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(L = L_S4_rCD_cold, h = h_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
    Placement(transformation(origin = {-362, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-362, -20})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -20})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table = FCV401theta) annotation (
    Placement(transformation(extent = {{-178, -152}, {-198, -132}})));
  DistrictHeatingNetwork.Sources.PumpInput P401_input(omega = P401omega, q_m3h = P401qm3h) annotation (
    Placement(transformation(extent = {{-288, -191}, {-308, -170}})));
  Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table = EB401_ToutSP) annotation (
    Placement(transformation(extent = {{-408, -310}, {-388, -290}})));
  Modelica.Blocks.Sources.BooleanTable FV401_Status(table = FV401_s, startValue = FV401_startValue) "Input for the status (open/close) of valve FV401" annotation (
    Placement(transformation(extent = {{-394, -30}, {-374, -10}})));
  Modelica.Blocks.Sources.BooleanTable FV402_Status(table = FV402_s, startValue = FV402_startValue) "Input for the status (open/close) of valve FV402" annotation (
    Placement(transformation(extent = {{-290, -30}, {-310, -10}})));
  Modelica.Blocks.Sources.BooleanTable EB401_Status(table = {1e8}, startValue = true) "Input to decide whether or nor the electric boiler is working" annotation (
    Placement(transformation(extent = {{-408, -342}, {-388, -322}})));
  Modelica.Blocks.Continuous.FirstOrder FCV401_firstOrder(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(extent = {{-206, -152}, {-226, -132}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 90, origin = {-346, -406})));
equation
  connect(P401.inlet, PL3_S401.outlet) annotation (
    Line(points = {{-322, -184.6}, {-322, -226}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT402.inlet, PT402.inlet) annotation (
    Line(points = {{-322.4, -74}, {-322.4, -86}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FT401.outlet, PL2_S401.inlet) annotation (
    Line(points = {{-362.2, -199.2}, {-362.2, -207.6}, {-362, -207.6}, {-362, -228}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL1_S401.outlet, FT401.inlet) annotation (
    Line(points = {{-362, -176}, {-362, -183.4}, {-362.2, -183.4}, {-362.2, -190.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL1_S401.inlet, PT401.inlet) annotation (
    Line(points = {{-362, -156}, {-362, -118}, {-361.6, -118}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT401.inlet, TT401.inlet) annotation (
    Line(points = {{-361.6, -118}, {-361.6, -106}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL2_S401.outlet, EB401.inlet) annotation (
    Line(points = {{-362, -248}, {-362, -258}, {-352.2, -258}, {-352.2, -274.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EB401.outlet, PL3_S401.inlet) annotation (
    Line(points = {{-331.8, -274.8}, {-331.8, -258}, {-322, -258}, {-322, -246}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
    Line(points = {{-322.4, -74}, {-322, -74}, {-322, -62}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
    Line(points = {{-361.6, -106}, {-362, -106}, {-362, -64}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
    Line(points = {{-362, -44}, {-362, -30}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
    Line(points = {{-322, -42}, {-322, -30}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
    Line(points = {{-362, -10}, {-362, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
    Line(points = {{-322, -10}, {-322, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (
    Line(points = {{-387, -300}, {-387, -302}, {-365.8, -302}}, color = {0, 0, 127}));
  connect(FV401_Status.y, FV401.u) annotation (
    Line(points = {{-373, -20}, {-365.2, -20}}, color = {255, 0, 255}));
  connect(FV402_Status.y, FV402.u) annotation (
    Line(points = {{-311, -20}, {-318.8, -20}}, color = {255, 0, 255}));
  connect(P401_input.y, P401.in_omega) annotation (
    Line(points = {{-309, -180.5}, {-312.5, -180.5}, {-312.5, -179.8}, {-316, -179.8}}, color = {0, 0, 127}));
  connect(EB401_Status.y, EB401.heat_on) annotation (
    Line(points = {{-387, -332}, {-380, -332}, {-380, -319}, {-365.8, -319}}, color = {255, 0, 255}));
  connect(FCV401_firstOrder.u, FCV401_theta.y) annotation (
    Line(points = {{-204, -142}, {-199, -142}}, color = {0, 0, 127}));
  connect(FCV401_firstOrder.y, FCV401.opening) annotation (
    Line(points = {{-227, -142}, {-227, -136}, {-160, -136}, {-160, -200}, {-256, -200}, {-256, -110}, {-314, -110}}, color = {0, 0, 127}));
  connect(PL4_S401.inlet, P401.outlet) annotation (
    Line(points = {{-322, -152}, {-322, -165.4}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL4_S401.outlet, FCV401.inlet) annotation (
    Line(points = {{-322, -132}, {-322, -120}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCV401.outlet, PT402.inlet) annotation (
    Line(points = {{-322, -100}, {-322, -93}, {-322.4, -93}, {-322.4, -86}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceVoltage.outlet, EB401.inletPower) annotation (
    Line(points = {{-346, -390}, {-348, -390}, {-348, -366}, {-318.2, -366}, {-318.2, -302}}, color = {56, 93, 138}, thickness = 1));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 12000, __Dymola_Algorithm = "Dassl"));
end CEN_GBEB_LoadSimplified;
