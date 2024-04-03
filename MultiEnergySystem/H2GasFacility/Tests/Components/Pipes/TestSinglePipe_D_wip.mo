within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_D_wip
  "Base test model of a single pipe (Flow1DFV) with a pressure sink and two mass flow sources with different gas composition"
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
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_in(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-84,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
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
    constantFrictionFactor=false,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    rho_nom=Pipe.pipe1.rho_nom,
    n=5,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{-8,-18},{12,2}})));

  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    T0(displayUnit="K") = 15 + 273.15,
    R=1,
    redeclare model Medium = Medium,
    X0=Xref,
    p0(displayUnit="Pa") = 48999.99999999999,
    use_in_p0=true)                                                                                                                                                                                                       annotation (
    Placement(transformation(extent={{48,-18},{68,2}})));
  Modelica.Blocks.Sources.Ramp p_out(
    height=0*0.3e5,
    duration=0,
    startTime=050,
    offset=0.49e5)                                                                                     annotation (
    Placement(visible = true, transformation(origin={36,44},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
    p0=Pipe.pipe1.pin_start,
    T0=Pipe.pipe1.Tin_start,
    redeclare model Medium = Medium,
    X0=Xref,
    m_flow0=m_flow_start,
    G=0,
    use_in_m_flow0=true,
    use_in_T0=false)
    annotation (Placement(transformation(extent={{-60,-4},{-40,16}})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow1(
    p0=Pipe.pipe1.pin_start,
    T0=Pipe.pipe1.Tin_start,
    redeclare model Medium = Medium,
    X0=Xref,
    m_flow0=m_flow_start,
    G=0,
    use_in_m_flow0=true,
    use_in_T0=false,
    use_in_X0=true)
    annotation (Placement(transformation(extent={{-58,-66},{-38,-46}})));
  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 50 then
        Xref else {0,0,0,0,0,0,1})
    annotation (Placement(transformation(extent={{-86,-28},{-66,-8}})));
  Modelica.Blocks.Sources.Ramp m_flow_in1(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-88,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(round1DFV_wip.outlet, sinkPressure.inlet) annotation (Line(
      points={{12,-8},{48,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(p_out.y, sinkPressure.in_p0) annotation (Line(points={{47,44},{60,44},
          {60,6},{54,6},{54,0.4}}, color={0,0,127}));
  connect(sourceMassFlow.outlet, round1DFV_wip.inlet) annotation (Line(
      points={{-40,6},{-22,6},{-22,-8},{-8,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceMassFlow.in_m_flow0, m_flow_in.y) annotation (Line(points={{-56,11},
          {-56,10},{-66,10},{-66,30},{-73,30}},
                                           color={0,0,127}));
  connect(sourceMassFlow1.outlet, round1DFV_wip.inlet) annotation (Line(
      points={{-38,-56},{-22,-56},{-22,-8},{-8,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(realExpression.y, sourceMassFlow1.in_X0)
    annotation (Line(points={{-65,-18},{-42,-18},{-42,-51}}, color={0,0,127}));
  connect(m_flow_in1.y, sourceMassFlow1.in_m_flow0)
    annotation (Line(points={{-77,-40},{-54,-40},{-54,-51}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=100,
      Interval=0.0350042,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>This test doesn&apos;t wotk because there is a conflict in giving the pressure at the inlet and the m_flow at the outlet. </p>
</html>"));
end TestSinglePipe_D_wip;
