within MultiEnergySystem.DistrictHeatingNetwork.Examples.Configurations;

model Configuration5 "Configuration based on file Configurazione 5.dwg"
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D202 annotation(
    Placement(visible = true, transformation(origin = {-234.286, -68}, extent = {{-17.1429, -24}, {17.1429, 24}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P201 annotation(
    Placement(visible = true, transformation(origin = {-280, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701 annotation(
    Placement(visible = true, transformation(origin = {217, -61.3333}, extent = {{-14, 23.3333}, {14, -23.3333}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P401 annotation(
    Placement(visible = true, transformation(origin = {70, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkColdEX701(T0 = BPHE.E701.Tout_start_hot, m_flow0 = BPHE.E701.m_flow_start_hot, p0 = BPHE.E701.pout_start_hot, pin_start = BPHE.E701.pout_start_hot)  annotation(
    Placement(visible = true, transformation(origin = {246, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721 annotation(
    Placement(visible = true, transformation(origin = {313, -61.3333}, extent = {{-14, 23.3333}, {14, -23.3333}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkColdEX721 annotation(
    Placement(visible = true, transformation(origin = {346, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX601 annotation(
    Placement(visible = true, transformation(origin = {-1, -63.3333}, extent = {{-14, -23.3333}, {14, 23.3333}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics HP601 annotation(
    Placement(visible = true, transformation(origin = {-1, 3}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot(T = 17 + 273.15, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {120, -152}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP annotation(
    Placement(visible = true, transformation(origin = {-120, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX501 annotation(
    Placement(visible = true, transformation(origin = {-121, 2.6667}, extent = {{-14, -23.3333}, {14, 23.3333}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler gasBoiler annotation(
    Placement(visible = true, transformation(origin = {115, -59}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
  connect(P201.outlet, D202.inlet) annotation(
    Line(points = {{-274.4, -98.2}, {-260.8, -98.2}, {-260.8, -78.4}, {-252.8, -78.4}}, color = {168, 168, 168}));
  connect(HP601.outcold, EX601.incold) annotation(
    Line(points = {{-16, -12}, {-18, -12}, {-18, -56}}, color = {168, 168, 168}));
  connect(HP601.incold, EX601.outcold) annotation(
    Line(points = {{14, -12}, {14, -56}}, color = {168, 168, 168}));
  connect(sinkColdEX721.inlet, EX721.outcold) annotation(
    Line(points = {{336, -96}, {329, -96}, {329, -68}}, color = {168, 168, 168}));
  connect(sinkColdEX701.inlet, EX701.outcold) annotation(
    Line(points = {{236, -96}, {233, -96}, {233, -68}}, color = {168, 168, 168}));
  connect(CHP.outlet, EX501.inhot) annotation(
    Line(points = {{-100, -74}, {-82, -74}, {-82, -34}, {-104, -34}, {-104, -4}}, color = {168, 168, 168}));
  connect(CHP.inlet, EX501.outhot) annotation(
    Line(points = {{-140, -74}, {-158, -74}, {-158, -34}, {-138, -34}, {-138, -4}}, color = {168, 168, 168}));
  connect(sourceHot.outlet, EX721.incold) annotation(
    Line(points = {{120, -142}, {120, -132}, {296, -132}, {296, -68}}, color = {168, 168, 168}));
  connect(sourceHot.outlet, EX701.incold) annotation(
    Line(points = {{120, -142}, {120, -132}, {201, -132}, {201, -68}}, color = {168, 168, 168}));
  connect(sourceHot.outlet, EX601.outhot) annotation(
    Line(points = {{120, -142}, {120, -132}, {-18, -132}, {-18, -70}}, color = {168, 168, 168}));
  connect(gasBoiler.outlet, P401.inlet) annotation(
    Line(points = {{102, -50}, {68, -50}, {68, -36}}, color = {136, 136, 136}));
  annotation(
    Diagram(coordinateSystem(extent = {{-360, -160}, {360, 160}})));
end Configuration5;
