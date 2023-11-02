within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test3Pipes_A "Base test model of a two pipes (Flow1DFV) in series with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model MediumPipes =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumBoundaries =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;


  parameter Types.MassFraction Xref[:] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X "Nominal mass fraction";
  //parameter Types.MassFraction Xref_2[:] = {0.97201, 0.01862, 0.00393, 0, 0, 0.00544, 0};
  parameter Types.MassFraction Xref_2[:] = {0.972, 0.018, 0.003, 0.001, 0.001, 0.005, 0};
  //parameter Types.MassFraction Xref_2[:] = H2GasFacility.Data.MassMolFractionData.NG_Guzzo_Russian.X;
  parameter Types.MassFlowRate m_flow_start = Pipe.pipe1.m_flow_start "Initial mass flowrate in the sink";
  parameter Integer n = 5 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Boolean quasiStatic = false;
  parameter Boolean constantFrictionFactor = true;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
  parameter Real dp_small = 1e-5;
  // Components
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium =
        MediumBoundaries,                                                                 T0(displayUnit = "K") = 293.15, X0 = Xref, p0 = pin_start, use_in_T0 = true, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(G = 0, redeclare model Medium =
        MediumBoundaries,                                                                   T0(displayUnit = "K") = 288.15 + 5,
    X0=Xref_2,                                                                                                                             m_flow0 = m_flow_start,
    p0=48000,
    pin_start=48000,                                                                                                                                                                              use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 50, height = -m_flow_start*2.5, offset = m_flow_start, startTime = 50) annotation (
    Placement(visible = true, transformation(origin = {26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 0, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin = {-86, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50, height = 1000*0, offset = pin_start, startTime = 200) annotation (
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, redeclare
      model                                                                                                              Medium =
        MediumPipes,                                                                                                                           Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, momentum = momentum, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, rho_nom = Pipe.pipe1.rho_nom, quasiStatic = quasiStatic, constantFrictionFactor = constantFrictionFactor, hctype = hctype, dp_small = dp_small) annotation (
    Placement(visible = true, transformation(origin = {-28, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, redeclare
      model                                                                                                              Medium =
        MediumPipes,                                                                                                                           Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, momentum = momentum, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, rho_nom = Pipe.pipe1.rho_nom, quasiStatic = quasiStatic, constantFrictionFactor = constantFrictionFactor, hctype = hctype, dp_small = dp_small) annotation (
    Placement(visible = true, transformation(origin = {38, 0}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, redeclare
      model                                                                                                              Medium =
        MediumPipes,                                                                                                                           Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, constantFrictionFactor = constantFrictionFactor, dp_small = dp_small, hctype = hctype, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, momentum = momentum, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, quasiStatic = quasiStatic, rho_nom = Pipe.pipe1.rho_nom) annotation (
    Placement(visible = true, transformation(origin = {6, -50}, extent = {{22, -22}, {-22, 22}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare
      model                                                                       Medium =
        MediumBoundaries,                                                                                    R = 0, T0(displayUnit = "K") = 293.15, X0 = Xref_2, p0 = pin_start, use_in_T0 = true, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin = {-20, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in3(duration = 20, height = 0, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin = {-60, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in3(duration = 50, height = 0.5e5, offset = pin_start, startTime = 150) annotation (
    Placement(visible = true, transformation(origin = {-62, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow.y, sink.in_m_flow0) annotation (
    Line(points = {{37, 38}, {84, 38}, {84, 5}}, color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation (
    Line(points = {{-75, 20}, {-72, 20}, {-72, 8.4}}, color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation (
    Line(points = {{-75, 52}, {-68, 52}, {-68, 9.6}}, color = {0, 0, 127}));
  connect(sourceP.outlet, pipe1.inlet) annotation (
    Line(points = {{-58, 0}, {-50, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(pipe1.outlet, pipe2.inlet) annotation (
    Line(points = {{-6, 0}, {16, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(pipe2.outlet, sink.inlet) annotation (
    Line(points = {{60, 0}, {80, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(T_in3.y, sourceP1.in_T0) annotation (
    Line(points = {{-49, -58}, {-20, -58}, {-20, -86.4}}, color = {0, 0, 127}));
  connect(p_in3.y, sourceP1.in_p0) annotation (
    Line(points = {{-51, -86}, {-30, -86}, {-30, -87.6}, {-24, -87.6}}, color = {0, 0, 127}));
  connect(sourceP1.outlet, pipe3.inlet) annotation (
    Line(points = {{-10, -96}, {-2, -96}, {-2, -92}, {6, -92}, {6, -72}}, color = {182, 109, 49}, thickness = 0.5));
  connect(pipe3.outlet, pipe2.inlet) annotation (
    Line(points = {{6, -28}, {6, 0}, {16, 0}}, color = {182, 109, 49}, thickness = 0.5));
  annotation (
    experiment(StopTime = 280, Interval = 0.0392047, Tolerance = 1e-06, StartTime = 0));
end Test3Pipes_A;
