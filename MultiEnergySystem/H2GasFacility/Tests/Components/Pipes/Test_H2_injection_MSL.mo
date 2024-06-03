within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_H2_injection_MSL
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX]= {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};
  parameter Types.MassFraction X_start_H2[nX] = {0.8, 0.04, 0.04, 0.005, 0.01, 0.005, 0.1};
  parameter Types.MassFraction X_net[nX] = {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};
  parameter Integer n = 3 "Number of volumes in Flow1DFV";

  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=3,
    useLumpedPressure=false)              annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-31,11})));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
                                              nPorts=1)
    annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    use_m_flow_in=true,
    use_X_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    m_flow=-Pipe.pipe1.m_flow_start,                                           nPorts=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,32})));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    m_flow=-Pipe.pipe1.m_flow_start,                                          nPorts=1) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={72,-16})));
  Modelica.Fluid.Pipes.DynamicPipe pipe2(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=3,
    useLumpedPressure=false)              annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={33,31})));
  Modelica.Fluid.Pipes.DynamicPipe pipe3(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=3,
    useLumpedPressure=false)              annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={35,-15})));
  Modelica.Blocks.Sources.Ramp m_flow_in1(
    duration=0,
    height=0.05,
    offset=0,
    startTime=50)  annotation (Placement(visible=true, transformation(
        origin={-88,-32},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 50 then
        X_net else X_start_H2)
    annotation (Placement(transformation(extent={{-94,-76},{-74,-56}})));
equation
  connect(pipe3.port_b, boundary3.ports[1])
    annotation (Line(points={{52,-15},{52,-16},{62,-16}}, color={0,127,255}));
  connect(pipe2.port_b, boundary2.ports[1])
    annotation (Line(points={{50,31},{50,32},{64,32}}, color={0,127,255}));
  connect(pipe1.port_b, pipe2.port_a) annotation (Line(points={{-14,11},{10,11},
          {10,31},{16,31}}, color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a) annotation (Line(points={{-14,11},{10,11},
          {10,-15},{18,-15}}, color={0,127,255}));
  connect(boundary1.ports[1], pipe2.port_a) annotation (Line(points={{-20,-60},
          {2,-60},{2,10},{10,10},{10,31},{16,31}},color={0,127,255}));
  connect(m_flow_in1.y, boundary1.m_flow_in) annotation (Line(points={{-77,-32},
          {-48,-32},{-48,-52},{-40,-52}}, color={0,0,127}));
  connect(realExpression.y, boundary1.X_in) annotation (Line(points={{-73,-66},{
          -70,-66},{-70,-64},{-42,-64}}, color={0,0,127}));
  connect(boundary.ports[1], pipe1.port_a) annotation (Line(points={{-74,12},{-61,
          12},{-61,11},{-48,11}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Test_H2_injection_MSL;
