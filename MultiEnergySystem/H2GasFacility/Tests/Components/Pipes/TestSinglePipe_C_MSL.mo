within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_C_MSL
  replaceable model Medium = Modelica.Media.IdealGases.SingleGases.CH4;
  parameter Integer n = 5 "Number of volumes in each pipeline";
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1};
  Modelica.Fluid.Pipes.DynamicPipe pipe(
    redeclare package Medium = Medium,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.k,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=n) annotation (Placement(transformation(extent={{4,-24},{36,8}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{-36,-18},{-16,2}})));
  Modelica.Fluid.Sources.FixedBoundary boundary1(
    redeclare package Medium = Medium,
    use_p=true,
    p=49000,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-8})));
  Modelica.Blocks.Sources.Ramp m_flow_in(
    duration=0,
    height=0.01,
    offset=Pipe.pipe1.m_flow_start,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-72,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp T_in(
    duration=20,
    height=0,
    offset=15 + 273.15,
    startTime=150) annotation (Placement(visible=true, transformation(
        origin={-74,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  inner Modelica.Fluid.System system(
    T_ambient=288.15,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    use_eps_Re=false)
    annotation (Placement(transformation(extent={{66,70},{86,90}})));
equation
  connect(boundary.ports[1], pipe.port_a)
    annotation (Line(points={{-16,-8},{4,-8}}, color={0,127,255}));
  connect(pipe.port_b, boundary1.ports[1])
    annotation (Line(points={{36,-8},{60,-8}}, color={0,127,255}));
  connect(m_flow_in.y, boundary.m_flow_in)
    annotation (Line(points={{-61,30},{-36,30},{-36,0}}, color={0,0,127}));
  connect(T_in.y, boundary.T_in) annotation (Line(points={{-63,0},{-56,0},{-56,
          -4},{-38,-4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"));
end TestSinglePipe_C_MSL;
