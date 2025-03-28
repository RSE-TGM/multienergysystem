within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model ThermalPlantController
  parameter Real dTout_GB101[:, :] = [0, (80 - 100)/(100 + 273.15); 1e6, (80 - 100)/(100 + 273.15)];
  parameter Real dTout_EB401[:, :] = [0, (80 - 100)/(100 + 273.15); 1e6, (80 - 100)/(100 + 273.15)];
  parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
  parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
  parameter Real domega_P401[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
  parameter Real dtheta_FCVC02[:, :] = [0, 0; 2e3, 0; 2.5e3, -0.9; 4e4, -0.9];
  parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dmflowcool_EX701[:, :] = [0, -0.8; 1e6, -0.8];
  parameter Real dmflowcool_EX711[:, :] = [0, -0.8; 1e6, -0.8];
  parameter Real dmflowcool_EX721[:, :] = [0, -0.8; 1e6, -0.8];
  parameter Real dmflowcool_EX731[:, :] = [0, -0.8; 1e6, -0.8];
  parameter Real dEX701Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX711Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX721Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX731Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real ddPT100[:, :] = [0, 0; 0, 0];
  parameter Real ddPTA2[:, :] = [0, 0; 0, 0];
  parameter Real dTT704[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  parameter Real dTT714[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  parameter Real dTT724[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  parameter Real dTT734[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  parameter Real dFT701[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
  parameter Real dFT711[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
  parameter Real dFT721[:, :] = [0, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 1000, (0.8 - 1.3)/1.3];
  parameter Real dTT731[:, :] = [0, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 1000, (55 - 65)/(65 + 273.15)];
  parameter Real dFT901[:, :] = [0, (3 - 8.8)/8.8; 500, (3 - 8.8)/8.8; 500, (3 - 8.8)/8.8; 1000, (3 - 8.8)/8.8];
  parameter Real dFT101[:, :] = [0, (2 - 5.7166667)/5.7166667; 500, (2 - 5.7166667)/5.7166667];
  parameter Real dFT401[:, :] = [0, (1.5 - 3.2666667)/3.2666667; 500, (1.5 - 3.2666667)/3.2666667];
  Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
    Placement(transformation(extent = {{-80, 90}, {-70, 100}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
    Placement(transformation(extent = {{-80, 75}, {-70, 85}})));
  Modelica.Blocks.Sources.TimeTable domegaP101(table = domega_P101) annotation (
    Placement(transformation(extent = {{-80, 60}, {-70, 70}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV101(table = dtheta_FCV101) annotation (
    Placement(transformation(extent = {{-80, 45}, {-70, 55}})));
  Modelica.Blocks.Sources.TimeTable domegaP401(table = domega_P401) annotation (
    Placement(transformation(extent = {{-80, 30}, {-70, 40}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV401(table = dtheta_FCV401) annotation (
    Placement(transformation(extent = {{-80, 15}, {-70, 25}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table = dtheta_FCVC02) annotation (
    Placement(transformation(extent = {{-80, 0}, {-70, 10}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV701(table = dtheta_FCV701) annotation (
    Placement(transformation(extent = {{-80, -15}, {-70, -5}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV711(table = dtheta_FCV711) annotation (
    Placement(transformation(extent = {{-80, -30}, {-70, -20}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV721(table = dtheta_FCV721) annotation (
    Placement(transformation(extent = {{-80, -45}, {-70, -35}})));
  Modelica.Blocks.Sources.TimeTable dmflowcoolEX701(table = dmflowcool_EX701) annotation (
    Placement(transformation(extent = {{-80, -75}, {-70, -65}})));
  Modelica.Blocks.Sources.TimeTable dmflowcoolEX711(table = dmflowcool_EX711) annotation (
    Placement(transformation(extent = {{-80, -90}, {-70, -80}})));
  Modelica.Blocks.Sources.TimeTable dmflowcoolEX721(table = dmflowcool_EX721) annotation (
    Placement(transformation(extent = {{-80, -105}, {-70, -95}})));
  Modelica.Blocks.Sources.TimeTable dmflowcoolEX731(table = dmflowcool_EX731) annotation (
    Placement(transformation(extent = {{-80, -120}, {-70, -110}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin = {110, -5}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = dtheta_FCV731) annotation (
    Placement(transformation(extent = {{-80, -60}, {-70, -50}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT704(Kp = 0.13801, Ti = 0.1, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, 25}, {50, 35}})));
  Modelica.Blocks.Sources.TimeTable dTT704SP(table = dTT704) annotation (
    Placement(transformation(extent = {{20, 30}, {30, 40}})));
  Export.Interfaces.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT714(Kp = 0.02135, Ti = 0.0125, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, 10}, {50, 20}})));
  Modelica.Blocks.Sources.TimeTable dTT714SP(table = dTT714) annotation (
    Placement(transformation(extent = {{20, 12}, {30, 22}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT724(Kp = 0.018753, Ti = 0.01, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -40}, {50, -30}})));
  Modelica.Blocks.Sources.TimeTable dTT724SP(table = dTT724) annotation (
    Placement(transformation(extent = {{20, -35}, {30, -25}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT734(Kp = 0.014619, Ti = 0.01, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -60}, {50, -50}})));
  Modelica.Blocks.Sources.TimeTable dTT734SP(table = dTT734) annotation (
    Placement(transformation(extent = {{20, -55}, {30, -45}})));
  Modelica.Blocks.Sources.TimeTable dFT101SP(table = dFT101) annotation (
    Placement(transformation(extent = {{20, 87}, {30, 97}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(Kp = 0.064422, Ti = 0.32626, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, 70}, {50, 80}})));
  Modelica.Blocks.Sources.TimeTable dFT401SP(table = dFT401) annotation (
    Placement(transformation(extent = {{20, 72}, {30, 82}})));
  Modelica.Blocks.Sources.TimeTable dToutEB401(table = dTout_EB401) annotation (
    Placement(transformation(extent = {{-80, 105}, {-70, 115}})));
  Modelica.Blocks.Sources.TimeTable dToutGB101(table = dTout_GB101) annotation (
    Placement(transformation(extent = {{-80, 122}, {-70, 132}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPTA2(Kp = 0.14484, Ti = 0.92999, Umax = 0, Umin = -0.4, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -80}, {50, -70}})));
  Modelica.Blocks.Sources.TimeTable ddPTA2SP(table = ddPTA2) annotation (
    Placement(transformation(extent = {{20, -75}, {30, -65}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC1(table = dtheta_FCVC01) annotation (
    Placement(transformation(extent = {{-80, -137}, {-70, -127}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPT100(Kp = 0.00024658, Ti = 0.0002, Umax = 0, Umin = -0.4, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, 55}, {50, 65}})));
  Modelica.Blocks.Sources.TimeTable ddPT100SP(table = ddPT100) annotation (
    Placement(transformation(extent = {{20, 57}, {30, 67}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(Kp = 0.064422, Ti = 0.32626, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, 85}, {50, 95}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(Kp = 2.2431, Ti = 1.1516, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -140}, {50, -130}})));
  Modelica.Blocks.Sources.TimeTable dEX721PtSP(table = dEX721Pt) annotation (
    Placement(transformation(extent = {{14, -138}, {24, -128}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(Kp = 1.5095, Ti = 0.87195, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -100}, {50, -90}})));
  Modelica.Blocks.Sources.TimeTable dEX701PtSP(table = dEX701Pt) annotation (
    Placement(transformation(extent = {{20, -95}, {30, -85}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(Kp = 1.8772, Ti = 1.0201, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -120}, {50, -110}})));
  Modelica.Blocks.Sources.TimeTable dEX711PtSP(table = dEX711Pt) annotation (
    Placement(transformation(extent = {{20, -115}, {30, -105}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(Kp = 2.2431, Ti = 1.1516, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialOutput)) annotation (
    Placement(transformation(extent = {{40, -160}, {50, -150}})));
  Modelica.Blocks.Sources.TimeTable dEX731PtSP1(table = dEX731Pt) annotation (
    Placement(transformation(extent = {{14, -155}, {24, -145}})));
equation
  connect(dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
    Line(points = {{-69.5, 5}, {6, 5}, {6, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT704SP.y, PI_TT704.REF) annotation (
    Line(points = {{30.5, 35}, {37, 35}, {37, 32}, {41, 32}}, color = {0, 0, 127}));
  connect(PI_TT704.controlAction, controlSignalBus.dthetaFCV701) annotation (
    Line(points = {{50.5, 30}, {62, 30}, {62, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT714SP.y, PI_TT714.REF) annotation (
    Line(points = {{30.5, 17}, {41, 17}}, color = {0, 0, 127}));
  connect(PI_TT714.controlAction, controlSignalBus.dthetaFCV711) annotation (
    Line(points = {{50.5, 15}, {58, 15}, {58, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_TT724.controlAction, controlSignalBus.dthetaFCV721) annotation (
    Line(points = {{50.5, -35}, {59, -35}, {59, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_TT734.controlAction, controlSignalBus.dthetaFCV731) annotation (
    Line(points = {{50.5, -55}, {57, -55}, {57, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT734SP.y, PI_TT734.REF) annotation (
    Line(points = {{30.5, -50}, {36, -50}, {36, -53}, {41, -53}}, color = {0, 0, 127}));
  connect(dFT401SP.y, PI_FT401.REF) annotation (
    Line(points = {{30.5, 77}, {41, 77}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (
    Line(points = {{-102, 0}, {11, 0}, {11, 72}, {36, 72}, {36, 73}, {41, 73}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT401.controlAction, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{50.5, 75}, {63, 75}, {63, -5}, {110, -5}}, color = {0, 0, 127}));
  connect(domegaP401.y, controlSignalBus.domegaP401) annotation (
    Line(points = {{-69.5, 35}, {-5, 35}, {-5, -8}, {110, -8}, {110, -5}}, color = {0, 0, 127}));
  connect(dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
    Line(points = {{-69.5, 80}, {-32, 80}, {-32, -5}, {110, -5}}, color = {0, 0, 127}));
  connect(dToutEB401.y, controlSignalBus.dToutEB401) annotation (
    Line(points = {{-69.5, 110}, {89, 110}, {89, -10}, {110, -10}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dToutGB101.y, controlSignalBus.dToutGB101) annotation (
    Line(points = {{-69.5, 127}, {89, 127}, {89, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT704, PI_TT704.FeedBack) annotation (
    Line(points = {{-102, 0}, {13, 0}, {13, 12}, {12, 12}, {12, 28}, {41, 28}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT714, PI_TT714.FeedBack) annotation (
    Line(points = {{-102, 0}, {36, 0}, {36, 13}, {41, 13}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT724, PI_TT724.FeedBack) annotation (
    Line(points = {{-102, 0}, {8, 0}, {8, -37}, {41, -37}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT734, PI_TT734.FeedBack) annotation (
    Line(points = {{-102, 0}, {17, 0}, {17, -57}, {41, -57}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(dTT724SP.y, PI_TT724.REF) annotation (
    Line(points = {{30.5, -30}, {34, -30}, {34, -33}, {41, -33}}, color = {0, 0, 127}));
  connect(processVariableBus.dPTA2, PI_dPTA2.FeedBack) annotation (
    Line(points = {{-102, 0}, {-3, 0}, {-3, -77}, {41, -77}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(ddPTA2SP.y, PI_dPTA2.REF) annotation (
    Line(points = {{30.5, -70}, {35, -70}, {35, -73}, {41, -73}}, color = {0, 0, 127}));
  connect(PI_dPTA2.controlAction, controlSignalBus.domegaP901) annotation (
    Line(points = {{50.5, -75}, {80, -75}, {80, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dthetaFCVC1.y, controlSignalBus.dthetaFCVC01) annotation (
    Line(points = {{-69.5, -132}, {-7, -132}, {-7, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(ddPT100SP.y, PI_dPT100.REF) annotation (
    Line(points = {{30.5, 62}, {41, 62}}, color = {0, 0, 127}));
  connect(processVariableBus.dPT102, PI_dPT100.FeedBack) annotation (
    Line(points = {{-102, 0}, {-50, 0}, {-50, 5}, {7, 5}, {7, 57}, {37, 57}, {37, 58}, {41, 58}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dPT100.controlAction, controlSignalBus.domegaP101) annotation (
    Line(points = {{50.5, 60}, {68, 60}, {68, -7}, {110, -7}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dFT101SP.y, PI_FT101.REF) annotation (
    Line(points = {{30.5, 92}, {41, 92}}, color = {0, 0, 127}));
  connect(PI_FT101.controlAction, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{50.5, 90}, {62, 90}, {62, 88}, {76, 88}, {76, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT101.FeedBack, processVariableBus.dFT101) annotation (
    Line(points = {{41, 88}, {5, 88}, {5, 2}, {-102, 2}, {-102, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dEX721PtSP.y, PI_dEX721Pt.REF) annotation (
    Line(points = {{24.5, -133}, {41, -133}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-51, 0}, {-51, -44}, {7, -44}, {7, -141}, {36, -141}, {36, -137}, {41, -137}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX721Pt.controlAction, controlSignalBus.dmflowcoolEX721) annotation (
    Line(points = {{50.5, -135}, {86, -135}, {86, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dEX701PtSP.y, PI_dEX701Pt.REF) annotation (
    Line(points = {{30.5, -90}, {34, -90}, {34, -93}, {41, -93}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {14, 0}, {14, -101}, {35, -101}, {35, -97}, {41, -97}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX701Pt.controlAction, controlSignalBus.dmflowcoolEX701) annotation (
    Line(points = {{50.5, -95}, {83, -95}, {83, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dEX711PtSP.y, PI_dEX711Pt.REF) annotation (
    Line(points = {{30.5, -110}, {33, -110}, {33, -111}, {35, -111}, {35, -113}, {41, -113}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-46, 0}, {-46, -1}, {11, -1}, {11, -119}, {36, -119}, {36, -117}, {41, -117}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX711Pt.controlAction, controlSignalBus.dmflowcoolEX711) annotation (
    Line(points = {{50.5, -115}, {88, -115}, {88, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dEX731PtSP1.y, PI_dEX731Pt.REF) annotation (
    Line(points = {{24.5, -150}, {30, -150}, {30, -153}, {41, -153}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-50, 0}, {-50, -2}, {5, -2}, {5, -157}, {41, -157}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX731Pt.controlAction, controlSignalBus.dmflowcoolEX731) annotation (
    Line(points = {{50.5, -155}, {71, -155}, {71, -149}, {90, -149}, {90, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PID
Control
System")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1})));
end ThermalPlantController;
