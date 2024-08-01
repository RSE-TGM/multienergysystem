within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_complete
  extends Rete_Gas_2i_wSource(
    break connect(s19.outlet, s18.inlet),
    break connect(s18.inlet, s31.outlet),
    break connect(s20.inlet, s21.outlet),
    break connect(s26.inlet, s28.outlet),
    break connect(s24.inlet, s26.outlet));
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
        origin={-200,256})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser13(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-210,282},{-190,302}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(
    L=303.305,
    H=16,
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
        origin={6,98})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser12(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{20,88},{40,108}})));
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
        origin={-242,-108})));
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
        origin={-264,-90})));
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
        origin={-286,-108})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-324,-118},{-304,-98}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser1(
    redeclare model Medium = Medium,
    m_flow0=1e-7,
    X0=X_start)
    annotation (Placement(transformation(extent={{-274,-76},{-254,-56}})));
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
        origin={-122,-160})));
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
        origin={-22,-202})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser2(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-104,-240},{-84,-220}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser3(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-32,-238},{-12,-218}})));
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
        origin={2,-54})));
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
        origin={44,-48})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser10(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{34,-80},{54,-60}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser11(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-8,-82},{12,-62}})));
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
        origin={110,-142})));
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
        origin={110,-176})));
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
        origin={110,-216})));
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
        origin={82,-196})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser5(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{100,-250},{120,-230}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser4(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{36,-206},{56,-186}})));
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
        origin={146,-206})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser6(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{136,-264},{156,-244}})));
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
        origin={224,-126})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser9(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{244,-136},{264,-116}})));
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
        origin={302,-166})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser8(
    redeclare model Medium = Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{318,-176},{338,-156}})));
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
equation
  connect(sds18.outlet,idealUser13. inlet) annotation (Line(
      points={{-200,266},{-200,292}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.inlet, sds16.outlet) annotation (Line(
      points={{-200,246},{-202,246},{-202,228},{-188,228}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.outlet,idealUser12. inlet) annotation (Line(
      points={{16,98},{30,98}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.inlet, sds4.outlet) annotation (Line(
      points={{-4,98},{-124,98},{-124,92}},
      color={182,109,49},
      thickness=0.5));
  connect(s7.inlet,s5_ViaCartabubbo. outlet) annotation (Line(
      points={{-276,-108},{-252,-108}},
      color={182,109,49},
      thickness=0.5));
  connect(s6.inlet,s5_ViaCartabubbo. outlet) annotation (Line(
      points={{-264,-100},{-264,-108},{-252,-108}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser.inlet,s7. outlet) annotation (Line(
      points={{-314,-108},{-296,-108}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser1.inlet,s6. outlet) annotation (Line(
      points={{-264,-66},{-264,-80}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser2.inlet,s10. outlet) annotation (Line(
      points={{-94,-230},{-122,-230},{-122,-170}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser3.inlet,s13. outlet) annotation (Line(
      points={{-22,-228},{-22,-212}},
      color={182,109,49},
      thickness=0.5));
  connect(s17.outlet,idealUser10. inlet) annotation (Line(
      points={{44,-58},{44,-70}},
      color={182,109,49},
      thickness=0.5));
  connect(s15.outlet,idealUser11. inlet) annotation (Line(
      points={{2,-64},{2,-72}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.outlet,s33. inlet) annotation (Line(
      points={{110,-152},{110,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s33.outlet,s34_ViaSalerno. inlet) annotation (Line(
      points={{110,-186},{110,-206}},
      color={182,109,49},
      thickness=0.5));
  connect(s35_ViaAndretta.inlet,s34_ViaSalerno. inlet) annotation (Line(
      points={{92,-196},{110,-196},{110,-206}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser5.inlet,s34_ViaSalerno. outlet) annotation (Line(
      points={{110,-240},{110,-226}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser4.inlet, s35_ViaAndretta.outlet) annotation (Line(
      points={{46,-196},{72,-196}},
      color={182,109,49},
      thickness=0.5));
  connect(s25.outlet,idealUser6. inlet) annotation (Line(
      points={{146,-216},{146,-254}},
      color={182,109,49},
      thickness=0.5));
  connect(s23.outlet,idealUser9. inlet) annotation (Line(
      points={{234,-126},{254,-126}},
      color={182,109,49},
      thickness=0.5));
  connect(s27.outlet,idealUser8. inlet) annotation (Line(
      points={{312,-166},{328,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser7.inlet,s29. outlet) annotation (Line(
      points={{184,-214},{200,-214}},
      color={182,109,49},
      thickness=0.5));
  connect(s5_ViaCartabubbo.inlet, s8.outlet) annotation (Line(
      points={{-232,-108},{-200,-110},{-184,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s10.inlet, s11.outlet) annotation (Line(
      points={{-122,-150},{-122,-110},{-114,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s13.inlet, s14.outlet) annotation (Line(
      points={{-22,-192},{-34,-192},{-34,-110},{-46,-110},{-46,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s15.inlet, s16.outlet) annotation (Line(
      points={{2,-44},{2,-6},{8,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s17.inlet, s18.outlet) annotation (Line(
      points={{44,-38},{44,-6},{58,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.inlet, s31.inlet) annotation (Line(
      points={{110,-132},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  connect(s31.outlet, s18.inlet) annotation (Line(
      points={{110,-74},{110,-6},{78,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.outlet, s18.inlet) annotation (Line(
      points={{146,-24},{146,-6},{78,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, s22.outlet) annotation (Line(
      points={{162,-82},{154,-82},{154,-80},{146,-80},{146,-92}},
      color={182,109,49},
      thickness=0.5));
  connect(s23.inlet, s24.outlet) annotation (Line(
      points={{214,-126},{182,-126},{182,-124},{146,-124},{146,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s25.inlet, s24.inlet) annotation (Line(
      points={{146,-196},{146,-156}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s24.inlet) annotation (Line(
      points={{180,-166},{146,-166},{146,-156}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.inlet, s27.inlet) annotation (Line(
      points={{200,-166},{292,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s29.inlet, s30.outlet) annotation (Line(
      points={{220,-214},{228,-214},{228,-210},{234,-210},{234,-222}},
      color={182,109,49},
      thickness=0.5));
  connect(s28.outlet, s27.inlet) annotation (Line(
      points={{234,-184},{236,-184},{236,-166},{292,-166}},
      color={182,109,49},
      thickness=0.5));
end Rete_Gas_2i_complete;
