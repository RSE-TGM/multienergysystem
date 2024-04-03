within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CentralisedSystemLoadSimplifiedI_B_FMU
  extends Networks.Thermal.Configurations.Centralised.CentralizedSystemLoadSimplifiedI_B(
    coldSourcePEX721(T0=EX721_Tin_cold),
    coldSourcePEX711(T0=EX711_Tin_cold),
    coldSourcePEX731(T0=EX731_Tin_cold),
    coldSourcePEX701(T0=EX701_Tin_cold),
    Tout_start_Cool=16.5 + 273.15,
    EX701_Tin_hot=T_start_hot,
    EX711_Tin_hot=T_start_hot,
    EX721_Tin_hot=T_start_hot,
    EX731_Tin_hot=T_start_hot,
    EX701_Tout_hot=T_start_hot - 20,
    EX711_Tout_hot=T_start_hot - 20,
    EX721_Tout_hot=T_start_hot - 20,
    EX731_Tout_hot=T_start_hot - 20,
    EX701_Tin_cold=16.5 + 273.15,
    EX711_Tin_cold=16.5 + 273.15,
    EX721_Tin_cold=16.5 + 273.15,
    EX731_Tin_cold=16.5 + 273.15,
    FCVC01theta=[0,0; 1e6,0],
    FCVC02theta=[0,0.5; 1e6,0.5],
    FCV101theta=[0,1; 1e6,1],
    FCV401theta=[0,1; 1e6,1],
    FCV901theta=[0,1; 1e6,1],
    FCV701theta=[0,1; 1e6,1],
    FCV711theta=[0,1; 1e6,1],
    FCV721theta=[0,0.75; 442,0.75; 442,1; 890,1; 1848,0.79; 4505,0.79; 7250,0.96; 9538,0.78; 1e6,0.78],
    FCV731theta=[0,0.9; 0.041e4,0.9; 0.041e4,1; 0.3684e4,1; 0.5e4,0.92; 1e6,0.92],
    VE901(p0=1.76e5),
    Tout_start_S9=80 + 273.15,
    T_start_hot=80 + 273.15,
    GB101(Tout_start=353.15),
    EB401(Tout_start=353.15, nR=5),
    FCVC01(Tin_start=T_start_hot, q_m3h_start=q_m3h_rackHot/4),
    FCV101(Kv=20),
    rackL6L7_FCVC02_cold(h=-h_rL6L7_FCVC02_H*0.5*0),
    FCVC02(Kv=25),
    EX701(
      n=3,
      m_flow_start_hot=EX701_q_m3h_hot*1000/3600,
      m_flow_start_cold=EX701_q_m3h_cold*1000/3600),
    EX731(
      n=3,
      m_flow_start_hot=EX731_q_m3h_hot*1000/3600,
      m_flow_start_cold=EX731_q_m3h_cold*1000/3600),
    EX711(
      n=3,
      m_flow_start_hot=EX711_q_m3h_hot*1000/3600,
      m_flow_start_cold=EX711_q_m3h_cold*1000/3600),
    EX721(
      n=3,
      m_flow_start_hot=EX721_q_m3h_hot*1000/3600,
      m_flow_start_cold=EX721_q_m3h_cold*1000/3600),
    FCV901(Kv=20));
  Modelica.Blocks.Interfaces.RealInput EB401_Tout
    annotation (Placement(transformation(extent={{-418,-320},{-378,-280}})));
  Modelica.Blocks.Interfaces.RealInput GB101_Tout
    annotation (Placement(transformation(extent={{-334,-320},{-294,-280}})));
  Modelica.Blocks.Interfaces.RealInput omega_P101
    annotation (Placement(transformation(extent={{-178,-200},{-218,-160}})));
  Modelica.Blocks.Interfaces.RealInput omega_P401
    annotation (Placement(transformation(extent={{-266,-196},{-306,-156}})));
  Modelica.Blocks.Interfaces.RealInput omega_P901
    annotation (Placement(transformation(extent={{-690,46},{-730,86}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV101
    annotation (Placement(transformation(extent={{-174,-130},{-214,-90}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV401
    annotation (Placement(transformation(extent={{-266,-156},{-306,-116}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV901
    annotation (Placement(transformation(extent={{-692,94},{-732,134}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV701
    annotation (Placement(transformation(extent={{196,-170},{156,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV711
    annotation (Placement(transformation(extent={{516,-170},{476,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV721
    annotation (Placement(transformation(extent={{680,-170},{640,-130}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV731
    annotation (Placement(transformation(extent={{354,-170},{314,-130}})));
  Modelica.Blocks.Interfaces.RealInput FCV_C01
    annotation (Placement(transformation(extent={{314,214},{274,254}})));
  Modelica.Blocks.Interfaces.RealInput FCV_C02
    annotation (Placement(transformation(extent={{754,214},{714,254}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false)
    annotation (Placement(transformation(extent={{-187,15},{-207,35}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=true)
    annotation (Placement(transformation(extent={{-284,-26},{-304,-6}})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state)
    annotation (Placement(transformation(extent={{-394,-26},{-374,-6}})));
  Modelica.Blocks.Interfaces.RealOutput FT_901
    annotation (Placement(transformation(extent={{-740,156},{-720,176}})));
  Modelica.Blocks.Interfaces.RealOutput PT_902
    annotation (Placement(transformation(extent={{-740,172},{-720,192}})));
  Modelica.Blocks.Interfaces.RealOutput TT_902
    annotation (Placement(transformation(extent={{-740,186},{-720,206}})));
  Modelica.Blocks.Interfaces.RealOutput TT_702
    annotation (Placement(transformation(extent={{80,-130},{60,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_712
    annotation (Placement(transformation(extent={{380,-130},{360,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_722
    annotation (Placement(transformation(extent={{540,-130},{520,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_732
    annotation (Placement(transformation(extent={{240,-130},{220,-110}})));
  Modelica.Blocks.Interfaces.RealInput EX701_Tcold
    annotation (Placement(transformation(extent={{212,-288},{172,-248}})));
  Modelica.Blocks.Interfaces.RealInput EX711_Tcold
    annotation (Placement(transformation(extent={{532,-290},{492,-250}})));
  Modelica.Blocks.Interfaces.RealInput EX721_Tcold
    annotation (Placement(transformation(extent={{696,-288},{656,-248}})));
  Modelica.Blocks.Interfaces.RealInput EX731_Tcold
    annotation (Placement(transformation(extent={{376,-280},{336,-240}})));
  Modelica.Blocks.Interfaces.RealInput EX701_mflowcold
    annotation (Placement(transformation(extent={{30,-340},{70,-300}})));
  Modelica.Blocks.Interfaces.RealInput EX711_mflowcold
    annotation (Placement(transformation(extent={{348,-340},{388,-300}})));
  Modelica.Blocks.Interfaces.RealInput EX721_mflowcold
    annotation (Placement(transformation(extent={{518,-340},{558,-300}})));
  Modelica.Blocks.Interfaces.RealInput EX731_mflowcold
    annotation (Placement(transformation(extent={{178,-340},{218,-300}})));
  Modelica.Blocks.Sources.BooleanConstant EB401Status
    annotation (Placement(transformation(extent={{-424,-346},{-404,-326}})));
  Modelica.Blocks.Sources.BooleanConstant GB101Status
    annotation (Placement(transformation(extent={{-338,-354},{-318,-334}})));
  Modelica.Blocks.Interfaces.RealOutput TT_701
    annotation (Placement(transformation(extent={{158,-98},{178,-78}})));
  Modelica.Blocks.Interfaces.RealOutput TT_711
    annotation (Placement(transformation(extent={{478,-96},{498,-76}})));
  Modelica.Blocks.Interfaces.RealOutput TT_721
    annotation (Placement(transformation(extent={{638,-98},{658,-78}})));
  Modelica.Blocks.Interfaces.RealOutput TT_731
    annotation (Placement(transformation(extent={{326,-100},{346,-80}})));
  Modelica.Blocks.Interfaces.RealOutput FT_101
    annotation (Placement(transformation(extent={{-300,-204},{-320,-184}})));
  Modelica.Blocks.Interfaces.RealOutput FT_401
    annotation (Placement(transformation(extent={{-384,-202},{-404,-182}})));

equation
  connect(P901.in_omega, omega_P901) annotation (Line(points={{-747.25,66.3},{-728.625,66.3},{-728.625,
          66},{-710,66}}, color={0,0,127}));
  connect(FCV901.opening, theta_FCV901)
    annotation (Line(points={{-749.9,140.5},{-730.5,140.5},{-730.5,114},{-712,114}},
                                                                               color={0,0,127}));
  connect(FCVC01.opening, FCV_C01) annotation (Line(points={{258,235},{276,235},
          {276,234},{294,234}}, color={0,0,127}));
  connect(FCV_C02, FCVC02.opening)
    annotation (Line(points={{734,234},{698,234},{698,235}}, color={0,0,127}));
  connect(EB401.Tout_ref, EB401_Tout) annotation (Line(points={{-361.5,-301},{-374.5,-301},{-374.5,-300},{-398,-300}},
                                            color={0,0,127}));
  connect(GB101.Tout_ref, GB101_Tout) annotation (Line(points={{-281.5,-301},{-281.5,-300},{-314,-300}},
                              color={0,0,127}));
  connect(theta_FCV101, FCV101.opening)
    annotation (Line(points={{-194,-110},{-232,-110}}, color={0,0,127}));
  connect(FCV401.opening, theta_FCV401)
    annotation (Line(points={{-310,-110},{-298,-110},{-298,-136},{-286,-136}},
                                                       color={0,0,127}));
  connect(theta_FCV701, FCV701.opening)
    annotation (Line(points={{176,-150},{148,-150}}, color={0,0,127}));
  connect(FCV731.opening, theta_FCV731)
    annotation (Line(points={{308,-150},{334,-150}}, color={0,0,127}));
  connect(theta_FCV711, FCV711.opening)
    annotation (Line(points={{496,-150},{468,-150}}, color={0,0,127}));
  connect(theta_FCV721, FCV721.opening)
    annotation (Line(points={{660,-150},{628,-150}}, color={0,0,127}));
  connect(FV933_OnOff.y, FV933.u)
    annotation (Line(points={{-208,25},{-214,25},{-214,46.6},{-218,46.6}},
                                                     color={255,0,255}));
  connect(FV402_OnOff.y, FV402.u)
    annotation (Line(points={{-305,-16},{-314.8,-16}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u)
    annotation (Line(points={{-373,-16},{-361.2,-16}}, color={255,0,255}));
  connect(TT902.T, TT_902) annotation (Line(points={{-748.575,196.25},{-739.288,
          196.25},{-739.288,196},{-730,196}}, color={0,0,127}));
  connect(FT901.q_m3hr, FT_901)
    annotation (Line(points={{-748.5,166},{-730,166}}, color={0,0,127}));
  connect(PT902.p, PT_902) annotation (Line(points={{-748.5,181.5},{-739.25,
          181.5},{-739.25,182},{-730,182}}, color={0,0,127}));
  connect(TT722.T, TT_722)
    annotation (Line(points={{571.5,-120},{530,-120}}, color={0,0,127}));
  connect(TT712.T, TT_712)
    annotation (Line(points={{411.5,-120},{370,-120}}, color={0,0,127}));
  connect(TT732.T, TT_732)
    annotation (Line(points={{251.5,-120},{230,-120}}, color={0,0,127}));
  connect(TT702.T, TT_702)
    annotation (Line(points={{91.5,-120},{70,-120}}, color={0,0,127}));
  connect(omega_P101, P101.in_omega) annotation (Line(points={{-198,-180},{-216,-180},{-216,-179.8},
          {-234,-179.8}}, color={0,0,127}));
  connect(coldSourcePEX721.in_T0, EX721_Tcold) annotation (Line(points={{641,-288.6},{641,-278.3},{676,-278.3},{676,-268}}, color={0,0,127}));
  connect(EX711_Tcold, coldSourcePEX711.in_T0) annotation (Line(points={{512,-270},{479,-270},{479,-290.6}}, color={0,0,127}));
  connect(EX731_Tcold, coldSourcePEX731.in_T0) annotation (Line(points={{356,-260},{319,-260},{319,-290.6}}, color={0,0,127}));
  connect(EX701_Tcold, coldSourcePEX701.in_T0) annotation (Line(points={{192,-268},{159,-268},{159,-290.6}}, color={0,0,127}));
  connect(EX701_mflowcold, FT703.in_m_flow)
    annotation (Line(points={{50,-320},{80,-320},{80,-305}}, color={0,0,127}));
  connect(EX731_mflowcold, FT733.in_m_flow) annotation (Line(points={{198,-320},{218,-320},{218,-318},
          {238,-318},{238,-305}}, color={0,0,127}));
  connect(EX711_mflowcold, FT713.in_m_flow)
    annotation (Line(points={{368,-320},{400,-320},{400,-305}}, color={0,0,127}));
  connect(EX721_mflowcold, FT723.in_m_flow)
    annotation (Line(points={{538,-320},{566,-320},{566,-305}}, color={0,0,127}));
  connect(GB101Status.y, GB101.heat_on) annotation (Line(points={{-317,-344},{-308,-344},{-308,-342},{-300,-342},{-300,-318.5},{-281.5,-318.5}},
                                                color={255,0,255}));
  connect(EB401Status.y, EB401.heat_on) annotation (Line(points={{-403,-336},{-394,-336},{-394,-338},{-386,-338},{-386,-318.5},{-361.5,-318.5}},
                                                color={255,0,255}));
  connect(omega_P401, P401.in_omega) annotation (Line(points={{-286,-176},{-299,-176},{-299,-175.8},
          {-312,-175.8}}, color={0,0,127}));
  connect(TT701.T, TT_701) annotation (Line(points={{148.5,-88},{168,-88}}, color={0,0,127}));
  connect(TT731.T, TT_731) annotation (Line(points={{308.5,-90},{336,-90}}, color={0,0,127}));
  connect(TT711.T, TT_711) annotation (Line(points={{468.5,-86},{488,-86}}, color={0,0,127}));
  connect(TT721.T, TT_721)
    annotation (Line(points={{628.5,-86},{638.25,-86},{638.25,-88},{648,-88}}, color={0,0,127}));
  connect(FT_101, FT101.m_flow) annotation (Line(points={{-310,-194},{-294,-194},{-294,-206},{-283.2,
          -206},{-283.2,-199.9}}, color={0,0,127}));
  connect(FT401.m_flow, FT_401) annotation (Line(points={{-365.2,-195.9},{-365.2,-200},{-378,-200},{
          -378,-192},{-394,-192}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedSystemLoadSimplifiedI_B_FMU;
