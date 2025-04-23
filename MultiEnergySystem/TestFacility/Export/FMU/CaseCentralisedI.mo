within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedI
  extends CaseCentralisedBase(redeclare DHTF.Control.OpenLoopActuators.FMUActuator_I actuator);
  Modelica.Blocks.Interfaces.RealInput FCV101theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,22.5}),
                          iconTransformation(extent={{-110,-20},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealInput P101input annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,29.5}),iconTransformation(extent={{-110,-10},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,36.5}),iconTransformation(extent={{-110,0},{-100,10}})));
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
  Modelica.Blocks.Interfaces.BooleanInput GB101status annotation (Placement(transformation(extent={{-5,-5},{5,5}}, origin={-100,15}), iconTransformation(extent={{-5,-5},{5,5}}, origin={-105,-25})));
equation
  connect(TT102_exp.y, TT102) annotation (Line(points={{-29.5,-75},{-20,-75}}, color={0,0,127}));
  connect(m_flow_S100_exp.y, FT101) annotation (Line(points={{-29.5,-82.5},{-20,-82.5}}, color={0,0,127}));
  connect(GB101Tout_SP, actuator.GB101Tout_SP) annotation (Line(points={{-100,36.5},{-65,36.5},{-65,63.2625},{-21.0125,63.2625}}, color={0,0,127}));
  connect(P101input,actuator.P101input)  annotation (Line(points={{-100,29.5},{-62.5,29.5},{-62.5,61.2375},{-21.0125,61.2375}}, color={0,0,127}));
  connect(FCV101theta, actuator.FCV101theta) annotation (Line(points={{-100,22.5},{-60,22.5},{-60,59.2125},{-21.0125,59.2125}}, color={0,0,127}));
  connect(GB101status, actuator.GB101_status) annotation (Line(points={{-100,15},{-58.5,15},{-58.5,57.1875},{-21.0125,57.1875}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedI;
