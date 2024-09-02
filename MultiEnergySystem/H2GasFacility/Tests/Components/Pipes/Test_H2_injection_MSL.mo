within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_H2_injection_MSL
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX]= {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};
  parameter Types.MassFraction X_start_H2[nX] = {0.8, 0.04, 0.04, 0.005, 0.01, 0.005, 0.1};
  parameter Types.MassFraction X_net[nX] = {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};
  parameter Integer n = 10 "Number of volumes in Flow1DFV";

  Modelica.Fluid.Pipes.DynamicPipe pipe1(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    length=Pipe.pipe1.L,
    diameter=Pipe.pipe1.Di,
    roughness=Pipe.pipe1.kappa,
    p_a_start=Pipe.pipe1.pin_start,
    p_b_start=Pipe.pipe1.pout_start,
    T_start=Pipe.pipe1.Tin_start,
    X_start=X_net,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=n,
    modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b)
                                          annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={-47,13})));
  Modelica.Fluid.Sources.Boundary_pT sourcePressure(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    use_p_in=true,
    p=150000,
    T=288.15,
    X=X_net,
    nPorts=1) annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
  Modelica.Fluid.Sources.MassFlowSource_T sourceMassFlow1(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    use_m_flow_in=true,
    use_X_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  Modelica.Fluid.Sources.MassFlowSource_T sinkMassFlow2(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    m_flow=-Pipe.pipe1.m_flow_start,
    T=Pipe.pipe1.Tout_start,
    X=X_net,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,32})));
  Modelica.Fluid.Sources.MassFlowSource_T sinkMassFlow3(
    redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
    m_flow=-Pipe.pipe1.m_flow_start,
    T=Pipe.pipe1.Tout_start,
    X=X_net,
    nPorts=1) annotation (Placement(transformation(
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
    X_start=X_net,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=n,
    modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b,
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
    X_start=X_net,
    m_flow_start=Pipe.pipe1.m_flow_start,
    nNodes=n,
    useLumpedPressure=false)              annotation (Placement(transformation(
        extent={{-17,-17},{17,17}},
        rotation=0,
        origin={33,-15})));
  Modelica.Blocks.Sources.Ramp m_flow_in1(
    duration=0,
    height=0.01,
    offset=0,
    startTime=250) annotation (Placement(visible=true, transformation(
        origin={-88,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 50 then
        X_start_H2 else X_start_H2)
    annotation (Placement(transformation(extent={{-98,-54},{-78,-34}})));
  inner Modelica.Fluid.System system(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial)
    annotation (Placement(transformation(extent={{-92,76},{-72,96}})));
  Modelica.Blocks.Sources.Ramp pin(
    duration=0,
    height=0.1e5*0,
    offset=1.5e5,
    startTime=50) annotation (Placement(visible=true, transformation(
        origin={-118,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(pipe3.port_b, sinkMassFlow3.ports[1]) annotation (Line(points={{50,-15},{50,-16},{62,-16}}, color={0,127,255}));
  connect(pipe2.port_b, sinkMassFlow2.ports[1]) annotation (Line(points={{50,31},{50,32},{64,32}}, color={0,127,255}));
  connect(m_flow_in1.y, sourceMassFlow1.m_flow_in) annotation (Line(points={{-77,-20},{-48,-20},{-48,-32},{-40,-32}}, color={0,0,127}));
  connect(realExpression.y, sourceMassFlow1.X_in) annotation (Line(points={{-77,-44},{-42,-44}}, color={0,0,127}));
  connect(sourcePressure.ports[1], pipe1.port_a) annotation (Line(points={{-74,12},{-74,13},{-64,13}}, color={0,127,255}));
  connect(pin.y, sourcePressure.p_in) annotation (Line(points={{-107,20},{-96,20}}, color={0,0,127}));
  connect(pipe1.port_b, pipe2.port_a) annotation (Line(points={{-30,13},{-22,13},{-22,12},{-10,12},{-10,31},{16,31}}, color={0,127,255}));
  connect(pipe1.port_b, pipe3.port_a) annotation (Line(points={{-30,13},{-20,13},{-20,12},{-10,12},{-10,-15},{16,-15}}, color={0,127,255}));
  connect(sourceMassFlow1.ports[1], pipe2.port_a) annotation (Line(points={{-20,-40},{-16,-40},{-16,12},{-10,12},{-10,31},{16,31}}, color={0,127,255}));
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
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Test_H2_injection_MSL;
