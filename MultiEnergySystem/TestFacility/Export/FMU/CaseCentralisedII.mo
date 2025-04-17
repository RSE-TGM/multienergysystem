within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedII
  extends CaseCentralisedI;
  Modelica.Blocks.Sources.BooleanExpression EB101_status(y=true) annotation (Placement(transformation(extent={{100,-19},{80,1}})));
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,85}), iconTransformation(extent={{-110,-35},{-100,-25}})));
  Modelica.Blocks.Interfaces.RealInput P401omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,77.5}), iconTransformation(extent={{-110,-45},{-100,-35}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,70}), iconTransformation(extent={{-110,-55},{-100,-45}})));
  Modelica.Blocks.Interfaces.RealOutput TT402 annotation (Placement(transformation(extent={{-25,-95},{-15,-85}}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={105,60})));
  Modelica.Blocks.Interfaces.RealOutput FT401 annotation (Placement(transformation(extent={{-25,-102.5},{-15,-92.5}}), iconTransformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={105,50})));
  Modelica.Blocks.Sources.RealExpression TT402_exp(y=facility.heatGeneration.S400.TT402.T_meas) annotation (Placement(transformation(extent={{-40,-95},{-30,-85}})));
  Modelica.Blocks.Sources.RealExpression m_flow_S400_exp(y=facility.heatGeneration.S400.FT.m_flow) annotation (Placement(transformation(extent={{-40,-102.5},{-30,-92.5}})));
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
  connect(TT402_exp.y, TT402) annotation (Line(points={{-29.5,-90},{-20,-90}}, color={0,0,127}));
  connect(m_flow_S400_exp.y, FT401) annotation (Line(points={{-29.5,-97.5},{-20,-97.5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedII;
