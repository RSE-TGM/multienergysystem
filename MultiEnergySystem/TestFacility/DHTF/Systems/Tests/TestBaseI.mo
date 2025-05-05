within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseI
  constant Real pi = Modelica.Constants.pi;
    replaceable model Gas = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 1 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {1} "Mass composition";

  replaceable HeatGeneration.CentralizedThreeGenGBEBCHP heatGen(
    redeclare model Gas = Gas, X_gas=X_gas,
    pin_start_S100=200000,
    pin_start_S400=200000)     annotation (Placement(transformation(extent={{-60,-28},{-8,24}})));
  replaceable Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHP_II actuator(
    domegaP501_var(y=2*pi*30),
    bool_omegaP901(y=false),
    bool_domegaP401(y=false),
    domegaP401(table=[0,2*pi*30; 250,2*pi*30; 500, 2*pi*30; 1e3, 2*pi*30]),
    bool_omegaP101(y=false),
    omegaP101(table=[0,2*pi*30; 1e3,2*pi*30]))
                              annotation (Placement(transformation(extent={{-56,48},{-10,94}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent={{-88,-10},{-68,10}})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true,
    computeTransport=false)                                                                                                                                   annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin={-8,-64})));
  DistrictHeatingNetwork.Sources.SourcePressure sourcePressure(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 65 + 273.15,
    R=1e-3)                                                    annotation (Placement(transformation(extent={{30,4},{10,24}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(
    use_in_p0=true,
    p0(displayUnit="Pa") = 2.2e5,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-3)                                                annotation (Placement(transformation(extent={{12,-28},{32,-8}})));
  inner System system annotation (Placement(transformation(extent={{74,76},{94,96}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
    pin_start(displayUnit="Pa") = 3e5,
    p0(displayUnit="Pa") = 3e5,
    T0(displayUnit="K") = 65 + 273.15,
    m_flow0=4,
    G=1e-6) annotation (Placement(transformation(extent={{38,-48},{58,-28}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-0.5e5,
    duration=400,
    offset=2.2e5,
    startTime=300) annotation (Placement(transformation(extent={{84,-26},{64,-6}})));
equation
  connect(actuator.controlSignalBus, heatGen.controlSignalBus) annotation (Line(
      points={{-33,48},{-33,32},{-34,32},{-34,24}},
      color={255,204,51},
      thickness=0.5));
  connect(sourceVoltage.outlet, heatGen.electricPortInlet) annotation (Line(
      points={{-68,0},{-68,-2},{-60,-2}},
      color={56,93,138},
      thickness=1));
  connect(sourceGas.outlet, heatGen.inletGas) annotation (Line(
      points={{-22,-64},{-28,-64},{-28,-58},{-34,-58},{-34,-28}},
      color={182,109,49},
      thickness=0.5));
  connect(sourcePressure.outlet, heatGen.returncold) annotation (Line(
      points={{10,14},{10,13.6},{-8,13.6}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, heatGen.senthot) annotation (Line(
      points={{12,-18},{2,-18},{2,-17.6},{-8,-17.6}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp.y, sinkPressure.in_p0) annotation (Line(points={{63,-16},{50,-16},{50,-2},{18,-2},{18,-9.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestBaseI;
