within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIII
  extends CaseCentralisedII(
    redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_III facility,
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_III actuator);
  Modelica.Blocks.Interfaces.RealInput P501omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,45}), iconTransformation(extent={{110,-70},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,60}), iconTransformation(extent={{110,-50},{100,-40}})));
  Modelica.Blocks.Interfaces.RealInput CHPmflow annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,37.5}), iconTransformation(extent={{110,-50},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Pel_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={100,52}), iconTransformation(extent={{110,-40},{100,-30}})));
equation
  connect(CHP501Pel_SP, actuator.CHP501Pel_SP) annotation (Line(points={{100,52},{80.5,52},{80.5,55.1625},{21.5125,55.1625}}, color={0,0,127}));
  connect(CHP501Tout_SP, actuator.CHP501Tout_SP) annotation (Line(points={{100,60},{74,60},{74,53.1375},{21.5125,53.1375}}, color={0,0,127}));
  connect(CHPmflow, actuator.CHPmflow) annotation (Line(points={{100,37.5},{90.5,37.5},{90.5,38},{80,38},{80,51.1125},{21.5125,51.1125}}, color={0,0,127}));
  connect(P501omega, actuator.P501omega) annotation (Line(points={{100,45},{76.5,45},{76.5,44.5},{73.5,44.5},{73.5,49.0875},{21.5125,49.0875}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
  Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIII;
