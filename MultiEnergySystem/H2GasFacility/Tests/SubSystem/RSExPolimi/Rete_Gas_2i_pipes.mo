within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
partial model Rete_Gas_2i_pipes
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sr4(
    H=Data.PipelineData_2i_red.sr4.h,
    cm=Data.PipelineData_2i_red.sr4.cm,
    rhom=Data.PipelineData_2i_red.sr4.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i_red.sr4.lambdam,
    m_flow_start=Data.PipelineData_2i_red.sr4.m_flow_start,
    pin_start=Data.PipelineData_2i_red.sr4.pin_start,
    pout_start=Data.PipelineData_2i.s18.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i_red.sr4.kappa,
    k=Data.PipelineData_2i_red.sr4.k,
    L=Data.PipelineData_2i_red.sr4.L,
    X_start=X_start,
    Di=Data.PipelineData_2i_red.sr4.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i_red.sr4.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-128,-74})));

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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sr22(
    L=Data.PipelineData_2i_red.sr22.L,
    H=Data.PipelineData_2i_red.sr22.h,
    cm=Data.PipelineData_2i_red.sr22.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i_red.sr22.rhom,
    lambdam=Data.PipelineData_2i_red.sr22.lambdam,
    m_flow_start=Data.PipelineData_2i_red.sr22.m_flow_start,
    pin_start=Data.PipelineData_2i_red.sr22.pin_start,
    pout_start=Data.PipelineData_2i_red.sr22.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i_red.sr22.kappa,
    k=Data.PipelineData_2i_red.sr22.k,
    X_start=X_start,
    Di=Data.PipelineData_2i_red.sr22.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    ff_nom=FrictionFactor,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i_red.sr22.rho_nom) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-160})));
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sdsr7(
    L=Data.PipelineData_2i_red.sdsr7.L,
    H=Data.PipelineData_2i_red.sdsr7.h,
    cm=Data.PipelineData_2i_red.sdsr7.cm,
    rhom=Data.PipelineData_2i_red.sdsr7.rhom,
    redeclare model Gas = Medium,
    lambdam=Data.PipelineData_2i_red.sdsr7.lambdam,
    m_flow_start=Data.PipelineData_2i_red.sdsr7.m_flow_start,
    pin_start=Data.PipelineData_2i_red.sdsr7.pin_start,
    pout_start=Data.PipelineData_2i.sds8.pout_start,
    kappa=Data.PipelineData_2i_red.sdsr7.kappa,
    k=Data.PipelineData_2i_red.sdsr7.k,
    X_start=X_start,
    Di=Data.PipelineData_2i_red.sdsr7.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i_red.sdsr7.rho_nom,
    n=nV) "Sum of pipe sds7 + sds8" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={162,140})));
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
      massFractionDynamicBalance=massFractionDynamicBalance,
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
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds10.rho_nom)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-154,180})));
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
      massFractionDynamicBalance=massFractionDynamicBalance,
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
      massFractionDynamicBalance=massFractionDynamicBalance,
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
  inner MultiEnergySystem.System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-270,264},{-250,284}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo2(
    L=100,
    H=0,
    m_flow_start=0.098,
    redeclare model Gas = Medium,
    redeclare model Medium = Medium,
    X_start=X_start,
    Di=0.1325,
    massFractionDynamicBalance=massFractionDynamicBalance,
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
  MultiEnergySystem.H2GasFacility.Components.Manifold.HomotopyInitializer homotopyInitializer(
    redeclare model Medium = Medium,
    p_start=Data.PipelineData_2i.sds11.pin_start,
    X_start=X_start,
    T_start=288.15)                  annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-120,184})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.HomotopyInitializer homotopyInitializer1(
    redeclare model Medium = Medium,
    p_start=Data.PipelineData_2i.s2.pin_start,
    X_start=X_start,
    T_start=288.15)                  annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={-200,0})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sdsr1(
    L=Data.PipelineData_2i.sds4.L + Data.PipelineData_2i_red.sdsr1.L,
    H=Data.PipelineData_2i.sds4.h + Data.PipelineData_2i_red.sdsr1.h,
    cm=Data.PipelineData_2i_red.sdsr1.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i_red.sdsr1.rhom,
    lambdam=Data.PipelineData_2i_red.sdsr1.lambdam,
    m_flow_start=Data.PipelineData_2i_red.sdsr1.m_flow_start,
    pin_start=Data.PipelineData_2i_red.sdsr1.pin_start,
    pout_start=Data.PipelineData_2i.sds6.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i_red.sdsr1.kappa,
    k=Data.PipelineData_2i_red.sdsr1.k,
    X_start=X_start,
    Di=Data.PipelineData_2i_red.sdsr1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i_red.sdsr1.rho_nom)
    "sum of pipes sds1+ sds2+ sds3+ sds4+ sds6" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,100})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sdsr12(
    L=Data.PipelineData_2i_red.sdsr12.L,
    H=Data.PipelineData_2i_red.sdsr12.h,
    cm=Data.PipelineData_2i_red.sdsr12.cm,
    redeclare model Gas = Medium,
    rhom=Data.PipelineData_2i_red.sdsr12.rhom,
    lambdam=Data.PipelineData_2i_red.sdsr12.lambdam,
    m_flow_start=Data.PipelineData_2i_red.sdsr12.m_flow_start,
    pin_start=Data.PipelineData_2i_red.sdsr12.pin_start,
    pout_start=Data.PipelineData_2i_red.sdsr12.pout_start,
    n=nV,
    kappa=Data.PipelineData_2i_red.sdsr12.kappa,
    k=Data.PipelineData_2i_red.sdsr12.k,
    X_start=X_start,
    Di=Data.PipelineData_2i_red.sdsr12.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i_red.sdsr12.rho_nom)
    "sum of pipes sds12+ sds13" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-22,202})));
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
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    ff_nom=FrictionFactor,
    hctype=hctype,
    momentum=momentum,
    rho_nom=Data.PipelineData_2i.sds11.rho_nom)
                     annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-119,213})));
equation
  connect(sds15.inlet, sds14.inlet) annotation (Line(
      points={{46,232},{46,216},{60,216}},
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

  connect(s19.inlet, s31.inlet) annotation (Line(
      points={{146,-24},{146,-6},{110,-6},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(sds9.outlet, homotopyInitializer.inlet) annotation (Line(
      points={{-122,172},{-122,176},{-120,176},{-120,180}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.inlet, homotopyInitializer.inlet) annotation (Line(
      points={{-144,180},{-132,180},{-132,176},{-120,176},{-120,180}},
      color={182,109,49},
      thickness=0.5));
  connect(homotopyInitializer1.outlet, s2.inlet) annotation (Line(
      points={{-200,-4},{-200,-16},{-198,-16},{-198,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(sdsr1.outlet, sds9.inlet) annotation (Line(
      points={{-120,110},{-122,110},{-122,152}},
      color={182,109,49},
      thickness=0.5));
  connect(sdsr7.inlet, sds9.inlet) annotation (Line(
      points={{152,140},{16,140},{16,134},{-122,134},{-122,152}},
      color={182,109,49},
      thickness=0.5));
  connect(sdsr7.outlet, raccordo2.inlet) annotation (Line(
      points={{172,140},{242,140},{242,200}},
      color={182,109,49},
      thickness=0.5));
  connect(homotopyInitializer.outlet, sds11.inlet) annotation (Line(
      points={{-120,188},{-119,188},{-119,204}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.outlet, sdsr12.inlet) annotation (Line(
      points={{-119,222},{-119,230},{-32,230},{-32,202}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.outlet, sr4.inlet) annotation (Line(
      points={{-198,-44},{-198,-76},{-138,-76},{-138,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(sr4.outlet, s31.inlet) annotation (Line(
      points={{-118,-74},{0,-74},{0,-6},{110,-6},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(sr22.inlet, s21.inlet) annotation (Line(
      points={{146,-150},{148,-150},{148,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(homotopyInitializer1.inlet, s1.outlet) annotation (Line(
      points={{-200,4},{-200,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(sdsr1.inlet, s1.outlet) annotation (Line(
      points={{-120,90},{-124,90},{-124,68},{-202,68},{-202,24},{-200,24},{-200,
          26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(sdsr12.outlet, sds14.inlet) annotation (Line(
      points={{-12,202},{18,202},{18,200},{46,200},{46,216},{60,216}},
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
end Rete_Gas_2i_pipes;
