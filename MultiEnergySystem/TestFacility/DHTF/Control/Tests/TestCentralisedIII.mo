within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIII
  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  constant Real pi = Modelica.Constants.pi;
  parameter Integer nX = 1 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {1} "Mass composition";

  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true, computeTransport = false) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin={58,0})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-76, -10}, {-56, 10}})));
  replaceable DHTF.Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHP_II openLoopActuatorBase_III(
    bool_omegaP101(y=false),
    omegaP101(table=[0,2*pi*30; 1e3,2*pi*30]),
    PtEX7X1SP(table=[0,20000,30000,30000,30000; 3600,20000,30000,30000,30000; 7200,20000,30000,30000,30000; 10800,30000,30000,35000,35000; 14400,36000,36000,40000,40000; 18000,40000,40000,42000,42000; 21600,38000,38000,38000,38000; 25200,35000,35000,35000,35000; 28800,30000,30000,25000,25000; 32400,30000,30000,25000,25000; 36000,30000,30000,25000,25000; 39600,30000,30000,25000,25000; 43200,30000,30000,
          25000,25000; 46800,30000,30000,28000,28000; 50400,30000,30000,35000,35000; 54000,30000,30000,35000,35000; 57600,30000,30000,35000,35000; 61200,30000,30000,35000,35000; 64800,30000,30000,35000,35000; 68400,30000,30000,35000,35000; 72000,30000,
          30000,35000,35000; 75600,30000,30000,35000,35000; 79200,30000,30000,35000,35000; 82800,30000,30000,35000,35000; 86400,30000,30000,35000,35000])) annotation (Placement(transformation(extent={{-18,42},{18,78}})));

  inner System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
  Networks.Centralised.CentralizedSystem_LoadControlled plant    annotation (Placement(transformation(extent={{-24,-24},{24,24}})));
equation
  connect(sourceVoltage.outlet, plant.electricPortInlet) annotation (Line(
      points={{-56,0},{-24,0}},
      color={56,93,138},
      thickness=1));
  connect(sourceGas.outlet, plant.inletGas) annotation (Line(
      points={{44,3.55271e-15},{34,3.55271e-15},{34,0},{24,0}},
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
      StopTime= 86400,
      Interval= 5.76,
      Tolerance=1e-06, StartTime = 0));
end TestCentralisedIII;
