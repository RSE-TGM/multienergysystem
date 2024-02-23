within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.Validation;

model GB101_Seq_0412Test3
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.GasBoilerTest(sourceCH4(use_in_m_flow0 = true), sourceP(use_in_p0 = false, use_in_T0 = true), sinkM(use_in_m_flow = true), sinkrefT(use_in_m_flow = false, use_in_T = true));

  parameter String Data = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
//  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Pressures.mat") "File name of matrix" annotation (
//    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
//  parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Flow.mat") "File name of matrix" annotation (
//    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
//  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Actuators.mat") "File name of matrix" annotation (
//    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;
  parameter Types.Density rhohotref = 985;
  parameter Types.Density rhocoldref = 999;
  parameter String matrixTT101 = "TT101" "Matrix name in file";
  parameter String matrixTT102 = "TT102" "Matrix name in file";
  parameter String matrixTT801 = "TT801" "Matrix name in file";  
  parameter String matrixFT101 = "FT101" "Matrix name in file";
  parameter String matrixFT801 = "FT801" "Matrix name in file";
  parameter String matrixPT101 = "PT101" "Matrix name in file";
  parameter String matrixPT102 = "PT102" "Matrix name in file";  
  parameter String matrixthetaFCV101 = "theta_FCV101" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";


  Modelica.Blocks.Sources.TimeTable incold_T(table = [t, TT101]) annotation(
    Placement(transformation(origin = {40, 20}, extent = {{-100, 0}, {-80, 20}})));
  Modelica.Blocks.Sources.TimeTable fuel_m_flow(table = [t, m_flow801]) annotation(
    Placement(transformation(origin = {0, 50}, extent = {{-100, -30}, {-80, -10}})));
  Modelica.Blocks.Sources.TimeTable m_flow(table = [t, m_flow101])  annotation(
    Placement(transformation(origin = {-40, 50}, extent = {{100, -30}, {80, -10}}, rotation = -0)));
  Modelica.Blocks.Sources.TimeTable TT102_ref(table = [t, TT102])  annotation(
    Placement(transformation(origin = {-30, 90}, extent = {{100, -30}, {80, -10}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Data, matrixTT101) "dimension of matrix";
  final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Data, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real TT101[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT101, dim[1], dim[2]);
  final parameter Real TT102[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT102, dim[1], dim[2]);
  final parameter Real TT801[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT801, dim[1], dim[2]);
  final parameter Real FT101[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT101, dim[1], dim[2]);
  final parameter Real FT801[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT801, dim[1], dim[2]);
  final parameter Real PT101[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT101, dim[1], dim[2]);
  final parameter Real PT102[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT102, dim[1], dim[2]);  
  final parameter Real m_flow101[dim[1], dim[2]] = FT101*rhohotref*CorrectFactorHot/3600;
  final parameter Real m_flow801[dim[1], dim[2]] = FT801;
equation
  connect(incold_T.y, sourceP.in_T0) annotation(
    Line(points = {{-38, 30}, {-32, 30}, {-32, 52}}, color = {0, 0, 127}));
  connect(fuel_m_flow.y, sourceCH4.in_m_flow0) annotation(
    Line(points = {{-78, 30}, {-76, 30}, {-76, 6}}, color = {0, 0, 127}));
  connect(m_flow.y, sinkM.in_m_flow) annotation(
    Line(points = {{40, 30}, {22, 30}, {22, 54}}, color = {0, 0, 127}));
  connect(TT102_ref.y, sinkrefT.in_T) annotation(
    Line(points = {{50, 70}, {30, 70}, {30, 78}}, color = {0, 0, 127}));
end GB101_Seq_0412Test3;
