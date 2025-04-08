within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestActuator
  extends Modelica.Icons.Example;
  replaceable DHTF.Control.Controllers.ThermalPlantController thermalPlantController annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
  replaceable Export.Linearization.CentralisedSystemCoolingSimplifiedI_B_InitForward centralisedSystemI_B_InitForward(m_flowcool_nom = 0.35, TT704Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15), TT714Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15), TT724Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15), TT734Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15), FT101Offset(fixOffset = true, y_Offset_fixed = 5.7166667), FT401Offset(fixOffset = true, y_Offset_fixed = 3.2666667), PT102Offset(fixOffset = true, y_Offset_fixed = 0.0e5), dPTA2Offset(fixOffset = true, y_Offset_fixed = 0.015e5), EX701PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX711PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX721PtOffset(fixOffset = true, y_Offset_fixed = 50e3), EX731PtOffset(fixOffset = true, y_Offset_fixed = 50e3), thetaFCVC01Offset(fixInput = false, fixOffset = true), thetaFCVC02Offset(fixInput = false, fixOffset = true), thetaFCV101Offset(fixInput = false, fixOffset = true), thetaFCV401Offset(fixInput = false, fixOffset = true)) annotation (
    Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
  inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
equation
  connect(centralisedSystemI_B_InitForward.processVariableBus, thermalPlantController.processVariableBus) annotation (
    Line(points = {{51.36, 0}, {66, 0}, {66, -48}, {-66, -48}, {-66, -0.38}, {-48.02, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
    Line(points = {{-7.32, 0}, {2, 0}, {2, -0.38}, {12.86, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 4000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestActuator;
