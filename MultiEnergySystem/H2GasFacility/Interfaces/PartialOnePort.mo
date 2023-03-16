within MultiEnergySystem.H2GasFacility.Interfaces;

partial model PartialOnePort
  parameter Boolean allowFlowReversal = false "= false prohibits flow reversal, simplify the equations";
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
end PartialOnePort;
