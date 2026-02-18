within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model RG2i_inj1_Prod_profile
  "Profiles of injection and constant demand"
  extends RG2i_pipes_users(
    constantFrictionFactor=false,
    massFractionDynamicBalance=false,
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))),
    X_start={1,0},
    s36_Stadio(n=21),
    valve_controller(P_rng=(5.5 - 3.5)*10^5, P_max=5.5e5));
  parameter Types.Density rho0_h2 = 0.0899;
  parameter Types.MassFlowRate H2Production_old[:,2]  = [0, 0; 1*3600, 0; 2*3600, 0.00007490; 3*3600, 0.00129827; 4*3600, 0.00129827; 5*3600, 0.00007490; 6*3600, 0; 12*3600, 0; 13*3600, 0.00099867; 14*3600, 0.0008655; 15*3600, 0.0003956; 16*3600, 0.0003956; 17*3600, 0; 24*3600, 0]
    "Hydrogen production profile over a day.";
  parameter Types.MassFlowRate H2Production[:,2]  = [0, 16*rho0_h2/3600; 1*3600, 0; 9*3600, 0; 10*3600, 4*rho0_h2/3600; 11*3600, 52*rho0_h2/3600; 12*3600, 52*rho0_h2/3600; 13*3600, 4*rho0_h2/3600; 14*3600, 0; 20*3600, 0; 21*3600, 40*rho0_h2/3600; 22*3600, 35*rho0_h2/3600; 23*3600, 16*rho0_h2/3600; 24*3600, 16*rho0_h2/3600]
    "Hydrogen production profile over a day.";

  Modelica.Blocks.Sources.TimeTable H2_Production(table=H2Production)
    annotation (Placement(visible = true, transformation(origin={-215,85}, extent={{207,-77},
            {184,-55}},                                                                                         rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
    n=nV,
    H=Data.PipelineData_2i.s3.h,
    cm=Data.PipelineData_2i.s3.cm,
    rhom=Data.PipelineData_2i.s3.rhom,
    lambdam=Data.PipelineData_2i.s3.lambdam,
    m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
    pin_start=Data.PipelineData_2i.s3.pin_start,
    pout_start=Data.PipelineData_2i.s3.pout_start,
    kappa=Data.PipelineData_2i.s3.kappa,
    k=Data.PipelineData_2i.s3.k,
    redeclare model Gas = Medium,
    L=Data.PipelineData_2i.s3.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s3.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-148,-56})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    m_flow0=0,
    redeclare model Medium = Medium,
    p0=480000,
    T0=288.15,
    X0={0,1},
    G=1e-15,
    computeEnthalpyWithFixedPressure=true,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-90,-28},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Math.Gain gain(k=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-72,4})));
equation
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-158,-56},{-178,-56},{-178,-58},{-198,-58},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.inlet, Immissione_1.outlet) annotation (Line(
      points={{-138,-56},{-112,-56},{-112,-28},{-100,-28}},
      color={182,109,49},
      thickness=0.5));
  connect(gain.u, H2_Production.y) annotation (Line(points={{-60,4},{-44,4},{-44,
          19},{-32.15,19}},     color={0,0,127}));
  connect(Immissione_1.in_m_flow0, gain.y)
    annotation (Line(points={{-84,-23},{-83,-23},{-83,4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_inj1_Prod_profile;
