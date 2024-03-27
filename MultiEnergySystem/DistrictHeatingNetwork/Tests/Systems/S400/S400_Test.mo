within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Test
  extends S400(
    FCV401(
      Kv=Kv,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage,
      dp_nom=Valve.FCV401.dp_nom),
    source(use_in_p0=true, use_in_T0=true),
    sink(use_in_m_flow=true),
    FCV401_theta(table=[ts,thetav]),
    P401_omega(table=[ts,omega]));

  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT401" "Matrix name in file";
  parameter String matrixPTo = "PT402" "Matrix name in file";
  parameter String matrixTTi = "TT401" "Matrix name in file";
  parameter String matrixTTo = "TT402" "Matrix name in file";
  parameter String matrixtheta = "theta_FCV401" "Matrix name in file";
  parameter String matrixfreq = "f_P401";
  parameter String matrixFT = "FT401" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 20.5 "Metri Flow Coefficient";

  Modelica.Blocks.Sources.TimeTable TT401_profile(table=[ts,TTi]) annotation (Placement(transformation(extent={{-108,72},{-88,92}})));
  Modelica.Blocks.Sources.TimeTable PT401_profile(table=[ts,PTi]) annotation (Placement(transformation(extent={{-106,102},{-86,122}})));
  Modelica.Blocks.Sources.TimeTable FT401_profile(table=[ts,m_flow_approx])
                                                                  annotation (Placement(transformation(extent={{76,132},{56,152}})));

  Modelica.Blocks.Sources.TimeTable pout_ref(table=[ts,PTo])
    annotation (Placement(transformation(extent={{64,24},{84,44}})));
  Utilities.ASHRAEIndex valT annotation (Placement(transformation(extent={{104,122},{124,102}})));
  Utilities.ASHRAEIndex valp annotation (Placement(transformation(extent={{104,94},{124,74}})));
  Modelica.Blocks.Sources.TimeTable Tout_ref(table=[ts,TTo]) annotation (Placement(transformation(extent={{64,54},{84,74}})));
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
  connect(PT401_profile.y, source.in_p0) annotation (Line(points={{-85,112},{-70,112},{-70,110},{-46,110},{-46,113.6}}, color={0,0,127}));
  connect(TT401_profile.y, source.in_T0) annotation (Line(points={{-87,82},{-38,82},{-38,113.6}},                       color={0,0,127}));
  connect(FT401_profile.y, sink.in_m_flow) annotation (Line(points={{55,142},{28,142},{28,147}},                   color={0,0,127}));
  connect(TT402.T, valT.u_sim) annotation (Line(points={{29.8,134},{46,134},{46,117},{102,117}}, color={0,0,127}));
  connect(PT402.p, valp.u_sim) annotation (Line(points={{29.8,122},{40,122},{40,89},{102,89}}, color={0,0,127}));
  connect(Tout_ref.y, valT.u_meas) annotation (Line(points={{85,64},{92,64},{92,107},{102,107}}, color={0,0,127}));
  connect(pout_ref.y, valp.u_meas) annotation (Line(points={{85,34},{96,34},{96,79},{102,79}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-160,-200},{160,200}})), experiment(
      StopTime=2500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Test;
