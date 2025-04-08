within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E7X1Test "Subsystem of a single HX70X test with real data"
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;
  parameter DistrictHeatingNetwork.Types.Density rhohotref = 985;
  parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999;
  parameter String Data = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT704 = "TT704" "Matrix name in file";
  parameter String matrixFT701 = "FT701" "Matrix name in file";
  parameter String matrixFT703 = "FT703" "Matrix name in file";
  parameter String matrixPT701 = "PT701" "Matrix name in file";
  parameter String matrixPT702 = "PT702" "Matrix name in file";
  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter Real deltaThotmax = 30;
  parameter Real deltaTcoldmax = 20;
  // Variables
  //   DistrictHeatingNetwork.Types.Temperature Tout_cold_ref;
  //   DistrictHeatingNetwork.Types.Temperature Tout_hot_ref;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaToutcold;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTouthot;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold_ref;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot_ref;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold;
  //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot;
  //   Real deviationCold, deviationHot;
  //   DistrictHeatingNetwork.Types.TemperatureDifference LMTD_ref;
  //   DistrictHeatingNetwork.Types.CoefficientOfHeatTransfer gamma_ref;
  //   DistrictHeatingNetwork.Types.Power Ptcold_ref;
  //   DistrictHeatingNetwork.Types.Power Pthot_ref;
  //  final parameter Real PT701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
  //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  //  *1000/3600 "Matrix data";
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceHot_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = TestFacility.Data.BPHEData.E701.pin_start_hot, T0 = TestFacility.Data.BPHEData.E701.Tin_start_hot, m_flow0 = TestFacility.Data.BPHEData.E701.m_flow_start_hot) annotation (
    Placement(transformation(extent = {{61, 41}, {41, 21}})));
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = TestFacility.Data.BPHEData.E701.pin_start_cold, T0 = TestFacility.Data.BPHEData.E701.Tin_start_cold, m_flow0 = 0.32) annotation (
    Placement(transformation(extent = {{-60, -42}, {-40, -22}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkHot_p(redeclare model Medium = Medium, use_in_p0 = true, p0 = TestFacility.Data.BPHEData.E701.pout_start_hot, T0 = TestFacility.Data.BPHEData.E701.Tout_start_hot) annotation (
    Placement(transformation(extent = {{44, -43}, {64, -23}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCold_p(redeclare model Medium = Medium, use_in_p0 = false, p0 = TestFacility.Data.BPHEData.E701.pout_start_cold, T0 = TestFacility.Data.BPHEData.E701.Tout_start_cold) annotation (
    Placement(transformation(extent = {{-43, 21}, {-62, 40}})));
  Modelica.Blocks.Sources.TimeTable inhot_T(table = [t, TT702]) annotation (
    Placement(transformation(extent = {{69, -5}, {59, 5}})));
  Modelica.Blocks.Sources.TimeTable incold_T(table = [t, TT703]) annotation (
    Placement(transformation(extent = {{-68, 0}, {-58, 10}})));
  Modelica.Blocks.Sources.TimeTable outhot_p(table = [0, 2e5; 100, 2e5]) annotation (
    Placement(transformation(extent = {{65, -20}, {55, -10}})));
  Modelica.Blocks.Sources.TimeTable hot_m_flow(table = [t, m_flow701]) annotation (
    Placement(transformation(extent = {{69, 10}, {59, 20}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow(table = [t, m_flow703]) annotation (
    Placement(transformation(extent = {{-68, -15}, {-58, -5}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCold_ref(redeclare model Medium = Medium, T0 = TestFacility.Data.BPHEData.E701.Tout_start_cold, p0 = TestFacility.Data.BPHEData.E701.pout_start_cold, use_in_p0 = false, use_in_T0 = true, R = 1) annotation (
    Placement(transformation(origin = {40, 42}, extent = {{-50, 18}, {-70, 38}})));
  Modelica.Blocks.Sources.TimeTable outcold_Tref(table = [t, TT704]) annotation (
    Placement(transformation(origin = {50, 10}, extent = {{-100, 70}, {-80, 90}}, rotation = -0)));
  DistrictHeatingNetwork.Sources.SinkPressure sinkHot_ref(redeclare model Medium = Medium, T0 = TestFacility.Data.BPHEData.E701.Tout_start_hot, p0 = TestFacility.Data.BPHEData.E701.pout_start_hot, use_in_p0 = false, use_in_T0 = true, R = 1) annotation (
    Placement(transformation(origin = {-58, 110}, extent = {{68, -50}, {88, -30}})));
  Modelica.Blocks.Sources.TimeTable outhot_Tref(table = [t, TT701]) annotation (
    Placement(transformation(origin = {-50, 10}, extent = {{100, 70}, {80, 90}}, rotation = -0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X1(redeclare model Medium = Medium, T_start = TestFacility.Data.BPHEData.E701.Tout_start_hot, p_start = TestFacility.Data.BPHEData.E701.pout_start_hot) annotation (
    Placement(transformation(extent = {{31, -36}, {41, -26}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X4(redeclare model Medium = Medium, T_start = TestFacility.Data.BPHEData.E701.Tout_start_cold, p_start = TestFacility.Data.BPHEData.E701.pout_start_cold) annotation (
    Placement(transformation(extent = {{-42, 28}, {-32, 38}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X3(redeclare model Medium = Medium, T_start = TestFacility.Data.BPHEData.E701.Tin_start_cold, p_start = TestFacility.Data.BPHEData.E701.pin_start_cold) annotation (
    Placement(transformation(extent = {{-40, -35}, {-30, -25}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X2(redeclare model Medium = Medium, T_start = TestFacility.Data.BPHEData.E701.Tin_start_hot, p_start = TestFacility.Data.BPHEData.E701.pin_start_hot) annotation (
    Placement(transformation(extent = {{27, 28}, {37, 38}})));
  Modelica.Blocks.Math.Add dT_cold_sim(k1 = -1) annotation (
    Placement(transformation(extent = {{-70, 40}, {-80, 50}})));
  Modelica.Blocks.Math.Add dT_hot_sim(k1 = +1, k2 = -1) annotation (
    Placement(transformation(extent = {{70, 40}, {80, 50}})));
  Modelica.Blocks.Math.Add dT_cold_meas(k1 = -1) annotation (
    Placement(transformation(extent = {{-70, 60}, {-80, 70}})));
  Modelica.Blocks.Math.Add dT_hot_meas(k1 = -1) annotation (
    Placement(transformation(extent = {{70, 60}, {80, 70}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_cold_indexes "ASHRAE indexes for delta T cold" annotation (
    Placement(transformation(extent = {{-90, 50}, {-100, 60}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_hot_indexes "ASHRAE indexes for delta T hot" annotation (
    Placement(transformation(extent = {{90, 50}, {100, 60}})));
  MultiEnergySystem.TestFacility.DHTF.Subsystems.Load.SingleLoad EX7X1 annotation (
    Placement(transformation(extent = {{-16, -2}, {15, 29}})));
  Modelica.Blocks.Sources.TimeTable theta(table = [t, thetaValve]) annotation (
    Placement(transformation(extent = {{-32, 43}, {-22, 53}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Data, matrixTT701) "dimension of matrix";
  final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Data, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT701, dim[1], dim[2]);
  final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT702, dim[1], dim[2]);
  final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT703, dim[1], dim[2]);
  final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT704, dim[1], dim[2]);
  final parameter Real PT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT701, dim[1], dim[2]);
  final parameter Real PT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT702, dim[1], dim[2]);
  final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT701, dim[1], dim[2]);
  final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT703, dim[1], dim[2]);
  final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
  final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
  final parameter Real thetaValve[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixthetaFCV701, dim[1], dim[2]);
equation
  // Connections
  connect(outhot_p.y, sinkHot_p.in_p0) annotation (
    Line(points = {{54.5, -15}, {50, -15}, {50, -24.6}}, color = {0, 0, 127}));
  connect(incold_T.y, sourceCold_mflow.in_T) annotation (
    Line(points = {{-57.5, 5}, {-50, 5}, {-50, -27}}, color = {0, 0, 127}));
  connect(outcold_Tref.y, sinkCold_ref.in_T0) annotation (
    Line(points = {{-29, 90}, {-20, 90}, {-20, 79.6}}, color = {0, 0, 127}));
  connect(outhot_Tref.y, sinkHot_ref.in_T0) annotation (
    Line(points = {{29, 90}, {20, 90}, {20, 79.6}}, color = {0, 0, 127}));
  connect(cold_m_flow.y, sourceCold_mflow.in_m_flow) annotation (
    Line(points = {{-57.5, -10}, {-56, -10}, {-56, -27}}, color = {0, 0, 127}));
  connect(hot_m_flow.y, sourceHot_mflow.in_m_flow) annotation (
    Line(points = {{58.5, 15}, {57, 15}, {57, 26}}, color = {0, 0, 127}));
  connect(inhot_T.y, sourceHot_mflow.in_T) annotation (
    Line(points = {{58.5, 0}, {51, 0}, {51, 26}}, color = {0, 0, 127}));
  connect(sinkHot_p.inlet, TT7X1.inlet) annotation (
    Line(points = {{44, -33}, {36, -33}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sinkCold_p.inlet, TT7X4.inlet) annotation (
    Line(points = {{-43, 30.5}, {-40.5, 30.5}, {-40.5, 31}, {-37, 31}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceCold_mflow.outlet, TT7X3.inlet) annotation (
    Line(points = {{-40, -32}, {-35, -32}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT7X4.T, dT_cold_sim.u2) annotation (
    Line(points = {{-37, 39.5}, {-37, 42}, {-69, 42}}, color = {0, 0, 127}));
  connect(TT7X3.T, dT_cold_sim.u1) annotation (
    Line(points = {{-35, -23.5}, {-35, 17}, {-66, 17}, {-66, 48}, {-69, 48}}, color = {0, 0, 127}));
  connect(TT7X1.T, dT_hot_sim.u2) annotation (
    Line(points = {{36, -24.5}, {36, 42}, {69, 42}}, color = {0, 0, 127}));
  connect(TT7X2.T, dT_hot_sim.u1) annotation (
    Line(points = {{32, 39.5}, {32, 48}, {69, 48}}, color = {0, 0, 127}));
  connect(incold_T.y, dT_cold_meas.u1) annotation (
    Line(points = {{-57.5, 5}, {-50, 5}, {-50, 68}, {-69, 68}}, color = {0, 0, 127}));
  connect(outcold_Tref.y, dT_cold_meas.u2) annotation (
    Line(points = {{-29, 90}, {-28, 90}, {-28, 62}, {-69, 62}}, color = {0, 0, 127}));
  connect(dT_hot_meas.u1, sinkHot_ref.in_T0) annotation (
    Line(points = {{69, 68}, {27, 68}, {27, 90}, {20, 90}, {20, 79.6}}, color = {0, 0, 127}));
  connect(dT_hot_meas.u2, sourceHot_mflow.in_T) annotation (
    Line(points = {{69, 62}, {55, 62}, {55, 0}, {51, 0}, {51, 26}}, color = {0, 0, 127}));
  connect(dT_cold_sim.y, dT_cold_indexes.u_sim) annotation (
    Line(points = {{-80.5, 45}, {-85, 45}, {-85, 52.5}, {-89, 52.5}}, color = {0, 0, 127}));
  connect(dT_cold_meas.y, dT_cold_indexes.u_meas) annotation (
    Line(points = {{-80.5, 65}, {-85, 65}, {-85, 57.5}, {-89, 57.5}}, color = {0, 0, 127}));
  connect(dT_hot_meas.y, dT_hot_indexes.u_meas) annotation (
    Line(points = {{80.5, 65}, {85, 65}, {85, 57.5}, {89, 57.5}}, color = {0, 0, 127}));
  connect(dT_hot_sim.y, dT_hot_indexes.u_sim) annotation (
    Line(points = {{80.5, 45}, {85, 45}, {85, 52.5}, {89, 52.5}}, color = {0, 0, 127}));
  connect(EX7X1.outcold, TT7X4.inlet) annotation (
    Line(points = {{-8.25, -4.325}, {-8.25, -11}, {-28, -11}, {-28, 31}, {-37, 31}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EX7X1.incold, TT7X3.inlet) annotation (
    Line(points = {{7.095, -4.325}, {7.095, -32}, {-35, -32}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EX7X1.outhot, TT7X1.inlet) annotation (
    Line(points = {{7.405, 31.325}, {7.405, 38}, {25, 38}, {25, -33}, {36, -33}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceHot_mflow.outlet, TT7X2.inlet) annotation (
    Line(points = {{41, 31}, {32, 31}}, color = {140, 56, 54}, thickness = 0.5));
  connect(EX7X1.inhot, TT7X2.inlet) annotation (
    Line(points = {{-7.94, 31.325}, {-7.94, 43}, {28, 43}, {28, 31}, {32, 31}}, color = {140, 56, 54}, thickness = 0.5));
  connect(theta.y, EX7X1.theta) annotation (
    Line(points = {{-21.5, 48}, {-17, 48}, {-17, 33}, {-23, 33}, {-23, 22.8}, {-17.55, 22.8}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1})),
    Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
    experiment(StopTime = 3600, Interval = 1, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
    Icon(coordinateSystem(grid = {1, 1})));
end E7X1Test;
