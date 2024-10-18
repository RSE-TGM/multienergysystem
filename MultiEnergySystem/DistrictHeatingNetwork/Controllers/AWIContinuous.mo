within MultiEnergySystem.DistrictHeatingNetwork.Controllers;
model AWIContinuous

  parameter Real Ki = 1 "Proportional gain";
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
        Placement(visible = true, transformation(origin={100,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
        Placement(visible = true, transformation(origin={-60,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain integralGain(k=1)  annotation (Placement(visible=true, transformation(
        origin={16,34},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Math.Add add(k1 = +1, k2=-1)    annotation (
        Placement(visible = true, transformation(origin={-16,34},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation (
        Placement(visible = true, transformation(origin={76,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k=Ki)
                                                   annotation (Placement(transformation(extent={{34,24},{54,44}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=Umax, uMin=Umin) annotation (Placement(transformation(extent={{12,-42},{-8,-22}})));
equation
  connect(REF, feedback.u1) annotation (
        Line(points={{-110,40},{-68,40}},      color = {0, 0, 127}));
  connect(FeedBack, feedback.u2) annotation (
        Line(points={{-110,-32},{-60,-32},{-60,32}},        color = {0, 0, 127}));
  connect(limiter.y, controlAction) annotation (
        Line(points={{87,34},{100,34}},      color = {0, 0, 127}));
  connect(deadZone.y, add.u2) annotation (Line(points={{-9,-32},{-34,-32},{-34,28},{-28,28}}, color={0,0,127}));
  connect(add.y, integralGain.u) annotation (Line(points={{-5,34},{4,34}}, color={0,0,127}));
  connect(feedback.y, add.u1) annotation (Line(points={{-51,40},{-28,40}}, color={0,0,127}));
  connect(integralGain.y, integrator.u) annotation (Line(points={{27,34},{32,34}}, color={0,0,127}));
  connect(integrator.y, limiter.u) annotation (Line(points={{55,34},{64,34}}, color={0,0,127}));
  connect(deadZone.u, limiter.u) annotation (Line(points={{14,-32},{58,-32},{58,34},{64,34}}, color={0,0,127}));
  annotation (
      Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-100,100},{100,-100}},
          textColor={0,0,0},
          textString="I
AW")}),
      Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
end AWIContinuous;
