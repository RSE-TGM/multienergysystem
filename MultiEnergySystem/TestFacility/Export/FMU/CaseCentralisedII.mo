within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedII
  extends CaseCentralisedI;
  Modelica.Blocks.Sources.BooleanExpression EB101_status(y=true) annotation (Placement(transformation(extent={{100,-19},{80,1}})));
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,85}), iconTransformation(extent={{110,20},{90,40}})));
  Modelica.Blocks.Interfaces.RealInput P401omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,77.5}), iconTransformation(extent={{110,0},{90,20}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,70}), iconTransformation(extent={{110,-20},{90,0}})));
equation
  connect(EB101_status.y, controlSignalBus.statusEB401) annotation (Line(points={{79,-9},{64,-9},{64,46},{0,46}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EB401Tout_SP, controlSignalBus.ToutEB401)
    annotation (Line(points={{100,85},{86.5,85},{86.5,77},{0,77},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P401omega, controlSignalBus.omegaP401)
    annotation (Line(points={{100,77.5},{93.5,77.5},{93.5,76},{0,76},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCV401theta, controlSignalBus.thetaFCV401)
    annotation (Line(points={{100,70},{93.5,70},{93.5,75},{0,75},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedII;
