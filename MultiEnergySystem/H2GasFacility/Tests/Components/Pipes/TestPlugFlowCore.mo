within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestPlugFlowCore
  "Base test model of a single pipe (Flow1DFV) with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay                        constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Types.MassFraction Xref[:] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X "Nominal mass fraction";
  parameter Types.MassFraction Xref_2[:] = {0.97201, 0.01862, 0.00393, 0, 0, 0.00544, 0};
  parameter Types.MassFlowRate m_flow_start = Pipe.pipe1.m_flow_start "Initial mass flowrate in the sink";
  parameter Integer n = 3 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  // Components
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(Di = Pipe.pipe1.Di, H = 1e-4, L = Pipe.pipe1.L, redeclare
      model Medium =                                                                                                                            Medium, Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, allowFlowReversal = true, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kappa = kappa, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, momentum = momentum, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, quasiStatic = false, rho_nom = Pipe.pipe1.rho_nom) annotation (
    Placement(visible = true, transformation(origin={6,28},             extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 293.15, X0 = Xref, p0 = pin_start, use_in_T0 = true, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin={-50,28},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(G = 0, redeclare model Medium = Medium, T0(displayUnit = "K") = 298.15, X0 = Xref_2, m_flow0 = m_flow_start, p0 = 49000, pin_start = 49000, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin={64,28},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100, height = -m_flow_start*2, offset = m_flow_start, startTime = 75) annotation (
    Placement(visible = true, transformation(origin={42,66},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 0, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin={-88,72},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50, height = 1000*0, offset = pin_start, startTime = 200) annotation (
    Placement(visible = true, transformation(origin={-88,42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass.PlugFlowCore
    plugFlowCore(
    allowFlowReversal=true,
    L=Pipe.pipe1.L,
    H=1e-4,
    T_ext=system.T_amb,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    rho_nom=Pipe.pipe1.rho_nom)
    annotation (Placement(transformation(extent={{-16,-88},{28,-44}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure
                                       sourceP1(
    redeclare model Medium = Medium,
    T0=293.15,
    X0=Xref,
    p0=pin_start,
    use_in_T0=true,
    use_in_p0=true)                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-46,-66},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in1(
    duration=50,
    height=1000*0,
    offset=pin_start,
    startTime=200)                                                                                       annotation (
    Placement(visible = true, transformation(origin={-88,-54},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in1(
    duration=20,
    height=0,
    offset=15 + 273.15,
    startTime=150)                                                                                    annotation (
    Placement(visible = true, transformation(origin={-88,-18},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow
                                     sink1(
    G=0,
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 298.15,
    X0=Xref_2,
    m_flow0=m_flow_start,
    p0=49000,
    pin_start=49000,
    use_in_m_flow0=true)                                                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={64,-66},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow1(
    duration=100,
    height=-m_flow_start*2,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={32,-32},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP.outlet, roundPipe.inlet) annotation (
    Line(points={{-40,28},{-16,28}},    color = {182, 109, 49}));
  connect(roundPipe.outlet, sink.inlet) annotation (
    Line(points={{28,28},{54,28}},    color = {182, 109, 49}));
  connect(m_flow.y, sink.in_m_flow0) annotation (
    Line(points={{53,66},{58,66},{58,33}},       color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation (
    Line(points={{-77,42},{-54,42},{-54,36.4}},       color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation (
    Line(points={{-77,72},{-50,72},{-50,37.6}},       color = {0, 0, 127}));
  connect(sourceP1.outlet, plugFlowCore.inlet) annotation (Line(
      points={{-36,-66},{-16,-66}},
      color={182,109,49},
      thickness=0.5));
  connect(p_in1.y, sourceP1.in_p0) annotation (Line(points={{-77,-54},{-50,-54},
          {-50,-57.6}}, color={0,0,127}));
  connect(T_in1.y, sourceP1.in_T0) annotation (Line(points={{-77,-18},{-64,-18},
          {-64,-36},{-46,-36},{-46,-56.4}}, color={0,0,127}));
  connect(plugFlowCore.outlet, sink1.inlet) annotation (Line(
      points={{28,-66},{54,-66}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow1.y, sink1.in_m_flow0)
    annotation (Line(points={{43,-32},{58,-32},{58,-61}}, color={0,0,127}));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0));
end TestPlugFlowCore;
