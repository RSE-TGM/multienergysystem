within MultiEnergySystem.TestFacility.DHTF.Networks.Centralized;
partial model CentralizedSystemIII
  extends DHTF.Networks.BaseClass.CentralizedNetworkBase;
  // S200
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
  parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 6;
  final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:, :] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
  parameter Real P201qm3h[:, :] = [0, 2.8289046; 100, 2.8289046];
  parameter Real FCV201theta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
  // Pipe length System S200
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H = 4,
    n=4,                                                                         D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
    Placement(transformation(extent = {{-770, -474}, {-826, -362}})));
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(pout_start(displayUnit = "Pa") = 3e5, Tin_start(displayUnit = "K") = TestFacility.Data.PumpData.P201.Tin_start, Tout_start = TestFacility.Data.PumpData.P201.Tout_start, a = TestFacility.Data.PumpData.P201.a, b = TestFacility.Data.PumpData.P201.b, m_flow_start = m_flow_S2, dpnom = TestFacility.Data.PumpData.P201.dpnom, etaelec = TestFacility.Data.PumpData.P201.etaelec, etamech = TestFacility.Data.PumpData.P201.etamech, etanom = TestFacility.Data.PumpData.P201.etanom, hin_start = TestFacility.Data.PumpData.P201.hin_start, m_flow_nom = TestFacility.Data.PumpData.P201.m_flow_nom, omeganom = TestFacility.Data.PumpData.P201.omeganom, pin_start(displayUnit = "Pa") = 1.8400803e5, headnom = TestFacility.Data.PumpData.P201.headnom, qnom_inm3h = TestFacility.Data.PumpData.P201.qnom_inm3h, rhonom(displayUnit = "kg/m3") = TestFacility.Data.PumpData.P201.rhonom, headmax = TestFacility.Data.PumpData.P201.headnommax, headmin = TestFacility.Data.PumpData.P201.headnommin, qnom_inm3h_min = TestFacility.Data.PumpData.P201.qnommin_inm3h, qnom_inm3h_max = TestFacility.Data.PumpData.P201.qnommax_inm3h)                    annotation (
    Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin = {-802, -206})));
  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H = 4,
    n=4,                                                                         D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
    Placement(transformation(extent = {{-708, -474}, {-652, -362}})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start = Tin_start_S2, p_start = pin_start_S2) "Temperature sensor at the inlet of pump 201" annotation (
    Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-803.75, -64.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
    Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-804, -84.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -106})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-862, -196})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(L = L_S2_PL3, t = L_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-862, -166})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(L = L_S2_PL2, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -238})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(L = L_S2_PL4, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-862, -226})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start = Tout_start_S2, p_start = pout_start_S2) "Temperature sensor at the outlet of System 200" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-760, -66})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-760, -136})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(L = L_S2_PL9, t = t_S2, pin_start = pout_start_S2, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-762, -46})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-722, -410})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(L = L_S2_PL0, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -46})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-756, -410})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-738, -438})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-738, -454})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(L = L_S2_PL6, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-830, -488})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(L = L_S2_D201_FT201, h = h_S2_D201_FT201, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-842, -438})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -168})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-832, -126})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-802, -146})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {-782, -184})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-802, -266})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(Kv = TestFacility.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin = {-782, -252})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(Kv = TestFacility.Data.ValveData.FCV201.Kv, dp_nom(displayUnit = "Pa") = TestFacility.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {-762, -216})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start = Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
    Placement(transformation(extent = {{-7, 7}, {7, -7}}, rotation = 90, origin = {-759, -277})));
equation
  connect(PT201.inlet, TT201.inlet) annotation (
    Line(points = {{-802, -84.5}, {-802, -75.625}, {-801.85, -75.625}, {-801.85, -64.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (
    Line(points = {{-802, -96}, {-802, -84.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (
    Line(points = {{-802, -215.6}, {-802, -228}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT202.inlet, PT202.inlet) annotation (
    Line(points = {{-762.4, -66}, {-762.4, -136}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (
    Line(points = {{-762, -56}, {-762, -66}, {-762.4, -66}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (
    Line(points = {{-802, -56}, {-802, -67.375}, {-801.85, -67.375}, {-801.85, -64.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(D201.outlet, PL_S200_D201_High.inlet) annotation (
    Line(points = {{-770, -383}, {-756, -383}, {-756, -400}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
    Line(points = {{-728, -438}, {-722, -438}, {-722, -420}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
    Line(points = {{-748, -438}, {-756, -438}, {-756, -420}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D202_High.inlet, D202.outlet) annotation (
    Line(points = {{-722, -400}, {-722, -383}, {-708, -383}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (
    Line(points = {{-748, -454}, {-764, -454}, {-764, -453}, {-770, -453}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (
    Line(points = {{-728, -454}, {-724, -454}, {-724, -453}, {-708, -453}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (
    Line(points = {{-820, -488}, {-756, -488}, {-756, -453}, {-770, -453}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (
    Line(points = {{-862, -216}, {-862, -206}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (
    Line(points = {{-862, -186}, {-862, -176}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (
    Line(points = {{-802, -178}, {-802, -196.4}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (
    Line(points = {{-862, -156}, {-862, -126}, {-838, -126}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (
    Line(points = {{-802, -116}, {-802, -140}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (
    Line(points = {{-802, -152}, {-802, -158}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV202.outlet, FV201.inlet) annotation (
    Line(points = {{-826, -126}, {-802, -126}, {-802, -140}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV206.outlet, P201.inlet) annotation (
    Line(points = {{-788, -184}, {-802, -184}, {-802, -196.4}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (
    Line(points = {{-802, -248}, {-802, -260}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV207.inlet, FV209.inlet) annotation (
    Line(points = {{-788, -252}, {-802, -252}, {-802, -260}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV207.outlet, FV203.inlet) annotation (
    Line(points = {{-776, -252}, {-762, -252}, {-762, -222}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV206.inlet, FV203.outlet) annotation (
    Line(points = {{-776, -184}, {-762, -184}, {-762, -210}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT202.inlet, FV203.outlet) annotation (
    Line(points = {{-762.4, -136}, {-762, -136}, {-762, -210}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FT201.outlet, FV203.inlet) annotation (
    Line(points = {{-761.8, -272.8}, {-762, -252}, {-762, -222}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
    Line(points = {{-862, -236}, {-862, -488}, {-840, -488}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (
    Line(points = {{-802, -36}, {-802, -18}, {-706, -18}, {-706, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (
    Line(points = {{-762, -36}, {-762, -30}, {-692, -30}, {-692, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (
    Line(points = {{-852, -438}, {-856, -438}, {-856, -348}, {-761.8, -348}, {-761.8, -281.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (
    Line(points = {{-832, -438}, {-756, -438}, {-756, -420}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (
    Line(points = {{-802, -272}, {-802, -328}, {-862, -328}, {-862, -488}, {-840, -488}}, color = {140, 56, 54}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CentralizedSystemIII;
