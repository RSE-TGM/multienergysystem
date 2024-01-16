within MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemI_A
  "Sequence using Gas Boiler as heat source only"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Networks.Configurations.Centralised.CentralizedSystemI(
      FV933_state = false,
      FCVC01theta = [0, 0; 100, 0],
      FCVC02theta = [0, 1; 100, 1],
      FCV901theta = [0, 1; 100, 1],
      P901omega = [0, 2*3.141592654*35; 100, 2*3.141592654*35],
      FCV101theta = [0, 0.5; 100, 0.5],
      q_m3h_S9 = 10,
      P101qm3h = [0, 10; 100, 10],
      q_m3h_S1 = 10,
      FCV701theta = [0, 1; 100, 1],
      FCV711theta = [0, 1; 100, 1],
      FCV721theta = [0, 1; 100, 1],
      FCV731theta = [0, 1; 100, 1],
      TCV701theta = [0, 1; 100, 1],
      TCV711theta = [0, 1; 100, 1],
      TCV721theta = [0, 1; 100, 1],
      TCV731theta = [0, 1; 100, 1],
      FCVR01theta = [0, 0.2; 100, 0.2],
      PR01omega = [0, 32; 100, 32],
      ToutcoolSP = [0, 15; 100, 15]);

  Modelica.Blocks.Sources.TimeTable FCV901_theta(table=FCV901theta)
    annotation (Placement(transformation(extent={{-714,93},{-734,113}})));
  Sources.PumpInput P901_input(
    useOmega=true,
    omega=P901omega,
    q_m3h=P901qm3h)
    annotation (Placement(transformation(extent={{-714,54},{-734,75}})));
  Modelica.Blocks.Sources.TimeTable FCVC01_theta(table=FCVC01theta)
    annotation (Placement(transformation(extent={{300,289},{280,309}})));
  Modelica.Blocks.Sources.TimeTable FCVC02_theta(table=FCVC02theta)
    annotation (Placement(transformation(extent={{740,289},{720,309}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=FV933_state)
    annotation (Placement(transformation(extent={{-189,15},{-209,35}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
    annotation (Placement(transformation(extent={{-200,-150},{-220,-130}})));
  Sources.PumpInput P101_input(
    useOmega=false,
    omega=P101omega,
    q_m3h=P101qm3h)
    annotation (Placement(transformation(extent={{-200,-191},{-220,-170}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{179,-160},{159,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{479,-160},{459,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{340,-160},{320,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{639,-160},{619,-140}})));
  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
    annotation (Placement(transformation(extent={{60,-330},{80,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
    annotation (Placement(transformation(extent={{220,-330},{240,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
    annotation (Placement(transformation(extent={{359,-330},{379,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
    annotation (Placement(transformation(extent={{519,-330},{539,-310}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
    annotation (Placement(transformation(extent={{799,-340},{779,-320}})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
    annotation (Placement(transformation(extent={{660,-218},{680,-198}})));
  Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table=ToutcoolSP)
    "Temperature in Celsius degrees"
    annotation (Placement(transformation(extent={{728,-70},{748,-50}})));
  Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table=GB101_ToutSP)
    annotation (Placement(transformation(extent={{-322,-310},{-302,-290}})));
equation
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-735,103},{-742,103},{-742,115},{-749,115}},
                                                     color={0,0,127}));
  connect(P901_input.y, P901.in_omega) annotation (Line(points={{-735,64.5},{
          -743.5,64.5},{-743.5,66.3},{-747.25,66.3}},
                                        color={0,0,127}));
  connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{279,299},{268,
          299},{268,235},{258,235}}, color={0,0,127}));
  connect(FCVC02_theta.y, FCVC02.opening) annotation (Line(points={{719,299},{710,
          299},{710,234},{698,234},{698,235}}, color={0,0,127}));
  connect(FV933_OnOff.y, FV933.u)
    annotation (Line(points={{-210,25},{-216.4,25}}, color={255,0,255}));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-221,-140},{-232,-140}}, color={0,0,127}));
  connect(P101_input.y, P101.in_q_m3hr) annotation (Line(points={{-221,-180.5},{
          -234.48,-180.5},{-234.48,-179.8}}, color={0,0,127}));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{158,-150},{146,-150}}, color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{458,-150},{446,-150}}, color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{319,-150},{306,-150}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{618,-150},{606,-150}}, color={0,0,127}));
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{81,-320},{90,-320}}, color={0,0,127}));
  connect(TCV731_theta.y, TCV731.opening)
    annotation (Line(points={{241,-320},{250,-320}}, color={0,0,127}));
  connect(TCV711_theta.y, TCV711.opening)
    annotation (Line(points={{380,-320},{390,-320}}, color={0,0,127}));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{540,-320},{549.1,-320}}, color={0,0,127}));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{778,-330},{766,
          -330},{766,-352}}, color={0,0,127}));
  connect(PR01_omega.y, PR01.in_q_m3hr) annotation (Line(points={{681,-208},{689.51,
          -208},{689.51,-207.8},{698.02,-207.8}}, color={0,0,127}));
  connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (Line(points={{749,-60},{767.5,
          -60},{767.5,-97.2}}, color={0,0,127}));
  connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (Line(points={{-301,-300},
          {-301,-301},{-285,-301}}, color={0,0,127}));
end CentralisedSystemI_A;
