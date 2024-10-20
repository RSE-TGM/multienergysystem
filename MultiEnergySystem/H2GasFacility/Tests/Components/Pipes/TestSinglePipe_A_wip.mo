within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_A_wip
  "Base test model of a single pipe (Flow1DFV) with a pressure source & mass flowrate sink"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2 constrainedby
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
  H2GasFacility.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = 293.15, X0 = Xref, p0 = pin_start, use_in_T0 = true, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin={-56,-10},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  H2GasFacility.Sources.SinkMassFlow sink(
    G=1,                                         redeclare model Medium = Medium, T0(displayUnit = "K") = 298.15, X0 = Xref_2, m_flow0 = m_flow_start,
    p0=49000,
    pin_start=49000,                                                                                                                                                                  use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin={74,-10},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(duration = 100,
    height=-m_flow_start*0,                                                     offset = m_flow_start, startTime = 75) annotation (
    Placement(visible = true, transformation(origin = {26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 0, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin = {-86, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in(duration = 50, height = 1000*0, offset = pin_start, startTime = 200) annotation (
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip round1DFV_wip(
    L=Pipe.pipe1.L,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    constantFrictionFactor=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    rho_nom=Pipe.pipe1.rho_nom,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{0,-18},{20,2}})));

equation
  connect(m_flow.y, sink.in_m_flow0) annotation (
    Line(points={{37,38},{68,38},{68,-5}},       color = {0, 0, 127}));
  connect(p_in.y, sourceP.in_p0) annotation (
    Line(points={{-75,20},{-60,20},{-60,-1.6}},       color = {0, 0, 127}));
  connect(T_in.y, sourceP.in_T0) annotation (
    Line(points={{-75,52},{-56,52},{-56,-0.4}},       color = {0, 0, 127}));
  connect(sourceP.outlet, round1DFV_wip.inlet) annotation (Line(
      points={{-46,-10},{-44,-10},{-44,-8},{0,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(round1DFV_wip.outlet, sink.inlet) annotation (Line(
      points={{20,-8},{22,-8},{22,-10},{64,-10}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0),
      Documentation(info="<html>
<p>This test doesn&apos;t wotk because there is a conflict in giving the m_flow at the outlet. </p>
</html>"));
end TestSinglePipe_A_wip;
