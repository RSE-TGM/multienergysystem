within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralised
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9554, 0.0341, 0.0105, 0} "Mass composition";
  replaceable MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.CentralisedSystem_GBEBCHPTES_III centralisedSystem_GBEBCHPTES_III annotation (
    Placement(transformation(extent = {{-28, -28}, {28, 28}})));
  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin = {60, 0})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
  replaceable DHTF.Control.OpenLoopActuators.OLA_ThreeGenTES_Case_A_III openLoopActuatorBase_III annotation (
    Placement(transformation(extent = {{4, 68}, {24, 88}})));
  inner MultiEnergySystem.System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
equation
  connect(sourceGas.outlet, centralisedSystem_GBEBCHPTES_III.inletGas) annotation (
    Line(points = {{46, 3.55271e-15}, {30.8, 3.55271e-15}}, color = {182, 109, 49}, thickness = 0.5));
  connect(sourceVoltage.outlet, centralisedSystem_GBEBCHPTES_III.electricPortInlet) annotation (
    Line(points = {{-56, 0}, {-42, 0}, {-42, 11.2}, {-30.8, 11.2}}, color = {56, 93, 138}, thickness = 1));
  connect(openLoopActuatorBase_III.controlSignalBus, centralisedSystem_GBEBCHPTES_III.controlSignalBus) annotation (
    Line(points = {{23.4, 78}, {38, 78}, {38, 42}, {-0.56, 42}, {-0.56, 28}}, color = {255, 204, 51}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2));
end TestCentralised;
