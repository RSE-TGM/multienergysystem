within MultiEnergySystem.H2GasFacility.Tests.Components.Storage;
model TestLumpedStorageConstantMass
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
  Modelica.Blocks.Sources.Ramp m_flow1(
    duration=100,
    height=-2*m_flow_start,
    offset=m_flow_start,
    startTime=75)                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-81,23},   extent={{-9,-9},
            {9,9}},                                                                              rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceMassFlow(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 298.15,
    X0=Xref_2,
    m_flow0=m_flow_start,
    p0=500000,
      use_in_m_flow0=true)
    annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 308.15,
    X0=Xref_2,
    p0=495000,
    computeTransport=false)
    annotation (Placement(transformation(extent={{64,0},{84,20}})));
  MultiEnergySystem.H2GasFacility.Components.Storage.LumpedStorageConstantMass
    lumpedStorageConstantMass(
    allowFlowReversal=true,
    H=10,
    X_start=Xref_2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-14})));
equation
  connect(m_flow1.y, sourceMassFlow.in_m_flow0) annotation (Line(points={{-71.1,
          23},{-46,23},{-46,15}},         color={0,0,127}));
  connect(sourceMassFlow.outlet, lumpedStorageConstantMass.inlet) annotation (
      Line(
      points={{-30,10},{4,10},{4,-24},{12,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(lumpedStorageConstantMass.outlet, sinkPressure.inlet) annotation (
      Line(
      points={{12,-4},{12,10},{64,10}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    experiment(StopTime = 250, Interval = 0.0350042, Tolerance = 1e-06, StartTime = 0));
end TestLumpedStorageConstantMass;
