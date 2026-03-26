within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;

model prova2
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi.PROVA(massFractionDynamicBalance = true, s1(m_flow_start = 0.4110, pin_start = 4.93, pout_start = 4.93, pin_nom = 4.93, L = 200, H = 0, Di = 0.16, X_start = {1, 0}), sds1(m_flow_start = 0.4110, pin_start = 4.93, pout_start = 4.93, pin_nom = 4.93, L = 200, H = 0, Di = 0.16, X_start = {1, 0}), GRM_4(p0 = 4.93, m_flow0 = 0.4110, X0 = {1, 0}));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(G = 1e-12, redeclare model Medium = Medium, T0 = 288.15, X0 = {1, 0}, computeEnthalpyWithFixedPressure = true, m_flow0 = 0.005, p0 = 4.93, use_in_m_flow0 = false) annotation(
    Placement(transformation(origin = {-172, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(Di = 0.008, redeclare model Gas = Medium, H = 0, L = 100, X_start = {1, 0}, cm = Data.PipelineData_2i.s3.cm, computeInertialTerm = computeInertialTerm, constantFrictionFactor = constantFrictionFactor, hctype = hctype, k = Data.PipelineData_2i.s3.k, kappa = Data.PipelineData_2i.s3.kappa, lambdam = Data.PipelineData_2i.s3.lambdam, m_flow_start = 0.4110, massFractionDynamicBalance = massFractionDynamicBalance, momentum = momentum, n = nV, pin_start (displayUnit = "bar")= 4.93, pout_start (displayUnit = "bar")= 4.93, rho_nom = rho_nom, rhom = Data.PipelineData_2i.s3.rhom, pin_nom = 4.93, ptilde(each displayUnit = "bar")) annotation(
    Placement(transformation(origin = {-200, 51}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
equation
  connect(s3.inlet, Immissione_1.outlet) annotation(
    Line(points = {{-200, 62}, {-200, 76}, {-182, 76}}, color = {182, 109, 49}));
  connect(s3.outlet, sds1.inlet) annotation(
    Line(points = {{-200, 42}, {-216, 42}, {-216, 26}}, color = {182, 109, 49}));
end prova2;
