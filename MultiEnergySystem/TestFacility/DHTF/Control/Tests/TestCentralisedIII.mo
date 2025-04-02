within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIII
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9554, 0.0341, 0.0105, 0} "Mass composition";
  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin={36,-54})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
  replaceable DHTF.Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHP_II openLoopActuatorBase_III annotation (
    Placement(transformation(extent={{-18,42},{18,78}})));
  inner System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
  Networks.Centralised.CentralizedSystem_LoadControlled plant(load(
      EX701_TN_wall_start=298.15,
      EX711_TN_wall_start=298.15,
      EX721_TN_wall_start=298.15,
      EX731_TN_wall_start=298.15,
      h_FT701_rackL2L3=-0.85,
      h_FT711_rackL3L4=-1,
      h_FT721_rackL4L5=-1,
      h_FT731_rackL6L7=-1.25,
      h_FTR03_PTR01=0,
      h_PTR01_FTR01=0,
      h_FTR01_RR01=0))                                        annotation (Placement(transformation(extent={{-24,-24},{24,24}})));
equation
  connect(sourceVoltage.outlet, plant.electricPortInlet) annotation (Line(
      points={{-56,0},{-24,0}},
      color={56,93,138},
      thickness=1));
  connect(sourceGas.outlet, plant.inletGas) annotation (Line(
      points={{22,-54},{12,-54},{12,-52},{0,-52},{0,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(openLoopActuatorBase_III.controlSignalBus, plant.controlSignalBus) annotation (Line(
      points={{0,42},{0,24}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(
      StopTime=6000,
      Interval=2,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestCentralisedIII;
