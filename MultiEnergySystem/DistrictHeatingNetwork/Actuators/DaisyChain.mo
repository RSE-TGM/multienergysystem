within MultiEnergySystem.DistrictHeatingNetwork.Actuators;

model DaisyChain
  parameter Real Umax = 10e3;
  parameter Real Umin = 0;
  Modelica.Blocks.Interfaces.RealInput U annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout1 annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout2 annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterYout1(uMax = Umax, uMin = Umin) annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback sustract annotation(
    Placement(visible = true, transformation(origin = {60, -40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  connect(U, limiterYout1.u) annotation(
    Line(points = {{-100, 0}, {-60, 0}, {-60, 40}, {-12, 40}}, color = {0, 0, 127}));
  connect(limiterYout1.y, Yout1) annotation(
    Line(points = {{12, 40}, {100, 40}}, color = {0, 0, 127}));
  connect(limiterYout1.y, sustract.u2) annotation(
    Line(points = {{12, 40}, {60, 40}, {60, -32}}, color = {0, 0, 127}));
  connect(sustract.y, Yout2) annotation(
    Line(points = {{70, -40}, {100, -40}}, color = {0, 0, 127}));
  connect(U, sustract.u1) annotation(
    Line(points = {{-100, 0}, {-60, 0}, {-60, -40}, {52, -40}}, color = {0, 0, 127}));

annotation(
    Icon(graphics = {Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Text(extent = {{-38, 12}, {38, -12}}, textString = "Actuator")}));
end DaisyChain;
