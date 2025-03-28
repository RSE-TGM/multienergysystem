within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model CoolingPlantController
  parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCVR01[:, :] = [0, 0; 1e6, 0];
  parameter Real dmflowhot_EX701[:, :] = [0, 0; 1e6, 0];
  parameter Real dmflowhot_EX711[:, :] = [0, 0; 1e6, 0];
  parameter Real dmflowhot_EX721[:, :] = [0, 0; 1e6, 0];
  parameter Real dmflowhot_EX731[:, :] = [0, 0; 1e6, 0];
  parameter Real dTout_RR01[:, :] = [0, (15 - 30)/(30 + 273.15); 1e6, (15 - 30)/(30 + 273.15)];
  parameter Real dEX701Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX711Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX721Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dEX731Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
  parameter Real dTT704[:, :] = [0, 0; 1e3, 0];
  parameter Real dTT714[:, :] = [0, 0; 1e3, 0];
  parameter Real dTT724[:, :] = [0, 0; 1e3, 0];
  parameter Real dTT734[:, :] = [0, 0; 1e3, 0];
  //   parameter Real dTT704[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  //   parameter Real dTT714[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  //   parameter Real dTT724[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  //   parameter Real dTT734[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
  parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];
  parameter Real ddFTR00[:, :] = [0, 0; 1000, 0];
  Real Ptotal(start = 200e3);
  Real m_flow_cool_total;
  Real dm_flow_cool_total;
  Modelica.Blocks.Sources.TimeTable dthetaTCV701(table = dtheta_TCV701) annotation (
    Placement(transformation(extent = {{-74, 65}, {-64, 75}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV711(table = dtheta_TCV711) annotation (
    Placement(transformation(extent = {{-74, 50}, {-64, 60}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV721(table = dtheta_TCV721) annotation (
    Placement(transformation(extent = {{-74, 35}, {-64, 45}})));
  Modelica.Blocks.Sources.TimeTable dmflowhotEX701(table = dmflowhot_EX701) annotation (
    Placement(transformation(extent = {{-74, 5}, {-64, 15}})));
  Modelica.Blocks.Sources.TimeTable dmflowhotEX711(table = dmflowhot_EX711) annotation (
    Placement(transformation(extent = {{-74, -10}, {-64, 0}})));
  Modelica.Blocks.Sources.TimeTable dmflowhotEX721(table = dmflowhot_EX721) annotation (
    Placement(transformation(extent = {{-74, -25}, {-64, -15}})));
  Modelica.Blocks.Sources.TimeTable dmflowhotEX731(table = dmflowhot_EX731) annotation (
    Placement(transformation(extent = {{-74, -40}, {-64, -30}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin = {110, -5}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  Modelica.Blocks.Sources.TimeTable dthetaTCV731(table = dtheta_TCV731) annotation (
    Placement(transformation(extent = {{-74, 20}, {-64, 30}})));
  Modelica.Blocks.Sources.TimeTable dTT704SP(table = dTT704) annotation (
    Placement(transformation(extent = {{-5, -4}, {5, 6}})));
  Export.Interfaces.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  Modelica.Blocks.Sources.TimeTable dTT714SP(table = dTT714) annotation (
    Placement(transformation(extent = {{-5, -21}, {5, -11}})));
  Modelica.Blocks.Sources.TimeTable dTT724SP(table = dTT724) annotation (
    Placement(transformation(extent = {{-5, -40}, {5, -30}})));
  Modelica.Blocks.Sources.TimeTable dTT734SP(table = dTT734) annotation (
    Placement(transformation(extent = {{-5, -61}, {5, -51}})));
  Modelica.Blocks.Sources.TimeTable dFTR01SP(table = dFTR01) annotation (
    Placement(transformation(extent = {{-5, 115}, {5, 125}})));
  Modelica.Blocks.Sources.TimeTable dToutRR01(table = dTout_RR01) annotation (
    Placement(transformation(extent = {{-74, -75}, {-64, -65}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table = dtheta_FCVR01) annotation (
    Placement(transformation(extent = {{-74, -57}, {-64, -47}})));
  Modelica.Blocks.Sources.TimeTable dEX721PtSP(table = dEX721Pt) annotation (
    Placement(transformation(extent = {{-5, 31}, {5, 41}})));
  Modelica.Blocks.Sources.TimeTable dEX701PtSP(table = dEX701Pt) annotation (
    Placement(transformation(extent = {{-5, 65}, {5, 75}})));
  Modelica.Blocks.Sources.TimeTable dEX711PtSP(table = dEX711Pt) annotation (
    Placement(transformation(extent = {{-5, 48}, {5, 58}})));
  Modelica.Blocks.Sources.TimeTable dEX731PtSP1(table = dEX731Pt) annotation (
    Placement(transformation(extent = {{-5, 14}, {5, 24}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k = -0.5529, outMax = 0, outMin = -1, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{46, 85}, {56, 95}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(extent = {{23, 83}, {37, 97}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT704(Kp = 9.494, Ti = 1.112, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, -3}, {54, 7}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT714(Kp = 8.21, Ti = 0.9683, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, -20}, {54, -10}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(Kp = 1.6237, Ti = 0.53763, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, 49}, {54, 59}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(Kp = 1.7773, Ti = 0.5592, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, 66}, {54, 76}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(Kp = 1.4378, Ti = 0.31466, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{43, 14}, {53, 24}})));
  Modelica.Blocks.Sources.RealExpression dFTR01SPvar(y = dm_flow_cool_total) annotation (
    Placement(transformation(extent = {{-38, 81}, {-18, 101}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(Kp = 1.4734, Ti = 0.49585, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, 30}, {54, 40}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT1(Kp = 12.02, Ti = 1.272, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{45, -60}, {55, -50}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT724(Kp = 8.688, Ti = 0.9461, Umax = 0, Umin = -1, y_start = 1, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{44, -40}, {54, -30}})));
  Modelica.Blocks.Sources.TimeTable ddFTR00SP(table = ddFTR00) annotation (
    Placement(transformation(extent = {{-5, 85}, {5, 95}})));
equation
  //Ptotal = if time < 1000 then 120e3 else 160e3;
  Ptotal = 4*32.306e3;
  Ptotal = 4185*15*m_flow_cool_total;
  dm_flow_cool_total = (m_flow_cool_total - TestFacility.Data.PumpData.PR01.qnommax_inm3h*980/3600)/TestFacility.Data.PumpData.PR01.qnommax_inm3h*980/3600;
  connect(dToutRR01.y, controlSignalBus.dToutRR01) annotation (
    Line(points = {{-63.5, -70}, {-46, -70}, {-46, -68}, {-11, -68}, {-11, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(limIntegrator.y, controlSignalBus.dthetaFCVR01) annotation (
    Line(points = {{56.5, 90}, {74, 90}, {74, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(feedback.y, limIntegrator.u) annotation (
    Line(points = {{36.3, 90}, {45, 90}}, color = {0, 0, 127}));
  connect(dTT704SP.y, PI_dTT704.REF) annotation (
    Line(points = {{5.5, 1}, {22, 1}, {22, 0}, {38, 0}, {38, 4}, {45, 4}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT704, PI_dTT704.FeedBack) annotation (
    Line(points = {{-102, 0}, {-30, 0}, {-30, -2}, {43, -2}, {43, 0}, {45, 0}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dTT704.controlAction, controlSignalBus.dmflowhotEX701) annotation (
    Line(points = {{54.5, 2}, {81, 2}, {81, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_dTT714.controlAction, controlSignalBus.dmflowhotEX711) annotation (
    Line(points = {{54.5, -15}, {66, -15}, {66, -14}, {84, -14}, {84, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT714SP.y, PI_dTT714.REF) annotation (
    Line(points = {{5.5, -16}, {19, -16}, {19, -13}, {45, -13}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT714, PI_dTT714.FeedBack) annotation (
    Line(points = {{-102, 0}, {-17, 0}, {-17, -24}, {21, -24}, {21, -17}, {45, -17}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-8, 0}, {-8, 45}, {40, 45}, {40, 52}, {45, 52}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX711Pt.controlAction, controlSignalBus.dthetaTCV711) annotation (
    Line(points = {{54.5, 54}, {61, 54}, {61, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_dEX701Pt.controlAction, controlSignalBus.dthetaTCV701) annotation (
    Line(points = {{54.5, 71}, {59, 71}, {59, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_dEX711Pt.REF, dEX711PtSP.y) annotation (
    Line(points = {{45, 56}, {8, 56}, {8, 53}, {5.5, 53}}, color = {0, 0, 127}));
  connect(PI_dEX701Pt.REF, dEX701PtSP.y) annotation (
    Line(points = {{45, 73}, {8, 73}, {8, 70}, {5.5, 70}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-27, 0}, {-27, 64}, {41, 64}, {41, 69}, {45, 69}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dEX731PtSP1.y, PI_dEX731Pt.REF) annotation (
    Line(points = {{5.5, 19}, {25, 19}, {25, 21}, {44, 21}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-25, 0}, {-25, 10}, {40, 10}, {40, 17}, {44, 17}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dEX731Pt.controlAction, controlSignalBus.dthetaTCV731) annotation (
    Line(points = {{53.5, 19}, {85, 19}, {85, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dEX721PtSP.y, PI_dEX721Pt.REF) annotation (
    Line(points = {{5.5, 36}, {7, 36}, {7, 37}, {45, 37}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (
    Line(points = {{-102, 0}, {-24, 0}, {-24, 28}, {41, 28}, {41, 33}, {45, 33}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dTT734SP.y, PI_dTT1.REF) annotation (
    Line(points = {{5.5, -56}, {19, -56}, {19, -53}, {46, -53}}, color = {0, 0, 127}));
  connect(PI_dTT1.controlAction, controlSignalBus.dmflowhotEX731) annotation (
    Line(points = {{55.5, -55}, {64, -55}, {64, -54}, {85, -54}, {85, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT734, PI_dTT1.FeedBack) annotation (
    Line(points = {{-102, 0}, {-57, 0}, {-57, 1}, {-15, 1}, {-15, -62}, {41, -62}, {41, -57}, {46, -57}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dTT724SP.y, PI_dTT724.REF) annotation (
    Line(points = {{5.5, -35}, {14, -35}, {14, -36}, {22, -36}, {22, -33}, {45, -33}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT724, PI_dTT724.FeedBack) annotation (
    Line(points = {{-102, 0}, {-59, 0}, {-59, -1}, {-16, -1}, {-16, -46}, {27, -46}, {27, -37}, {45, -37}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_dTT724.controlAction, controlSignalBus.dmflowhotEX721) annotation (
    Line(points = {{54.5, -35}, {63, -35}, {63, -33}, {75, -33}, {75, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_dEX721Pt.controlAction, controlSignalBus.dthetaTCV721) annotation (
    Line(points = {{54.5, 35}, {66, 35}, {66, 36}, {81, 36}, {81, -5}, {110, -5}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.ddFTR00, feedback.u2) annotation (
    Line(points = {{-102, 0}, {-31, 0}, {-31, 80}, {30, 80}, {30, 84.4}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(dFTR01SPvar.y, feedback.u1) annotation (
    Line(points = {{-17, 91}, {-14, 91}, {-14, 90}, {-12, 90}, {-12, 105}, {16, 105}, {16, 90}, {24.4, 90}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PID
Control
System")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1})));
end CoolingPlantController;
