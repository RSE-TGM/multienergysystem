within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_nosources
  "Simplified version of Rete Gas 2i with only backbone and no sources"
  extends Modelica.Icons.Example;
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  // replaceable model Medium =
  //    MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
  //  MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = true;
  parameter Boolean constantFrictionFactor = true;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 7 "Number of components in the gas fluid";
  //parameter Types.MassFraction X_start[nX] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter Types.MassFraction X_start[1] = {1};
  parameter Types.MassFraction X_start_H2[nX] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.712;

  parameter Types.Pressure p_nom = 1.5e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;

  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(
    rho_nom=rho_nom,                                            redeclare model
      Medium =       Medium,
      L=842.777,
    X_start=X_start,                                                       Di=
        2.091,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-172,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure REMI(redeclare model
      Medium = Medium,
    p0=493000,         X0
      =X_start,
    computeTransport=false)
                "REMI - Sciacca Presa 2. Dati Taratura: 
Pressione = 4.93 bar;
Portata = 2088 Stm3/h;"                                       annotation (
      Placement(transformation(
        extent={{-24,-24},{24,24}},
        rotation=180,
        origin={-122,26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s2(
    H=-42,
    rho_nom=rho_nom,
    n=5,                                                        redeclare model
      Medium =       Medium,
      L=3273.422,
    X_start=X_start,                                                        Di=
        1.603,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s4(
    H=-42,
    n=5,                                                        redeclare model
      Medium =                                                                              Medium,
      L=1663.921,
    X_start=X_start,                                                        Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-200,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s8(
    H=-11,                                                      redeclare model
      Medium =                                                                              Medium,
      L=154.637,
    X_start=X_start,                                                       Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-174,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9(
    H=-1,                                                       redeclare model
      Medium =                                                                              Medium,
      L=1.635,
    X_start=X_start,                                                     Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-142,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s11(L=503.188,
    H=-31,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-104,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(L=238.385,
    H=11,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                        Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14(L=589.227,
    H=-15,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s16(L=19.065,
    X_start=X_start,                                  redeclare model Medium =              Medium,Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s18(L=880.651,
    H=-1,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={68,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
    L=540.807,
    H=-18,
    redeclare model Medium =                                                                Medium,
    cm=880,
    rhom=2000,
    lambdam=0.25,
    X_start=X_start,
    Di=1.472,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) "Polyester" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={146,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(L=14.682,
    H=14,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={146,-64})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(L=13.074,
  redeclare model Medium =                                                                  Medium,
    X_start=X_start,                                                       Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={172,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22(L=95.937,
  redeclare model Medium =                                                                  Medium,
    H=-3,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={146,-102})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s24(L=92.59,
  redeclare model Medium =                                                                  Medium,
    H=2,
    X_start=X_start,                                                      Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={146,-146})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(L=181.028,
  redeclare model Medium =                                                                  Medium,
    X_start=X_start,                                                        Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) "Viale Siena" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={190,-166})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28(L=84.565,
  redeclare model Medium =                                                                  Medium,
    X_start=X_start,                                                       Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={234,-194})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s30(L=138.527,
  redeclare model Medium =                                                                  Medium,
    X_start=X_start,                                                        Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={234,-232})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(L=256.081,
  redeclare model Medium =                                                                  Medium,
    X_start=X_start,                                                        Di=
        0.1603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-84})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(L=
        1224.898,
        redeclare model Medium =                                                            Medium,
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
        origin={82,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds1(
    L=3081.109,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,
      Di=0.1603,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,46})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds2(L=92.5,
    X_start=X_start,                                    redeclare model Medium
      =                                                                                     Medium,Di=
        0.1472,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-180,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds3(L=677.303,
    H=204,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                         Di
      =0.1603,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-146,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds4(L=433.985,
    H=-8,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                         Di
      =0.1325,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds6(L=8027.812,
    H=59,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,
      Di=0.1325,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=10)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,120})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds7(L=2103.419,
    H=19,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,
      Di=0.1325,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={162,140})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds8(L=13379.322,
    H=-107,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,
      Di=0.1325,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,176})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds9(L=193.484,
    H=-8,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                         Di
      =0.1325,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,162})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds10(L=7.845,
    H=-4,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                        Di=
        0.1079,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-154,176})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds11(L=357.121,
    H=-12,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,
      Di=0.1079,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={-121,201})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds12(L=787.51,
    H=40,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                         Di
      =0.1079,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom,
    n=5)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-8,202})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds13(L=190.14,
    H=1,
    redeclare model Medium =                                                                Medium,
    X_start=X_start,                                                         Di
      =0.0831,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={24,202})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds14(L=36.829,
    X_start=X_start,                                         redeclare model
      Medium =                                                                              Medium,Di
      =0.0831,
      quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,216})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds15(L=1015.74,
    H=72,
    redeclare model Medium =                                                                Medium,
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
        rotation=90,
        origin={46,242})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(redeclare
      model Medium =                                                                        Medium,
    p0=463200,
    m_flow0=0.021261,
    X0=X_start)
    "Viale Berlinguer"
    annotation (Placement(transformation(extent={{-246,154},{-202,198}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(redeclare
      model Medium =                                                                        Medium,
    p0=437100,
    m_flow0=0.098685,
    X0=X_start)
    "Contessa Entellina Ingresso paese SP.12 "
    annotation (Placement(transformation(extent={{222,216},{262,256}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(redeclare
      model Medium =                                                                        Medium,
    p0=461900,
    m_flow0=0.019358,
    X0=X_start)                                                                                     "Via Marx"
    annotation (Placement(transformation(extent={{96,200},{130,234}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(redeclare
      model Medium =                                                                        Medium,
    p0=460300,
    m_flow0=0.007765,
    X0=X_start)
    "Via 25 Aprile"
    annotation (Placement(transformation(extent={{30,264},{68,302}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(redeclare
      model Medium =                                                                        Medium,
    p0=459100,
    m_flow0=0.034069,
    X0=X_start)
    "C.so Marsiglia"
    annotation (Placement(transformation(extent={{18,-128},{54,-92}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(redeclare
      model Medium =                                                                        Medium,
    p0=459500,
    m_flow0=0.112338,
    X0=X_start)                                                                                     "Osèedaòe"
    annotation (Placement(transformation(extent={{202,-102},{242,-62}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(redeclare
      model Medium =                                                                        Medium,
    p0=454700,
    m_flow0=0.119588,
    X0=X_start)                                                                                     "Via Lioni"
    annotation (Placement(transformation(extent={{212,-292},{256,-248}})));
equation
  connect(s1.inlet, REMI.outlet) annotation (Line(
      points={{-162,26},{-146,26}},
      color={182,109,49},
      thickness=0.5));
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
  connect(GRM_4.inlet, sds10.outlet) annotation (Line(
      points={{-224,176},{-164,176}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_7.inlet, sds8.outlet) annotation (Line(
      points={{242,236},{242,186}},
      color={182,109,49},
      thickness=0.5));
  connect(sds14.outlet, GRM_6.inlet) annotation (Line(
      points={{80,216},{113,216},{113,217}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_5.inlet, sds15.outlet) annotation (Line(
      points={{49,283},{46,283},{46,252}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.outlet, s1.outlet) annotation (Line(
      points={{-198,-24},{-200,-24},{-200,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.outlet, s2.inlet) annotation (Line(
      points={{-200,-72},{-198,-72},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, s8.outlet) annotation (Line(
      points={{-200,-92},{-200,-110},{-184,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.inlet, s9.outlet) annotation (Line(
      points={{-164,-110},{-152,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.inlet, s11.outlet) annotation (Line(
      points={{-132,-110},{-114,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s11.inlet, s12.outlet) annotation (Line(
      points={{-94,-110},{-80,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.inlet, s14.outlet) annotation (Line(
      points={{-60,-110},{-46,-110},{-46,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.inlet, s16.outlet) annotation (Line(
      points={{-8,-6},{8,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.inlet, s18.outlet) annotation (Line(
      points={{28,-6},{58,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s18.inlet, s31.outlet) annotation (Line(
      points={{78,-6},{94,-6},{94,-4},{110,-4},{110,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.outlet, s18.inlet) annotation (Line(
      points={{146,-24},{146,-6},{78,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s19.inlet) annotation (Line(
      points={{146,-54},{146,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.inlet, s21.outlet) annotation (Line(
      points={{146,-74},{152,-74},{152,-82},{162,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.inlet, GRM_1.inlet) annotation (Line(
      points={{182,-82},{222,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.inlet, s22.outlet) annotation (Line(
      points={{146,-74},{146,-92}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.inlet, s24.outlet) annotation (Line(
      points={{146,-112},{146,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.inlet, s26.outlet) annotation (Line(
      points={{146,-156},{146,-166},{180,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.inlet, s28.outlet) annotation (Line(
      points={{200,-166},{234,-166},{234,-184}},
      color={182,109,49},
      thickness=0.5));
  connect(s28.inlet, s30.outlet) annotation (Line(
      points={{234,-204},{234,-222}},
      color={182,109,49},
      thickness=0.5));
  connect(s30.inlet, GRM_2.inlet) annotation (Line(
      points={{234,-242},{234,-270}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_3.inlet, s36_Stadio.outlet) annotation (Line(
      points={{36,-110},{36,-136},{64,-136},{64,-110},{72,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.inlet, s31.inlet) annotation (Line(
      points={{92,-110},{92,-112},{110,-112},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}})),
    experiment(
      StopTime=5400,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_nosources;
