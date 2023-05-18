within MultiEnergySystem.H2GasFacility.Components.Users;

model IdealUser
  replaceable model Medium = H2GasFacility.Media.RealGases.CH4Papay;
  parameter Types.Pressure p0(nominal = 1e4) = 0.5e5;
  parameter Types.MassFlowRate m_flow0(nominal = 0.01) = 0.04;
  parameter Types.MassFraction X0[sink_demand.fluid.nX]= {1};
  parameter Types.Temperature T0 = 15 + 273.15;
  H2GasFacility.Sources.SinkMassFlow sink_demand(redeclare model Medium = Medium, G = 0, T0 = T0, X0 = X0, m_flow0 = m_flow0, p0 = p0) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = sink_demand.fluid.nXi) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(inlet, sink_demand.inlet) annotation(
    Line(points = {{-100, 0}, {-10, 0}}));

annotation(
    Icon(graphics = {Ellipse(lineColor = {244, 125, 35}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, lineThickness = 0.5, extent = {{-60, 60}, {60, -60}})}));
end IdealUser;
