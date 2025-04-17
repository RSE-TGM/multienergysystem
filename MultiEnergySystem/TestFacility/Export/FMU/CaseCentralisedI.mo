within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedI
  extends CaseCentralisedBase;
  Modelica.Blocks.Interfaces.RealInput FCV101theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={70,100}), iconTransformation(extent={{-110,-20},{-100,-10}})));
  Modelica.Blocks.Sources.BooleanExpression GB101_status(y=true)
                                                                annotation (Placement(transformation(extent={{100,-5},{80,15}})));
  Modelica.Blocks.Interfaces.RealInput P101omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={77.5,100}), iconTransformation(extent={{-110,-10},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={85.5,100}), iconTransformation(extent={{-110,0},{-100,10}})));
  Modelica.Blocks.Interfaces.RealOutput TT102 annotation (Placement(transformation(extent={{-25,-80},{-15,-70}}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={105,85})));
  Modelica.Blocks.Sources.RealExpression TT102_exp(y=facility.heatGeneration.S100.TT102.T_meas) annotation (Placement(transformation(extent={{-40,-80},{-30,-70}})));
  Modelica.Blocks.Sources.RealExpression m_flow_S100_exp(y=facility.heatGeneration.S100.FT.m_flow) annotation (Placement(transformation(extent={{-40,-87.5},{-30,-77.5}})));
  Modelica.Blocks.Interfaces.RealOutput FT101 annotation (Placement(transformation(extent={{-25,-87.5},{-15,-77.5}}), iconTransformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={105,75})));
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
  connect(TT102_exp.y, TT102) annotation (Line(points={{-29.5,-75},{-20,-75}}, color={0,0,127}));
  connect(m_flow_S100_exp.y, FT101) annotation (Line(points={{-29.5,-82.5},{-20,-82.5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedI;
