within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence4
  extends Sequence3;
  Sources.SinkPressure sinkCold2(p0=EX721_pout_cold, T0=EX721_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={537,-201})));
  Sources.SourceMassFlow sourceCold2(
    p0=EX721_pin_cold,
    T0(displayUnit="K") = EX721_Tin_cold,
    m_flow0=m_flow_EX721_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={623,-200})));
  Sources.SinkPressure sinkCold3(p0=EX731_pout_cold, T0=EX731_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={241,-201})));
  Sources.SourceMassFlow sourceCold3(
    p0=EX731_pin_cold,
    T0(displayUnit="K") = EX731_Tin_cold,
    m_flow0=m_flow_EX731_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={327,-200})));
  Sources.SinkPressure sinkCold(p0=EX701_pout_cold, T0=EX701_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={75,-201})));
  Sources.SourceMassFlow sourceCold(
    p0=EX701_pin_cold,
    T0(displayUnit="K") = EX701_Tin_cold,
    m_flow0=m_flow_EX701_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={167,-202})));
  Sources.SourceMassFlow sourceCold1(
    p0=EX711_pin_cold,
    T0(displayUnit="K") = EX711_Tin_cold,
    m_flow0=m_flow_EX711_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={465,-200})));
  Sources.SinkPressure sinkCold1(p0=EX711_pout_cold, T0=EX711_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={387,-201})));
equation
  connect(sinkCold.inlet, EX701.outcold) annotation (Line(
      points={{85,-201},{98.7,-201},{98.7,-144.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold.outlet, EX701.incold) annotation (Line(
      points={{154,-202},{148,-202},{148,-200},{139.3,-200},{139.3,-144.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold3.inlet, EX731.outcold) annotation (Line(
      points={{251,-201},{258.7,-201},{258.7,-146.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold3.outlet, EX731.incold) annotation (Line(
      points={{314,-200},{310,-200},{310,-198},{299.3,-198},{299.3,-146.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold1.inlet, EX711.outcold) annotation (Line(
      points={{397,-201},{400.7,-201},{400.7,-147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold1.outlet, EX711.incold) annotation (Line(
      points={{452,-200},{441.3,-200},{441.3,-147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold2.inlet, EX721.outcold) annotation (Line(
      points={{547,-201},{558.7,-201},{558.7,-147.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold2.outlet, EX721.incold) annotation (Line(
      points={{610,-200},{604,-200},{604,-198},{599.3,-198},{599.3,-147.25}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Sequence4;
