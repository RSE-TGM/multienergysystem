within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_TwoGen_CaseA_III "Considering two generators Gas Boiler and Electric Boiler"
  extends OLA_OneGen_CaseA_III;
  Boolean booldthetaFCV401;
  Boolean booldomegaP401;
  Boolean booldToutEB401;
  // S400
  DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
  Real theta_FCV401_var(min = 0, max = 1);
  DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
  Real omega_P401_var(min = 0, max = 2*pi*50);
  DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
  Real Tout_EB401_var(min = 0+273.15, max = 100+273.15);
  Modelica.Blocks.Sources.TimeTable dToutEB401(table = Tout_EB401) annotation (
    Placement(transformation(extent={{-82,-131},{-72,-121}})));
  Modelica.Blocks.Sources.TimeTable domegaP401(table = omega_P401) annotation (
    Placement(transformation(extent={{-82,-65},{-72,-55}})));
  Modelica.Blocks.Sources.TimeTable dthetaFCV401(table = theta_FCV401) annotation (
    Placement(transformation(extent={{-82,-98},{-72,-88}})));
  Modelica.Blocks.Sources.RealExpression domegaP401_var(y = omega_P401_var) annotation (
    Placement(transformation(extent={{-82,-45},{-72,-35}})));
  Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (
    Placement(transformation(extent={{-63,-55},{-53,-45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y = booldomegaP401) annotation (
    Placement(transformation(extent={{-82,-55},{-72,-45}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y = booldthetaFCV401) annotation (
    Placement(transformation(extent={{-82,-88},{-72,-78}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y = theta_FCV401_var) annotation (
    Placement(transformation(extent={{-82,-79},{-72,-69}})));
  Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (
    Placement(transformation(extent={{-64,-88},{-54,-78}})));
  Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y = booldToutEB401) annotation (
    Placement(transformation(extent={{-82,-121},{-72,-111}})));
  Modelica.Blocks.Sources.RealExpression dToutEB401_var(y = Tout_EB401_var) annotation (
    Placement(transformation(extent={{-82,-112},{-72,-102}})));
  Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (
    Placement(transformation(extent={{-64,-121},{-54,-111}})));
  Modelica.Blocks.Sources.BooleanExpression EB401status(y=true)   annotation (
    Placement(transformation(extent={{-85,-155.5},{-65,-135.5}})));
equation
  theta_FCV401_var = theta_FCV401SP;
  omega_P401_var = omega_P401SP;
  Tout_EB401_var = Tout_EB401SP;
  theta_FCV401SP = 1;
  omega_P401SP = 2*pi*40;
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
    Line(points={{-71.5,-40},{-68,-40},{-68,-46},{-64,-46}},              color = {0, 0, 127}));
  connect(bool_domegaP401.y, switch_domegaP401.u2) annotation (
    Line(points={{-71.5,-50},{-64,-50}},          color = {255, 0, 255}));
  connect(domegaP401.y, switch_domegaP401.u3) annotation (
    Line(points={{-71.5,-60},{-68,-60},{-68,-54},{-64,-54}},                  color = {0, 0, 127}));
  connect(bool_dthetaFCV401.y, switch_dthetaFCV401.u2) annotation (
    Line(points={{-71.5,-83},{-65,-83}},          color = {255, 0, 255}));
  connect(dthetaFCV401_var.y, switch_dthetaFCV401.u1) annotation (
    Line(points={{-71.5,-74},{-68,-74},{-68,-79},{-65,-79}},                  color = {0, 0, 127}));
  connect(dthetaFCV401.y, switch_dthetaFCV401.u3) annotation (
    Line(points={{-71.5,-93},{-68,-93},{-68,-87},{-65,-87}},                  color = {0, 0, 127}));
  connect(bool_dToutEB401.y, switch_dToutEB401.u2) annotation (
    Line(points={{-71.5,-116},{-65,-116}},        color = {255, 0, 255}));
  connect(dToutEB401_var.y, switch_dToutEB401.u1) annotation (
    Line(points={{-71.5,-107},{-68,-107},{-68,-112},{-65,-112}},              color = {0, 0, 127}));
  connect(dToutEB401.y, switch_dToutEB401.u3) annotation (
    Line(points={{-71.5,-126},{-68,-126},{-68,-120},{-65,-120}},              color = {0, 0, 127}));
  connect(switch_domegaP401.y, controlSignalBus.omegaP401)
    annotation (Line(points={{-52.5,-50},{-42.5,-50},{-42.5,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_dthetaFCV401.y, controlSignalBus.thetaFCV401)
    annotation (Line(points={{-53.5,-83},{-40,-83},{-40,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch_dToutEB401.y, controlSignalBus.ToutEB401)
    annotation (Line(points={{-53.5,-116},{-38.5,-116},{-38.5,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EB401status.y, controlSignalBus.statusEB401)
    annotation (Line(points={{-64,-145.5},{-38,-145.5},{-38,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Diagram(coordinateSystem(grid={0.5,0.5}),
            graphics={  Rectangle(extent={{-90,-10},{-45,-160}},       fillColor = {255, 200, 160}, fillPattern = FillPattern.Solid, pattern = LinePattern.None), Text(extent={{-90,-10},{-45,-30}},       textColor = {0, 0, 0}, textString = "S400")}));
end OLA_TwoGen_CaseA_III;
