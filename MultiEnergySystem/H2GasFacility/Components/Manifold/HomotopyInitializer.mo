within MultiEnergySystem.H2GasFacility.Components.Manifold;
model HomotopyInitializer
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Gas.SourceP;
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture
    "Fluid model" annotation(choicesAllMatching = true);
  parameter MultiEnergySystem.H2GasFacility.Types.Pressure p_start "Initial value of pressure";
  parameter MultiEnergySystem.H2GasFacility.Types.MassFraction X_start[refFluid.nX] = {1} "Initial value of composition";
  parameter MultiEnergySystem.H2GasFacility.Types.Temperature T_start "Initial value of temperature";
  MultiEnergySystem.H2GasFacility.Types.SpecificEnthalpy h_start "Specific Enthalpy start value";
  Medium refFluid(
      p_start = p_start,
      T_start = T_start,
      X_start = X_start);
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = refFluid.nXi) annotation (
    Placement(visible = true, transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = refFluid.nXi) annotation (
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 1.9984e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  //assert(inlet.w > 0, "Mass flow rate going into the wrong direction in homotopy");
  inlet.p = outlet.p;
  inlet.m_flow + outlet.m_flow = 0;
  //inlet.h = inStream(outlet.h);
  h_start = refFluid.h;
  inlet.h_out = h_start;
  inlet.Xi = X_start[1:refFluid.nXi];
  outlet.h_out = homotopy(inStream(inlet.h_out), h_start);
  outlet.Xi = homotopy(inStream(inlet.Xi), X_start[1:refFluid.nXi]);
  // Tracking composition mass balances
  //Fluid model equations
  refFluid.p = p_start;
  refFluid.T = T_start;
  refFluid.Xi = X_start[1:refFluid.nXi];

end HomotopyInitializer;
