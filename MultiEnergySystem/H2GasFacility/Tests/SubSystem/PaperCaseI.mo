within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseI
  replaceable model Medium = H2GasFacility.Media.RealGases.CH4Papay;
  
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Types.MassFraction X_start[1] = {1};
  
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(redeclare model Medium = Medium, Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start, X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(redeclare model Medium = Medium, Di = Pipe.pipe2.Di, L = Pipe.pipe2.L, Tin_start = Pipe.pipe2.Tin_start, Tout_start = Pipe.pipe2.Tout_start, X_start = X_start, hin_start = Pipe.pipe2.hin_start, k = Pipe.pipe2.k, kc = 1, m_flow_start = Pipe.pipe2.m_flow_start, n = n, pin_start = Pipe.pipe2.pin_start, pout_start = Pipe.pipe2.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(redeclare model Medium = Medium, Di = Pipe.pipe3.Di, L = Pipe.pipe3.L, Tin_start = Pipe.pipe3.Tin_start, Tout_start = Pipe.pipe3.Tout_start, X_start = X_start, hin_start = Pipe.pipe3.hin_start, k = Pipe.pipe3.k, kc = 1, m_flow_start = Pipe.pipe3.m_flow_start, n = n, pin_start = Pipe.pipe3.pin_start, pout_start = Pipe.pipe3.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(redeclare model Medium = Medium, Di = Pipe.pipe4.Di, L = Pipe.pipe4.L, Tin_start = Pipe.pipe4.Tin_start, Tout_start = Pipe.pipe4.Tout_start, X_start = X_start, hin_start = Pipe.pipe4.hin_start, k = Pipe.pipe4.k, kc = 1, m_flow_start = Pipe.pipe4.m_flow_start, n = n, pin_start = Pipe.pipe4.pin_start, pout_start = Pipe.pipe4.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe5(redeclare model Medium = Medium, Di = Pipe.pipe5.Di, L = Pipe.pipe5.L, Tin_start = Pipe.pipe5.Tin_start, Tout_start = Pipe.pipe5.Tout_start, X_start = X_start, hin_start = Pipe.pipe5.hin_start, k = Pipe.pipe5.k, kc = 1, m_flow_start = Pipe.pipe5.m_flow_start, n = n, pin_start = Pipe.pipe5.pin_start, pout_start = Pipe.pipe5.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe6(redeclare model Medium = Medium, Di = Pipe.pipe6.Di, L = Pipe.pipe6.L, Tin_start = Pipe.pipe6.Tin_start, Tout_start = Pipe.pipe6.Tout_start, X_start = X_start, hin_start = Pipe.pipe6.hin_start, k = Pipe.pipe6.k, kc = 1, m_flow_start = Pipe.pipe6.m_flow_start, n = n, pin_start = Pipe.pipe6.pin_start, pout_start = Pipe.pipe6.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(redeclare model Medium = Medium, Di = Pipe.pipe7.Di, L = Pipe.pipe7.L, Tin_start = Pipe.pipe7.Tin_start, Tout_start = Pipe.pipe7.Tout_start, X_start = X_start, hin_start = Pipe.pipe7.hin_start, k = Pipe.pipe7.k, kc = 1, m_flow_start = Pipe.pipe7.m_flow_start, n = n, pin_start = Pipe.pipe7.pin_start, pout_start = Pipe.pipe7.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe17(redeclare model Medium = Medium, Di = Pipe.pipe17.Di, L = Pipe.pipe17.L, Tin_start = Pipe.pipe17.Tin_start, Tout_start = Pipe.pipe17.Tout_start, X_start = X_start, hin_start = Pipe.pipe17.hin_start, k = Pipe.pipe17.k, kc = 1, m_flow_start = Pipe.pipe17.m_flow_start, n = n, pin_start = Pipe.pipe17.pin_start, pout_start = Pipe.pipe17.pout_start) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe18(redeclare model Medium = Medium, Di = Pipe.pipe18.Di, L = Pipe.pipe18.L, Tin_start = Pipe.pipe18.Tin_start, Tout_start = Pipe.pipe18.Tout_start, X_start = X_start, hin_start = Pipe.pipe18.hin_start, k = Pipe.pipe18.k, kc = 1, m_flow_start = Pipe.pipe18.m_flow_start, n = n, pin_start = Pipe.pipe18.pin_start, pout_start = Pipe.pipe18.pout_start) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user4(redeclare model Medium = Medium, m_flow0 = 0.044645108) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.System system annotation(
    Placement(visible = true, transformation(origin = {130, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user5(redeclare model Medium = Medium, m_flow0 = 0.03493965) annotation(
    Placement(visible = true, transformation(origin = {-88, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe19(redeclare model Medium = Medium, Di = Pipe.pipe19.Di, L = Pipe.pipe19.L, Tin_start = Pipe.pipe19.Tin_start, Tout_start = Pipe.pipe19.Tout_start, X_start = X_start, hin_start = Pipe.pipe19.hin_start, k = Pipe.pipe19.k, kc = 1, m_flow_start = Pipe.pipe19.m_flow_start, n = n, pin_start = Pipe.pipe19.pin_start, pout_start = Pipe.pipe19.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(redeclare model Medium = Medium, Di = Pipe.pipe13.Di, L = Pipe.pipe13.L, Tin_start = Pipe.pipe13.Tin_start, Tout_start = Pipe.pipe13.Tout_start, X_start = X_start, hin_start = Pipe.pipe13.hin_start, k = Pipe.pipe13.k, kc = 1, m_flow_start = Pipe.pipe13.m_flow_start, n = n, pin_start = Pipe.pipe13.pin_start, pout_start = Pipe.pipe13.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe20(redeclare model Medium = Medium, Di = Pipe.pipe20.Di, L = Pipe.pipe20.L, Tin_start = Pipe.pipe20.Tin_start, Tout_start = Pipe.pipe20.Tout_start, X_start = X_start, hin_start = Pipe.pipe20.hin_start, k = Pipe.pipe20.k, kc = 1, m_flow_start = Pipe.pipe20.m_flow_start, n = n, pin_start = Pipe.pipe20.pin_start, pout_start = Pipe.pipe20.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-64, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(redeclare model Medium = Medium, Di = Pipe.pipe12.Di, L = Pipe.pipe12.L, Tin_start = Pipe.pipe12.Tin_start, Tout_start = Pipe.pipe12.Tout_start, X_start = X_start, hin_start = Pipe.pipe12.hin_start, k = Pipe.pipe12.k, kc = 1, m_flow_start = Pipe.pipe12.m_flow_start, n = n, pin_start = Pipe.pipe12.pin_start, pout_start = Pipe.pipe12.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe14(redeclare model Medium = Medium, Di = Pipe.pipe14.Di, L = Pipe.pipe14.L, Tin_start = Pipe.pipe14.Tin_start, Tout_start = Pipe.pipe14.Tout_start, X_start = X_start, hin_start = Pipe.pipe14.hin_start, k = Pipe.pipe14.k, kc = 1, m_flow_start = Pipe.pipe14.m_flow_start, n = n, pin_start = Pipe.pipe14.pin_start, pout_start = Pipe.pipe14.pout_start) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe15(redeclare model Medium = Medium, Di = Pipe.pipe15.Di, L = Pipe.pipe15.L, Tin_start = Pipe.pipe15.Tin_start, Tout_start = Pipe.pipe15.Tout_start, X_start = X_start, hin_start = Pipe.pipe15.hin_start, k = Pipe.pipe15.k, kc = 1, m_flow_start = Pipe.pipe15.m_flow_start, n = n, pin_start = Pipe.pipe15.pin_start, pout_start = Pipe.pipe15.pout_start) annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe8(redeclare model Medium = Medium, Di = Pipe.pipe8.Di, L = Pipe.pipe8.L, Tin_start = Pipe.pipe8.Tin_start, Tout_start = Pipe.pipe8.Tout_start, X_start = X_start, hin_start = Pipe.pipe8.hin_start, k = Pipe.pipe8.k, kc = 1, m_flow_start = Pipe.pipe8.m_flow_start, n = n, pin_start = Pipe.pipe8.pin_start, pout_start = Pipe.pipe8.pout_start) annotation(
    Placement(visible = true, transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe16(redeclare model Medium = Medium, Di = Pipe.pipe16.Di, L = Pipe.pipe16.L, Tin_start = Pipe.pipe16.Tin_start, Tout_start = Pipe.pipe16.Tout_start, X_start = X_start, hin_start = Pipe.pipe16.hin_start, k = Pipe.pipe16.k, kc = 1, m_flow_start = Pipe.pipe16.m_flow_start, n = n, pin_start = Pipe.pipe16.pin_start, pout_start = Pipe.pipe16.pout_start) annotation(
    Placement(visible = true, transformation(origin = {130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user10(redeclare model Medium = Medium, m_flow0 = 0.040762925) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user11(redeclare model Medium = Medium, m_flow0 = 0.009705458) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user12(redeclare model Medium = Medium, m_flow0 = 0.014558188) annotation(
    Placement(visible = true, transformation(origin = {130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user13(redeclare model Medium = Medium, m_flow0 = 0.006793821) annotation(
    Placement(visible = true, transformation(origin = {130, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user16(redeclare model Medium = Medium, m_flow0 = 0.012723856) annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user17(redeclare model Medium = Medium, m_flow0 = 0.010676004) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = {1}, p0 = 0.5e5) annotation(
    Placement(visible = true, transformation(origin = {-40, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user15(redeclare model Medium = Medium, m_flow0 = 0.017469825) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user14(redeclare model Medium = Medium, m_flow0 = 0.008734913) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP18(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = {1}, p0 = 0.5e5) annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe9(redeclare model Medium = Medium, Di = Pipe.pipe9.Di, L = Pipe.pipe9.L, Tin_start = Pipe.pipe9.Tin_start, Tout_start = Pipe.pipe9.Tout_start, X_start = X_start, hin_start = Pipe.pipe9.hin_start, k = Pipe.pipe9.k, kc = 1, m_flow_start = Pipe.pipe9.m_flow_start, n = n, pin_start = Pipe.pipe9.pin_start, pout_start = Pipe.pipe9.pout_start) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe11(redeclare model Medium = Medium, Di = Pipe.pipe11.Di, L = Pipe.pipe11.L, Tin_start = Pipe.pipe11.Tin_start, Tout_start = Pipe.pipe11.Tout_start, X_start = X_start, hin_start = Pipe.pipe11.hin_start, k = Pipe.pipe11.k, kc = 1, m_flow_start = Pipe.pipe11.m_flow_start, n = n, pin_start = Pipe.pipe11.pin_start, pout_start = Pipe.pipe11.pout_start) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(user10.inlet, pipe13.inlet) annotation(
    Line(points = {{-90, -30}, {-70, -30}}, color = {182, 109, 49}));
  connect(pipe16.outlet, user13.inlet) annotation(
    Line(points = {{130, -60}, {130, -80}}, color = {182, 109, 49}));
  connect(sourceP18.outlet, pipe8.inlet) annotation(
    Line(points = {{-100, 10}, {-88, 10}, {-88, 20}}, color = {182, 109, 49}));
  connect(pipe5.inlet, sourceP18.outlet) annotation(
    Line(points = {{-70, 10}, {-100, 10}}, color = {182, 109, 49}));
  connect(user5.inlet, pipe8.outlet) annotation(
    Line(points = {{-88, 50}, {-88, 40}}, color = {182, 109, 49}));
  connect(user5.inlet, pipe4.outlet) annotation(
    Line(points = {{-88, 50}, {-70, 50}}, color = {182, 109, 49}));
  connect(pipe4.inlet, pipe2.inlet) annotation(
    Line(points = {{-50, 50}, {-40, 50}, {-40, 40}}, color = {182, 109, 49}));
  connect(pipe3.inlet, pipe2.inlet) annotation(
    Line(points = {{-30, 50}, {-40, 50}, {-40, 40}}, color = {182, 109, 49}));
  connect(pipe1.outlet, pipe2.inlet) annotation(
    Line(points = {{-40, 60}, {-40, 40}}, color = {182, 109, 49}));
  connect(pipe3.outlet, user4.inlet) annotation(
    Line(points = {{-10, 50}, {10, 50}}, color = {182, 109, 49}));
  connect(pipe2.outlet, pipe7.inlet) annotation(
    Line(points = {{-40, 20}, {-40, 0}}, color = {182, 109, 49}));
  connect(pipe5.outlet, pipe7.inlet) annotation(
    Line(points = {{-50, 10}, {-40, 10}, {-40, 0}}, color = {182, 109, 49}));
  connect(pipe6.inlet, pipe7.inlet) annotation(
    Line(points = {{-30, 10}, {-40, 10}, {-40, 0}}, color = {182, 109, 49}));
  connect(user16.inlet, pipe20.inlet) annotation(
    Line(points = {{-40, -80}, {-54, -80}}, color = {182, 109, 49}));
  connect(pipe20.outlet, user17.inlet) annotation(
    Line(points = {{-74, -80}, {-90, -80}}, color = {182, 109, 49}));
  connect(pipe19.outlet, user16.inlet) annotation(
    Line(points = {{-40, -60}, {-40, -80}}, color = {182, 109, 49}));
  connect(pipe7.outlet, pipe19.inlet) annotation(
    Line(points = {{-40, -20}, {-40, -40}}, color = {182, 109, 49}));
  connect(pipe13.outlet, pipe19.inlet) annotation(
    Line(points = {{-50, -30}, {-40, -30}, {-40, -40}}, color = {182, 109, 49}));
  connect(pipe12.outlet, pipe19.inlet) annotation(
    Line(points = {{-30, -30}, {-40, -30}, {-40, -40}}, color = {182, 109, 49}));
  connect(pipe12.inlet, pipe14.inlet) annotation(
    Line(points = {{-10, -30}, {30, -30}}, color = {182, 109, 49}));
  connect(user4.inlet, pipe9.inlet) annotation(
    Line(points = {{10, 50}, {10, 40}}, color = {182, 109, 49}));
  connect(pipe6.outlet, pipe17.inlet) annotation(
    Line(points = {{-10, 10}, {30, 10}}, color = {182, 109, 49}));
  connect(pipe9.outlet, pipe17.inlet) annotation(
    Line(points = {{10, 20}, {10, 10}, {30, 10}}, color = {182, 109, 49}));
  connect(pipe9.outlet, pipe11.inlet) annotation(
    Line(points = {{10, 20}, {10, 0}}, color = {182, 109, 49}));
  connect(pipe11.outlet, pipe14.inlet) annotation(
    Line(points = {{10, -20}, {10, -30}, {30, -30}}, color = {182, 109, 49}));
  connect(pipe15.outlet, user12.inlet) annotation(
    Line(points = {{110, -30}, {130, -30}}, color = {182, 109, 49}));
  connect(user12.inlet, pipe16.inlet) annotation(
    Line(points = {{130, -30}, {130, -40}}, color = {182, 109, 49}));
  connect(sourceP1.outlet, pipe1.inlet) annotation(
    Line(points = {{-40, 90}, {-40, 80}}, color = {182, 109, 49}));
  connect(pipe17.outlet, user14.inlet) annotation(
    Line(points = {{50, 10}, {70, 10}}, color = {182, 109, 49}));
  connect(user14.inlet, pipe18.inlet) annotation(
    Line(points = {{70, 10}, {70, 20}}, color = {182, 109, 49}));
  connect(pipe18.outlet, user15.inlet) annotation(
    Line(points = {{70, 40}, {70, 50}}, color = {182, 109, 49}));
  connect(pipe14.outlet, user11.inlet) annotation(
    Line(points = {{50, -30}, {70, -30}}, color = {182, 109, 49}));
  connect(user11.inlet, pipe15.inlet) annotation(
    Line(points = {{70, -30}, {90, -30}}, color = {182, 109, 49}));

annotation(
    Diagram(coordinateSystem(extent = {{-140, -120}, {140, 120}})));
end PaperCaseI;
