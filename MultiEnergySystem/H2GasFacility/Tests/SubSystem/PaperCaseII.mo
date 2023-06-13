within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseII
  extends Modelica.Icons.Example;
  //replaceable model Medium = H2GasFacility.Media.IdealGases.CH4;
  replaceable model Medium = H2GasFacility.Media.IdealGases.NG4_H2;
  parameter Integer n = 15 "Number of volumes in each pipeline";
  //parameter Types.MassFraction X_start[1] = {1};
  parameter Types.MassFraction X_start[5] = {0.862424, 0.107765, 0.0263392, 0.00347176, 0};
  parameter Types.MassFraction X_start_H2[5] = {0.0, 0.0, 0.0, 0.0, 1};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.0042;
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {150, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(Di = 0.08, L = 200, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000615, kc = 1, m_flow_start = 0.0458, n = n, pin_start(displayUnit = "Pa") = 2815, pout_start(displayUnit = "Pa") = 2414, rho_nom = 0.019534524, u_nom = 4.006497) annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node10(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.008304, p0(displayUnit = "Pa") = 2414, userdemand = [0, 0.008304; 1000, 0.008304]) annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe14(Di = 0.08, L = 200, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000529, kc = 1, m_flow_start = 0.006111, n = n, pin_start(displayUnit = "Pa") = 2414, pout_start(displayUnit = "Pa") = 2342, rho_nom = 0.016751808, u_nom = 1.701679) annotation(
    Placement(visible = true, transformation(origin = {130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node11(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.006119, p0(displayUnit = "Pa") = 2342, userdemand = [0, 0.006119; 1000, 0.006119]) annotation(
    Placement(visible = true, transformation(origin = {160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(Di = 0.08, L = 200, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000873, kc = 1, m_flow_start = 0.023889, n = n, pin_start(displayUnit = "Pa") = 3930, pout_start(displayUnit = "Pa") = 2815, rho_nom = 0.02727200, u_nom = 6.559995) annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node9(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.009615, p0(displayUnit = "Pa") = 2815, userdemand = [0, 0.009615; 1000, 0.009615]) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe11(Di = 0.08, L = 780, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009843, kc = 1, m_flow_start = 0.004715, n = n, pin_start(displayUnit = "Pa") = 3930, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.02727200, u_nom = 1.29598) annotation(
    Placement(visible = true, transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node8(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.041083, p0(displayUnit = "Pa") = 3739, userdemand = [0, 0.041083; 1000, 0.041083]) annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009027, kc = 1, m_flow_start = 0.032768, n = n, pin_start(displayUnit = "Pa") = 4668, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.032393306, u_nom = 4.72733) annotation(
    Placement(visible = true, transformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe10(Di = 0.08, L = 780, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0010075, kc = 1, m_flow_start = 0.00335, n = n, pin_start(displayUnit = "Pa") = 3840, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.02664745, u_nom = 0.920718) annotation(
    Placement(visible = true, transformation(origin = {-140, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source3(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = X_start, p0(displayUnit = "Pa") = 3840) annotation(
    Placement(visible = true, transformation(origin = {-166, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare model Medium = Medium, R = 0.001, T0 = 15 + 273.15, X0 = X_start, p0(displayUnit = "Pa") = 3930) annotation(
    Placement(visible = true, transformation(origin = {-40, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP11_1(redeclare model Medium = Medium, R = 0.001, T0 = 15 + 273.15, X0 = X_start, p0(displayUnit = "Pa") = 3930) annotation(
    Placement(visible = true, transformation(origin = {-58, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = X_start, p0(displayUnit = "Pa") = 7499.999999999999) annotation(
    Placement(visible = true, transformation(origin = {-80, 130}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(Di = 0.16, L = 50, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013676, kc = 1, m_flow_start = 0.266667, n = n, pin_start(displayUnit = "Pa") = 7499.999999999999, pout_start(displayUnit = "Pa") = 6608.999999999999, rho_nom = 0.0520458, u_nom = 17.757623) annotation(
    Placement(visible = true, transformation(origin = {-80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node2(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.057799, p0(displayUnit = "Pa") = 6608.999999999999, userdemand = [0, 0.057799; 1000, 0.057799]) annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(Di = 0.16, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0011957, kc = 1, m_flow_start = 0.124954, n = n, pin_start(displayUnit = "Pa") = 6608.999999999999, pout_start(displayUnit = "Pa") = 4668, rho_nom = 0.045862759, u_nom = 8.380916) annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node3(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.092186, p0(displayUnit = "Pa") = 4668, userdemand = [0, 0.092186; 1000, 0.092186]) annotation(
    Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013452, kc = 1, m_flow_start = 0.045847, n = n, pin_start(displayUnit = "Pa") = 6609, pout_start(displayUnit = "Pa") = 4695, rho_nom = 0.045862759, u_nom = 6.505865) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node4(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.038461, p0(displayUnit = "Pa") = 4694.999999999999, userdemand = [0, 0.038461; 1000, 0.038461]) annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node5(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.045453, p0(displayUnit = "Pa") = 4145, userdemand = [0, 0.045453; 1000, 0.045453]) annotation(
    Placement(visible = true, transformation(origin = {-140, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(Di = 0.11, L = 500, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013330, kc = 1, m_flow_start = 0.052255, n = n, pin_start(displayUnit = "Pa") = 6609, pout_start(displayUnit = "Pa") = 4695, rho_nom = 0.045862759, u_nom = 7.573584) annotation(
    Placement(visible = true, transformation(origin = {-110, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe8(Di = 0.08, L = 600, redeclare model Medium = Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009843, kc = 1, m_flow_start = 0.01, n = n, pin_start(displayUnit = "Pa") = 4145, pout_start(displayUnit = "Pa") = 3840, rho_nom = 0.028763979, u_nom = 1.911895) annotation(
    Placement(visible = true, transformation(origin = {-140, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node6(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.031468, p0(displayUnit = "Pa") = 3840, userdemand = [0, 0.031468; 1000, 0.031468]) annotation(
    Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe13.outlet, node10.inlet) annotation(
    Line(points = {{80, -40}, {100, -40}}, color = {182, 109, 49}));
  connect(node10.inlet, pipe14.inlet) annotation(
    Line(points = {{100, -40}, {120, -40}}, color = {182, 109, 49}));
  connect(pipe14.outlet, node11.inlet) annotation(
    Line(points = {{140, -40}, {160, -40}}, color = {182, 109, 49}));
  connect(node9.inlet, pipe13.inlet) annotation(
    Line(points = {{40, -40}, {60, -40}}, color = {182, 109, 49}));
  connect(pipe12.outlet, node9.inlet) annotation(
    Line(points = {{20, -40}, {40, -40}}, color = {182, 109, 49}));
  connect(pipe11.outlet, node8.inlet) annotation(
    Line(points = {{-20, -80}, {-20, -100}, {-80, -100}, {-80, -120}}, color = {182, 109, 49}));
  connect(pipe7.outlet, node8.inlet) annotation(
    Line(points = {{-80, -80}, {-80, -120}}, color = {182, 109, 49}));
  connect(source3.outlet, pipe10.inlet) annotation(
    Line(points = {{-156, -20}, {-140, -20}, {-140, -60}}, color = {182, 109, 49}));
  connect(pipe10.outlet, node8.inlet) annotation(
    Line(points = {{-140, -80}, {-140, -100}, {-80, -100}, {-80, -120}}, color = {182, 109, 49}));
  connect(sourceP11_1.outlet, pipe11.inlet) annotation(
    Line(points = {{-48, -46}, {-20, -46}, {-20, -60}}, color = {182, 109, 49}));
  connect(sourceP1.outlet, pipe12.inlet) annotation(
    Line(points = {{-30, -18}, {-18, -18}, {-18, -40}, {0, -40}}, color = {182, 109, 49}));
  connect(source.outlet, pipe1.inlet) annotation(
    Line(points = {{-80, 120}, {-80, 100}}, color = {182, 109, 49}));
  connect(pipe1.outlet, node2.inlet) annotation(
    Line(points = {{-80, 80}, {-80, 60}}, color = {182, 109, 49}));
  connect(node2.inlet, pipe2.inlet) annotation(
    Line(points = {{-80, 60}, {-80, 40}}, color = {182, 109, 49}));
  connect(pipe2.outlet, node3.inlet) annotation(
    Line(points = {{-80, 20}, {-80, -20}}, color = {182, 109, 49}));
  connect(node2.inlet, pipe3.inlet) annotation(
    Line(points = {{-80, 60}, {-60, 60}}, color = {182, 109, 49}));
  connect(pipe3.outlet, node4.inlet) annotation(
    Line(points = {{-40, 60}, {-20, 60}}, color = {182, 109, 49}));
  connect(node3.inlet, pipe7.inlet) annotation(
    Line(points = {{-80, -20}, {-80, -60}}, color = {182, 109, 49}));
  connect(pipe4.inlet, node2.inlet) annotation(
    Line(points = {{-100, 60}, {-80, 60}}, color = {182, 109, 49}));
  connect(pipe4.outlet, node5.inlet) annotation(
    Line(points = {{-120, 60}, {-140, 60}}, color = {182, 109, 49}));
  connect(node5.inlet, pipe8.inlet) annotation(
    Line(points = {{-140, 60}, {-140, 40}}, color = {182, 109, 49}));
  connect(pipe8.outlet, node6.inlet) annotation(
    Line(points = {{-140, 20}, {-140, 0}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}})),
    experiment(StartTime = 0, StopTime = 22000, Tolerance = 1e-06, Interval = 44));
end PaperCaseII;
