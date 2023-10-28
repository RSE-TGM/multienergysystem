within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystem "Case in which the gas boiler is the only source of heat"
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.GasBoiler
    gasBoiler annotation (Placement(transformation(
        extent={{-25,-25},{25,25}},
        rotation=-90,
        origin={-230,-95})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P101 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-220,-21})));
  Sources.SourceMassFlow CH4(
    T0=60 + 273.15,
    m_flow0=0.002370206,
    p0(displayUnit="Pa") = 2000,
    use_in_m_flow=true)                                                                                                    annotation (
    Placement(visible = true, transformation(origin={-200,-144}, extent = {{-10, -10}, {10, 10}}, rotation=90)));
  Modelica.Blocks.Sources.Ramp fuel_flow(
    duration=20,
    height=0.002370206*0.05*0,
    offset=0.002370206,
    startTime=50)                                                                                                       annotation (
    Placement(visible = true, transformation(origin={-230,-150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    flowCoefficientVale annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,-54})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-240,-54})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV2 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV3 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV4 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-200,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P901 annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-169,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    flowCoefficientVale1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-140,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV5 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-110,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
    roundPipe1DFV6 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-80,90})));
equation
  connect(roundPipe1DFV.inlet, gasBoiler.outlet) annotation (Line(
      points={{-220,-64},{-220,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV1.outlet, gasBoiler.inlet) annotation (Line(
      points={{-240,-64},{-240,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(P101.inlet, roundPipe1DFV.outlet) annotation (Line(
      points={{-220,-30.6},{-220,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(flowCoefficientVale.inlet, P101.outlet) annotation (Line(
      points={{-220,0},{-220,-11.4}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV2.inlet, flowCoefficientVale.outlet) annotation (Line(
      points={{-220,30},{-220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(fuel_flow.y, CH4.in_m_flow)
    annotation (Line(points={{-219,-150},{-205,-150}}, color={0,0,127}));
  connect(CH4.outlet, gasBoiler.inletfuel) annotation (Line(
      points={{-200,-134},{-200,-95},{-210,-95}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.inlet, roundPipe1DFV2.outlet) annotation (Line(
      points={{-220,60},{-220,50}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.outlet, roundPipe1DFV4.inlet) annotation (Line(
      points={{-220,80},{-220,90},{-210,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV4.outlet, P901.inlet) annotation (Line(
      points={{-190,90},{-178.6,90}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.outlet, flowCoefficientVale1.inlet) annotation (Line(
      points={{-159.4,90},{-150,90}},
      color={140,56,54},
      thickness=0.5));
  connect(flowCoefficientVale1.outlet, roundPipe1DFV5.inlet) annotation (Line(
      points={{-130,90},{-120,90}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet, roundPipe1DFV6.inlet) annotation (Line(
      points={{-100,90},{-90,90}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-400,-160},{400,160}}, grid={1,1})), Icon(
        coordinateSystem(extent={{-400,-160},{400,160}}, grid={1,1})));
end GasBoilerSystem;
