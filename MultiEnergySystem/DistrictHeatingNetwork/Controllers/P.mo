within MultiEnergySystem.DistrictHeatingNetwork.Controllers;
model P
  parameter Real Kp = 1 "proportional gain";
  parameter Real Umax = 1;
  parameter Real Umin = 0;

  Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
    Placement(visible = true, transformation(origin = {106, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent={{60,-20},
            {100,20}},                                                                                                                                               rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput REF annotation (
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(extent = {{-100, -60}, {-60, -20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
    Placement(visible = true, transformation(origin = {-100, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(extent={{-100,20},
            {-60,60}},                                                                                                                                                rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Kp) annotation (
      Placement(visible = true, transformation(origin = {-14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
      Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin) annotation (
      Placement(visible = true, transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback.y, gain.u) annotation (
    Line(points={{-41,40},{-26,40}},      color = {0, 0, 127}));
  connect(REF, feedback.u1) annotation (
    Line(points = {{-100, 40}, {-58, 40}}, color = {0, 0, 127}));
  connect(FeedBack, feedback.u2) annotation (
    Line(points = {{-100, 2}, {-100, 1}, {-50, 1}, {-50, 32}}, color = {0, 0, 127}));
  connect(gain.y, limiter.u) annotation (
    Line(points={{-3,40},{22,40}},      color = {0, 0, 127}));
  connect(limiter.y, controlAction) annotation (
    Line(points={{45,40},{106,40}},      color = {0, 0, 127}));
  annotation (
    Diagram,
    Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Text(                  extent={{-60,60},
              {60,-60}},                                                                                                                                                                                          textString = "P")}));
end P;
