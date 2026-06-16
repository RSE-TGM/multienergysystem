within MultiEnergySystem.ElectricNetwork.Tests;
model Test_Battery "Source voltage charging the battery"
  extends Modelica.Icons.Example;
  Sources.SourceVoltage sourceVoltage
    annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));
  Components.Batteries.Battery battery(E_nom=1e7) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,2})));
equation
  connect(sourceVoltage.outlet, battery.inlet) annotation (Line(
      points={{-48,2},{20.8,2}},
      color={56,93,138},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Test_Battery;
