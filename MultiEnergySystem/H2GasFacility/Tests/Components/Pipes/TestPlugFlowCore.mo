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
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass.PlugFlowCore
    plugFlowCore(
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
    rho_nom=Pipe.pipe1.rho_nom)
    annotation (Placement(transformation(extent={{-6,-46},{38,-2}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure
                                       sourceP1(
    redeclare model Medium = Medium,
    T0=293.15,
    X0=Xref,
    p0=pin_start,
    R=1,
    use_in_T0=true,
    use_in_p0=true)                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-42,38},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp p_in1(
    duration=50,
    height=1000*0,
    offset=pin_start,
    startTime=200)                                                                                       annotation (
    Placement(visible = true, transformation(origin={-84,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp T_in1(
    duration=20,
    height=0,
    offset=15 + 273.15,
    startTime=150)                                                                                    annotation (
    Placement(visible = true, transformation(origin={-84,86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow
                                     sink1(
    G=1,
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 308.15,
    X0=Xref_2,
    m_flow0=m_flow_start,
    p0=49500,
    pin_start=49500,
    use_in_m_flow0=false)                                                                                                                                                                                    annotation (
    Placement(visible = true, transformation(origin={80,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow1(
    duration=100,
    height=-m_flow_start*2,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-81,-19},  extent={{-9,-9},
            {9,9}},                                                                              rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 298.15,
    X0=Xref_2,
    m_flow0=m_flow_start,
    p0=49500,
      use_in_m_flow0=true)
    annotation (Placement(transformation(extent={{-50,-34},{-30,-14}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 308.15,
    X0=Xref_2,
    p0=49500)
    annotation (Placement(transformation(extent={{64,-34},{84,-14}})));
equation
  connect(p_in1.y, sourceP1.in_p0) annotation (Line(points={{-73,50},{-46,50},{
          -46,46.4}},   color={0,0,127}));
  connect(T_in1.y, sourceP1.in_T0) annotation (Line(points={{-73,86},{-60,86},{
          -60,68},{-42,68},{-42,47.6}},     color={0,0,127}));
  connect(sourceMassFlow.outlet, plugFlowCore.inlet) annotation (Line(
      points={{-30,-24},{-6,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(sinkPressure.inlet, plugFlowCore.outlet) annotation (Line(
      points={{64,-24},{38,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow1.y, sourceMassFlow.in_m_flow0) annotation (Line(points={{-71.1,
          -19},{-46,-19}},                color={0,0,127}));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0));
end TestPlugFlowCore;
