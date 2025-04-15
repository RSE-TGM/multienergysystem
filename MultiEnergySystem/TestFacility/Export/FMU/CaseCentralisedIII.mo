within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIII
  extends CaseCentralisedII;
  Modelica.Blocks.Sources.BooleanExpression CHP501_status(y=true) annotation (Placement(transformation(extent={{100,-35},{80,-15}})));
  Modelica.Blocks.Interfaces.RealInput P501omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,45}), iconTransformation(extent={{110,-100},{90,-80}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,60}), iconTransformation(extent={{110,-60},{90,-40}})));
  Modelica.Blocks.Interfaces.RealInput CHPmflow annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,37.5}), iconTransformation(extent={{110,-60},{90,-80}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Pel_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,52}), iconTransformation(extent={{110,-40},{90,-20}})));
equation
  connect(CHP501_status.y, controlSignalBus.statusCHP501)
    annotation (Line(points={{79,-25},{60,-25},{60,46},{0,46}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(CHP501Tout_SP, controlSignalBus.ToutCHP501)
    annotation (Line(points={{100,60},{92.5,60},{92.5,72},{0,72},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(CHP501Pel_SP, controlSignalBus.PtCHP501)
    annotation (Line(points={{100,52},{91,52},{91,70.5},{0,70.5},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(P501omega, controlSignalBus.omegaP501)
    annotation (Line(points={{100,45},{89.5,45},{89.5,68.5},{0,68.5},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(CHPmflow, controlSignalBus.mflowCHP)
    annotation (Line(points={{100,37.5},{87.5,37.5},{87.5,67},{0,67},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIII;
