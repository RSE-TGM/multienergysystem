within MultiEnergySystem.DistrictHeatingNetwork.Controllers;
model AWPIContinuous

  parameter Real Kp = 1 "Proportional gain";
  parameter Real Ti = 1 "Integral Time";
  parameter Real Umax = 1 "Maximum control action";
  parameter Real Umin = 0 "Minimum control action";
  Modelica.Blocks.Interfaces.RealInput REF annotation (
      Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, 38}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
        Placement(visible = true, transformation(origin = {-100, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, -30}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
        Placement(visible = true, transformation(origin = {110, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
        Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Kp)  annotation (
        Placement(visible = true, transformation(origin = {-14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = +1, k2 = +1)  annotation (
        Placement(visible = true, transformation(origin = {24, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation (
        Placement(visible = true, transformation(origin = {62, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti,
  initType=Modelica.Blocks.Types.Init.SteadyState,                                                       k = 1,
  y_start=0)                                                                                                                  annotation (
        Placement(visible = true, transformation(origin={40,-8},     extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(REF, feedback.u1) annotation (
        Line(points = {{-100, 40}, {-58, 40}}, color = {0, 0, 127}));
  connect(FeedBack, feedback.u2) annotation (
        Line(points = {{-100, -32}, {-50, -32}, {-50, 32}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation (
        Line(points={{-41,40},{-26,40}},      color = {0, 0, 127}));
  connect(gain.y, add.u1) annotation (
        Line(points={{-3,40},{12,40}},      color = {0, 0, 127}));
  connect(add.y, limiter.u) annotation (
        Line(points={{35,34},{50,34}},      color = {0, 0, 127}));
  connect(limiter.y, controlAction) annotation (
        Line(points={{73,34},{110,34}},      color = {0, 0, 127}));
  connect(firstOrder.y, add.u2) annotation (
        Line(points={{29,-8},{0,-8},{0,28},{12,28}},            color = {0, 0, 127}));
connect(firstOrder.u, controlAction) annotation (Line(points={{52,-8},{80,-8},
        {80,34},{110,34}}, color={0,0,127}));
  annotation (
      Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}}), Text(extent = {{-38, 12}, {38, -12}}, textString = "PI AW")}),
      Diagram(coordinateSystem(extent = {{-120, 60}, {120, -60}})));
end AWPIContinuous;
