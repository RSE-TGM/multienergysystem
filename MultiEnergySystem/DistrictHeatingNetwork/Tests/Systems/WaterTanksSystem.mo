within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model WaterTanksSystem "System of two tanks"
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation (
    Diagram(coordinateSystem(extent = {{-400, -160}, {400, 160}})));
end WaterTanksSystem;