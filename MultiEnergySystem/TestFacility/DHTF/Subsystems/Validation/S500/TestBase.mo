within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S500;
model TestBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Integer n = 3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Real pumpcorrectionfactor = 1;
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_SP[:, :] = [0, 76 + 273.15; 1e6, 76 + 273.15];
  // Gas composition
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};
  // Temperatures and pressures
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S5 = PTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S5 = PTo[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S5 = TTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S5 = TTo[1, 1];
  //   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_CHP = TTi_CHP[1, 1];
  //   parameter DistrictHeatingNetwork.Types.Temperature Tout_start_CHP = TTo_CHP[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_CHP = TTi_CHP[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_CHP = TTo_CHP[1, 1];
  parameter DistrictHeatingNetwork.Types.Length h = 0.5;
  // Pipe Data
  //parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  //parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  //parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  //parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0;
  //0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 2*0;
  //   parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 0.66+0.25+0.54+0.5+1.3+1+3+4+0.5+0.2+0.3 "12.25";
  //   parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
  //   parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 1 + 3 + 3.2 + 1.1 + 1.2 + 0.5 + 0.25 + 0.6;
  //   parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6;
  parameter DistrictHeatingNetwork.Types.Length Di_S5 = 42e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient";
  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;
  parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
  parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2407_Test1.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_low_start = 1.4 "Starting mass flow rate rack side";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_high_start = 1.70 "Starting mass flow rate CHP side";
  parameter String matrixPTi = "PT501" "Matrix name in file";
  parameter String matrixPTo = "PT502" "Matrix name in file";
  parameter String matrixTTi = "TT501" "Matrix name in file";
  parameter String matrixTTo = "TT502" "Matrix name in file";
  parameter String matrixTTo_CHP = "T2_CHP";
  parameter String matrixTTi_CHP = "T3_CHP";
  parameter String matrixtheta = "theta_FCV101";
  parameter String matrixfreq = "f_P501";
  parameter String matrixFT = "FT501";
  parameter String matrixFTCHP = "M1_CHP";
  //parameter String matrixmflowGas = "FT801";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";
  DistrictHeatingNetwork.Sources.SourcePressure source(use_in_p0 = true, use_in_T0 = true, p0 = pin_start_S5, T0 = Tin_start_S5, R = 1e-3) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-14, 60})));
  Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table = Tout_SP) annotation (
    Placement(transformation(extent = {{-68, -12}, {-56, 0}})));
  Modelica.Blocks.Sources.BooleanTable GB501_Status(table = {1e6}, startValue = true) "Input to decide whether or nor the gas boiler is working" annotation (
    Placement(transformation(extent = {{-68, -30}, {-56, -18}})));
  Modelica.Blocks.Sources.TimeTable TT501_profile(table = [ts, TTi]) annotation (
    Placement(transformation(extent = {{-46, 48}, {-34, 60}})));
  Modelica.Blocks.Sources.TimeTable PT501_profile(table = [ts, PTi]) annotation (
    Placement(transformation(extent = {{-46, 66}, {-34, 78}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table = [ts, thetav]) annotation (
    Placement(transformation(extent = {{-88, 8}, {-76, 20}})));
  Modelica.Blocks.Sources.TimeTable P501_omega(table = [ts, omega]) annotation (
    Placement(transformation(extent = {{-88, 26}, {-76, 38}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref(table = [ts, m_flow_approx]) annotation (
    Placement(transformation(extent = {{40, 48}, {28, 60}})));
  inner DistrictHeatingNetwork.System system annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Modelica.Blocks.Continuous.FirstOrder lowPassomega(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = omega[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 26}, {-56, 38}})));
  Modelica.Blocks.Continuous.FirstOrder lowPasstheta(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = thetav[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 8}, {-56, 20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(redeclare model Medium = Medium, use_in_m_flow = true, pin_start = pout_start_S5, p0 = pout_start_S5, T0 = Tout_start_S5, m_flow0 = m_flow_approx[1, 1], G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {14, 60})));
  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -62})));
  DHTF.Subsystems.HeatGeneration.CHP S500(Tin_low_start = Tout_start_CHP, Tout_low_start = Tin_start_CHP, Tin_high_start = Tin_start_S5, Tout_high_start = Tout_start_S5, Tin_start_CHP = Tin_start_CHP, Tout_start_CHP = Tout_start_CHP, PL_S500_FT501_EX501(L = 80), EX501(n = 5), CHP(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState, h = h)) annotation (
    Placement(transformation(extent = {{-26, -26}, {26, 26}})));
  Modelica.Blocks.Sources.Ramp PCHP_m_flow(height = 0, duration = 0, offset = m_flow_low_start) annotation (
    Placement(transformation(extent = {{-90.75, -46}, {-78, -33}})));
  Modelica.Blocks.Sources.Ramp ToutSP(height = 0, duration = 0, offset = 80 + 273.15) annotation (
    Placement(transformation(extent = {{-88, -12}, {-76, 0}})));
  Modelica.Blocks.Sources.Ramp PelSP(height = 5e3*0, duration = 0, offset = 35e3, startTime = 1000) annotation (
    Placement(transformation(extent = {{-68, -46}, {-56, -34}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref_CHP(table = [ts, m_flow_CHP_approx]) annotation (
    Placement(transformation(extent = {{-68, -66}, {-56, -54}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real TTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo, dim[1], dim[2]);
  final parameter Real TTi_CHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi_CHP, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]);
  final parameter Real TTo_CHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo_CHP, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real FTCHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFTCHP, dim[1], dim[2]);
  //final parameter Real m_flow_Gas[dim[1], dim[2]]= Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixmflowGas, dim[1], dim[2])/3600;
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_TT502 "Validation of outlet temperature TT502" annotation (
    Placement(transformation(extent = {{60, 2}, {80, 22}})));
  Modelica.Blocks.Sources.TimeTable TT502_ref(table = [ts, TTo]) annotation (
    Placement(transformation(extent = {{40, 12}, {50, 22}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-88, -100}, {-68, -80}})));
  Modelica.Blocks.Math.Max max1 annotation (
    Placement(transformation(extent = {{-34, -80}, {-14, -60}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1e-3) annotation (
    Placement(transformation(extent = {{-78, -86}, {-58, -66}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_dTT502 "Validation of outlet temperature dTT502" annotation (
    Placement(transformation(extent = {{72, 80}, {92, 100}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = TT502_ref.y - TT501_profile.y) annotation (
    Placement(transformation(extent = {{40, 86}, {60, 106}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = S500.TTout - TT501_profile.y) annotation (
    Placement(transformation(extent = {{40, 74}, {60, 94}})));
  Modelica.Blocks.Sources.TimeTable PT502_profile(table = [ts, PTo]) annotation (
    Placement(transformation(extent = {{90, 52}, {78, 64}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (
    Placement(transformation(extent = {{80, 30}, {92, 42}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = S500.PTout) annotation (
    Placement(transformation(extent = {{48, 24}, {68, 44}})));
protected
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Real m_flow_CHP_approx[dim[1], dim[2]] = FTCHP*(rhohotref/1000)/60;
  final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
  final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1, 1];
equation
  connect(TT501_profile.y, source.in_T0) annotation (
    Line(points = {{-33.4, 54}, {-30, 54}, {-30, 56}, {-22.4, 56}}, color = {0, 0, 127}));
  connect(PT501_profile.y, source.in_p0) annotation (
    Line(points = {{-33.4, 72}, {-30, 72}, {-30, 64}, {-22.4, 64}}, color = {0, 0, 127}));
  connect(P501_omega.y, lowPassomega.u) annotation (
    Line(points = {{-75.4, 32}, {-69.2, 32}}, color = {0, 0, 127}));
  connect(FCV101_theta.y, lowPasstheta.u) annotation (
    Line(points = {{-75.4, 14}, {-69.2, 14}}, color = {0, 0, 127}));
  connect(sourceGas.outlet, S500.inletFuel) annotation (
    Line(points = {{0, -52}, {0, -30.16}}, color = {182, 109, 49}, thickness = 0.5));
  connect(source.outlet, S500.inlet) annotation (
    Line(points = {{-14, 50}, {-14, 38}, {-10.14, 38}, {-10.14, 29.9}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sinkMassFlow.inlet, S500.outlet) annotation (
    Line(points = {{14, 50}, {14, 38}, {10.66, 38}, {10.66, 29.9}}, color = {140, 56, 54}, thickness = 0.5));
  connect(lowPassomega.y, S500.omega) annotation (
    Line(points = {{-55.4, 32}, {-44, 32}, {-44, 18.2}, {-28.6, 18.2}}, color = {0, 0, 127}));
  connect(lowPasstheta.y, S500.theta) annotation (
    Line(points = {{-55.4, 14}, {-54, 13}, {-28.6, 13}}, color = {0, 0, 127}));
  connect(GB501_Status.y, S500.status) annotation (
    Line(points = {{-55.4, -24}, {-42, -24}, {-42, 2.6}, {-28.6, 2.6}}, color = {255, 0, 255}));
  connect(ToutSP.y, S500.Toutset) annotation (
    Line(points = {{-75.4, -6}, {-72, -6}, {-72, 4}, {-44, 4}, {-44, 7.8}, {-28.6, 7.8}}, color = {0, 0, 127}));
  connect(PelSP.y, S500.Pelset) annotation (
    Line(points = {{-55.4, -40}, {-38, -40}, {-38, -2.6}, {-28.6, -2.6}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (
    Line(points = {{27.4, 54}, {19, 54}}, color = {0, 0, 127}));
  connect(S500.TTout, val_TT502.u_sim) annotation (
    Line(points = {{28.6, 7.8}, {42, 7.8}, {42, 7}, {58, 7}}, color = {0, 0, 127}));
  connect(TT502_ref.y, val_TT502.u_meas) annotation (
    Line(points = {{50.5, 17}, {58, 17}}, color = {0, 0, 127}));
  connect(sourceVoltage.outlet, S500.outletPower) annotation (
    Line(points = {{-68, -90}, {-54, -90}, {-54, -88}, {-46, -88}, {-46, -15.08}, {-28.6, -15.08}}, color = {56, 93, 138}, thickness = 1));
  connect(m_flow_ref_CHP.y, max1.u1) annotation (
    Line(points = {{-55.4, -60}, {-44, -60}, {-44, -64}, {-36, -64}}, color = {0, 0, 127}));
  connect(max1.y, S500.m_flow_CHP) annotation (
    Line(points = {{-13, -70}, {-10, -70}, {-10, -38}, {-34, -38}, {-34, -7.8}, {-28.6, -7.8}}, color = {0, 0, 127}));
  connect(realExpression.y, max1.u2) annotation (
    Line(points = {{-57, -76}, {-36, -76}}, color = {0, 0, 127}));
  connect(realExpression1.y, val_dTT502.u_meas) annotation (
    Line(points = {{61, 96}, {65.5, 96}, {65.5, 95}, {70, 95}}, color = {0, 0, 127}));
  connect(realExpression2.y, val_dTT502.u_sim) annotation (
    Line(points = {{61, 84}, {61, 85}, {70, 85}}, color = {0, 0, 127}));
  connect(val_pout.u_meas, PT502_profile.y) annotation (
    Line(points = {{78.8, 39}, {72, 39}, {72, 58}, {77.4, 58}}, color = {0, 0, 127}));
  connect(realExpression3.y, val_pout.u_sim) annotation (
    Line(points = {{69, 34}, {73.9, 34}, {73.9, 33}, {78.8, 33}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 8000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestBase;
