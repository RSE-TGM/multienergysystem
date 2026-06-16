within MultiEnergySystem.ElectricNetwork.Components;
model ElectricBus2 "Electric bus with 2 input terminals"
  Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortInlet electricPortInlet1 annotation (
    Placement(transformation(origin = {-102, -62}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.ElectricPortOutlet electricPortOutlet annotation (
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));

equation
  connect(electricPortInlet, electricPortOutlet) annotation (
    Line(points = {{-100, 60}, {0, 60}, {0, 0}, {100, 0}}));
  connect(electricPortInlet1, electricPortOutlet) annotation (
    Line(points = {{-102, -62}, {0, -62}, {0, 0}, {100, 0}}));
  annotation (
    Icon(graphics={  Ellipse(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, fillPattern = FillPattern.Solid, extent = {{-40, -40}, {40, 40}}), Line(origin = {30, 60}, points = {{-130, 0}, {-30, 0}}, color = {79, 129, 189}, thickness = 1), Line(origin = {-60, -60}, points = {{-34, 0}, {60, 0}}, color = {79, 129, 189}, thickness = 1), Line(origin = {70, 0}, points = {{-30, 0}, {30, 0}, {30, 0}}, color = {79, 129, 189}, thickness = 1), Line(points = {{0, 60}, {0, -60}, {0, -60}}, color = {79, 129, 189}, thickness = 1)}));
end ElectricBus2;
