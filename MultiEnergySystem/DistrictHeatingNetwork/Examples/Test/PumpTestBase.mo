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
    annotation (Placement(transformation(extent={{-18,-20},{16,14}})));
  Sources.SinkPressure sinkP(p0=205000)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  Sources.SourcePressure sourceP(
    p0=200000,
    use_T=true,
    T=298.15)
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  Components.Valves.FlowCoefficientVale valve(dp_nom=2000)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Modelica.Blocks.Sources.RealExpression theta(y=if time < 10 then 1 else 0.5)
    annotation (Placement(transformation(extent={{-62,24},{-42,44}})));
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
    annotation (Placement(transformation(extent={{-16,-80},{18,-46}})));
  Components.Valves.FlowCoefficientVale valve2(dp_nom=2000)
    annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
  Modelica.Blocks.Sources.RealExpression omega(y=if time < 20 then 2*3.14159*
        1450/60 else 1.1*2*3.14159*1450/60) "rad/s"
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Components.TurboMachines.Pump pump3(
    use_in_omega=false,
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
    annotation (Placement(transformation(extent={{-16,50},{18,84}})));
  Components.Valves.FlowCoefficientVale valve3(dp_nom=2000)
    annotation (Placement(transformation(extent={{24,70},{44,90}})));
  Modelica.Blocks.Sources.Ramp thetavalve3(
    height=-0.75,
    duration=10,
    offset=1,
    startTime=30)
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
equation
  connect(sourceP.outlet, pump.inlet) annotation (Line(points={{-44,0},{-28.3,0},
          {-28.3,0.4},{-14.6,0.4}}, color={168,168,168}));
  connect(pump.outlet, valve.inlet) annotation (Line(points={{8.52,10.26},{8.52,
          20},{30,20}},       color={168,168,168}));
  connect(valve.outlet, sinkP.inlet) annotation (Line(points={{50,20},{66,20},{
          66,0},{72,0}}, color={168,168,168}));
  connect(theta.y, valve.opening)
    annotation (Line(points={{-41,34},{40,34},{40,28}},color={0,0,127}));
  connect(sourceP.outlet, pump2.inlet) annotation (Line(points={{-44,0},{-30,0},
          {-30,-59.6},{-12.6,-59.6}}, color={168,168,168}));
  connect(valve2.outlet, sinkP.inlet) annotation (Line(points={{50,-40},{66,-40},
          {66,0},{72,0}}, color={168,168,168}));
  connect(pump2.outlet,valve2. inlet) annotation (Line(points={{10.52,-49.74},{
          16,-49.74},{16,-40},{30,-40}}, color={168,168,168}));
  connect(theta.y,valve2. opening) annotation (Line(points={{-41,34},{20,34},{
          20,-20},{40,-20},{40,-32}},
                                   color={0,0,127}));
  connect(sourceP.outlet, pump3.inlet) annotation (Line(points={{-44,0},{-30,0},
          {-30,70.4},{-12.6,70.4}}, color={168,168,168}));
  connect(pump3.outlet, valve3.inlet) annotation (Line(points={{10.52,80.26},{
          17.26,80.26},{17.26,80},{24,80}}, color={168,168,168}));
  connect(valve3.outlet, sinkP.inlet) annotation (Line(points={{44,80},{66,80},
          {66,0},{72,0}}, color={168,168,168}));
  connect(thetavalve3.y, valve3.opening) annotation (Line(points={{-39,90},{-2,
          90},{-2,96},{34,96},{34,88}}, color={0,0,127}));
  connect(omega.y, pump2.in_omega) annotation (Line(points={{-39,-40},{-5.8,-40},
          {-5.8,-51.1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end PumpTestBase;
