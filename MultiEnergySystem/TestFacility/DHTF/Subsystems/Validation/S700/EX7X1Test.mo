within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model EX7X1Test "Subsystem of a single HX70X test with real data"
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
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceHot_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = TestFacility.Data.BPHEData.E701.pin_start_hot, T0 = TestFacility.Data.BPHEData.E701.Tin_start_hot, m_flow0 = TestFacility.Data.BPHEData.E701.m_flow_start_hot, G = 1e-8) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-14, 60})));
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = TestFacility.Data.BPHEData.E701.pin_start_cold, T0 = TestFacility.Data.BPHEData.E701.Tin_start_cold, m_flow0 = 0.32, G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {9, -48})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkHot_p(redeclare model Medium = Medium, use_in_p0 = true, p0 = TestFacility.Data.BPHEData.E701.pout_start_hot, T0 = TestFacility.Data.BPHEData.E701.Tout_start_hot, R = 1e-3) annotation (
    Placement(transformation(extent = {{14, 50}, {34, 70}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCold_p(redeclare model Medium = Medium, use_in_p0 = false, use_in_T0 = false, p0 = TestFacility.Data.BPHEData.E701.pout_start_cold, T0 = TestFacility.Data.BPHEData.E701.Tout_start_cold, R = 1e-3) annotation (
    Placement(transformation(extent = {{9.5, -9.5}, {-9.5, 9.5}}, rotation = 90, origin = {-14.5, -48.5})));
  Modelica.Blocks.Sources.TimeTable inhot_T(table = [ts, TT702]) annotation (
    Placement(transformation(extent = {{-40, 55}, {-30, 65}})));
  Modelica.Blocks.Sources.TimeTable incold_T(table = [ts, TT703]) annotation (
    Placement(transformation(extent = {{40, -49}, {30, -39}})));
  Modelica.Blocks.Sources.TimeTable outhot_p(table = [ts, PT701]) annotation (
    Placement(transformation(extent = {{35, 73}, {25, 83}})));
  Modelica.Blocks.Sources.TimeTable hot_m_flow(table = [ts, m_flow701]) annotation (
    Placement(transformation(extent = {{-40, 70}, {-30, 80}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow(table = [ts, m_flow703]) annotation (
    Placement(transformation(extent = {{40, -64}, {30, -54}})));
  Modelica.Blocks.Sources.TimeTable outcold_Tref(table = [ts, TT704]) annotation (
    Placement(transformation(origin = {78, -53}, extent = {{-50, 35}, {-40, 45}}, rotation = -0)));
  Modelica.Blocks.Sources.TimeTable outhot_Tref(table = [ts, TT701]) annotation (
    Placement(transformation(origin = {90, 0}, extent = {{-50, 35}, {-40, 45}}, rotation = -0)));
  Modelica.Blocks.Math.Add dT_cold_sim(k1 = -1) annotation (
    Placement(transformation(extent = {{60, -35}, {70, -25}})));
  Modelica.Blocks.Math.Add dT_hot_sim(k1 = +1, k2 = -1) annotation (
    Placement(transformation(extent = {{60, 20}, {70, 10}})));
  Modelica.Blocks.Math.Add dT_cold_meas(k1 = -1) annotation (
    Placement(transformation(extent = {{60, -15}, {70, -5}})));
  Modelica.Blocks.Math.Add dT_hot_meas(k1 = -1) annotation (
    Placement(transformation(extent = {{60, 30}, {70, 40}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_cold_indexes "ASHRAE indexes for delta T cold" annotation (
    Placement(transformation(extent = {{80, -25}, {90, -15}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_hot_indexes "ASHRAE indexes for delta T hot" annotation (
    Placement(transformation(extent = {{80, 20}, {90, 30}})));
  MultiEnergySystem.TestFacility.DHTF.Subsystems.Load.SingleLoad EX7X1 annotation (
    Placement(transformation(extent = {{-26, -20}, {21, 27}})));
  Modelica.Blocks.Sources.TimeTable theta(table = [ts, thetaValve]) annotation (
    Placement(transformation(extent = {{-48, 15}, {-38, 25}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceHot_P(redeclare model Medium = Medium, use_in_p0 = true, p0 = TestFacility.Data.BPHEData.E701.pin_start_hot, T0 = TestFacility.Data.BPHEData.E701.Tin_start_hot, R = 1E-3) annotation (
    Placement(transformation(extent = {{-66, 33}, {-46, 53}})));
  Modelica.Blocks.Sources.TimeTable PT7X2_profile(table = [ts, PT702]) annotation (
    Placement(transformation(extent = {{-76, 54}, {-64, 66}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Data, matrixTT701) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(Data, timenoscale, dim[1], dim[2]) "Matrix data";
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
  // Variables
  //   Tout_hot_ref = sinkHot_ref.fluid.T;
  //   Tout_cold_ref = sinkCold_ref.fluid.T;
  //   deltaTouthot = E7X1.Tout_hot  - Tout_hot_ref;
  //   deltaToutcold = E7X1.Tout_cold  - Tout_cold_ref;
  //   deltaThot_ref = E7X1.Tin_hot  - Tout_hot_ref;
  //   deltaTcold_ref = Tout_cold_ref -E7X1.Tin_cold;
  //   deltaThot =E7X1.Tin_hot  -E7X1.Tout_hot;
  //   deltaTcold =E7X1.Tout_cold  -E7X1.Tin_cold;
  //   //deviationHot = abs((deltaThot - deltaThot_ref)./deltaThot_ref)*100;
  //   //deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcold_ref)*100;
  //   deviationHot = abs((deltaThot - deltaThot_ref)/deltaThotmax)*100;
  //   deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcoldmax)*100;
  //   LMTD_ref = ((E7X1.Tin_hot - Tout_cold_ref) - (Tout_hot_ref -E7X1.Tin_cold)) /log(abs((E7X1.Tin_hot - Tout_cold_ref)/(Tout_hot_ref -E7X1.Tin_cold)));
  //   gamma_ref = Pthot_ref/(E7X1.hotside.Stot*LMTD_ref);
  //   Ptcold_ref =E7X1.incold.m_flow *abs((sourceCold_mflow.fluid.h - sinkCold_ref.fluid.h));
  //   Pthot_ref =E7X1.inhot.m_flow *abs((sourceHot_mflow.fluid.h - sinkHot_ref.fluid.h));
  // Connections
  connect(outhot_p.y, sinkHot_p.in_p0) annotation (
    Line(points = {{24.5, 78}, {20, 78}, {20, 68.4}}, color = {0, 0, 127}));
  connect(dT_hot_meas.y, dT_hot_indexes.u_meas) annotation (
    Line(points = {{70.5, 35}, {75, 35}, {75, 27.5}, {79, 27.5}}, color = {0, 0, 127}));
  connect(EX7X1.TT7X2_TT, dT_hot_sim.u1) annotation (
    Line(points = {{23.35, 15.25}, {55, 15.25}, {55, 12}, {59, 12}}, color = {0, 0, 127}));
  connect(dT_hot_sim.y, dT_hot_indexes.u_sim) annotation (
    Line(points = {{70.5, 15}, {75, 15}, {75, 22.5}, {79, 22.5}}, color = {0, 0, 127}));
  connect(sourceCold_mflow.outlet, EX7X1.incold) annotation (
    Line(points = {{9, -38}, {9, -23.525}, {9.015, -23.525}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sinkCold_p.inlet, EX7X1.outcold) annotation (
    Line(points = {{-14.5, -39}, {-14.5, -30}, {-14, -30}, {-14, -23.525}, {-14.25, -23.525}}, color = {140, 56, 54}, thickness = 0.5));
  connect(dT_cold_sim.y, dT_cold_indexes.u_sim) annotation (
    Line(points = {{70.5, -30}, {75, -30}, {75, -22.5}, {79, -22.5}}, color = {0, 0, 127}));
  connect(dT_cold_meas.y, dT_cold_indexes.u_meas) annotation (
    Line(points = {{70.5, -10}, {75, -10}, {75, -17.5}, {79, -17.5}}, color = {0, 0, 127}));
  connect(cold_m_flow.y, sourceCold_mflow.in_m_flow) annotation (
    Line(points = {{29.5, -59}, {24, -59}, {24, -54}, {14, -54}}, color = {0, 0, 127}));
  connect(incold_T.y, sourceCold_mflow.in_T) annotation (
    Line(points = {{29.5, -44}, {24, -44}, {24, -48}, {14, -48}}, color = {0, 0, 127}));
  connect(outcold_Tref.y, dT_cold_meas.u2) annotation (
    Line(points = {{38.5, -13}, {59, -13}}, color = {0, 0, 127}));
  connect(dT_cold_meas.u1, sourceCold_mflow.in_T) annotation (
    Line(points = {{59, -7}, {41, -7}, {41, -36}, {24, -36}, {24, -48}, {14, -48}}, color = {0, 0, 127}));
  connect(EX7X1.TT7X3_TT, dT_cold_sim.u1) annotation (
    Line(points = {{23.35, 10.55}, {52, 10.55}, {52, -27}, {59, -27}}, color = {0, 0, 127}));
  connect(EX7X1.TT7X4_TT, dT_cold_sim.u2) annotation (
    Line(points = {{23.35, 5.85}, {46, 5.85}, {46, -33}, {59, -33}}, color = {0, 0, 127}));
  connect(sourceHot_mflow.outlet, EX7X1.inhot) annotation (
    Line(points = {{-14, 50}, {-14, 30.525}, {-13.78, 30.525}}, color = {140, 56, 54}, thickness = 0.5));
  connect(theta.y, EX7X1.theta) annotation (
    Line(points = {{-37.5, 20}, {-32.925, 20}, {-32.925, 17.6}, {-28.35, 17.6}}, color = {0, 0, 127}));
  connect(inhot_T.y, sourceHot_mflow.in_T) annotation (
    Line(points = {{-29.5, 60}, {-19, 60}}, color = {0, 0, 127}));
  connect(hot_m_flow.y, sourceHot_mflow.in_m_flow) annotation (
    Line(points = {{-29.5, 75}, {-25, 75}, {-25, 66}, {-19, 66}}, color = {0, 0, 127}));
  connect(EX7X1.TT7X1_TT, dT_hot_sim.u2) annotation (
    Line(points = {{23.35, 19.95}, {55, 19.95}, {55, 18}, {59, 18}}, color = {0, 0, 127}));
  connect(outhot_Tref.y, dT_hot_meas.u1) annotation (
    Line(points = {{50.5, 40}, {55, 40}, {55, 38}, {59, 38}}, color = {0, 0, 127}));
  connect(dT_hot_meas.u2, dT_hot_sim.u1) annotation (
    Line(points = {{59, 32}, {50, 32}, {50, 16}, {49, 16}, {49, 15.25}, {55, 15.25}, {55, 12}, {59, 12}}, color = {0, 0, 127}));
  connect(sinkHot_p.inlet, EX7X1.outhot) annotation (
    Line(points = {{14, 60}, {9.485, 60}, {9.485, 30.525}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT7X2_profile.y, sourceHot_P.in_p0) annotation (
    Line(points = {{-63.4, 60}, {-60, 60}, {-60, 51.4}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1})),
    Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
    experiment(StopTime = 3600, Interval = 1, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
    Icon(coordinateSystem(grid = {1, 1})));
end EX7X1Test;
