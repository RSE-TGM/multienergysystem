within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Test "Test with real data"
  extends S900(FCV901_theta(table=[ts,thetav]), P901_omega(table=[ts,omega]),
    FCV901(
      minimumOpening=0.002,
      Kv=Kv,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
    sourceP(use_in_p0=true, use_in_T0=true),
    sinkP(use_in_p0=true));

  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT202" "Matrix name in file";
  parameter String matrixPTo = "PT902" "Matrix name in file";
  parameter String matrixTTi = "TT902" "Matrix name in file";
  parameter String matrixtheta = "theta_FCV901" "Matrix name in file";
  parameter String matrixfreq = "f_P901";
  parameter String matrixFT = "FT901" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 20.5 "Metri Flow Coefficient";
  parameter Integer T_sampling = 1;
  final parameter Real frequency = 1/T_sampling;

  Modelica.Blocks.Sources.TimeTable TT902_profile(table=[ts,TTi]) annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Modelica.Blocks.Sources.TimeTable PT202_profile(table=[ts,PTi]) annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Blocks.Sources.TimeTable PT902_profile(table=[ts,PTo]) annotation (Placement(transformation(extent={{44,30},{24,50}})));
  Modelica.Blocks.Sources.TimeTable qm3h_ref(table=[ts,FT])
    annotation (Placement(transformation(extent={{10,130},{-10,150}})));
  Utilities.ASHRAEIndex indexes annotation (Placement(transformation(extent={{-70,90},{-90,110}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
  final parameter Types.Temperature Tin_start = TTi[1,1];
  final parameter Types.Pressure pin_start = PTi[1,1];
equation
  connect(TT902_profile.y, sourceP.in_T0) annotation (Line(points={{-39,-60},{-34,-60},{-34,-62},{-28,
          -62},{-28,-88},{-5.04,-88},{-5.04,-89.6}}, color={0,0,127}));
  connect(PT202_profile.y, sourceP.in_p0)
    annotation (Line(points={{-39,-90},{-28,-90},{-28,-94.4},{-5.04,-94.4}}, color={0,0,127}));
  connect(PT902_profile.y, sinkP.in_p0)
    annotation (Line(points={{23,40},{18,40},{18,54.96},{17.6,54.96}}, color={0,0,127}));
  connect(qm3h_ref.y, indexes.u_meas)
    annotation (Line(points={{-11,140},{-60,140},{-60,105},{-68,105}}, color={0,0,127}));
  connect(FT901.q_m3hr, indexes.u_sim)
    annotation (Line(points={{-8.5,32},{-60,32},{-60,95},{-68,95}}, color={0,0,127}));
  annotation (experiment(
      StopTime=2600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Test;
