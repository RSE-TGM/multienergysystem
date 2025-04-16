within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
partial model OpenLoopActuatorBase_III
  constant Real pi = Modelica.Constants.pi;
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
  parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
  parameter Boolean useRealExpression = true "true if use RealExpression blocks as set-point variables";
  // Boolean Parameters
  // Rack CD
  parameter Real theta_FCVC01[:, :] = [0, 0; 1e6, 0];
  parameter Real theta_FCVC02[:, :] = [0, 0; 2e3, 0];
  // S900
  parameter Real omega_P901[:, :] = [0, 2*pi*30; 1e6, 2*pi*30];
  parameter Real theta_FCV901[:, :] = [0, 1; 1e6, 1];
  // S100
  parameter Real Tout_GB101[:, :] = [0, 80 + 273.15; 1e6, 80 + 273.15];
  parameter Real omega_P101[:, :] = [0, 2*pi*30; 1e6, 2*pi*30];
  parameter Real theta_FCV101[:, :] = [0, 1; 1e6, 1];
  // S400
  parameter Real Tout_EB401[:, :] = [0, 80 + 273.15; 1e6, 80 + 273.15];
  parameter Real omega_P401[:, :] = [0, 2*pi*35; 1e6, 2*pi*35];
  parameter Real theta_FCV401[:, :] = [0, 1; 1e6, 1];
  // S500
  parameter Real Tout_CHP501[:, :] = [0, 80 + 273.15; 1e6, 80 + 273.15];
  parameter Real domega_P501[:, :] = [0, 2*pi*35; 1e6, 2*pi*35];
  // S700
  parameter Real theta_FCV701[:, :] = [0, 0.8; 1e6, 0.8];
  parameter Real theta_FCV711[:, :] = [0, 0.8; 1e6, 0.8];
  parameter Real theta_FCV721[:, :] = [0, 0.8; 1e6, 0.8];
  parameter Real theta_FCV731[:, :] = [0, 0.8; 1e6, 0.8];
  // Cooling System RR
  parameter Real theta_TCV701[:, :] = [0, 1; 1e6, 1];
  parameter Real theta_TCV711[:, :] = [0, 1; 1e6, 1];
  parameter Real theta_TCV721[:, :] = [0, 1; 1e6, 1];
  parameter Real theta_TCV731[:, :] = [0, 1; 1e6, 1];
  parameter Real theta_FCVR01[:, :] = [0, 0.5; 1e6, 0.5];
  parameter Real Tout_RR01[:, :] = [0, 15 + 273.15; 1e6, 15 + 273.15];
  parameter Real FTR01[:, :] = [0, 2*pi*40; 1000, 2*pi*40];
  // Boolean variables to decide whether use a TimeTable (parameter) or a RealExpression (variable) as setpoint
  Boolean booldthetaFCV901;
  Boolean booldomegaP901;
  Boolean booldthetaFCV101;
  Boolean booldomegaP101;
  Boolean booldToutGB101;

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
  Real theta_FCV901_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
  Real omega_P901_var(min = 0, max = 2*pi*50);
  // S100
  DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
  Real theta_FCV101_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
  Real omega_P101_var(min = 0, max = 2*pi*50);
  DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
  Real Tout_GB101_var(min = 0+273.15, max = 100+273.15);
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
  Real theta_FCV701_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
  Real theta_FCV711_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
  Real theta_FCV721_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
  Real theta_FCV731_var(min = 0, max = 1);
  // Rack
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
  Real theta_FCVC01_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
  Real theta_FCVC02_var(min = 0, max = 1);
  // Cooling
  DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
  Real theta_TCV701_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
  Real theta_TCV711_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
  Real theta_TCV721_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
  Real theta_TCV731_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
  Real theta_FCVR01_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
  Real Tout_RR01_var(min = 0+273.15, max = 100+273.15);
  Modelica.Blocks.Sources.TimeTable omegaP901(table=omega_P901) annotation (Placement(transformation(extent={{-144,138},{-134,148}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = theta_FCV901) annotation (
    Placement(transformation(extent={{-144,105},{-134,115}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin={0,-100},  extent = {{-30, -30}, {30, 30}}, rotation=180)));
  Modelica.Blocks.Sources.TimeTable ToutGB101(table=Tout_GB101) annotation (Placement(transformation(extent={{-45,-92},{-35,-82}})));
  Modelica.Blocks.Sources.RealExpression omegaP901_var(y=omega_P901_var) annotation (Placement(transformation(extent={{-144,158},{-134,168}})));
  Modelica.Blocks.Logical.Switch switch_omegaP901 annotation (Placement(transformation(extent={{-125,148},{-115,158}})));
  Modelica.Blocks.Sources.BooleanExpression bool_omegaP901(y=booldomegaP901) annotation (Placement(transformation(extent={{-144,148},{-134,158}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV901(y = booldthetaFCV901) annotation (
    Placement(transformation(extent={{-144,115},{-134,125}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV901_var(y = theta_FCV901_var) annotation (
    Placement(transformation(extent={{-144,124},{-134,134}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV901 annotation (
    Placement(transformation(extent={{-126,115},{-116,125}})));
  Modelica.Blocks.Sources.TimeTable omegaP101(table=omega_P101) annotation (Placement(transformation(extent={{-45,-26},{-35,-16}})));
  Modelica.Blocks.Sources.TimeTable thetaFCV101(table=theta_FCV101) annotation (Placement(transformation(extent={{-45,-59},{-35,-49}})));
  Modelica.Blocks.Sources.RealExpression omegaP101_var(y=omega_P101_var) annotation (Placement(transformation(extent={{-45,-6},{-35,4}})));
  Modelica.Blocks.Logical.Switch switch_omegaP101 annotation (Placement(transformation(extent={{-26,-16},{-16,-6}})));
  Modelica.Blocks.Sources.BooleanExpression bool_omegaP101(y=booldomegaP101) annotation (Placement(transformation(extent={{-45,-16},{-35,-6}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCV101(y=booldthetaFCV101) annotation (Placement(transformation(extent={{-45,-49},{-35,-39}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV101_var(y=theta_FCV101_var) annotation (Placement(transformation(extent={{-45,-40},{-35,-30}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCV101 annotation (Placement(transformation(extent={{-27,-49},{-17,-39}})));
  Modelica.Blocks.Sources.BooleanExpression bool_ToutGB101(y=booldToutGB101) annotation (Placement(transformation(extent={{-45,-82},{-35,-72}})));
  Modelica.Blocks.Sources.RealExpression ToutGB101_var(y=Tout_GB101_var) annotation (Placement(transformation(extent={{-45,-73},{-35,-63}})));
  Modelica.Blocks.Logical.Switch switch_ToutGB101 annotation (Placement(transformation(extent={{-27,-82},{-17,-72}})));
  Modelica.Blocks.Sources.TimeTable thetaFCV701(table=theta_FCV701) annotation (Placement(transformation(extent={{-72,140},{-62,150}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCV701(y=booldthetaFCV701) annotation (Placement(transformation(extent={{-72,150},{-62,160}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV701_var(y=theta_FCV701_var) annotation (Placement(transformation(extent={{-72,159},{-62,169}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCV701 annotation (Placement(transformation(extent={{-54,150},{-44,160}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV711(table = theta_FCV711) annotation (
    Placement(transformation(extent={{-72,106},{-62,116}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV711(y = booldthetaFCV711) annotation (
    Placement(transformation(extent={{-72,116},{-62,126}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV711_var(y = theta_FCV711_var) annotation (
    Placement(transformation(extent={{-72,125},{-62,135}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV711 annotation (
    Placement(transformation(extent={{-54,116},{-44,126}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV721(table = theta_FCV721) annotation (
    Placement(transformation(extent={{-72,73},{-62,83}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV721(y = booldthetaFCV721) annotation (
    Placement(transformation(extent={{-72,83},{-62,93}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV721_var(y = theta_FCV721_var) annotation (
    Placement(transformation(extent={{-72,92},{-62,102}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV721 annotation (
    Placement(transformation(extent={{-54,83},{-44,93}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = theta_FCV731) annotation (
    Placement(transformation(extent={{-72,41},{-62,51}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV731(y = booldthetaFCV731) annotation (
    Placement(transformation(extent={{-72,51},{-62,61}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV731_var(y = theta_FCV731_var) annotation (
    Placement(transformation(extent={{-72,60},{-62,70}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV731 annotation (
    Placement(transformation(extent={{-54,51},{-44,61}})));
  Modelica.Blocks.Sources.TimeTable thetaFCVC01(table=theta_FCVC01) annotation (Placement(transformation(extent={{-142,46},{-132,56}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCVC01(y=booldthetaFCVC01) annotation (Placement(transformation(extent={{-142,56},{-132,66}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC01_var(y=theta_FCVC01_var) annotation (Placement(transformation(extent={{-142,65},{-132,75}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCVC01 annotation (Placement(transformation(extent={{-124,56},{-114,66}})));
  Modelica.Blocks.Sources.TimeTable thetaFCVC02(table=theta_FCVC02) annotation (Placement(transformation(extent={{-142,12},{-132,22}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCVC02(y=booldthetaFCVC02) annotation (Placement(transformation(extent={{-142,22},{-132,32}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC02_var(y=theta_FCVC02_var) annotation (Placement(transformation(extent={{-142,31},{-132,41}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCVC02 annotation (Placement(transformation(extent={{-124,22},{-114,32}})));
  Modelica.Blocks.Sources.TimeTable thetaTCV701(table=theta_TCV701) annotation (Placement(transformation(extent={{-25,140},{-15,150}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaTCV701(y=booldthetaTCV701) annotation (Placement(transformation(extent={{-25,150},{-15,160}})));
  Modelica.Blocks.Sources.RealExpression thetaTCV701_var(y=theta_TCV701_var) annotation (Placement(transformation(extent={{-25,159},{-15,169}})));
  Modelica.Blocks.Logical.Switch switch_thetaTCV701 annotation (Placement(transformation(extent={{-7,150},{3,160}})));
  Modelica.Blocks.Sources.TimeTable thetaTCV711(table=theta_TCV711) annotation (Placement(transformation(extent={{-25,106},{-15,116}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaTCV711(y=booldthetaTCV711) annotation (Placement(transformation(extent={{-25,116},{-15,126}})));
  Modelica.Blocks.Sources.RealExpression thetaTCV711_var(y=theta_TCV711_var) annotation (Placement(transformation(extent={{-25,125},{-15,135}})));
  Modelica.Blocks.Logical.Switch switch_thetaTCV711 annotation (Placement(transformation(extent={{-7,116},{3,126}})));
  Modelica.Blocks.Sources.TimeTable thetaTCV721(table=theta_TCV721) annotation (Placement(transformation(extent={{-25,73},{-15,83}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaTCV721(y=booldthetaTCV721) annotation (Placement(transformation(extent={{-25,83},{-15,93}})));
  Modelica.Blocks.Sources.RealExpression thetaTCV721_var(y=theta_TCV721_var) annotation (Placement(transformation(extent={{-25,92},{-15,102}})));
  Modelica.Blocks.Logical.Switch switch_thetaTCV721 annotation (Placement(transformation(extent={{-7,83},{3,93}})));
  Modelica.Blocks.Sources.TimeTable thetaTCV731(table=theta_TCV731) annotation (Placement(transformation(extent={{-25,41},{-15,51}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaTCV731(y=booldthetaTCV731) annotation (Placement(transformation(extent={{-25,51},{-15,61}})));
  Modelica.Blocks.Sources.RealExpression thetaTCV731_var(y=theta_TCV731_var) annotation (Placement(transformation(extent={{-25,60},{-15,70}})));
  Modelica.Blocks.Logical.Switch switch_thetaTCV731 annotation (Placement(transformation(extent={{-7,51},{3,61}})));
  Modelica.Blocks.Sources.TimeTable thetaFCVR01(table=theta_FCVR01) annotation (Placement(transformation(extent={{49,79},{59,89}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCVR01(y=booldthetaFCVR01) annotation (Placement(transformation(extent={{49,89},{59,99}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVR01_var(y=theta_FCVR01_var) annotation (Placement(transformation(extent={{49,98},{59,108}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCVR01 annotation (Placement(transformation(extent={{67,89},{77,99}})));
  Modelica.Blocks.Sources.TimeTable ToutRR01(table=Tout_RR01) annotation (Placement(transformation(extent={{49,46},{59,56}})));
  Modelica.Blocks.Sources.BooleanExpression bool_ToutRR01(y=booldToutRR01) annotation (Placement(transformation(extent={{49,56},{59,66}})));
  Modelica.Blocks.Sources.RealExpression ToutRR01_var(y=Tout_RR01_var) annotation (Placement(transformation(extent={{49,65},{59,75}})));
  Modelica.Blocks.Logical.Switch switch_ToutRR01 annotation (Placement(transformation(extent={{67,56},{77,66}})));
  Modelica.Blocks.Sources.CombiTimeTable PtEX7X1SP(
    tableOnFile=false,
    table=[0,20000,20000,25000,25000; 3600,20000,20000,25000,25000; 7200,20000,20000,25000,25000; 10800,30000,30000,35000,35000; 14400,36000,36000,40000,40000; 18000,40000,40000,42000,42000; 21600,38000,38000,38000,38000; 25200,35000,35000,35000,
        35000; 28800,30000,30000,25000,25000; 32400,30000,30000,25000,25000; 36000,30000,30000,25000,25000; 39600,30000,30000,25000,25000; 43200,30000,30000,25000,25000; 46800,30000,30000,28000,28000; 50400,30000,30000,35000,35000; 54000,30000,30000,
        35000,35000; 57600,30000,30000,35000,35000; 61200,30000,30000,35000,35000; 64800,30000,30000,35000,35000; 68400,30000,30000,35000,35000; 72000,30000,30000,35000,35000; 75600,30000,30000,35000,35000; 79200,30000,30000,35000,35000; 82800,30000,
        30000,35000,35000; 86400,30000,30000,35000,35000],
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin={50,170},     extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.CombiTimeTable TT7X1SP(
    tableOnFile=false,
    table=[0,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 3600,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 7200,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 10800,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 14400,65 + 273.15,65 +
        273.15,65 + 273.15,65 + 273.15; 18000,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 21600,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 25200,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 28800,65 + 273.15,65 + 273.15,65 + 273.15,65
         + 273.15; 32400,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 36000,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 39600,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 43200,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 46800,65
         + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 50400,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 54000,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 57600,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 61200,65 + 273.15,65 + 273.15,
        65 + 273.15,65 + 273.15; 64800,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 68400,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 72000,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 75600,65 + 273.15,65 + 273.15,65 + 273.15,65 +
        273.15; 79200,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 82800,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15; 86400,65 + 273.15,65 + 273.15,65 + 273.15,65 + 273.15],
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint) annotation (Placement(transformation(origin={50,140}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.BooleanExpression GB101status(y=true)   annotation (
    Placement(transformation(extent={{-47,-116},{-27,-96}})));
  Modelica.Blocks.Sources.BooleanExpression RR01status(y=true)   annotation (
    Placement(transformation(extent={{49,22},{69,42}})));
  Modelica.Blocks.Sources.RealExpression omegaPR01_var(y=2*3.14159*45) annotation (Placement(transformation(extent={{49,7},{70,27}})));
equation
  connect(omegaP901_var.y, switch_omegaP901.u1) annotation (Line(points={{-133.5,163},{-130,163},{-130,157},{-126,157}}, color={0,0,127}));
  connect(bool_omegaP901.y, switch_omegaP901.u2) annotation (Line(points={{-133.5,153},{-126,153}}, color={255,0,255}));
  connect(omegaP901.y, switch_omegaP901.u3) annotation (Line(points={{-133.5,143},{-130,143},{-130,149},{-126,149}}, color={0,0,127}));
  connect(bool_dthetaFCV901.y, switch_dthetaFCV901.u2) annotation (
    Line(points={{-133.5,120},{-127,120}},      color = {255, 0, 255}));
  connect(dthetaFCV901_var.y, switch_dthetaFCV901.u1) annotation (
    Line(points={{-133.5,129},{-130,129},{-130,124},{-127,124}},          color = {0, 0, 127}));
  connect(dthetaFCV901.y, switch_dthetaFCV901.u3) annotation (
    Line(points={{-133.5,110},{-130,110},{-130,116},{-127,116}},          color = {0, 0, 127}));
  connect(omegaP101_var.y, switch_omegaP101.u1) annotation (Line(points={{-34.5,-1},{-31,-1},{-31,-7},{-27,-7}}, color={0,0,127}));
  connect(bool_omegaP101.y, switch_omegaP101.u2) annotation (Line(points={{-34.5,-11},{-27,-11}}, color={255,0,255}));
  connect(omegaP101.y, switch_omegaP101.u3) annotation (Line(points={{-34.5,-21},{-31,-21},{-31,-15},{-27,-15}}, color={0,0,127}));
  connect(bool_thetaFCV101.y, switch_thetaFCV101.u2) annotation (Line(points={{-34.5,-44},{-28,-44}}, color={255,0,255}));
  connect(thetaFCV101_var.y, switch_thetaFCV101.u1) annotation (Line(points={{-34.5,-35},{-31,-35},{-31,-40},{-28,-40}}, color={0,0,127}));
  connect(thetaFCV101.y, switch_thetaFCV101.u3) annotation (Line(points={{-34.5,-54},{-31,-54},{-31,-48},{-28,-48}}, color={0,0,127}));
  connect(bool_ToutGB101.y, switch_ToutGB101.u2) annotation (Line(points={{-34.5,-77},{-28,-77}}, color={255,0,255}));
  connect(ToutGB101_var.y, switch_ToutGB101.u1) annotation (Line(points={{-34.5,-68},{-31,-68},{-31,-73},{-28,-73}}, color={0,0,127}));
  connect(ToutGB101.y, switch_ToutGB101.u3) annotation (Line(points={{-34.5,-87},{-31,-87},{-31,-81},{-28,-81}}, color={0,0,127}));
  connect(bool_thetaFCV701.y, switch_thetaFCV701.u2) annotation (Line(points={{-61.5,155},{-55,155}}, color={255,0,255}));
  connect(thetaFCV701_var.y, switch_thetaFCV701.u1) annotation (Line(points={{-61.5,164},{-58,164},{-58,159},{-55,159}}, color={0,0,127}));
  connect(thetaFCV701.y, switch_thetaFCV701.u3) annotation (Line(points={{-61.5,145},{-58,145},{-58,151},{-55,151}}, color={0,0,127}));
  connect(bool_dthetaFCV711.y, switch_dthetaFCV711.u2) annotation (
    Line(points={{-61.5,121},{-55,121}},      color = {255, 0, 255}));
  connect(dthetaFCV711_var.y, switch_dthetaFCV711.u1) annotation (
    Line(points={{-61.5,130},{-58,130},{-58,125},{-55,125}},          color = {0, 0, 127}));
  connect(dthetaFCV711.y, switch_dthetaFCV711.u3) annotation (
    Line(points={{-61.5,111},{-58,111},{-58,117},{-55,117}},          color = {0, 0, 127}));
  connect(bool_dthetaFCV721.y, switch_dthetaFCV721.u2) annotation (
    Line(points={{-61.5,88},{-55,88}},      color = {255, 0, 255}));
  connect(dthetaFCV721_var.y, switch_dthetaFCV721.u1) annotation (
    Line(points={{-61.5,97},{-58,97},{-58,92},{-55,92}},          color = {0, 0, 127}));
  connect(dthetaFCV721.y, switch_dthetaFCV721.u3) annotation (
    Line(points={{-61.5,78},{-58,78},{-58,84},{-55,84}},          color = {0, 0, 127}));
  connect(bool_dthetaFCV731.y, switch_dthetaFCV731.u2) annotation (
    Line(points={{-61.5,56},{-55,56}},      color = {255, 0, 255}));
  connect(dthetaFCV731_var.y, switch_dthetaFCV731.u1) annotation (
    Line(points={{-61.5,65},{-58,65},{-58,60},{-55,60}},          color = {0, 0, 127}));
  connect(dthetaFCV731.y, switch_dthetaFCV731.u3) annotation (
    Line(points={{-61.5,46},{-58,46},{-58,52},{-55,52}},          color = {0, 0, 127}));
  connect(bool_thetaFCVC01.y, switch_thetaFCVC01.u2) annotation (Line(points={{-131.5,61},{-125,61}}, color={255,0,255}));
  connect(thetaFCVC01_var.y, switch_thetaFCVC01.u1) annotation (Line(points={{-131.5,70},{-128,70},{-128,65},{-125,65}}, color={0,0,127}));
  connect(thetaFCVC01.y, switch_thetaFCVC01.u3) annotation (Line(points={{-131.5,51},{-128,51},{-128,57},{-125,57}}, color={0,0,127}));
  connect(bool_thetaFCVC02.y, switch_thetaFCVC02.u2) annotation (Line(points={{-131.5,27},{-125,27}}, color={255,0,255}));
  connect(thetaFCVC02_var.y, switch_thetaFCVC02.u1) annotation (Line(points={{-131.5,36},{-128,36},{-128,31},{-125,31}}, color={0,0,127}));
  connect(thetaFCVC02.y, switch_thetaFCVC02.u3) annotation (Line(points={{-131.5,17},{-128,17},{-128,23},{-125,23}}, color={0,0,127}));
  connect(bool_thetaTCV701.y, switch_thetaTCV701.u2) annotation (Line(points={{-14.5,155},{-8,155}}, color={255,0,255}));
  connect(thetaTCV701_var.y, switch_thetaTCV701.u1) annotation (Line(points={{-14.5,164},{-11,164},{-11,159},{-8,159}}, color={0,0,127}));
  connect(thetaTCV701.y, switch_thetaTCV701.u3) annotation (Line(points={{-14.5,145},{-11,145},{-11,151},{-8,151}}, color={0,0,127}));
  connect(bool_thetaTCV711.y, switch_thetaTCV711.u2) annotation (Line(points={{-14.5,121},{-8,121}}, color={255,0,255}));
  connect(thetaTCV711_var.y, switch_thetaTCV711.u1) annotation (Line(points={{-14.5,130},{-11,130},{-11,125},{-8,125}}, color={0,0,127}));
  connect(thetaTCV711.y, switch_thetaTCV711.u3) annotation (Line(points={{-14.5,111},{-11,111},{-11,117},{-8,117}}, color={0,0,127}));
  connect(bool_thetaTCV721.y, switch_thetaTCV721.u2) annotation (Line(points={{-14.5,88},{-8,88}}, color={255,0,255}));
  connect(thetaTCV721_var.y, switch_thetaTCV721.u1) annotation (Line(points={{-14.5,97},{-11,97},{-11,92},{-8,92}}, color={0,0,127}));
  connect(thetaTCV721.y, switch_thetaTCV721.u3) annotation (Line(points={{-14.5,78},{-11,78},{-11,84},{-8,84}}, color={0,0,127}));
  connect(bool_thetaTCV731.y, switch_thetaTCV731.u2) annotation (Line(points={{-14.5,56},{-8,56}}, color={255,0,255}));
  connect(thetaTCV731_var.y, switch_thetaTCV731.u1) annotation (Line(points={{-14.5,65},{-11,65},{-11,60},{-8,60}}, color={0,0,127}));
  connect(thetaTCV731.y, switch_thetaTCV731.u3) annotation (Line(points={{-14.5,46},{-11,46},{-11,52},{-8,52}}, color={0,0,127}));
  connect(bool_thetaFCVR01.y, switch_thetaFCVR01.u2) annotation (Line(points={{59.5,94},{66,94}}, color={255,0,255}));
  connect(thetaFCVR01_var.y, switch_thetaFCVR01.u1) annotation (Line(points={{59.5,103},{63,103},{63,98},{66,98}}, color={0,0,127}));
  connect(thetaFCVR01.y, switch_thetaFCVR01.u3) annotation (Line(points={{59.5,84},{63,84},{63,90},{66,90}}, color={0,0,127}));
  connect(bool_ToutRR01.y, switch_ToutRR01.u2) annotation (Line(points={{59.5,61},{66,61}}, color={255,0,255}));
  connect(ToutRR01_var.y, switch_ToutRR01.u1) annotation (Line(points={{59.5,70},{63,70},{63,65},{66,65}}, color={0,0,127}));
  connect(ToutRR01.y, switch_ToutRR01.u3) annotation (Line(points={{59.5,51},{63,51},{63,57},{66,57}}, color={0,0,127}));
  connect(switch_thetaTCV701.y, controlSignalBus.thetaTCV701)
    annotation (Line(points={{3.5,155},{6,155},{6,195},{140,195},{140,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaTCV711.y, controlSignalBus.thetaTCV711)
    annotation (Line(points={{3.5,121},{7,121},{7,194},{139,194},{139,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaTCV721.y, controlSignalBus.thetaTCV721)
    annotation (Line(points={{3.5,88},{8,88},{8,193},{138,193},{138,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaTCV731.y, controlSignalBus.thetaTCV731)
    annotation (Line(points={{3.5,56},{9,56},{9,192},{137,192},{137,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaFCVR01.y, controlSignalBus.thetaFCVR01)
    annotation (Line(points={{77.5,94},{110,94},{110,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_ToutRR01.y, controlSignalBus.ToutRR01) annotation (Line(points={{77.5,61},{109,61},{109,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaFCV701.y, controlSignalBus.thetaFCV701)
    annotation (Line(points={{-43.5,155},{-42,155},{-42,200},{144,200},{144,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_dthetaFCV711.y, controlSignalBus.thetaFCV711) annotation (
    Line(points={{-43.5,121},{-41,121},{-41,199},{143,199},{143,0},{160,0}},                                    color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV721.y, controlSignalBus.thetaFCV721) annotation (
    Line(points={{-43.5,88},{-40,88},{-40,198},{142,198},{142,0},{160,0}},                                  color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV731.y, controlSignalBus.thetaFCV731) annotation (
    Line(points={{-43.5,56},{-39,56},{-39,197},{141,197},{141,0},{160,0}},                                  color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_thetaFCVC01.y, controlSignalBus.thetaFCVC01)
    annotation (Line(points={{-113.5,61},{-113.5,60},{-106,60},{-106,208},{147,208},{147,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaFCVC02.y, controlSignalBus.thetaFCVC02)
    annotation (Line(points={{-113.5,27},{-113.5,26},{-105,26},{-105,207},{146,207},{146,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_omegaP901.y, controlSignalBus.omegaP901)
    annotation (Line(points={{-114.5,153},{-108,153},{-108,210},{149,210},{149,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_dthetaFCV901.y, controlSignalBus.thetaFCV901) annotation (
    Line(points={{-115.5,120},{-107,120},{-107,209},{148,209},{148,0},{160,0}},                                      color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_omegaP101.y, controlSignalBus.omegaP101)
    annotation (Line(points={{-15.5,-11},{-8,-11},{-8,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaFCV101.y, controlSignalBus.thetaFCV101)
    annotation (Line(points={{-16.5,-44},{-2,-44},{-2,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_ToutGB101.y, controlSignalBus.ToutGB101) annotation (Line(points={{-16.5,-77},{2,-77},{2,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PtEX7X1SP.y[1], controlSignalBus.PtEX701) annotation (Line(points={{61,170},{136,170},{136,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PtEX7X1SP.y[2], controlSignalBus.PtEX711) annotation (Line(points={{61,170},{135,170},{135,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PtEX7X1SP.y[3], controlSignalBus.PtEX721) annotation (Line(points={{61,170},{134,170},{134,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PtEX7X1SP.y[4], controlSignalBus.PtEX731) annotation (Line(points={{61,170},{133,170},{133,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT7X1SP.y[1], controlSignalBus.ToutEX701) annotation (Line(points={{61,140},{132,140},{132,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT7X1SP.y[2], controlSignalBus.ToutEX711) annotation (Line(points={{61,140},{131,140},{131,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT7X1SP.y[3], controlSignalBus.ToutEX721) annotation (Line(points={{61,140},{130,140},{130,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(TT7X1SP.y[4], controlSignalBus.ToutEX731) annotation (Line(points={{61,140},{129,140},{129,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GB101status.y, controlSignalBus.statusGB101) annotation (Line(points={{-26,-106},{6,-106},{6,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(RR01status.y, controlSignalBus.statusRR01) annotation (Line(points={{70,32},{105,32},{105,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(omegaPR01_var.y, controlSignalBus.omegaPR01) annotation (Line(points={{71.05,17},{102,17},{102,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(                                               graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "Open
Loop
Act")}),
    Diagram(coordinateSystem(extent={{-160,-220},{160,220}}, grid={1,1}),         graphics={  Rectangle(extent={{-150,190},{-100,100}},    fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{-150,
              190},{-100,170}},                                                                                                                                                                                                        textString = "S900", textColor = {0, 0, 0}), Rectangle(extent={{-49,29},
              {-10,-120}},                                                                                                                                                                                                        fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{-49,29},
              {-9,9}},                                                                                                                                                                                                        textColor = {0, 0, 0}, textString = "S100"), Rectangle(extent={{-80,190},
              {20,36}},                                                                                                                                                                                                        fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None),                                                                                    Rectangle(extent={{-150,96},
              {-100,6}},                                                                                                                                                                                                        fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{-150,96},
              {-100,76}},                                                                                                                                                                                                        textColor = {0, 0, 0}, textString = "RACK"), Rectangle(extent={{40,127},
              {90,7}},                                                                                                                                                                                                        fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{40,127},
              {90,107}},                                                                                                                                                                                                        textColor = {0, 0, 0}, textString = "RR00"),
                                                                                                                                                                                                        Text(extent={{-80,190},
              {20,170}},                                                                                                                                                                                                        textColor = {0, 0, 0}, textString = "S700")}));
end OpenLoopActuatorBase_III;
