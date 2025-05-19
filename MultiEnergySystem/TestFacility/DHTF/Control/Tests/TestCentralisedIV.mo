within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIV
  extends Modelica.Icons.Example;
  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 1 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {1} "Mass composition";


  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true, computeTransport = false) annotation (
    Placement(transformation(extent={{-10,-10},{10,10}},      rotation = 180, origin={60,0})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
  replaceable DHTF.Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHPTES actuator annotation (Placement(transformation(extent={{-18,42},{18,78}})));
  inner System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
  replaceable Networks.Centralised.LoadControl.CentralSystemLoadControl_IV plant annotation (Placement(transformation(extent={{-24,-24},{24,24}})));
equation
  connect(sourceVoltage.outlet, plant.electricPortInlet) annotation (Line(
      points={{-56,0},{-24,0}},
      color={56,93,138},
      thickness=1));
  connect(sourceGas.outlet, plant.inletGas) annotation (Line(
      points={{50,6.66134e-16},{35,6.66134e-16},{35,0},{24,0}},
      color={182,109,49},
      thickness=0.5));
  connect(actuator.controlSignalBus, plant.controlSignalBus) annotation (Line(
      points={{0,42},{0,24}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(
      StopTime= 86400,
      Interval=17.28,
      Tolerance=1e-06, StartTime = 0));
end TestCentralisedIV;
