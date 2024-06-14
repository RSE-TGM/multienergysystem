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
  parameter Integer n = 5 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1};
  // Components
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
      use_in_m_flow0=true,
      redeclare model Medium = Medium, p0 = Pipe.pipe1.pin_start, T0 = Pipe.pipe1.Tin_start, X0 = X_start, m_flow0 = Pipe.pipe1.m_flow_start, G = 1e-6)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(p0=49000, redeclare model Medium = Medium, T0 = 293.15, X0 = X_start, R = 1e-6)
    annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  Modelica.Blocks.Sources.Ramp m_flow_in(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-86,24},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(
    redeclare model Gas = Medium,
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
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    rho_nom=Pipe.pipe1.rho_nom,
    n=n,
    kappa=Pipe.pipe1.kappa,
    k=Pipe.pipe1.k)
    annotation (Placement(transformation(extent={{-14,-16},{20,18}})));

equation
  connect(m_flow_in.y, sourceMassFlow.in_m_flow0)
    annotation (Line(points={{-75,24},{-58,24},{-58,5}}, color={0,0,127}));
  connect(pipe1.outlet, sinkPressure.inlet) annotation (Line(
      points={{20,1},{20,0},{52,0}},
      color={182,109,49},
      thickness=0.5));
  connect(pipe1.inlet, sourceMassFlow.outlet) annotation (Line(
      points={{-14,1},{-14,0},{-42,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end TestSinglePipe_C_wip;
