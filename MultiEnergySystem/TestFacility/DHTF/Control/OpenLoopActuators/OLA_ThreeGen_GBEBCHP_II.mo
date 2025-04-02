within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_ThreeGen_GBEBCHP_II
  extends OLA_TwoGen_CaseA_III;
  Modelica.Blocks.Sources.RealExpression domegaP501_var(y=2*pi*40)   annotation (
    Placement(transformation(extent = {{55, -95}, {65, -85}})));
  Modelica.Blocks.Sources.BooleanExpression GB101status(y = true) annotation (
    Placement(transformation(extent = {{52, -140}, {72, -120}})));
  Modelica.Blocks.Sources.BooleanExpression EB401status(y = true) annotation (
    Placement(transformation(extent = {{52, -154}, {72, -134}})));
  Modelica.Blocks.Sources.BooleanExpression CHP501status(y = true) annotation (
    Placement(transformation(extent = {{52, -170}, {72, -150}})));
  Modelica.Blocks.Sources.BooleanExpression RR01status(y = true) annotation (
    Placement(transformation(extent = {{52, -200}, {72, -180}})));
  Modelica.Blocks.Sources.RealExpression dToutCHP_var(y = 80 + 273.15) annotation (
    Placement(transformation(extent = {{51, -70}, {61, -60}})));
  Modelica.Blocks.Sources.RealExpression dPeCHP_var(y = 40e3) annotation (
    Placement(transformation(extent = {{51, -80}, {61, -70}})));
  Modelica.Blocks.Sources.RealExpression domegaPR01_var(y = 2*3.14159*45) annotation (
    Placement(transformation(extent = {{69, -64}, {79, -54}})));
  Modelica.Blocks.Sources.RealExpression mflowCHP_var(y=1.2) annotation (Placement(transformation(extent={{55,-105},{65,-95}})));
  Modelica.Blocks.Sources.RealExpression PtEX7X1SP(y=35E3) annotation (Placement(transformation(extent={{73,-115},{83,-105}})));
  Modelica.Blocks.Sources.RealExpression TTEX7X1SP(y=70 + 273.15) annotation (Placement(transformation(extent={{73,-123},{83,-113}})));
equation
  connect(domegaP501_var.y, controlSignalBus.omegaP501) annotation (
    Line(points = {{65.5, -90}, {160, -90}, {160, 0}}, color = {0, 0, 127}),
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
  connect(mflowCHP_var.y, controlSignalBus.mflowCHP) annotation (Line(points={{65.5,-100},{160,-100},{160,0}}, color={0,0,127}));
  connect(PtEX7X1SP.y, controlSignalBus.PtEX701) annotation (Line(points={{83.5,-110},{160,-110},{160,0}}, color={0,0,127}));
  connect(PtEX7X1SP.y, controlSignalBus.PtEX711) annotation (Line(points={{83.5,-110},{108,-110},{108,-114},{160,-114},{160,0}}, color={0,0,127}));
  connect(PtEX7X1SP.y, controlSignalBus.PtEX721) annotation (Line(points={{83.5,-110},{90,-110},{90,-108},{142,-108},{142,-28},{160,-28},{160,0}}, color={0,0,127}));
  connect(PtEX7X1SP.y, controlSignalBus.PtEX731) annotation (Line(points={{83.5,-110},{112,-110},{112,-104},{148,-104},{148,-28},{160,-28},{160,0}}, color={0,0,127}));
  connect(TTEX7X1SP.y, controlSignalBus.ToutEX701) annotation (Line(points={{83.5,-118},{114,-118},{114,-120},{160,-120},{160,0}}, color={0,0,127}));
  connect(TTEX7X1SP.y, controlSignalBus.ToutEX711) annotation (Line(points={{83.5,-118},{114,-118},{114,-122},{166,-122},{166,0},{160,0}}, color={0,0,127}));
  connect(TTEX7X1SP.y, controlSignalBus.ToutEX721) annotation (Line(points={{83.5,-118},{160,-118},{160,0}}, color={0,0,127}));
  connect(TTEX7X1SP.y, controlSignalBus.ToutEX731) annotation (Line(points={{83.5,-118},{120,-118},{120,-124},{160,-124},{160,0}}, color={0,0,127}));
end OLA_ThreeGen_GBEBCHP_II;
