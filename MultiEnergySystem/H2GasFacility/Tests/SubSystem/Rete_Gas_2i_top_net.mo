within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_top_net
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
  parameter Boolean constantFrictionFactor = false;
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
    X_start=X_start,                                    redeclare model Medium =            Medium,Di=
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
    constantFrictionFactor=false,
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
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
    L=194.511,
    redeclare model Medium = Medium,
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
        origin={-152,226})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
    L=1077.595,
    redeclare model Medium = Medium,
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
        origin={-210,226})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    X0=X_start,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-264,228},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    duration=60,
    height=0.09125,
    offset=0,
    startTime=32400)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-369,248},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    duration=360,
    height=-0.09125,
    offset=0,
    startTime=46800)                                                                                        annotation (
    Placement(visible = true, transformation(origin={-375,292},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-316,264},{-296,284}})));
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
  connect(sds17.inlet,sds16. outlet) annotation (Line(
      points={{-200,226},{-162,226}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet,sds17. outlet) annotation (Line(
      points={{-254,228},{-252,226},{-220,226}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-142,226},{-121,226},{-121,210}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-364,292},{-328,292},
          {-328,280},{-318,280}}, color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-358,248},{-330,248},
          {-330,268},{-318,268}}, color={0,0,127}));
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-295,274},
          {-286,274},{-286,233},{-270,233}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}})),
    experiment(
      StopTime=5400,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Rete_Gas_2i_top_net;
