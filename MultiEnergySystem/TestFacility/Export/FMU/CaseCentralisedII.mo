within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedII
  extends CaseCentralisedI(
    redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_II facility,
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_II actuator);
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,12.5}),
                          iconTransformation(extent={{-110,-35},{-100,-25}})));
  Modelica.Blocks.Interfaces.RealInput P401omega annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,5}),   iconTransformation(extent={{-110,-45},{-100,-35}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,-2.5}),
                          iconTransformation(extent={{-110,-55},{-100,-45}})));
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
  connect(TT402_exp.y, TT402) annotation (Line(points={{-29.5,-90},{-20,-90}}, color={0,0,127}));
  connect(m_flow_S400_exp.y, FT401) annotation (Line(points={{-29.5,-97.5},{-20,-97.5}}, color={0,0,127}));
  connect(actuator.FCV401theta, FCV401theta) annotation (Line(points={{-21.0125,52.125},{-52.5,52.125},{-52.5,-2.5},{-100,-2.5}}, color={0,0,127}));
  connect(P401omega, actuator.P401omega) annotation (Line(points={{-100,5},{-55,5},{-55,54.15},{-21.0125,54.15}}, color={0,0,127}));
  connect(EB401Tout_SP, actuator.EB401Tout_SP) annotation (Line(points={{-100,12.5},{-57.5,12.5},{-57.5,56.175},{-21.0125,56.175}}, color={0,0,127}));
  connect(sourceVoltage.outlet, facility.electricPortInlet) annotation (Line(
      points={{-49,-50},{-43,-50},{-43,-50.5},{-39,-50.5},{-39,0},{-30,0}},
      color={56,93,138},
      thickness=1));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedII;
