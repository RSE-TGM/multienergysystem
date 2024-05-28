within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_C_wip
  "Base test model of a single pipe (Flow1DFV) with a mass flowrate sink & a pressure source"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2 constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Types.MassFraction Xref[:] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X "Nominal mass fraction";
  parameter Types.MassFraction Xref_2[:] = {0.97201, 0.01862, 0.00393, 0, 0, 0.00544, 0};
  parameter Types.MassFlowRate m_flow_start = Pipe.pipe1.m_flow_start "Initial mass flowrate in the sink";
  parameter Integer n = 10 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  // Components
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
<<<<<<< Updated upstream
  Modelica.Blocks.Sources.Ramp T_in(duration = 20, height = 0, offset = 15 + 273.15, startTime = 150) annotation (
    Placement(visible = true, transformation(origin={-74,26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
=======
>>>>>>> Stashed changes
  Modelica.Blocks.Sources.Ramp m_flow_in(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-74,-4},
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
    n=n,
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
    Placement(visible = true, transformation(origin={32,18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
    p0=Pipe.pipe1.pin_start,
    T0=Pipe.pipe1.Tin_start,
    redeclare model Medium = Medium,
    X0=Xref,
    m_flow0=m_flow_start,
    G=0,
    use_in_m_flow0=true,
<<<<<<< Updated upstream
    use_in_T0=true)
    annotation (Placement(transformation(extent={{-42,-18},{-22,2}})));
=======
    use_in_T0=false)
    annotation (Placement(transformation(extent={{-58,-18},{-38,2}})));
>>>>>>> Stashed changes
equation
  connect(round1DFV_wip.outlet, sinkPressure.inlet) annotation (Line(
      points={{12,-8},{48,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(p_out.y, sinkPressure.in_p0) annotation (Line(points={{43,18},{54,18},
          {54,0.4}},               color={0,0,127}));
  connect(sourceMassFlow.outlet, round1DFV_wip.inlet) annotation (Line(
      points={{-22,-8},{-8,-8}},
      color={182,109,49},
      thickness=0.5));
<<<<<<< Updated upstream
  connect(sourceMassFlow.in_m_flow0, m_flow_in.y) annotation (Line(points={{-38,-3},
          {-40,-3},{-40,-4},{-63,-4}},     color={0,0,127}));
  connect(T_in.y, sourceMassFlow.in_T0)
    annotation (Line(points={{-63,26},{-32,26},{-32,-3}}, color={0,0,127}));
=======
  connect(sourceMassFlow.in_m_flow0, m_flow_in.y) annotation (Line(points={{-54,
          -3},{-68,-3},{-68,20},{-75,20}}, color={0,0,127}));
>>>>>>> Stashed changes
  annotation (
    experiment(
      StopTime=100,
      Interval=0.0350042,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>This test doesn&apos;t wotk because there is a conflict in giving the pressure at the inlet and the m_flow at the outlet. </p>
</html>"));
end TestSinglePipe_C_wip;
