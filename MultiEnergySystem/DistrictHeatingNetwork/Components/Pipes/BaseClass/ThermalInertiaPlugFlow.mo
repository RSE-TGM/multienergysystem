within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model ThermalInertiaPlugFlow
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
equation
  // No pressure loss
  inlet.p = outlet.p;
  // No losses towards the ambient, already computed
  Q_amb = 0;
end ThermalInertiaPlugFlow;
