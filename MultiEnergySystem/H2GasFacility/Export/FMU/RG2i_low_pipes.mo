within MultiEnergySystem.H2GasFacility.Export.FMU;
partial model RG2i_low_pipes
  "Base network with no sources and reduced number of pipes"
  extends Modelica.Icons.Example;
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  // replaceable model Medium =
  //    MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
  //  MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2;
      //MultiEnergySystem.H2GasFacility.Media.IdealGases.NG_4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean massFractionDynamicBalance = false;
  parameter Boolean constantFrictionFactor = false;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 2 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {1, 0};
  //parameter Types.MassFraction X_start[nX] = {1, 0, 0, 0};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.657;

  parameter Types.Pressure p_nom = 4.93e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
  //parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
  parameter Integer nV = 3;

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(
    H=Data.PipelineData_2i.s1.h,
    cm=Data.PipelineData_2i.s1.cm,
    rhom=Data.PipelineData_2i.s1.rhom,
    lambdam=Data.PipelineData_2i.s1.lambdam,
    m_flow_start=Data.PipelineData_2i.s1.m_flow_start,
    pin_start=Data.PipelineData_2i.s1.pin_start,
    pout_start=Data.PipelineData_2i.s1.pout_start,
    redeclare model Gas = Medium,
    pin_nom=Data.PipelineData_2i.s1.pin_start,
    rho_nom=Data.PipelineData_2i.s1.rho_nom,
    ff_nom=FrictionFactor,
    n=nV,
    kappa=Data.PipelineData_2i.s1.kappa,
    k=Data.PipelineData_2i.s1.k,
    L=Data.PipelineData_2i.s1.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-172,26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s2(
    H=Data.PipelineData_2i.s2.h,
    t=Data.PipelineData_2i.s2.t,
    cm=Data.PipelineData_2i.s2.cm,
    rhom=Data.PipelineData_2i.s2.rhom,
    lambdam=Data.PipelineData_2i.s2.lambdam,
    m_flow_start=Data.PipelineData_2i.s2.m_flow_start,
    pin_start=Data.PipelineData_2i.s2.pin_start,
    redeclare model Gas = Medium,
    pout_start=Data.PipelineData_2i.s2.pout_start,
    ff_nom=FrictionFactor,
    rho_nom=Data.PipelineData_2i.s2.rho_nom,
    n=nV,
    kappa=Data.PipelineData_2i.s2.kappa,
    k=Data.PipelineData_2i.s2.k,
    L=Data.PipelineData_2i.s2.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s2.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-198,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s4e8(
    H=Data.PipelineData_2i.s4.h + Data.PipelineData_2i.s8.h,
    cm=Data.PipelineData_2i.s4.cm,
    rhom=Data.PipelineData_2i.s4.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s4.lambdam,
    m_flow_start=Data.PipelineData_2i.s4.m_flow_start,
    pin_start=Data.PipelineData_2i.s4.pin_start,
    pout_start=Data.PipelineData_2i.s8.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s4.kappa,
    k=Data.PipelineData_2i.s4.k,
    L=Data.PipelineData_2i.s4.L + Data.PipelineData_2i.s8.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s4.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s4.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-200,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9e11(
    H=Data.PipelineData_2i.s9.h + Data.PipelineData_2i.s11.h,
    cm=Data.PipelineData_2i.s9.cm,
    rhom=Data.PipelineData_2i.s9.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s9.lambdam,
    m_flow_start=Data.PipelineData_2i.s9.m_flow_start,
    pin_start=Data.PipelineData_2i.s9.pin_start,
    pout_start=Data.PipelineData_2i.s11.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s9.kappa,
    k=Data.PipelineData_2i.s9.k,
    L=Data.PipelineData_2i.s9.L + Data.PipelineData_2i.s11.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s9.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s9.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-142,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(
    L=Data.PipelineData_2i.s12.L,
    H=Data.PipelineData_2i.s12.h,
    cm=Data.PipelineData_2i.s12.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s12.rhom,
    lambdam=Data.PipelineData_2i.s12.lambdam,
    m_flow_start=Data.PipelineData_2i.s12.m_flow_start,
    pin_start=Data.PipelineData_2i.s12.pin_start,
    pout_start=Data.PipelineData_2i.s12.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s12.kappa,
    k=Data.PipelineData_2i.s12.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s12.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s12.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14e16e18(
    L=Data.PipelineData_2i.s14.L + Data.PipelineData_2i.s16.L + Data.PipelineData_2i.s18.L,
    H=Data.PipelineData_2i.s14.h + Data.PipelineData_2i.s16.h + Data.PipelineData_2i.s18.h,
    cm=Data.PipelineData_2i.s14.cm,
    rhom=Data.PipelineData_2i.s14.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s14.lambdam,
    m_flow_start=Data.PipelineData_2i.s14.m_flow_start,
    pin_start=Data.PipelineData_2i.s14.pin_start,
    pout_start=Data.PipelineData_2i.s18.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s14.kappa,
    k=Data.PipelineData_2i.s14.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s14.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s14.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,-6})));

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
    L=Data.PipelineData_2i.s19.L,
    H=Data.PipelineData_2i.s19.h,
    m_flow_start=Data.PipelineData_2i.s19.m_flow_start,
    pin_start=Data.PipelineData_2i.s19.pin_start,
    redeclare model Gas = Medium,
    pout_start=Data.PipelineData_2i.s19.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s19.kappa,
    k=Data.PipelineData_2i.s19.k,
    cm=Data.PipelineData_2i.s19.cm,
    rhom=Data.PipelineData_2i.s19.rhom,
    lambdam=Data.PipelineData_2i.s19.lambdam,
    X_start=X_start,
    Di=Data.PipelineData_2i.s19.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s19.rho_nom)
                     "Polyester" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(
    L=Data.PipelineData_2i.s20.L,
    H=Data.PipelineData_2i.s20.h,
    cm=Data.PipelineData_2i.s20.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s20.rhom,
    lambdam=Data.PipelineData_2i.s20.lambdam,
    m_flow_start=Data.PipelineData_2i.s20.m_flow_start,
    pin_start=Data.PipelineData_2i.s20.pin_start,
    pout_start=Data.PipelineData_2i.s20.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s20.kappa,
    k=Data.PipelineData_2i.s20.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s20.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s20.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-64})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(
    L=Data.PipelineData_2i.s21.L,
    H=Data.PipelineData_2i.s21.h,
    cm=Data.PipelineData_2i.s21.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s21.rhom,
    lambdam=Data.PipelineData_2i.s21.lambdam,
    m_flow_start=Data.PipelineData_2i.s21.m_flow_start,
    pin_start=Data.PipelineData_2i.s21.pin_start,
    pout_start=Data.PipelineData_2i.s21.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s21.kappa,
    k=Data.PipelineData_2i.s21.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s21.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s21.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={172,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22e24(
    L=Data.PipelineData_2i.s22.L + Data.PipelineData_2i.s24.L,
    cm=Data.PipelineData_2i.s22.cm,
    rhom=Data.PipelineData_2i.s22.rhom,
    lambdam=Data.PipelineData_2i.s22.lambdam,
    redeclare model Gas = Medium,
    m_flow_start=Data.PipelineData_2i.s22.m_flow_start,
    pin_start=Data.PipelineData_2i.s22.pin_start,
    pout_start=Data.PipelineData_2i.s24.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s22.kappa,
    k=Data.PipelineData_2i.s22.k,
    H=Data.PipelineData_2i.s22.h + Data.PipelineData_2i.s24.h,
    X_start=X_start,
    Di=Data.PipelineData_2i.s22.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s22.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-102})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(
    L=Data.PipelineData_2i.s26.L,
    H=Data.PipelineData_2i.s26.h,
    cm=Data.PipelineData_2i.s26.cm,
    rhom=Data.PipelineData_2i.s26.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s26.lambdam,
    m_flow_start=Data.PipelineData_2i.s26.m_flow_start,
    pin_start=Data.PipelineData_2i.s26.pin_start,
    pout_start=Data.PipelineData_2i.s26.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s26.kappa,
    k=Data.PipelineData_2i.s26.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s26.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s26.rho_nom)
                     "Viale Siena" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={190,-166})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28e30(
    L=Data.PipelineData_2i.s28.L + Data.PipelineData_2i.s30.L,
    H=Data.PipelineData_2i.s28.h + Data.PipelineData_2i.s30.h,
    cm=Data.PipelineData_2i.s28.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s28.rhom,
    lambdam=Data.PipelineData_2i.s28.lambdam,
    m_flow_start=Data.PipelineData_2i.s28.m_flow_start,
    pin_start=Data.PipelineData_2i.s28.pin_start,
    pout_start=Data.PipelineData_2i.s30.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s28.kappa,
    k=Data.PipelineData_2i.s28.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s28.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s28.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-194})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(
    L=Data.PipelineData_2i.s31.L,
    H=Data.PipelineData_2i.s31.h,
    redeclare model Gas = Medium,
    m_flow_start=Data.PipelineData_2i.s31.m_flow_start,
    pin_start=Data.PipelineData_2i.s31.pin_start,
    pout_start=Data.PipelineData_2i.s31.pout_start,
    n=nV,
    X_start=X_start,
    Di=Data.PipelineData_2i.s31.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s31.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-84})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(
    L=Data.PipelineData_2i.s36.L,
    H=Data.PipelineData_2i.s36.h,
    m_flow_start=Data.PipelineData_2i.s36.m_flow_start,
    redeclare model Gas = Medium,
    pin_start=Data.PipelineData_2i.s36.pin_start,
    pout_start=Data.PipelineData_2i.s36.pout_start,
    X_start=X_start,
    Di=Data.PipelineData_2i.s36.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s36.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={82,-110})));
  inner MultiEnergySystem.System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-270,264},{-250,284}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.HomotopyInitializer homotopyInitializer1(
    redeclare model Medium = Medium,
    p_start=Data.PipelineData_2i.s2.pin_start,
    X_start=X_start,
    T_start=288.15)                  annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-200,0})));
equation
  connect(s4e8.inlet, s2.outlet) annotation (Line(
      points={{-200,-72},{-198,-72},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s14e16e18.inlet) annotation (Line(
      points={{-60,-110},{-50,-110},{-50,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.inlet, s31.outlet) annotation (Line(
      points={{92,-110},{92,-112},{110,-112},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.outlet, s20.inlet) annotation (Line(
      points={{146,-44},{146,-54}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s21.inlet) annotation (Line(
      points={{146,-74},{146,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s22e24.inlet, s21.inlet) annotation (Line(
      points={{146,-92},{146,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s28e30.inlet) annotation (Line(
      points={{200,-166},{220,-166},{220,-170},{234,-170},{234,-184},{234,-184}},
      color={182,109,49},
      thickness=0.5));

  connect(s19.inlet, s31.inlet) annotation (Line(
      points={{146,-24},{146,-6},{110,-6},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(homotopyInitializer1.outlet, s2.inlet) annotation (Line(
      points={{-200,-4},{-200,-16},{-198,-16},{-198,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(s4e8.outlet, s9e11.inlet) annotation (Line(
      points={{-200,-92},{-200,-110},{-152,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s9e11.outlet, s12.inlet) annotation (Line(
      points={{-132,-110},{-80,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s14e16e18.outlet, s31.inlet) annotation (Line(
      points={{-8,-6},{110,-6},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(s22e24.outlet, s26.inlet) annotation (Line(
      points={{146,-112},{148,-112},{148,-166},{180,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(homotopyInitializer1.inlet, s1.outlet) annotation (Line(
      points={{-200,4},{-200,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}})),
    experiment(
      StopTime=100,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>Structure of the network with only pipes and connections. </p>
</html>"));
end RG2i_low_pipes;
