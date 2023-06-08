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

annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end Manifold2I1O;
