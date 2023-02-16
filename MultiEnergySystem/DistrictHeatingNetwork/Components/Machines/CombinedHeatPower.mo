within MultiEnergySystem.DistrictHeatingNetwork.Components.Machines;
model CombinedHeatPower
  extends DHN4Control.Interfaces.PartialTwoPort;

  parameter Modelica.Units.SI.PerUnit eta_electrical = 0.4193 "Average electrical efficiency";
  parameter Modelica.Units.SI.PerUnit eta_thermal = 0.5453 "Average thermal efficiency";

  Modelica.Units.SI.Power Ptransfer;

  Modelica.Blocks.Interfaces.RealInput PelectricRef annotation (
    Placement(visible = true, transformation(origin = {-106, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer idealHeatHX
    "Ideal heat exchanger, setting the total exchanged heat power." annotation
    (Placement(visible=true, transformation(extent={{-10,-10},{10,10}},
          rotation=0)));
equation

  Ptransfer = PelectricRef*eta_thermal/eta_electrical;
  idealHeatHX.Ptransfer = Ptransfer;

  connect(inlet, idealHeatHX.inlet)
    annotation (Line(points={{-100,0},{-10,0}},color={168,168,168}));
  connect(idealHeatHX.outlet, outlet)
    annotation (Line(points={{10,0},{100,0}}, color={168,168,168}));
  annotation (
    Icon(graphics={  Rectangle(origin = {-4, 0}, fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, extent = {{-84, 100}, {84, -100}}), Ellipse(origin = {0, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}}), Ellipse(origin = {0, 50}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {0, 50}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}),
    Diagram(coordinateSystem(extent = {{-140, 120}, {100, -20}})));
end CombinedHeatPower;
