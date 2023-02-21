within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model BPHETest
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger HX1(Di_cold = 0.023, Di_hot = 0.03, L_cold = 0.96275, L_hot = 0.7073, Stot_cold = 0.5, Stot_hot = 0.5, Tin_start_cold = 323.15, Tin_start_hot = 353.15, Tout_start_cold = 303.15, Tout_start_hot = 333.15, cpm_hot = 500, gamma_nom_cold = 3440, gamma_nom_hot = 3440, hin_start_cold = 1e5, hin_start_hot = 1e5, k_cold = 13923.8, k_hot = 4162.27, kc_cold = 1, kc_hot = 1, lambdam_hot = 16.3, m_flow_start_cold = 5, m_flow_start_hot = 0.6154, n = 4, nPipes_cold = 1, nPipes_hot = 1, pin_start_cold = 110000, pin_start_hot = 110000, pout_start_cold = 101000, pout_start_hot = 101000, rhom_cold(displayUnit = "kg/m3") = 7990, rhom_hot(displayUnit = "g/cm3") = 7990, thermalInertia = false) annotation(
    Placement(visible = true, transformation(origin = {3, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold(p0(displayUnit = "kPa") = 110000, use_T = true, T = 280.15) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkCold(p0(displayUnit = "kPa") = 1000*(110 - 19.3), use_T = true, T = 288.75) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot(p0(displayUnit = "kPa") = 110000, use_T = true, T = 353.15) annotation(
    Placement(visible = true, transformation(origin = {56, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkHot(p0(displayUnit = "kPa") = 1000*(110 - 2.5), use_T = true, T = 303.15) annotation(
    Placement(visible = true, transformation(origin = {56, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System system annotation(
    Placement(visible = true, transformation(origin = {88, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceCold.outlet, HX1.incold) annotation(
    Line(points = {{-40, -40}, {-12, -40}, {-12, -38}}, color = {168, 168, 168}));
  connect(sinkCold.inlet, HX1.outcold) annotation(
    Line(points = {{-40, 30}, {-12, 30}, {-12, 32}}, color = {168, 168, 168}));
  connect(HX1.inhot, sourceHot.outlet) annotation(
    Line(points = {{18, 32}, {46, 32}}, color = {168, 168, 168}));
  connect(HX1.outhot, sinkHot.inlet) annotation(
    Line(points = {{18, -38}, {46, -38}, {46, -40}}, color = {168, 168, 168}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = true)));
end BPHETest;
