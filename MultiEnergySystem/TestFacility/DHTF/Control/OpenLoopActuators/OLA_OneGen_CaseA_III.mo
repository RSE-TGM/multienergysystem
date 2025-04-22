within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_OneGen_CaseA_III "Step Actuator for test facility plant considering only one generator which in this case is the gas boiler"
  extends OpenLoopActuatorBase_III;
  // S100
  DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
  Real theta_FCV101_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
  Real omega_P101_var(min = 0, max = 2*pi*50);
  DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
  Real Tout_GB101_var(min = 0+273.15, max = 100+273.15);
  Modelica.Blocks.Sources.TimeTable ToutGB101(table=Tout_GB101) annotation (Placement(transformation(extent={{-140,-132},{-130,-122}})));
  Modelica.Blocks.Sources.TimeTable omegaP101(table=omega_P101) annotation (Placement(transformation(extent={{-140,-66},{-130,-56}})));
  Modelica.Blocks.Sources.TimeTable thetaFCV101(table=theta_FCV101) annotation (Placement(transformation(extent={{-140,-99},{-130,-89}})));
  Modelica.Blocks.Sources.RealExpression omegaP101_var(y=omega_P101_var) annotation (Placement(transformation(extent={{-140,-46},{-130,-36}})));
  Modelica.Blocks.Logical.Switch switch_omegaP101 annotation (Placement(transformation(extent={{-121,-56},{-111,-46}})));
  Modelica.Blocks.Sources.BooleanExpression bool_omegaP101(y=booldomegaP101) annotation (Placement(transformation(extent={{-140,-56},{-130,-46}})));
  Modelica.Blocks.Sources.BooleanExpression bool_thetaFCV101(y=booldthetaFCV101) annotation (Placement(transformation(extent={{-140,-89},{-130,-79}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV101_var(y=theta_FCV101_var) annotation (Placement(transformation(extent={{-140,-80},{-130,-70}})));
  Modelica.Blocks.Logical.Switch switch_thetaFCV101 annotation (Placement(transformation(extent={{-122,-89},{-112,-79}})));
  Modelica.Blocks.Sources.BooleanExpression bool_ToutGB101(y=booldToutGB101) annotation (Placement(transformation(extent={{-140,-122},{-130,-112}})));
  Modelica.Blocks.Sources.RealExpression ToutGB101_var(y=Tout_GB101_var) annotation (Placement(transformation(extent={{-140,-113},{-130,-103}})));
  Modelica.Blocks.Logical.Switch switch_ToutGB101 annotation (Placement(transformation(extent={{-122,-122},{-112,-112}})));
  Modelica.Blocks.Sources.BooleanExpression GB101status(y=true)   annotation (
    Placement(transformation(extent={{-142,-156},{-122,-136}})));
equation
  // S900
  theta_FCV901_var = theta_FCV901SP;
  omega_P901_var = omega_P901SP;
  // S100
  theta_FCV101_var = theta_FCV101SP;
  omega_P101_var = omega_P101SP;
  Tout_GB101_var = Tout_GB101SP;
  // S700
  theta_FCV701_var = theta_FCV701SP;
  theta_FCV711_var = theta_FCV711SP;
  theta_FCV721_var = theta_FCV721SP;
  theta_FCV731_var = theta_FCV731SP;
  // Rack
  theta_FCVC01_var = theta_FCVC01SP;
  theta_FCVC02_var = theta_FCVC02SP;
  // RR00
  theta_TCV701_var = theta_TCV701SP;
  theta_TCV711_var = theta_TCV711SP;
  theta_TCV721_var = theta_TCV721SP;
  theta_TCV731_var = theta_TCV731SP;
  theta_FCVR01_var = theta_FCVR01SP;
  Tout_RR01_var = Tout_RR01SP;
  theta_FCV101SP = 1;
  omega_P101SP = 2*pi*40;
  Tout_GB101SP = 80 + 273.15;
  theta_FCV701SP = 1;
  theta_FCV711SP = 1;
  theta_FCV721SP = 1;
  theta_FCV731SP = 1;
  theta_FCV901SP = 1;
  omega_P901SP = 2*pi*40;
  theta_FCVC01SP = 0;
  theta_FCVC02SP = 0.3;
  theta_TCV701SP = 1;
  theta_TCV711SP = 1;
  theta_TCV721SP = 1;
  theta_TCV731SP = 1;
  theta_FCVR01SP = 1;
  Tout_RR01SP = 20 + 273.15;
  if useRealExpression then
    // S100
    booldthetaFCV101 = true;
    booldomegaP101 = true;
    booldToutGB101 = true;
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
  connect(omegaP101_var.y,switch_omegaP101. u1) annotation (Line(points={{-129.5,-41},{-126,-41},{-126,-47},{-122,-47}},
                                                                                                                 color={0,0,127}));
  connect(bool_omegaP101.y,switch_omegaP101. u2) annotation (Line(points={{-129.5,-51},{-122,-51}},
                                                                                                  color={255,0,255}));
  connect(omegaP101.y,switch_omegaP101. u3) annotation (Line(points={{-129.5,-61},{-126,-61},{-126,-55},{-122,-55}},
                                                                                                                 color={0,0,127}));
  connect(bool_thetaFCV101.y,switch_thetaFCV101. u2) annotation (Line(points={{-129.5,-84},{-123,-84}},
                                                                                                      color={255,0,255}));
  connect(thetaFCV101_var.y,switch_thetaFCV101. u1) annotation (Line(points={{-129.5,-75},{-126,-75},{-126,-80},{-123,-80}},
                                                                                                                         color={0,0,127}));
  connect(thetaFCV101.y,switch_thetaFCV101. u3) annotation (Line(points={{-129.5,-94},{-126,-94},{-126,-88},{-123,-88}},
                                                                                                                     color={0,0,127}));
  connect(bool_ToutGB101.y,switch_ToutGB101. u2) annotation (Line(points={{-129.5,-117},{-123,-117}},
                                                                                                  color={255,0,255}));
  connect(ToutGB101_var.y,switch_ToutGB101. u1) annotation (Line(points={{-129.5,-108},{-126,-108},{-126,-113},{-123,-113}},
                                                                                                                     color={0,0,127}));
  connect(ToutGB101.y,switch_ToutGB101. u3) annotation (Line(points={{-129.5,-127},{-126,-127},{-126,-121},{-123,-121}},
                                                                                                                 color={0,0,127}));
  connect(switch_omegaP101.y, controlSignalBus.omegaP101) annotation (Line(points={{-110.5,-51},{-104.5,-51},{-104.5,-51.5},{-102.5,-51.5},{-102.5,0.5},{36.5,0.5},{36.5,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_thetaFCV101.y, controlSignalBus.thetaFCV101)
    annotation (Line(points={{-111.5,-84},{-101.5,-84},{-101.5,-0.5},{-62,-0.5},{-62,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_ToutGB101.y, controlSignalBus.ToutGB101) annotation (Line(points={{-111.5,-117},{-105,-117},{-105,-117.5},{-100.5,-117.5},{-100.5,-1.5},{160,-1.5},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GB101status.y, controlSignalBus.statusGB101)
    annotation (Line(points={{-121,-146},{-110,-146},{-110,-145.5},{-99,-145.5},{-99,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Diagram(coordinateSystem(extent={{-160,-220},{160,220}}, grid={0.5,0.5}), graphics={                                                                                                                                                                                  Rectangle(extent={{-150,
              -10},{-105,-160}},                                                                                                                                                                                                  fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{-147.5,
              -10},{-107.5,-30}},                                                                                                                                                                                             textColor = {0, 0, 0}, textString = "S100")}));
end OLA_OneGen_CaseA_III;
