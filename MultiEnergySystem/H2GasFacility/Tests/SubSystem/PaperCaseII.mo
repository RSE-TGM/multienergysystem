within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseII
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.IdealGases.NG4_H2;
  parameter Integer n = 7 "Number of volumes in each pipeline";
  parameter Types.MassFraction X_start[5] = {0.862424, 0.107765, 0.0263392, 0.00347176, 0};
  parameter Types.MassFraction X_start_H2[5] = {0.0, 0.0, 0.0, 0.0, 1};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.0042;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(Di = 0.16, L = 50, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = 0.001368, kc = 1, m_flow_start = 0.2666, n = n, pin_start(displayUnit = "Pa") = 7499.999999999999, pout_start(displayUnit = "Pa") = 6608.999999999999, rho_nom(displayUnit = "kg/m3") = 0.0520458, u_nom = 17) annotation(
    Placement(visible = true, transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {150, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = X_start, p0 (displayUnit = "Pa")= 7500) annotation(
    Placement(visible = true, transformation(origin = {-30, 120}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe4.hin_start, k = 0.001333, kc = 1, m_flow_start = 0.0522, n = n, pin_start (displayUnit = "Pa")= 6609, pout_start (displayUnit = "Pa")= 4145, rho_nom = 0.045862759, u_nom = 7.415235) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe3.hin_start, k = 0.001345, kc = 1, m_flow_start = 0.0458, n = n, pin_start (displayUnit = "Pa")= 6608.999999999999, pout_start (displayUnit = "Pa")= 4668, rho_nom = 0.045862759, u_nom = 6.55) annotation(
    Placement(visible = true, transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(Di = 0.16, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38105e6, k = 0.001196, kc = 1, m_flow_start = 0.124954, n = n, pin_start (displayUnit = "Pa")= 6608.999999999999, pout_start (displayUnit = "Pa")= 4668, rho_nom = 0.045862759, u_nom = 8) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node5(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.045453, p0(displayUnit = "Pa") = 4145, userdemand = [0, 0.045453; 1000, 0.045453]) annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node2(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.043705, p0(displayUnit = "Pa") = 6608.999999999999, userdemand = [0, 0.043705; 1000,0.043705]) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node4(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.034964, p0(displayUnit = "Pa") = 4695, userdemand = [0, 0.034964; 1000, 0.034964]) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node3(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.038461, p0(displayUnit = "Pa") = 4668, userdemand = [0, 0.038461; 1000, 0.038461]) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38105e6, k = 0.000903, kc = 1, m_flow_start = 0.032768, n = n, pin_start(displayUnit = "Pa") = 4668, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.032393306, u_nom = 4.72733) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node8(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.041083, p0(displayUnit = "Pa") = 3739, userdemand = [0, 0.041083; 1000, 0.041083]) annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe9(Di = 0.08, L = 600, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe2.hin_start, k = 0.001100, kc = 1, m_flow_start = 0.011125, n = n, pin_start(displayUnit = "Pa") = 4694.999999999999, pout_start(displayUnit = "Pa") = 3930, rho_nom = 0.032580671, u_nom = 3.05) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node7(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.008741, p0(displayUnit = "Pa") = 3930, userdemand = [0, 0.008741; 1000, 0.008741]) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(Di = 0.08, L = 200, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe3.hin_start, k = 0.000873, kc = 1, m_flow_start = 0.023889, n = n, pin_start(displayUnit = "Pa") = 3930, pout_start(displayUnit = "Pa") = 2815, rho_nom = 0.02727200, u_nom = 6.559995) annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node9(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.009615, p0(displayUnit = "Pa") = 2815, userdemand = [0, 0.009615; 1000, 0.009615]) annotation(
    Placement(visible = true, transformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(Di = 0.08, L = 200, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = Pipe.pipe3.hin_start, k = 0.000615, kc = 1, m_flow_start = 0.0458, n = n, pin_start(displayUnit = "Pa") = 2815, pout_start(displayUnit = "Pa") = 2414, rho_nom = 0.019534524, u_nom = 4.006497) annotation(
    Placement(visible = true, transformation(origin = {70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node10(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.008304, p0(displayUnit = "Pa") = 2414, userdemand = [0, 0.008304; 1000, 0.008304]) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceP1.outlet, pipe1.inlet) annotation(
    Line(points = {{-30, 110}, {-30, 80}}, color = {182, 109, 49}));
  connect(node2.inlet, pipe2.inlet) annotation(
    Line(points = {{-30, 40}, {-30, 20}}, color = {182, 109, 49}));
  connect(pipe1.outlet, node2.inlet) annotation(
    Line(points = {{-30, 60}, {-30, 40}}, color = {182, 109, 49}));
  connect(pipe4.inlet, node2.inlet) annotation(
    Line(points = {{-60, 40}, {-30, 40}}, color = {182, 109, 49}));
  connect(node5.inlet, pipe4.outlet) annotation(
    Line(points = {{-100, 40}, {-80, 40}}, color = {182, 109, 49}));
  connect(node2.inlet, pipe3.inlet) annotation(
    Line(points = {{-30, 40}, {0, 40}}, color = {182, 109, 49}));
  connect(pipe3.outlet, node4.inlet) annotation(
    Line(points = {{20, 40}, {40, 40}}, color = {182, 109, 49}));
  connect(pipe2.outlet, node3.inlet) annotation(
    Line(points = {{-30, 0}, {-30, -20}}, color = {182, 109, 49}));
  connect(node3.inlet, pipe7.inlet) annotation(
    Line(points = {{-30, -20}, {-30, -40}}, color = {182, 109, 49}));
  connect(pipe7.outlet, node8.inlet) annotation(
    Line(points = {{-30, -60}, {-30, -80}}, color = {182, 109, 49}));
  connect(node4.inlet, pipe9.inlet) annotation(
    Line(points = {{40, 40}, {40, 20}}, color = {182, 109, 49}));
  connect(pipe9.outlet, node7.inlet) annotation(
    Line(points = {{40, 0}, {40, -20}}, color = {182, 109, 49}));
  connect(pipe12.outlet, node9.inlet) annotation(
    Line(points = {{40, -60}, {40, -80}}, color = {182, 109, 49}));
  connect(node7.inlet, pipe12.inlet) annotation(
    Line(points = {{40, -20}, {40, -40}}, color = {182, 109, 49}));
  connect(node9.inlet, pipe13.inlet) annotation(
    Line(points = {{40, -80}, {60, -80}}, color = {182, 109, 49}));
  connect(pipe13.outlet, node10.inlet) annotation(
    Line(points = {{80, -80}, {100, -80}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}})),
    experiment(StartTime = 0, StopTime = 22000, Tolerance = 1e-06, Interval = 44));
end PaperCaseII;
