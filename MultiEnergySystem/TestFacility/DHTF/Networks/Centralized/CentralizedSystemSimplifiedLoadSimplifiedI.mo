within MultiEnergySystem.TestFacility.DHTF.Networks.Centralized;
partial model CentralizedSystemSimplifiedLoadSimplifiedI "System with only Gas Boiler as source of heat"
  // System S100
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 30 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 30 + 273.15;
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
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
  parameter Real q_m3h_S1 = 9;
  parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
  parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:, :] = [0, 1];
  parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  DHTF.Subsystems.HeatGeneration.GasBoiler S100 annotation (
    Placement(transformation(extent = {{-95, -68}, {-59, -32}})));
  DHTF.Subsystems.Distribution.CirculationPump S900 annotation (
    Placement(transformation(extent = {{-18, -18}, {18, 18}}, rotation = -90, origin = {-105, 63})));
  DHTF.Subsystems.Load.SingleLoad EX701 annotation (
    Placement(transformation(extent={{-36,-68},{0,-32}})));
  DHTF.Subsystems.HeatGeneration.ElectricBoiler S400 annotation (
    Placement(transformation(extent = {{-149, -67}, {-113, -31}})));
  DHTF.Subsystems.Load.SingleLoad EX711 annotation (
    Placement(transformation(extent={{21,-68},{57,-32}})));
  DHTF.Subsystems.Load.SingleLoad EX721 annotation (
    Placement(transformation(extent={{83,-68},{119,-32}})));
  DHTF.Subsystems.Load.SingleLoad EX731 annotation (
    Placement(transformation(extent={{138,-68},{174,-32}})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(Kv = 33, dp_nom = 50000, Tin_start = T_start, pin_start = pin_start) annotation (
    Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-4, 4}, {4, -4}}, rotation = 90)));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(q_m3h_start = q_m3h_rackHot/4, Kv = TestFacility.Data.ValveData.FCVC02.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot, pin_start = 200000) annotation (
    Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {190, 63})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(Kv = TestFacility.Data.ValveData.FCVC01.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = 60 + 273.15, pin_start = 200000) annotation (
    Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {70, 63})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI annotation (
    Placement(transformation(extent = {{-36, 45}, {0, 81}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI1 annotation (
    Placement(transformation(extent = {{21, 45}, {57, 81}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI2 annotation (
    Placement(transformation(extent = {{84, 45}, {120, 81}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI3 annotation (
    Placement(transformation(extent = {{138, 45}, {174, 81}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI4 annotation (
    Placement(transformation(extent = {{-149, -8}, {-113, 28}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI connectorTypeI5 annotation (
    Placement(transformation(extent = {{-95, -8}, {-59, 28}})));
equation
  connect(EX701.inhot, connectorTypeI.outletComp) annotation (
    Line(points={{-26.64,-29.3},{-26.64,9},{-27,9},{-27,42.48}},          color = {140, 56, 54}, thickness = 0.5));
  connect(EX701.outhot, connectorTypeI.inletComp) annotation (
    Line(points={{-8.82,-29.3},{-8.82,42.66}},      color = {140, 56, 54}, thickness = 0.5));
  connect(S900.inletcold, connectorTypeI.outletCold) annotation (
    Line(points = {{-84.3, 70.02}, {-61.41, 70.02}, {-61.41, 70.2}, {-38.52, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI.inletCold, connectorTypeI1.outletCold) annotation (
    Line(points = {{2.52, 70.2}, {18.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI.outletHot, connectorTypeI1.inletHot) annotation (
    Line(points = {{2.52, 55.8}, {9.41, 55.8}, {9.41, 55.8}, {18.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(S900.outlethot, connectorTypeI.inletHot) annotation (
    Line(points = {{-84.3, 55.98}, {-65, 55.98}, {-65, 55.8}, {-38.52, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI1.inletComp, EX711.outhot) annotation (
    Line(points={{48.18,42.66},{48.18,-29.3}},      color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI1.outletComp, EX711.inhot) annotation (
    Line(points={{30,42.48},{31,42.48},{31,-29.3},{30.36,-29.3}},          color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI1.outletHot, connectorTypeI2.inletHot) annotation (
    Line(points = {{59.52, 55.8}, {81.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI1.inletCold, connectorTypeI2.outletCold) annotation (
    Line(points = {{59.52, 70.2}, {81.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCVC01.inlet, connectorTypeI2.inletHot) annotation (
    Line(points = {{70, 59}, {70, 55.8}, {81.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FCVC01.outlet, connectorTypeI2.outletCold) annotation (
    Line(points = {{70, 67}, {70, 70.2}, {81.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.outletCold, connectorTypeI2.inletCold) annotation (
    Line(points = {{135.48, 70.2}, {122.52, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.inletHot, connectorTypeI2.outletHot) annotation (
    Line(points = {{135.48, 55.8}, {122.52, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.outletHot, FCVC02.inlet) annotation (
    Line(points = {{176.52, 55.8}, {190, 55.8}, {190, 59}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.inletCold, FCVC02.outlet) annotation (
    Line(points = {{176.52, 70.2}, {190, 70.2}, {190, 67}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI2.outletComp, EX721.inhot) annotation (
    Line(points={{93,42.48},{92,42.48},{92,-14},{92.36,-14},{92.36,-29.3}},            color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI2.inletComp, EX721.outhot) annotation (
    Line(points={{111.18,42.66},{110.18,42.66},{110.18,-29.3}},        color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.outletComp, EX731.inhot) annotation (
    Line(points={{147,42.48},{147,11.09},{147.36,11.09},{147.36,-29.3}},          color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI3.inletComp, EX731.outhot) annotation (
    Line(points={{165.18,42.66},{165.18,-29.3}},      color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI5.outletCold, connectorTypeI4.inletCold) annotation (
    Line(points = {{-97.52, 17.2}, {-110.48, 17.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI5.inletComp, S100.outlet) annotation (
    Line(points = {{-67.82, -10.34}, {-67.82, -20}, {-69.62, -20}, {-69.62, -29.3}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI4.inletComp, S400.outlet) annotation (
    Line(points = {{-121.82, -10.34}, {-121.82, -20}, {-123.62, -20}, {-123.62, -28.3}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI4.outletComp, S400.inlet) annotation (
    Line(points = {{-140, -10.52}, {-140, -20.41}, {-138.02, -20.41}, {-138.02, -28.3}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI4.outletHot, connectorTypeI5.inletHot) annotation (
    Line(points = {{-110.48, 2.8}, {-97.52, 2.8}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV933.outlet, connectorTypeI5.inletCold) annotation (
    Line(points = {{-48, 14}, {-48, 17.2}, {-56.48, 17.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI5.outletHot, FV933.inlet) annotation (
    Line(points = {{-56.48, 2.8}, {-48, 2.8}, {-48, 6}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI5.outletComp, S100.inlet) annotation (
    Line(points = {{-86, -10.52}, {-86, -20}, {-84.02, -20}, {-84.02, -29.3}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI4.outletCold, S900.inlethot) annotation (
    Line(points = {{-151.52, 17.2}, {-159, 17.2}, {-159, 55.98}, {-125.7, 55.98}}, color = {140, 56, 54}, thickness = 0.5));
  connect(connectorTypeI4.inletHot, S900.outletcold) annotation (
    Line(points = {{-151.52, 2.8}, {-167, 2.8}, {-167, 70.02}, {-125.7, 70.02}}, color = {140, 56, 54}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}, grid = {1, 1})));
end CentralizedSystemSimplifiedLoadSimplifiedI;
