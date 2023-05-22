within MultiEnergySystem.H2GasFacility.Tests.SubSystem;

model PaperCaseI_A
  extends Tests.SubSystem.PaperCaseI;
  parameter Types.MassFraction X_start_H2[2] = {0,1};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.0042*0;
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceH2_A(redeclare model Medium = Medium(posDom = 2), T0 = 15 + 273.15, X0 = X_start_H2, m_flow0 = m_flow_H2_ref, p0 = 0.5e5, use_in_m_flow0 = true)  annotation(
    Placement(visible = true, transformation(origin = {-114, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(duration = 50, height = m_flow_H2_ref, offset = 0, startTime = 50)  annotation(
    Placement(visible = true, transformation(origin = {-140, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow_H2.y, sourceH2_A.in_m_flow0) annotation(
    Line(points = {{-128, -28}, {-120, -28}, {-120, -36}}, color = {0, 0, 127}));
  connect(sourceH2_A.outlet, pipe7.inlet) annotation(
    Line(points = {{-104, -42}, {-100, -42}, {-100, -12}, {-38, -12}, {-38, -6}, {-30, -6}, {-30, -10}}, color = {182, 109, 49}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -120}, {160, 120}})),
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.3));
end PaperCaseI_A;
