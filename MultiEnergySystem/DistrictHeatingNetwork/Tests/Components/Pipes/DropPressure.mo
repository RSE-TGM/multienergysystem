within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;

model DropPressure
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceL(T0 = 80 + 273.15, m_flow0 = Pipe.S100.m_flow_start, p0(displayUnit = "Pa") = 310000) annotation(
    Placement(visible = true, transformation(origin = {-40, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceNL(T0 = 80 + 273.15, m_flow0 = Pipe.S100.m_flow_start, p0(displayUnit = "Pa") = 310000) annotation(
    Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkL(T0 = 75 + 273.15, p0(displayUnit = "Pa") = 300000, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {40, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkNL(T0 = 75 + 273.15, p0(displayUnit = "Pa") = 300000, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.Round1DFV linearpipe(Di = Pipe.S100.Di, L = Pipe.S100.L*2, Tin_start = Pipe.S100.Tin_start, Tout_start = Pipe.S100.Tout_start, computeLinearPressureDrop = true, h = Pipe.S100.h, hin_start = Pipe.S100.hin_start, k = Pipe.S100.k, kc = 1, m_flow_start = Pipe.S100.m_flow_start, pin_start = Pipe.S100.pin_start, pout_start = Pipe.S100.pout_start, rho_nom = Pipe.S100.rho_nom, u_nom = Pipe.S100.u_nom) annotation(
    Placement(visible = true, transformation(origin = {1.77636e-15, 28}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.Round1DFV nonlinearpipe(Di = Pipe.S100.Di, L = Pipe.S100.L*2, Tin_start = Pipe.S100.Tin_start, Tout_start = Pipe.S100.Tout_start, computeLinearPressureDrop = false, h = Pipe.S100.h, hin_start = Pipe.S100.hin_start, k = Pipe.S100.k, kc = 1, m_flow_start = Pipe.S100.m_flow_start, pin_start = Pipe.S100.pin_start, pout_start = Pipe.S100.pout_start, rho_nom = Pipe.S100.rho_nom, u_nom = Pipe.S100.u_nom) annotation(
    Placement(visible = true, transformation(origin = {-2, -32}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
equation
  connect(sourceL.outlet, linearpipe.inlet) annotation(
    Line(points = {{-30, 28}, {-14, 28}}, color = {140, 56, 54}));
  connect(linearpipe.outlet, sinkL.inlet) annotation(
    Line(points = {{14, 28}, {30, 28}}, color = {140, 56, 54}));
  connect(sourceNL.outlet, nonlinearpipe.inlet) annotation(
    Line(points = {{-30, -32}, {-16, -32}}, color = {140, 56, 54}));
  connect(nonlinearpipe.outlet, sinkNL.inlet) annotation(
    Line(points = {{12, -32}, {30, -32}}));
  annotation(
    Documentation(info = "<html><head></head><body>Base test to verify the difference between considering linear or non-linear drop pressure.</body></html>"),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end DropPressure;
