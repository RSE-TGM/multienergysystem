within MultiEnergySystem.TestFacility.DHTF.Examples;
model CEN_GB_LoadSimplified "Sequence using Gas Boiler as heat source only"
  extends Modelica.Icons.Example;
  extends MultiEnergySystem.TestFacility.DHTF.Networks.Centralised.CentralizedSystemLoadSimplifiedI(FV933_state = false, FCVC01theta = [0, 0; 100, 0], FCVC02theta = [0, 1; 100, 1], FCV901theta = [0, 1; 100, 1], P901omega = [0, 2*pi*30; 100, 2*pi*30], P101omega = [0, 2*pi*30; 100, 2*pi*30; 100, 2*pi*30; 200, 2*pi*30], FCV101theta = [0, 1; 100, 1], q_m3h_S9 = 10, P101qm3h = [0, 10; 100, 10], q_m3h_S1 = 10, FCV701theta = [0, 1; 100, 1], FCV711theta = [0, 1; 100, 1], FCV721theta = [0, 1; 100, 1], FCV731theta = [0, 1; 100, 1], TCV701theta = [0, 1; 100, 1], TCV711theta = [0, 1; 100, 1], TCV721theta = [0, 1; 100, 1], TCV731theta = [0, 1; 100, 1], FCVR01theta = [0, 0.2; 100, 0.2], PR01omega = [0, 2*Modelica.Constants.pi*50; 100, 2*Modelica.Constants.pi*50], ToutcoolSP = [0, 15; 100, 15], GB101(h = 1.2*0.93, Pmaxnom = 147.6e3*0.8));
  Modelica.Blocks.Sources.TimeTable FCV901_theta(table = FCV901theta) annotation (
    Placement(transformation(extent = {{-682, 103}, {-702, 123}})));
  DistrictHeatingNetwork.Sources.PumpInput P901_input(useOmega = true, omega = P901omega, q_m3h = P901qm3h) annotation (
    Placement(transformation(extent = {{-714, 54}, {-734, 75}})));
  Modelica.Blocks.Sources.TimeTable FCVC01_theta(table = FCVC01theta) annotation (
    Placement(transformation(extent = {{332, 290}, {312, 310}})));
  Modelica.Blocks.Sources.TimeTable FCVC02_theta(table = FCVC02theta) annotation (
    Placement(transformation(extent = {{782, 290}, {762, 310}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k = FV933_state) annotation (
    Placement(transformation(extent = {{-185, 55}, {-205, 75}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table = FCV101theta) annotation (
    Placement(transformation(extent = {{-178, -120}, {-198, -100}})));
  DistrictHeatingNetwork.Sources.PumpInput P101_input(omega = P101omega, q_m3h = P101qm3h) annotation (
    Placement(transformation(extent = {{-200, -191}, {-220, -170}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table = FCV701theta) annotation (
    Placement(transformation(extent = {{179, -160}, {159, -140}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table = FCV711theta) annotation (
    Placement(transformation(extent = {{499, -160}, {479, -140}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table = FCV731theta) annotation (
    Placement(transformation(extent = {{340, -160}, {320, -140}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table = FCV721theta) annotation (
    Placement(transformation(extent = {{661, -160}, {641, -140}})));
  Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table = GB101_ToutSP) annotation (
    Placement(transformation(extent = {{-318, -310}, {-298, -290}})));
  Modelica.Blocks.Sources.TimeTable FT723_mflow(table = EX721q_m3h_cold*1000/3600) annotation (
    Placement(transformation(extent = {{530, -340}, {550, -320}})));
  Modelica.Blocks.Sources.TimeTable FT713_mflow(table = EX711q_m3h_cold*1000/3600) annotation (
    Placement(transformation(extent = {{370, -340}, {390, -320}})));
  Modelica.Blocks.Sources.TimeTable FT733_mflow(table = EX731q_m3h_cold*1000/3600) annotation (
    Placement(transformation(extent = {{210, -340}, {230, -320}})));
  Modelica.Blocks.Sources.TimeTable FT703_mflow(table = EX701q_m3h_cold*1000/3600) annotation (
    Placement(transformation(extent = {{50, -340}, {70, -320}})));
  Modelica.Blocks.Sources.TimeTable TT703_SP(table = EX701_TinCold) annotation (
    Placement(transformation(extent={{220,-290},{200,-270}})));
  Modelica.Blocks.Sources.TimeTable TT733_SP(table = EX731_TinCold) annotation (
    Placement(transformation(extent={{380,-290},{360,-270}})));
  Modelica.Blocks.Sources.TimeTable TT723_SP(table = EX721_TinCold) annotation (
    Placement(transformation(extent={{700,-290},{680,-270}})));
  Modelica.Blocks.Sources.TimeTable TT713_SP(table = EX711_TinCold) annotation (
    Placement(transformation(extent={{540,-290},{520,-270}})));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table = {1e8}, startValue = true) "Input to decide whether or nor the gas boiler is working" annotation (
    Placement(transformation(extent = {{-318, -344}, {-298, -324}})));
  Modelica.Blocks.Sources.RealExpression TT703_SPP(y=15 + 273.15)
                                                   annotation (
    Placement(transformation(origin={210,-220},    extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.RealExpression TT733_SPP(y=15 + 273.15)
                                                   annotation (
    Placement(transformation(origin={370,-220},    extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.RealExpression TT713_SPP(y=15 + 273.15)
                                                   annotation (
    Placement(transformation(origin={530,-220},    extent = {{10, -10}, {-10, 10}})));
  Modelica.Blocks.Sources.RealExpression TT723_SPP(y=15 + 273.15) annotation (Placement(transformation(origin={690,-220}, extent={{10,-10},{-10,10}})));
  Modelica.Blocks.Continuous.FirstOrder FCV101_firstOrder(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(extent = {{-206, -120}, {-226, -100}})));
  Modelica.Blocks.Continuous.FirstOrder FCV901_firstOrder(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(extent = {{-716, 104}, {-736, 124}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC01_firstOrder(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(extent = {{300, 290}, {280, 310}})));
  Modelica.Blocks.Continuous.FirstOrder FCVC02_firstOrder(k = 1, T = 1, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(extent = {{750, 290}, {730, 310}})));
  Modelica.Blocks.Logical.Switch switchEX701cold annotation (Placement(transformation(extent={{180,-260},{160,-240}})));
  Modelica.Blocks.Sources.BooleanConstant boolswitchEX701cold(k=true) annotation (Placement(transformation(extent={{220,-260},{200,-240}})));
  Modelica.Blocks.Sources.BooleanConstant boolswitchEX731cold(k=true) annotation (Placement(transformation(extent={{380,-260},{360,-240}})));
  Modelica.Blocks.Logical.Switch switchEX731cold annotation (Placement(transformation(extent={{340,-260},{320,-240}})));
  Modelica.Blocks.Sources.BooleanConstant boolswitchEX711cold(k=true) annotation (Placement(transformation(extent={{540,-260},{520,-240}})));
  Modelica.Blocks.Logical.Switch switchEX711cold annotation (Placement(transformation(extent={{500,-260},{480,-240}})));
  Modelica.Blocks.Logical.Switch switchEX721cold annotation (Placement(transformation(extent={{660,-260},{640,-240}})));
  Modelica.Blocks.Sources.BooleanConstant boolswitchEX721cold(k=true) annotation (Placement(transformation(extent={{700,-260},{680,-240}})));
equation
  connect(P901_input.y, P901.in_omega) annotation (
    Line(points = {{-735, 64.5}, {-743.5, 64.5}, {-743.5, 66.3}, {-747.25, 66.3}}, color = {0, 0, 127}));
  connect(FV933_OnOff.y, FV933.u) annotation (
    Line(points = {{-206, 65}, {-218, 65}, {-218, 46.6}}, color = {255, 0, 255}));
  connect(FCV701_theta.y, FCV701.opening) annotation (
    Line(points = {{158, -150}, {148, -150}}, color = {0, 0, 127}));
  connect(FCV711_theta.y, FCV711.opening) annotation (
    Line(points = {{478, -150}, {468, -150}}, color = {0, 0, 127}));
  connect(FCV731_theta.y, FCV731.opening) annotation (
    Line(points = {{319, -150}, {308, -150}}, color = {0, 0, 127}));
  connect(FCV721_theta.y, FCV721.opening) annotation (
    Line(points = {{640, -150}, {628, -150}}, color = {0, 0, 127}));
  connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (
    Line(points = {{-297, -300}, {-297, -301}, {-281.5, -301}}, color = {0, 0, 127}));
  connect(FT723_mflow.y, FT723.in_m_flow) annotation (
    Line(points = {{551, -330}, {566, -330}, {566, -305}}, color = {0, 0, 127}));
  connect(FT713_mflow.y, FT713.in_m_flow) annotation (
    Line(points = {{391, -330}, {400, -330}, {400, -305}}, color = {0, 0, 127}));
  connect(FT733_mflow.y, FT733.in_m_flow) annotation (
    Line(points = {{231, -330}, {238, -330}, {238, -305}}, color = {0, 0, 127}));
  connect(FT703_mflow.y, FT703.in_m_flow) annotation (
    Line(points = {{71, -330}, {80, -330}, {80, -305}}, color = {0, 0, 127}));
  connect(P101_input.y, P101.in_omega) annotation (
    Line(points = {{-221, -180.5}, {-234, -180.5}, {-234, -179.8}}, color = {0, 0, 127}));
  connect(GB101_Status.y, GB101.heat_on) annotation (
    Line(points = {{-297, -334}, {-294, -334}, {-294, -318.5}, {-281.5, -318.5}}, color = {255, 0, 255}));
  connect(FCV101_theta.y, FCV101_firstOrder.u) annotation (
    Line(points = {{-199, -110}, {-204, -110}}, color = {0, 0, 127}));
  connect(FCV101_firstOrder.y, FCV101.opening) annotation (
    Line(points = {{-227, -110}, {-232, -110}}, color = {0, 0, 127}));
  connect(FCV901_firstOrder.y, FCV901.opening) annotation (
    Line(points = {{-737, 114}, {-744, 114}, {-744, 140.5}, {-749.9, 140.5}}, color = {0, 0, 127}));
  connect(FCV901_theta.y, FCV901_firstOrder.u) annotation (
    Line(points = {{-703, 113}, {-708.5, 113}, {-708.5, 114}, {-714, 114}}, color = {0, 0, 127}));
  connect(FCVC01_firstOrder.u, FCVC01_theta.y) annotation (
    Line(points = {{302, 300}, {311, 300}}, color = {0, 0, 127}));
  connect(FCVC01_firstOrder.y, FCVC01.opening) annotation (
    Line(points = {{279, 300}, {270, 300}, {270, 235}, {258, 235}}, color = {0, 0, 127}));
  connect(FCVC02_theta.y, FCVC02_firstOrder.u) annotation (
    Line(points = {{761, 300}, {752, 300}}, color = {0, 0, 127}));
  connect(FCVC02_firstOrder.y, FCVC02.opening) annotation (
    Line(points = {{729, 300}, {720, 300}, {720, 235}, {698, 235}}, color = {0, 0, 127}));
  connect(switchEX701cold.y, coldSourcePEX701.in_T0) annotation (Line(points={{159,-250},{152,-250},{152,-274},{159,-274},{159,-290.6}}, color={0,0,127}));
  connect(TT703_SP.y, switchEX701cold.u3) annotation (Line(points={{199,-280},{192,-280},{192,-258},{182,-258}}, color={0,0,127}));
  connect(boolswitchEX701cold.y, switchEX701cold.u2) annotation (Line(points={{199,-250},{182,-250}}, color={255,0,255}));
  connect(TT703_SPP.y, switchEX701cold.u1) annotation (Line(points={{199,-220},{190,-220},{190,-242},{182,-242}}, color={0,0,127}));
  connect(boolswitchEX731cold.y, switchEX731cold.u2) annotation (Line(points={{359,-250},{342,-250}}, color={255,0,255}));
  connect(TT733_SPP.y, switchEX731cold.u1) annotation (Line(points={{359,-220},{350,-220},{350,-242},{342,-242}}, color={0,0,127}));
  connect(TT733_SP.y, switchEX731cold.u3) annotation (Line(points={{359,-280},{350,-280},{350,-258},{342,-258}}, color={0,0,127}));
  connect(switchEX731cold.y, coldSourcePEX731.in_T0) annotation (Line(points={{319,-250},{312,-250},{312,-280},{319,-280},{319,-290.6}}, color={0,0,127}));
  connect(switchEX711cold.y, coldSourcePEX711.in_T0) annotation (Line(points={{479,-250},{472,-250},{472,-272},{479,-272},{479,-290.6}}, color={0,0,127}));
  connect(TT713_SPP.y, switchEX711cold.u1) annotation (Line(points={{519,-220},{512,-220},{512,-242},{502,-242}}, color={0,0,127}));
  connect(TT713_SP.y, switchEX711cold.u3) annotation (Line(points={{519,-280},{510,-280},{510,-258},{502,-258}}, color={0,0,127}));
  connect(boolswitchEX711cold.y, switchEX711cold.u2) annotation (Line(points={{519,-250},{502,-250}}, color={255,0,255}));
  connect(boolswitchEX721cold.y, switchEX721cold.u2) annotation (Line(points={{679,-250},{662,-250}}, color={255,0,255}));
  connect(TT723_SPP.y, switchEX721cold.u1) annotation (Line(points={{679,-220},{670,-220},{670,-242},{662,-242}}, color={0,0,127}));
  connect(TT723_SP.y, switchEX721cold.u3) annotation (Line(points={{679,-280},{670,-280},{670,-258},{662,-258}}, color={0,0,127}));
  connect(switchEX721cold.y, coldSourcePEX721.in_T0) annotation (Line(points={{639,-250},{634,-250},{634,-280},{641,-280},{641,-288.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-900, -500}, {900, 500}})));
end CEN_GB_LoadSimplified;
