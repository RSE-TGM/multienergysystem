within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIII
  extends CaseCentralisedII(
    redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_III facility,
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_III actuator);
  Modelica.Blocks.Interfaces.RealInput P501input annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,42.5}),
                          iconTransformation(extent={{110,-70},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,57.5}),
                          iconTransformation(extent={{110,-50},{100,-40}})));
  Modelica.Blocks.Interfaces.RealInput CHPmflow annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,51}),   iconTransformation(extent={{110,-50},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Pel_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,65}), iconTransformation(extent={{110,-40},{100,-30}})));
  Modelica.Blocks.Interfaces.BooleanInput CHP501status annotation (Placement(transformation(extent={{5,5},{-5,-5}}, origin={100,35}), iconTransformation(extent={{5,-5},{-5,5}}, origin={105,-75})));
equation
  connect(CHP501Tout_SP, actuator.CHP501Tout_SP) annotation (Line(points={{100,57.5},{100,57},{91,57},{91,53},{25,53},{25,53.1375},{21.5125,53.1375}},
                                                                                                                            color={0,0,127}));
  connect(CHPmflow, actuator.CHPmflow) annotation (Line(points={{100,51},{60.7563,51},{60.7563,51.1125},{21.5125,51.1125}},               color={0,0,127}));
  connect(P501input,actuator.P501input)  annotation (Line(points={{100,42.5},{91,42.5},{91,49.0875},{21.5125,49.0875}},                         color={0,0,127}));
  connect(CHP501status, actuator.CHP501_status) annotation (Line(points={{100,35},{90,35},{90,46.86},{21.5125,46.86}}, color={255,0,255}));
  connect(CHP501Pel_SP, actuator.CHP501Pel_SP) annotation (Line(points={{100,65},{90,65},{90,55},{56,55},{56,55.1625},{21.5125,55.1625}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIII;
