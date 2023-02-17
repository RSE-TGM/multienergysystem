within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PumpTestBase "Base test model for pumps' tests"
  extends Modelica.Icons.Example;
  Components.TurboMachines.Pump pump(
    Tin_start=293.15,
    Tout_start=291.15,
    pin_start=500000,
    pout_start=567600,
    wnom=1.6666,
    phicnom=0.8,
    rhonom(displayUnit="kg/m3") = 997,
    dpnom=66600,
    etamech=1,
    etaelec=1)
    annotation (Placement(transformation(extent={{-16,-20},{18,14}})));
  Sources.SinkPressure sinkPressure(p0=266760)
    annotation (Placement(transformation(extent={{74,10},{94,30}})));
  Sources.SourcePressure sourcePressure(
    p0=200000,
    use_T=true,
    T=298.15)
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  Components.Valves.FlowCoefficientVale valve(dp_nom=2000)
    annotation (Placement(transformation(extent={{28,10},{48,30}})));
  Modelica.Blocks.Sources.RealExpression theta(y=if time < 10 then 1 else 0.5)
    annotation (Placement(transformation(extent={{-8,26},{12,46}})));
  Components.TurboMachines.Pump pump2(
    use_in_omega=true,
    Tin_start=293.15,
    Tout_start=291.15,
    pin_start=500000,
    pout_start=567600,
    wnom=1.6666,
    phicnom=0.8,
    rhonom(displayUnit="kg/m3") = 997,
    dpnom=66600,
    etamech=1,
    etaelec=1)
    annotation (Placement(transformation(extent={{-18,-78},{16,-44}})));
  Components.Valves.FlowCoefficientVale valve1(dp_nom=2000)
    annotation (Placement(transformation(extent={{30,-46},{50,-26}})));
  Modelica.Blocks.Sources.RealExpression omega(y=if time < 20 then 2*3.14159*
        1450/60 else 1.1*2*3.14159*1450/60) "rad/s"
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
equation
  connect(sourcePressure.outlet, pump.inlet) annotation (Line(points={{-44,0},{-28.3,
          0},{-28.3,0.4},{-12.6,0.4}}, color={168,168,168}));
  connect(pump.outlet, valve.inlet) annotation (Line(points={{10.52,10.26},{
          10.52,20},{28,20}}, color={168,168,168}));
  connect(valve.outlet, sinkPressure.inlet)
    annotation (Line(points={{48,20},{74,20}}, color={168,168,168}));
  connect(theta.y, valve.opening)
    annotation (Line(points={{13,36},{38,36},{38,28}}, color={0,0,127}));
  connect(sourcePressure.outlet, pump2.inlet) annotation (Line(points={{-44,0},
          {-30,0},{-30,-57.6},{-14.6,-57.6}}, color={168,168,168}));
  connect(valve1.outlet, sinkPressure.inlet) annotation (Line(points={{50,-36},
          {60,-36},{60,-34},{66,-34},{66,20},{74,20}}, color={168,168,168}));
  connect(pump2.outlet, valve1.inlet) annotation (Line(points={{8.52,-47.74},{
          16,-47.74},{16,-36},{30,-36}}, color={168,168,168}));
  connect(omega.y, pump2.in_omega) annotation (Line(points={{-39,-40},{-7.8,-40},
          {-7.8,-49.1}}, color={0,0,127}));
  connect(theta.y, valve1.opening) annotation (Line(points={{13,36},{20,36},{20,
          -20},{40,-20},{40,-28}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end PumpTestBase;
