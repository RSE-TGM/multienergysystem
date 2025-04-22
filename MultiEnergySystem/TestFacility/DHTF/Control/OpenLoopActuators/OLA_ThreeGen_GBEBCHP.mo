within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_ThreeGen_GBEBCHP
  extends OLA_TwoGen_CaseA_III;
//   Boolean booldomegaP501;
//   Boolean booldToutCHP501;
//   // S500
//   DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
//   Real omega_P501_var(min = 0, max = 2*pi*50);
//   DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
//   Real Tout_CHP501_var(min = 0+273.15, max = 100+273.15);


  Modelica.Blocks.Sources.RealExpression domegaP501_var(y=2*pi*40)   annotation (
    Placement(transformation(extent = {{55, -95}, {65, -85}})));
  Modelica.Blocks.Sources.BooleanExpression CHP501status(y = true) annotation (
    Placement(transformation(extent={{52,-126},{72,-106}})));
  Modelica.Blocks.Sources.RealExpression dToutCHP_var(y = 80 + 273.15) annotation (
    Placement(transformation(extent = {{51, -70}, {61, -60}})));
  Modelica.Blocks.Sources.RealExpression dPeCHP_var(y = 40e3) annotation (
    Placement(transformation(extent = {{51, -80}, {61, -70}})));
  Modelica.Blocks.Sources.RealExpression mflowCHP_var(y=1.2) annotation (Placement(transformation(extent={{55,-105},{65,-95}})));
equation
  connect(domegaP501_var.y, controlSignalBus.omegaP501) annotation (
    Line(points = {{65.5, -90}, {160, -90}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(CHP501status.y, controlSignalBus.statusCHP501) annotation (
    Line(points={{73,-116},{158,-116},{158,0},{160,0}},color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dToutCHP_var.y, controlSignalBus.ToutCHP501) annotation (
    Line(points = {{61.5, -65}, {160, -65}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dPeCHP_var.y, controlSignalBus.PtCHP501) annotation (
    Line(points = {{61.5, -75}, {160, -75}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(mflowCHP_var.y, controlSignalBus.mflowCHP) annotation (Line(points={{65.5,-100},{160,-100},{160,0}}, color={0,0,127}));
end OLA_ThreeGen_GBEBCHP;
