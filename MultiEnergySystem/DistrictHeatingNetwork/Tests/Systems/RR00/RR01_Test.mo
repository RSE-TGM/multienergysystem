within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Test "Test using real data"
  extends CoolingSystemOpenLoop(PTR01_TimeTable(table=[ts,PTi]), PTR02_TimeTable(table=[ts,PTo]),
    TTR01_TimeTable(table=[ts,TTi]));

  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));


  parameter String matrixPTi = "PTR01" "Matrix name in file";
  parameter String matrixPTo = "PTR02" "Matrix name in file";
  parameter String matrixTTi = "TTR01" "Matrix name in file";
  parameter String matrixTTo = "TTR02" "Matrix name in file";
  parameter String matrixtheta = "theta_FCVR01" "Matrix name in file";
  parameter String matrixfreq = "f_PR01";
  parameter String matrixFT = "FTR01" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 20.5 "Metri Flow Coefficient";

protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real TTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo, dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
  final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1,1];
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1,1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1,1];

end RR01_Test;
