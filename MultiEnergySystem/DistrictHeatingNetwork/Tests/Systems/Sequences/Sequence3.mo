within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
partial model Sequence3
  extends Sequence2(
    EX701_q_m3h_hot = 4,
    EX711_q_m3h_hot = 4,
    EX721_q_m3h_hot = 4,
    EX731_q_m3h_hot = 4,
    EB401(nR=5, Tout_ref=333.15),
    GB101(Tout_ref=333.15),
    FCVC01theta = [0, 0; 660, 0],
    FCVC02theta = [0, 0; 780, 0]);
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX721(
    hctype_hot=hctype,
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    hctype_cold=hctype,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
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
        origin={579,-138.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV721(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV721.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV721.dp_nom,
    Tin_start(displayUnit="K") = EX721_Tout_hot,
    pin_start=EX721_pout_hot,
    q_m3h_start=EX721_q_m3h_cold)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={600,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FCV721_FT721(
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
    t=t_S700,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype)
                  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={600,-42})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{639,-80},{619,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_SourceOut_FCV721(
    L=L_HX721_SourceOut_FCV721,
    h=h_HX721_SourceOut_FCV721,
    t=t_S700,
    pin_start=EX721_pout_hot,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={600,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={598,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT721(T_start=EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={598,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT721 "Pressure sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={598,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_FT721_rackL4L5(
    L=L_FT721_rackL4L5,
    h=h_FT721_rackL4L5,
    t=t_S700,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={600,24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_TT722_SourceIn(
    L=L_HX721_TT722_SourceIn,
    h=h_HX721_TT722_SourceIn,
    t=t_S700,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={560,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT722(T_start=EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={558,-18})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={558,-8})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL721_rackL4L5_TT722(
    L=L_rackL4L5_TT722,
    h=h_rackL4L5_TT722,
    t=t_S700,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={560,24})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger
    EX731(
    hctype_hot=hctype,
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    hctype_cold=hctype,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
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
        origin={279,-137.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV731(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV731.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV731.dp_nom,
    Tin_start(displayUnit="K") = EX731_Tout_hot,
    pin_start=EX731_pout_hot,
    q_m3h_start=EX731_q_m3h_cold)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={300,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FCV731_FT731(
    L=L_FCV731_FT731,
    h=h_FCV731_FT731,
    t=t_S700,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype)
                  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={300,-44})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{340,-80},{320,-60}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_SourceOut_FCV731(
    L=L_HX731_SourceOut_FCV731,
    h=h_HX731_SourceOut_FCV731,
    t=t_S700,
    pin_start=EX731_pout_hot,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={300,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={298,-24})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT731(T_start=EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={298,-14})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT731 "Pressure sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={298,-4})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_FT731_rackL6L7(
    L=L_FT731_rackL6L7,
    h=h_FT731_rackL6L7,
    t=t_S700,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={300,20})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_TT732_SourceIn(
    L=L_HX731_TT732_SourceIn,
    h=h_HX731_TT732_SourceIn,
    t=t_S700,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype)
                 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={260,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT732(T_start=EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={258,-20})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={258,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL731_rackL6L7_TT732(
    L=L_rackL6L7_TT732,
    h=h_rackL6L7_TT732,
    t=t_S700,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={260,20})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_11(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{78,-19},{49,5}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_12(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{78,-31},{49,-7}})));
  Modelica.Blocks.Interaction.Show.RealValue PT732_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{236,-21},{207,3}})));
  Modelica.Blocks.Interaction.Show.RealValue TT732_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{236,-33},{207,-9}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_3(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{384,-21},{355,3}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_4(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{384,-33},{355,-9}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_5(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{542,-19},{513,5}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_6(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{542,-31},{513,-7}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_9(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{153,-21},{182,3}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_10(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{153,-33},{182,-9}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_7(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{153,-9},{182,15}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_8(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{311,-21},{340,3}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_13(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{311,-33},{340,-9}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_14(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{311,-9},{340,15}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_15(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{451,-17},{480,7}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_16(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{451,-29},{480,-5}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_17(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{451,-5},{480,19}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_18(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{613,-17},{642,7}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_19(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{613,-29},{642,-5}})));
  Modelica.Blocks.Interaction.Show.RealValue FTR01_20(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{613,-5},{642,19}})));
equation
  connect(PL721_FCV721_FT721.inlet,FCV721. outlet) annotation (Line(
      points={{600,-52},{600,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721_theta.y,FCV721.opening) annotation (Line(points={{618,-70},{608,-70}},
                                               color={0,0,127}));
  connect(FCV721.inlet,PL721_SourceOut_FCV721.outlet) annotation (Line(
      points={{600,-80},{600,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet,EX721.outhot) annotation (Line(
      points={{600,-110},{600,-119.875},{599.3,-119.875},{599.3,-129.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet,PL721_FCV721_FT721. outlet) annotation (Line(
      points={{600,-23},{600,-32}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.inlet,PT721. inlet) annotation (Line(
      points={{600,14},{600,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721.inlet) annotation (Line(
      points={{600,0},{600,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(TT721.inlet,FT721.outlet) annotation (Line(
      points={{600,-10},{600,-17}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet,TT722.inlet) annotation (Line(
      points={{560,-60},{560,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{560,-18},{560,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(PT722.inlet,PL721_rackL4L5_TT722.outlet) annotation (Line(
      points={{560,-8},{560,14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet, EX721.inhot) annotation (Line(
      points={{560,-80},{560,-130},{558,-130},{558,-129.75},{558.7,-129.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
      Line(
      points={{560,34},{560,140},{380,140},{380,205},{400,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
      Line(
      points={{600,34},{600,160},{400,160},{400,265},{330,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet,FCV731. outlet) annotation (Line(
      points={{300,-54},{300,-60}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731_theta.y,FCV731. opening)
    annotation (Line(points={{319,-70},{308,-70}},
                                                 color={0,0,127}));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{300,-80},{300,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet,EX731. outhot) annotation (Line(
      points={{300,-110},{300,-117.875},{299.3,-117.875},{299.3,-128.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet,PL731_FCV731_FT731. outlet) annotation (Line(
      points={{300,-27},{300,-34}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.inlet,PT731. inlet) annotation (Line(
      points={{300,10},{300,-4}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{300,-4},{300,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{300,-14},{300,-21}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet,TT732. inlet) annotation (Line(
      points={{260,-60},{260,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{260,-20},{260,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet,EX731. inhot) annotation (Line(
      points={{260,-80},{260,-114},{258.7,-114},{258.7,-128.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.outlet,PT732. inlet) annotation (Line(
      points={{260,10},{260,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
      Line(
      points={{260,30},{260,78},{620,78},{620,205},{640,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
     Line(
      points={{300,30},{300,60},{640,60},{640,265},{650,265}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.T, FTR01_6.numberPort) annotation (Line(points={{551.5,-18},{
          551.5,-19},{544.175,-19}}, color={0,0,127}));
  connect(PT722.p, FTR01_5.numberPort) annotation (Line(points={{551.5,-8},{
          547.837,-8},{547.837,-7},{544.175,-7}}, color={0,0,127}));
  connect(TT712.T, FTR01_4.numberPort) annotation (Line(points={{391.5,-20},{
          389.837,-20},{389.837,-21},{386.175,-21}}, color={0,0,127}));
  connect(PT712.p, FTR01_3.numberPort) annotation (Line(points={{391.5,-10},{
          389.837,-10},{389.837,-9},{386.175,-9}}, color={0,0,127}));
  connect(FT701.q_m3hr, FTR01_10.numberPort) annotation (Line(points={{131.5,
          -22},{126,-22},{126,-16},{146,-16},{146,-21},{150.825,-21}}, color={0,
          0,127}));
  connect(TT701.T, FTR01_9.numberPort) annotation (Line(points={{131.5,-12},{
          126,-12},{126,-9},{150.825,-9}}, color={0,0,127}));
  connect(PT701.p, FTR01_7.numberPort) annotation (Line(points={{131.5,-2},{128,
          -2},{128,3},{150.825,3}}, color={0,0,127}));
  connect(FT731.q_m3hr, FTR01_13.numberPort) annotation (Line(points={{291.5,
          -24},{290,-24},{290,-21},{308.825,-21}}, color={0,0,127}));
  connect(TT731.T, FTR01_8.numberPort) annotation (Line(points={{291.5,-14},{
          288,-14},{288,-9},{308.825,-9}}, color={0,0,127}));
  connect(PT731.p, FTR01_14.numberPort) annotation (Line(points={{291.5,-4},{
          290,-4},{290,3},{308.825,3}}, color={0,0,127}));
  connect(FT711.q_m3hr, FTR01_16.numberPort) annotation (Line(points={{431.5,
          -20},{430,-20},{430,-17},{448.825,-17}}, color={0,0,127}));
  connect(TT711.T, FTR01_15.numberPort) annotation (Line(points={{431.5,-10},{
          430,-10},{430,-5},{448.825,-5}}, color={0,0,127}));
  connect(PT711.p, FTR01_17.numberPort) annotation (Line(points={{431.5,0},{430,
          0},{430,7},{448.825,7}}, color={0,0,127}));
  connect(FT721.q_m3hr, FTR01_19.numberPort) annotation (Line(points={{591.5,
          -20},{588,-20},{588,-17},{610.825,-17}}, color={0,0,127}));
  connect(TT721.T, FTR01_18.numberPort) annotation (Line(points={{591.5,-10},{
          588,-10},{588,-5},{610.825,-5}}, color={0,0,127}));
  connect(PT721.p, FTR01_20.numberPort) annotation (Line(points={{591.5,0},{588,
          0},{588,7},{610.825,7}}, color={0,0,127}));
  connect(TT702.T, FTR01_12.numberPort) annotation (Line(points={{91.5,-20},{
          85.8375,-20},{85.8375,-19},{80.175,-19}}, color={0,0,127}));
  connect(PT702.p, FTR01_11.numberPort) annotation (Line(points={{91.5,-10},{
          85.8375,-10},{85.8375,-7},{80.175,-7}}, color={0,0,127}));
  connect(PT732.p, PT732_.numberPort) annotation (Line(points={{251.5,-10},{
          244.838,-10},{244.838,-9},{238.175,-9}}, color={0,0,127}));
  connect(TT732.T, TT732_.numberPort) annotation (Line(points={{251.5,-20},{
          244.838,-20},{244.838,-21},{238.175,-21}}, color={0,0,127}));
  annotation (experiment(StopTime=1000, __Dymola_Algorithm="Dassl"));
end Sequence3;
