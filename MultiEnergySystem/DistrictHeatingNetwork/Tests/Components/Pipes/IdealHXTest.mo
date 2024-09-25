within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model IdealHXTest
   parameter Real Tout_hot_set = 65 + 273.15;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.HeatExchangerIdealTemperatureControl
    HX(
    Tout_hot_set=Tout_hot_set,
    hin_start_hot=1e5,
    hout_start_hot=1e5,
    hin_start_cold=1e5,
    hout_start_cold=1e5,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_hot=BPHE.E701.pout_start_hot,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pout_start_cold=BPHE.E701.pout_start_cold,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold)
    annotation (Placement(transformation(extent={{-32,-28},{12,16}})));
  Sources.SinkMassFlow                                          sinkCold_E701(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold)                                                                                                                                                                                    annotation (
    Placement(visible = true, transformation(origin={-55,27},    extent = {{13, -13}, {-13, 13}}, rotation=-90)));
  Sources.SourcePressure                                          sourceCold_E701(T0=BPHE.E701.Tin_start_cold,
      p0=BPHE.E701.pin_start_cold)                                                                                                              annotation (
    Placement(visible = true, transformation(origin={40,28},      extent = {{-10, -10}, {10, 10}}, rotation=-90)));
  Sources.SinkMassFlow                                          sinkHot_E701(
    T0=BPHE.E701.Tout_start_hot,
    m_flow0=BPHE.E701.m_flow_start_hot,
    p0=BPHE.E701.pout_start_hot,
    pin_start=BPHE.E701.pout_start_hot)                                                                                                                                                                                annotation (
    Placement(visible = true, transformation(origin={37,-45},     extent = {{-13, -13}, {13, 13}}, rotation=-90)));
  Sources.SourcePressure                                          sourceHot_E701(T0=BPHE.E701.Tin_start_hot,
      p0=BPHE.E701.pin_start_hot)                                                                                                            annotation (
    Placement(visible = true, transformation(origin={-54,-40},   extent = {{10, -10}, {-10, 10}}, rotation=-90)));
equation
  connect(sourceCold_E701.outlet, HX.incold) annotation (Line(
      points={{40,18},{40,2.8},{12,2.8}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot_E701.outlet, HX.inhot) annotation (Line(
      points={{-54,-30},{-56,-30},{-56,-14.8},{-32,-14.8}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot_E701.inlet, HX.outhot) annotation (Line(
      points={{37,-32},{37,-14.8},{12,-14.8}},
      color={140,56,54},
      thickness=0.5));
  connect(HX.outcold, sinkCold_E701.inlet) annotation (Line(
      points={{-32,2.8},{-44,2.8},{-44,6},{-55,6},{-55,14}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end IdealHXTest;
