within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
partial model OpenLoopActuatorBase
  constant Real pi = Modelica.Constants.pi;
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
  parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
  parameter Boolean useRealExpression = true "true if use RealExpression blocks as set-point variables";
  // Boolean Parameters
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
  // Boolean variables to decide whether use a TimeTable (parameter) or a RealExpression (variable) as setpoint
  Boolean booldthetaFCV901;
  Boolean booldomegaP901;
  Boolean booldthetaFCV101;
  Boolean booldomegaP101;
  Boolean booldToutGB101;
  //   Boolean booldthetaFCV401;
  //   Boolean booldomegaP401;
  //   Boolean booldToutEB401;
  //   Boolean booldomegaP501;
  //   Boolean booldToutCHP501;
  Boolean booldthetaFCV701;
  Boolean booldthetaFCV711;
  Boolean booldthetaFCV721;
  Boolean booldthetaFCV731;
  Boolean booldthetaFCVC01;
  Boolean booldthetaFCVC02;
  Boolean booldthetaTCV701;
  Boolean booldthetaTCV711;
  Boolean booldthetaTCV721;
  Boolean booldthetaTCV731;
  Boolean booldthetaFCVR01;
  Boolean booldToutRR01;
  // S900
  DistrictHeatingNetwork.Types.PerUnit theta_FCV901SP;
  Real dtheta_FCV901_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
  Real domega_P901_var(min = -1, max = 0);
  // S100
  DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
  Real dtheta_FCV101_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
  Real domega_P101_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
  Real dTout_GB101_var(min = -1, max = 0);
  // S400
  //   DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
  //   Real dtheta_FCV401_var(min = -1, max = 0);
  //   DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
  //   Real domega_P401_var(min = -1, max = 0);
  //   DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
  //   Real dTout_EB401_var(min = -1, max = 0);
  // S500
  //   DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
  //   Real domega_P501_var(min = -1, max = 0);
  //   DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
  //   Real dTout_CHP501_var(min = -1, max = 0);
  // S700
  DistrictHeatingNetwork.Types.PerUnit theta_FCV701SP;
  Real dtheta_FCV701_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
  Real dtheta_FCV711_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
  Real dtheta_FCV721_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
  Real dtheta_FCV731_var(min = -1, max = 0);
  // Rack
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
  Real dtheta_FCVC01_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
  Real dtheta_FCVC02_var(min = -1, max = 0);
  // Cooling
  DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
  Real dtheta_TCV701_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
  Real dtheta_TCV711_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
  Real dtheta_TCV721_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
  Real dtheta_TCV731_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
  Real dtheta_FCVR01_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
  Real dTout_RR01_var(min = -1, max = 0);
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
    Placement(transformation(extent = {{-50, -21}, {-40, -11}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y = booldthetaFCVC01) annotation (
    Placement(transformation(extent = {{-50, -11}, {-40, -1}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y = dtheta_FCVC01_var) annotation (
    Placement(transformation(extent = {{-50, -2}, {-40, 8}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (
    Placement(transformation(extent = {{-32, -11}, {-22, -1}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC01_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, -16}, {6, 4}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table = dtheta_FCVC02) annotation (
    Placement(transformation(extent = {{-50, -55}, {-40, -45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y = booldthetaFCVC02) annotation (
    Placement(transformation(extent = {{-50, -45}, {-40, -35}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y = dtheta_FCVC02_var) annotation (
    Placement(transformation(extent = {{-50, -36}, {-40, -26}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (
    Placement(transformation(extent = {{-32, -45}, {-22, -35}})));
  Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC02_act(use_numberPort = true, significantDigits = 2) annotation (
    Placement(transformation(extent = {{-14, -50}, {6, -30}})));
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
equation
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
    Line(points = {{-39.5, -6}, {-33, -6}}, color = {255, 0, 255}));
  connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (
    Line(points = {{-39.5, 3}, {-36, 3}, {-36, -2}, {-33, -2}}, color = {0, 0, 127}));
  connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (
    Line(points = {{-39.5, -16}, {-36, -16}, {-36, -10}, {-33, -10}}, color = {0, 0, 127}));
  connect(dtheta_FCVC01_act.numberPort, switch_dthetaFCVC01.y) annotation (
    Line(points = {{-15.5, -6}, {-21.5, -6}}, color = {0, 0, 127}));
  connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (
    Line(points = {{-39.5, -40}, {-33, -40}}, color = {255, 0, 255}));
  connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (
    Line(points = {{-39.5, -31}, {-36, -31}, {-36, -36}, {-33, -36}}, color = {0, 0, 127}));
  connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (
    Line(points = {{-39.5, -50}, {-36, -50}, {-36, -44}, {-33, -44}}, color = {0, 0, 127}));
  connect(dtheta_FCVC02_act.numberPort, switch_dthetaFCVC02.y) annotation (
    Line(points = {{-15.5, -40}, {-21.5, -40}}, color = {0, 0, 127}));
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
  connect(switch_dthetaTCV701.y, controlSignalBus.dthetaTCV701) annotation (
    Line(points = {{67.5, 155}, {70, 155}, {70, 141}, {140, 141}, {140, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaTCV711.y, controlSignalBus.dthetaTCV711) annotation (
    Line(points = {{67.5, 121}, {70, 121}, {70, 110}, {139, 110}, {139, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaTCV721.y, controlSignalBus.dthetaTCV721) annotation (
    Line(points = {{67.5, 88}, {69, 88}, {69, 80}, {138, 80}, {138, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaTCV731.y, controlSignalBus.dthetaTCV731) annotation (
    Line(points = {{67.5, 56}, {70, 56}, {70, 40}, {137, 40}, {137, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01) annotation (
    Line(points = {{67.5, 23}, {70, 23}, {70, 10}, {136, 10}, {136, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutRR01.y, controlSignalBus.dToutRR01) annotation (
    Line(points = {{67.5, -10}, {70, -10}, {70, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV701.y, controlSignalBus.dthetaFCV701) annotation (
    Line(points = {{-21.5, 155}, {-19, 155}, {-19, 140}, {20, 140}, {20, -40}, {139, -40}, {139, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV711.y, controlSignalBus.dthetaFCV711) annotation (
    Line(points = {{-21.5, 121}, {-19, 121}, {-19, 110}, {19, 110}, {19, -42}, {140, -42}, {140, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV721.y, controlSignalBus.dthetaFCV721) annotation (
    Line(points = {{-21.5, 88}, {-19, 88}, {-19, 80}, {18, 80}, {18, -43}, {141, -43}, {141, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV731.y, controlSignalBus.dthetaFCV731) annotation (
    Line(points = {{-21.5, 56}, {-19, 56}, {-19, 50}, {17, 50}, {17, -44}, {142, -44}, {142, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01) annotation (
    Line(points = {{-21.5, -6}, {-19, -6}, {-19, -12}, {16, -12}, {16, -45}, {143, -45}, {143, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
    Line(points = {{-21.5, -40}, {-19, -40}, {-19, -34}, {15, -34}, {15, -46}, {144, -46}, {144, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP901.y, controlSignalBus.domegaP901) annotation (
    Line(points = {{-111.5, 150}, {-110, 150}, {-110, 160}, {-77, 160}, {-77, 197}, {149, 197}, {149, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
    Line(points = {{-112.5, 117}, {-111, 117}, {-111, 140}, {-76, 140}, {-76, 196}, {148, 196}, {148, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_domegaP101.y, controlSignalBus.domegaP101) annotation (
    Line(points = {{-111.5, 40}, {-110, 40}, {-110, 34}, {25, 34}, {25, -35}, {124, -35}, {124, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101) annotation (
    Line(points = {{-112.5, 7}, {-110, 7}, {-110, 33}, {24, 33}, {24, -36}, {125, -36}, {125, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (
    Line(points = {{-112.5, -26}, {-110, -26}, {-110, -10}, {-77, -10}, {-77, 32}, {23, 32}, {23, -37}, {127, -37}, {127, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "Open
Loop
Act")}),
    Diagram(coordinateSystem(extent = {{-160, -200}, {160, 200}}, grid = {1, 1}), graphics={  Rectangle(extent = {{-150, 190}, {-80, 90}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 190}, {-85, 170}}, textString = "S900", textColor = {0, 0, 0}), Rectangle(extent = {{-150, 80}, {-80, -50}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, 80}, {-85, 60}}, textColor = {0, 0, 0}, textString = "S100"), Rectangle(extent = {{-60, 190}, {10, 36}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-55, 190}, {5, 170}}, textColor = {0, 0, 0}, textString = "S700"), Rectangle(extent = {{-60, 30}, {10, -60}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-56, 28}, {4, 8}}, textColor = {0, 0, 0}, textString = "RACK"), Rectangle(extent = {{30, 190}, {100, -30}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{34, 190}, {94, 170}}, textColor = {0, 0, 0}, textString = "RR00")}));
end OpenLoopActuatorBase;
