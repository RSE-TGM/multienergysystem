within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S900;
model TestBase "Test base for validation of system 900, using S400 as reference"
  extends Modelica.Icons.Example;
  // Medium
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  parameter Real pumpcorrectionfactor = 1;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005;
  //parameter Real b[3] = {24.122662, 0.669933, -0.039537} "Head Characteristic coefficients";
  //parameter Real b[3] = {24.122662, 0.60, -0.039537} "Head Characteristic coefficients";
  //parameter Real b[3] = {23.6, 0.61, -0.039537} "Head Characteristic coefficients";
  //parameter Real b[3] = {23.6, 0.63, -0.042} "Head Characteristic coefficients";
  parameter Real b[3] = {23.6, 0.62, -0.0435} "Head Characteristic coefficients";
  parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length L_v = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9 = 4.04;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = pin_start;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = PTo[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9 = TTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9 = TTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Length Di_rCD = 72e-3;
  parameter DistrictHeatingNetwork.Types.Length t_rCD = 2e-3;
  parameter DistrictHeatingNetwork.Types.Length L_rCD = 6;
  parameter DistrictHeatingNetwork.Types.Length h_rCD = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S400_rCD = 2 + 0.5 + 0.5 + 0.7 + 1.5 + 1.5 + 0.5 + 0.2 + 0.2 + 0.6;
  parameter DistrictHeatingNetwork.Types.Length h_S400_rCD = 0.1;
  //0.7-1.5+0.2+0.6;
  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
  parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String matrixPTi = "PT402" "Matrix name in file";
  parameter String matrixPTo = "PT902" "Matrix name in file";
  parameter String matrixTTi = "TT902" "Matrix name in file";
  parameter String matrixtheta = "theta_FCV901" "Matrix name in file";
  parameter String matrixfreq = "f_P901";
  parameter String matrixFT = "FT901" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot "opening characteristic";
  TestFacility.DHTF.Subsystems.Distribution.CirculationPump circulationPump(n = 3, pumpcorrectionfactor = pumpcorrectionfactor, Kv = Kv, openingChar = openingChar, cf = cf, b = b) annotation (
    Placement(transformation(extent = {{-28, -22}, {32, 38}})));
  Modelica.Blocks.Sources.TimeTable TT402_profile(table = [ts, TTi]) annotation (
    Placement(transformation(extent = {{48, -78}, {36, -66}})));
  Modelica.Blocks.Sources.TimeTable PT402_profile(table = [ts, PTi]) annotation (
    Placement(transformation(extent = {{64, -98}, {52, -86}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD(m_flow_start = m_flow_start, redeclare model Medium = Medium, L = L_rCD, h = h_rCD, t = t_rCD, pin_start = pin_start_S9, Tin_start = Tout_start_S9, Tout_start = Tout_start_S9, Di = Di_rCD, nPipes = 1, n = 5) "Pipe connecting the outlet of S900 and the pressure transmiter PT401" annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {14, -40})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP(use_in_p0 = true, use_in_T0 = true, redeclare model Medium = Medium, p0 = pin_start_S9, T0 = Tin_start_S9, R = 1e-3) annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {14, -92})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sink_(redeclare model Medium = Medium, G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-10, -90})));
  Modelica.Blocks.Sources.TimeTable P901_omega(table = [ts, omega]) annotation (
    Placement(transformation(extent = {{-72, 32}, {-60, 44}})));
  Modelica.Blocks.Sources.TimeTable FCV901_theta(table = [ts, thetav]) annotation (
    Placement(transformation(extent = {{-72, 12}, {-60, 24}})));
  Modelica.Blocks.Sources.TimeTable PT902_profile(table = [ts, PTo]) annotation (
    Placement(transformation(extent = {{96, 32}, {84, 44}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP(use_in_p0 = true, redeclare model Medium = Medium, p0 = pout_start_S9, T0 = Tout_start_S9, R = 1e-3) annotation (
    Placement(transformation(extent = {{56, 62}, {68, 50}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref(table = [ts, m_flow_approx]) annotation (
    Placement(transformation(extent = {{48, 86}, {60, 98}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex m_flow_index annotation (
    Placement(transformation(extent = {{74, 84}, {86, 96}})));
  inner MultiEnergySystem.System system annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Modelica.Blocks.Continuous.FirstOrder lowPassomega(k = 1, T = 5, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = omega[1, 1]) annotation (
    Placement(transformation(extent = {{-54, 32}, {-42, 44}})));
  Modelica.Blocks.Continuous.FirstOrder lowPasstheta(k = 1, T = 5, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = thetav[1, 1]) annotation (
    Placement(transformation(extent = {{-54, 12}, {-42, 24}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i = Di_S4, D_o = Di_rCD) annotation (
    Placement(transformation(extent = {{-4, -4}, {4, 4}}, rotation = 270, origin = {14, -56})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD(m_flow_start = m_flow_start, redeclare model Medium = Medium, L = L_S400_rCD, h = h_S400_rCD, t = t_S4, pin_start = pin_start_S9, Tin_start = Tout_start_S9, Tout_start = Tout_start_S9, Di = Di_S4, nPipes = 1, n = 5) "Pipe connecting rackCD and the pressure transmiter PT402" annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {14, -72})));
  Modelica.Blocks.Continuous.FirstOrder lowPasspout(k = 1, T = 5, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = PTo[1, 1]) annotation (
    Placement(transformation(extent = {{74, 32}, {62, 44}})));
  Modelica.Blocks.Continuous.FirstOrder lowPasspin(k = 1, T = 5, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = PTi[1, 1]) annotation (
    Placement(transformation(extent = {{44, -98}, {32, -86}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(redeclare model Medium = Medium, use_in_m_flow = true, pin_start = pout_start_S9, p0 = pout_start_S9, T0 = Tout_start_S9, m_flow0 = m_flow_approx[1, 1], G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {14, 90})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (
    Placement(transformation(extent = {{52, 10}, {64, 22}})));
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
  final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1, 1];
equation
  connect(sink_.inlet, circulationPump.outletcold) annotation (
    Line(points = {{-10, -80}, {-10, -55.25}, {-9.7, -55.25}, {-9.7, -26.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT402_profile.y, sourceP.in_T0) annotation (
    Line(points = {{35.4, -72}, {28, -72}, {28, -89.6}, {19.04, -89.6}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, m_flow_index.u_meas) annotation (
    Line(points = {{60.6, 92}, {72.8, 92}, {72.8, 93}}, color = {0, 0, 127}));
  connect(circulationPump.m_flow_, m_flow_index.u_sim) annotation (
    Line(points = {{35, 29}, {66, 29}, {66, 87}, {72.8, 87}}, color = {0, 0, 127}));
  connect(P901_omega.y, lowPassomega.u) annotation (
    Line(points = {{-59.4, 38}, {-55.2, 38}}, color = {0, 0, 127}));
  connect(lowPassomega.y, circulationPump.omega) annotation (
    Line(points = {{-41.4, 38}, {-38, 38}, {-38, 29}, {-31, 29}}, color = {0, 0, 127}));
  connect(FCV901_theta.y, lowPasstheta.u) annotation (
    Line(points = {{-59.4, 18}, {-55.2, 18}}, color = {0, 0, 127}));
  connect(lowPasstheta.y, circulationPump.theta) annotation (
    Line(points = {{-41.4, 18}, {-38, 18}, {-38, 23}, {-31, 23}}, color = {0, 0, 127}));
  connect(suddenAreaChange.outlet, PL_S400_rCD.outlet) annotation (
    Line(points = {{14, -60}, {14, -66}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceP.outlet, PL_S400_rCD.inlet) annotation (
    Line(points = {{14, -86}, {14, -78}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD.inlet, suddenAreaChange.inlet) annotation (
    Line(points = {{14, -46}, {14, -52}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD.outlet, circulationPump.inlethot) annotation (
    Line(points = {{14, -34}, {14, -29.25}, {13.7, -29.25}, {13.7, -26.5}}, color = {140, 56, 54}, thickness = 0.5));
  connect(lowPasspout.y, sinkP.in_p0) annotation (
    Line(points = {{61.4, 38}, {61.4, 42}, {59.6, 42}, {59.6, 50.96}}, color = {0, 0, 127}));
  connect(lowPasspout.u, PT902_profile.y) annotation (
    Line(points = {{75.2, 38}, {83.4, 38}}, color = {0, 0, 127}));
  connect(PT402_profile.y, lowPasspin.u) annotation (
    Line(points = {{51.4, -92}, {45.2, -92}}, color = {0, 0, 127}));
  connect(lowPasspin.y, sourceP.in_p0) annotation (
    Line(points = {{31.4, -92}, {28, -92}, {28, -94.4}, {19.04, -94.4}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (
    Line(points = {{60.6, 92}, {64, 92}, {64, 78}, {28, 78}, {28, 84}, {19, 84}}, color = {0, 0, 127}));
  connect(val_pout.u_meas, sinkP.in_p0) annotation (
    Line(points = {{50.8, 19}, {50.8, 18}, {44, 18}, {44, 50.96}, {59.6, 50.96}}, color = {0, 0, 127}));
  connect(circulationPump.PTout, val_pout.u_sim) annotation (
    Line(points = {{35, 5}, {44, 5}, {44, 13}, {50.8, 13}}, color = {0, 0, 127}));
  connect(sinkP.inlet, circulationPump.outlethot) annotation (Line(
      points={{56,56},{13.7,56},{13.7,42.5}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StartTime = 3500, StopTime = 9500, __Dymola_Algorithm = "Dassl"));
end TestBase;
