within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model inj_validation
  extends
    MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi.two_pipes_validation(
    GRM_4(
      m_flow0=0.03,
      X0={1,0},
      massflowratedemand=[0,0.03; 30000,0.03]),
    idealPressureSensor(X_start={1,0}, m_flow_start=0.03),
    sourcePressure(X0={1,0}),
    valveLinearOpening(
      X_start={1,0}, m_flow_nom=0.09,
      A_v=6.05e-6),
    sds1(
      L=150,
      H=0,
      Di=0.13,
      n=3),
    s1(
      L=150,
      H=0,
      Di=0.13,
      n=3));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(G = 1e-12,
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    T0=288.15,
    X0={0,1},                                                                                                                               computeEnthalpyWithFixedPressure = true,
    m_flow0=0.0001,
    p0=460000,
    use_in_m_flow0=true)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin = {-184, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    offset=0*1e-3,
    duration=10,
    height=0.003,
    startTime=4000)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-231,90},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=10,
    height=-0.003,
    offset=0,
    startTime=5600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-231,126},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-172,98},{-152,118}})));
equation
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-220,126},{-184,126},{
          -184,114},{-174,114}},
                        color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-220,90},{-184,90},{
          -184,102},{-174,102}},
                        color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{-151,108},{
          -148,108},{-148,53},{-178,53}}, color={0,0,127}));
  connect(Immissione_1.outlet, s1.outlet) annotation (Line(
      points={{-194,58},{-202,58},{-202,26},{-184,26}},
      color={182,109,49},
      thickness=0.5));
  annotation (uses(Modelica(version="4.0.0")), experiment(
      StopTime=10000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end inj_validation;
