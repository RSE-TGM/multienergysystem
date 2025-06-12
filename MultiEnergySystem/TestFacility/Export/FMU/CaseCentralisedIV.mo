within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIV
  extends CaseCentralisedIII(
    redeclare DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_IV facility,
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_IV actuator);
  Modelica.Blocks.Interfaces.RealInput P201input
    annotation (
    Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,-23.5}),
    iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,-75})));
  Modelica.Blocks.Interfaces.IntegerInput S200_status annotation (
    Placement(transformation(
        extent={{-105,-44},{-95,-34}},
        rotation=0),
    iconTransformation(
        extent={{105.004,29.5001},{95.0038,39.5001}},
        rotation=180,
        origin={-4.99621,-60.4999})));
  Modelica.Blocks.Interfaces.RealInput FCV201theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,-31}),  iconTransformation(extent={{-110,-90},{-100,-80}})));
equation
  connect(P201input, actuator.P201omega) annotation (Line(points={{-100,-23.5},{-50,-23.5},{-50,47.0625},{-21.0125,47.0625}},
                                                                                                                            color={0,0,127}));
  connect(FCV201theta, actuator.FCV201theta) annotation (Line(points={{-100,-31},{-48.5,-31},{-48.5,45.0375},{-21.0125,45.0375}},       color={0,0,127}));
  connect(S200_status, actuator.S200_status) annotation (Line(points={{-100,-39},
          {-47,-39},{-47,43.0125},{-21.0125,43.0125}},                                                                              color={255,127,0}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
    Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIV;
