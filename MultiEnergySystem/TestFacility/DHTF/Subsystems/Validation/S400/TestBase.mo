within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model TestBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Real pumpcorrectionfactor = 1;
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = PTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = PTo[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = TTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = TTo[1, 1];
  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_PT401_EB401 = 0.5 + 0.4 + 0.2;
  parameter DistrictHeatingNetwork.Types.Length h_PT401_EB401 = -0.1*0;
  parameter DistrictHeatingNetwork.Types.Length L_EB401_P401 = 0.3 + 1 + 1 + 0.4;
  parameter DistrictHeatingNetwork.Types.Length h_EB401_P401 = -0.8*1;
  parameter DistrictHeatingNetwork.Types.Length L_P401_FCV401 = 0.2 + 0.4 + 0.6;
  parameter DistrictHeatingNetwork.Types.Length h_P401_FCV401 = 0.2*0;
  parameter Real q_m3h_S4 = FT[1, 1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
  parameter Real P401omega[:, :] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
  parameter Real FCV401theta[:, :] = [0, 1];
  parameter Real nR = 5 "Total number of resistors";
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
  parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
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
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";
  DHTF.Subsystems.HeatGeneration.ElectricBoiler electricBoiler(redeclare model Medium = Medium, n = n, hctype = hctype, pumpcorrectionfactor = pumpcorrectionfactor, pin_start_S4 = pin_start_S4, pout_start_S4 = pout_start_S4, Tin_start_S4 = Tin_start_S4, Tout_start_S4 = Tout_start_S4, Di_S4 = Di_S4, t_S4 = t_S4, L_PT401_EB401 = L_PT401_EB401, h_PT401_EB401 = h_PT401_EB401, L_EB401_P401 = L_EB401_P401, h_EB401_P401 = h_EB401_P401, L_P401_FCV401 = L_P401_FCV401, h_P401_FCV401 = h_P401_FCV401, q_m3h_S4 = q_m3h_S4, Kv = Kv, openingChar = openingChar, nR = nR, Pmaxres = Pmaxres, EB(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)) annotation (
    Placement(transformation(extent = {{-28, -32}, {30, 26}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table = [ts, thetav]) annotation (
    Placement(transformation(extent = {{-90, 4}, {-78, 16}})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table = [ts, omega]) annotation (
    Placement(transformation(extent = {{-90, 22}, {-78, 34}})));
  Modelica.Blocks.Continuous.FirstOrder lowPasstheta(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = thetav[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 4}, {-56, 16}})));
  Modelica.Blocks.Continuous.FirstOrder lowPassomega(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = omega[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 22}, {-56, 34}})));
  Modelica.Blocks.Sources.TimeTable PT402_profile(table = [ts, PTo]) annotation (
    Placement(transformation(extent = {{94, 70}, {82, 82}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex valT annotation (
    Placement(transformation(extent = {{64, 10}, {76, -2}})));
  Modelica.Blocks.Sources.TimeTable Tout_ref(table = [ts, TTo]) annotation (
    Placement(transformation(extent = {{44, -20}, {54, -10}})));
  Modelica.Blocks.Sources.TimeTable TT401_profile(table = [ts, TTi]) annotation (
    Placement(transformation(extent = {{-60, 44}, {-48, 56}})));
  Modelica.Blocks.Sources.TimeTable PT401_profile(table = [ts, PTi]) annotation (
    Placement(transformation(extent = {{-60, 62}, {-48, 74}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref(table = [ts, m_flow_approx]) annotation (
    Placement(transformation(extent = {{28, 34}, {40, 46}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_mflow annotation (
    Placement(transformation(extent = {{64, 18}, {76, 30}})));
  DistrictHeatingNetwork.Sources.SourcePressure source(use_in_p0 = true, use_in_T0 = true, redeclare model Medium = Medium, p0 = pin_start_S4, T0 = Tin_start_S4, R = 1e-3) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-12, 62})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkP(use_in_p0 = true, redeclare model Medium = Medium, p0 = pout_start_S4, T0 = Tout_start_S4, R = 1e-3) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {64, 78})));
  Modelica.Blocks.Sources.BooleanTable EB401_Status1(table = {1e6}, startValue = true) "Input to decide whether or nor the electric boiler is working" annotation (
    Placement(transformation(extent = {{-70, -40}, {-58, -28}})));
  Modelica.Blocks.Sources.TimeTable EB401_ToutSP1(table = [0, 80 + 273.15; 100, 80 + 273.15]) annotation (
    Placement(transformation(extent = {{-68, -18}, {-56, -6}})));
  inner DistrictHeatingNetwork.System system annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(redeclare model Medium = Medium, use_in_m_flow = true, pin_start = pout_start_S4, p0 = pout_start_S4, T0 = Tout_start_S4, m_flow0 = m_flow_approx[1, 1], G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {16, 84})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (
    Placement(transformation(extent = {{70, 44}, {82, 56}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent = {{-98, -80}, {-66, -48}})));
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
  final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1, 1];
equation
  connect(PT402_profile.y, sinkP.in_p0) annotation (
    Line(points = {{81.4, 76}, {81.4, 74}, {72.4, 74}}, color = {0, 0, 127}));
  connect(source.outlet, electricBoiler.inlet) annotation (
    Line(points = {{-12, 52}, {-12, 38}, {-10.31, 38}, {-10.31, 30.35}}, color = {140, 56, 54}, thickness = 0.5));
  connect(TT401_profile.y, source.in_T0) annotation (
    Line(points = {{-47.4, 50}, {-32, 50}, {-32, 58}, {-20.4, 58}}, color = {0, 0, 127}));
  connect(PT401_profile.y, source.in_p0) annotation (
    Line(points = {{-47.4, 68}, {-32, 68}, {-32, 66}, {-20.4, 66}}, color = {0, 0, 127}));
  connect(P401_omega.y, lowPassomega.u) annotation (
    Line(points = {{-77.4, 28}, {-69.2, 28}}, color = {0, 0, 127}));
  connect(FCV401_theta.y, lowPasstheta.u) annotation (
    Line(points = {{-77.4, 10}, {-69.2, 10}}, color = {0, 0, 127}));
  connect(lowPassomega.y, electricBoiler.omega) annotation (
    Line(points = {{-55.4, 28}, {-44, 28}, {-44, 18}, {-30.9, 18}, {-30.9, 17.3}}, color = {0, 0, 127}));
  connect(lowPasstheta.y, electricBoiler.theta) annotation (
    Line(points = {{-55.4, 10}, {-44, 10}, {-44, 11.5}, {-30.9, 11.5}}, color = {0, 0, 127}));
  connect(electricBoiler.m_flow_, val_mflow.u_sim) annotation (
    Line(points = {{32.9, 17.3}, {62.8, 17.3}, {62.8, 21}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, val_mflow.u_meas) annotation (
    Line(points = {{40.6, 40}, {54, 40}, {54, 27}, {62.8, 27}}, color = {0, 0, 127}));
  connect(electricBoiler.TTout, valT.u_sim) annotation (
    Line(points = {{32.9, 5.7}, {50, 5.7}, {50, 7}, {62.8, 7}}, color = {0, 0, 127}));
  connect(Tout_ref.y, valT.u_meas) annotation (
    Line(points = {{54.5, -15}, {58, -15}, {58, 1}, {62.8, 1}}, color = {0, 0, 127}));
  connect(EB401_ToutSP1.y, electricBoiler.Toutset) annotation (
    Line(points = {{-55.4, -12}, {-48, -12}, {-48, 5.7}, {-30.9, 5.7}}, color = {0, 0, 127}));
  connect(EB401_Status1.y, electricBoiler.status) annotation (
    Line(points = {{-57.4, -34}, {-44, -34}, {-44, -0.1}, {-30.9, -0.1}}, color = {255, 0, 255}));
  connect(electricBoiler.PTout, val_pout.u_sim) annotation (
    Line(points = {{32.9, -5.9}, {48, -5.9}, {48, 47}, {68.8, 47}}, color = {0, 0, 127}));
  connect(val_pout.u_meas, sinkP.in_p0) annotation (
    Line(points = {{68.8, 53}, {62, 53}, {62, 60}, {78, 60}, {78, 74}, {72.4, 74}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (
    Line(points = {{40.6, 40}, {44, 40}, {44, 78}, {21, 78}}, color = {0, 0, 127}));
  connect(sourceVoltage.outlet, electricBoiler.inletPower) annotation (
    Line(points = {{-66, -64}, {-40, -64}, {-40, -17.5}, {-30.9, -17.5}}, color = {56, 93, 138}, thickness = 1));
  connect(electricBoiler.outlet, sinkMassFlow.inlet) annotation (
    Line(points = {{12.89, 30.35}, {12.89, 62}, {16, 62}, {16, 74}}, color = {140, 56, 54}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end TestBase;
