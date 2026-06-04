within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test3Pipes_B
  "Base test model of a two pipes (Flow1DFV) in series with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model MediumPipes =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumBoundaries =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;

  parameter Types.MassFraction Xref[:] = {0.972, 0.018, 0.003, 0.001, 0.001, 0.005, 0};
  parameter Types.MassFlowRate m_flow_start = 0.1 "Initial mass flowrate in the sink";
  parameter Integer n = 9 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = 1.5e5 "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = 15+273 "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter Boolean massFractionDynamicBalance = true;
  parameter Boolean constantFrictionFactor = true;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
  parameter Real dp_small = 1e-5;
  // Components
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium =
        MediumBoundaries,
    T0(displayUnit="K") = Tin_start,
    X0=Xref,                                                                                                                         p0 = pin_start,
    R=1e-3,
    use_in_T0=false,                                                                                                                                                   use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(G = 0, redeclare model Medium =
        MediumBoundaries,
    T0(displayUnit="K") = Tin_start,
    X0=Xref,
    m_flow0=m_flow_start,
    p0=pin_start,
    pin_start=pin_start,                                                                                                                                                                          use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 50,
    height=0.5*m_flow_start,                                                     offset = m_flow_start, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={68,26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50,
    height=0.1*pin_start,                                           offset = pin_start, startTime = 200) annotation (
    Placement(visible = true, transformation(origin={-88,26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(
    Di=0.16,
    L=200,                                                                                               redeclare
      model Medium =
        MediumPipes,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    X_start=Xref,                                                                                                                                                                                                        hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1,
    m_flow_start=m_flow_start,                                                                                                                                                                                                        n = n,
    pin_start=pin_start,
    pout_start=pin_start,
    rho_nom=0.35,                                                                                                                                                                                                        massFractionDynamicBalance = massFractionDynamicBalance, constantFrictionFactor = constantFrictionFactor,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,                                                                                                                                                                                                        dp_small = dp_small) annotation (
    Placement(visible = true, transformation(origin = {-28, 2.22045e-16}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(
    Di=0.16,
    L=200,                                                                                               redeclare
      model Medium =
        MediumPipes,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    X_start=Xref,                                                                                                                                                                                                        hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1,
    m_flow_start=m_flow_start,                                                                                                                                                                                                        n = n,
    pin_start=pin_start,
    pout_start=pin_start,
    rho_nom=0.35,
    massFractionDynamicBalance = false,
    constantFrictionFactor=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,                                                                                                                                                                                                        dp_small = dp_small) annotation (
    Placement(visible = true, transformation(origin = {38, 0}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(
    Di=0.16,
    L=200,                                                                                               redeclare
      model Medium =
        MediumPipes,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    X_start=Xref,
    constantFrictionFactor=true,                                                                                                                                                                                                        dp_small = dp_small,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,                                                                                                                                                                                                        hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1,
    m_flow_start=m_flow_start,                                                                                                                                                                                                        n = n,
    pin_start=pin_start,
    pout_start=pin_start,
    massFractionDynamicBalance = false,
    rho_nom=0.35)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={6,-48},    extent = {{22, -22}, {-22, 22}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare
      model Medium =
        MediumBoundaries,
    R=1e-3,
    T0(displayUnit="K") = Tin_start,
    X0=Xref,                                                                                                                                                     p0 = pin_start,
    use_in_T0=false,
    use_in_p0=false)                                                                                                                                                                                                 annotation (
    Placement(visible = true, transformation(origin={-20,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow.y, sink.in_m_flow0) annotation (
    Line(points={{79,26},{84,26},{84,5}},        color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation (
    Line(points={{-77,26},{-72,26},{-72,8.4}},        color = {0, 0, 127}));
  connect(sourceP.outlet, pipe1.inlet) annotation (
    Line(points = {{-58, 0}, {-50, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(pipe1.outlet, pipe2.inlet) annotation (
    Line(points = {{-6, 0}, {16, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(pipe2.outlet, sink.inlet) annotation (
    Line(points = {{60, 0}, {80, 0}}, color = {182, 109, 49}, thickness = 0.5));
  connect(sourceP1.outlet, pipe3.inlet) annotation (
    Line(points={{-10,-86},{6,-86},{6,-70}},                              color = {182, 109, 49}, thickness = 0.5));
  connect(pipe3.outlet, pipe2.inlet) annotation (
    Line(points={{6,-26},{6,0},{16,0}},        color = {182, 109, 49}, thickness = 0.5));
  annotation (
    experiment(
      StopTime=500,
      Interval=0.0392047,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Test3Pipes_B;
