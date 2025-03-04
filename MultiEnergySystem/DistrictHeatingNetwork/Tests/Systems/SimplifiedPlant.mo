within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model SimplifiedPlant
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve valve1 annotation (
    Placement(transformation(extent = {{0.611126, -0.666667}, {-3.05564, 3.33333}}, rotation = -90, origin = {-1.33333, 30.9444})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction annotation (
    Placement(transformation(extent = {{2, -2}, {-2, 2}}, rotation = 180, origin = {0, 26})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction2_1 annotation (
    Placement(transformation(extent = {{2, 36}, {-2, 40}})));
  TestFacility.Plants.Thermal.Systems.GasBoiler S100 annotation (
    Placement(transformation(origin = {0, -9}, extent = {{-70, -50}, {-50, -30}})));
  TestFacility.Plants.Thermal.Systems.CirculationPump S900 annotation (
    Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
  TestFacility.Loads.Thermal.Systems.CoolingSingleLoad load1 annotation (
    Placement(transformation(extent = {{-11.5, -11.5}, {11.5, 11.5}}, rotation = 90, origin = {34.5, 31.5})));
  Modelica.Blocks.Sources.RealExpression realExpression annotation (
    Placement(transformation(extent = {{12, 28}, {5, 36}})));
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceMassFlow(p0 = 250000, T0 = 293.15, m_flow0 = 1.2) annotation (
    Placement(transformation(extent = {{65, 32}, {55, 42}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(p0 = 200000, T0 = 293.15) annotation (
    Placement(transformation(extent = {{56, 22}, {64, 30}})));
  H2GasFacility.Sources.SourcePressure sourceGas(computeEnergyVariables = true, computeTransport = false, redeclare model Medium = Gas, X0 = X_gas, R = 1e-3) annotation (
    Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = -90, origin = {-60, -75})));
  Modelica.Blocks.Sources.RealExpression omegaP901SP(y = if time < 500 then 2*Modelica.Constants.pi*30 else 2*Modelica.Constants.pi*40) annotation (
    Placement(transformation(extent = {{-88, 6}, {-81, 14}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV901SP(y = 1) annotation (
    Placement(transformation(extent = {{-88, -2}, {-81, 6}})));
  Modelica.Blocks.Sources.RealExpression omegaP101SP(y = 2*Modelica.Constants.pi*30) annotation (
    Placement(transformation(origin = {0, -9}, extent = {{-88, -29}, {-81, -21}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV101SP(y = 1) annotation (
    Placement(transformation(origin = {0, -9}, extent = {{-88, -35}, {-81, -27}})));
  Modelica.Blocks.Sources.RealExpression ToutGBSP(y = 80 + 273.15) annotation (
    Placement(transformation(origin = {0, -9}, extent = {{-88, -41}, {-81, -33}})));
  Modelica.Blocks.Sources.BooleanExpression statusGB(y = true) annotation (
    Placement(transformation(origin = {0, -9}, extent = {{-88, -47}, {-81, -39}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV701SP(y = 1) annotation (
    Placement(transformation(extent = {{-3.5, -4}, {3.5, 4}}, rotation = 90, origin = {26.5, 6})));
  inner System system annotation (
    Placement(transformation(extent = {{79, 80}, {99, 100}})));
equation
  connect(S100.inlet, S900.outletcold) annotation (
    Line(points = {{-64, -37.5}, {-64, -20}, {-63.9, -20}, {-63.9, -11.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(S100.outlet, S900.inlethot) annotation (
    Line(points = {{-56, -37.5}, {-56, -21}, {-56.1, -21}, {-56.1, -11.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(S900.outlethot, junction.inlet) annotation (
    Line(points = {{-56.1, 11.5}, {-56.1, 26}, {-2, 26}}, color = {140, 56, 54}, thickness = 0.5));
  connect(junction.outlet, load1.inhot) annotation (
    Line(points = {{2, 26}, {13.175, 26}, {13.175, 25.98}, {21.275, 25.98}}, color = {140, 56, 54}, thickness = 0.5));
  connect(junction.inoutlet, valve1.inlet) annotation (
    Line(points = {{2.498e-16, 28}, {2.498e-16, 29.1666}, {1.5e-06, 29.1666}, {1.5e-06, 30.3333}}, color = {140, 56, 54}, thickness = 0.5));
  connect(valve1.outlet, junction2_1.inoutlet) annotation (
    Line(points = {{1.5e-06, 34}, {1.5e-06, 35}, {0, 35}, {0, 36}}, color = {140, 56, 54}, thickness = 0.5));
  connect(load1.outhot, junction2_1.inlet) annotation (
    Line(points = {{21.275, 37.365}, {20, 37.365}, {20, 38}, {2, 38}}, color = {140, 56, 54}, thickness = 0.5));
  connect(junction2_1.outlet, S900.inletcold) annotation (
    Line(points = {{-2, 38}, {-63.9, 38}, {-63.9, 11.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceMassFlow.outlet, load1.incold) annotation (
    Line(points = {{55, 37}, {51.3625, 37}, {51.3625, 37.135}, {47.725, 37.135}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sinkPressure.inlet, load1.outcold) annotation (
    Line(points = {{56, 26}, {51.8625, 26}, {51.8625, 25.865}, {47.725, 25.865}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceGas.outlet, S100.inletFuel) annotation (
    Line(points = {{-60, -68}, {-60, -61}}, color = {182, 109, 49}, thickness = 0.5));
  connect(realExpression.y, valve1.opening) annotation (
    Line(points = {{4.65, 32}, {3.125, 32}, {3.125, 32.1667}, {1.6, 32.1667}}, color = {0, 0, 127}));
  connect(omegaP901SP.y, S900.omega) annotation (
    Line(points = {{-80.65, 10}, {-75, 10}, {-75, 7}, {-71, 7}}, color = {0, 0, 127}));
  connect(thetaFCV901SP.y, S900.theta) annotation (
    Line(points = {{-80.65, 2}, {-75, 2}, {-75, 5}, {-71, 5}}, color = {0, 0, 127}));
  connect(omegaP101SP.y, S100.omega) annotation (
    Line(points = {{-80.65, -34}, {-74, -34}, {-74, -42}, {-71, -42}}, color = {0, 0, 127}));
  connect(thetaFCV101SP.y, S100.theta) annotation (
    Line(points = {{-80.65, -40}, {-76, -40}, {-76, -44}, {-71, -44}}, color = {0, 0, 127}));
  connect(ToutGBSP.y, S100.Toutset) annotation (
    Line(points = {{-80.65, -46}, {-71, -46}}, color = {0, 0, 127}));
  connect(statusGB.y, S100.status) annotation (
    Line(points = {{-80.65, -52}, {-74, -52}, {-74, -48}, {-71, -48}}, color = {255, 0, 255}));
  connect(thetaFCV701SP.y, load1.theta) annotation (
    Line(points = {{26.5, 9.85}, {26.45, 9.85}, {26.45, 18.85}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1}), graphics = {Line(origin = {-50, -20}, points = {{0, -6}, {0, 6}, {0, 6}}), Text(origin = {-45, -19.5}, extent = {{-3, 2.5}, {3, -2.5}}, textString = "caldo"), Line(origin = {-50.9913, -13.9827}, points = {{0.5, 1}, {-0.5, -1}}), Line(origin = {-49.5, -13.5}, points = {{-0.5, 1.5}, {0.5, -1.5}}), Line(origin = {-41, 23}, points = {{-9, 0}, {9, 0}}), Line(origin = {-32.5, 23.5}, points = {{-1.5, 0.5}, {1.5, -0.5}}), Line(origin = {-33, 22}, points = {{2, 1}, {-2, -1}}), Text(origin = {-39.5, 18.5}, extent = {{-4.5, 1.5}, {4.5, -1.5}}, textString = "caldo"), Line(origin = {8.5, 44}, points = {{10.5, 0}, {-10.5, 0}}), Line(origin = {-1.6, 44.5292}, points = {{1.6, 2.47082}, {-2.4, -0.52918}, {1.6, -2.52918}, {1.6, -2.52918}}), Text(origin = {12.5, 49}, extent = {{-7.5, 2}, {7.5, -2}}, textString = "freddo")}),
    uses(Modelica(version = "4.0.0")),
    experiment(StopTime = 1000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end SimplifiedPlant;
