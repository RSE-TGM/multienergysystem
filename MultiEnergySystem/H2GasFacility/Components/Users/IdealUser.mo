within MultiEnergySystem.H2GasFacility.Components.Users;
model IdealUser
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Types.Pressure p0(nominal = 1e4) = 0.5e5;
  parameter Types.MassFlowRate m_flow0(nominal = 0.01) = 0.04;
  parameter Types.MassFraction X0[sink_demand.fluid.nX] = {1};
  parameter Types.Temperature T0 = 15 + 273.15;
  parameter Real userdemand[:, 2] = [0, m_flow0; 24*3600, m_flow0] "Table for demand";
  Types.MassFraction Xi[sink_demand.fluid.nXi] "Fluid mass flow rate";
  Types.SpecificEnthalpy h "Fluid specific enthalpy";
  Types.Pressure p "Fluid pressure outlet";
  Medium fluid(p_start = p0, T_start = T0, X_start = X0);
  H2GasFacility.Sources.SinkMassFlow sink_demand(G = 0, redeclare model Medium = Medium, T0 = T0, X0 = X0, m_flow0 = m_flow0, p0 = p0, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = sink_demand.fluid.nXi) annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable demand(table = userdemand)  annotation (
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  Xi = inStream(inlet.Xi);
  h = inStream(inlet.h_out);
  p = inlet.p;
  fluid.p = p;
  fluid.h = h;
  fluid.Xi = Xi;
  connect(inlet, sink_demand.inlet) annotation (
    Line(points = {{-100, 0}, {-10, 0}}));
  connect(demand.y, sink_demand.in_m_flow0) annotation (
    Line(points={{-39,40},{-6,40},{-6,5}},        color = {0, 0, 127}));
  annotation (
    Icon(graphics={  Ellipse(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.Sphere, lineThickness = 0.5, extent = {{-60, 60}, {60, -60}})}));
end IdealUser;
