within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL_A
  "PaperCaseI implemented using the Modelica Standard Library"
  extends PaperCaseI_MSL(system(
      energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
      momentumDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial));

  Modelica.Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    use_m_flow_in=true,
    T=288.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-78,-42},{-66,-30}})));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=0.5,
    height=0.001,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-92,-32},     extent={{-6,-6},
            {6,6}},                                                                                 rotation = 0)));
equation



  connect(m_flow_H2.y, boundary.m_flow_in) annotation (Line(points={{-85.4,-32},{-85.4,-31.2},{-78,-31.2}},                      color={0,0,127}));
  connect(boundary.ports[1], pipe2.port_b) annotation (Line(points={{-66,-36},{
          -64,-36},{-64,-35},{-61,-35},{-61,-14},{-17,-14},{-17,3},{-10,3},{-10,
          6}},                                                                                                                                             color={0,127,255}));
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
      StopTime=100,
      Interval=1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_MSL_A;
