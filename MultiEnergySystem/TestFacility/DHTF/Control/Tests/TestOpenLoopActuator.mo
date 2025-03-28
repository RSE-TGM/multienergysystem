within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestOpenLoopActuator
  extends Modelica.Icons.Example;
  replaceable DHTF.Control.OpenLoopActuators.OpenLoopActuator thermalPlantController annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
  replaceable Export.Linearization.CentralisedSystemGBEBCHP_InitForward centralisedSystemI_B_InitForward(thetaFCVC01Offset(fixInput = false, fixOffset = true), thetaFCVC02Offset(fixInput = false, fixOffset = true), thetaFCV901Offset(fixInput = false, fixOffset = true), thetaFCV101Offset(fixInput = false, fixOffset = true), thetaFCV401Offset(fixInput = false, fixOffset = true), omegaP901Offset(fixInput = false, fixOffset = true), omegaP101Offset(fixInput = false, fixOffset = true), omegaP401Offset(fixInput = false, fixOffset = true), omegaP501Offset(fixInput = false, fixOffset = true)) annotation (
    Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
equation
  connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
    Line(points = {{-7.32, 0}, {2, 0}, {2, -0.38}, {12.86, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 10000, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end TestOpenLoopActuator;
