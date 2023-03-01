within MultiEnergySystem.DistrictHeatingNetwork.Examples.Configurations;

model Configuration5 "Configuration based on file Configurazione 5.dwg"
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage D202 annotation(
    Placement(visible = true, transformation(origin = {-214.286, -70}, extent = {{-17.1429, -24}, {17.1429, 24}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P201 annotation(
    Placement(visible = true, transformation(origin = {-260, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701 annotation(
    Placement(visible = true, transformation(origin = {119, -59.3333}, extent = {{-14, 23.3333}, {14, -23.3333}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.Boiler boiler annotation(
    Placement(visible = true, transformation(origin = {-76, -72}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P401 annotation(
    Placement(visible = true, transformation(origin = {-8, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceColdEX701 annotation(
    Placement(visible = true, transformation(origin = {88, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkColdEX701 annotation(
    Placement(visible = true, transformation(origin = {150, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721 annotation(
    Placement(visible = true, transformation(origin = {219, -59.3333}, extent = {{-14, 23.3333}, {14, -23.3333}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceColdEX721 annotation(
    Placement(visible = true, transformation(origin = {190, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkColdEX721 annotation(
    Placement(visible = true, transformation(origin = {250, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P201.outlet, D202.inlet) annotation(
    Line(points = {{-254, -100}, {-240.4, -100}, {-240.4, -80.2}, {-232.4, -80.2}}, color = {168, 168, 168}));
  connect(boiler.outlet, P401.inlet) annotation(
    Line(points = {{-56, -72}, {-40, -72}, {-40, -32}, {-16, -32}}, color = {168, 168, 168}));
  connect(sourceColdEX701.outlet, EX701.incold) annotation(
    Line(points = {{98, -94}, {98, -95}, {102, -95}, {102, -66}}, color = {168, 168, 168}));
  connect(sinkColdEX701.inlet, EX701.outcold) annotation(
    Line(points = {{140, -94}, {134, -94}, {134, -66}}, color = {168, 168, 168}));
  connect(sourceColdEX721.outlet, EX721.incold) annotation(
    Line(points = {{200, -94}, {202, -94}, {202, -66}}, color = {168, 168, 168}));
  connect(sinkColdEX721.inlet, EX721.outcold) annotation(
    Line(points = {{240, -94}, {234, -94}, {234, -66}}, color = {168, 168, 168}));

annotation(
    Diagram(coordinateSystem(extent = {{-360, -160}, {360, 160}})));
end Configuration5;
