within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
connector MultiHeatPort
  parameter Integer n(min = 1) = 3 "Number of volumes";
  Modelica.Units.SI.Temperature T[n] "Port temperature";
  flow Modelica.Units.SI.HeatFlowRate Q_flow[n]
    "Heat flow rate (positive if flowing from outside into the component)";
  annotation (
    defaultComponentName = "MultiPort",
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(lineColor={255,101,98},     fillColor={192,80,
              77},
            fillPattern=FillPattern.Forward,                                                                                                                                                                                                        extent = {{-100, 100}, {100, -100}},
          lineThickness=0.5)}));
end MultiHeatPort;
