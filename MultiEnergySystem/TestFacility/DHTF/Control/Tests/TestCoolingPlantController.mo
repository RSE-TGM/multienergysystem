within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCoolingPlantController
  extends Modelica.Icons.Example;
  replaceable DHTF.Control.Controllers.CoolingPlantController coolingPlantController annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
  replaceable TestFacility.Export.Linearization.CoolingSystemI_InitForward coolingSystem(TT704Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15), TT714Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15), TT724Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15), TT734Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15), EX701PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX711PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX721PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX731PtOffset(fixOffset = true, y_Offset_fixed = 50e3), dFTR01Offset(fixOffset = true, y_Offset_fixed = 5), mflowEX701Offset(u_start = 0.5), mflowEX711Offset(u_start = 0.5)) annotation (
    Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
  inner MultiEnergySystem.System system annotation (
    Placement(transformation(extent = {{80, 80}, {100, 100}})));
equation
  connect(coolingSystem.processVariableBus, coolingPlantController.processVariableBus) annotation (
    Line(points = {{51.36, 0}, {66, 0}, {66, -48}, {-66, -48}, {-66, -0.38}, {-48.02, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  connect(coolingPlantController.controlSignalBus, coolingSystem.controlSignalBus) annotation (
    Line(points = {{-7.32, 0}, {2, 0}, {2, -0.38}, {12.86, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 4000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestCoolingPlantController;
