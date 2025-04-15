within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedI
  extends CaseCentralisedBase;
  Modelica.Blocks.Interfaces.RealInput FCV101theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={70,100}), iconTransformation(extent={{110,40},{90,60}})));
  Modelica.Blocks.Sources.BooleanExpression GB101_status(y=true)
                                                                annotation (Placement(transformation(extent={{100,-5},{80,15}})));
  Modelica.Blocks.Interfaces.RealInput P101omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={77.5,100}), iconTransformation(extent={{110,60},{90,80}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={85.5,100}), iconTransformation(extent={{110,80},{90,100}})));
equation
  connect(GB101_status.y, controlSignalBus.statusGB101) annotation (Line(points={{79,5},{68,5},{68,46},{0,46}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCV101theta, controlSignalBus.thetaFCV101) annotation (Line(points={{70,100},{70,80},{0,80},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P101omega, controlSignalBus.omegaP101) annotation (Line(points={{77.5,100},{77.5,79},{0,79},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(GB101Tout_SP, controlSignalBus.ToutGB101) annotation (Line(points={{85.5,100},{85.5,78},{0,78},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedI;
