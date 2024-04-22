within MultiEnergySystem.DistrictHeatingNetwork.Actuators;
model DaisyChain
  parameter Real Umax = 0;
  parameter Real Umin = -1;

  Modelica.Blocks.Interfaces.RealInput U annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,0},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout1 annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={80,40},     extent={{-20,-20},{20,20}},      rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout2 annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={80,-40},     extent={{-20,-20},{20,20}},      rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterYout1(uMax = Umax, uMin = Umin) annotation (
    Placement(visible = true, transformation(origin={0,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback subtract annotation (
    Placement(visible = true, transformation(origin={60,-40},    extent={{-10,10},{10,-10}},      rotation = 0)));
equation
  connect(U, limiterYout1.u) annotation (Line(points={{-100,0},{-60,0},{-60,40},{-12,40}}, color={0,0,127}));
  connect(limiterYout1.y, Yout1) annotation (Line(points={{11,40},{100,40}}, color={0,0,127}));
  connect(subtract.u1, limiterYout1.u) annotation (Line(points={{52,-40},{-60,-40},{-60,40},{-12,40}}, color={0,0,127}));
  connect(subtract.u2, Yout1) annotation (Line(points={{60,-32},{60,40},{100,40}}, color={0,0,127}));
  connect(subtract.y, Yout2) annotation (Line(points={{69,-40},{100,-40}}, color={0,0,127}));
  annotation (
    Icon(graphics={  Rectangle(fillColor = {210, 210, 210}, fillPattern = FillPattern.Solid, extent={{-100,102},{100,-100}}),    Rectangle(origin = {0, 42}, lineColor = {0, 0, 127}, extent = {{-20, 20}, {20, -20}}), Line(origin = {0.53147, 42.8218}, points = {{0, 18}, {0, -18}}, color = {192, 192, 192}, arrow = {Arrow.Filled, Arrow.None}), Line(origin = {0.53147, 42.8218}, points = {{-18, 0}, {18, 0}}, color = {192, 192, 192}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.53147, 42.8218}, points = {{-16, -16}, {-10, -16}, {10, 16}, {16, 16}}), Line(origin = {-58, 21}, points={{-38,-21},
              {4,-21},{4,19},{38,19}},                                                                                                                                                                                                        color = {0, 0, 127}, arrowSize = 5), Line(origin = {54, 42}, points={{-34,-2},
              {46,-2}},                                                                                                                                                                                                        color = {0, 0, 127}), Line(origin={-7,-21},    points={{-93,21},
              {-47,21},{-47,-19},{107,-19}},                                                                                                                                                                                                        color = {0, 0, 127}), Text(origin={0,-120},    extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end DaisyChain;
