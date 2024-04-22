within MultiEnergySystem.DistrictHeatingNetwork.Tests.Controllers;
model SplitRangeBlockTest
  Actuators.SplitRange splitRange annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-1,
    duration=10,
    offset=0,
    startTime=10) annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
equation
  connect(ramp.y, splitRange.U) annotation (Line(points={{-39,10},{-22,10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end SplitRangeBlockTest;
