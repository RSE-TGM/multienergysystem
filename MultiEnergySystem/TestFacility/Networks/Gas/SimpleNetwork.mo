within MultiEnergySystem.TestFacility.Networks.Gas;
model SimpleNetwork "Gas network as basic example"
  H2GasFacility.Components.Pipes.Round1DFV pipe1(L=1, Di=1e-3) "pipe1"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  H2GasFacility.Components.Pipes.Round1DFV pipe2(L=1, Di=1e-3) "pipe1" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,20})));
  H2GasFacility.Sources.SourcePressure sourceCH4
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  H2GasFacility.Components.Valves.ValveLinearOpening valve1
    annotation (Placement(transformation(extent={{-64,-4},{-56,4}})));
  H2GasFacility.Components.Valves.ValveLinearOpening valve2
    annotation (Placement(transformation(extent={{16,36},{24,44}})));
  H2GasFacility.Components.Valves.ValveLinearOpening valve3
    annotation (Placement(transformation(extent={{16,-4},{24,4}})));
  H2GasFacility.Sources.SourcePressure sourceH2
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  H2GasFacility.Components.Valves.ValveLinearOpening valve4 annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={40,-40})));
  H2GasFacility.Components.Pipes.Round1DFV pipe3(L=1, Di=1e-3) "pipe1" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,20})));
  H2GasFacility.Sources.SinkMassFlow sinkMix2
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  H2GasFacility.Components.Valves.ValveLinearOpening valve5 annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={60,-40})));
  H2GasFacility.Sources.SinkMassFlow sinkMix1
    annotation (Placement(transformation(extent={{70,30},{90,50}})));
  inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.Ramp thetaV1(
    height=0,
    duration=0,
    offset=1) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  Modelica.Blocks.Sources.Ramp thetaV2(
    height=0,
    duration=0,
    offset=1) annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Sources.Ramp thetaV3(
    height=0,
    duration=0,
    offset=0.5) annotation (Placement(transformation(extent={{50,10},{30,30}})));
  Modelica.Blocks.Sources.Ramp thetaV4(
    height=0,
    duration=0,
    offset=0) annotation (Placement(transformation(extent={{10,-50},{30,-30}})));
  Modelica.Blocks.Sources.Ramp thetaV5(
    height=0,
    duration=0,
    offset=0) annotation (Placement(transformation(extent={{90,-50},{70,-30}})));
equation
  connect(sourceCH4.outlet, valve1.inlet)
    annotation (Line(
      points={{-70,0},{-64,0}},
      color={182,109,49},
      thickness=0.5));
  connect(valve1.outlet, pipe1.inlet) annotation (Line(
      points={{-56,0},{-40,0}},
      color={182,109,49},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(pipe1.outlet, pipe2.inlet) annotation (Line(
      points={{-20,0},{0,0},{0,10}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe2.outlet, valve2.inlet) annotation (Line(
      points={{0,30},{0,40},{16,40}},
      color={182,109,49},
      thickness=0.5));
  connect(valve3.inlet, pipe2.inlet) annotation (Line(
      points={{16,0},{0,0},{0,10},{-5.55112e-16,10}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceH2.outlet, valve4.inlet) annotation (Line(
      points={{10,-60},{40,-60},{40,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(valve4.outlet, valve3.outlet) annotation (Line(
      points={{40,-36},{40,0},{24,0}},
      color={182,109,49},
      thickness=0.5));
  connect(sinkMix2.inlet, valve3.outlet)
    annotation (Line(
      points={{70,0},{24,0}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe3.inlet, valve5.outlet)
    annotation (Line(
      points={{60,10},{60,-36}},
      color={182,109,49},
      thickness=0.5));
  connect(valve5.inlet, valve4.inlet) annotation (Line(
      points={{60,-44},{60,-60},{40,-60},{40,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(valve2.outlet, pipe3.outlet) annotation (Line(
      points={{24,40},{60,40},{60,30}},
      color={182,109,49},
      thickness=0.5));
  connect(sinkMix1.inlet, pipe3.outlet) annotation (Line(
      points={{70,40},{60,40},{60,30}},
      color={182,109,49},
      thickness=0.5));
  connect(thetaV1.y, valve1.opening)
    annotation (Line(points={{-69,30},{-60,30},{-60,3.2}}, color={0,0,127}));
  connect(thetaV2.y, valve2.opening)
    annotation (Line(points={{11,60},{20,60},{20,43.2}}, color={0,0,127}));
  connect(thetaV3.y, valve3.opening)
    annotation (Line(points={{29,20},{20,20},{20,3.2}}, color={0,0,127}));
  connect(thetaV4.y, valve4.opening)
    annotation (Line(points={{31,-40},{36.8,-40}}, color={0,0,127}));
  connect(thetaV5.y, valve5.opening)
    annotation (Line(points={{69,-40},{63.2,-40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false), graphics={Line(
          points={{-50,-22},{0,-36},{-38,-24},{2,-38},{-22,-28}},
          color={255,255,255},
          thickness=1,
          smooth=Smooth.Bezier)}));
end SimpleNetwork;
