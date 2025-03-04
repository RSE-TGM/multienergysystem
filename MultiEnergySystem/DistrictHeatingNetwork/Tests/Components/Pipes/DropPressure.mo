within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model DropPressure
  extends Modelica.Icons.Example;
  // Nominal fluid parameters
  parameter Types.Pressure pin_start = 3e5;
  parameter Types.Pressure pout_start = 2.9e5;
  parameter Types.Temperature Tin_start = 80 + 273.15;
  parameter Types.Temperature Tout_start = 79 + 273.15;
  parameter Types.Pressure pout_start2 = 2.8e5;
  parameter Types.SpecificEnthalpy hin_start = 3e5;
  parameter Types.SpecificEnthalpy hout_start = 2.9e5;
  parameter Types.MassFlowRate m_flow_start = 16.545;
  parameter Types.Velocity u_start = 3;
  parameter Types.Density rho_start = 971.892;
  // Nominal pipe parameters
  parameter Integer n = 5 "Number of volumes";
  parameter Types.Length L = 10;
  parameter Types.Length Di = 0.085;
  parameter Types.Length H= 0.01;
  parameter Types.Length t = 2e-3;
  parameter Types.Length tIns = 60e-3;
  parameter Types.PerUnit cf = 0.004;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0 = Tout_start, p0(displayUnit = "Pa") = pout_start, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin={40,80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe1(Di = Di, L = L, Tin_start = Tin_start, Tout_start = Tin_start, allowFlowReversal = system.allowFlowReversal,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,                                                                                                             cf = cf, h = H, k = Pipe.S100.k, kc = 1, m_flow_start = m_flow_start, n = n, pin_start = pin_start, pout_start = pout_start, rho_nom = rho_start, t = t, tIns = tIns, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin={0,80},    extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={90,150},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 50, height = -1.5*m_flow_start, offset = m_flow_start, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={70,30},     extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(R = 1e-6,T0 = Tin_start, h0 = hin_start, p0 = pin_start) annotation (
    Placement(visible = true, transformation(origin={-50,40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe2(Di = Di, L = L, Tin_start = Tin_start, Tout_start = Tin_start, allowFlowReversal = system.allowFlowReversal,
    q_m3h_start=4.5,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,                                                                                                             cf = cf,                                   h = H, k = Pipe.S100.k, kc = 1,                              n = n, pin_start = pin_start, pout_start = pout_start, rho_nom = rho_start, t = t, tIns = tIns, u_nom = u_start,
    gamma_nom=5)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                   extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Sources.SinkMassFlow sinkmassflow(G = 0, T0 = Tout_start, m_flow0 = m_flow_start, p0 = pout_start, pin_start = pout_start, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin={40,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall = system.T_amb, n = n) annotation (
    Placement(visible = true, transformation(origin={-80,40},   extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe3(Di = Di, L = L, Tin_start = Tin_start, Tout_start = Tin_start, allowFlowReversal = system.allowFlowReversal,
    q_m3h_start=4.5,                                                                                                                                                                         cf = cf,                                   h = H, k = Pipe.S100.k, kc = 1,                              n = n, pin_start = pin_start, pout_start = pout_start, rho_nom = rho_start, t = t, tIns = tIns, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin={0,-40},    extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe4(Di = Di, L = L, Tin_start = Tin_start, Tout_start = Tin_start, allowFlowReversal = system.allowFlowReversal,
    q_m3h_start=4.5,                                                                                                                                                                         cf = cf,                                   h = H, k = Pipe.S100.k, kc = 1,                              n = n, pin_start = pout_start, pout_start = pout_start2, rho_nom = rho_start, t = t, tIns = tIns, u_nom = u_start) annotation (
    Placement(visible = true, transformation(origin={48,-40},    extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkmassflow2(G = 0, T0 = Tout_start, m_flow0 = m_flow_start, p0 = pout_start2, pin_start = pout_start2, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin={86,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp pout_set(duration = 50, height = 0.1*pout_start, offset = pout_start, startTime = 150) annotation (
    Placement(visible = true, transformation(origin={70,110},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.SourcePressure                                          sourceP1(
    R=1e-6,
    T0=Tin_start,
    h0=hin_start,
    p0=pin_start)                                                                                                                  annotation (
    Placement(visible = true, transformation(origin={-40,-80},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkMassFlow sinkmassflow1(
    G=0,
    T0=Tout_start,
    m_flow0=m_flow_start,
    p0=pout_start,
    pin_start=pout_start,
    use_in_m_flow=true)                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={38,-80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe5(
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    allowFlowReversal=system.allowFlowReversal,
    q_m3h_start=4.5,
    cf=cf,
    h=H,
    hin_start=hin_start,
    k=Pipe.S100.k,
    kc=1,
    n=n,
    pin_start=pin_start,
    pout_start=pout_start,
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(                   extent={{-14,-94},
            {14,-66}},                                                                           rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe6(
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    allowFlowReversal=system.allowFlowReversal,
    q_m3h_start=4.5,
    cf=cf,
    h=H,
    hin_start=hin_start,
    k=Pipe.S100.k,
    kc=1,
    n=n,
    pin_start=pin_start,
    pout_start=pout_start,
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={0,-120},   extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe7(
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    allowFlowReversal=system.allowFlowReversal,
    cf=cf,
    h=H,
    hin_start=hin_start,
    k=Pipe.S100.k,
    kc=1,
    m_flow_start=m_flow_start,
    n=n,
    pin_start=pout_start,
    pout_start=pout_start2,
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={48,-120},   extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Sources.SinkMassFlow                                          sinkmassflow3(
    G=0,
    T0=Tout_start,
    m_flow0=m_flow_start,
    p0=pout_start2,
    pin_start=pout_start2,
    use_in_m_flow=true)                                                                                                                                                                        annotation (
    Placement(visible = true, transformation(origin={84,-120},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe1.outlet, sinkP.inlet) annotation (
    Line(points={{14,80},{30,80}},      color = {140, 56, 54}));
  connect(sourceP.outlet, pipe1.inlet) annotation (
    Line(points={{-40,40},{-30,40},{-30,80},{-14,80}},        color = {140, 56, 54}));
  connect(sourceP.outlet, pipe2.inlet) annotation (
    Line(points={{-40,40},{-30,40},{-30,0},{-14,0}},            color = {140, 56, 54}));
  connect(pipe2.outlet, sinkmassflow.inlet) annotation (
    Line(points={{14,0},{30,0}},          color = {140, 56, 54}));
  connect(m_flow_set.y, sinkmassflow.in_m_flow) annotation (
    Line(points={{59,30},{34,30},{34,5}},            color = {0, 0, 127}));
  connect(sourceP.outlet, pipe3.inlet) annotation (
    Line(points={{-40,40},{-30,40},{-30,-40},{-14,-40}},        color = {140, 56, 54}));
  connect(pipe3.outlet, pipe4.inlet) annotation (
    Line(points={{14,-40},{34,-40}},      color = {140, 56, 54}));
  connect(pipe4.outlet, sinkmassflow2.inlet) annotation (
    Line(points={{62,-40},{76,-40}},      color = {140, 56, 54}));
  connect(sinkmassflow2.in_m_flow, m_flow_set.y) annotation (
    Line(points={{80,-35},{80,14},{50,14},{50,30},{59,30}},                color = {0, 0, 127}));
  connect(pout_set.y, sinkP.in_p0) annotation (
    Line(points={{59,110},{36,110},{36,88.4}},    color = {0, 0, 127}));
  connect(wall_FixedT.MultiPort, pipe1.wall) annotation (
    Line(points={{-80,40},{-66,40},{-66,98},{0,98},{0,85.74}},       color = {255, 238, 44}));
  connect(wall_FixedT.MultiPort, pipe2.wall) annotation (
    Line(points={{-80,40},{-66,40},{-66,10},{0,10},{0,5.74}},           color = {255, 238, 44}));
  connect(wall_FixedT.MultiPort, pipe3.wall) annotation (
    Line(points={{-80,40},{-66,40},{-66,-20},{0,-20},{0,-34.26}},       color = {255, 238, 44}));
  connect(pipe4.wall, pipe3.wall) annotation (
    Line(points={{48,-34.26},{48,-20},{0,-20},{0,-34.26}},    color = {255, 238, 44}));
  connect(sourceP1.outlet, pipe5.inlet) annotation (Line(
      points={{-30,-80},{-14,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe6.inlet, pipe5.inlet) annotation (Line(
      points={{-14,-120},{-24,-120},{-24,-80},{-14,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe5.outlet, sinkmassflow1.inlet) annotation (Line(
      points={{14,-80},{28,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe6.outlet, pipe7.inlet) annotation (Line(
      points={{14,-120},{34,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe7.outlet, sinkmassflow3.inlet) annotation (Line(
      points={{62,-120},{74,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkmassflow1.in_m_flow, m_flow_set.y) annotation (Line(points={{32,-75},
          {32,-62},{98,-62},{98,-20},{80,-20},{80,14},{50,14},{50,30},{59,30}},
        color={0,0,127}));
  connect(sinkmassflow3.in_m_flow, m_flow_set.y) annotation (Line(points={{78,-115},
          {78,-62},{98,-62},{98,-20},{80,-20},{80,14},{50,14},{50,30},{59,30}},
        color={0,0,127}));
  annotation (
    Documentation(info = "<html><head></head><body>Base test to verify the difference between considering linear or non-linear drop pressure.</body></html>"),
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.166889),
    Diagram(coordinateSystem(extent={{-100,-160},{100,160}})));
end DropPressure;
