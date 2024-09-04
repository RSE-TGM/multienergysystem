within MultiEnergySystem.DistrictHeatingNetwork.Actuators;
block SplitRange "Block for Split Range control structure"
  parameter Real uMaxY1 = 0;
  parameter Real uMinY1 = -0.4;
  parameter Real uMaxY2 = -0.4;
  parameter Real uMinY2 = -1;
  parameter Real uMaxScaledY1 = 0;
  parameter Real uMinScaledY1 = -0.4;
  parameter Real uMaxScaledY2 = 0;
  parameter Real uMinScaledY2 = -1;

  Modelica.Blocks.Interfaces.RealOutput Yout1 annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={80,40},     extent={{-20,-20},{20,20}},      rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Yout2 annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={80,-40},     extent={{-20,-20},{20,20}},      rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterY1(uMax=uMaxY1, uMin=uMinY1) annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiterY2(uMax=uMaxY2, uMin=uMinY2) annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-28,-50},{-8,-30}})));
  Modelica.Blocks.Math.Gain gain(k=(uMaxScaledY2 - uMinScaledY2)/(uMaxY2 - uMinY2))
                                                        annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Sources.Constant uMin_Y2(k=uMinY2) annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Sources.Constant uMinScaled_Y2(k=uMinScaledY2) annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
  Modelica.Blocks.Math.Add add2(k1=-1, k2=1)
                                        annotation (Placement(transformation(extent={{-28,30},{-8,50}})));
  Modelica.Blocks.Math.Gain gain1(k=(uMaxScaledY1 - uMinScaledY1)/(uMaxY1 - uMinY1))
                                                          annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Modelica.Blocks.Sources.Constant uMinScaled_Y1(k=uMinScaledY1) annotation (Placement(transformation(extent={{0,60},{20,80}})));
  Modelica.Blocks.Sources.Constant uMin_Y1(k=uMinY1) annotation (Placement(transformation(extent={{-60,62},{-40,82}})));
  Modelica.Blocks.Interfaces.RealInput U annotation (Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,0},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  connect(limiterY2.y, add.u1) annotation (Line(points={{-39,-40},{-34,-40},{-34,-34},{-30,-34}},color={0,0,127}));
  connect(add.y, gain.u) annotation (Line(points={{-7,-40},{-2,-40}}, color={0,0,127}));
  connect(gain.y, add1.u1) annotation (Line(points={{21,-40},{32,-40},{32,-34},{38,-34}}, color={0,0,127}));
  connect(uMin_Y2.y, add.u2) annotation (Line(points={{-39,-70},{-34,-70},{-34,-46},{-30,-46}},color={0,0,127}));
  connect(uMinScaled_Y2.y, add1.u2) annotation (Line(points={{21,-70},{32,-70},{32,-46},{38,-46}}, color={0,0,127}));
  connect(add1.y, Yout2) annotation (Line(points={{61,-40},{100,-40}}, color={0,0,127}));
  connect(add2.y, gain1.u) annotation (Line(points={{-7,40},{-2,40}}, color={0,0,127}));
  connect(add3.y, Yout1) annotation (Line(points={{61,40},{100,40}}, color={0,0,127}));
  connect(gain1.y, add3.u2) annotation (Line(points={{21,40},{26,40},{26,34},{38,34}}, color={0,0,127}));
  connect(uMinScaled_Y1.y, add3.u1) annotation (Line(points={{21,70},{26,70},{26,46},{38,46}}, color={0,0,127}));
  connect(limiterY1.y, add2.u2) annotation (Line(points={{-39,40},{-36,40},{-36,34},{-30,34}}, color={0,0,127}));
  connect(uMin_Y1.y, add2.u1) annotation (Line(points={{-39,72},{-36,72},{-36,46},{-30,46}}, color={0,0,127}));
  connect(U, limiterY1.u) annotation (Line(points={{-100,0},{-68,0},{-68,40},{-62,40}}, color={0,0,127}));
  connect(U, limiterY2.u) annotation (Line(points={{-100,0},{-68,0},{-68,-40},{-62,-40}}, color={0,0,127}));
  annotation (Icon(                                             graphics={
                     Rectangle(fillColor = {210, 210, 210}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-102}}),    Rectangle(origin={0,42},    lineColor = {0, 0, 127}, extent = {{-20, 20}, {20, -20}}), Line(origin={0.5315,
              42.8218},                                                                                                                                                                                                        points = {{0, 18}, {0, -18}}, color = {192, 192, 192}, arrow = {Arrow.Filled, Arrow.None}), Line(origin={0.5315,
              42.8218},                                                                                                                                                                                                        points = {{-18, 0}, {18, 0}}, color = {192, 192, 192}, arrow = {Arrow.None, Arrow.Filled}), Line(origin={0.5315,
              42.8218},                                                                                                                                                                                                        points = {{-16, -16}, {-10, -16}, {10, 16}, {16, 16}}), Line(origin={-58,21},    points={{-38,-21},
              {4,-21},{4,19},{38,19}},                                                                                                                                                                                                        color = {0, 0, 127}, arrowSize = 5), Line(origin={54,42},    points={{-34,-2},
              {46,-2}},                                                                                                                                                                                                        color = {0, 0, 127}), Line(origin={-7,-21},    points={{-93,21},
              {-47,21},{-47,-19},{-13,-19}},                                                                                                                                                                                                        color = {0, 0, 127}),
                                                                                                                                                                                                        Line(origin={0.5315,
              -41.1782},                                                                                                                                                                                                        points = {{-16, -16}, {-10, -16}, {10, 16}, {16, 16}}),
                                                                                                                                                                                                        Line(origin={0.5315,
              -39.1782},                                                                                                                                                                                                        points = {{0, 18}, {0, -18}}, color = {192, 192, 192}, arrow = {Arrow.Filled, Arrow.None}), Line(origin={0.5315,
              -41.1782},                                                                                                                                                                                                        points = {{-18, 0}, {18, 0}}, color = {192, 192, 192}, arrow = {Arrow.None, Arrow.Filled}),
                                                                                                                                 Rectangle(origin={0,-40},   lineColor = {0, 0, 127}, extent = {{-20, 20}, {20, -20}}),                                                                                                                                                                                                        Line(origin={54,-38},   points={{-34,-2},
              {46,-2}},                                                                                                                                                                                                        color = {0, 0, 127}),                                                                                                         Text(origin={0,-120},    extent = {{-100, 20}, {100, -20}}, textString = "%name")}),
                                                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end SplitRange;
