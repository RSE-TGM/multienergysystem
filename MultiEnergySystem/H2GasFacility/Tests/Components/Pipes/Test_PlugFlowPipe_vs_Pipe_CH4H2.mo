within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_PlugFlowPipe_vs_Pipe_CH4H2
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
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    D=Pipe.pipe1.Di,
    rho_nom=Pipe.pipe1.rho_nom,
    cpm=8000) annotation (Placement(transformation(extent={{-6,-46},{38,-2}})));
  Modelica.Blocks.Sources.Ramp m_flow1(
    duration=100,
    height=m_flow_start,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-81,-19},  extent={{-9,-9},
            {9,9}},                                                                              rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 298.15,
    X0=X_start,
    m_flow0=m_flow_start,
    p0=49500,
      use_in_m_flow0=true)
    annotation (Placement(transformation(extent={{-50,-34},{-30,-14}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 308.15,
    X0=X_start,
    p0=49500)
    annotation (Placement(transformation(extent={{64,-34},{84,-14}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV roundPipe(
    X_start=X_start,
    Di=Pipe.pipe1.Di,
    L=Pipe.pipe1.L,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    pin_nom=Pipe.pipe1.pin_start,
    rho_nom=Pipe.pipe1.rho_nom,
    k=Pipe.pipe1.k,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    H=0,
    redeclare model Medium = Medium,
    allowFlowReversal=true,
    hin_start=Pipe.pipe1.hin_start,
    kappa=kappa,
    kc=1,
    momentum=momentum,
    n=n,
    quasiStatic=false)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={16,38},            extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow2(
    duration=100,
    height=m_flow_start,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-77,43},   extent={{-9,-9},
            {9,9}},                                                                              rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow1(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 298.15,
    X0=X_start,
    m_flow0=m_flow_start,
    p0=49500,
    use_in_m_flow0=true)
    annotation (Placement(transformation(extent={{-46,28},{-26,48}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure1(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 308.15,
    X0=X_start,
    p0=49500)
    annotation (Placement(transformation(extent={{58,28},{78,48}})));
equation
  connect(sourceMassFlow.outlet, plugFlow.inlet) annotation (Line(
      points={{-30,-24},{-6,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(sinkPressure.inlet, plugFlow.outlet) annotation (Line(
      points={{64,-24},{38,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow1.y, sourceMassFlow.in_m_flow0) annotation (Line(points={{-71.1,
          -19},{-46,-19}},                color={0,0,127}));
  connect(m_flow2.y, sourceMassFlow1.in_m_flow0)
    annotation (Line(points={{-67.1,43},{-42,43}}, color={0,0,127}));
  connect(sourceMassFlow1.outlet, roundPipe.inlet) annotation (Line(
      points={{-26,38},{-6,38}},
      color={182,109,49},
      thickness=0.5));
  connect(roundPipe.outlet, sinkPressure1.inlet) annotation (Line(
      points={{38,38},{58,38}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0));
end Test_PlugFlowPipe_vs_Pipe_CH4H2;
