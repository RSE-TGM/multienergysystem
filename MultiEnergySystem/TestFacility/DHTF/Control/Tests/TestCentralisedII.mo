within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedII
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9554, 0.0341, 0.0105, 0} "Mass composition";
  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true) annotation (
    Placement(transformation(extent={{-10,10},{10,-10}},      rotation = 180, origin={70,0})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent={{-80,-10},{-60,10}})));
  replaceable DHTF.Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHP openLoopActuatorBase_III annotation (
    Placement(transformation(extent={{-18,42},{18,78}})));
  inner System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
  Networks.Centralised.CentralizedSystem_III plant annotation (Placement(transformation(extent={{-24,-24},{24,24}})));
equation
  connect(sourceVoltage.outlet, plant.electricPortInlet) annotation (Line(
      points={{-60,0},{-24,0}},
      color={56,93,138},
      thickness=1));
  connect(sourceGas.outlet, plant.inletGas) annotation (Line(
      points={{60,6.66134e-16},{42,6.66134e-16},{42,0},{24,0}},
      color={182,109,49},
      thickness=0.5));
  connect(openLoopActuatorBase_III.controlSignalBus, plant.controlSignalBus) annotation (Line(
      points={{0,42},{0,24}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2));
end TestCentralisedII;
