within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
model ClosedLoopInitializer
  "Component for the initialization of closed loops"
  extends DistrictHeatingNetwork.Icons.Water.SourceP;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
    "Fluid model" annotation(choicesAllMatching = true);
  parameter DistrictHeatingNetwork.Types.Pressure p_start=1e5 "Initial value of pressure"
    annotation (Dialog(tab="Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature T_start=25+273.15 "Initial value of temperature"
    annotation (Dialog(tab="Initialisation"));
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start=1.5
    "Initial value of the mass flow rate"
    annotation (Dialog(tab="Initialisation"));
  final parameter Types.MassFlowRate m_flow_b(fixed=false, start=0);
  outer System system "System object";

  DistrictHeatingNetwork.Types.MassFlowRate m_flow(min=0, start=m_flow_start);

  Medium refFluid(p_start = p_start, T_start = T_start);
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet(m_flow(min = 0, start = m_flow_start)) annotation (
    Placement(visible = true,transformation(extent = {{-10, -50}, {10, -30}}, rotation = 0), iconTransformation(extent = {{-120, -22}, {-80, 18}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet(m_flow(max = 0, start = -m_flow_start)) annotation (
    Placement(visible = true, transformation(extent = {{0, -40}, {20, -20}}, rotation = 0), iconTransformation(extent = {{80, -20}, {120, 20}}, rotation = 0)));
equation
  assert(abs(m_flow_b) < 5e-2, "Initializer mass flow rate is too high", AssertionLevel.warning);

  // Total mass balance, w_b will be zero
  0 = inlet.m_flow + outlet.m_flow + m_flow_b;
  m_flow = inlet.m_flow;

  // Trivial momentum energy balance
  inlet.p = outlet.p;
  outlet.h_out = inStream(inlet.h_out);
  inlet.h_out = refFluid.h "Unused, because inlet.w.min = 0";

  // Fluid Equations
  refFluid.p = p_start;
  refFluid.T = T_start;
initial equation
  if system.initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    inlet.p = p_start;
  else
    m_flow_b = 0;
  end if;
  annotation (
    Icon(coordinateSystem(                             extent = {{-100, -100}, {100, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -140}, {100, 100}}),
    graphics={Ellipse(lineColor = {28, 108, 200}, fillColor = {170, 170, 255},
    fillPattern = FillPattern.Solid, extent = {{-40, 100}, {40, 20}}, endAngle = 360), Line(points = {{0, 20}, {0, -40}})}));
end ClosedLoopInitializer;
