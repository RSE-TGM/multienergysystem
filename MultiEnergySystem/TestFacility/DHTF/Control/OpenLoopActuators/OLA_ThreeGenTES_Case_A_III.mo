within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_ThreeGenTES_Case_A_III
  extends OLA_TwoGen_CaseA_III;
  Modelica.Blocks.Sources.RealExpression domegaP501_var(y = 2*pi*35) annotation (
    Placement(transformation(extent = {{55, -95}, {65, -85}})));
  Modelica.Blocks.Sources.RealExpression domegaP201_var(y = 2*pi*35) annotation (
    Placement(transformation(extent = {{55, -105}, {65, -95}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV201_var(y = 1) annotation (
    Placement(transformation(extent = {{55, -115}, {65, -105}})));
  Modelica.Blocks.Sources.BooleanExpression GB101status(y = true) annotation (
    Placement(transformation(extent = {{52, -140}, {72, -120}})));
  Modelica.Blocks.Sources.BooleanExpression EB401status(y = true) annotation (
    Placement(transformation(extent = {{52, -154}, {72, -134}})));
  Modelica.Blocks.Sources.BooleanExpression CHP501status(y = true) annotation (
    Placement(transformation(extent = {{52, -170}, {72, -150}})));
  Modelica.Blocks.Sources.BooleanExpression S200status(y = true) annotation (
    Placement(transformation(extent = {{52, -186}, {72, -166}})));
  Modelica.Blocks.Sources.BooleanExpression RR01status(y = true) annotation (
    Placement(transformation(extent = {{52, -200}, {72, -180}})));
  Modelica.Blocks.Sources.RealExpression dToutCHP_var(y = 80 + 273.15) annotation (
    Placement(transformation(extent = {{51, -70}, {61, -60}})));
  Modelica.Blocks.Sources.RealExpression dPeCHP_var(y = 40e3) annotation (
    Placement(transformation(extent = {{51, -80}, {61, -70}})));
  Modelica.Blocks.Sources.RealExpression domegaPR01_var(y = 2*3.14159*45) annotation (
    Placement(transformation(extent = {{69, -64}, {79, -54}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV201_var1(y = 1) annotation (
    Placement(transformation(extent = {{89, -87}, {99, -77}})));
equation
  connect(domegaP501_var.y, controlSignalBus.omegaP501) annotation (
    Line(points = {{65.5, -90}, {160, -90}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(domegaP201_var.y, controlSignalBus.omegaP201) annotation (
    Line(points = {{65.5, -100}, {160, -100}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dthetaFCV201_var.y, controlSignalBus.thetaFCV201) annotation (
    Line(points = {{65.5, -110}, {160, -110}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(GB101status.y, controlSignalBus.statusGB101) annotation (
    Line(points = {{73, -130}, {160, -130}, {160, 0}}, color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(EB401status.y, controlSignalBus.statusEB401) annotation (
    Line(points = {{73, -144}, {160, -144}, {160, 0}}, color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(CHP501status.y, controlSignalBus.statusCHP501) annotation (
    Line(points = {{73, -160}, {160, -160}, {160, 0}}, color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(S200status.y, controlSignalBus.statusS200) annotation (
    Line(points = {{73, -176}, {160, -176}, {160, 0}}, color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(RR01status.y, controlSignalBus.statusRR01) annotation (
    Line(points = {{73, -190}, {116, -190}, {116, -188}, {160, -188}, {160, 0}}, color = {255, 0, 255}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dToutCHP_var.y, controlSignalBus.ToutCHP501) annotation (
    Line(points = {{61.5, -65}, {160, -65}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(dPeCHP_var.y, controlSignalBus.PtCHP501) annotation (
    Line(points = {{61.5, -75}, {160, -75}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
  connect(domegaPR01_var.y, controlSignalBus.omegaPR01) annotation (
    Line(points = {{79.5, -59}, {160, -59}, {160, 0}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
end OLA_ThreeGenTES_Case_A_III;
