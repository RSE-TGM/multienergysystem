within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model TestBase "Base test for S100 validation"
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Integer n = 3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Real pumpcorrectionfactor = 1;
  parameter DistrictHeatingNetwork.Types.PerUnit eta_combustion = 0.93;
  parameter Modelica.Units.SI.Time tdelay = 200 "Rising time of heater from 0 to full power";
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_SP[:, :] = [0, 76 + 273.15; 5e3, 76 + 273.15; 5e3, 76 + 273.15; 1e6, 76 + 273.15];
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 147.6e3*0.85;
  // Gas composition
  //parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {1, 0, 0, 0};
  // Temperatures and pressures
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = PTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = PTo[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = TTi[1, 1];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = TTo[1, 1];
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
  parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient";
  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;
  parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
  parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
  parameter String matrixPTi = "PT101" "Matrix name in file";
  parameter String matrixPTo = "PT102" "Matrix name in file";
  parameter String matrixTTi = "TT101" "Matrix name in file";
  parameter String matrixTTo = "TT102" "Matrix name in file";
  parameter String matrixtheta = "theta_FCV101" "Matrix name in file";
  parameter String matrixfreq = "f_P101";
  parameter String matrixFT = "FT101" "Matrix name in file";
  parameter String matrixmflowGas = "FT801" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";
  DHTF.Subsystems.HeatGeneration.GasBoiler gasBoiler(pumpcorrectionfactor = pumpcorrectionfactor, hctype = hctype, pin_start_S1 = pin_start_S1, pout_start_S1 = pout_start_S1, Tin_start_S1 = Tin_start_S1, Tout_start_S1 = Tout_start_S1, cf = cf, eta_combustion = eta_combustion, tdelay = tdelay, h_FT101_GB101 = h_FT101_GB101, h_GB101_P101 = h_GB101_P101, L_P101_FCV101 = L_P101_FCV101, h_P101_FCV101 = h_P101_FCV101, Kv = Kv, openingChar = openingChar, Pmaxnom = Pmaxnom, GB(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)) annotation (
    Placement(transformation(extent = {{-30, -28}, {26, 28}})));
  DistrictHeatingNetwork.Sources.SourcePressure source(use_in_p0 = true, use_in_T0 = true, p0 = pin_start_S1, T0 = Tin_start_S1, R = 1e-3) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-14, 60})));
  DistrictHeatingNetwork.Sources.SinkPressure sink(use_in_p0 = true, p0 = pout_start_S1, T0 = Tout_start_S1, R = 1e-3) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {64, 88})));
  Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table = Tout_SP) annotation (
    Placement(transformation(extent = {{-68, -12}, {-56, 0}})));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table = {1e6}, startValue = true) "Input to decide whether or nor the gas boiler is working" annotation (
    Placement(transformation(extent = {{-68, -30}, {-56, -18}})));
  Modelica.Blocks.Sources.TimeTable TT101_profile(table = [ts, TTi]) annotation (
    Placement(transformation(extent = {{-46, 48}, {-34, 60}})));
  Modelica.Blocks.Sources.TimeTable PT101_profile(table = [ts, PTi]) annotation (
    Placement(transformation(extent = {{-46, 66}, {-34, 78}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table = [ts, thetav]) annotation (
    Placement(transformation(extent = {{-88, 8}, {-76, 20}})));
  Modelica.Blocks.Sources.TimeTable P101_omega(table = [ts, omega]) annotation (
    Placement(transformation(extent = {{-88, 26}, {-76, 38}})));
  Modelica.Blocks.Sources.TimeTable PT102_profile(table = [ts, PTo]) annotation (
    Placement(transformation(extent = {{92, 78}, {80, 90}})));
  Modelica.Blocks.Sources.TimeTable m_flow_ref(table = [ts, m_flow_approx]) annotation (
    Placement(transformation(extent = {{44, 50}, {56, 62}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_m_flow annotation (
    Placement(transformation(extent = {{66, 26}, {78, 38}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex valT annotation (
    Placement(transformation(extent = {{66, 12}, {78, 0}})));
  Modelica.Blocks.Sources.TimeTable Tout_ref(table = [ts, TTo]) annotation (
    Placement(transformation(extent = {{42, -18}, {54, -6}})));
  inner MultiEnergySystem.System system annotation (
    Placement(transformation(extent = {{-100, 80}, {-80, 100}})));
  Modelica.Blocks.Continuous.FirstOrder lowPassomega(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = omega[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 26}, {-56, 38}})));
  Modelica.Blocks.Continuous.FirstOrder lowPasstheta(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = thetav[1, 1]) annotation (
    Placement(transformation(extent = {{-68, 8}, {-56, 20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(redeclare model Medium = Medium, use_in_m_flow = true, pin_start = pout_start_S1, p0 = pout_start_S1, T0 = Tout_start_S1, m_flow0 = m_flow_approx[1, 1], G = 1e-8) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {10, 62})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (
    Placement(transformation(extent = {{74, 52}, {86, 64}})));
  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-2, -60})));
  Modelica.Blocks.Sources.TimeTable m_flowgas_ref(table = [ts, m_flow_Gas]) annotation (
    Placement(transformation(extent = {{40, -46}, {52, -34}})));
  DistrictHeatingNetwork.Utilities.ASHRAEIndex val_m_flow_fuel annotation (
    Placement(transformation(extent = {{66, -56}, {78, -44}})));
  Modelica.Blocks.Sources.RealExpression m_flow_gas_sim(y = gasBoiler.inletFuel.m_flow) annotation (
    Placement(transformation(extent = {{34, -70}, {54, -50}})));
  Modelica.Blocks.Math.Max max1 annotation (
    Placement(transformation(extent = {{30, -94}, {50, -74}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = 1e-6) annotation (
    Placement(transformation(extent = {{-10, -102}, {10, -82}})));
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
  final parameter Real m_flow_Gas[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixmflowGas, dim[1], dim[2])/3600;
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
  final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1, 1];
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1, 1];
equation
  connect(source.outlet, gasBoiler.inlet) annotation (
    Line(points = {{-14, 50}, {-12.92, 50}, {-12.92, 32.2}}, color = {140, 56, 54}, thickness = 0.5));
  connect(PT102_profile.y, sink.in_p0) annotation (
    Line(points = {{79.4, 84}, {72.4, 84}}, color = {0, 0, 127}));
  connect(TT101_profile.y, source.in_T0) annotation (
    Line(points = {{-33.4, 54}, {-30, 54}, {-30, 56}, {-22.4, 56}}, color = {0, 0, 127}));
  connect(PT101_profile.y, source.in_p0) annotation (
    Line(points = {{-33.4, 72}, {-30, 72}, {-30, 64}, {-22.4, 64}}, color = {0, 0, 127}));
  connect(GB101_ToutSP.y, gasBoiler.Toutset) annotation (
    Line(points = {{-55.4, -6}, {-48, -6}, {-48, 8.4}, {-32.8, 8.4}}, color = {0, 0, 127}));
  connect(GB101_Status.y, gasBoiler.status) annotation (
    Line(points = {{-55.4, -24}, {-44, -24}, {-44, 2.8}, {-32.8, 2.8}}, color = {255, 0, 255}));
  connect(gasBoiler.m_flow_, val_m_flow.u_sim) annotation (
    Line(points = {{28.8, 19.6}, {52, 19.6}, {52, 29}, {64.8, 29}}, color = {0, 0, 127}));
  connect(Tout_ref.y, valT.u_meas) annotation (
    Line(points = {{54.6, -12}, {60, -12}, {60, 3}, {64.8, 3}}, color = {0, 0, 127}));
  connect(gasBoiler.TTout, valT.u_sim) annotation (
    Line(points = {{28.8, 8.4}, {52, 8.4}, {52, 9}, {64.8, 9}}, color = {0, 0, 127}));
  connect(P101_omega.y, lowPassomega.u) annotation (
    Line(points = {{-75.4, 32}, {-69.2, 32}}, color = {0, 0, 127}));
  connect(lowPassomega.y, gasBoiler.omega) annotation (
    Line(points = {{-55.4, 32}, {-48, 32}, {-48, 19.6}, {-32.8, 19.6}}, color = {0, 0, 127}));
  connect(FCV101_theta.y, lowPasstheta.u) annotation (
    Line(points = {{-75.4, 14}, {-69.2, 14}}, color = {0, 0, 127}));
  connect(lowPasstheta.y, gasBoiler.theta) annotation (
    Line(points = {{-55.4, 14}, {-32.8, 14}}, color = {0, 0, 127}));
  connect(val_pout.u_meas, sink.in_p0) annotation (
    Line(points = {{72.8, 61}, {68, 61}, {68, 72}, {78, 72}, {78, 82}, {76, 84}, {72.4, 84}}, color = {0, 0, 127}));
  connect(gasBoiler.PTout, val_pout.u_sim) annotation (
    Line(points = {{28.8, -2.8}, {38, -2.8}, {38, 44}, {68, 44}, {68, 55}, {72.8, 55}}, color = {0, 0, 127}));
  connect(gasBoiler.outlet, sinkMassFlow.inlet) annotation (
    Line(points = {{9.48, 32.2}, {9.48, 42.1}, {10, 42.1}, {10, 52}}, color = {140, 56, 54}, thickness = 0.5));
  connect(sourceGas.outlet, gasBoiler.inletFuel) annotation (
    Line(points = {{-2, -50}, {-2, -41.24}, {-2, -41.24}, {-2, -32.48}}, color = {182, 109, 49}, thickness = 0.5));
  connect(m_flowgas_ref.y, val_m_flow_fuel.u_meas) annotation (
    Line(points = {{52.6, -40}, {60, -40}, {60, -47}, {64.8, -47}}, color = {0, 0, 127}));
  connect(m_flow_gas_sim.y, max1.u1) annotation (
    Line(points = {{55, -60}, {58, -60}, {58, -64}, {22, -64}, {22, -78}, {28, -78}}, color = {0, 0, 127}));
  connect(max1.y, val_m_flow_fuel.u_sim) annotation (
    Line(points = {{51, -84}, {64.8, -84}, {64.8, -53}}, color = {0, 0, 127}));
  connect(realExpression.y, max1.u2) annotation (
    Line(points = {{11, -92}, {11, -90}, {28, -90}}, color = {0, 0, 127}));
  connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (
    Line(points = {{56.6, 56}, {58, 56}, {58, 58}, {60, 58}, {60, 72}, {20, 72}, {20, 56}, {15, 56}}, color = {0, 0, 127}));
  connect(val_m_flow.u_meas, val_m_flow.u_sim) annotation (
    Line(points = {{64.8, 35}, {54, 35}, {54, 29}, {64.8, 29}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 4000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestBase;
