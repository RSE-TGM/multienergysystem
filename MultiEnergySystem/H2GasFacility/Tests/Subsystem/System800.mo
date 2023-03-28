within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model System800
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceCH4(T0 = 25 + 273.15, m_flow0 = 0.003339, p0 = 2305)  annotation(
    Placement(visible = true, transformation(origin = {-120, -4}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Valves.PressureDrop PR801 annotation(
    Placement(visible = true, transformation(origin = {32, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.round1DFV gasline1(Di = Pipe.InletGasBoiler.Di, L = 5.772, Tin_start = Pipe.InletGasBoiler.Tin_start, Tout_start = Pipe.InletGasBoiler.Tout_start, hin_start = Pipe.InletGasBoiler.hin_start, k = Pipe.InletGasBoiler.k, kc = 1, m_flow_start = Pipe.InletGasBoiler.m_flow_start, pin_start = Pipe.InletGasBoiler.pin_start, pout_start = Pipe.InletGasBoiler.pout_start, rho_nom = Pipe.InletGasBoiler.rho_nom, t = Pipe.InletGasBoiler.t)  annotation(
    Placement(visible = true, transformation(origin = {-90, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.round1DFV gasline2(Di = Pipe.InletGasBoiler.Di, L = 5, Tin_start = Pipe.InletGasBoiler.Tin_start, Tout_start = Pipe.InletGasBoiler.Tout_start, h = 5, hin_start = Pipe.InletGasBoiler.hin_start, k = Pipe.InletGasBoiler.k, kc = 1, m_flow_start = Pipe.InletGasBoiler.m_flow_start, pin_start = Pipe.InletGasBoiler.pin_start, pout_start = Pipe.InletGasBoiler.pout_start, rho_nom = Pipe.InletGasBoiler.rho_nom, t = Pipe.InletGasBoiler.t) annotation(
    Placement(visible = true, transformation(origin = {-62, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.round1DFV gasline3(Di = Pipe.InletGasBoiler.Di, L = 13.482, Tin_start = Pipe.InletGasBoiler.Tin_start, Tout_start = Pipe.InletGasBoiler.Tout_start, hin_start = Pipe.InletGasBoiler.hin_start, k = Pipe.InletGasBoiler.k, kc = 1, m_flow_start = Pipe.InletGasBoiler.m_flow_start, pin_start = Pipe.InletGasBoiler.pin_start, pout_start = Pipe.InletGasBoiler.pout_start, rho_nom = Pipe.InletGasBoiler.rho_nom, t = Pipe.InletGasBoiler.t) annotation(
    Placement(visible = true, transformation(origin = {-36, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.round1DFV gasline4(Di = Pipe.InletGasBoiler.Di, L = 3.2, Tin_start = Pipe.InletGasBoiler.Tin_start, Tout_start = Pipe.InletGasBoiler.Tout_start, hin_start = Pipe.InletGasBoiler.hin_start, k = Pipe.InletGasBoiler.k, kc = 1, m_flow_start = Pipe.InletGasBoiler.m_flow_start, pin_start = Pipe.InletGasBoiler.pin_start, pout_start = Pipe.InletGasBoiler.pout_start, rho_nom = Pipe.InletGasBoiler.rho_nom, t = Pipe.InletGasBoiler.t) annotation(
    Placement(visible = true, transformation(origin = {-12, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {130, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(p0 = 2000, use_T = true)  annotation(
    Placement(visible = true, transformation(origin = {62, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceCH4.outlet, gasline1.inlet) annotation(
    Line(points = {{-108, -4}, {-100, -4}}, color = {182, 109, 49}));
  connect(gasline1.outlet, gasline2.inlet) annotation(
    Line(points = {{-80, -4}, {-62, -4}, {-62, 6}}, color = {182, 109, 49}));
  connect(gasline2.outlet, gasline3.inlet) annotation(
    Line(points = {{-62, 26}, {-62, 38}, {-46, 38}}, color = {182, 109, 49}));
  connect(gasline3.outlet, gasline4.inlet) annotation(
    Line(points = {{-26, 38}, {-12, 38}, {-12, 26}}, color = {182, 109, 49}));
  connect(gasline4.outlet, PR801.inlet) annotation(
    Line(points = {{-12, 6}, {-12, -6}, {22, -6}}, color = {182, 109, 49}));
  connect(PR801.outlet, sinkPressure.inlet) annotation(
    Line(points = {{42, -6}, {52, -6}}, color = {182, 109, 49}));

annotation(
    Diagram(coordinateSystem(extent = {{-140, -100}, {140, 100}})));
end System800;
