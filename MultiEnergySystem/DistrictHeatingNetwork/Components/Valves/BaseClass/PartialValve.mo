within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;
partial model PartialValve
  extends DHN4Control.Interfaces.PartialTwoPort;
  import DHN4Control.Media.{cp,rho0};
  import Modelica.Fluid.Utilities.regRoot;

  parameter Modelica.Units.SI.PerUnit nomOpening = 1 "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter Modelica.Units.SI.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition, default 3mm diameter";
  constant Modelica.Units.SI.PerUnit pr = 0.85 "Pressure recovery coefficient";
  parameter Modelica.Units.SI.PressureDifference dp_nom = 4e5 "Pressure drop between supply and return, as imposed by the differential pump";
  parameter Components.Types.valveOpeningChar openingChar=Components.Types.valveOpeningChar.Linear
    "opening characteristic";

  final parameter Modelica.Units.SI.MassFlowRate m_nom = Kv * dp_nom * dp_nom *1  "Peak mass flow rate at full opening";

  Modelica.Units.SI.Area A_v = 2.7778e-5 * Kv "Opening area of the valve";
  Modelica.Units.SI.MassFlowRate m_flow "mass flow rate through the valve";

  Modelica.Blocks.Interfaces.RealInput opening(max = 1, min = 0) "Valve Displacement"
                                                                                     annotation (
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 270)));

equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;
  // Energy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

  if openingChar == Components.Types.valveOpeningChar.Linear then
    // Momentum balance
    m_flow = homotopy((BaseClass.ValveCharacteristics.linear(opening) + minimumOpening) * A_v * sqrt(rho0) * regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.linear(opening) + minimumOpening) / nomOpening * m_nom / dp_nom * (inlet.p - outlet.p));
  elseif openingChar == Components.Types.valveOpeningChar.Quadratic then
    // Momentum balance
    m_flow = homotopy((BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening) * A_v * sqrt(rho0) * regRoot(inlet.p - outlet.p), (BaseClass.ValveCharacteristics.quadratic(opening) + minimumOpening) / nomOpening * m_nom / dp_nom * (inlet.p - outlet.p));
  end if;
  annotation (
    Icon(graphics={  Line(points = {{0, 52}, {0, 0}}), Polygon(points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, 52}}), Ellipse(visible = false, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 94}, {40, 14}}), Polygon(lineColor = {255, 255, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-100, 0}, {100, 0}, {100, 0}, {0, 0}, {-100, 0}, {-100, 0}}), Polygon(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(visible = false, points = {{-20, 25}, {-20, 63}, {0, 41}, {20, 63}, {20, 25}}, thickness = 0.5)}));
end PartialValve;
