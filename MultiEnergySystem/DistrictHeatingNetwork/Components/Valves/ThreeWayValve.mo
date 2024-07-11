within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
model ThreeWayValve "Model for Three-way Valve"
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.PartialThreeWayValve(
    redeclare FlowCoefficientValve partialValve,
    redeclare FlowCoefficientValve partialValve1);
equation

end ThreeWayValve;
