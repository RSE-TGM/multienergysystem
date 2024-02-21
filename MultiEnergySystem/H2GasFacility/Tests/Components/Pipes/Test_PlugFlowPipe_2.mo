within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_PlugFlowPipe_2
  "Base test model of a single pipe (Flow1DFV) with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND                        constrainedby
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
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.PipePF plugFlow(
    redeclare model Medium = Medium,
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
    X_start=Xref,
    Di=Pipe.pipe1.Di,
    D=Pipe.pipe1.Di,
    T_start=Pipe.pipe1.Tin_start,
    T_start_m=Pipe.pipe1.Tin_start,
    rho_nom=Pipe.pipe1.rho_nom,
    cpm=8000) annotation (Placement(transformation(extent={{-10,-50},{34,-6}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure
                                       sourceP1(
    p0(displayUnit="Pa") = Pipe.pipe1.pin_start,
    T0=288.15,
    redeclare model Medium = Medium,
    X0=Xref,
    use_in_T0=true,
    use_in_p0=true)                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-42,-28},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in1(
    duration=10,
    height=0,
    offset=15 + 273.15,
    startTime=150)                                                                                    annotation (
    Placement(visible = true, transformation(origin={-78,24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in1(
    height=0.5e5*0.05,
    offset=0.5e5,
    duration=50,
    startTime=200)                                                                                       annotation (
    Placement(visible = true, transformation(origin={-78,-8},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow
                                     sink1(
    T0(displayUnit="degC") = 303.15,
    p0=Pipe.pipe1.pout_start,
    pin_start=Pipe.pipe1.pout_start,
    X0=Xref,
    G=0,
    redeclare model Medium = Medium,
    m_flow0=m_flow_start,
    use_in_m_flow0=true)                                                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={82,-28},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow1(
    duration=10,
    height=-m_flow_start*2,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={56,-2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(p_in1.y, sourceP1.in_p0)
    annotation (Line(points={{-67,-8},{-46,-8},{-46,-19.6}}, color={0,0,127}));
  connect(T_in1.y, sourceP1.in_T0)
    annotation (Line(points={{-67,24},{-42,24},{-42,-18.4}}, color={0,0,127}));
  connect(sourceP1.outlet, plugFlow.inlet) annotation (Line(
      points={{-32,-28},{-10,-28}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow1.y, sink1.in_m_flow0)
    annotation (Line(points={{67,-2},{76,-2},{76,-23}}, color={0,0,127}));
  connect(plugFlow.outlet, sink1.inlet) annotation (Line(
      points={{34,-28},{72,-28}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0));
end Test_PlugFlowPipe_2;
