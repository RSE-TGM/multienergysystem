within MultiEnergySystem.TestFacility.Data;
record RoundPipeLine
  DistrictHeatingNetwork.Types.Length Di "Internal diameter";
  DistrictHeatingNetwork.Types.Length t "Thickness";
  DistrictHeatingNetwork.Types.Length tIns "Insulation thickness";
  DistrictHeatingNetwork.Types.Length L "Total length";
  DistrictHeatingNetwork.Types.Length h "Outlet height w.r.t to inlet";
  DistrictHeatingNetwork.Types.ThermalConductivity lambdaIns "Insulation thermal conductivity";
  DistrictHeatingNetwork.Types.ThermalConductivity lambdam "Metal thermal conductivity";
  DistrictHeatingNetwork.Types.Density rho_nom "Nominal density of the fluid";
  DistrictHeatingNetwork.Types.PerUnit cf "Constant Fanning friction coefficient";
  DistrictHeatingNetwork.Types.Velocity u_nom "Nominal fluid velocity";
  Real k(unit = "Pa/(kg/s)")  "Coefficient for the calculation of the pressure loss across the pipe";
  DistrictHeatingNetwork.Types.SpecificHeatCapacity cm "Metal specific heat capacity";
  DistrictHeatingNetwork.Types.Density rhom "Metal density";
end RoundPipeLine;
