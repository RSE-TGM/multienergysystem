within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.RR00;
model RR01_Test "Test using real data"
  extends ChillerOpenLoop(PTR01_TimeTable(table=[ts,PTi]), PTR02_TimeTable(table=[ts,PTo]),
    TTR01_TimeTable(table=[ts,TTi]), Tin_start_Cool = TTi[1,1],
    RR01(
      Tin_cold_start=TTi[1, 1],
      Tout_cold_nom=TTo[1, 1],
      pin_cold_start=PTi[1, 1],
      initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState));

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

  Utilities.ASHRAEIndex val_Q annotation (Placement(transformation(extent={{88,54},{100,66}})));
  Modelica.Blocks.Sources.TimeTable PTR02_TimeTable1(table=[ts,FT])  annotation (Placement(transformation(extent={{51,88},{71,108}})));
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

equation
  connect(val_Q.u_sim, FTR01_.numberPort) annotation (Line(points={{86.8,57},{86.8,58},{69.925,58},{69.925,34.5}}, color={0,0,127}));
  connect(PTR02_TimeTable1.y, val_Q.u_meas) annotation (Line(points={{72,98},{76,98},{76,66},{86.8,66},{86.8,63}}, color={0,0,127}));
end RR01_Test;
