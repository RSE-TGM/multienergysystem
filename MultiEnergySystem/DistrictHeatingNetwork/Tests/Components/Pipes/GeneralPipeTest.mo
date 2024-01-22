within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model GeneralPipeTest "Comparison between all different pipe models"
  extends Modelica.Icons.Example;
  // Nominal fluid parameters
  parameter Types.Pressure pin_start = 3e5;
  parameter Types.Pressure pout_start = 2.9e5;
  parameter Types.Temperature Tin_start = 80 + 273.15;
  parameter Types.Temperature Tout_start = 75 + 273.15;
  parameter Types.Pressure pout_start2 = 2.8e5;
  parameter Types.SpecificEnthalpy hin_start = 3e5;
  parameter Types.SpecificEnthalpy hout_start = 2.9e5;
  parameter Types.MassFlowRate m_flow_start = 16.545;
  parameter Types.Velocity u_start = 3;
  parameter Types.Density rho_start = 971.892;
  // Nominal pipe parameters
  parameter Integer n = 5 "Number of volumes";
  parameter Types.Length L = 50;
  parameter Types.Length Di = 0.085;
  parameter Types.Length H= 0.01;
  parameter Types.Length t = 2e-3;
  parameter Types.Length tIns = 60e-3;
  parameter Types.PerUnit cf = 0.004;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0 = Tout_start, p0(displayUnit = "Pa") = pout_start, use_in_p0 = true) annotation (
    Placement(visible = true, transformation(origin={-130,100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe1_A(
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    cf=cf,
    h=H,
    hin_start=hin_start,
    k=Pipe.S100.k,
    kc=1,
    m_flow_start=m_flow_start,
    n=n,
    pin_start=pin_start,
    pout_start=pout_start,
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start) annotation (Placement(visible=true, transformation(
        origin={-170,100},
        extent={{-14,-14},{14,14}},
        rotation=0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={290,150},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_set(duration = 50, height = -1.5*m_flow_start, offset = m_flow_start, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={-50,50},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(R = 1e-6,T0 = Tin_start, h0 = hin_start, p0 = pin_start) annotation (
    Placement(visible = true, transformation(origin={-220,60},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe2_A(
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    allowFlowReversal=system.allowFlowReversal,
    q_m3h_start=4.5,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
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
    u_nom=u_start,
    gamma_nom=5)
    annotation (Placement(visible=true, transformation(extent={{-184,6},{-156,34}}, rotation=0)));
  Sources.SinkMassFlow sinkmassflow(G = 0, T0 = Tout_start, m_flow0 = m_flow_start, p0 = pout_start, pin_start = pout_start, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin={-130,20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT wall_FixedT(Twall = system.T_amb, n = n) annotation (
    Placement(visible = true, transformation(origin={-250,60},  extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe3_A(
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
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start) annotation (Placement(visible=true, transformation(
        origin={-170,-20},
        extent={{-14,-14},{14,14}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe4_A(
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
    pin_start=pout_start,
    pout_start=pout_start2,
    rho_nom=rho_start,
    t=t,
    tIns=tIns,
    u_nom=u_start) annotation (Placement(visible=true, transformation(
        origin={-122,-20},
        extent={{-14,-14},{14,14}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkmassflow2(G = 0, T0 = Tout_start, m_flow0 = m_flow_start, p0 = pout_start2, pin_start = pout_start2, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin={-84,-20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp pout_set(duration = 50, height = 0.1*pout_start, offset = pout_start, startTime = 150) annotation (
    Placement(visible = true, transformation(origin={-100,130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.SourcePressure                                          sourceP1(
    R=1e-6,
    T0=Tin_start,
    h0=hin_start,
    p0=pin_start)                                                                                                                  annotation (
    Placement(visible = true, transformation(origin={-220,-100},extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkMassFlow sinkmassflow1(
    G=0,
    T0=Tout_start,
    m_flow0=m_flow_start,
    p0=pout_start,
    pin_start=pout_start,
    use_in_m_flow=true)                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={-114,-100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe2_B(
    thermalInertia=true,
    Di=Di,
    L=L,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    allowFlowReversal=system.allowFlowReversal,
    q_m3h_start=4.5,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
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
    u_nom=u_start,
    gamma_nom=5)   annotation (Placement(visible=true, transformation(extent={{-184,-114},{-156,-86}},
          rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe3_B(
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
    u_nom=u_start,
    gamma_nom=5)   annotation (Placement(visible=true, transformation(
        origin={-170,-140},
        extent={{-14,-14},{14,14}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV pipe4_B(
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
    u_nom=u_start,
    gamma_nom=5)   annotation (Placement(visible=true, transformation(
        origin={-118,-140},
        extent={{-14,-14},{14,14}},
        rotation=0)));
  Sources.SinkMassFlow                                          sinkmassflow3(
    G=0,
    T0=Tout_start,
    m_flow0=m_flow_start,
    p0=pout_start2,
    pin_start=pout_start2,
    use_in_m_flow=true)                                                                                                                                                                        annotation (
    Placement(visible = true, transformation(origin={-74,-140},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV metalWallFV(
    Nw=n,
    M=218.655,
    cm=445,
    WallRes=true,
    UA_ext=0.294*L,
    UA_int=6148*L,
    Tstartbar=353.15,
    Tstart1=353.15,
    TstartN=352.15) annotation (Placement(transformation(extent={{-180,52},{-160,32}})));
equation
  connect(pipe1_A.outlet, sinkP.inlet)
    annotation (Line(points={{-156,100},{-140,100}}, color={140,56,54}));
  connect(sourceP.outlet, pipe1_A.inlet)
    annotation (Line(points={{-210,60},{-200,60},{-200,100},{-184,100}}, color={140,56,54}));
  connect(m_flow_set.y, sinkmassflow.in_m_flow) annotation (
    Line(points={{-61,50},{-136,50},{-136,25}},      color = {0, 0, 127}));
  connect(pipe3_A.outlet, pipe4_A.inlet)
    annotation (Line(points={{-156,-20},{-136,-20}}, color={140,56,54}));
  connect(pipe4_A.outlet, sinkmassflow2.inlet)
    annotation (Line(points={{-108,-20},{-94,-20}}, color={140,56,54}));
  connect(sinkmassflow2.in_m_flow, m_flow_set.y) annotation (
    Line(points={{-90,-15},{-90,50},{-61,50}},                             color = {0, 0, 127}));
  connect(pout_set.y, sinkP.in_p0) annotation (
    Line(points={{-111,130},{-134,130},{-134,108.4}},
                                                  color = {0, 0, 127}));
  connect(wall_FixedT.MultiPort, pipe1_A.wall) annotation (Line(points={{-250,60},{-236,60},{-236,118},
          {-170,118},{-170,106.02}}, color={255,238,44}));
  connect(wall_FixedT.MultiPort, pipe3_A.wall) annotation (Line(points={{-250,60},{-236,60},{-236,0},
          {-170,0},{-170,-13.98}}, color={255,238,44}));
  connect(pipe4_A.wall, pipe3_A.wall)
    annotation (Line(points={{-122,-13.98},{-122,0},{-170,0},{-170,-13.98}}, color={255,238,44}));
  connect(sourceP1.outlet, pipe2_B.inlet) annotation (Line(
      points={{-210,-100},{-184,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3_B.inlet, pipe2_B.inlet) annotation (Line(
      points={{-184,-140},{-200,-140},{-200,-100},{-184,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe2_B.outlet, sinkmassflow1.inlet) annotation (Line(
      points={{-156,-100},{-124,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe3_B.outlet, pipe4_B.inlet) annotation (Line(
      points={{-156,-140},{-132,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe4_B.outlet, sinkmassflow3.inlet) annotation (Line(
      points={{-104,-140},{-84,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkmassflow1.in_m_flow, m_flow_set.y) annotation (Line(points={{-120,-95},{-120,-40},{-72,
          -40},{-72,50},{-61,50}},
        color={0,0,127}));
  connect(sinkmassflow3.in_m_flow, m_flow_set.y) annotation (Line(points={{-80,-135},{-80,-40},{-72,
          -40},{-72,50},{-61,50}},
        color={0,0,127}));
  connect(pipe2_A.outlet, sinkmassflow.inlet)
    annotation (Line(
      points={{-156,20},{-140,20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pipe2_A.inlet) annotation (Line(
      points={{-210,60},{-200,60},{-200,20},{-184,20}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP.outlet, pipe3_A.inlet) annotation (Line(
      points={{-210,60},{-200,60},{-200,-20},{-184,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(wall_FixedT.MultiPort, metalWallFV.ext) annotation (Line(points={{-250,60},{-240,60},{
          -240,72},{-170,72},{-170,45.1}}, color={255,238,44}));
  connect(metalWallFV.int, pipe2_A.wall)
    annotation (Line(points={{-170,39},{-170,26.02}}, color={255,238,44}));
  annotation (
    Documentation(info = "<html><head></head><body>Base test to verify the difference between considering linear or non-linear drop pressure.</body></html>"),
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.166889),
    Diagram(coordinateSystem(extent={{-300,-160},{300,160}})));
end GeneralPipeTest;
