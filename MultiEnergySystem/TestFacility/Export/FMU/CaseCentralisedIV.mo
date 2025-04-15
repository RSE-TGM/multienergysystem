within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIV
  extends CaseCentralisedIII;
  Modelica.Blocks.Interfaces.RealInput P201omega
    annotation (
    Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,50}),
    iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,-50})));
  Modelica.Blocks.Interfaces.IntegerInput S200_status annotation (
    Placement(transformation(
        extent={{-105,29.5},{-95,39.5}},
        rotation=0),
    iconTransformation(
        extent={{210.009,59.0001},{190.009,79.0001}},
        rotation=180,
        origin={100.009,-20.9999})));
  Modelica.Blocks.Interfaces.RealInput FCV201theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,42.5}), iconTransformation(extent={{-110,-80},{-90,-60}})));
equation
  connect(P201omega, controlSignalBus.omegaP201)
    annotation (Line(points={{-100,50},{-89.5,50},{-89.5,58.5},{0,58.5},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCV201theta, controlSignalBus.thetaFCV201)
    annotation (Line(points={{-100,42.5},{-88.5,42.5},{-88.5,46},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S200_status, controlSignalBus.statusS200) annotation (Line(points={{-100,34.5},{-23,34.5},{-23,46},{0,46}},
                                                                                                                  color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIV;
