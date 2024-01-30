within MultiEnergySystem.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemLoadSimplifiedI_A "Sequence using Gas Boiler as heat source only"
  extends
    MultiEnergySystem.TestFacility.Networks.Configurations.Centralised.CentralizedSystemLoadSimplifiedI(
    FV933_state=false,
    FCVC01theta=[0,0; 100,0],
    FCVC02theta=[0,1; 100,1],
    FCV901theta=[0,1; 100,1],
    P901omega=[0,2*3.141592654*30; 100,2*3.141592654*30],
    FCV101theta=[0,1; 100,1],
    q_m3h_S9=10,
    P101qm3h=[0,10; 100,10],
    q_m3h_S1=10,
    FCV701theta=[0,1; 100,1],
    FCV711theta=[0,1; 100,1],
    FCV721theta=[0,1; 100,1],
    FCV731theta=[0,1; 100,1],
    TCV701theta=[0,1; 100,1],
    TCV711theta=[0,1; 100,1],
    TCV721theta=[0,1; 100,1],
    TCV731theta=[0,1; 100,1],
    FCVR01theta=[0,0.2; 100,0.2],
    PR01omega=[0,2*Modelica.Constants.pi*50; 100,2*Modelica.Constants.pi*50],
    ToutcoolSP=[0,15; 100,15],
    GB101(h=1.2*0.93, Pmaxnom=147.6e3*0.79));

  Modelica.Blocks.Sources.TimeTable FCV901_theta(table=FCV901theta)
    annotation (Placement(transformation(extent={{-714,93},{-734,113}})));
  DistrictHeatingNetwork.Sources.PumpInput P901_input(
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
  DistrictHeatingNetwork.Sources.PumpInput P101_input(
    omega=P101omega,
    q_m3h=P101qm3h)
    annotation (Placement(transformation(extent={{-200,-191},{-220,-170}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
    annotation (Placement(transformation(extent={{179,-160},{159,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
    annotation (Placement(transformation(extent={{499,-160},{479,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
    annotation (Placement(transformation(extent={{340,-160},{320,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
    annotation (Placement(transformation(extent={{661,-160},{641,-140}})));
  Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table=GB101_ToutSP)
    annotation (Placement(transformation(extent={{-318,-310},{-298,-290}})));
  Modelica.Blocks.Sources.TimeTable FT723_mflow(table=EX721q_m3h_cold*1000/3600)
    annotation (Placement(transformation(extent={{530,-340},{550,-320}})));
  Modelica.Blocks.Sources.TimeTable FT713_mflow(table=EX711q_m3h_cold*1000/3600)
    annotation (Placement(transformation(extent={{370,-340},{390,-320}})));
  Modelica.Blocks.Sources.TimeTable FT733_mflow(table=EX731q_m3h_cold*1000/3600)
    annotation (Placement(transformation(extent={{210,-340},{230,-320}})));
  Modelica.Blocks.Sources.TimeTable FT703_mflow(table=EX701q_m3h_cold*1000/3600)
    annotation (Placement(transformation(extent={{50,-340},{70,-320}})));
  Modelica.Blocks.Sources.TimeTable TT703_SP(table=EX701_TinCold)
    annotation (Placement(transformation(extent={{192,-280},{172,-260}})));
  Modelica.Blocks.Sources.TimeTable TT733_SP(table=EX731_TinCold)
    annotation (Placement(transformation(extent={{348,-280},{328,-260}})));
  Modelica.Blocks.Sources.TimeTable TT723_SP(table=EX721_TinCold)
    annotation (Placement(transformation(extent={{672,-280},{652,-260}})));
  Modelica.Blocks.Sources.TimeTable TT713_SP(table=EX711_TinCold)
    annotation (Placement(transformation(extent={{512,-280},{492,-260}})));
equation
  connect(FCV901_theta.y, FCV901.opening)
    annotation (Line(points={{-735,103},{-742,103},{-742,115},{-749,115}},
                                                     color={0,0,127}));
  connect(P901_input.y, P901.in_omega) annotation (Line(points={{-735,64.5},{-743.5,
          64.5},{-743.5,66.3},{-747.25,66.3}},
                                        color={0,0,127}));
  connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{279,299},{268,
          299},{268,235},{258,235}}, color={0,0,127}));
  connect(FCVC02_theta.y, FCVC02.opening) annotation (Line(points={{719,299},{710,
          299},{710,234},{698,234},{698,235}}, color={0,0,127}));
  connect(FV933_OnOff.y, FV933.u)
    annotation (Line(points={{-210,25},{-216.4,25}}, color={255,0,255}));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{-221,-140},{-232,-140}}, color={0,0,127}));
  connect(FCV701_theta.y, FCV701.opening)
    annotation (Line(points={{158,-150},{148,-150}}, color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{478,-150},{468,-150}}, color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{319,-150},{308,-150}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{640,-150},{628,-150}}, color={0,0,127}));
  connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (Line(points={{-297,-300},
          {-297,-301},{-285,-301}}, color={0,0,127}));
  connect(FT723_mflow.y, FT723.in_m_flow)
    annotation (Line(points={{551,-330},{566,-330},{566,-305}}, color={0,0,127}));
  connect(FT713_mflow.y, FT713.in_m_flow)
    annotation (Line(points={{391,-330},{400,-330},{400,-305}}, color={0,0,127}));
  connect(FT733_mflow.y, FT733.in_m_flow)
    annotation (Line(points={{231,-330},{238,-330},{238,-305}}, color={0,0,127}));
  connect(FT703_mflow.y, FT703.in_m_flow)
    annotation (Line(points={{71,-330},{80,-330},{80,-305}}, color={0,0,127}));
  connect(TT703_SP.y, VER3.in_T0)
    annotation (Line(points={{171,-270},{159,-270},{159,-290.6}}, color={0,0,127}));
  connect(TT733_SP.y, VER2.in_T0)
    annotation (Line(points={{327,-270},{319,-270},{319,-290.6}}, color={0,0,127}));
  connect(TT723_SP.y, VER901.in_T0)
    annotation (Line(points={{651,-270},{641,-270},{641,-288.6}}, color={0,0,127}));
  connect(TT713_SP.y, VER1.in_T0)
    annotation (Line(points={{491,-270},{479,-270},{479,-290.6}}, color={0,0,127}));
  connect(P101_input.y, P101.in_omega)
    annotation (Line(points={{-221,-180.5},{-234,-180.5},{-234,-179.8}}, color={0,0,127}));
end CentralisedSystemLoadSimplifiedI_A;
