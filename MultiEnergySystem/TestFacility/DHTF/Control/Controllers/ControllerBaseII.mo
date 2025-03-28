within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model ControllerBaseII
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
  Real FT101SP(nominal = 5.7166667);
  Real dFT101SP(min = -1, max = 0);
  Real FT401SP(nominal = 3.2666667);
  Real dFT401SP(min = -1, max = 0);
  Real FT501SP(nominal = FT501_nom);
  Real dFT501SP(min = -1, max = 0);
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
  Modelica.Blocks.Interaction.Show.RealValue domega_P901_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, 140}, {-85, 160}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV901_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, 107}, {-85, 127}})));
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
  Modelica.Blocks.Interaction.Show.RealValue domega_P101_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, 30}, {-85, 50}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV101_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, -3}, {-85, 17}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutGB101(y = booldToutGB101) annotation (
    Placement(transformation(extent = {{-141, -31}, {-131, -21}})));
  Modelica.Blocks.Sources.RealExpression dToutGB101_var(y = dTout_GB101_var) annotation (
    Placement(transformation(extent = {{-141, -22}, {-131, -12}})));
  Modelica.Blocks.Logical.Switch switch_dToutGB101 annotation (
    Placement(transformation(extent = {{-123, -31}, {-113, -21}})));
  Modelica.Blocks.Interaction.Show.RealValue dTout_GB101_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, -36}, {-85, -16}})));
  Modelica.Blocks.Sources.TimeTable dToutEB401(table = dTout_EB401) annotation (
    Placement(transformation(extent = {{-141, -181}, {-131, -171}})));
  Modelica.Blocks.Sources.TimeTable domegaP401(table = domega_P401) annotation (
    Placement(transformation(extent = {{-141, -115}, {-131, -105}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV401(table = dtheta_FCV401) annotation (
    Placement(transformation(extent = {{-141, -148}, {-131, -138}})));
  Modelica.Blocks.Sources.RealExpression domegaP401_var(y = domega_P401_var) annotation (
    Placement(transformation(extent = {{-141, -95}, {-131, -85}})));
  Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (
    Placement(transformation(extent = {{-122, -105}, {-112, -95}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y = booldomegaP401) annotation (
    Placement(transformation(extent = {{-141, -105}, {-131, -95}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y = booldthetaFCV401) annotation (
    Placement(transformation(extent = {{-141, -138}, {-131, -128}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y = dtheta_FCV401_var) annotation (
    Placement(transformation(extent = {{-141, -129}, {-131, -119}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (
    Placement(transformation(extent = {{-123, -138}, {-113, -128}})));
  Modelica.Blocks.Interaction.Show.RealValue domega_P401_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, -110}, {-85, -90}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV401_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, -143}, {-85, -123}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y = booldToutEB401) annotation (
    Placement(transformation(extent = {{-141, -171}, {-131, -161}})));
  Modelica.Blocks.Sources.RealExpression dToutEB401_var(y = dTout_EB401_var) annotation (
    Placement(transformation(extent = {{-141, -162}, {-131, -152}})));
  Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (
    Placement(transformation(extent = {{-123, -171}, {-113, -161}})));
  Modelica.Blocks.Interaction.Show.RealValue dTout_EB401_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-105, -176}, {-85, -156}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV701(table = dtheta_FCV701) annotation (
    Placement(transformation(extent = {{-50, 140}, {-40, 150}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV701(y = booldthetaFCV701) annotation (
    Placement(transformation(extent = {{-50, 150}, {-40, 160}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV701_var(y = dtheta_FCV701_var) annotation (
    Placement(transformation(extent = {{-50, 159}, {-40, 169}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV701 annotation (
    Placement(transformation(extent = {{-32, 150}, {-22, 160}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV701_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, 145}, {6, 165}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV711(table = dtheta_FCV711) annotation (
    Placement(transformation(extent = {{-50, 106}, {-40, 116}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV711(y = booldthetaFCV711) annotation (
    Placement(transformation(extent = {{-50, 116}, {-40, 126}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV711_var(y = dtheta_FCV711_var) annotation (
    Placement(transformation(extent = {{-50, 125}, {-40, 135}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV711 annotation (
    Placement(transformation(extent = {{-32, 116}, {-22, 126}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV711_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, 111}, {6, 131}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV721(table = dtheta_FCV721) annotation (
    Placement(transformation(extent = {{-50, 73}, {-40, 83}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV721(y = booldthetaFCV721) annotation (
    Placement(transformation(extent = {{-50, 83}, {-40, 93}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV721_var(y = dtheta_FCV721_var) annotation (
    Placement(transformation(extent = {{-50, 92}, {-40, 102}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV721 annotation (
    Placement(transformation(extent = {{-32, 83}, {-22, 93}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV721_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, 78}, {6, 98}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = dtheta_FCV731) annotation (
    Placement(transformation(extent = {{-50, 41}, {-40, 51}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV731(y = booldthetaFCV731) annotation (
    Placement(transformation(extent = {{-50, 51}, {-40, 61}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV731_var(y = dtheta_FCV731_var) annotation (
    Placement(transformation(extent = {{-50, 60}, {-40, 70}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV731 annotation (
    Placement(transformation(extent = {{-32, 51}, {-22, 61}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV731_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, 46}, {6, 66}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table = dtheta_FCVC01) annotation (
    Placement(transformation(extent = {{-50, -31}, {-40, -21}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y = booldthetaFCVC01) annotation (
    Placement(transformation(extent = {{-50, -21}, {-40, -11}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y = dtheta_FCVC01_var) annotation (
    Placement(transformation(extent = {{-50, -12}, {-40, -2}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (
    Placement(transformation(extent = {{-32, -21}, {-22, -11}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC01_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, -26}, {6, -6}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table = dtheta_FCVC02) annotation (
    Placement(transformation(extent = {{-50, -65}, {-40, -55}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y = booldthetaFCVC02) annotation (
    Placement(transformation(extent = {{-50, -55}, {-40, -45}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y = dtheta_FCVC02_var) annotation (
    Placement(transformation(extent = {{-50, -46}, {-40, -36}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (
    Placement(transformation(extent = {{-32, -55}, {-22, -45}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC02_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, -60}, {6, -40}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV701(table = dtheta_TCV701) annotation (
    Placement(transformation(extent = {{39, 140}, {49, 150}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV701(y = booldthetaTCV701) annotation (
    Placement(transformation(extent = {{39, 150}, {49, 160}})));
  Modelica.Blocks.Sources.RealExpression dthetaTCV701_var(y = dtheta_TCV701_var) annotation (
    Placement(transformation(extent = {{39, 159}, {49, 169}})));
  Modelica.Blocks.Logical.Switch switch_dthetaTCV701 annotation (
    Placement(transformation(extent = {{57, 150}, {67, 160}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV701_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, 145}, {95, 165}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV711(table = dtheta_TCV711) annotation (
    Placement(transformation(extent = {{39, 106}, {49, 116}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV711(y = booldthetaTCV711) annotation (
    Placement(transformation(extent = {{39, 116}, {49, 126}})));
  Modelica.Blocks.Sources.RealExpression dthetaTCV711_var(y = dtheta_TCV711_var) annotation (
    Placement(transformation(extent = {{39, 125}, {49, 135}})));
  Modelica.Blocks.Logical.Switch switch_dthetaTCV711 annotation (
    Placement(transformation(extent = {{57, 116}, {67, 126}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV711_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, 111}, {95, 131}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV721(table = dtheta_TCV721) annotation (
    Placement(transformation(extent = {{39, 73}, {49, 83}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV721(y = booldthetaTCV721) annotation (
    Placement(transformation(extent = {{39, 83}, {49, 93}})));
  Modelica.Blocks.Sources.RealExpression dthetaTCV721_var(y = dtheta_TCV721_var) annotation (
    Placement(transformation(extent = {{39, 92}, {49, 102}})));
  Modelica.Blocks.Logical.Switch switch_dthetaTCV721 annotation (
    Placement(transformation(extent = {{57, 83}, {67, 93}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV721_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, 78}, {95, 98}})));
  Modelica.Blocks.Sources.TimeTable dthetaTCV731(table = dtheta_TCV731) annotation (
    Placement(transformation(extent = {{39, 41}, {49, 51}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV731(y = booldthetaTCV731) annotation (
    Placement(transformation(extent = {{39, 51}, {49, 61}})));
  Modelica.Blocks.Sources.RealExpression dthetaTCV731_var(y = dtheta_TCV731_var) annotation (
    Placement(transformation(extent = {{39, 60}, {49, 70}})));
  Modelica.Blocks.Logical.Switch switch_dthetaTCV731 annotation (
    Placement(transformation(extent = {{57, 51}, {67, 61}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, 46}, {95, 66}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table = dtheta_FCVR01) annotation (
    Placement(transformation(extent = {{39, 8}, {49, 18}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVR01(y = booldthetaFCVR01) annotation (
    Placement(transformation(extent = {{39, 18}, {49, 28}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVR01_var(y = dtheta_FCVR01_var) annotation (
    Placement(transformation(extent = {{39, 27}, {49, 37}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVR01 annotation (
    Placement(transformation(extent = {{57, 18}, {67, 28}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act1(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, 13}, {95, 33}})));
  Modelica.Blocks.Sources.TimeTable dToutRR01(table = dTout_RR01) annotation (
    Placement(transformation(extent = {{39, -25}, {49, -15}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutRR01(y = booldToutRR01) annotation (
    Placement(transformation(extent = {{39, -15}, {49, -5}})));
  Modelica.Blocks.Sources.RealExpression dToutRR01_var(y = dTout_RR01_var) annotation (
    Placement(transformation(extent = {{39, -6}, {49, 4}})));
  Modelica.Blocks.Logical.Switch switch_dToutRR01 annotation (
    Placement(transformation(extent = {{57, -15}, {67, -5}})));
  Modelica.Blocks.Interaction.Show.RealValue dTout_RR01_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{75, -20}, {95, 0}})));
  Modelica.Blocks.Sources.TimeTable dToutCHP501(table = dTout_CHP501) annotation (
    Placement(transformation(extent = {{-51, -165}, {-41, -155}})));
  Modelica.Blocks.Sources.TimeTable domegaP501(table = domega_P501) annotation (
    Placement(transformation(extent = {{-51, -130}, {-41, -120}})));
  Modelica.Blocks.Sources.RealExpression domegaP501_var(y = domega_P501_var) annotation (
    Placement(transformation(extent = {{-51, -110}, {-41, -100}})));
  Modelica.Blocks.Logical.Switch switch_domegaP501 annotation (
    Placement(transformation(extent = {{-32, -120}, {-22, -110}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP501(y = booldomegaP501) annotation (
    Placement(transformation(extent = {{-51, -120}, {-41, -110}})));
  Modelica.Blocks.Interaction.Show.RealValue domega_P501_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-15, -125}, {5, -105}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutCHP501(y = booldToutCHP501) annotation (
    Placement(transformation(extent = {{-51, -155}, {-41, -145}})));
  Modelica.Blocks.Sources.RealExpression dToutCHP501_var(y = dTout_CHP501_var) annotation (
    Placement(transformation(extent = {{-51, -146}, {-41, -136}})));
  Modelica.Blocks.Logical.Switch switch_dToutCHP501 annotation (
    Placement(transformation(extent = {{-33, -155}, {-23, -145}})));
  Modelica.Blocks.Interaction.Show.RealValue dTout_CHP501_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-15, -160}, {5, -140}})));
  Export.Interfaces.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin = {-170, -2}, extent = {{50, 40}, {-50, -40}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression dFT101SP_var(y = dFT101SP) annotation (
    Placement(transformation(extent = {{30, -115}, {40, -105}})));
  Modelica.Blocks.Sources.RealExpression dFT401SP_var(y = dFT401SP) annotation (
    Placement(transformation(extent = {{30, -145}, {40, -135}})));
  Modelica.Blocks.Sources.RealExpression dFT501SP_var(y = dFT501SP) annotation (
    Placement(transformation(extent = {{30, -173}, {40, -163}})));
  Modelica.Blocks.Sources.RealExpression dFT701SP_var(y = dFT701SP) annotation (
    Placement(transformation(extent = {{102, -456}, {112, -446}})));
  Modelica.Blocks.Sources.RealExpression dFT711SP_var(y = dFT711SP) annotation (
    Placement(transformation(extent = {{153, -556}, {163, -546}})));
  Modelica.Blocks.Sources.RealExpression dFT721SP_var(y = dFT721SP) annotation (
    Placement(transformation(extent = {{153, -564}, {163, -554}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT701(Kp = Kp_TT701, Ti = Ti_TT701, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-70, -278}, {-50, -258}})));
  Modelica.Blocks.Sources.RealExpression dTT701_SP_var(y = dTT701SP) annotation (
    Placement(transformation(extent = {{-114, -249}, {-104, -239}})));
  Modelica.Blocks.Sources.RealExpression dTT711_SP_var(y = dTT711SP) annotation (
    Placement(transformation(extent = {{-114, -285}, {-104, -275}})));
  Modelica.Blocks.Sources.RealExpression dTT721_SP_var(y = dTT721SP) annotation (
    Placement(transformation(extent = {{-114, -316}, {-104, -306}})));
  Modelica.Blocks.Sources.RealExpression dTT731SP_var(y = dTT731SP) annotation (
    Placement(transformation(extent = {{-114, -346}, {-104, -336}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT711(Kp = Kp_TT711, Ti = Ti_TT711, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-70, -312}, {-50, -292}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT721(Kp = Kp_TT721, Ti = Ti_TT721, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-70, -342}, {-50, -322}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT731(Kp = Kp_TT731, Ti = Ti_TT731, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{-70, -371}, {-50, -351}})));
  Modelica.Blocks.Sources.RealExpression dPtEX701_var(y = dPtEX701SP) annotation (
    Placement(transformation(extent = {{-110, -622}, {-100, -612}})));
  Modelica.Blocks.Sources.RealExpression dPtEX711_var(y = dPtEX711SP) annotation (
    Placement(transformation(extent = {{-110, -663}, {-100, -653}})));
  Modelica.Blocks.Sources.RealExpression dPtEX721_var(y = dPtEX721SP) annotation (
    Placement(transformation(extent = {{-110, -698}, {-100, -688}})));
  Modelica.Blocks.Math.Feedback FB_EX721Pt annotation (
    Placement(visible = true, transformation(origin = {-65, -701}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX721Pt(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-5, -701}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX721Pt(k = Ki_PtEX721, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-45, -711}, {-25, -691}})));
  Modelica.Blocks.Nonlinear.Limiter lim_EX701Pt(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-5, -629}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX701Pt(k = Ki_PtEX701, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-45, -639}, {-25, -619}})));
  Modelica.Blocks.Math.Feedback FB_EX701Pt annotation (
    Placement(visible = true, transformation(origin = {-65, -629}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX711Pt(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-5, -667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX711Pt(k = Ki_PtEX711, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-45, -677}, {-25, -657}})));
  Modelica.Blocks.Math.Feedback FB_EX711Pt annotation (
    Placement(visible = true, transformation(origin = {-65, -667}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback FB_EX731Pt annotation (
    Placement(visible = true, transformation(origin = {-65, -733}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX731Pt(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-5, -733}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX731Pt(k = Ki_PtEX731, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-45, -743}, {-25, -723}})));
  Modelica.Blocks.Sources.RealExpression dPtEX731_var(y = dPtEX731SP) annotation (
    Placement(transformation(extent = {{-111, -730}, {-101, -720}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX731 annotation (
    Placement(transformation(extent = {{-92, -738}, {-82, -728}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX731(y = booldPtEX731) annotation (
    Placement(transformation(extent = {{-111, -738}, {-101, -728}})));
  Modelica.Blocks.Sources.TimeTable dPtEX731(table = dPt_EX731) annotation (
    Placement(transformation(extent = {{-111, -748}, {-101, -738}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX701 annotation (
    Placement(transformation(extent = {{-91, -634}, {-81, -624}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX701(y = booldPtEX701) annotation (
    Placement(transformation(extent = {{-110, -634}, {-100, -624}})));
  Modelica.Blocks.Sources.TimeTable dPtEX701(table = dPt_EX701) annotation (
    Placement(transformation(extent = {{-110, -645}, {-100, -635}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX711 annotation (
    Placement(transformation(extent = {{-91, -672}, {-81, -662}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX711(y = booldPtEX711) annotation (
    Placement(transformation(extent = {{-110, -672}, {-100, -662}})));
  Modelica.Blocks.Sources.TimeTable dPtEX711(table = dPt_EX711) annotation (
    Placement(transformation(extent = {{-110, -683}, {-100, -673}})));
  Modelica.Blocks.Logical.Switch switch_dPtEX721 annotation (
    Placement(transformation(extent = {{-91, -706}, {-81, -696}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dPtEX721(y = booldPtEX721) annotation (
    Placement(transformation(extent = {{-110, -706}, {-100, -696}})));
  Modelica.Blocks.Sources.TimeTable dPtEX721(table = dPt_EX721) annotation (
    Placement(transformation(extent = {{-110, -716}, {-100, -706}})));
  Modelica.Blocks.Logical.Switch switch_dTT701 annotation (
    Placement(transformation(extent = {{-95, -257}, {-85, -247}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT701_SP(y = booldTT701) annotation (
    Placement(transformation(extent = {{-114, -257}, {-104, -247}})));
  Modelica.Blocks.Sources.TimeTable dTT701_SP(table = dTT_701) annotation (
    Placement(transformation(extent = {{-114, -267}, {-104, -257}})));
  Modelica.Blocks.Logical.Switch switch_dTT711 annotation (
    Placement(transformation(extent = {{-95, -292}, {-85, -282}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT711_SP(y = booldTT711) annotation (
    Placement(transformation(extent = {{-114, -292}, {-104, -282}})));
  Modelica.Blocks.Sources.TimeTable dTT711_SP(table = dTT_711) annotation (
    Placement(transformation(extent = {{-114, -302}, {-104, -292}})));
  Modelica.Blocks.Logical.Switch switch_dTT721 annotation (
    Placement(transformation(extent = {{-95, -323}, {-85, -313}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT721_SP(y = booldTT721) annotation (
    Placement(transformation(extent = {{-114, -323}, {-104, -313}})));
  Modelica.Blocks.Sources.TimeTable dTT721_SP(table = dTT_721) annotation (
    Placement(transformation(extent = {{-114, -333}, {-104, -323}})));
  Modelica.Blocks.Logical.Switch switch_dTT731 annotation (
    Placement(transformation(extent = {{-95, -353}, {-85, -343}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dTT731_SP(y = booldTT731) annotation (
    Placement(transformation(extent = {{-114, -353}, {-104, -343}})));
  Modelica.Blocks.Sources.TimeTable dTT731_SP(table = dTT_731) annotation (
    Placement(transformation(extent = {{-114, -363}, {-104, -353}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT701(Kp = 0.1128, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{10, -438}, {30, -418}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT711(Kp = 0.13279, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{10, -478}, {30, -458}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT721(Kp = 0.1456, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{10, -518}, {30, -498}})));
  Modelica.Blocks.Sources.RealExpression dFT721SP_var1(y = dFT721SP) annotation (
    Placement(transformation(extent = {{192, -565}, {202, -555}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT731(Kp = 0.1456, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{10, -552}, {30, -532}})));
  Modelica.Blocks.Continuous.Integrator I_EX731Pt1(k = Ki_PtEX731, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-75, -553}, {-55, -533}})));
  Modelica.Blocks.Math.Feedback FB_EX731Pt1 annotation (
    Placement(visible = true, transformation(origin = {-97, -543}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX721Pt1(k = Ki_PtEX721, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-75, -518}, {-55, -498}})));
  Modelica.Blocks.Math.Feedback FB_EX721Pt1 annotation (
    Placement(visible = true, transformation(origin = {-97, -508}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX721Pt1(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-34, -508}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX731Pt1(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-34, -543}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX711Pt1(k = Ki_PtEX711, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-75, -478}, {-55, -458}})));
  Modelica.Blocks.Math.Feedback FB_EX711Pt1 annotation (
    Placement(visible = true, transformation(origin = {-97, -468}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX711Pt1(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-34, -468}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I_EX701Pt1(k = Ki_PtEX701, initType = Modelica.Blocks.Types.Init.InitialState) annotation (
    Placement(transformation(extent = {{-74, -438}, {-54, -418}})));
  Modelica.Blocks.Math.Feedback FB_EX701Pt1 annotation (
    Placement(visible = true, transformation(origin = {-96, -428}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter lim_EX701Pt1(uMax = 0, uMin = -1) annotation (
    Placement(visible = true, transformation(origin = {-33, -428}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  theta_FCVR01SP = 1;
  //booldthetaFCVR01 = true;
  dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_RR01SP = 40 + 273.15;
  //booldToutRR01 = true;
  //Set-points
  FT101SP = 1.7;
  dFT101SP = (FT101SP - 5.7166667)/5.7166667;
  FT401SP = 1.33;
  //FT401SP = if time < 1e3 then 1.3 elseif time < 2e3 then -0.00053*time + 1.9 else 0.8;
  dFT401SP = (FT401SP - 3.2666667)/3.2666667;
  FT501SP = 2.1;
  dFT501SP = (FT501SP - FT501_nom)/FT501_nom;
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
  connect(switch_domegaP901.y, domega_P901_act.numberPort) annotation (
    Line(points = {{-111.5, 150}, {-106.5, 150}}, color = {0, 0, 127}));
  connect(dtheta_FCV901_act.numberPort, switch_dthetaFCV901.y) annotation (
    Line(points = {{-106.5, 117}, {-112.5, 117}}, color = {0, 0, 127}));
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
  connect(switch_domegaP101.y, domega_P101_act.numberPort) annotation (
    Line(points = {{-111.5, 40}, {-106.5, 40}}, color = {0, 0, 127}));
  connect(dtheta_FCV101_act.numberPort, switch_dthetaFCV101.y) annotation (
    Line(points = {{-106.5, 7}, {-112.5, 7}}, color = {0, 0, 127}));
  connect(bool_dToutGB101.y, switch_dToutGB101.u2) annotation (
    Line(points = {{-130.5, -26}, {-124, -26}}, color = {255, 0, 255}));
  connect(dToutGB101_var.y, switch_dToutGB101.u1) annotation (
    Line(points = {{-130.5, -17}, {-127, -17}, {-127, -22}, {-124, -22}}, color = {0, 0, 127}));
  connect(dTout_GB101_act.numberPort, switch_dToutGB101.y) annotation (
    Line(points = {{-106.5, -26}, {-112.5, -26}}, color = {0, 0, 127}));
  connect(dToutGB101.y, switch_dToutGB101.u3) annotation (
    Line(points = {{-130.5, -36}, {-127, -36}, {-127, -30}, {-124, -30}}, color = {0, 0, 127}));
  connect(domegaP401_var.y, switch_domegaP401.u1) annotation (
    Line(points = {{-130.5, -90}, {-127, -90}, {-127, -96}, {-123, -96}}, color = {0, 0, 127}));
  connect(bool_domegaP401.y, switch_domegaP401.u2) annotation (
    Line(points = {{-130.5, -100}, {-123, -100}}, color = {255, 0, 255}));
  connect(domegaP401.y, switch_domegaP401.u3) annotation (
    Line(points = {{-130.5, -110}, {-127, -110}, {-127, -104}, {-123, -104}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV401.y, switch_dthetaFCV401.u2) annotation (
    Line(points = {{-130.5, -133}, {-124, -133}}, color = {255, 0, 255}));
  connect(dthetaFCV401_var.y, switch_dthetaFCV401.u1) annotation (
    Line(points = {{-130.5, -124}, {-127, -124}, {-127, -129}, {-124, -129}}, color = {0, 0, 127}));
  connect(dthetaFCV401.y, switch_dthetaFCV401.u3) annotation (
    Line(points = {{-130.5, -143}, {-127, -143}, {-127, -137}, {-124, -137}}, color = {0, 0, 127}));
  connect(switch_domegaP401.y, domega_P401_act.numberPort) annotation (
    Line(points = {{-111.5, -100}, {-106.5, -100}}, color = {0, 0, 127}));
  connect(dtheta_FCV401_act.numberPort, switch_dthetaFCV401.y) annotation (
    Line(points = {{-106.5, -133}, {-112.5, -133}}, color = {0, 0, 127}));
  connect(bool_dToutEB401.y, switch_dToutEB401.u2) annotation (
    Line(points = {{-130.5, -166}, {-124, -166}}, color = {255, 0, 255}));
  connect(dToutEB401_var.y, switch_dToutEB401.u1) annotation (
    Line(points = {{-130.5, -157}, {-127, -157}, {-127, -162}, {-124, -162}}, color = {0, 0, 127}));
  connect(dTout_EB401_act.numberPort, switch_dToutEB401.y) annotation (
    Line(points = {{-106.5, -166}, {-112.5, -166}}, color = {0, 0, 127}));
  connect(dToutEB401.y, switch_dToutEB401.u3) annotation (
    Line(points = {{-130.5, -176}, {-127, -176}, {-127, -170}, {-124, -170}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV701.y, switch_dthetaFCV701.u2) annotation (
    Line(points = {{-39.5, 155}, {-33, 155}}, color = {255, 0, 255}));
  connect(dthetaFCV701_var.y, switch_dthetaFCV701.u1) annotation (
    Line(points = {{-39.5, 164}, {-36, 164}, {-36, 159}, {-33, 159}}, color = {0, 0, 127}));
  connect(dthetaFCV701.y, switch_dthetaFCV701.u3) annotation (
    Line(points = {{-39.5, 145}, {-36, 145}, {-36, 151}, {-33, 151}}, color = {0, 0, 127}));
  connect(dtheta_FCV701_act.numberPort, switch_dthetaFCV701.y) annotation (
    Line(points = {{-15.5, 155}, {-21.5, 155}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV711.y, switch_dthetaFCV711.u2) annotation (
    Line(points = {{-39.5, 121}, {-33, 121}}, color = {255, 0, 255}));
  connect(dthetaFCV711_var.y, switch_dthetaFCV711.u1) annotation (
    Line(points = {{-39.5, 130}, {-36, 130}, {-36, 125}, {-33, 125}}, color = {0, 0, 127}));
  connect(dthetaFCV711.y, switch_dthetaFCV711.u3) annotation (
    Line(points = {{-39.5, 111}, {-36, 111}, {-36, 117}, {-33, 117}}, color = {0, 0, 127}));
  connect(dtheta_FCV711_act.numberPort, switch_dthetaFCV711.y) annotation (
    Line(points = {{-15.5, 121}, {-21.5, 121}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV721.y, switch_dthetaFCV721.u2) annotation (
    Line(points = {{-39.5, 88}, {-33, 88}}, color = {255, 0, 255}));
  connect(dthetaFCV721_var.y, switch_dthetaFCV721.u1) annotation (
    Line(points = {{-39.5, 97}, {-36, 97}, {-36, 92}, {-33, 92}}, color = {0, 0, 127}));
  connect(dthetaFCV721.y, switch_dthetaFCV721.u3) annotation (
    Line(points = {{-39.5, 78}, {-36, 78}, {-36, 84}, {-33, 84}}, color = {0, 0, 127}));
  connect(dtheta_FCV721_act.numberPort, switch_dthetaFCV721.y) annotation (
    Line(points = {{-15.5, 88}, {-21.5, 88}}, color = {0, 0, 127}));
  connect(bool_dthetaFCV731.y, switch_dthetaFCV731.u2) annotation (
    Line(points = {{-39.5, 56}, {-33, 56}}, color = {255, 0, 255}));
  connect(dthetaFCV731_var.y, switch_dthetaFCV731.u1) annotation (
    Line(points = {{-39.5, 65}, {-36, 65}, {-36, 60}, {-33, 60}}, color = {0, 0, 127}));
  connect(dthetaFCV731.y, switch_dthetaFCV731.u3) annotation (
    Line(points = {{-39.5, 46}, {-36, 46}, {-36, 52}, {-33, 52}}, color = {0, 0, 127}));
  connect(dtheta_FCV731_act.numberPort, switch_dthetaFCV731.y) annotation (
    Line(points = {{-15.5, 56}, {-21.5, 56}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVC01.y, switch_dthetaFCVC01.u2) annotation (
    Line(points = {{-39.5, -16}, {-33, -16}}, color = {255, 0, 255}));
  connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (
    Line(points = {{-39.5, -7}, {-36, -7}, {-36, -12}, {-33, -12}}, color = {0, 0, 127}));
  connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (
    Line(points = {{-39.5, -26}, {-36, -26}, {-36, -20}, {-33, -20}}, color = {0, 0, 127}));
  connect(dtheta_FCVC01_act.numberPort, switch_dthetaFCVC01.y) annotation (
    Line(points = {{-15.5, -16}, {-21.5, -16}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (
    Line(points = {{-39.5, -50}, {-33, -50}}, color = {255, 0, 255}));
  connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (
    Line(points = {{-39.5, -41}, {-36, -41}, {-36, -46}, {-33, -46}}, color = {0, 0, 127}));
  connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (
    Line(points = {{-39.5, -60}, {-36, -60}, {-36, -54}, {-33, -54}}, color = {0, 0, 127}));
  connect(dtheta_FCVC02_act.numberPort, switch_dthetaFCVC02.y) annotation (
    Line(points = {{-15.5, -50}, {-21.5, -50}}, color = {0, 0, 127}));
  connect(bool_dthetaTCV701.y, switch_dthetaTCV701.u2) annotation (
    Line(points = {{49.5, 155}, {56, 155}}, color = {255, 0, 255}));
  connect(dthetaTCV701_var.y, switch_dthetaTCV701.u1) annotation (
    Line(points = {{49.5, 164}, {53, 164}, {53, 159}, {56, 159}}, color = {0, 0, 127}));
  connect(dthetaTCV701.y, switch_dthetaTCV701.u3) annotation (
    Line(points = {{49.5, 145}, {53, 145}, {53, 151}, {56, 151}}, color = {0, 0, 127}));
  connect(dtheta_TCV701_act.numberPort, switch_dthetaTCV701.y) annotation (
    Line(points = {{73.5, 155}, {67.5, 155}}, color = {0, 0, 127}));
  connect(bool_dthetaTCV711.y, switch_dthetaTCV711.u2) annotation (
    Line(points = {{49.5, 121}, {56, 121}}, color = {255, 0, 255}));
  connect(dthetaTCV711_var.y, switch_dthetaTCV711.u1) annotation (
    Line(points = {{49.5, 130}, {53, 130}, {53, 125}, {56, 125}}, color = {0, 0, 127}));
  connect(dthetaTCV711.y, switch_dthetaTCV711.u3) annotation (
    Line(points = {{49.5, 111}, {53, 111}, {53, 117}, {56, 117}}, color = {0, 0, 127}));
  connect(dtheta_TCV711_act.numberPort, switch_dthetaTCV711.y) annotation (
    Line(points = {{73.5, 121}, {67.5, 121}}, color = {0, 0, 127}));
  connect(bool_dthetaTCV721.y, switch_dthetaTCV721.u2) annotation (
    Line(points = {{49.5, 88}, {56, 88}}, color = {255, 0, 255}));
  connect(dthetaTCV721_var.y, switch_dthetaTCV721.u1) annotation (
    Line(points = {{49.5, 97}, {53, 97}, {53, 92}, {56, 92}}, color = {0, 0, 127}));
  connect(dthetaTCV721.y, switch_dthetaTCV721.u3) annotation (
    Line(points = {{49.5, 78}, {53, 78}, {53, 84}, {56, 84}}, color = {0, 0, 127}));
  connect(dtheta_TCV721_act.numberPort, switch_dthetaTCV721.y) annotation (
    Line(points = {{73.5, 88}, {67.5, 88}}, color = {0, 0, 127}));
  connect(bool_dthetaTCV731.y, switch_dthetaTCV731.u2) annotation (
    Line(points = {{49.5, 56}, {56, 56}}, color = {255, 0, 255}));
  connect(dthetaTCV731_var.y, switch_dthetaTCV731.u1) annotation (
    Line(points = {{49.5, 65}, {53, 65}, {53, 60}, {56, 60}}, color = {0, 0, 127}));
  connect(dthetaTCV731.y, switch_dthetaTCV731.u3) annotation (
    Line(points = {{49.5, 46}, {53, 46}, {53, 52}, {56, 52}}, color = {0, 0, 127}));
  connect(dtheta_TCV731_act.numberPort, switch_dthetaTCV731.y) annotation (
    Line(points = {{73.5, 56}, {67.5, 56}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVR01.y, switch_dthetaFCVR01.u2) annotation (
    Line(points = {{49.5, 23}, {56, 23}}, color = {255, 0, 255}));
  connect(dthetaFCVR01_var.y, switch_dthetaFCVR01.u1) annotation (
    Line(points = {{49.5, 32}, {53, 32}, {53, 27}, {56, 27}}, color = {0, 0, 127}));
  connect(dthetaFCVR01.y, switch_dthetaFCVR01.u3) annotation (
    Line(points = {{49.5, 13}, {53, 13}, {53, 19}, {56, 19}}, color = {0, 0, 127}));
  connect(dtheta_TCV731_act1.numberPort, switch_dthetaFCVR01.y) annotation (
    Line(points = {{73.5, 23}, {67.5, 23}}, color = {0, 0, 127}));
  connect(bool_dToutRR01.y, switch_dToutRR01.u2) annotation (
    Line(points = {{49.5, -10}, {56, -10}}, color = {255, 0, 255}));
  connect(dToutRR01_var.y, switch_dToutRR01.u1) annotation (
    Line(points = {{49.5, -1}, {53, -1}, {53, -6}, {56, -6}}, color = {0, 0, 127}));
  connect(dTout_RR01_act.numberPort, switch_dToutRR01.y) annotation (
    Line(points = {{73.5, -10}, {67.5, -10}}, color = {0, 0, 127}));
  connect(dToutRR01.y, switch_dToutRR01.u3) annotation (
    Line(points = {{49.5, -20}, {53, -20}, {53, -14}, {56, -14}}, color = {0, 0, 127}));
  connect(domegaP501_var.y, switch_domegaP501.u1) annotation (
    Line(points = {{-40.5, -105}, {-37, -105}, {-37, -111}, {-33, -111}}, color = {0, 0, 127}));
  connect(bool_domegaP501.y, switch_domegaP501.u2) annotation (
    Line(points = {{-40.5, -115}, {-33, -115}}, color = {255, 0, 255}));
  connect(domegaP501.y, switch_domegaP501.u3) annotation (
    Line(points = {{-40.5, -125}, {-37, -125}, {-37, -119}, {-33, -119}}, color = {0, 0, 127}));
  connect(switch_domegaP501.y, domega_P501_act.numberPort) annotation (
    Line(points = {{-21.5, -115}, {-16.5, -115}}, color = {0, 0, 127}));
  connect(bool_dToutCHP501.y, switch_dToutCHP501.u2) annotation (
    Line(points = {{-40.5, -150}, {-34, -150}}, color = {255, 0, 255}));
  connect(dToutCHP501_var.y, switch_dToutCHP501.u1) annotation (
    Line(points = {{-40.5, -141}, {-37, -141}, {-37, -146}, {-34, -146}}, color = {0, 0, 127}));
  connect(dTout_CHP501_act.numberPort, switch_dToutCHP501.y) annotation (
    Line(points = {{-16.5, -150}, {-22.5, -150}}, color = {0, 0, 127}));
  connect(dToutCHP501.y, switch_dToutCHP501.u3) annotation (
    Line(points = {{-40.5, -160}, {-37, -160}, {-37, -154}, {-34, -154}}, color = {0, 0, 127}));
  connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01) annotation (
    Line(points = {{67.5, 23}, {70, 23}, {70, 10}, {136, 10}, {136, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutRR01.y, controlSignalBus.dToutRR01) annotation (
    Line(points = {{67.5, -10}, {70, -10}, {70, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01) annotation (
    Line(points = {{-21.5, -16}, {-19, -16}, {-19, -30}, {16, -30}, {16, -45}, {143, -45}, {143, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
    Line(points = {{-21.5, -50}, {-19, -50}, {-19, -40}, {15, -40}, {15, -46}, {144, -46}, {144, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP901.y, controlSignalBus.domegaP901) annotation (
    Line(points = {{-111.5, 150}, {-110, 150}, {-110, 160}, {-77, 160}, {-77, 197}, {149, 197}, {149, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
    Line(points = {{-112.5, 117}, {-111, 117}, {-111, 140}, {-76, 140}, {-76, 196}, {148, 196}, {148, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (
    Line(points = {{-112.5, -26}, {-110, -26}, {-110, -10}, {-77, -10}, {-77, 25}, {23, 25}, {23, -37}, {127, -37}, {127, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (
    Line(points = {{-112.5, -166}, {-111, -166}, {-111, -150}, {-68, -150}, {-68, -76}, {22, -76}, {22, -52}, {132, -52}, {132, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501) annotation (
    Line(points = {{-22.5, -150}, {-21, -150}, {-21, -140}, {24, -140}, {24, -54}, {134, -54}, {134, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT701, PI_TT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -123}, {-169, -123}, {-169, -272}, {-68, -272}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{-112.5, -133}, {-111, -133}, {-111, -132}, {-109, -132}, {-109, -130}, {-69, -130}, {-69, -75}, {21, -75}, {21, -51}, {131, -51}, {131, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP401.y, controlSignalBus.domegaP401) annotation (
    Line(points = {{-111.5, -100}, {-108, -100}, {-108, -95}, {-70, -95}, {-70, -74}, {20, -74}, {20, -50}, {130, -50}, {130, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP501.y, controlSignalBus.domegaP501) annotation (
    Line(points = {{-21.5, -115}, {-20, -115}, {-20, -109}, {23, -109}, {23, -53}, {133, -53}, {133, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{-112.5, 7}, {-109, 7}, {-109, 12}, {-78, 12}, {-78, 26}, {24, 26}, {24, -36}, {126, -36}, {126, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP101.y, controlSignalBus.domegaP101) annotation (
    Line(points = {{-111.5, 40}, {-111.5, 33}, {-77, 33}, {-77, 27}, {25, 27}, {25, -35}, {125, -35}, {125, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dTT711, PI_TT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -306}, {-68, -306}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT711.controlAction, controlSignalBus.dthetaTCV711) annotation (
    Line(points = {{-49, -302}, {160, -302}, {160, -70}, {106, -70}, {106, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT721, PI_TT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -336}, {-68, -336}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, 6}, {-3, 6}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT721.controlAction, controlSignalBus.dthetaTCV721) annotation (
    Line(points = {{-49, -332}, {160, -332}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT731, PI_TT731.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -365}, {-68, -365}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT731.controlAction, controlSignalBus.dthetaTCV731) annotation (
    Line(points = {{-49, -361}, {160, -361}, {160, -90}, {108, -90}, {108, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dEX721Pt, FB_EX721Pt.u2) annotation (
    Line(points = {{-170, -2}, {-170, -773}, {-65, -773}, {-65, -709}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX701Pt.y, lim_EX701Pt.u) annotation (
    Line(points = {{-24, -629}, {-17, -629}}, color = {0, 0, 127}));
  connect(FB_EX701Pt.y, I_EX701Pt.u) annotation (
    Line(points = {{-56, -629}, {-47, -629}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX701Pt, FB_EX701Pt.u2) annotation (
    Line(points = {{-170, -2}, {-170, -703}, {-65, -703}, {-65, -637}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX721Pt.y, lim_EX721Pt.u) annotation (
    Line(points = {{-24, -701}, {-17, -701}}, color = {0, 0, 127}));
  connect(FB_EX721Pt.y, I_EX721Pt.u) annotation (
    Line(points = {{-56, -701}, {-47, -701}}, color = {0, 0, 127}));
  connect(I_EX711Pt.y, lim_EX711Pt.u) annotation (
    Line(points = {{-24, -667}, {-17, -667}}, color = {0, 0, 127}));
  connect(FB_EX711Pt.y, I_EX711Pt.u) annotation (
    Line(points = {{-56, -667}, {-47, -667}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX711Pt, FB_EX711Pt.u2) annotation (
    Line(points = {{-170, -2}, {-170, -741}, {-65, -741}, {-65, -675}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(I_EX731Pt.y, lim_EX731Pt.u) annotation (
    Line(points = {{-24, -733}, {-17, -733}}, color = {0, 0, 127}));
  connect(FB_EX731Pt.y, I_EX731Pt.u) annotation (
    Line(points = {{-56, -733}, {-47, -733}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX731Pt, FB_EX731Pt.u2) annotation (
    Line(points = {{-170, -2}, {-170, -807}, {-65, -807}, {-65, -741}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(dPtEX731.y, switch_dPtEX731.u3) annotation (
    Line(points = {{-100.5, -743}, {-97, -743}, {-97, -737}, {-93, -737}}, color = {0, 0, 127}));
  connect(dPtEX731_var.y, switch_dPtEX731.u1) annotation (
    Line(points = {{-100.5, -725}, {-97, -725}, {-97, -729}, {-93, -729}}, color = {0, 0, 127}));
  connect(bool_dPtEX731.y, switch_dPtEX731.u2) annotation (
    Line(points = {{-100.5, -733}, {-93, -733}}, color = {255, 0, 255}));
  connect(switch_dPtEX731.y, FB_EX731Pt.u1) annotation (
    Line(points = {{-81.5, -733}, {-73, -733}}, color = {0, 0, 127}));
  connect(dPtEX701.y, switch_dPtEX701.u3) annotation (
    Line(points = {{-99.5, -640}, {-96, -640}, {-96, -633}, {-92, -633}}, color = {0, 0, 127}));
  connect(switch_dPtEX701.y, FB_EX701Pt.u1) annotation (
    Line(points = {{-80.5, -629}, {-73, -629}}, color = {0, 0, 127}));
  connect(bool_dPtEX701.y, switch_dPtEX701.u2) annotation (
    Line(points = {{-99.5, -629}, {-92, -629}}, color = {255, 0, 255}));
  connect(dPtEX701_var.y, switch_dPtEX701.u1) annotation (
    Line(points = {{-99.5, -617}, {-96, -617}, {-96, -625}, {-92, -625}}, color = {0, 0, 127}));
  connect(dPtEX711.y, switch_dPtEX711.u3) annotation (
    Line(points = {{-99.5, -678}, {-96, -678}, {-96, -671}, {-92, -671}}, color = {0, 0, 127}));
  connect(bool_dPtEX711.y, switch_dPtEX711.u2) annotation (
    Line(points = {{-99.5, -667}, {-92, -667}}, color = {255, 0, 255}));
  connect(switch_dPtEX711.y, FB_EX711Pt.u1) annotation (
    Line(points = {{-80.5, -667}, {-73, -667}}, color = {0, 0, 127}));
  connect(dPtEX711_var.y, switch_dPtEX711.u1) annotation (
    Line(points = {{-99.5, -658}, {-96, -658}, {-96, -663}, {-92, -663}}, color = {0, 0, 127}));
  connect(dPtEX721.y, switch_dPtEX721.u3) annotation (
    Line(points = {{-99.5, -711}, {-96, -711}, {-96, -705}, {-92, -705}}, color = {0, 0, 127}));
  connect(bool_dPtEX721.y, switch_dPtEX721.u2) annotation (
    Line(points = {{-99.5, -701}, {-92, -701}}, color = {255, 0, 255}));
  connect(dPtEX721_var.y, switch_dPtEX721.u1) annotation (
    Line(points = {{-99.5, -693}, {-92, -693}, {-92, -697}}, color = {0, 0, 127}));
  connect(switch_dPtEX721.y, FB_EX721Pt.u1) annotation (
    Line(points = {{-80.5, -701}, {-73, -701}}, color = {0, 0, 127}));
  connect(dTT701_SP.y, switch_dTT701.u3) annotation (
    Line(points = {{-103.5, -262}, {-100, -262}, {-100, -256}, {-96, -256}}, color = {0, 0, 127}));
  connect(bool_dTT701_SP.y, switch_dTT701.u2) annotation (
    Line(points = {{-103.5, -252}, {-96, -252}}, color = {255, 0, 255}));
  connect(switch_dTT701.y, PI_TT701.REF) annotation (
    Line(points = {{-84.5, -252}, {-77, -252}, {-77, -264}, {-68, -264}}, color = {0, 0, 127}));
  connect(dTT701_SP_var.y, switch_dTT701.u1) annotation (
    Line(points = {{-103.5, -244}, {-100, -244}, {-100, -248}, {-96, -248}}, color = {0, 0, 127}));
  connect(dTT711_SP.y, switch_dTT711.u3) annotation (
    Line(points = {{-103.5, -297}, {-100, -297}, {-100, -291}, {-96, -291}}, color = {0, 0, 127}));
  connect(dTT711_SP_var.y, switch_dTT711.u1) annotation (
    Line(points = {{-103.5, -280}, {-100, -280}, {-100, -283}, {-96, -283}}, color = {0, 0, 127}));
  connect(bool_dTT711_SP.y, switch_dTT711.u2) annotation (
    Line(points = {{-103.5, -287}, {-96, -287}}, color = {255, 0, 255}));
  connect(switch_dTT711.y, PI_TT711.REF) annotation (
    Line(points = {{-84.5, -287}, {-77, -287}, {-77, -298}, {-68, -298}}, color = {0, 0, 127}));
  connect(dTT721_SP.y, switch_dTT721.u3) annotation (
    Line(points = {{-103.5, -328}, {-100, -328}, {-100, -322}, {-96, -322}}, color = {0, 0, 127}));
  connect(bool_dTT721_SP.y, switch_dTT721.u2) annotation (
    Line(points = {{-103.5, -318}, {-96, -318}}, color = {255, 0, 255}));
  connect(switch_dTT721.y, PI_TT721.REF) annotation (
    Line(points = {{-84.5, -318}, {-76, -318}, {-76, -328}, {-68, -328}}, color = {0, 0, 127}));
  connect(dTT731_SP.y, switch_dTT731.u3) annotation (
    Line(points = {{-103.5, -358}, {-100, -358}, {-100, -352}, {-96, -352}}, color = {0, 0, 127}));
  connect(bool_dTT731_SP.y, switch_dTT731.u2) annotation (
    Line(points = {{-103.5, -348}, {-96, -348}}, color = {255, 0, 255}));
  connect(dTT731SP_var.y, switch_dTT731.u1) annotation (
    Line(points = {{-103.5, -341}, {-100, -341}, {-100, -344}, {-96, -344}}, color = {0, 0, 127}));
  connect(switch_dTT731.y, PI_TT731.REF) annotation (
    Line(points = {{-84.5, -348}, {-74, -348}, {-74, -357}, {-68, -357}}, color = {0, 0, 127}));
  connect(dTT721_SP_var.y, switch_dTT721.u1) annotation (
    Line(points = {{-103.5, -311}, {-99, -311}, {-99, -314}, {-96, -314}}, color = {0, 0, 127}));
  connect(PI_TT701.controlAction, controlSignalBus.dthetaTCV701) annotation (
    Line(points = {{-49, -268}, {160, -268}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT711.controlAction, controlSignalBus.dthetaFCV711) annotation (
    Line(points = {{31, -468}, {160, -468}, {160, -133}, {166, -133}, {166, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT721.controlAction, controlSignalBus.dthetaFCV721) annotation (
    Line(points = {{31, -508}, {160, -508}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(FB_EX731Pt1.y, I_EX731Pt1.u) annotation (
    Line(points = {{-88, -543}, {-77, -543}}, color = {0, 0, 127}));
  connect(processVariableBus.dEX731Pt, FB_EX731Pt1.u2) annotation (
    Line(points = {{-170, -2}, {-170, -560}, {-97, -560}, {-97, -551}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dFT731, PI_FT731.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -563}, {0, -563}, {0, -546}, {12, -546}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT731.controlAction, controlSignalBus.dthetaFCV731) annotation (
    Line(points = {{31, -542}, {160, -542}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dPtEX731.y, FB_EX731Pt1.u1) annotation (
    Line(points = {{-81.5, -733}, {-79, -733}, {-79, -780}, {-116, -780}, {-116, -543}, {-105, -543}}, color = {0, 0, 127}));
  connect(FB_EX721Pt1.y, I_EX721Pt1.u) annotation (
    Line(points = {{-88, -508}, {-77, -508}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT721, PI_FT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-169, -2}, {-169, -528}, {0, -528}, {0, -512}, {12, -512}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dEX721Pt, FB_EX721Pt1.u2) annotation (
    Line(points = {{-170, -2}, {-170, -525}, {-97, -525}, {-97, -516}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dPtEX721.y, FB_EX721Pt1.u1) annotation (
    Line(points = {{-80.5, -701}, {-79, -701}, {-79, -693}, {-123, -693}, {-123, -508}, {-105, -508}}, color = {0, 0, 127}));
  connect(I_EX721Pt1.y, lim_EX721Pt1.u) annotation (
    Line(points = {{-54, -508}, {-46, -508}}, color = {0, 0, 127}));
  connect(lim_EX721Pt1.y, PI_FT721.REF) annotation (
    Line(points = {{-23, -508}, {-19, -508}, {-19, -504}, {12, -504}}, color = {0, 0, 127}));
  connect(I_EX731Pt1.y, lim_EX731Pt1.u) annotation (
    Line(points = {{-54, -543}, {-46, -543}}, color = {0, 0, 127}));
  connect(lim_EX731Pt1.y, PI_FT731.REF) annotation (
    Line(points = {{-23, -543}, {-20, -543}, {-20, -538}, {12, -538}}, color = {0, 0, 127}));
  connect(I_EX711Pt1.y, lim_EX711Pt1.u) annotation (
    Line(points = {{-54, -468}, {-46, -468}}, color = {0, 0, 127}));
  connect(FB_EX711Pt1.y, I_EX711Pt1.u) annotation (
    Line(points = {{-88, -468}, {-77, -468}}, color = {0, 0, 127}));
  connect(lim_EX711Pt1.y, PI_FT711.REF) annotation (
    Line(points = {{-23, -468}, {-14, -468}, {-14, -464}, {12, -464}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT711, PI_FT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -488}, {1, -488}, {1, -472}, {12, -472}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dEX711Pt, FB_EX711Pt1.u2) annotation (
    Line(points = {{-170, -2}, {-170, -485}, {-97, -485}, {-97, -476}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(switch_dPtEX711.y, FB_EX711Pt1.u1) annotation (
    Line(points = {{-80.5, -667}, {-79, -667}, {-79, -665}, {-126, -665}, {-126, -468}, {-105, -468}}, color = {0, 0, 127}));
  connect(lim_EX701Pt1.y, PI_FT701.REF) annotation (
    Line(points = {{-22, -428}, {-17, -428}, {-17, -424}, {12, -424}}, color = {0, 0, 127}));
  connect(I_EX701Pt1.y, lim_EX701Pt1.u) annotation (
    Line(points = {{-53, -428}, {-45, -428}}, color = {0, 0, 127}));
  connect(FB_EX701Pt1.y, I_EX701Pt1.u) annotation (
    Line(points = {{-87, -428}, {-76, -428}}, color = {0, 0, 127}));
  connect(switch_dPtEX701.y, FB_EX701Pt1.u1) annotation (
    Line(points = {{-80.5, -629}, {-79, -629}, {-79, -624}, {-131, -624}, {-131, -428}, {-104, -428}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT701, PI_FT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -449}, {0, -449}, {0, -432}, {12, -432}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(processVariableBus.dEX701Pt, FB_EX701Pt1.u2) annotation (
    Line(points = {{-170, -2}, {-170, -446}, {-96, -446}, {-96, -436}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-3, -6}, {-3, -6}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT701.controlAction, controlSignalBus.dthetaFCV701) annotation (
    Line(points = {{31, -428}, {96, -428}, {96, -429}, {160, -429}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PID
Control
System")}),
    Diagram(coordinateSystem(extent = {{-160, -600}, {160, 200}}), graphics={  Rectangle(extent = {{-60, -80}, {10, -170}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-150, 190}, {-80, 90}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 190}, {-85, 170}}, textString = "S900", textColor = {0, 0, 0}), Rectangle(extent = {{-150, 80}, {-80, -50}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 80}, {-85, 60}}, textColor = {0, 0, 0}, textString = "S100"), Rectangle(extent = {{-150, -60}, {-80, -190}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, -60}, {-85, -80}}, textColor = {0, 0, 0}, textString = "S400"), Rectangle(extent = {{-60, 190}, {10, 30}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-55, 190}, {5, 170}}, textColor = {0, 0, 0}, textString = "S700"), Rectangle(extent = {{-60, 20}, {10, -70}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-56, 18}, {4, -2}}, textColor = {0, 0, 0}, textString = "RACK"), Rectangle(extent = {{30, 190}, {100, -30}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{34, 190}, {94, 170}}, textColor = {0, 0, 0}, textString = "RR00"), Text(extent = {{-55, -79}, {5, -99}}, textColor = {0, 0, 0}, textString = "S500"), Rectangle(extent = {{-130, -588}, {40, -758}}, fillColor = {213, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-126, -590}, {34, -610}}, textColor = {0, 0, 0}, textString = "Power Control"), Rectangle(extent = {{-134, -392}, {75, -567}}, fillColor = {213, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-110, -392}, {50, -412}}, textColor = {0, 0, 0}, textString = "Power Control"), Rectangle(extent = {{-133, -220}, {2, -375}}, fillColor = {213, 255, 170}, fillPattern = FillPattern.Solid, lineColor = {0, 0, 0}), Text(extent = {{-133, -220}, {2, -240}}, textColor = {0, 0, 0}, textString = "Treturn Control")}));
end ControllerBaseII;
