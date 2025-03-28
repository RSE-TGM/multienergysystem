within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_ThreeGen_CaseA "Open-Loop Actuator Considering three heat generators in the test facility"
  extends OLA_TwoGen_CaseA;
  Boolean booldomegaP501;
  Boolean booldToutCHP501;
  // S500
  DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
  Real domega_P501_var(min = -1, max = 0);
  DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
  Real dTout_CHP501_var(min = -1, max = 0);
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
equation
  domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
  dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;
  omega_P501SP = 2*pi*50;
  Tout_CHP501SP = 80 + 273.15;
  if useRealExpression then
    booldomegaP501 = true;
    booldToutCHP501 = true;
  else
    booldomegaP501 = false;
    booldToutCHP501 = false;
  end if;
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
  connect(switch_domegaP501.y, controlSignalBus.domegaP501) annotation (
    Line(points = {{-21.5, -115}, {-20, -115}, {-20, -103}, {-19, -103}, {-19, -100}, {23, -100}, {23, -53}, {133, -53}, {133, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501) annotation (
    Line(points = {{-22.5, -150}, {-21, -150}, {-21, -140}, {24, -140}, {24, -54}, {134, -54}, {134, 0}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  annotation (
    Diagram(graphics={  Rectangle(extent = {{-60, -80}, {10, -170}}, fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent = {{-55, -79}, {5, -99}}, textColor = {0, 0, 0}, textString = "S500")}));
end OLA_ThreeGen_CaseA;
