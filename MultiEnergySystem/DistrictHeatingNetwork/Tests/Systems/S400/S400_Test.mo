within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Test
  extends S400(
    FCV401(
      Kv=Kv,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot,
      dp_nom=Valve.FCV401.dp_nom),
    source(use_in_p0=true, use_in_T0=true),
    FCV401_theta(table=[ts,thetav]),
    P401_omega(table=[ts,omega]),
    sinkP(use_in_p0=true),
    P401(correctionfactor=pumpcorrectionFactor));

  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT401" "Matrix name in file";
  parameter String matrixPTo = "PT402" "Matrix name in file";
  parameter String matrixTTi = "TT401" "Matrix name in file";
  parameter String matrixTTo = "TT402" "Matrix name in file";
  parameter String matrixtheta = "theta_FCV401" "Matrix name in file";
  parameter String matrixfreq = "f_P401";
  parameter String matrixFT = "FT401" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 21 "Metri Flow Coefficient";
  parameter Real pumpcorrectionFactor = 1;

  Modelica.Blocks.Sources.TimeTable TT401_profile(table=[ts,TTi]) annotation (Placement(transformation(extent={{-108,72},{-88,92}})));
  Modelica.Blocks.Sources.TimeTable PT401_profile(table=[ts,PTi]) annotation (Placement(transformation(extent={{-106,102},{-86,122}})));
  Modelica.Blocks.Sources.TimeTable PT402_profile(table=[ts,PTo]) annotation (Placement(transformation(extent={{72,84},{52,104}})));

  Modelica.Blocks.Sources.TimeTable qm3h_ref(table=[ts,FT])
    annotation (Placement(transformation(extent={{-66,-36},{-46,-16}})));
  Utilities.ASHRAEIndex valT annotation (Placement(transformation(extent={{104,122},{124,102}})));
  Utilities.ASHRAEIndex valqm3h annotation (Placement(transformation(extent={{-46,22},{-66,2}})));
  Modelica.Blocks.Sources.TimeTable Tout_ref(table=[ts,TTo]) annotation (Placement(transformation(extent={{104,44},{124,64}})));
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
  final parameter Types.Temperature Tin_start = TTi[1,1];
  final parameter Types.Pressure pin_start = PTi[1,1];
equation
  connect(PT401_profile.y, source.in_p0) annotation (Line(points={{-85,112},{-70,112},{-70,110},{-44,110},{-44,111.6}}, color={0,0,127}));
  connect(TT401_profile.y, source.in_T0) annotation (Line(points={{-87,82},{-36,82},{-36,111.6}},                       color={0,0,127}));
  connect(TT402.T, valT.u_sim) annotation (Line(points={{23.8,104},{46,104},{46,117},{102,117}}, color={0,0,127}));
  connect(Tout_ref.y, valT.u_meas) annotation (Line(points={{125,54},{130,54},{130,98},{96,98},{96,107},{102,107}},
                                                                                                 color={0,0,127}));
  connect(PT402_profile.y, sinkP.in_p0) annotation (Line(points={{51,94},{28,94},{28,102},{26,102},{26,111.6}},   color={0,0,127}));
  connect(FT401.q_m3hr, valqm3h.u_sim) annotation (Line(points={{-28.1,17},{-44,17}}, color={0,0,127}));
  connect(qm3h_ref.y, valqm3h.u_meas) annotation (Line(points={{-45,-26},{-38,-26},{-38,7},{-44,7}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-160,-160},{160,160}})), experiment(
      StopTime=2500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Test;
