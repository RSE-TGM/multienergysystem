within MultiEnergySystem.H2GasFacility.Export.FMU;
model inj_validation_exportable "Export FMU Version"
  extends
    MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi.two_pipes_validation(
    GRM_4(
      m_flow0=0.03,
      X0={1,0},
      massflowratedemand=[0,0.03; 30000,0.03]),
    idealPressureSensor(X_start={1,0}, m_flow_start=0.03),
    sourcePressure(X0={1,0}),
    valveLinearOpening(
      X_start={1,0}, m_flow_nom=0.09),
    sds1(
      L=1500,
      H=0,
      Di=0.13,
      n=15),
    s1(
      L=1500,
      H=0,
      Di=0.13,
      n=15));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(G = 1e-12,
    redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    T0=288.15,
    X0={0,1},                                                                                                                               computeEnthalpyWithFixedPressure = true,
    m_flow0=0.0001,
    p0=460000,
    use_in_m_flow0=true)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin = {-184, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(Immissione_1.outlet, s1.outlet) annotation (Line(
      points={{-194,58},{-202,58},{-202,26},{-184,26}},
      color={182,109,49},
      thickness=0.5));
  annotation (                                 experiment(
      StopTime=30000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end inj_validation_exportable;
