within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;

partial model TestBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";  
  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter Types.Length L = 1 "Length of the tube";
  parameter Types.Length h = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight";
  parameter Types.Length t = 0.003 "Thickness of the tube";
  parameter Types.Length Di = 51e-3 "Internal Diameter of a single tube";
  parameter Types.Pressure pmax = 6e5 "Maximum pressure that the component can support";
  parameter Types.Length tIns = 0.15 "Insulation thickness";
  parameter Types.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material";
  
  
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT702" "Matrix name in file";
  parameter String matrixPTo = "PT701" "Matrix name in file";
  parameter String matrixTTi = "TT701" "Matrix name in file"; 
  parameter String matrixtheta = "theta_FCV701" "Matrix name in file";
  parameter String matrixFT = "FT701" "Matrix name in file";   
  parameter String timenoscale = "time" "Matrix name in file";


  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = Valve.TCV701.Tin_start, p0 = Valve.TCV701.pin_start, use_in_p0 = true, use_in_T0 = true) annotation(
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(redeclare model Medium = Medium, Kv = Valve.FCV701.Kv, Tin_start = Valve.FCV701.Tin_start, dp_nom = Valve.FCV701.dp_nom, pin_start = Valve.FCV701.pin_start, rho_nom = Valve.FCV701.rho_nom, q_m3h_start = Valve.FCV701.q_nom_m3h, rho_start = Valve.FCV701.rho_nom, openingChar =    MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic) annotation(
    Placement(transformation(extent = {{-8, -8}, {8, 8}})));
  DistrictHeatingNetwork.Components.Pipes.HydraulicDiameter pipe(L = L, h = h, t = t, pmax = pmax, Di = Di, tIns = tIns, lambdaIns = lambdaIns, pin_start = pin_start, Tin_start = Tin_start, T_start = Tin_start)  annotation(
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  Sources.SinkPressure sinkP(redeclare model Medium = Medium, use_in_p0 = true)  annotation(
    Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable inp(table = [ts, PTi])  annotation(
    Placement(transformation(origin = {-88, 20}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable outp(table = [ts, PTo])  annotation(
    Placement(transformation(origin = {60, 20}, extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Sources.TimeTable theta(table = [ts, thetav])  annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable inT(table = [ts, TTi])  annotation(
    Placement(transformation(origin = {-88, 32}, extent = {{-4, -4}, {4, 4}})));
  inner System system annotation(
    Placement(transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable qm3h_ref(table = [ts, FT]) annotation(
    Placement(transformation(origin = {-90, 10}, extent = {{100, 70}, {80, 90}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Types.Temperature Tin_start = TTi[1,1];
  final parameter Types.Pressure pin_start = PTi[1,1];
equation
  connect(sinkP.inlet, cvalve.outlet) annotation(
    Line(points = {{30, 0}, {8, 0}}, color = {140, 56, 54}));
  connect(inp.y, sourceP.in_p0) annotation(
    Line(points = {{-83.6, 20}, {-73.6, 20}, {-73.6, 8}}, color = {0, 0, 127}));
  connect(outp.y, sinkP.in_p0) annotation(
    Line(points = {{56, 20}, {36, 20}, {36, 8}}, color = {0, 0, 127}));
  connect(theta.y, cvalve.opening) annotation(
    Line(points = {{-6, 20}, {0, 20}, {0, 6}}, color = {0, 0, 127}));
  connect(inT.y, sourceP.in_T0) annotation(
    Line(points = {{-83.6, 32}, {-65.6, 32}, {-65.6, 8}}, color = {0, 0, 127}));
  connect(pipe.inlet, sourceP.outlet) annotation(
    Line(points = {{-40, 0}, {-60, 0}}, color = {140, 56, 54}));
  connect(pipe.outlet, cvalve.inlet) annotation(
    Line(points = {{-20, 0}, {-8, 0}}, color = {140, 56, 54}));
end TestBase;
