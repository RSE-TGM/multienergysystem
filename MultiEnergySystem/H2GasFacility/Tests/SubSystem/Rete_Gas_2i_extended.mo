within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_extended "Rete Gas 2i with all the pipes"
    extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s5_ViaCartabubbo(
    H=-5,
    redeclare model Medium = Medium,
    L=341.125,
    X_start=X_start,
    Di=1.079,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-230,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s6(
    H=17,
    redeclare model Medium = Medium,
    L=147.629,
    X_start=X_start,
    Di=1.079,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-252,-92})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s7(
    H=7,
    redeclare model Medium = Medium,
    L=817.587,
    X_start=X_start,
    Di=1.079,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-274,-110})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-312,-120},{-292,-100}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser1(
    redeclare model Medium = Medium,
    m_flow0=1e-7,
    X0=X_start)
    annotation (Placement(transformation(extent={{-262,-78},{-242,-58}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s10(
    L=13.807,
    X_start=X_start,
    Di=1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-122,-138})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s13(
    L=10.754,
    H=-1,
    X_start=X_start,
    Di=1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-138})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser2(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-132,-176},{-112,-156}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser3(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-60,-174},{-40,-154}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s15(
    L=57.126,
    X_start=X_start,
    Di=1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={4,-40})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s17(
    L=60.53,
    X_start=X_start,
    Di=1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-34})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser10(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{36,-66},{56,-46}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser11(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-6,-68},{14,-48}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s32(
    L=133.021,
    X_start=X_start,
    Di=0.1603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-136})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s33(
    L=75.784,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-170})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s34_ViaSalerno(
    L=155.756,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-210})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s35_ViaAndretta(
    L=226.029,
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
        origin={82,-190})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser4(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{44,-200},{64,-180}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser5(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{100,-244},{120,-224}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s23(
    L=220.886,
    X_start=X_start,
    Di=0.831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={192,-122})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser9(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{212,-132},{232,-112}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s25(
    L=984.053,
    H=35,
    X_start=X_start,
    Di=1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-198})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser6(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{136,-244},{156,-224}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s27(
    L=14.527,
    X_start=X_start,
    Di=1.325,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={268,-166})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser8(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{284,-176},{304,-156}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s29(
    L=69.945,
    X_start=X_start,
    Di=0.831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={210,-214})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser7(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{174,-224},{194,-204}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(
    L=303.305,
    X_start=X_start,
    Di=0.0831,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-82,102})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser12(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-68,92},{-48,112}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds18(
    L=6.1,
    X_start=X_start,
    Di=0.0514,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-184,244})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser13(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-194,262},{-174,282}})));
equation
  connect(s7.inlet,s5_ViaCartabubbo. outlet) annotation (Line(
      points={{-264,-110},{-240,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s6.inlet,s5_ViaCartabubbo. outlet) annotation (Line(
      points={{-252,-102},{-252,-110},{-240,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser.inlet,s7. outlet) annotation (Line(
      points={{-302,-110},{-284,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser1.inlet,s6. outlet) annotation (Line(
      points={{-252,-68},{-252,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s5_ViaCartabubbo.inlet, s4.outlet) annotation (Line(
      points={{-220,-110},{-220,-106},{-198,-106}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser2.inlet,s10. outlet) annotation (Line(
      points={{-122,-166},{-122,-148}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser3.inlet,s13. outlet) annotation (Line(
      points={{-50,-164},{-50,-148}},
      color={182,109,49},
      thickness=0.5));
  connect(s10.inlet, s11.inlet) annotation (Line(
      points={{-122,-128},{-120,-128},{-120,-120},{-114,-120},{-114,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s13.inlet, s14.inlet) annotation (Line(
      points={{-50,-128},{-50,-110},{-48,-110},{-48,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s17.outlet,idealUser10. inlet) annotation (Line(
      points={{46,-44},{46,-56}},
      color={182,109,49},
      thickness=0.5));
  connect(s15.outlet,idealUser11. inlet) annotation (Line(
      points={{4,-50},{4,-58}},
      color={182,109,49},
      thickness=0.5));
  connect(s15.inlet, s16.inlet) annotation (Line(
      points={{4,-30},{2,-30},{2,-6},{8,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s17.inlet, s18.inlet) annotation (Line(
      points={{46,-24},{44,-24},{44,-6},{58,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.outlet,s33. inlet) annotation (Line(
      points={{110,-146},{110,-160}},
      color={182,109,49},
      thickness=0.5));
  connect(s33.outlet,s34_ViaSalerno. inlet) annotation (Line(
      points={{110,-180},{110,-200}},
      color={182,109,49},
      thickness=0.5));
  connect(s35_ViaAndretta.inlet,s34_ViaSalerno. inlet) annotation (Line(
      points={{92,-190},{110,-190},{110,-200}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser4.inlet,s35_ViaAndretta. outlet) annotation (Line(
      points={{54,-190},{72,-190}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser5.inlet,s34_ViaSalerno. outlet) annotation (Line(
      points={{110,-234},{110,-220}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.inlet, s31.outlet) annotation (Line(
      points={{110,-126},{110,-94},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  connect(s23.outlet,idealUser9. inlet) annotation (Line(
      points={{202,-122},{222,-122}},
      color={182,109,49},
      thickness=0.5));
  connect(s23.inlet, s24.inlet) annotation (Line(
      points={{182,-122},{146,-122},{146,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s25.outlet,idealUser6. inlet) annotation (Line(
      points={{146,-208},{146,-234}},
      color={182,109,49},
      thickness=0.5));
  connect(s25.inlet, s26.inlet) annotation (Line(
      points={{146,-188},{146,-166},{180,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet,s27. inlet) annotation (Line(
      points={{200,-166},{258,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s27.outlet,idealUser8. inlet) annotation (Line(
      points={{278,-166},{294,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser7.inlet,s29. outlet) annotation (Line(
      points={{184,-214},{200,-214}},
      color={182,109,49},
      thickness=0.5));
  connect(s29.inlet, s28.outlet) annotation (Line(
      points={{220,-214},{228,-214},{228,-212},{234,-212},{234,-204}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.outlet,idealUser12. inlet) annotation (Line(
      points={{-72,102},{-58,102}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.inlet, sds4.outlet) annotation (Line(
      points={{-92,102},{-108,102},{-108,104},{-124,104},{-124,92}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.outlet,idealUser13. inlet) annotation (Line(
      points={{-184,254},{-184,272}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.inlet, sds16.outlet) annotation (Line(
      points={{-184,234},{-184,218},{-166,218}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Rete_Gas_2i_extended;
