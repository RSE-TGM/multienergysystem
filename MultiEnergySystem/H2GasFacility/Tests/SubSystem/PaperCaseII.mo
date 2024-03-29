within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseII "Distribution network example from [2]"
  extends Modelica.Icons.Example;
  //replaceable model Medium = H2GasFacility.Media.IdealGases.NG5_H2;
  replaceable model Medium = H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Boolean quasiStatic = false;
  parameter Boolean computeTransport = true;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.LowPressure;
  parameter Integer n = 11 "Number of volumes in each pipeline";
  parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X;
  parameter Types.MassFraction X_start_H2[7] = X_start;
  parameter Types.MassFlowRate m_flow_H2_ref = 0.0016666*0;
  parameter Integer duration = 0;
  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={190,132},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.H2GasFacility.Sources.SourcePressure node1(
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start,
    p0(displayUnit="Pa") = 7499.999999999999) annotation (Placement(visible=true,
        transformation(
        origin={-80,120},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(Di = 0.16, L = 50, redeclare model
            Medium =                                                                                           Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013676, k_linear = 3341.245823, kc = 1, m_flow_start = 0.266667, n = n, pin_start(displayUnit = "Pa") = 7499.999999999999, pout_start(displayUnit = "Pa") = 6608.999999999999, rho_nom = 0.0520458, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-80,90},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(Di = 0.16, L = 500, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0011957, k_linear = 15533.71641, kc = 1, m_flow_start = 0.124954, n = n, pin_start(displayUnit = "Pa") = 6608.999999999999, pout_start(displayUnit = "Pa") = 4668, rho_nom = 0.045862759, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-80,30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(Di = 0.11, L = 500, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013452, k_linear = 41747.55164, kc = 1, m_flow_start = 0.045847, n = n, pin_start(displayUnit = "Pa") = 6608.999999999999, pout_start(displayUnit = "Pa") = 4694.999999999999, rho_nom = 0.045862759, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-50,60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(Di = 0.11, L = 500, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0013330, k_linear = 47153.38245, kc = 1, m_flow_start = 0.052255, n = n, pin_start(displayUnit = "Pa") = 6608.999999999999, pout_start(displayUnit = "Pa") = 4694.999999999999, rho_nom = 0.045862759, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-110,60},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe5(Di = 0.11, L = 600, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009341, k_linear = 29824.94057, kc = 1, m_flow_start = 0.027762, n = n, pin_start(displayUnit = "Pa") = 4756.87, pout_start(displayUnit = "Pa") = 3840, rho_nom = 0.032393306, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-110,0},      extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe6(Di = 0.11, L = 600, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009427, k_linear = 28286.69989, kc = 1, m_flow_start = 0.02609, n = n, pin_start(displayUnit = "Pa") = 4668, pout_start(displayUnit = "Pa") = 3930, rho_nom = 0.032393306, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-50,0},      extent={{-10,-10},{10,10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(Di = 0.11, L = 500, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009027, k_linear = 28350.83008, kc = 1, m_flow_start = 0.032768, n = n, pin_start(displayUnit = "Pa") = 4668, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.032393306, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-80,-30},    extent={{-10,-10},{10,10}},      rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe8(Di = 0.08, L = 600, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009843, k_linear = 43715.06378, kc = 1, m_flow_start = 0.006977, n = n, pin_start(displayUnit = "Pa") = 4145, pout_start(displayUnit = "Pa") = 3840, rho_nom = 0.028763979, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-140,30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe9(Di = 0.08, L = 600, redeclare model
            Medium =                                                                                            Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0010998, k_linear = 68764.04494, kc = 1, m_flow_start = 0.011125, n = n, pin_start(displayUnit = "Pa") = 4694.999999999999, pout_start(displayUnit = "Pa") = 3930, rho_nom = 0.032580671, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-20,30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe10(Di = 0.08, L = 780, redeclare model
            Medium =                                                                                             Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0010075, k_linear = 30149.25373, kc = 1, m_flow_start = 0.00335, n = n, pin_start(displayUnit = "Pa") = 3840, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.02664745, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-140,-30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe11(Di = 0.08, L = 780, redeclare model
            Medium =                                                                                             Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.0009843, k_linear = 40509.01379, kc = 1, m_flow_start = 0.004715, n = n, pin_start(displayUnit = "Pa") = 3930, pout_start(displayUnit = "Pa") = 3739, rho_nom = 0.02727200, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={-20,-30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(Di = 0.08, L = 200, redeclare model
            Medium =                                                                                             Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000873, k_linear = 46674.20152, kc = 1, m_flow_start = 0.023889, n = n, pin_start(displayUnit = "Pa") = 3930, pout_start(displayUnit = "Pa") = 2815, rho_nom = 0.02727200, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={10,0},      extent={{-10,-10},{10,10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(Di = 0.08, L = 200, redeclare model
            Medium =                                                                                             Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000615, k_linear = 27762.39269, kc = 1, m_flow_start = 0.014444, n = n, pin_start(displayUnit = "Pa") = 2815, pout_start(displayUnit = "Pa") = 2414, rho_nom = 0.019534524, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={70,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe14(Di = 0.08, L = 200, redeclare model
            Medium =                                                                                             Medium, Tin_start = 15 + 273.15, Tout_start = 15 + 273.15, X_start = X_start, hin_start = -4.38097e6, k = 0.000529, k_linear = 11782.0324, kc = 1, m_flow_start = 0.006111, n = n, pin_start(displayUnit = "Pa") = 2414, pout_start(displayUnit = "Pa") = 2342, rho_nom = 0.016751808, quasiStatic=quasiStatic, momentum = momentum, computeTransport = computeTransport) annotation (
    Placement(visible = true, transformation(origin={130,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node2(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.043611, p0(displayUnit = "Pa") = 6608.999999999999, massflowratedemand = [0, 0.043611; 1000, 0.043611]) annotation (
    Placement(visible = true, transformation(origin={-80,60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node3(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.038333, p0(displayUnit = "Pa") = 4668, massflowratedemand = [0, 0.038333; 1000, 0.038333]) annotation (
    Placement(visible = true, transformation(origin={-80,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node4(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.034722, p0(displayUnit = "Pa") = 4694.999999999999, massflowratedemand = [0, 0.034722; 1000, 0.034722]) annotation (
    Placement(visible = true, transformation(origin={-20,60},    extent = {{-10, -10}, {10, 10}}, rotation=90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node5(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.045278, p0(displayUnit = "Pa") = 4145, massflowratedemand = [0, 0.045278; 1000, 0.045278]) annotation (
    Placement(visible = true, transformation(origin={-140,60},    extent = {{-10, -10}, {10, 10}}, rotation=-90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node6(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.031389, p0(displayUnit = "Pa") = 3840, massflowratedemand = [0, 0.031389; 1000, 0.031389]) annotation (
    Placement(visible = true, transformation(origin={-140,0},      extent = {{-10, -10}, {10, 10}}, rotation=-90)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node7(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.008611, p0(displayUnit = "Pa") = 3930, massflowratedemand = [0, 0.008611; 1000, 0.008611]) annotation (
    Placement(visible = true, transformation(origin={-20,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node8(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.040833, p0(displayUnit = "Pa") = 3739, massflowratedemand = [0, 0.040833; 1000, 0.040833]) annotation (
    Placement(visible = true, transformation(origin={-80,-64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node9(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.009444, p0(displayUnit = "Pa") = 2815, massflowratedemand = [0, 0.009444; 1000, 0.009444]) annotation (
    Placement(visible = true, transformation(origin={40,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node10(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.008304, p0(displayUnit = "Pa") = 2414, massflowratedemand = [0, 0.008333; 1000, 0.008333]) annotation (
    Placement(visible = true, transformation(origin={100,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser node11(redeclare model Medium = Medium, X0 = X_start, m_flow0 = 0.006111, p0(displayUnit = "Pa") = 2342, massflowratedemand = [0, 0.006111; 1000, 0.006111]) annotation (
    Placement(visible = true, transformation(origin={160,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceH2_A(G = 0, redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = X_start_H2, m_flow0 = m_flow_H2_ref, p0( displayUnit = "Pa")= 7500, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin={-6,-62},   extent={{10,-10},{-10,10}},      rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(duration = duration, height = m_flow_H2_ref, offset = 0, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={32,-40},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(pipe13.outlet, node10.inlet) annotation (
    Line(points={{80,0},{100,0}},          color = {182, 109, 49}));
  connect(node10.inlet, pipe14.inlet) annotation (
    Line(points={{100,0},{120,0}},          color = {182, 109, 49}));
  connect(pipe14.outlet, node11.inlet) annotation (
    Line(points={{140,0},{160,0}},          color = {182, 109, 49}));
  connect(node9.inlet, pipe13.inlet) annotation (
    Line(points={{40,0},{60,0}},          color = {182, 109, 49}));
  connect(pipe12.outlet, node9.inlet) annotation (
    Line(points={{20,0},{40,0}},          color = {182, 109, 49}));
  connect(pipe11.outlet, node8.inlet) annotation (
    Line(points={{-20,-40},{-20,-50},{-80,-50},{-80,-64}},             color = {182, 109, 49}));
  connect(pipe7.outlet, node8.inlet) annotation (
    Line(points={{-80,-40},{-80,-64}},       color = {182, 109, 49}));
  connect(node1.outlet, pipe1.inlet)
    annotation (Line(points={{-80,110},{-80,100}}, color={182,109,49}));
  connect(pipe1.outlet, node2.inlet) annotation (
    Line(points={{-80,80},{-80,60}},      color = {182, 109, 49}));
  connect(node2.inlet, pipe2.inlet) annotation (
    Line(points={{-80,60},{-80,40}},      color = {182, 109, 49}));
  connect(pipe2.outlet, node3.inlet) annotation (
    Line(points={{-80,20},{-80,0}},        color = {182, 109, 49}));
  connect(node2.inlet, pipe3.inlet) annotation (
    Line(points={{-80,60},{-60,60}},      color = {182, 109, 49}));
  connect(pipe3.outlet, node4.inlet) annotation (
    Line(points={{-40,60},{-20,60}},      color = {182, 109, 49}));
  connect(node3.inlet, pipe7.inlet) annotation (
    Line(points={{-80,0},{-80,-20}},        color = {182, 109, 49}));
  connect(pipe4.inlet, node2.inlet) annotation (
    Line(points={{-100,60},{-80,60}},      color = {182, 109, 49}));
  connect(pipe4.outlet, node5.inlet) annotation (
    Line(points={{-120,60},{-140,60}},      color = {182, 109, 49}));
  connect(node3.inlet, pipe6.inlet) annotation (
    Line(points={{-80,0},{-60,0}},          color = {182, 109, 49}));
  connect(pipe6.outlet, node7.inlet) annotation (
    Line(points={{-40,0},{-20,0}},          color = {182, 109, 49}));
  connect(node4.inlet, pipe9.inlet) annotation (
    Line(points={{-20,60},{-20,40}},      color = {182, 109, 49}));
  connect(pipe9.outlet, node7.inlet) annotation (
    Line(points={{-20,20},{-20,0}},        color = {182, 109, 49}));
  connect(pipe8.inlet, node5.inlet) annotation (
    Line(points={{-140,40},{-140,60}},      color = {182, 109, 49}));
  connect(pipe8.outlet, node6.inlet) annotation (
    Line(points={{-140,20},{-140,0}},        color = {182, 109, 49}));
  connect(pipe11.inlet, node7.inlet) annotation (
    Line(points={{-20,-20},{-20,0}},        color = {182, 109, 49}));
  connect(node7.inlet, pipe12.inlet) annotation (
    Line(points={{-20,0},{0,0}},          color = {182, 109, 49}));
  connect(pipe5.inlet, node3.inlet) annotation (
    Line(points={{-100,0},{-80,0}},          color = {182, 109, 49}));
  connect(pipe5.outlet, node6.inlet) annotation (
    Line(points={{-120,0},{-140,0}},          color = {182, 109, 49}));
  connect(node6.inlet, pipe10.inlet) annotation (
    Line(points={{-140,0},{-140,-20}},        color = {182, 109, 49}));
  connect(node8.inlet, pipe10.outlet) annotation (
    Line(points={{-80,-64},{-80,-50},{-140,-50},{-140,-40}},             color = {182, 109, 49}));
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation (
    Line(points={{21,-40},{0,-40},{0,-57}},       color = {0, 0, 127}));
  connect(sourceH2_A.outlet, node3.inlet) annotation (
    Line(points={{-16,-62},{-68,-62},{-68,0},{-80,0}},                 color = {182, 109, 49},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}})),
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.5),
    Documentation(info="<html>
<p><span style=\"font-family: Arial;\">The following test model takes the information of the study case in paper&nbsp;<a href=\"https://www.sciencedirect.com/science/article/pii/S0360319921018541\">[</a><a href=\"https://www.sciencedirect.com/science/article/pii/S0306261915007321\">2</a><a href=\"https://www.sciencedirect.com/science/article/pii/S0360319921018541\">]</a>. This case corresponds to a&nbsp;<b>low-pressure</b>&nbsp;distribution network with 0.075 bar as working pressure.</span></p>
<p><img src=\"modelica://MultiEnergySystem/../../../Lavoro/3. ReteGas/Figures/LowPressureNaturalGasGridLayout_Abeseykera.PNG\"/></p>
</html>"));
end PaperCaseII;
