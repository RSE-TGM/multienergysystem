within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_TwoGen_CaseA "Considering two generators Gas Boiler and Electric Boiler"
  extends OLA_OneGen_CaseA;
  Boolean booldthetaFCV401;
  Boolean booldomegaP401;
  Boolean booldToutEB401;
  // S400
  DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
  Real dtheta_FCV401_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
  Real domega_P401_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
  Real dTout_EB401_var(min = -1, max = 0);
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
equation
  dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
  domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
  dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;
  theta_FCV401SP = 1;
  omega_P401SP = 2*pi*50;
  Tout_EB401SP = 80 + 273.15;
  if useRealExpression then
    // S400
    booldthetaFCV401 = true;
    booldomegaP401 = true;
    booldToutEB401 = true;
  else
    booldthetaFCV401 = false;
    booldomegaP401 = false;
    booldToutEB401 = false;
    //
  end if;
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
  connect(switch_domegaP401.y, controlSignalBus.domegaP401) annotation (
    Line(points = {{-111.5, -100}, {-110, -100}, {-110, -90}, {-70, -90}, {-70, -74}, {20, -74}, {20, -50}, {130, -50}, {130, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (
    Line(points = {{-112.5, -133}, {-111, -133}, {-111, -132}, {-110, -132}, {-110, -120}, {-69, -120}, {-69, -75}, {21, -75}, {21, -51}, {131, -51}, {131, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (
    Line(points = {{-112.5, -166}, {-111, -166}, {-111, -150}, {-68, -150}, {-68, -76}, {22, -76}, {22, -52}, {132, -52}, {132, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Diagram(graphics={  Rectangle(extent = {{-150, -60}, {-80, -190}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-145, -60}, {-85, -80}}, textColor = {0, 0, 0}, textString = "S400")}));
end OLA_TwoGen_CaseA;
