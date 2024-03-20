within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
model ASHRAEIndex "Block to compute the ASHRAE indexes CVRMSE and NMBE in validation tests"
  Modelica.Blocks.Interfaces.RealInput u_meas "Input for measured (real) data"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}}), iconTransformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Interfaces.RealInput u_sim "Input for simulated (predicted) data"
    annotation (Placement(transformation(extent={{-140,-70},{-100,-30}}), iconTransformation(extent={{-140,-70},{-100,-30}})));
  Modelica.Blocks.Interfaces.RealOutput NMBE
    annotation (Placement(transformation(extent={{100,30},{120,50}}), iconTransformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput CVRMSE
    annotation (Placement(transformation(extent={{100,-50},{120,-30}}), iconTransformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Math.ContinuousMean cMean_sim "Continuous Mean of simulated data"
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  Modelica.Blocks.Math.Add diff(k2=-1) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.ContinuousMean cMean_diff "Continuous Mean of difference between measured and simulated data"
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Math.Division RMSEovercMean_sim annotation (Placement(transformation(extent={{42,-50},{62,-30}})));
  Modelica.Blocks.Math.MultiProduct product(nu=2) annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Blocks.Math.ContinuousMean cMean_diffsquare "Continuous Mean of square difference between measured and simulated data"
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.Math.Sqrt sqrt annotation (Placement(transformation(extent={{6,-50},{26,-30}})));
  Modelica.Blocks.Math.Division cMean_diffovercMean_sim annotation (Placement(transformation(extent={{42,30},{62,50}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(extent={{72,30},{92,50}})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(extent={{74,-50},{94,-30}})));
  Modelica.Blocks.Sources.Constant const(k=100) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(u_meas, diff.u1) annotation (Line(points={{-120,50},{-92,50},{-92,6},{-82,6}}, color={0,0,127}));
  connect(u_sim, diff.u2) annotation (Line(points={{-120,-50},{-92,-50},{-92,-6},{-82,-6}}, color={0,0,127}));
  connect(diff.y, cMean_diff.u) annotation (Line(points={{-59,0},{-52,0}}, color={0,0,127}));
  connect(diff.y, product.u[1]) annotation (Line(points={{-59,0},{-56,0},{-56,-41.75},{-50,-41.75}}, color={0,0,127}));
  connect(diff.y, product.u[2]) annotation (Line(points={{-59,0},{-56,0},{-56,-38.25},{-50,-38.25}}, color={0,0,127}));
  connect(product.y, cMean_diffsquare.u) annotation (Line(points={{-28.3,-40},{-22,-40}}, color={0,0,127}));
  connect(cMean_diffsquare.y, sqrt.u) annotation (Line(points={{1,-40},{4,-40}}, color={0,0,127}));
  connect(u_sim, cMean_sim.u) annotation (Line(points={{-120,-50},{-92,-50},{-92,-80},{-82,-80}}, color={0,0,127}));
  connect(cMean_sim.y, RMSEovercMean_sim.u2) annotation (Line(points={{-59,-80},{30,-80},{30,-46},{40,-46}}, color={0,0,127}));
  connect(sqrt.y, RMSEovercMean_sim.u1) annotation (Line(points={{27,-40},{28,-40},{28,-34},{40,-34}}, color={0,0,127}));
  connect(cMean_diff.y, cMean_diffovercMean_sim.u1) annotation (Line(points={{-29,0},{28,0},{28,46},{40,46}}, color={0,0,127}));
  connect(cMean_diffovercMean_sim.u2, RMSEovercMean_sim.u2) annotation (Line(points={{40,34},{34,34},{34,-46},{40,-46}}, color={0,0,127}));
  connect(cMean_diffovercMean_sim.y, product1.u1) annotation (Line(points={{63,40},{66,40},{66,46},{70,46}}, color={0,0,127}));
  connect(product1.y, NMBE) annotation (Line(points={{93,40},{110,40}}, color={0,0,127}));
  connect(const.y, product1.u2) annotation (Line(points={{61,0},{66,0},{66,34},{70,34}}, color={0,0,127}));
  connect(product2.u1, product1.u2) annotation (Line(points={{72,-34},{66,-34},{66,34},{70,34}}, color={0,0,127}));
  connect(RMSEovercMean_sim.y, product2.u2) annotation (Line(points={{63,-40},{68,-40},{68,-46},{72,-46}}, color={0,0,127}));
  connect(product2.y, CVRMSE) annotation (Line(points={{95,-40},{110,-40}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,50},{100,-50}},
          textColor={28,108,200},
          textString="Val")}));
end ASHRAEIndex;
