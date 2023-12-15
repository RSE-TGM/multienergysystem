within MultiEnergySystem.DistrictHeatingNetwork.Components.Machines;
model HeatPump
  "Model a simplified static HeatPump, with a fixed COP"
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;

  parameter Real COP = 2.5 "Fixed COP Value";
  Modelica.Blocks.Math.Gain heatPumpCOP(k = COP) annotation (
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pelectrical annotation (
    Placement(visible = true, transformation(origin = {-98, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={0,60},     extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer heatPumpHX
    annotation (Placement(visible=true, transformation(origin = {-2, 0},extent={{-8,-10},{12,10}},
          rotation=0)));
equation
  connect(Pelectrical, heatPumpCOP.u) annotation (
    Line(points = {{-98, 40}, {-62, 40}}, color = {0, 0, 127}));
  connect(heatPumpCOP.y, heatPumpHX.Ptransfer) annotation (Line(points={{-39,40},
          {0,40},{0,8}},                       color={0,0,127}));

  connect(outlet, outlet) annotation (Line(points={{100,0},{102,0},{102,6},{104,
          6},{104,0},{100,0}},  color={168,168,168}));
  connect(inlet, inlet)
    annotation (Line(points={{-100,0},{-100,0}}, color={168,168,168}));
  connect(heatPumpHX.inlet, inlet) annotation (Line(
      points={{-10,0},{-100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(outlet, heatPumpHX.outlet) annotation (Line(
      points={{100,0},{10,0}},
      color={140,56,54},
      thickness=0.5));
annotation (
    Diagram(coordinateSystem(extent = {{-120, 60}, {100, -20}})),
    Icon(graphics={  Rectangle(origin={0,-8},   fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Rectangle(origin = {47, -33}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, 13}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, -3}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, -19}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, 29}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Ellipse(origin={-40,0},    fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-36, 0}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end HeatPump;
