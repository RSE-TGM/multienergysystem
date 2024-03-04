within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model HydraulicDiameter
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.FixedResistance(
    final dp_nom = rho_nom*g_n*h_nom + (cf/2)*rho_nom*omega*(L/A)*u_nom^2);
equation
  k_c = (cf/2)*(omega/fluidIn.rho)*L/A^3;

end HydraulicDiameter;
