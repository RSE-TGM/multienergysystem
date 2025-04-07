within MultiEnergySystem.H2GasFacility.Components.Manifold;
model Manifold2I1O
  extends Manifold.BaseClass.BaseManifold(
    redeclare model MediumIn1 = H2GasFacility.Media.IdealGases.CH4,
    redeclare model MediumIn2 = H2GasFacility.Media.IdealGases.H2,
    redeclare model MediumOut = H2GasFacility.Media.IdealGases.CH4H2,
    Xin_start1 = {1},
    Xin_start2 = {1});

equation

  // Component Mass Balance
  M*der(Xi) + Xi*dM_dt = m_flow_in1*ones(fluidOut.nXi) - m_flow_out*Xi;

annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})), Documentation(
        info="<html>
<p>The <span style=\"font-family: Courier New;\">Manifold2I1O</span> model represents a gas mixing manifold with two inlets and one outlet.</p>
<h4>Mass Balance for Component Fractions</h4>
<ul>
<li>The model tracks how the individual gas components (CH₄ and H₂) mix inside the manifold.</li>
<li>This equation ensures that the mass fraction of each component evolves correctly based on the inflows and outflows. </li>
</ul>
<h4>Usage:</h4>
<p>This model is suitable for hydrogen injection systems, power-to-gas applications, and blended gas distribution networks. It can be used in simulations where the composition of a gas mixture needs to be dynamically calculated based on inlet flow rates.</p>
</html>"));
end Manifold2I1O;
