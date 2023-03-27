within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;

model DropPressure
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.round1DFV linearpipe annotation(
    Placement(visible = true, transformation(origin = {0, 28}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.round1DFV nonlinearpipe annotation(
    Placement(visible = true, transformation(origin = {2.22045e-16, -32}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceL annotation(
    Placement(visible = true, transformation(origin = {-40, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceNL annotation(
    Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkL annotation(
    Placement(visible = true, transformation(origin = {40, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkNL annotation(
    Placement(visible = true, transformation(origin = {40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceNL.outlet, nonlinearpipe.inlet) annotation(
    Line(points = {{-30, -32}, {-14, -32}}, color = {140, 56, 54}));
  connect(sourceL.outlet, linearpipe.inlet) annotation(
    Line(points = {{-30, 28}, {-14, 28}}, color = {140, 56, 54}));
  connect(linearpipe.outlet, sinkL.inlet) annotation(
    Line(points = {{14, 28}, {30, 28}}, color = {140, 56, 54}));
  connect(nonlinearpipe.outlet, sinkNL.inlet) annotation(
    Line(points = {{14, -32}, {30, -32}}, color = {140, 56, 54}));

annotation(
    Documentation(info = "<html><head></head><body>Base test to verify the difference between considering linear or non-linear drop pressure.</body></html>"));
end DropPressure;
