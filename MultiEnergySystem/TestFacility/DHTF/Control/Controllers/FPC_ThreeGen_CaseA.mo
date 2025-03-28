within MultiEnergySystem.TestFacility.DHTF.Control.Controllers;
model FPC_ThreeGen_CaseA
  constant Real pi = Modelica.Constants.pi;
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
  parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
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
  Real TT701SP(nominal = Tout_gen_nom);
  Real dTT701SP(min = -1, max = 0);
  Real TT711SP(nominal = Tout_gen_nom);
  Real dTT711SP(min = -1, max = 0);
  Real TT721SP(nominal = Tout_gen_nom);
  Real dTT721SP(min = -1, max = 0);
  Real TT731SP(nominal = Tout_gen_nom);
  Real dTT731SP(min = -1, max = 0);
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
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(Kp = 0.84502, Ti = 0.26795, Umax = 0, Umin = -2, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -120}, {60, -110}})));
  DistrictHeatingNetwork.Controllers.SplitRange sR_FT101 annotation (
    Placement(transformation(extent = {{70, -125}, {90, -105}})));
  Export.Interfaces.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin = {-170, -2}, extent = {{50, 40}, {-50, -40}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression dFT101SP_var(y = dFT101SP) annotation (
    Placement(transformation(extent = {{30, -115}, {40, -105}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(Kp = 0.69355, Ti = 0.26795, Umax = 0, Umin = -2, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -155}, {60, -145}})));
  DistrictHeatingNetwork.Controllers.SplitRange sR_FT401 annotation (
    Placement(transformation(extent = {{70, -160}, {90, -140}})));
  Modelica.Blocks.Sources.RealExpression dFT401SP_var(y = dFT401SP) annotation (
    Placement(transformation(extent = {{30, -145}, {40, -135}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT701(Kp = 0.1128, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -195}, {60, -185}})));
  Modelica.Blocks.Sources.RealExpression dFT501SP_var(y = dFT501SP) annotation (
    Placement(transformation(extent = {{30, -173}, {40, -163}})));
  Modelica.Blocks.Sources.RealExpression dFT701SP_var(y = dFT701SP) annotation (
    Placement(transformation(extent = {{30, -190}, {40, -180}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT501(Kp = 0.55085, Ti = 0.26795, Umax = 0, Umin = -0.4, y_start = -0.4, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -177}, {60, -167}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT711(Kp = 0.13279, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -210}, {60, -200}})));
  Modelica.Blocks.Sources.RealExpression dFT711SP_var(y = dFT711SP) annotation (
    Placement(transformation(extent = {{30, -205}, {40, -195}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT721(Kp = 0.1456, Ti = 0.26795, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -225}, {60, -215}})));
  Modelica.Blocks.Sources.RealExpression dFT721SP_var(y = dFT721SP) annotation (
    Placement(transformation(extent = {{30, -219}, {40, -209}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT701(Kp = -0.2743, Ti = 0.7859, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -256}, {60, -246}})));
  Modelica.Blocks.Sources.RealExpression dTT701SP_var(y = dTT701SP) annotation (
    Placement(transformation(extent = {{30, -251}, {40, -241}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT711(Kp = -0.6127, Ti = 0.7859, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -270}, {60, -260}})));
  Modelica.Blocks.Sources.RealExpression dTT711SP_var(y = dTT711SP) annotation (
    Placement(transformation(extent = {{30, -265}, {40, -255}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT721(Kp = -0.6127, Ti = 0.7859, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -285}, {60, -275}})));
  Modelica.Blocks.Sources.RealExpression dTT721SP_var(y = dTT721SP) annotation (
    Placement(transformation(extent = {{30, -280}, {40, -270}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT731(Kp = -0.8127, Ti = 0.7859, Umax = 0, Umin = -1, y_start = 0, firstOrder(initType = Modelica.Blocks.Types.Init.InitialState)) annotation (
    Placement(transformation(extent = {{50, -300}, {60, -290}})));
  Modelica.Blocks.Sources.RealExpression dTT731SP_var(y = dTT731SP) annotation (
    Placement(transformation(extent = {{30, -295}, {40, -285}})));
equation
  // S900
  dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
  theta_FCV901SP = 1;
  booldthetaFCV901 = true;
  domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;
  omega_P901SP = 2*pi*35;
  booldomegaP901 = true;
  // S100
  dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
  theta_FCV101SP = 1;
  booldthetaFCV101 = true;
  domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
  omega_P101SP = 2*pi*35;
  booldomegaP101 = true;
  dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_GB101SP = 80 + 273.15;
  booldToutGB101 = true;
  // S400
  dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
  theta_FCV401SP = 1;
  booldthetaFCV401 = true;
  domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
  omega_P401SP = 2*pi*35;
  booldomegaP401 = true;
  dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_EB401SP = 80 + 273.15;
  booldToutEB401 = true;
  // S500
  domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
  omega_P501SP = 2*pi*35;
  booldomegaP501 = true;
  dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_CHP501SP = 80 + 273.15;
  booldToutCHP501 = true;
  // S700
  dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
  theta_FCV701SP = 1;
  booldthetaFCV701 = true;
  dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
  theta_FCV711SP = 1;
  booldthetaFCV711 = true;
  dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
  theta_FCV721SP = 1;
  booldthetaFCV721 = true;
  dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;
  theta_FCV731SP = 1;
  booldthetaFCV731 = true;
  // Rack
  dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
  theta_FCVC01SP = 1;
  booldthetaFCVC01 = true;
  dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;
  theta_FCVC02SP = 1;
  booldthetaFCVC02 = true;
  // RR00
  dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
  theta_TCV701SP = 1;
  booldthetaTCV701 = true;
  dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
  theta_TCV711SP = 1;
  booldthetaTCV711 = true;
  dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
  theta_TCV721SP = 1;
  booldthetaTCV721 = true;
  dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
  theta_TCV731SP = 1;
  booldthetaTCV731 = true;
  dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
  theta_FCVR01SP = 1;
  booldthetaFCVR01 = true;
  dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
  Tout_RR01SP = 20 + 273.15;
  booldToutRR01 = true;
  //Set-points
  FT101SP = 1.7;
  dFT101SP = (FT101SP - 5.7166667)/5.7166667;
  FT401SP = 1.33;
  //FT401SP = if time < 1e3 then 1.3 elseif time < 2e3 then -0.00053*time + 1.9 else 0.8;
  dFT401SP = (FT401SP - 3.2666667)/3.2666667;
  FT501SP = 2.1;
  dFT501SP = (FT501SP - FT501_nom)/FT501_nom;
  FT701SP = 1.35;
  dFT701SP = (FT701SP - 2)/2;
  FT711SP = 1.30;
  dFT711SP = (FT711SP - 2)/2;
  FT721SP = 1.20;
  dFT721SP = (FT721SP - 2)/2;
  TT701SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  dTT701SP = (TT701SP - (60 + 273.15))/(100 + 273.15);
  TT711SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  dTT711SP = (TT711SP - (60 + 273.15))/(100 + 273.15);
  TT721SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  dTT721SP = (TT721SP - (60 + 273.15))/(100 + 273.15);
  TT731SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
  dTT731SP = (TT731SP - (60 + 273.15))/(100 + 273.15);
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
  connect(switch_dthetaFCV731.y, controlSignalBus.dthetaFCV731) annotation (
    Line(points = {{-21.5, 56}, {-19, 56}, {-19, 50}, {17, 50}, {17, -44}, {142, -44}, {142, 0}, {160, 0}}, color = {0, 0, 127}),
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
  connect(PI_FT101.controlAction, sR_FT101.U) annotation (
    Line(points = {{60.5, -115}, {72, -115}}, color = {0, 0, 127}));
  connect(dFT101SP_var.y, PI_FT101.REF) annotation (
    Line(points = {{40.5, -110}, {46, -110}, {46, -113}, {51, -113}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT101, PI_FT101.FeedBack) annotation (
    Line(points = {{-170, -2}, {-162, -2}, {-162, 1}, {-155, 1}, {-155, -196}, {19, -196}, {19, -117}, {51, -117}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(sR_FT101.Yout1, controlSignalBus.domegaP101) annotation (
    Line(points = {{88, -111}, {146, -111}, {146, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(PI_FT401.controlAction, sR_FT401.U) annotation (
    Line(points = {{60.5, -150}, {72, -150}}, color = {0, 0, 127}));
  connect(dFT401SP_var.y, PI_FT401.REF) annotation (
    Line(points = {{40.5, -140}, {45, -140}, {45, -148}, {51, -148}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (
    Line(points = {{-170, -2}, {-162, -2}, {-162, 1}, {-153, 1}, {-153, -197}, {21, -197}, {21, -152}, {51, -152}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(sR_FT401.Yout1, controlSignalBus.domegaP401) annotation (
    Line(points = {{88, -146}, {148, -146}, {148, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dFT701SP_var.y, PI_FT701.REF) annotation (
    Line(points = {{40.5, -185}, {44, -185}, {44, -188}, {51, -188}}, color = {0, 0, 127}));
  connect(PI_FT701.controlAction, controlSignalBus.dthetaFCV701) annotation (
    Line(points = {{60.5, -190}, {153, -190}, {153, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dFT701, PI_FT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-157, -2}, {-157, -200}, {25, -200}, {25, -192}, {51, -192}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dFT501SP_var.y, PI_FT501.REF) annotation (
    Line(points = {{40.5, -168}, {46, -168}, {46, -170}, {51, -170}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT501, PI_FT501.FeedBack) annotation (
    Line(points = {{-170, -2}, {-156, -2}, {-156, -198}, {22, -198}, {22, -174}, {51, -174}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT501.controlAction, controlSignalBus.domegaP501) annotation (
    Line(points = {{60.5, -172}, {150, -172}, {150, -86}, {160, -86}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dFT711SP_var.y, PI_FT711.REF) annotation (
    Line(points = {{40.5, -200}, {44, -200}, {44, -203}, {51, -203}}, color = {0, 0, 127}));
  connect(processVariableBus.dFT711, PI_FT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -207}, {51, -207}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_FT711.controlAction, controlSignalBus.dthetaFCV711) annotation (
    Line(points = {{60.5, -205}, {160, -205}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dFT721SP_var.y, PI_FT721.REF) annotation (
    Line(points = {{40.5, -214}, {44, -214}, {44, -218}, {51, -218}}, color = {0, 0, 127}));
  connect(PI_FT721.controlAction, controlSignalBus.dthetaFCV721) annotation (
    Line(points = {{60.5, -220}, {160, -220}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dFT721, PI_FT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-172, -2}, {-172, -211}, {24, -211}, {24, -222}, {51, -222}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dTT701SP_var.y, PI_TT701.REF) annotation (
    Line(points = {{40.5, -246}, {45, -246}, {45, -249}, {51, -249}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT701, PI_TT701.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -253}, {51, -253}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT701.controlAction, controlSignalBus.dthetaTCV701) annotation (
    Line(points = {{60.5, -251}, {160, -251}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT711SP_var.y, PI_TT711.REF) annotation (
    Line(points = {{40.5, -260}, {45, -260}, {45, -263}, {51, -263}}, color = {0, 0, 127}));
  connect(PI_TT711.controlAction, controlSignalBus.dthetaTCV711) annotation (
    Line(points = {{60.5, -265}, {160, -265}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(processVariableBus.dTT711, PI_TT711.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -267}, {51, -267}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(dTT721SP_var.y, PI_TT721.REF) annotation (
    Line(points = {{40.5, -275}, {45, -275}, {45, -278}, {51, -278}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT721, PI_TT721.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -282}, {51, -282}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT721.controlAction, controlSignalBus.dthetaTCV721) annotation (
    Line(points = {{60.5, -280}, {160, -280}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dTT731SP_var.y, PI_TT731.REF) annotation (
    Line(points = {{40.5, -290}, {45, -290}, {45, -293}, {51, -293}}, color = {0, 0, 127}));
  connect(processVariableBus.dTT731, PI_TT731.FeedBack) annotation (
    Line(points = {{-170, -2}, {-170, -297}, {51, -297}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}, horizontalAlignment = TextAlignment.Right));
  connect(PI_TT731.controlAction, controlSignalBus.dthetaTCV731) annotation (
    Line(points = {{60.5, -295}, {160, -295}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(sR_FT101.Yout2, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{88, -119}, {147, -119}, {147, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(sR_FT401.Yout2, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{88, -154}, {149, -154}, {149, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PID
Control
System")}),
    Diagram(coordinateSystem(extent = {{-160, -200}, {160, 200}}, grid = {1, 1}), graphics={  Rectangle(extent = {{-60, -80}, {10, -170}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Rectangle(extent = {{-150, 190}, {-80, 90}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 190}, {-85, 170}}, textString = "S900", textColor = {0, 0, 0}), Rectangle(extent = {{-150, 80}, {-80, -50}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 80}, {-85, 60}}, textColor = {0, 0, 0}, textString = "S100"), Rectangle(extent = {{-150, -60}, {-80, -190}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, -60}, {-85, -80}}, textColor = {0, 0, 0}, textString = "S400"), Rectangle(extent = {{-60, 190}, {10, 30}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-55, 190}, {5, 170}}, textColor = {0, 0, 0}, textString = "S700"), Rectangle(extent = {{-60, 20}, {10, -70}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-56, 18}, {4, -2}}, textColor = {0, 0, 0}, textString = "RACK"), Rectangle(extent = {{30, 190}, {100, -30}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{34, 190}, {94, 170}}, textColor = {0, 0, 0}, textString = "RR00"), Text(extent = {{-55, -79}, {5, -99}}, textColor = {0, 0, 0}, textString = "S500")}));
end FPC_ThreeGen_CaseA;
