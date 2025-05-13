within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
model FlowCoefficientValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.PartialValve(inlet(h_out(start = fluidIn.h_start)));
equation

end FlowCoefficientValve;
