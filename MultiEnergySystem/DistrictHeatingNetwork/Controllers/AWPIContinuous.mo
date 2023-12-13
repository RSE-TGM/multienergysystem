within MultiEnergySystem.DistrictHeatingNetwork.Controllers;
model AWPIContinuous

  parameter Real Kp = 1 "Proportional gain";
  parameter Real Ti = 1 "Integral Time";
  parameter Real Umax = 1 "Maximum control action";
  parameter Real Umin = 0 "Minimum control action";
  parameter Real y_start = 1 "Nominal output";
  Modelica.Blocks.Interfaces.RealInput REF annotation (
      Placement(visible = true, transformation(origin={-110,40},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,40},    extent={{-20,-20},
            {20,20}},                                                                                                                                                                       rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
        Placement(visible = true, transformation(origin={-110,-32},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,-40},    extent={{-20,-20},
            {20,20}},                                                                                                                                                                           rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
        Placement(visible = true, transformation(origin={100,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={80,0},    extent={{-20,-20},
            {20,20}},                                                                                                                                                                      rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
        Placement(visible = true, transformation(origin={-60,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Kp)  annotation (
        Placement(visible = true, transformation(origin={-24,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add(k1 = +1, k2 = +1)  annotation (
        Placement(visible = true, transformation(origin={14,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation (
        Placement(visible = true, transformation(origin={52,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti,
  initType=Modelica.Blocks.Types.Init.SteadyState,                                                       k = 1,
    y_start=y_start)                                                                                                          annotation (
        Placement(visible = true, transformation(origin={30,-10},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(REF, feedback.u1) annotation (
        Line(points={{-110,40},{-68,40}},      color = {0, 0, 127}));
  connect(FeedBack, feedback.u2) annotation (
        Line(points={{-110,-32},{-60,-32},{-60,32}},        color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation (
        Line(points={{-51,40},{-36,40}},      color = {0, 0, 127}));
  connect(gain.y, add.u1) annotation (
        Line(points={{-13,40},{2,40}},      color = {0, 0, 127}));
  connect(add.y, limiter.u) annotation (
        Line(points={{25,34},{40,34}},      color = {0, 0, 127}));
  connect(limiter.y, controlAction) annotation (
        Line(points={{63,34},{100,34}},      color = {0, 0, 127}));
  connect(firstOrder.y, add.u2) annotation (
        Line(points={{19,-10},{-10,-10},{-10,28},{2,28}},       color = {0, 0, 127}));
connect(firstOrder.u, controlAction) annotation (Line(points={{42,-10},{70,-10},
          {70,34},{100,34}},
                           color={0,0,127}));
  annotation (
      Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,
              100},{100,-104}}),                                                                                                                            Text(extent={{-100,
              100},{100,-104}},
          textColor={0,0,0},
          textString="PI
AW")}),
      Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
end AWPIContinuous;
