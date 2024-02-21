within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E700Test "HX70X test with real data"
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity;

  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;
  parameter Types.Density rhohotref = 985;
  parameter Types.Density rhocoldref = 999;
  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Pressures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Flow.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Actuators.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT704 = "TT704" "Matrix name in file";
  parameter String matrixFT701 = "FT701" "Matrix name in file";
  parameter String matrixFT703 = "FT703" "Matrix name in file";
  parameter String matrixPT701 = "PT701" "Matrix name in file";
  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter Real deltaThotmax = 30;
  parameter Real deltaTcoldmax = 20;

  // Variables
  DistrictHeatingNetwork.Types.Temperature Tout_cold_ref;
  DistrictHeatingNetwork.Types.Temperature Tout_hot_ref;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaToutcold;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaTouthot;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold_ref;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaThot_ref;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold;
  DistrictHeatingNetwork.Types.TemperatureDifference deltaThot;
  Real deviationCold, deviationHot;
  DistrictHeatingNetwork.Types.TemperatureDifference LMTD_ref;
  Types.CoefficientOfHeatTransfer gamma_ref;
  Types.Power Ptcold_ref;
  Types.Power Pthot_ref;

  //  final parameter Real PT701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
  //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  //  *1000/3600 "Matrix data";
  inner System system annotation (
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E701(redeclare
      model Medium =                                                                                               Medium, Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot,
    gamma_nom_cold=19112.787,
    gamma_nom_hot=3475.6692,                                                                                                                                                                                                        h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 9, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (
    Placement(transformation(origin = {-2, -0.83871}, extent = {{-28, -45.1613}, {28, 45.1613}})));
  Sources.SourceMassFlow sourceHot_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = BPHE.E701.pin_start_hot, T0 = BPHE.E701.Tin_start_hot, m_flow0 = BPHE.E701.m_flow_start_hot) annotation (
    Placement(transformation(extent = {{70, 18}, {50, 38}})));
  Sources.SourceMassFlow sourceCold_mflow(redeclare model Medium = Medium, use_in_m_flow = true, use_in_T = true, p0 = BPHE.E701.pin_start_cold, T0 = BPHE.E701.Tin_start_cold, m_flow0 = 0.32) annotation (
    Placement(transformation(extent = {{-70, -52}, {-50, -32}})));
  Sources.SinkPressure sinkHot_p(redeclare model Medium = Medium, use_in_p0 = true, p0 = BPHE.E701.pout_start_hot, T0 = BPHE.E701.Tout_start_hot) annotation (
    Placement(transformation(extent = {{68, -50}, {88, -30}})));
  Sources.SinkPressure sinkCold_p(redeclare model Medium = Medium, use_in_p0 = false, p0 = BPHE.E701.pout_start_cold, T0 = BPHE.E701.Tout_start_cold) annotation (
    Placement(transformation(extent = {{-50, 18}, {-70, 38}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV701(redeclare
      model Medium =                                                                                              Medium, allowFlowReversal = system.allowFlowReversal, Kv = Valve.FCV701.Kv, dp_nom(displayUnit = "Pa") = Valve.FCV701.dp_nom, Tin_start(displayUnit = "K") = BPHE.E701.Tout_start_hot, pin_start = BPHE.E701.pout_start_hot, q_m3h_start = EX701_q_m3h_hot) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {50, -40})));
  Modelica.Blocks.Sources.TimeTable inhot_T(table = [t, TT702]) annotation (
    Placement(transformation(extent = {{100, 70}, {80, 90}})));
  Modelica.Blocks.Sources.TimeTable incold_T(table = [t, TT703]) annotation (
    Placement(transformation(extent = {{-100, 0}, {-80, 20}})));
  Modelica.Blocks.Sources.TimeTable outhot_p(table = [0, 2e5; 100, 2e5]) annotation (
    Placement(transformation(extent = {{100, -30}, {80, -10}})));
  Modelica.Blocks.Sources.TimeTable thetavalve(table = [0, 1; 100, 1]) annotation (
    Placement(transformation(extent = {{74, -10}, {54, 10}})));
  Modelica.Blocks.Sources.TimeTable hot_m_flow(table = [t, m_flow701]) annotation (
    Placement(transformation(extent = {{100, 40}, {80, 60}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow(table = [t, m_flow703]) annotation (
    Placement(transformation(extent = {{-100, -30}, {-80, -10}})));
  Sources.SinkPressure sinkCold_ref(redeclare model Medium = Medium, T0 = BPHE.E701.Tout_start_cold, p0 = BPHE.E701.pout_start_cold, use_in_p0 = false, use_in_T0 = true, R = 1) annotation (
    Placement(transformation(origin = {40, 42}, extent = {{-50, 18}, {-70, 38}})));
  Modelica.Blocks.Sources.TimeTable outcold_Tref(table = [t, TT704]) annotation (
    Placement(transformation(origin = {50, 10}, extent = {{-100, 70}, {-80, 90}}, rotation = -0)));
  Sources.SinkPressure sinkHot_ref(redeclare model Medium = Medium, T0 = BPHE.E701.Tout_start_hot, p0 = BPHE.E701.pout_start_hot, use_in_p0 = false, use_in_T0 = true,
    R=1)                                                                                                                                                               annotation (
    Placement(transformation(origin = {-58, 110}, extent = {{68, -50}, {88, -30}})));
  Modelica.Blocks.Sources.TimeTable outhot_Tref(table = [t, TT701]) annotation (
    Placement(transformation(origin = {-50, 10}, extent = {{100, 70}, {80, 90}}, rotation = -0)));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures, matrixTT701) "dimension of matrix";
  final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]);
  final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT702, dim[1], dim[2]);
  final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT703, dim[1], dim[2]);
  final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT704, dim[1], dim[2]);
  final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT701, dim[1], dim[2]);
  final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT703, dim[1], dim[2]);
  final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
  final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
equation
  // Variables
  Tout_hot_ref = sinkHot_ref.fluid.T;
  Tout_cold_ref = sinkCold_ref.fluid.T;
  deltaTouthot = E701.Tout_hot - Tout_hot_ref;
  deltaToutcold = E701.Tout_cold - Tout_cold_ref;
  deltaThot_ref = E701.Tin_hot - Tout_hot_ref;
  deltaTcold_ref = Tout_cold_ref - E701.Tin_cold;
  deltaThot = E701.Tin_hot - E701.Tout_hot;
  deltaTcold = E701.Tout_cold - E701.Tin_cold;
  //deviationHot = abs((deltaThot - deltaThot_ref)./deltaThot_ref)*100;
  //deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcold_ref)*100;
  deviationHot = abs((deltaThot - deltaThot_ref)/deltaThotmax)*100;
  deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcoldmax)*100;
  LMTD_ref = ((E701.Tin_hot - Tout_cold_ref) - (Tout_hot_ref - E701.Tin_cold))/log(abs((E701.Tin_hot - Tout_cold_ref)/(Tout_hot_ref - E701.Tin_cold)));
  gamma_ref = Pthot_ref/(E701.hotside.Stot*LMTD_ref);
  Ptcold_ref = E701.incold.m_flow*abs((sourceCold_mflow.fluid.h - sinkCold_ref.fluid.h));
  Pthot_ref = E701.inhot.m_flow*abs((sourceHot_mflow.fluid.h - sinkHot_ref.fluid.h));

  // Connections
  connect(sourceCold_mflow.outlet, E701.incold) annotation (
    Line(points={{-50,-42},{-31,-42},{-31,-32.4516},{-16,-32.4516}},color = {140, 56, 54}));
  connect(sourceHot_mflow.outlet, E701.inhot) annotation (
    Line(points={{50,28},{34,28},{34,30.7742},{12,30.7742}},
                                                           color = {140, 56, 54}));
  connect(inhot_T.y, sourceHot_mflow.in_T) annotation (
    Line(points = {{79, 80}, {60, 80}, {60, 33}}, color = {0, 0, 127}));
  connect(E701.outhot, FCV701.inlet) annotation (
    Line(points={{12,-32.4516},{25.5,-32.4516},{25.5,-40},{40,-40}},
                                                                   color = {140, 56, 54}));
  connect(FCV701.outlet, sinkHot_p.inlet) annotation (
    Line(points = {{60, -40}, {68, -40}}, color = {140, 56, 54}, thickness = 0.5));
  connect(E701.outcold, sinkCold_p.inlet) annotation (
    Line(points={{-16,30.7742},{-36.25,30.7742},{-36.25,28},{-50,28}},color = {140, 56, 54}));
  connect(outhot_p.y, sinkHot_p.in_p0) annotation (
    Line(points = {{79, -20}, {74, -20}, {74, -31.6}}, color = {0, 0, 127}));
  connect(thetavalve.y, FCV701.opening) annotation (
    Line(points = {{53, 0}, {50, 0}, {50, -32}}, color = {0, 0, 127}));
  connect(hot_m_flow.y, sourceHot_mflow.in_m_flow) annotation (
    Line(points = {{79, 50}, {66, 50}, {66, 33}}, color = {0, 0, 127}));
  connect(cold_m_flow.y, sourceCold_mflow.in_m_flow) annotation (
    Line(points = {{-79, -20}, {-66, -20}, {-66, -37}}, color = {0, 0, 127}));
  connect(incold_T.y, sourceCold_mflow.in_T) annotation (
    Line(points = {{-79, 10}, {-60, 10}, {-60, -37}}, color = {0, 0, 127}));
  connect(outcold_Tref.y, sinkCold_ref.in_T0) annotation (
    Line(points={{-29,90},{-20,90},{-20,79.6}},      color = {0, 0, 127}));
  connect(outhot_Tref.y, sinkHot_ref.in_T0) annotation (
    Line(points={{29,90},{20,90},{20,79.6}},      color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
    experiment(StopTime = 3600, Interval = 1, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end E700Test;
