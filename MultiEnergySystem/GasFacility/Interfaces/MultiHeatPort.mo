within MultiEnergySystem.GasFacility.Interfaces;
connector MultiHeatPort
  parameter Integer n(min = 1) = 3 "Number of volumes";
  Modelica.Units.SI.Temperature T[n] "Port temperature";
  flow Modelica.Units.SI.HeatFlowRate Q_flow[n]
    "Heat flow rate (positive if flowing from outside into the component)";
  annotation (
    defaultComponentName = "MultiPort",
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(lineColor = {255, 238, 44}, fillColor = {245, 163, 0}, pattern = LinePattern.None,
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end MultiHeatPort;
