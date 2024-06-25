within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL_NG_H2_A
  "PaperCaseI implemented using the Modelica Standard Library"
  extends PaperCaseI_MSL(redeclare package Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.SimpleNaturalGas_H2,
      system(
      energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial),
    SourceP1(X=X_net),
    User5(X=X_net),
    pipe4(X_start=X_net),
    pipe3(X_start=X_net),
    User4(X=X_net),
    User15(X=X_net),
    User14(X=X_net),
    User12(X=X_net),
    User13(X=X_net),
    User16(X=X_net),
    User17(X=X_net),
    User10(X=X_net),
    pipe20(X_start=X_net),
    pipe19(X_start=X_net),
    pipe13(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe12(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe14(X_start=X_net),
    User11(X=X_net),
    pipe15(X_start=X_net),
    pipe16(X_start=X_net),
    pipe17(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe18(X_start=X_net),
    pipe6(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe7(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe2(X_start=X_net),
    pipe5(X_start=X_net, modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe21(X_start=X_net),
    pipe10(X_start=X_net),
    pipe8(X_start=X_net),
    SourceP2(X=X_net),
    pipe9(modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe11(modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b),
    pipe1(modelStructure=Modelica.Fluid.Types.ModelStructure.a_v_b));
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX]= {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};
  parameter Types.MassFraction X_start_H2[nX] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1};
  parameter Types.MassFraction X_net[nX] = {0.9, 0.04, 0.04, 0.005, 0.01, 0.005, 0.0};

  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    T=288.15,
    X=X_start_H2,
    nPorts=1)
    annotation (Placement(transformation(extent={{-80,-35},{-70,-25}})));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=0,
    height=0.01,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-92,-26},     extent={{-6,-6},
            {6,6}},                                                                                 rotation = 0)));
equation

  connect(m_flow_H2.y, boundary.m_flow_in) annotation (Line(points={{-85.4,-26},{-80,-26}}, color={0,0,127}));
  connect(boundary.ports[1], pipe5.port_b)
    annotation (Line(points={{-70,-30},{-59,-30},{-59,-3},{-16,-3},{-16,4.16334e-16},{-16.5,4.16334e-16},{-16.5,0},{-23,0}}, color={0,127,255}));
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
    Diagram(coordinateSystem(preserveAspectRatio=false, grid={1,1})),
    experiment(
      StopTime=4000,
      Interval=1,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_MSL_NG_H2_A;
