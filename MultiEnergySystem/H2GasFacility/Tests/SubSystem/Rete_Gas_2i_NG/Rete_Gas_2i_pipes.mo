within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
partial model Rete_Gas_2i_pipes "Base network with no sources"
  extends Modelica.Icons.Example;
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  // replaceable model Medium =
  //    MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
  //  MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = true;
  parameter Boolean constantFrictionFactor = false;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 1 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {1};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.657;

  parameter Types.Pressure p_nom = 4.93e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
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
    quasiStatic=quasiStatic,
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
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-198,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s4(
    H=Data.PipelineData_2i.s4.h,
    cm=Data.PipelineData_2i.s4.cm,
    rhom=Data.PipelineData_2i.s4.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s4.lambdam,
    m_flow_start=Data.PipelineData_2i.s4.m_flow_start,
    pin_start=Data.PipelineData_2i.s4.pin_start,
    pout_start=Data.PipelineData_2i.s4.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s4.kappa,
    k=Data.PipelineData_2i.s4.k,
    L=Data.PipelineData_2i.s4.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s4.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s4.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-200,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s8(
    H=Data.PipelineData_2i.s8.h,
    cm=Data.PipelineData_2i.s8.cm,
    rhom=Data.PipelineData_2i.s8.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s8.lambdam,
    m_flow_start=Data.PipelineData_2i.s8.m_flow_start,
    pin_start=Data.PipelineData_2i.s8.pin_start,
    pout_start=Data.PipelineData_2i.s8.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s8.kappa,
    k=Data.PipelineData_2i.s8.k,
    L=Data.PipelineData_2i.s8.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s8.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s8.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-174,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9(
    H=Data.PipelineData_2i.s9.h,
    cm=Data.PipelineData_2i.s9.cm,
    rhom=Data.PipelineData_2i.s9.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s9.lambdam,
    m_flow_start=Data.PipelineData_2i.s9.m_flow_start,
    pin_start=Data.PipelineData_2i.s9.pin_start,
    pout_start=Data.PipelineData_2i.s9.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s9.kappa,
    k=Data.PipelineData_2i.s9.k,
    L=Data.PipelineData_2i.s9.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s9.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s9.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-142,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s11(
    L=Data.PipelineData_2i.s11.L,
    H=Data.PipelineData_2i.s11.h,
    cm=Data.PipelineData_2i.s11.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s11.rhom,
    lambdam=Data.PipelineData_2i.s11.lambdam,
    m_flow_start=Data.PipelineData_2i.s11.m_flow_start,
    pin_start=Data.PipelineData_2i.s11.pin_start,
    pout_start=Data.PipelineData_2i.s11.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s11.kappa,
    k=Data.PipelineData_2i.s11.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s11.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s11.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-104,-110})));
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
        quasiStatic=quasiStatic,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14(
    L=Data.PipelineData_2i.s14.L,
    H=Data.PipelineData_2i.s14.h,
    cm=Data.PipelineData_2i.s14.cm,
    rhom=Data.PipelineData_2i.s14.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s14.lambdam,
    m_flow_start=Data.PipelineData_2i.s14.m_flow_start,
    pin_start=Data.PipelineData_2i.s14.pin_start,
    pout_start=Data.PipelineData_2i.s14.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s14.kappa,
    k=Data.PipelineData_2i.s14.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s14.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s14.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s16(
    L=Data.PipelineData_2i.s16.L,
    H=Data.PipelineData_2i.s16.h,
    cm=Data.PipelineData_2i.s16.cm,
    rhom=Data.PipelineData_2i.s16.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s16.lambdam,
    m_flow_start=Data.PipelineData_2i.s16.m_flow_start,
    pin_start=Data.PipelineData_2i.s16.pin_start,
    pout_start=Data.PipelineData_2i.s16.pout_start,
    X_start=X_start,
    n=nV,
    kappa=Data.PipelineData_2i.s16.kappa,
    k=Data.PipelineData_2i.s16.k,
    Di=Data.PipelineData_2i.s16.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s16.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s18(
    L=Data.PipelineData_2i.s18.L,
    H=Data.PipelineData_2i.s18.h,
    cm=Data.PipelineData_2i.s18.cm,
    rhom=Data.PipelineData_2i.s18.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s18.lambdam,
    m_flow_start=Data.PipelineData_2i.s18.m_flow_start,
    pin_start=Data.PipelineData_2i.s18.pin_start,
    pout_start=Data.PipelineData_2i.s18.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s18.kappa,
    k=Data.PipelineData_2i.s18.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s18.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s18.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={68,-6})));
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
    quasiStatic=quasiStatic,
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
        quasiStatic=quasiStatic,
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
        quasiStatic=quasiStatic,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22(
    L=Data.PipelineData_2i.s22.L,
    cm=Data.PipelineData_2i.s22.cm,
    rhom=Data.PipelineData_2i.s22.rhom,
    lambdam=Data.PipelineData_2i.s22.lambdam,
    redeclare model Gas = Medium,
    m_flow_start=Data.PipelineData_2i.s22.m_flow_start,
    pin_start=Data.PipelineData_2i.s22.pin_start,
    pout_start=Data.PipelineData_2i.s22.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s22.kappa,
    k=Data.PipelineData_2i.s22.k,
    H=Data.PipelineData_2i.s22.h,
    X_start=X_start,
    Di=Data.PipelineData_2i.s22.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s22.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-102})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s24(
    L=Data.PipelineData_2i.s24.L,
    cm=Data.PipelineData_2i.s24.cm,
    rhom=Data.PipelineData_2i.s24.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s24.lambdam,
    m_flow_start=Data.PipelineData_2i.s24.m_flow_start,
    pin_start=Data.PipelineData_2i.s24.pin_start,
    pout_start=Data.PipelineData_2i.s24.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s24.kappa,
    k=Data.PipelineData_2i.s24.k,
    H=Data.PipelineData_2i.s24.h,
    X_start=X_start,
    Di=Data.PipelineData_2i.s24.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s24.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-146})));
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
        quasiStatic=quasiStatic,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28(
    L=Data.PipelineData_2i.s28.L,
    H=Data.PipelineData_2i.s28.h,
    cm=Data.PipelineData_2i.s28.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.s28.rhom,
    lambdam=Data.PipelineData_2i.s28.lambdam,
    m_flow_start=Data.PipelineData_2i.s28.m_flow_start,
    pin_start=Data.PipelineData_2i.s28.pin_start,
    pout_start=Data.PipelineData_2i.s28.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s28.kappa,
    k=Data.PipelineData_2i.s28.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s28.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s28.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-194})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s30(
    L=Data.PipelineData_2i.s30.L,
    H=Data.PipelineData_2i.s30.h,
    cm=Data.PipelineData_2i.s30.cm,
    rhom=Data.PipelineData_2i.s30.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.s30.lambdam,
    m_flow_start=Data.PipelineData_2i.s30.m_flow_start,
    pin_start=Data.PipelineData_2i.s30.pin_start,
    pout_start=Data.PipelineData_2i.s30.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.s30.kappa,
    k=Data.PipelineData_2i.s30.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.s30.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.s30.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-232})));
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
        quasiStatic=quasiStatic,
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
        quasiStatic=quasiStatic,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds1(
    L=Data.PipelineData_2i.sds1.L,
    H=Data.PipelineData_2i.sds1.h,
    cm=Data.PipelineData_2i.sds1.cm,
    rhom=Data.PipelineData_2i.sds1.rhom,
    lambdam=Data.PipelineData_2i.sds1.lambdam,
    redeclare model Gas = Medium,
    m_flow_start=Data.PipelineData_2i.sds1.m_flow_start,
    pin_start=Data.PipelineData_2i.sds1.pin_start,
    pout_start=Data.PipelineData_2i.sds1.pout_start,
    ff_nom=FrictionFactor,
    kappa=Data.PipelineData_2i.sds1.kappa,
    k=Data.PipelineData_2i.sds1.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds1.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds1.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,46})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds2(
    L=Data.PipelineData_2i.sds2.L,
    H=Data.PipelineData_2i.sds2.h,
    cm=Data.PipelineData_2i.sds2.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds2.rhom,
    lambdam=Data.PipelineData_2i.sds2.lambdam,
    m_flow_start=Data.PipelineData_2i.sds2.m_flow_start,
    pin_start=Data.PipelineData_2i.sds2.pin_start,
    pout_start=Data.PipelineData_2i.sds2.pout_start,
    X_start=X_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds2.kappa,
    k=Data.PipelineData_2i.sds2.k,
    Di=Data.PipelineData_2i.sds2.Di,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    ff_nom=FrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds2.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-180,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds3(
    L=Data.PipelineData_2i.sds3.L,
    H=Data.PipelineData_2i.sds3.h,
    cm=Data.PipelineData_2i.sds3.cm,
    rhom=Data.PipelineData_2i.sds3.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.sds3.lambdam,
    m_flow_start=Data.PipelineData_2i.sds3.m_flow_start,
    pin_start=Data.PipelineData_2i.sds3.pin_start,
    pout_start=Data.PipelineData_2i.sds3.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds3.kappa,
    k=Data.PipelineData_2i.sds3.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds3.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds3.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-146,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds4(
    L=Data.PipelineData_2i.sds4.L,
    H=Data.PipelineData_2i.sds4.h,
    cm=Data.PipelineData_2i.sds4.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds4.rhom,
    lambdam=Data.PipelineData_2i.sds4.lambdam,
    m_flow_start=Data.PipelineData_2i.sds4.m_flow_start,
    pin_start=Data.PipelineData_2i.sds4.pin_start,
    pout_start=Data.PipelineData_2i.sds4.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds4.kappa,
    k=Data.PipelineData_2i.sds4.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds4.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds4.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds6(
    L=Data.PipelineData_2i.sds6.L,
    H=Data.PipelineData_2i.sds6.h,
    cm=Data.PipelineData_2i.sds6.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds6.rhom,
    lambdam=Data.PipelineData_2i.sds6.lambdam,
    m_flow_start=Data.PipelineData_2i.sds6.m_flow_start,
    pin_start=Data.PipelineData_2i.sds6.pin_start,
    pout_start=Data.PipelineData_2i.sds6.pout_start,
    kappa=Data.PipelineData_2i.sds6.kappa,
    k=Data.PipelineData_2i.sds6.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds6.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds6.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,120})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds7(
    L=Data.PipelineData_2i.sds7.L,
    H=Data.PipelineData_2i.sds7.h,
    cm=Data.PipelineData_2i.sds7.cm,
    rhom=Data.PipelineData_2i.sds7.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.sds7.lambdam,
    m_flow_start=Data.PipelineData_2i.sds7.m_flow_start,
    pin_start=Data.PipelineData_2i.sds7.pin_start,
    pout_start=Data.PipelineData_2i.sds7.pout_start,
    kappa=Data.PipelineData_2i.sds7.kappa,
    k=Data.PipelineData_2i.sds7.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds7.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds7.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={162,140})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds8(
    L=Data.PipelineData_2i.sds8.L,
    H=Data.PipelineData_2i.sds8.h,
    cm=Data.PipelineData_2i.sds8.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds8.rhom,
    lambdam=Data.PipelineData_2i.sds8.lambdam,
    m_flow_start=Data.PipelineData_2i.sds8.m_flow_start,
    pin_start=Data.PipelineData_2i.sds8.pin_start,
    pout_start=Data.PipelineData_2i.sds8.pout_start,
    kappa=Data.PipelineData_2i.sds8.kappa,
    k=Data.PipelineData_2i.sds8.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds8.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds8.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,176})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds9(
    L=Data.PipelineData_2i.sds9.L,
    H=Data.PipelineData_2i.sds9.h,
    cm=Data.PipelineData_2i.sds9.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds9.rhom,
    lambdam=Data.PipelineData_2i.sds9.lambdam,
    m_flow_start=Data.PipelineData_2i.sds9.m_flow_start,
    pin_start=Data.PipelineData_2i.sds9.pin_start,
    pout_start=Data.PipelineData_2i.sds9.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds9.kappa,
    k=Data.PipelineData_2i.sds9.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds9.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds9.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,162})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds10(
    L=Data.PipelineData_2i.sds10.L,
    H=Data.PipelineData_2i.sds10.h,
    cm=Data.PipelineData_2i.sds10.cm,
    rhom=Data.PipelineData_2i.sds10.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.sds10.lambdam,
    m_flow_start=Data.PipelineData_2i.sds10.m_flow_start,
    pin_start=Data.PipelineData_2i.sds10.pin_start,
    pout_start=Data.PipelineData_2i.sds10.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds10.kappa,
    k=Data.PipelineData_2i.sds10.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds10.Di,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds10.rho_nom)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-154,176})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds11(
    L=Data.PipelineData_2i.sds11.L,
    H=Data.PipelineData_2i.sds11.h,
    cm=Data.PipelineData_2i.sds11.cm,
    rhom=Data.PipelineData_2i.sds11.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.sds11.lambdam,
    m_flow_start=Data.PipelineData_2i.sds11.m_flow_start,
    pin_start=Data.PipelineData_2i.sds11.pin_start,
    pout_start=Data.PipelineData_2i.sds11.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds11.kappa,
    k=Data.PipelineData_2i.sds11.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds11.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds11.rho_nom)
                     annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-121,201})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds12(
    L=Data.PipelineData_2i.sds12.L,
    H=Data.PipelineData_2i.sds12.h,
    cm=Data.PipelineData_2i.sds12.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds12.rhom,
    lambdam=Data.PipelineData_2i.sds12.lambdam,
    m_flow_start=Data.PipelineData_2i.sds12.m_flow_start,
    pin_start=Data.PipelineData_2i.sds12.pin_start,
    pout_start=Data.PipelineData_2i.sds12.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds12.kappa,
    k=Data.PipelineData_2i.sds12.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds12.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds12.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-8,202})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds13(
    L=Data.PipelineData_2i.sds13.L,
    H=Data.PipelineData_2i.sds13.h,
    cm=Data.PipelineData_2i.sds13.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds13.rhom,
    lambdam=Data.PipelineData_2i.sds13.lambdam,
    m_flow_start=Data.PipelineData_2i.sds13.m_flow_start,
    pin_start=Data.PipelineData_2i.sds13.pin_start,
    pout_start=Data.PipelineData_2i.sds13.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds13.kappa,
    k=Data.PipelineData_2i.sds13.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds13.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds13.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={24,202})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds14(
    L=Data.PipelineData_2i.sds14.L,
    H=Data.PipelineData_2i.sds14.h,
    cm=Data.PipelineData_2i.sds14.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i.sds14.rhom,
    lambdam=Data.PipelineData_2i.sds14.lambdam,
    m_flow_start=Data.PipelineData_2i.sds14.m_flow_start,
    pin_start=Data.PipelineData_2i.sds14.pin_start,
    pout_start=Data.PipelineData_2i.sds14.pout_start,
    X_start=X_start,
    n=nV,
    kappa=Data.PipelineData_2i.sds14.kappa,
    k=Data.PipelineData_2i.sds14.k,
    Di=Data.PipelineData_2i.sds14.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds14.rho_nom)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,216})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds15(
    L=Data.PipelineData_2i.sds15.L,
    H=Data.PipelineData_2i.sds15.h,
    cm=Data.PipelineData_2i.sds15.cm,
    rhom=Data.PipelineData_2i.sds15.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i.sds15.lambdam,
    m_flow_start=Data.PipelineData_2i.sds15.m_flow_start,
    pin_start=Data.PipelineData_2i.sds15.pin_start,
    pout_start=Data.PipelineData_2i.sds15.pout_start,
    kappa=Data.PipelineData_2i.sds15.kappa,
    k=Data.PipelineData_2i.sds15.k,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds15.Di,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds15.rho_nom,
    n=nV)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={46,242})));
  inner System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-270,264},{-250,284}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo2(
    L=100,
    H=0,
    redeclare model Gas = Medium,
    redeclare model Medium = Medium,
    X_start=X_start,
    Di=0.1325,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=nV)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,210})));
equation
  connect(sds1.inlet, s1.outlet) annotation (Line(
      points={{-198,36},{-198,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(sds2.inlet, sds1.outlet) annotation (Line(
      points={{-190,66},{-198,66},{-198,56}},
      color={182,109,49},
      thickness=0.5));
  connect(sds2.outlet, sds3.inlet) annotation (Line(
      points={{-170,66},{-156,66}},
      color={182,109,49},
      thickness=0.5));
  connect(sds3.outlet, sds4.inlet) annotation (Line(
      points={{-136,66},{-124,66},{-124,72}},
      color={182,109,49},
      thickness=0.5));
  connect(sds6.inlet, sds4.outlet) annotation (Line(
      points={{-122,110},{-122,104},{-124,104},{-124,92}},
      color={182,109,49},
      thickness=0.5));
  connect(sds6.outlet, sds7.inlet) annotation (Line(
      points={{-122,130},{-122,140},{152,140}},
      color={182,109,49},
      thickness=0.5));
  connect(sds7.outlet, sds8.inlet) annotation (Line(
      points={{172,140},{242,140},{242,166}},
      color={182,109,49},
      thickness=0.5));
  connect(sds9.inlet, sds6.outlet) annotation (Line(
      points={{-122,152},{-122,130}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.inlet, sds9.outlet) annotation (Line(
      points={{-144,176},{-122,176},{-122,172}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.inlet, sds9.outlet) annotation (Line(
      points={{-121,192},{-122,192},{-122,172}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.outlet, sds12.inlet) annotation (Line(
      points={{-121,210},{-121,214},{-122,214},{-122,218},{-32,218},{-32,202},{
          -18,202}},
      color={182,109,49},
      thickness=0.5));
  connect(sds12.outlet, sds13.inlet) annotation (Line(
      points={{2,202},{14,202}},
      color={182,109,49},
      thickness=0.5));
  connect(sds13.outlet, sds14.inlet) annotation (Line(
      points={{34,202},{48,202},{48,216},{60,216}},
      color={182,109,49},
      thickness=0.5));
  connect(sds15.inlet, sds14.inlet) annotation (Line(
      points={{46,232},{46,216},{60,216}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.inlet, s1.outlet) annotation (Line(
      points={{-198,-24},{-198,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, s2.outlet) annotation (Line(
      points={{-200,-72},{-198,-72},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.outlet, s8.inlet) annotation (Line(
      points={{-200,-92},{-200,-110},{-184,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.outlet, s9.inlet) annotation (Line(
      points={{-164,-110},{-152,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s11.inlet) annotation (Line(
      points={{-132,-110},{-114,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s11.outlet, s12.inlet) annotation (Line(
      points={{-94,-110},{-80,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s14.inlet) annotation (Line(
      points={{-60,-110},{-50,-110},{-50,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s16.inlet) annotation (Line(
      points={{-8,-6},{8,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s18.inlet) annotation (Line(
      points={{28,-6},{58,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s18.outlet, s31.inlet) annotation (Line(
      points={{78,-6},{110,-6},{110,-74},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.inlet, s18.outlet) annotation (Line(
      points={{146,-24},{146,-6},{78,-6}},
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
  connect(s22.inlet, s21.inlet) annotation (Line(
      points={{146,-92},{146,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s24.inlet) annotation (Line(
      points={{146,-112},{146,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s26.inlet) annotation (Line(
      points={{146,-156},{148,-156},{148,-166},{180,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s28.inlet) annotation (Line(
      points={{200,-166},{220,-166},{220,-170},{234,-170},{234,-184},{234,-184}},
      color={182,109,49},
      thickness=0.5));

  connect(s28.outlet, s30.inlet) annotation (Line(
      points={{234,-204},{234,-222}},
      color={182,109,49},
      thickness=0.5));
  connect(raccordo2.inlet, sds8.outlet) annotation (Line(
      points={{242,200},{242,186}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}})),
    experiment(
      StopTime=100,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_pipes;
