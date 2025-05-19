within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedII
  extends CaseCentralisedI(
    redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_II facility,
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_II actuator);
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,9}), iconTransformation(extent={{-110,-40},{-100,-30}})));
  Modelica.Blocks.Interfaces.RealInput P401input annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,1.5}), iconTransformation(extent={{-110,-50},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={-100,-6}),iconTransformation(extent={{-110,-60},{-100,-50}})));
  Modelica.Blocks.Interfaces.RealOutput TT402 annotation (Placement(transformation(extent={{5,-95},{15,-85}}),    iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={105,60})));
  Modelica.Blocks.Interfaces.RealOutput FT401 annotation (Placement(transformation(extent={{5,-102.5},{15,-92.5}}),    iconTransformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={105,50})));
  Modelica.Blocks.Sources.RealExpression TT402_exp(y=facility.heatGeneration.S400.TT402.T_meas) annotation (Placement(transformation(extent={{-10,-95},{0,-85}})));
  Modelica.Blocks.Sources.RealExpression m_flow_S400_exp(y=facility.heatGeneration.S400.FT.m_flow) annotation (Placement(transformation(extent={{-10,-102.5},{0,-92.5}})));
  Modelica.Blocks.Interfaces.BooleanInput EB401_status annotation (Placement(transformation(extent={{-5,5},{5,-5}}, origin={-100,-12.5}), iconTransformation(extent={{-5,-5},{5,5}}, origin={-105,-65})));
equation
  connect(TT402_exp.y, TT402) annotation (Line(points={{0.5,-90},{10,-90}},    color={0,0,127}));
  connect(m_flow_S400_exp.y, FT401) annotation (Line(points={{0.5,-97.5},{10,-97.5}},    color={0,0,127}));
  connect(actuator.FCV401theta, FCV401theta) annotation (Line(points={{-21.0125,50.91},{-52.5,50.91},{-52.5,-6},{-100,-6}},       color={0,0,127}));
  connect(P401input,actuator.P401input)  annotation (Line(points={{-100,1.5},{-55,1.5},{-55,52.935},{-21.0125,52.935}},
                                                                                                                  color={0,0,127}));
  connect(EB401Tout_SP, actuator.EB401Tout_SP) annotation (Line(points={{-100,9},{-57.5,9},{-57.5,54.96},{-21.0125,54.96}},         color={0,0,127}));
  connect(sourceVoltage.outlet, facility.electricPortInlet) annotation (Line(
      points={{-29.5,-45},{-36,-45},{-36,0},{-30,0}},
      color={56,93,138},
      thickness=1));
  connect(EB401_status, actuator.EB401_status) annotation (Line(points={{-100,-12.5},{-51,-12.5},{-51,48.885},{-21.0125,48.885}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedII;
