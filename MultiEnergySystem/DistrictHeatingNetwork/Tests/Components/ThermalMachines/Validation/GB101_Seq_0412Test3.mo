within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.Validation;
model GB101_Seq_0412Test3
  extends MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.GasBoilerTest(sourceCH4(computeEnergyVariables=true,
                                                                                                            use_in_m_flow0 = true), sourceP(use_in_p0 = false, use_in_T0 = true), sinkM(use_in_m_flow = true),
    boiler(
      Tout_start=TT102[1, 1],
           Pmaxnom=147.6e3,
      etanom=etaboiler,
           convf=convf));

  parameter String Data = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;
  parameter Types.Density rhohotref = 985;
  parameter Types.Density rhocoldref = 999;
  parameter Types.PerUnit etaboiler = 1.02;
  parameter String matrixTT101 = "TT101" "Matrix name in file";
  parameter String matrixTT102 = "TT102" "Matrix name in file";
  parameter String matrixTT801 = "TT801" "Matrix name in file";
  parameter String matrixFT101 = "FT101" "Matrix name in file";
  parameter String matrixFT801 = "FT801" "Matrix name in file";
  parameter String matrixPT101 = "PT101" "Matrix name in file";
  parameter String matrixPT102 = "PT102" "Matrix name in file";
  parameter String matrixthetaFCV101 = "theta_FCV101" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real convf = 275 "experimental conversion factor";

  Types.Temperature Tout_ref;


  Modelica.Blocks.Sources.TimeTable incold_T(table = [t, TT101]) annotation (
    Placement(transformation(origin={13.9997,12.6667},
                                                extent={{-59.9996,1.33333},{-47.9996,13.3333}})));
  Modelica.Blocks.Sources.TimeTable fuel_m_flow(table = [t, m_flow801]) annotation (
    Placement(transformation(origin={-16,32},  extent={{-60,-18},{-48,-6}})));
  Modelica.Blocks.Sources.TimeTable m_flow(table = [t, m_flow101])  annotation (
    Placement(transformation(origin={-14,32},    extent={{60,-18},{48,-6}},        rotation = -0)));
  Modelica.Blocks.Sources.TimeTable Toutref(table=[t,TT102])
    annotation (Placement(transformation(extent={{10,84},{0,94}})));
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
  final parameter Real m_flow801[dim[1], dim[2]] = FT801/3600;
equation
  Tout_ref = Toutref.y;
  connect(fuel_m_flow.y, sourceCH4.in_m_flow0)    annotation (Line(points={{-63.4,20},{-56,20},{-56,5}}, color={0,0,127}));
  connect(m_flow.y, sinkM.in_m_flow)    annotation (Line(points={{33.4,20},{24.8,20},{24.8,34}}, color={0,0,127}));
  connect(incold_T.y, sourceP.in_T0)    annotation (Line(points={{-33.3999,20},{-26,20},{-26,31.6}}, color={0,0,127}));
  annotation (
    experiment(StartTime = 0, StopTime = 9000, Tolerance = 1e-6, Interval = 18));
end GB101_Seq_0412Test3;
