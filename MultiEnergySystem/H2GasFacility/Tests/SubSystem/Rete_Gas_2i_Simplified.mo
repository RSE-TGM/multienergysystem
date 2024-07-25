within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_Simplified "Simplified version of Rete Gas 2i"
  extends Modelica.Icons.Example;
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = true;
  parameter Boolean constantFrictionFactor = true;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
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
      =X_start) "REMI - Sciacca Presa 2. Dati Taratura: 
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
        rotation=270,
        origin={-198,8})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
  redeclare model Medium =
                     Medium,
      L=100.058,
    X_start=X_start,                                                       Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-176,-72})));
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
        rotation=270,
        origin={-198,-96})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s5_ViaCartabubbo(
    H=-5,
  redeclare model Medium =                                                                  Medium,
      L
      =341.125,
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
        origin={-226,-110})));
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
        rotation=0,
        origin={-174,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s6(
    H=17,                                                       redeclare model
      Medium =                                                                              Medium,
      L=147.629,
    X_start=X_start,                                                       Di=
        1.079,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-248,-92})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s7(
    H=7,                                                        redeclare model
      Medium =                                                                              Medium,
      L=817.587,
    X_start=X_start,                                                       Di=
        1.079,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-270,-110})));
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
        rotation=0,
        origin={-142,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s10(L=13.807,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-124,-128})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s11(L=503.188,
    H=-31,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-104,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(L=238.385,
    H=11,
    X_start=X_start,                                                        Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-110})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s13(L=10.754,
    H=-1,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-48,-126})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14(L=589.227,
    H=-15,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s15(L=57.126,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s16(L=19.065,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={18,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s17(L=60.53,
    X_start=X_start,                                                      Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={42,-20})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s18(L=880.651,
    H=-1,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={68,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
    L=540.807,
    H=-18,
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
        rotation=270,
        origin={146,-34})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(L=14.682,
    H=14,
    X_start=X_start,                                                       Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-64})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(L=13.074,
    X_start=X_start,                                                       Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={172,-82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22(L=95.937,
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
        rotation=270,
        origin={146,-102})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s23(L=220.886,
    X_start=X_start,                                                        Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={172,-124})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s24(L=92.59,
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
        rotation=270,
        origin={146,-146})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(L=181.028,
    X_start=X_start,                                                        Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) "Viale Siena" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={190,-166})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s25(L=984.053,
    H=35,
    X_start=X_start,                                                        Di=
        1.603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={146,-188})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s27(L=14.527,
    X_start=X_start,                                                       Di=
        1.325,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={270,-166})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28(L=84.565,
    X_start=X_start,                                                       Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-194})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s29(L=69.945,
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
        origin={210,-214})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s30(L=138.527,
    X_start=X_start,                                                        Di=
        0.831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={234,-232})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(L=256.081,
    X_start=X_start,                                                        Di=
        0.1603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-84})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s32(L=133.021,
    X_start=X_start,                                                        Di=
        0.1603,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-132})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(L=
        1224.898,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s33(L=75.784,
    X_start=X_start,                                                       Di=
        0.0831,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,-166})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s34_ViaSalerno(L=
        155.756,
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
        origin={110,-206})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s35_ViaAndretta(L=
        226.029,
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
        origin={82,-186})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds1(L=2081.109,
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
    X_start=X_start,                                                      Di=
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(L=303.305,
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
        origin={-96,100})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds6(L=8027.812,
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
        origin={-122,120})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds7(L=2103.419,
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
        origin={70,216})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds15(L=1015.74,
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
        origin={48,242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(L=194.511,
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
        origin={-156,218})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(L=1077.595,
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
        origin={-214,218})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds18(L=6.1,
    X_start=X_start,                                                      Di=
        0.0514,
        quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-184,246})));
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
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-308,-120},{-288,-100}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser1(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-258,-78},{-238,-58}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser2(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-134,-164},{-114,-144}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser3(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-58,-162},{-38,-142}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser4(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{44,-196},{64,-176}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser5(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{100,-240},{120,-220}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser6(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{136,-224},{156,-204}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser7(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{174,-224},{194,-204}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser8(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{282,-176},{302,-156}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser9(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{192,-134},{212,-114}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser10(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{32,-52},{52,-32}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser11(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-54},{10,-34}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser12(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-82,90},{-62,110}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser13(redeclare
      model Medium =                                                                        Medium,
    m_flow0=0,
    X0=X_start)
    annotation (Placement(transformation(extent={{-194,262},{-174,282}})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-116,-54},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(
    duration=50,
    height=0.1,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-101,-26},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0.1,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-268,220},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=50,
    height=0.1,
    offset=0,
    startTime=50)                                                                                           annotation (
    Placement(visible = true, transformation(origin={-299,238},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
equation
  connect(s1.inlet, REMI.outlet) annotation (Line(
      points={{-162,26},{-146,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.inlet, s1.outlet) annotation (Line(
      points={{-198,18},{-198,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.outlet, s3.inlet) annotation (Line(
      points={{-198,-2},{-198,-72},{-186,-72}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, s2.outlet) annotation (Line(
      points={{-198,-86},{-198,-2}},
      color={182,109,49},
      thickness=0.5));
  connect(s5_ViaCartabubbo.inlet, s4.outlet) annotation (Line(
      points={{-216,-110},{-198,-110},{-198,-106}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.inlet, s4.outlet) annotation (Line(
      points={{-184,-110},{-198,-110},{-198,-106}},
      color={182,109,49},
      thickness=0.5));
  connect(s7.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-260,-110},{-236,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s6.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-248,-102},{-248,-110},{-236,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.outlet, s9.inlet) annotation (Line(
      points={{-164,-110},{-152,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s10.inlet) annotation (Line(
      points={{-132,-110},{-124,-110},{-124,-118}},
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
  connect(s12.outlet, s13.inlet) annotation (Line(
      points={{-60,-110},{-48,-110},{-48,-116}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s14.inlet) annotation (Line(
      points={{-60,-110},{-48,-110},{-48,-6},{-28,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s15.inlet) annotation (Line(
      points={{-8,-6},{0,-6},{0,-16}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s16.inlet) annotation (Line(
      points={{-8,-6},{8,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s17.inlet) annotation (Line(
      points={{28,-6},{42,-6},{42,-10}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s18.inlet) annotation (Line(
      points={{28,-6},{58,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s18.outlet, s19.inlet) annotation (Line(
      points={{78,-6},{146,-6},{146,-24}},
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
  connect(s20.outlet, s22.inlet) annotation (Line(
      points={{146,-74},{146,-92}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s23.inlet) annotation (Line(
      points={{146,-112},{146,-124},{162,-124}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s24.inlet) annotation (Line(
      points={{146,-112},{146,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s26.inlet) annotation (Line(
      points={{146,-156},{146,-166},{180,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s25.inlet) annotation (Line(
      points={{146,-156},{146,-178}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s27.inlet) annotation (Line(
      points={{200,-166},{260,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s28.inlet) annotation (Line(
      points={{200,-166},{234,-166},{234,-184}},
      color={182,109,49},
      thickness=0.5));
  connect(s30.inlet, s28.outlet) annotation (Line(
      points={{234,-222},{234,-204}},
      color={182,109,49},
      thickness=0.5));
  connect(s28.outlet, s29.inlet) annotation (Line(
      points={{234,-204},{234,-214},{220,-214}},
      color={182,109,49},
      thickness=0.5));
  connect(s31.inlet, s19.inlet) annotation (Line(
      points={{110,-74},{112,-74},{112,-6},{146,-6},{146,-24}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.inlet, s31.outlet) annotation (Line(
      points={{110,-122},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.inlet, s31.outlet) annotation (Line(
      points={{92,-110},{92,-112},{110,-112},{110,-94}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.outlet, s33.inlet) annotation (Line(
      points={{110,-142},{110,-156}},
      color={182,109,49},
      thickness=0.5));
  connect(s33.outlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{110,-176},{110,-196}},
      color={182,109,49},
      thickness=0.5));
  connect(s35_ViaAndretta.inlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{92,-186},{110,-186},{110,-196}},
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
  connect(sds4.outlet, sds5.inlet) annotation (Line(
      points={{-124,92},{-124,100},{-106,100}},
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
      points={{48,232},{48,216},{60,216}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-146,218},{-122,218},{-122,210},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.inlet, sds16.outlet) annotation (Line(
      points={{-204,218},{-166,218}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.inlet, sds16.outlet) annotation (Line(
      points={{-184,236},{-184,218},{-166,218}},
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
      points={{49,283},{48,283},{48,252}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_3.inlet, s36_Stadio.outlet) annotation (Line(
      points={{36,-110},{72,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_1.inlet, s21.outlet) annotation (Line(
      points={{222,-82},{182,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_2.inlet, s30.outlet) annotation (Line(
      points={{234,-270},{234,-242}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser.inlet, s7.outlet) annotation (Line(
      points={{-298,-110},{-280,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser1.inlet, s6.outlet) annotation (Line(
      points={{-248,-68},{-248,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser2.inlet, s10.outlet) annotation (Line(
      points={{-124,-154},{-124,-138}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser3.inlet, s13.outlet) annotation (Line(
      points={{-48,-152},{-48,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser4.inlet, s35_ViaAndretta.outlet) annotation (Line(
      points={{54,-186},{72,-186}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser5.inlet, s34_ViaSalerno.outlet) annotation (Line(
      points={{110,-230},{110,-216}},
      color={182,109,49},
      thickness=0.5));
  connect(s25.outlet, idealUser6.inlet) annotation (Line(
      points={{146,-198},{146,-214}},
      color={182,109,49},
      thickness=0.5));
  connect(idealUser7.inlet, s29.outlet) annotation (Line(
      points={{184,-214},{200,-214}},
      color={182,109,49},
      thickness=0.5));
  connect(s27.outlet, idealUser8.inlet) annotation (Line(
      points={{280,-166},{292,-166}},
      color={182,109,49},
      thickness=0.5));
  connect(s23.outlet, idealUser9.inlet) annotation (Line(
      points={{182,-124},{202,-124}},
      color={182,109,49},
      thickness=0.5));
  connect(s17.outlet, idealUser10.inlet) annotation (Line(
      points={{42,-30},{42,-42}},
      color={182,109,49},
      thickness=0.5));
  connect(s15.outlet, idealUser11.inlet) annotation (Line(
      points={{0,-36},{0,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(sds5.outlet, idealUser12.inlet) annotation (Line(
      points={{-86,100},{-72,100}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.outlet, idealUser13.inlet) annotation (Line(
      points={{-184,256},{-184,272}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.outlet, Immissione_1.outlet) annotation (Line(
      points={{-166,-72},{-140,-72},{-140,-54},{-126,-54}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_1.in_m_flow0, m_flow_H2.y) annotation (Line(points={{-110,
          -59},{-112,-59},{-112,-72},{-84,-72},{-84,-26},{-90,-26}}, color={0,0,
          127}));
  connect(Immissione_2.outlet, sds17.outlet) annotation (Line(
      points={{-258,220},{-256,218},{-224,218}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-288,
          238},{-288,232},{-274,232},{-274,225}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}})),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_Simplified;
