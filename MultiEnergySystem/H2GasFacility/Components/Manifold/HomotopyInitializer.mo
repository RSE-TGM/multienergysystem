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

  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">HomotopyInitializer</span> model is designed to initialize the pressure, temperature, enthalpy, and composition of a fluid. It serves as a source model with homotopy-based initialization to improve convergence in numerical simulations.</p>
<h4>Equations and Assumptions:</h4>
<ul>
<li>The model ensures that the pressure at the inlet and outlet remains equal (<span style=\"font-family: Courier New;\">inlet.p = outlet.p</span>).</li>
<li>Mass flow balance is maintained (<span style=\"font-family: Courier New;\">inlet.m_flow + outlet.m_flow = 0</span>).</li>
<li>The outlet enthalpy and composition are initialized using a homotopy transformation to improve solver convergence: </li>
<p><span style=\"font-family: Courier New;\">outlet.h_out = homotopy(inStream(inlet.h_out), h_start);</span></p>
<p><span style=\"font-family: Courier New;\">outlet.Xi = homotopy(inStream(inlet.Xi), X_start[1:refFluid.nXi]);</span></p>
<li>The specific enthalpy at the inlet is set to the initialized value (<span style=\"font-family: Courier New;\">inlet.h_out = h_start</span>).</li>
<li>The composition mass fractions are tracked.</li>
</ul>
<h4>Usage:</h4>
<p>This model is useful for setting up fluid initialization conditions in hydrogen gas networks, especially when dealing with complex compositions. The use of homotopy functions helps stabilize simulations by providing a smooth transition between simplified and full system equations.</p>
</html>"));
end HomotopyInitializer;
