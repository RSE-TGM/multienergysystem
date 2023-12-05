within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence2
  extends Sequence1(hctype = Choices.Pipe.HCtypes.Downstream);

  parameter Real EX701_q_m3h_hot = 2.5;
  parameter Types.Pressure EX701_pin_hot = 2.5e5;
  parameter Types.Pressure EX701_pout_hot = 2.4e5;
  parameter Types.Pressure FCV701_pout = 2e5;
  parameter Types.Temperature EX701_Tin_hot = 17 + 273.15;
  parameter Types.Temperature EX701_Tout_hot = 15 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 0.5;
  parameter Types.MassFlowRate m_flow_EX701_cold = 0.5*1000/3600;
  parameter Types.Pressure EX701_pin_cold = 2.2e5;
  parameter Types.Pressure EX701_pout_cold = 2e5;
  parameter Types.Temperature EX701_Tin_cold = 7 + 273.15;
  parameter Types.Temperature EX701_Tout_cold = 14 + 273.15;





  parameter Types.Length Di_S700 = 51e-3;
  parameter Types.Length t_S700 = 1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines COLD SIDE
  parameter Types.Length L_HX701_SourceOut_FCV701 = 0.6;
  parameter Types.Length L_HX711_SourceOut_FCV711 = 0.6;
  parameter Types.Length L_HX721_SourceOut_FCV721 = 0.6;
  parameter Types.Length L_HX731_SourceOut_FCV731 = 0.6;
  parameter Types.Length h_HX701_SourceOut_FCV701 = 0;
  parameter Types.Length h_HX711_SourceOut_FCV711 = 0;
  parameter Types.Length h_HX721_SourceOut_FCV721 = 0;
  parameter Types.Length h_HX731_SourceOut_FCV731 = 0;

  parameter Types.Length L_FCV701_FT701 = 2.50;
  parameter Types.Length h_FCV701_FT701 = 2.50;
  parameter Types.Length L_FCV711_FT711 = 2.50;
  parameter Types.Length h_FCV711_FT711 = 2.50;
  parameter Types.Length L_FCV721_FT721 = 2.50;
  parameter Types.Length h_FCV721_FT721 = 2.50;
  parameter Types.Length L_FCV731_FT731 = 2.25;
  parameter Types.Length h_FCV731_FT731 = 2.25;

  parameter Types.Length L_FT701_rackL2L3 = 5.2 + 5 + 1;
  parameter Types.Length h_FT701_rackL2L3 = -1;
  parameter Types.Length L_FT711_rackL3L4 = 1 + 0.7 + 5 + 9.2 + 1;
  parameter Types.Length h_FT711_rackL3L4 = -1;
  parameter Types.Length L_FT721_rackL4L5 = 1 + 2 + 5 + 9 + 1 + 1;
  parameter Types.Length h_FT721_rackL4L5 = -1;
  parameter Types.Length L_FT731_rackL6L7 = 1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter Types.Length h_FT731_rackL6L7 = -0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
  parameter Types.Length L_HX701_TT702_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX711_TT712_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX721_TT722_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length L_HX731_TT732_SourceIn = 1.5 + 1.0 + 0.4;
  parameter Types.Length h_HX701_TT702_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX711_TT712_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX721_TT722_SourceIn = 1.5 + 1.0;
  parameter Types.Length h_HX731_TT732_SourceIn = 1.5 + 1.0;

  parameter Types.Length L_rackL2L3_TT702 = 5.2 + 5 + 1;
  parameter Types.Length h_rackL2L3_TT702 = -1;
  parameter Types.Length L_rackL3L4_TT712 = 1 + 0.7 + 5 + 9.2 + 1;
  parameter Types.Length h_rackL3L4_TT712 = -1;
  parameter Types.Length L_rackL4L5_TT722 = 1 + 2 + 5 + 9 + 1 + 1;
  parameter Types.Length h_rackL4L5_TT722 = -1;
  parameter Types.Length L_rackL6L7_TT732 = 1.2 + 4 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter Types.Length h_rackL6L7_TT732 = -0.25 - 0.5;

  // Internal diameters & thickness
  parameter Types.Length t_Source = 1.5e-3;
  parameter Types.Length Di_Source = 32e-3;


  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_cold)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={280,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX701(
    hctype_hot=hctype,
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    hctype_cold=hctype,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=5,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={259,-135.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={280,-42})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{319,-80},{299,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={280,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=
        EX701_Tout_hot,    p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={278,-22})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT701(T_start=EX701_Tout_hot,    p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={278,-12})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT701 "Pressure sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={278,-2})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={280,22})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n)         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={240,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT702(T_start=EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={238,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={238,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n)        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={240,22})));
  Sources.SinkPressure sinkCold(p0=EX701_pout_cold, T0=EX701_Tout_cold)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={213,-199})));
  Sources.SourceMassFlow sourceCold(
    p0=EX701_pin_cold,
    T0(displayUnit="K") = EX701_Tin_cold,
    m_flow0=m_flow_EX701_cold)
                          annotation (Placement(transformation(
        extent={{13,-13},{-13,13}},
        rotation=0,
        origin={305,-200})));
equation
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{280,-52},{280,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{280,-80},{280,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{280,-112},{280,-126.75},{279.3,-126.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701_theta.y,FCV701. opening)
    annotation (Line(points={{298,-70},{288,-70}}, color={0,0,127}));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{280,-25},{280,-32}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet,PT701. inlet) annotation (Line(
      points={{280,12},{280,-2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{280,-2},{280,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{280,-12},{280,-19}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{240,-62},{240,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{240,-20},{240,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{240,-82},{238.7,-82},{238.7,-126.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet,PT702. inlet) annotation (Line(
      points={{240,12},{240,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{240,32},{240,60},{60,60},{60,180},{120,180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
    annotation (Line(
      points={{280,32},{280,80},{80,80},{80,240},{150,240}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkCold.inlet, EX701.outcold) annotation (Line(
      points={{223,-199},{238.7,-199},{238.7,-144.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold.outlet, EX701.incold) annotation (Line(
      points={{292,-200},{288,-200},{288,-202},{279.3,-202},{279.3,-144.25}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Sequence2;
