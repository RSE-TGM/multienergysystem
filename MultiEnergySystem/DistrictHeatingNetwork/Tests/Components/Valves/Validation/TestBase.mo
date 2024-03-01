within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;

partial model TestBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";  
  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT702" "Matrix name in file";
  parameter String matrixPTo = "PT701" "Matrix name in file";
  parameter String matrixTTi = "TT701" "Matrix name in file"; 
  parameter String matrixtheta = "theta_FCV701" "Matrix name in file";
  parameter String matrixFT = "FT701" "Matrix name in file";   
  parameter String timenoscale = "time" "Matrix name in file";


  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = Valve.TCV701.Tin_start, p0 = Valve.TCV701.pin_start, use_in_p0 = true, use_in_T0 = true) annotation(
    Placement(transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(redeclare model Medium = Medium, Kv = Valve.FCV701.Kv, Tin_start = Valve.FCV701.Tin_start, dp_nom = Valve.FCV701.dp_nom, pin_start = Valve.FCV701.pin_start, rho_nom = Valve.FCV701.rho_nom, q_m3h_start = Valve.FCV701.q_nom_m3h, rho_start = Valve.FCV701.rho_nom, openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic) annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}})));
  Sources.SinkPressure sinkP(redeclare model Medium = Medium, use_in_p0 = true)  annotation(
    Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable inp(table = [t, PTi])  annotation(
    Placement(transformation(origin = {-60, 20}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable outp(table = [t, PTo])  annotation(
    Placement(transformation(origin = {60, 20}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Sources.TimeTable theta(table = [t, thetav])  annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable inT(table = [t, TTi])  annotation(
    Placement(transformation(origin = {-60, 32}, extent = {{-4, -4}, {4, 4}})));
  inner System system annotation(
    Placement(transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2])*1e5;
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2])*1e5;
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
equation
  connect(sourceP.outlet, cvalve.inlet) annotation(
    Line(points = {{-32, 0}, {-8, 0}}, color = {140, 56, 54}));
  connect(sinkP.inlet, cvalve.outlet) annotation(
    Line(points = {{30, 0}, {8, 0}}, color = {140, 56, 54}));
  connect(inp.y, sourceP.in_p0) annotation(
    Line(points = {{-56, 20}, {-46, 20}, {-46, 8}}, color = {0, 0, 127}));
  connect(outp.y, sinkP.in_p0) annotation(
    Line(points = {{56, 20}, {36, 20}, {36, 8}}, color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation(
    Line(points = {{-6, 20}, {0, 20}, {0, 6}}, color = {0, 0, 127}));
  connect(inT.y, sourceP.in_T0) annotation(
    Line(points = {{-56, 32}, {-38, 32}, {-38, 8}}, color = {0, 0, 127}));
end TestBase;
