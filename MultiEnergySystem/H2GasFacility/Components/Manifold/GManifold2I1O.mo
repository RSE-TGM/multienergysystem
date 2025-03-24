within MultiEnergySystem.H2GasFacility.Components.Manifold;
model GManifold2I1O
  extends Manifold.BaseClass.BaseManifold;

  Types.MassFlowRate m_flow_in[2] "Vector with the 2 entering mass flow rates, one per each inlet connector";

equation

  m_flow_in = {m_flow_in1, m_flow_in2};

  // Component Mass Balance
  M*der(Xi) + Xi*dM_dt = m_flow_in*{fluidIn1.Xi, fluidIn2.Xi} - m_flow_out*Xi;

annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})), Documentation(
        info="<html>
<p>The <span style=\"font-family: Courier New;\">GManifold2I1O</span> model represents a gas mixing manifold with two inlets and one outlet, extending the <span style=\"font-family: Courier New;\">BaseManifold</span> model. It is designed to mix gases from two separate inlet sources and output the resulting blended composition. This model is commonly used in hydrogen blending, natural gas distribution, and multi-gas processing systems.</p>
<h4>Usage:</h4>
<p>This model is particularly useful in hydrogen blending systems, multi-gas reactors, and natural gas processing plants, where different gases are mixed and the resulting composition needs to be calculated dynamically. </p>
</html>"));
end GManifold2I1O;
