within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model ControllerBaseForFigure
  constant Real pi = Modelica.Constants.pi;
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
  parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
  parameter Boolean useRealExpression = true "true if use RealExpression blocks as set-point variables";
  // Rack CD
  parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
  parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];
  // S900
  parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
  // S100
  parameter Real dTout_GB101[:, :] = [0, 0; 1e6, 0];
  parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
  // S400
  parameter Real dTout_EB401[:, :] = [0, 0; 1e6, 0];
  parameter Real domega_P401[:, :] = [0, (35 - 50)/50; 1e6, (35 - 50)/50];
  parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
  // S500
  parameter Real dTout_CHP501[:, :] = [0, 0; 1e6, 0];
  parameter Real domega_P501[:, :] = [0, (35 - 50)/50; 1e6, (35 - 50)/50];
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_nom = TestFacility.Data.PumpData.P501.qnommax_inm3h*980/3600;
  // S700
  parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
  parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
  // Cooling System RR
  parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
  parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
  parameter Real dTout_RR01[:, :] = [0, (15 - 30)/(30 + 273.15); 1e6, (15 - 30)/(30 + 273.15)];
  parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];
  // Controllers' parameters
  parameter Real Kp_TT701 = -0.2743;
  parameter Real Ti_TT701 = 0.7859;
  parameter Real Kp_TT711 = -0.15;
  parameter Real Ti_TT711 = 0.7859;
  parameter Real Kp_TT721 = -0.15;
  parameter Real Ti_TT721 = 1;
  parameter Real Kp_TT731 = -0.2;
  parameter Real Ti_TT731 = 2;
  parameter Real Ki_TT701 = -0.3086;
  parameter Real Ki_PtEX701 = 0.08;
  parameter Real Ki_PtEX711 = 0.1;
  parameter Real Ki_PtEX721 = 0.1;
  parameter Real Ki_PtEX731 = 0.5;
  // S900
  DistrictHeatingNetwork.Types.PerUnit theta_FCV901SP;
  Real dtheta_FCV901_var(min = -1, max = 0);
  Boolean booldthetaFCV901;
  DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
  Real domega_P901_var(min = -1, max = 0);
  Boolean booldomegaP901;
  // S100
  DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
  Real dtheta_FCV101_var(min = -1, max = 0);
  Boolean booldthetaFCV101;
  DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
  Real domega_P101_var(min = -1, max = 0);
  Boolean booldomegaP101;
  DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
  Real dTout_GB101_var(min = -1, max = 0);
  Boolean booldToutGB101;
  // S400
  DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
  Real dtheta_FCV401_var(min = -1, max = 0);
  Boolean booldthetaFCV401;
  DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
  Real domega_P401_var(min = -1, max = 0);
  Boolean booldomegaP401;
  DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
  Real dTout_EB401_var(min = -1, max = 0);
  Boolean booldToutEB401;
  // S500
  DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
  Real domega_P501_var(min = -1, max = 0);
  Boolean booldomegaP501;
  DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
  Real dTout_CHP501_var(min = -1, max = 0);
  Boolean booldToutCHP501;
  // S700
  DistrictHeatingNetwork.Types.PerUnit theta_FCV701SP;
  Real dtheta_FCV701_var(min = -1, max = 0);
  Boolean booldthetaFCV701;
  DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
  Real dtheta_FCV711_var(min = -1, max = 0);
  Boolean booldthetaFCV711;
  DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
  Real dtheta_FCV721_var(min = -1, max = 0);
  Boolean booldthetaFCV721;
  DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
  Real dtheta_FCV731_var(min = -1, max = 0);
  Boolean booldthetaFCV731;
  // Rack
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
  Real dtheta_FCVC01_var(min = -1, max = 0);
  Boolean booldthetaFCVC01;
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
  Real dtheta_FCVC02_var(min = -1, max = 0);
  Boolean booldthetaFCVC02;
  // Cooling
  DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
  Real dtheta_TCV701_var(min = -1, max = 0);
  Boolean booldthetaTCV701;
  DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
  Real dtheta_TCV711_var(min = -1, max = 0);
  Boolean booldthetaTCV711;
  DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
  Real dtheta_TCV721_var(min = -1, max = 0);
  Boolean booldthetaTCV721;
  DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
  Real dtheta_TCV731_var(min = -1, max = 0);
  Boolean booldthetaTCV731;
  DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
  Real dtheta_FCVR01_var(min = -1, max = 0);
  Boolean booldthetaFCVR01;
  DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
  Real dTout_RR01_var(min = -1, max = 0);
  Boolean booldToutRR01;
  // Set-points
  //Real FT101SP(nominal = 5.7166667);
  //Real dFT101SP(min = -1, max = 0);
  // Real FT401SP(nominal = 3.2666667);
  //Real dFT401SP(min = -1, max = 0);
  //   Real FT501SP(nominal = FT501_nom);
  //   Real dFT501SP(min = -1, max = 0);
  Real FT701SP(nominal = 2);
  Real dFT701SP(min = -1, max = 0);
  Real FT711SP(nominal = 2);
  Real dFT711SP(min = -1, max = 0);
  Real FT721SP(nominal = 2);
  Real dFT721SP(min = -1, max = 0);
  Real FT731SP(nominal = 2);
  Real dFT731SP(min = -1, max = 0);
  InputTemperature TT701SP(nominal = Tout_gen_nom);
  InputTemperature TT711SP(nominal = Tout_gen_nom);
  InputTemperature TT721SP(nominal = Tout_gen_nom);
  InputTemperature TT731SP(nominal = Tout_gen_nom);
  Real dTT701SP(min = -1, max = 0);
  Real dTT711SP(min = -1, max = 0);
  Real dTT721SP(min = -1, max = 0);
  Real dTT731SP(min = -1, max = 0);
  InputBoolean booldTT701;
  InputBoolean booldTT711;
  InputBoolean booldTT721;
  InputBoolean booldTT731;
  parameter Real dTT_701[:, :] = [0, 0; 1E6, 0];
  parameter Real dTT_711[:, :] = [0, 0; 1E6, 0];
  parameter Real dTT_721[:, :] = [0, 0; 1E6, 0];
  parameter Real dTT_731[:, :] = [0, 0; 1E6, 0];
  // Powers
  InputPower PtEX701SP(nominal = 100E3);
  InputPower PtEX711SP(nominal = 100E3);
  InputPower PtEX721SP(nominal = 100E3);
  InputPower PtEX731SP(nominal = 100E3);
  Real dPtEX701SP(min = -1, max = 0);
  Real dPtEX711SP(min = -1, max = 0);
  Real dPtEX721SP(min = -1, max = 0);
  Real dPtEX731SP(min = -1, max = 0);
  InputBoolean booldPtEX701;
  InputBoolean booldPtEX711;
  InputBoolean booldPtEX721;
  InputBoolean booldPtEX731;
  parameter Real dPt_EX701[:, :] = [0, 0; 1E6, 0];
  parameter Real dPt_EX711[:, :] = [0, 0; 1E6, 0];
  parameter Real dPt_EX721[:, :] = [0, 0; 1E6, 0];
  parameter Real dPt_EX731[:, :] = [0, 0; 1E6, 0];
  connector InputBoolean = input Boolean;
  connector InputPower = input DistrictHeatingNetwork.Types.Power;
  connector InputTemperature = input DistrictHeatingNetwork.Types.Temperature;
  connector InputPressure = input DistrictHeatingNetwork.Types.Pressure;
  connector InputMassFlow = input DistrictHeatingNetwork.Types.MassFlowRate;
  Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
    Placement(transformation(extent = {{-141, 135}, {-131, 145}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
    Placement(transformation(extent = {{-141, 102}, {-131, 112}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  Modelica.Blocks.Sources.TimeTable dToutGB101(table = dTout_GB101) annotation (
    Placement(transformation(extent = {{-141, -41}, {-131, -31}})));
  Modelica.Blocks.Sources.RealExpression domegaP901_var(y = domega_P901_var) annotation (
    Placement(transformation(extent = {{-141, 155}, {-131, 165}})));
  Modelica.Blocks.Logical.Switch switch_domegaP901 annotation (
    Placement(transformation(extent = {{-122, 145}, {-112, 155}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP901(y = booldomegaP901) annotation (
    Placement(transformation(extent = {{-141, 145}, {-131, 155}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV901(y = booldthetaFCV901) annotation (
    Placement(transformation(extent = {{-141, 112}, {-131, 122}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV901_var(y = dtheta_FCV901_var) annotation (
    Placement(transformation(extent = {{-141, 121}, {-131, 131}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV901 annotation (
    Placement(transformation(extent = {{-123, 112}, {-113, 122}})));
  Modelica.Blocks.Sources.TimeTable domegaP101(table = domega_P101) annotation (
    Placement(transformation(extent = {{-141, 25}, {-131, 35}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV101(table = dtheta_FCV101) annotation (
    Placement(transformation(extent = {{-141, -8}, {-131, 2}})));
  Modelica.Blocks.Sources.RealExpression domegaP101_var(y = domega_P101_var) annotation (
    Placement(transformation(extent = {{-141, 45}, {-131, 55}})));
  Modelica.Blocks.Logical.Switch switch_domegaP101 annotation (
    Placement(transformation(extent = {{-122, 35}, {-112, 45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP101(y = booldomegaP101) annotation (
    Placement(transformation(extent = {{-141, 35}, {-131, 45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV101(y = booldthetaFCV101) annotation (
    Placement(transformation(extent = {{-141, 2}, {-131, 12}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV101_var(y = dtheta_FCV101_var) annotation (
    Placement(transformation(extent = {{-141, 11}, {-131, 21}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV101 annotation (
    Placement(transformation(extent = {{-123, 2}, {-113, 12}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutGB101(y = booldToutGB101) annotation (
    Placement(transformation(extent = {{-141, -31}, {-131, -21}})));
  Modelica.Blocks.Sources.RealExpression dToutGB101_var(y = dTout_GB101_var) annotation (
    Placement(transformation(extent = {{-141, -22}, {-131, -12}})));
  Modelica.Blocks.Logical.Switch switch_dToutGB101 annotation (
    Placement(transformation(extent = {{-123, -31}, {-113, -21}})));
  Modelica.Blocks.Sources.TimeTable dToutEB401(table = dTout_EB401) annotation (
    Placement(transformation(extent = {{-51, -41}, {-41, -31}})));
  Modelica.Blocks.Sources.TimeTable domegaP401(table = domega_P401) annotation (
    Placement(transformation(extent = {{-51, 25}, {-41, 35}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV401(table = dtheta_FCV401) annotation (
    Placement(transformation(extent = {{-51, -8}, {-41, 2}})));
  Modelica.Blocks.Sources.RealExpression domegaP401_var(y = domega_P401_var) annotation (
    Placement(transformation(extent = {{-51, 45}, {-41, 55}})));
  Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (
    Placement(transformation(extent = {{-32, 35}, {-22, 45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y = booldomegaP401) annotation (
    Placement(transformation(extent = {{-51, 35}, {-41, 45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y = booldthetaFCV401) annotation (
    Placement(transformation(extent = {{-51, 2}, {-41, 12}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y = dtheta_FCV401_var) annotation (
    Placement(transformation(extent = {{-51, 11}, {-41, 21}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (
    Placement(transformation(extent = {{-33, 2}, {-23, 12}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y = booldToutEB401) annotation (
    Placement(transformation(extent = {{-51, -31}, {-41, -21}})));
  Modelica.Blocks.Sources.RealExpression dToutEB401_var(y = dTout_EB401_var) annotation (
    Placement(transformation(extent = {{-51, -22}, {-41, -12}})));
  Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (
    Placement(transformation(extent = {{-33, -31}, {-23, -21}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table = dtheta_FCVC01) annotation (
    Placement(transformation(extent = {{-52, 137}, {-42, 147}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y = booldthetaFCVC01) annotation (
    Placement(transformation(extent = {{-52, 147}, {-42, 157}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y = dtheta_FCVC01_var) annotation (
    Placement(transformation(extent = {{-52, 156}, {-42, 166}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (
    Placement(transformation(extent = {{-34, 147}, {-24, 157}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table = dtheta_FCVC02) annotation (
    Placement(transformation(extent = {{-52, 103}, {-42, 113}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y = booldthetaFCVC02) annotation (
    Placement(transformation(extent = {{-52, 113}, {-42, 123}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y = dtheta_FCVC02_var) annotation (
    Placement(transformation(extent = {{-52, 122}, {-42, 132}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (
    Placement(transformation(extent = {{-34, 113}, {-24, 123}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table = dtheta_FCVR01) annotation (
    Placement(transformation(extent = {{39, 136}, {49, 146}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVR01(y = booldthetaFCVR01) annotation (
    Placement(transformation(extent = {{39, 146}, {49, 156}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVR01_var(y = dtheta_FCVR01_var) annotation (
    Placement(transformation(extent = {{39, 155}, {49, 165}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVR01 annotation (
    Placement(transformation(extent = {{57, 146}, {67, 156}})));
  Modelica.Blocks.Sources.TimeTable dToutRR01(table = dTout_RR01) annotation (
    Placement(transformation(extent = {{39, 103}, {49, 113}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutRR01(y = booldToutRR01) annotation (
    Placement(transformation(extent = {{39, 113}, {49, 123}})));
  Modelica.Blocks.Sources.RealExpression dToutRR01_var(y = dTout_RR01_var) annotation (
    Placement(transformation(extent = {{39, 122}, {49, 132}})));
  Modelica.Blocks.Logical.Switch switch_dToutRR01 annotation (
    Placement(transformation(extent = {{57, 113}, {67, 123}})));
  Modelica.Blocks.Sources.TimeTable dToutCHP501(table = dTout_CHP501) annotation (
    Placement(transformation(extent = {{39, -5}, {49, 5}})));
  Modelica.Blocks.Sources.TimeTable domegaP501(table = domega_P501) annotation (
    Placement(transformation(extent = {{39, 30}, {49, 40}})));
  Modelica.Blocks.Sources.RealExpression domegaP501_var(y = domega_P501_var) annotation (
    Placement(transformation(extent = {{39, 50}, {49, 60}})));
  Modelica.Blocks.Logical.Switch switch_domegaP501 annotation (
    Placement(transformation(extent = {{58, 40}, {68, 50}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP501(y = booldomegaP501) annotation (
    Placement(transformation(extent = {{39, 40}, {49, 50}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutCHP501(y = booldToutCHP501) annotation (
    Placement(transformation(extent = {{39, 5}, {49, 15}})));
  Modelica.Blocks.Sources.RealExpression dToutCHP501_var(y = dTout_CHP501_var) annotation (
    Placement(transformation(extent = {{39, 14}, {49, 24}})));
  Modelica.Blocks.Logical.Switch switch_dToutCHP501 annotation (
    Placement(transformation(extent = {{57, 5}, {67, 15}})));
  Export.Interfaces.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin = {-170, -2}, extent = {{50, 40}, {-50, -40}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT701(Kp = Kp_TT701, Ti = Ti_TT701, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-52, -128}, {-32, -108}})));
  Modelica.Blocks.Sources.RealExpression dTT701_SP_var(y = dTT701SP) annotation (
    Placement(transformation(extent = {{-96, -99}, {-86, -89}})));
  Modelica.Blocks.Sources.RealExpression dTT711_SP_var(y = dTT711SP) annotation (
    Placement(transformation(extent = {{-96, -135}, {-86, -125}})));
  Modelica.Blocks.Sources.RealExpression dTT721_SP_var(y = dTT721SP) annotation (
    Placement(transformation(extent = {{-96, -166}, {-86, -156}})));
  Modelica.Blocks.Sources.RealExpression dTT731SP_var(y = dTT731SP) annotation (
    Placement(transformation(extent = {{-96, -196}, {-86, -186}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT711(Kp = Kp_TT711, Ti = Ti_TT711, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-52, -162}, {-32, -142}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT721(Kp = Kp_TT721, Ti = Ti_TT721, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-52, -192}, {-32, -172}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT731(Kp = Kp_TT731, Ti = Ti_TT731, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-52, -221}, {-32, -201}})));
  Modelica.Blocks.Sources.RealExpression dPtEX701_var(y = dPtEX701SP) annotation (
    Placement(transformation(extent = {{-97, -259}, {-87, -249}})));
  Modelica.Blocks.Sources.RealExpression dPtEX721_var(y = dPtEX721SP) annotation (
    Placement(transformation(extent = {{-97, -340}, {-87, -330}})));
  Modelica.Blocks.Sources.RealExpression dPtEX731_var(y = dPtEX731SP) annotation (
    Placement(transformation(extent = {{-97, -380}, {-87, -370}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX731 annotation (
    Placement(transformation(extent = {{-78, -387}, {-68, -377}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX731(y = booldPtEX731) annotation (
    Placement(transformation(extent = {{-97, -387}, {-87, -377}})));
  Modelica.Blocks.Sources.TimeTable dPtEX731(table = dPt_EX731) annotation (
    Placement(transformation(extent = {{-97, -397}, {-87, -387}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX701 annotation (
    Placement(transformation(extent = {{-78, -268}, {-68, -258}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX701(y = booldPtEX701) annotation (
    Placement(transformation(extent = {{-97, -268}, {-87, -258}})));
  Modelica.Blocks.Sources.TimeTable dPtEX701(table = dPt_EX701) annotation (
    Placement(transformation(extent = {{-97, -279}, {-87, -269}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX721 annotation (
    Placement(transformation(extent = {{-77, -347}, {-67, -337}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX721(y = booldPtEX721) annotation (
    Placement(transformation(extent = {{-97, -347}, {-87, -337}})));
  Modelica.Blocks.Sources.TimeTable dPtEX721(table = dPt_EX721) annotation (
    Placement(transformation(extent = {{-97, -357}, {-87, -347}})));
  Modelica.Blocks.Logical.Switch switch_dTT701 annotation (
    Placement(transformation(extent = {{-77, -107}, {-67, -97}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT701_SP(y = booldTT701) annotation (
    Placement(transformation(extent = {{-96, -107}, {-86, -97}})));
  Modelica.Blocks.Sources.TimeTable dTT701_SP(table = dTT_701) annotation (
    Placement(transformation(extent = {{-96, -117}, {-86, -107}})));
  Modelica.Blocks.Logical.Switch switch_dTT711 annotation (
    Placement(transformation(extent = {{-77, -142}, {-67, -132}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT711_SP(y = booldTT711) annotation (
    Placement(transformation(extent = {{-96, -142}, {-86, -132}})));
  Modelica.Blocks.Sources.TimeTable dTT711_SP(table = dTT_711) annotation (
    Placement(transformation(extent = {{-96, -152}, {-86, -142}})));
  Modelica.Blocks.Logical.Switch switch_dTT721 annotation (
    Placement(transformation(extent = {{-77, -173}, {-67, -163}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT721_SP(y = booldTT721) annotation (
    Placement(transformation(extent = {{-96, -173}, {-86, -163}})));
  Modelica.Blocks.Sources.TimeTable dTT721_SP(table = dTT_721) annotation (
    Placement(transformation(extent = {{-96, -183}, {-86, -173}})));
  Modelica.Blocks.Logical.Switch switch_dTT731 annotation (
    Placement(transformation(extent = {{-77, -203}, {-67, -193}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT731_SP(y = booldTT731) annotation (
    Placement(transformation(extent = {{-96, -203}, {-86, -193}})));
  Modelica.Blocks.Sources.TimeTable dTT731_SP(table = dTT_731) annotation (
    Placement(transformation(extent = {{-96, -213}, {-86, -203}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT701(Kp = 0.1128, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-14, -289}, {6, -269}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT711(Kp = 0.13279, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-14, -328}, {6, -308}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT721(Kp = 0.1456, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-13, -368}, {7, -348}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT731(Kp = 0.1456, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-13, -406}, {7, -386}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX701Pt1(Ki = Ki_PtEX701, Umax = 0, Umin = -1, y_start = 0) annotation (
    Placement(transformation(extent = {{-51, -289}, {-31, -269}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX711Pt1(Ki = Ki_PtEX711, Umax = 0, Umin = -1, y_start = 0) annotation (
    Placement(transformation(extent = {{-51, -328}, {-31, -308}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX721Pt1(Ki = Ki_PtEX721, Umax = 0, Umin = -1, y_start = 0) annotation (
    Placement(transformation(extent = {{-51, -367}, {-31, -347}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX731Pt1(Ki = Ki_PtEX731, Umax = 0, Umin = -1, y_start = 0) annotation (
    Placement(transformation(extent = {{-51, -406}, {-31, -386}})));
  Modelica.Blocks.Sources.RealExpression dPtEX711_var(y = dPtEX711SP) annotation (
    Placement(transformation(extent = {{-97, -301}, {-87, -291}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX711 annotation (
    Placement(transformation(extent = {{-78, -308}, {-68, -298}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX711(y = booldPtEX711) annotation (
    Placement(transformation(extent = {{-97, -308}, {-87, -298}})));
  Modelica.Blocks.Sources.TimeTable dPtEX711(table = dPt_EX711) annotation (
    Placement(transformation(extent = {{-97, -319}, {-87, -309}})));
equation
  // S900
  dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
  theta_FCV901SP = 1;
  //booldthetaFCV901 = true;
  domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;
  omega_P901SP = 2*pi*35;
  //booldomegaP901 = true;
  // S100
  dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
  theta_FCV101SP = 1;
  //booldthetaFCV101 = true;
  domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
  omega_P101SP = 2*pi*50;
  //booldomegaP101 = true;
  dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_GB101SP = 80 + 273.15;
  //booldToutGB101 = true;
  // S400
  dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
  theta_FCV401SP = 1;
  //booldthetaFCV401 = true;
  domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
  omega_P401SP = 2*pi*35;
  //booldomegaP401 = true;
  dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_EB401SP = 80 + 273.15;
  //booldToutEB401 = true;
  // S500
  domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
  omega_P501SP = 2*pi*35;
  //booldomegaP501 = true;
  dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_CHP501SP = 80 + 273.15;
  //booldToutCHP501 = true;
  // S700
  dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
  theta_FCV701SP = 1;
  //booldthetaFCV701 = true;
  dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
  theta_FCV711SP = 1;
  //booldthetaFCV711 = true;
  dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
  theta_FCV721SP = 1;
  //booldthetaFCV721 = true;
  dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;
  theta_FCV731SP = 1;
  //booldthetaFCV731 = true;
  // Rack
  dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
  theta_FCVC01SP = 1;
  //booldthetaFCVC01 = true;
  dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;
  theta_FCVC02SP = 1;
  //booldthetaFCVC02 = true;
  // RR00
  dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
  theta_TCV701SP = 1;
  //booldthetaTCV701 = true;
  dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
  theta_TCV711SP = 1;
  //booldthetaTCV711 = true;
  dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
  theta_TCV721SP = 1;
  //booldthetaTCV721 = true;
  dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
  theta_TCV731SP = 1;
  //booldthetaTCV731 = true;
  dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
  theta_FCVR01SP = if time < 8e3 then 1 else 0.5;
  //booldthetaFCVR01 = true;
  dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_RR01SP = 40 + 273.15;
  //booldToutRR01 = true;
  //Set-points
  //FT101SP = 1.7;
  //dFT101SP = (FT101SP - 5.7166667)/5.7166667;
  //FT401SP = 1.33;
  //FT401SP = if time < 1e3 then 1.3 elseif time < 2e3 then -0.00053*time + 1.9 else 0.8;
  //dFT401SP = (FT401SP - 3.2666667)/3.2666667;
  //   FT501SP = 2.1;
  //   dFT501SP = (FT501SP - FT501_nom)/FT501_nom;
  FT701SP = 0.7;
  dFT701SP = (FT701SP - 2)/2;
  FT711SP = 0.6;
  dFT711SP = (FT711SP - 2)/2;
  FT721SP = 0.6;
  dFT721SP = (FT721SP - 2)/2;
  FT731SP = 0.6;
  dFT731SP = (FT721SP - 2)/2;
  //TT701SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  //TT701SP = if time < 6e3 then 70 + 273.15 else 65 + 273.15;
  //TT701SP = 70 + 273.15;
  dTT701SP = (TT701SP - (100 + 273.15))/(100 + 273.15);
  //TT711SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  //dTT711SP = (TT711SP - (60 + 273.15))/(100 + 273.15);
  //TT711SP = 70 + 273.15;
  //TT711SP = if time < 6e3 then 70 + 273.15 else 65 + 273.15;
  dTT711SP = (TT711SP - (100 + 273.15))/(100 + 273.15);
  //TT721SP = 70 + 273.15;
  dTT721SP = (TT721SP - (100 + 273.15))/(100 + 273.15);
  //   TT721SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  //   dTT721SP = (TT721SP - (60 + 273.15))/(100 + 273.15);
  //TT731SP = 70 + 273.15;
  dTT731SP = (TT731SP - (100 + 273.15))/(100 + 273.15);
  //TT731SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  //dTT731SP = (TT731SP - (60 + 273.15))/(100 + 273.15);
  //PtEX701SP = 40e3;
  dPtEX701SP = (PtEX701SP - 100e3)/100e3;
  //PtEX711SP = 35e3;
  dPtEX711SP = (PtEX711SP - 100e3)/100e3;
  //PtEX721SP = 35e3;
  dPtEX721SP = (PtEX721SP - 100e3)/100e3;
  //PtEX731SP = 25e3;
  dPtEX731SP = (PtEX731SP - 100e3)/100e3;
  if useRealExpression then
    // S100
    booldthetaFCV101 = true;
    booldomegaP101 = true;
    booldToutGB101 = true;
    // S400
    booldthetaFCV401 = true;
    booldomegaP401 = true;
    booldToutEB401 = true;
    // S500
    booldomegaP501 = true;
    booldToutCHP501 = true;
    // S700
    booldthetaFCV701 = true;
    booldthetaFCV711 = true;
    booldthetaFCV721 = true;
    booldthetaFCV731 = true;
    // S900
    booldthetaFCV901 = true;
    booldomegaP901 = true;
    // Rack CD
    booldthetaFCVC01 = true;
    booldthetaFCVC02 = true;
    // RR00
    booldthetaTCV701 = true;
    booldthetaTCV711 = true;
    booldthetaTCV721 = true;
    booldthetaTCV731 = true;
    booldthetaFCVR01 = true;
    booldToutRR01 = true;
  else
    // S100
    booldthetaFCV101 = false;
    booldomegaP101 = false;
    booldToutGB101 = false;
    // S400
    booldthetaFCV401 = false;
    booldomegaP401 = false;
    booldToutEB401 = false;
    // S500
    booldomegaP501 = false;
    booldToutCHP501 = false;
    // S700
    booldthetaFCV701 = false;
    booldthetaFCV711 = false;
    booldthetaFCV721 = false;
    booldthetaFCV731 = false;
    // S900
    booldthetaFCV901 = false;
    booldomegaP901 = false;
    // Rack CD
    booldthetaFCVC01 = false;
    booldthetaFCVC02 = false;
    // RR00
    booldthetaTCV701 = false;
    booldthetaTCV711 = false;
    booldthetaTCV721 = false;
    booldthetaTCV731 = false;
    booldthetaFCVR01 = false;
    booldToutRR01 = false;
  end if;
  connect(domegaP901_var.y, switch_domegaP901.u1) annotation (
    Line(points = {{-130.5, 160}, {-127, 160}, {-127, 154}, {-123, 154}}, color = {0, 0, 127}));
  connect(bool_domegaP901.y, switch_domegaP901.u2) annotation (
    Line(points = {{-130.5, 150}, {-123, 150}}, color = {255, 0, 255}));
  connect(domegaP901.y, switch_domegaP901.u3) annotation (
    Line(points = {{-130.5, 140}, {-127, 140}, {-127, 146}, {-123, 146}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV901.y, switch_dthetaFCV901.u2) annotation (
    Line(points = {{-130.5, 117}, {-124, 117}}, color = {255, 0, 255}));
  connect(dthetaFCV901_var.y, switch_dthetaFCV901.u1) annotation (
    Line(points = {{-130.5, 126}, {-127, 126}, {-127, 121}, {-124, 121}}, color = {0, 0, 127}));
  connect(dthetaFCV901.y, switch_dthetaFCV901.u3) annotation (
    Line(points = {{-130.5, 107}, {-127, 107}, {-127, 113}, {-124, 113}}, color = {0, 0, 127}));
  connect(domegaP101_var.y, switch_domegaP101.u1) annotation (
    Line(points = {{-130.5, 50}, {-127, 50}, {-127, 44}, {-123, 44}}, color = {0, 0, 127}));
  connect(bool_domegaP101.y, switch_domegaP101.u2) annotation (
    Line(points = {{-130.5, 40}, {-123, 40}}, color = {255, 0, 255}));
  connect(domegaP101.y, switch_domegaP101.u3) annotation (
    Line(points = {{-130.5, 30}, {-127, 30}, {-127, 36}, {-123, 36}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV101.y, switch_dthetaFCV101.u2) annotation (
    Line(points = {{-130.5, 7}, {-124, 7}}, color = {255, 0, 255}));
  connect(dthetaFCV101_var.y, switch_dthetaFCV101.u1) annotation (
    Line(points = {{-130.5, 16}, {-127, 16}, {-127, 11}, {-124, 11}}, color = {0, 0, 127}));
  connect(dthetaFCV101.y, switch_dthetaFCV101.u3) annotation (
    Line(points = {{-130.5, -3}, {-127, -3}, {-127, 3}, {-124, 3}}, color = {0, 0, 127}));
  connect(bool_dToutGB101.y, switch_dToutGB101.u2) annotation (
    Line(points = {{-130.5, -26}, {-124, -26}}, color = {255, 0, 255}));
  connect(dToutGB101_var.y, switch_dToutGB101.u1) annotation (
    Line(points = {{-130.5, -17}, {-127, -17}, {-127, -22}, {-124, -22}}, color = {0, 0, 127}));
  connect(dToutGB101.y, switch_dToutGB101.u3) annotation (
    Line(points = {{-130.5, -36}, {-127, -36}, {-127, -30}, {-124, -30}}, color = {0, 0, 127}));
  connect(domegaP401_var.y, switch_domegaP401.u1) annotation (
    Line(points = {{-40.5, 50}, {-37, 50}, {-37, 44}, {-33, 44}}, color = {0, 0, 127}));
  connect(bool_domegaP401.y, switch_domegaP401.u2) annotation (
    Line(points = {{-40.5, 40}, {-33, 40}}, color = {255, 0, 255}));
  connect(domegaP401.y, switch_domegaP401.u3) annotation (
    Line(points = {{-40.5, 30}, {-37, 30}, {-37, 36}, {-33, 36}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV401.y, switch_dthetaFCV401.u2) annotation (
    Line(points = {{-40.5, 7}, {-34, 7}}, color = {255, 0, 255}));
  connect(dthetaFCV401_var.y, switch_dthetaFCV401.u1) annotation (
    Line(points = {{-40.5, 16}, {-37, 16}, {-37, 11}, {-34, 11}}, color = {0, 0, 127}));
  connect(dthetaFCV401.y, switch_dthetaFCV401.u3) annotation (
    Line(points = {{-40.5, -3}, {-37, -3}, {-37, 3}, {-34, 3}}, color = {0, 0, 127}));
  connect(bool_dToutEB401.y, switch_dToutEB401.u2) annotation (
    Line(points = {{-40.5, -26}, {-34, -26}}, color = {255, 0, 255}));
  connect(dToutEB401_var.y, switch_dToutEB401.u1) annotation (
    Line(points = {{-40.5, -17}, {-37, -17}, {-37, -22}, {-34, -22}}, color = {0, 0, 127}));
  connect(dToutEB401.y, switch_dToutEB401.u3) annotation (
    Line(points = {{-40.5, -36}, {-37, -36}, {-37, -30}, {-34, -30}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVC01.y, switch_dthetaFCVC01.u2) annotation (
    Line(points = {{-41.5, 152}, {-35, 152}}, color = {255, 0, 255}));
  connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (
    Line(points = {{-41.5, 161}, {-38, 161}, {-38, 156}, {-35, 156}}, color = {0, 0, 127}));
  connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (
    Line(points = {{-41.5, 142}, {-38, 142}, {-38, 148}, {-35, 148}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (
    Line(points = {{-41.5, 118}, {-35, 118}}, color = {255, 0, 255}));
  connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (
    Line(points = {{-41.5, 127}, {-38, 127}, {-38, 122}, {-35, 122}}, color = {0, 0, 127}));
  connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (
    Line(points = {{-41.5, 108}, {-38, 108}, {-38, 114}, {-35, 114}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVR01.y, switch_dthetaFCVR01.u2) annotation (
    Line(points = {{49.5, 151}, {56, 151}}, color = {255, 0, 255}));
  connect(dthetaFCVR01_var.y, switch_dthetaFCVR01.u1) annotation (
    Line(points = {{49.5, 160}, {53, 160}, {53, 155}, {56, 155}}, color = {0, 0, 127}));
  connect(dthetaFCVR01.y, switch_dthetaFCVR01.u3) annotation (
    Line(points = {{49.5, 141}, {53, 141}, {53, 147}, {56, 147}}, color = {0, 0, 127}));
  connect(bool_dToutRR01.y, switch_dToutRR01.u2) annotation (
    Line(points = {{49.5, 118}, {56, 118}}, color = {255, 0, 255}));
  connect(dToutRR01_var.y, switch_dToutRR01.u1) annotation (
    Line(points = {{49.5, 127}, {53, 127}, {53, 122}, {56, 122}}, color = {0, 0, 127}));
  connect(dToutRR01.y, switch_dToutRR01.u3) annotation (
    Line(points = {{49.5, 108}, {53, 108}, {53, 114}, {56, 114}}, color = {0, 0, 127}));
  connect(domegaP501_var.y, switch_domegaP501.u1) annotation (
    Line(points = {{49.5, 55}, {53, 55}, {53, 49}, {57, 49}}, color = {0, 0, 127}));
  connect(bool_domegaP501.y, switch_domegaP501.u2) annotation (
    Line(points = {{49.5, 45}, {57, 45}}, color = {255, 0, 255}));
  connect(domegaP501.y, switch_domegaP501.u3) annotation (
    Line(points = {{49.5, 35}, {53, 35}, {53, 41}, {57, 41}}, color = {0, 0, 127}));
  connect(bool_dToutCHP501.y, switch_dToutCHP501.u2) annotation (
    Line(points = {{49.5, 10}, {56, 10}}, color = {255, 0, 255}));
  connect(dToutCHP501_var.y, switch_dToutCHP501.u1) annotation (
    Line(points = {{49.5, 19}, {53, 19}, {53, 14}, {56, 14}}, color = {0, 0, 127}));
  connect(dToutCHP501.y, switch_dToutCHP501.u3) annotation (
    Line(points = {{49.5, 0}, {53, 0}, {53, 6}, {56, 6}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT701, PI_TT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -122}, {-50, -122}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT711, PI_TT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -156}, {-50, -156}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT721, PI_TT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -186}, {-50, -186}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT721.controlAction, controlSignalBus.dthetaTCV721) annotation (
    Line(points = {{-31, -182}, {160, -182}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT731, PI_TT731.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -215}, {-50, -215}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dPtEX731.y, switch_dPtEX731.u3) annotation (
    Line(points = {{-86.5, -392}, {-83, -392}, {-83, -386}, {-79, -386}}, color = {0, 0, 127}));
  connect(dPtEX731_var.y, switch_dPtEX731.u1) annotation (
    Line(points = {{-86.5, -375}, {-83, -375}, {-83, -378}, {-79, -378}}, color = {0, 0, 127}));
  connect(bool_dPtEX731.y, switch_dPtEX731.u2) annotation (
    Line(points = {{-86.5, -382}, {-79, -382}}, color = {255, 0, 255}));
  connect(dPtEX701.y, switch_dPtEX701.u3) annotation (
    Line(points = {{-86.5, -274}, {-83, -274}, {-83, -267}, {-79, -267}}, color = {0, 0, 127}));
  connect(bool_dPtEX701.y, switch_dPtEX701.u2) annotation (
    Line(points = {{-86.5, -263}, {-79, -263}}, color = {255, 0, 255}));
  connect(dPtEX701_var.y, switch_dPtEX701.u1) annotation (
    Line(points = {{-86.5, -254}, {-83, -254}, {-83, -259}, {-79, -259}}, color = {0, 0, 127}));
  connect(dPtEX721.y, switch_dPtEX721.u3) annotation (
    Line(points = {{-86.5, -352}, {-83, -352}, {-83, -346}, {-78, -346}}, color = {0, 0, 127}));
  connect(bool_dPtEX721.y, switch_dPtEX721.u2) annotation (
    Line(points = {{-86.5, -342}, {-78, -342}}, color = {255, 0, 255}));
  connect(dTT701_SP.y, switch_dTT701.u3) annotation (
    Line(points = {{-85.5, -112}, {-82, -112}, {-82, -106}, {-78, -106}}, color = {0, 0, 127}));
  connect(bool_dTT701_SP.y, switch_dTT701.u2) annotation (
    Line(points = {{-85.5, -102}, {-78, -102}}, color = {255, 0, 255}));
  connect(switch_dTT701.y, PI_TT701.REF) annotation (
    Line(points = {{-66.5, -102}, {-59, -102}, {-59, -114}, {-50, -114}}, color = {0, 0, 127}));
  connect(dTT701_SP_var.y, switch_dTT701.u1) annotation (
    Line(points = {{-85.5, -94}, {-82, -94}, {-82, -98}, {-78, -98}}, color = {0, 0, 127}));
  connect(dTT711_SP.y, switch_dTT711.u3) annotation (
    Line(points = {{-85.5, -147}, {-82, -147}, {-82, -141}, {-78, -141}}, color = {0, 0, 127}));
  connect(dTT711_SP_var.y, switch_dTT711.u1) annotation (
    Line(points = {{-85.5, -130}, {-82, -130}, {-82, -133}, {-78, -133}}, color = {0, 0, 127}));
  connect(bool_dTT711_SP.y, switch_dTT711.u2) annotation (
    Line(points = {{-85.5, -137}, {-78, -137}}, color = {255, 0, 255}));
  connect(switch_dTT711.y, PI_TT711.REF) annotation (
    Line(points = {{-66.5, -137}, {-59, -137}, {-59, -148}, {-50, -148}}, color = {0, 0, 127}));
  connect(dTT721_SP.y, switch_dTT721.u3) annotation (
    Line(points = {{-85.5, -178}, {-82, -178}, {-82, -172}, {-78, -172}}, color = {0, 0, 127}));
  connect(bool_dTT721_SP.y, switch_dTT721.u2) annotation (
    Line(points = {{-85.5, -168}, {-78, -168}}, color = {255, 0, 255}));
  connect(switch_dTT721.y, PI_TT721.REF) annotation (
    Line(points = {{-66.5, -168}, {-58, -168}, {-58, -178}, {-50, -178}}, color = {0, 0, 127}));
  connect(dTT731_SP.y, switch_dTT731.u3) annotation (
    Line(points = {{-85.5, -208}, {-82, -208}, {-82, -202}, {-78, -202}}, color = {0, 0, 127}));
  connect(bool_dTT731_SP.y, switch_dTT731.u2) annotation (
    Line(points = {{-85.5, -198}, {-78, -198}}, color = {255, 0, 255}));
  connect(dTT731SP_var.y, switch_dTT731.u1) annotation (
    Line(points = {{-85.5, -191}, {-82, -191}, {-82, -194}, {-78, -194}}, color = {0, 0, 127}));
  connect(switch_dTT731.y, PI_TT731.REF) annotation (
    Line(points = {{-66.5, -198}, {-56, -198}, {-56, -207}, {-50, -207}}, color = {0, 0, 127}));
  connect(dTT721_SP_var.y, switch_dTT721.u1) annotation (
    Line(points = {{-85.5, -161}, {-81, -161}, {-81, -164}, {-78, -164}}, color = {0, 0, 127}));
  connect(PI_TT701.controlAction, controlSignalBus.dthetaTCV701) annotation (
    Line(points = {{-31, -118}, {160, -118}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT711.controlAction, controlSignalBus.dthetaFCV711) annotation (
    Line(points = {{7, -318}, {160, -318}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT721.controlAction, controlSignalBus.dthetaFCV721) annotation (
    Line(points = {{8, -358}, {160, -358}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dFT731, PI_FT731.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -409}, {-22, -409}, {-22, -400}, {-11, -400}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT731.controlAction, controlSignalBus.dthetaFCV731) annotation (
    Line(points = {{8, -396}, {160, -396}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dFT721, PI_FT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -369}, {-22, -369}, {-22, -362}, {-11, -362}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dFT711, PI_FT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -330}, {-22, -330}, {-22, -322}, {-12, -322}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dFT701, PI_FT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -290}, {-22, -290}, {-22, -283}, {-12, -283}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX701Pt1.controlAction, PI_FT701.REF) annotation (
    Line(points = {{-30, -279}, {-26, -279}, {-26, -275}, {-12, -275}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX701Pt, I_EX701Pt1.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -283}, {-49, -283}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT701.controlAction, controlSignalBus.dthetaFCV701) annotation (
    Line(points = {{7, -279}, {160, -279}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(I_EX711Pt1.controlAction, PI_FT711.REF) annotation (
    Line(points = {{-30, -318}, {-26, -318}, {-26, -314}, {-12, -314}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX711Pt, I_EX711Pt1.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -322}, {-49, -322}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX721Pt1.controlAction, PI_FT721.REF) annotation (
    Line(points = {{-30, -357}, {-26, -357}, {-26, -354}, {-11, -354}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX721Pt, I_EX721Pt1.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -361}, {-49, -361}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX731Pt1.controlAction, PI_FT731.REF) annotation (
    Line(points = {{-30, -396}, {-26, -396}, {-26, -392}, {-11, -392}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX731Pt, I_EX731Pt1.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -400}, {-49, -400}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dPtEX701.y, I_EX701Pt1.REF) annotation (
    Line(points = {{-67.5, -263}, {-62, -263}, {-62, -275}, {-49, -275}}, color = {0, 0, 127}));
  connect(dPtEX711.y, switch_dPtEX711.u3) annotation (
    Line(points = {{-86.5, -314}, {-83, -314}, {-83, -307}, {-79, -307}}, color = {0, 0, 127}));
  connect(bool_dPtEX711.y, switch_dPtEX711.u2) annotation (
    Line(points = {{-86.5, -303}, {-79, -303}}, color = {255, 0, 255}));
  connect(dPtEX711_var.y, switch_dPtEX711.u1) annotation (
    Line(points = {{-86.5, -296}, {-83, -296}, {-83, -299}, {-79, -299}}, color = {0, 0, 127}));
  connect(switch_dPtEX711.y, I_EX711Pt1.REF) annotation (
    Line(points = {{-67.5, -303}, {-62, -303}, {-62, -314}, {-49, -314}}, color = {0, 0, 127}));
  connect(switch_dPtEX721.y, I_EX721Pt1.REF) annotation (
    Line(points = {{-66.5, -342}, {-62, -342}, {-62, -353}, {-49, -353}}, color = {0, 0, 127}));
  connect(switch_dPtEX731.y, I_EX731Pt1.REF) annotation (
    Line(points = {{-67.5, -382}, {-62, -382}, {-62, -392}, {-49, -392}}, color = {0, 0, 127}));
  connect(dPtEX721_var.y, switch_dPtEX721.u1) annotation (
    Line(points = {{-86.5, -335}, {-82, -335}, {-82, -338}, {-78, -338}}, color = {0, 0, 127}));
  connect(PI_TT711.controlAction, controlSignalBus.dthetaTCV711) annotation (
    Line(points = {{-31, -152}, {73, -152}, {73, -153}, {160, -153}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_TT731.controlAction, controlSignalBus.dthetaTCV731) annotation (
    Line(points = {{-31, -211}, {73, -211}, {73, -212}, {160, -212}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP901.y, controlSignalBus.domegaP901) annotation (
    Line(points = {{-111.5, 150}, {-76, 150}, {-76, 198}, {160, 198}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
    Line(points = {{-112.5, 117}, {-74, 117}, {-74, 196}, {160, 196}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01) annotation (
    Line(points = {{-23.5, 152}, {10, 152}, {10, 194}, {160, 194}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
    Line(points = {{-23.5, 118}, {12, 118}, {12, 192}, {160, 192}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01) annotation (
    Line(points = {{67.5, 151}, {102, 151}, {102, 190}, {160, 190}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dToutRR01.y, controlSignalBus.dToutRR01) annotation (
    Line(points = {{67.5, 118}, {160, 118}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_domegaP501.y, controlSignalBus.domegaP501) annotation (
    Line(points = {{68.5, 45}, {160, 45}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501) annotation (
    Line(points = {{67.5, 10}, {160, 10}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (
    Line(points = {{-22.5, -26}, {160, -26}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{-22.5, 7}, {14, 7}, {14, -24}, {158, -24}, {158, 0}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_domegaP401.y, controlSignalBus.domegaP401) annotation (
    Line(points = {{-21.5, 40}, {16, 40}, {16, -22}, {146, -22}, {146, 0}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (
    Line(points = {{-112.5, -26}, {-78, -26}, {-78, -60}, {144, -60}, {144, 0}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{-112.5, 7}, {-76, 7}, {-76, -58}, {142, -58}, {142, 0}, {160, 0}}, color = {0, 0, 127}));
  connect(switch_domegaP101.y, controlSignalBus.domegaP101) annotation (
    Line(points = {{-111.5, 40}, {-74, 40}, {-74, -56}, {140, -56}, {140, 0}, {160, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PID
Control
System")}),
    Diagram(coordinateSystem(extent = {{-170, -440}, {160, 200}}), graphics={  Rectangle(extent = {{30, 80}, {100, -10}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-150, 188}, {-80, 98}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 186}, {-85, 166}}, textString = "S900", textColor = {0, 0, 0}), Rectangle(extent = {{-150, 80}, {-80, -50}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 80}, {-85, 60}}, textColor = {0, 0, 0}, textString = "S100"), Rectangle(extent = {{-60, 80}, {10, -50}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-55, 80}, {5, 60}}, textColor = {0, 0, 0}, textString = "S400"), Rectangle(extent = {{-62, 188}, {8, 98}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-58, 186}, {2, 166}}, textColor = {0, 0, 0}, textString = "RACK"), Rectangle(extent = {{30, 188}, {100, 98}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{34, 188}, {94, 168}}, textColor = {0, 0, 0}, textString = "RR00"), Text(extent = {{35, 81}, {95, 61}}, textColor = {0, 0, 0}, textString = "S500"), Rectangle(extent = {{-115, -230}, {60, -414}}, fillColor = {213, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-115, -230}, {60, -250}}, textColor = {0, 0, 0}, textString = "Power Control"), Rectangle(extent = {{-115, -70}, {59, -224}}, fillColor = {213, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-97, -70}, {38, -90}}, textColor = {0, 0, 0}, textString = "Treturn Control")}));
end ControllerBaseForFigure;
