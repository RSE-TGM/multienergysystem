within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model inj_validation
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi.two_pipes_validation(
    GRM_4(
      m_flow0=0.4,
      X0={1,0},
      massflowratedemand=[0,0.4; 30000,0.4]),
    idealPressureSensor(X_start={1,0}, m_flow_start=0.03),
    sourcePressure(X0={1,0}),
    valveLinearOpening(
      X_start={1,0}, m_flow_nom=0.09));
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
    startTime=7500)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-231,90},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H3(
    duration=10,
    height=-0.003,
    offset=0,
    startTime=20000)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-231,126},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-172,98},{-152,118}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV round1DFV2(
    allowFlowReversal=false,
    Di=0.13,
    redeclare model Gas =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    L=1500,
    Tin_start(displayUnit="K"),
    Tout_start(displayUnit="K"),
    X_start={1,0},
    massFractionDynamicBalance=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    dp(displayUnit="Pa"),
    m_flow_start=0.03,
    n=15,
    pin_start=500000,
    pout_start=450000,
    ptilde(each displayUnit="Pa"))                                                                                                                                                                                                         annotation (
    Placement(transformation(origin={-238,26},    extent = {{10, -10}, {-10, 10}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV round1DFV3(
    allowFlowReversal=false,
    Di=0.13,
    redeclare model Gas =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    L=1500,
    Tin_start(displayUnit="K"),
    Tout_start(displayUnit="K"),
    X_start={1,0},
    massFractionDynamicBalance=true,
    hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
    momentum=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState,
    dp(displayUnit="Pa"),
    m_flow_start=0.03,
    n=15,
    pin_start=500000,
    pout_start=450000,
    ptilde(each displayUnit="Pa"))                                                                                                                                                                                                         annotation (
    Placement(transformation(origin={-188,26},   extent = {{10, -10}, {-10, 10}})));
equation
  connect(m_flow_H3.y,add. u1) annotation (Line(points={{-220,126},{-184,126},{
          -184,114},{-174,114}},
                        color={0,0,127}));
  connect(m_flow_H2.y,add. u2) annotation (Line(points={{-220,90},{-184,90},{
          -184,102},{-174,102}},
                        color={0,0,127}));
  connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{-151,108},{
          -148,108},{-148,53},{-178,53}}, color={0,0,127}));
  connect(round1DFV3.inlet, idealPressureSensor.outlet) annotation (Line(
      points={{-178,26},{-148,26}},
      color={182,109,49},
      thickness=0.5));
  connect(round1DFV2.inlet, round1DFV3.outlet) annotation (Line(
      points={{-228,26},{-198,26}},
      color={182,109,49},
      thickness=0.5));
  connect(round1DFV2.outlet, GRM_4.inlet) annotation (Line(
      points={{-248,26},{-276,26}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_1.outlet, round1DFV3.outlet) annotation (Line(
      points={{-194,58},{-208,58},{-208,26},{-198,26}},
      color={182,109,49},
      thickness=0.5));
  annotation (uses(Modelica(version="4.0.0")), experiment(
      StopTime=30000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end inj_validation;
