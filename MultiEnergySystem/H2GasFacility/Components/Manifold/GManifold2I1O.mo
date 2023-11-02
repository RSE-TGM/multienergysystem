within MultiEnergySystem.H2GasFacility.Components.Manifold;
model GManifold2I1O
  extends Manifold.BaseClass.BaseManifold;

  Types.MassFlowRate m_flow_in[2] "Vector with the 2 entering mass flow rates, one per each inlet connector";

equation

  m_flow_in = {m_flow_in1, m_flow_in2};

  // Component Mass Balance
  M*der(Xi) + Xi*dM_dt = m_flow_in*{fluidIn1.Xi, fluidIn2.Xi} - m_flow_out*Xi;

annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end GManifold2I1O;
