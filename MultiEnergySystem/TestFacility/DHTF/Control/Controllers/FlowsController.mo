within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model FlowsController
  extends ControllerBaseIII;
  //InputPressure PT731SP(nominal = 3e5);
  //Real dPT731SP(min = -1, max = 0);
  InputMassFlow FT901SP(nominal = 6);
  Real dFT901SP(min = -1, max = 0);
  InputMassFlow FT101SP(nominal = 4);
  Real dFT101SP(min = -1, max = 0);
  InputMassFlow FT401SP(nominal = 1.5);
  Real dFT401SP(min = -1, max = 0);
  InputMassFlow FT501SP(nominal = 1.5);
  Real dFT501SP(min = -1, max = 0);
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(Kp = 0.8708, Ti = 0.2669, Umax = 0, Umin = -0.4, y_start = -0.4, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-29, -658}, {-9, -638}})));
  Modelica.Blocks.Sources.RealExpression dFT101_var1(y = dFT101SP) annotation (
    Placement(transformation(extent = {{-57, -642}, {-47, -632}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(Kp = 0.6723, Ti = 0.2656, Umax = 0, Umin = -0.4, y_start = -0.4, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-29, -694}, {-9, -674}})));
  Modelica.Blocks.Sources.RealExpression dFT401SP_var(y = dFT401SP) annotation (
    Placement(transformation(extent = {{-57, -677}, {-47, -667}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT501(Kp = 0.45445, Ti = 0.26617, Umax = 0, Umin = -0.4, y_start = -0.4, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-29, -730}, {-9, -710}})));
  Modelica.Blocks.Sources.RealExpression dFT501SP_var1(y = dFT501SP) annotation (
    Placement(transformation(extent = {{-57, -711}, {-47, -701}})));
equation
  connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
    Line(points = {{-112.5, 117}, {-112.5, 132}, {-76, 132}, {-76, 200}, {160, 200}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{-112.5, 7}, {-112.5, 28}, {-72, 28}, {-72, 196}, {160, 196}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (
    Line(points = {{-112.5, -26}, {-110, -26}, {-110, -10}, {-70, -10}, {-70, 194}, {160, 194}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{-112.5, -133}, {-112.5, -116}, {-76, -116}, {-76, -76}, {160, -76}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (
    Line(points = {{-112.5, -166}, {-110, -166}, {-110, -156}, {-72, -156}, {-72, -78}, {160, -78}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501) annotation (
    Line(points = {{-22.5, -150}, {-20, -150}, {-20, -144}, {12, -144}, {12, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01) annotation (
    Line(points = {{-21.5, -16}, {-20, -16}, {-20, -30}, {162, -30}, {162, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
    Line(points = {{-21.5, -50}, {-20, -50}, {-20, -34}, {158, -34}, {158, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01) annotation (
    Line(points = {{67.5, 23}, {67.5, 26}, {160, 26}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dToutRR01.y, controlSignalBus.dToutRR01) annotation (
    Line(points = {{67.5, -10}, {70, -10}, {70, 8}, {160, 8}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  //dPT731SP =  (PT731SP - 3e5)/3e5;
  dFT901SP = (FT901SP - 5.5)/5.5;
  dFT101SP = (FT101SP - 4)/4;
  dFT401SP = (FT401SP - 1.5)/1.5;
  dFT501SP = (FT501SP - 1.5)/1.5;
  connect(processVariableBus.dFT101, PI_FT101.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -650}, {-27, -650}, {-27, -652}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT101.controlAction, controlSignalBus.domegaP101) annotation (
    Line(points = {{-8, -648}, {12, -648}, {12, -650}, {160, -650}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP901.y, controlSignalBus.domegaP901) annotation (
    Line(points = {{-111.5, 150}, {-110, 150}, {-110, 162}, {-78, 162}, {-78, 200}, {160, 200}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT401.controlAction, controlSignalBus.domegaP401) annotation (
    Line(points = {{-8, -684}, {160, -684}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dFT101_var1.y, PI_FT101.REF) annotation (
    Line(points = {{-46.5, -637}, {-38, -637}, {-38, -644}, {-27, -644}}, color = {0, 0, 127}));
  connect(dFT401SP_var.y, PI_FT401.REF) annotation (
    Line(points = {{-46.5, -672}, {-38, -672}, {-38, -680}, {-27, -680}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -688}, {-27, -688}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dFT501SP_var1.y, PI_FT501.REF) annotation (
    Line(points = {{-46.5, -706}, {-38, -706}, {-38, -716}, {-27, -716}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT501, PI_FT501.FeedBack) annotation (
    Line(points = {{-170, -2}, {-172, -2}, {-172, -724}, {-27, -724}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT501.controlAction, controlSignalBus.domegaP501) annotation (
    Line(points = {{-8, -720}, {160, -720}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
end FlowsController;
