within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_extended_wsources
  extends Rete_Gas_2i_nosources;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
    redeclare model Medium = Medium,
    H=0,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-188,250})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    L=1077.595,
    redeclare model Medium = Medium,
    H=0,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-246,250})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-300,252},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=50,
    height=0.1,
    offset=0,
    startTime=100)                                                                                          annotation (
    Placement(visible = true, transformation(origin={-331,270},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
equation
  connect(sds17.inlet,sds16. outlet) annotation (Line(
      points={{-236,250},{-198,250}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet,sds17. outlet) annotation (Line(
      points={{-290,252},{-288,250},{-256,250}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-320,
          270},{-320,264},{-306,264},{-306,257}},
                                             color={0,0,127}));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-178,250},{-121,250},{-121,210}},
      color={182,109,49},
      thickness=0.5));
end Rete_Gas_2i_extended_wsources;
