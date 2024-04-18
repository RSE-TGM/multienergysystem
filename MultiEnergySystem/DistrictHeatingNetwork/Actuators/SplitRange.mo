within MultiEnergySystem.DistrictHeatingNetwork.Actuators;
block SplitRange "Block for Split Range control structure"
  parameter Real uMaxY1 = 0;
  parameter Real uMinY1 = -0.4;
  parameter Real uMaxY2 = -0.4;
  parameter Real uMinY2 = -1;

  Modelica.Blocks.Interfaces.RealInput U annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-120,0},    extent={{-20,-20},{20,20}},      rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout1 annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout2 annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,-50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterY1(uMax=uMaxY1, uMin=uMinY1) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiterY2(uMax=uMaxY2, uMin=uMinY2) annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-2,-50},{18,-30}})));
  Modelica.Blocks.Math.Gain gain(k=1/(uMinY2 - uMaxY2)) annotation (Placement(transformation(extent={{28,-50},{48,-30}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
  Modelica.Blocks.Sources.Constant uMax_Y2(k=uMaxY2) annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  Modelica.Blocks.Sources.Constant yMax_Y2(k=0) annotation (Placement(transformation(extent={{26,-90},{46,-70}})));
  Modelica.Blocks.Math.Add add2(k2=-1)  annotation (Placement(transformation(extent={{-8,30},{12,50}})));
  Modelica.Blocks.Math.Gain gain1(k=1/(uMinY1 - uMaxY1))  annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Sources.Constant yMax_Y1(k=0) annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Sources.Constant uMax_Y1(k=uMaxY1) annotation (Placement(transformation(extent={{-40,62},{-20,82}})));
equation

  connect(U, limiterY1.u) annotation (Line(points={{-100,0},{-60,0},{-60,40},{-42,40}}, color={0,0,127}));
  connect(limiterY2.u, limiterY1.u) annotation (Line(points={{-42,-40},{-60,-40},{-60,40},{-42,40}}, color={0,0,127}));
  connect(limiterY2.y, add.u1) annotation (Line(points={{-19,-40},{-14,-40},{-14,-34},{-4,-34}}, color={0,0,127}));
  connect(add.y, gain.u) annotation (Line(points={{19,-40},{26,-40}}, color={0,0,127}));
  connect(gain.y, add1.u1) annotation (Line(points={{49,-40},{52,-40},{52,-34},{58,-34}}, color={0,0,127}));
  connect(uMax_Y2.y, add.u2) annotation (Line(points={{-19,-80},{-14,-80},{-14,-46},{-4,-46}}, color={0,0,127}));
  connect(yMax_Y2.y, add1.u2) annotation (Line(points={{47,-80},{52,-80},{52,-46},{58,-46}}, color={0,0,127}));
  connect(add1.y, Yout2) annotation (Line(points={{81,-40},{100,-40}}, color={0,0,127}));
  connect(limiterY1.y, add2.u2) annotation (Line(points={{-19,40},{-16,40},{-16,34},{-10,34}}, color={0,0,127}));
  connect(add2.y, gain1.u) annotation (Line(points={{13,40},{18,40}}, color={0,0,127}));
  connect(add3.y, Yout1) annotation (Line(points={{81,40},{100,40}}, color={0,0,127}));
  connect(gain1.y, add3.u2) annotation (Line(points={{41,40},{46,40},{46,34},{58,34}}, color={0,0,127}));
  connect(yMax_Y1.y, add3.u1) annotation (Line(points={{41,70},{46,70},{46,46},{58,46}}, color={0,0,127}));
  connect(uMax_Y1.y, add2.u1) annotation (Line(points={{-19,72},{-16,72},{-16,46},{-10,46}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Rectangle(fillColor = {210, 210, 210}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-102}})}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end SplitRange;
