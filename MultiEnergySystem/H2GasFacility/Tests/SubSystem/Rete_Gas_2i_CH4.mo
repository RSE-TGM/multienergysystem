within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
package Rete_Gas_2i_CH4
  "Rete Gas 2i used for comparison with LEGO and validation with static experimental data"

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
    parameter Real FrictionFactor = 0.009;
    parameter Boolean computeInertialTerm = false;
    parameter Integer n = 3 "Number of volumes in each pipeline";
    parameter Integer nX = 1 "Number of components in the gas fluid";
    parameter Types.MassFraction X_start[1] = {1};
    parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
    parameter Types.Density rho_nom = 0.657;

    parameter Types.Pressure p_nom = 4.93e5;
    parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
    parameter Types.Length kappa = 0.045e-3;
    parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;

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
      n=9,
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
    MultiEnergySystem.H2GasFacility.Sources.SourcePressure REMI(redeclare model
        Medium = Medium,
      p0=493000,
      T0=288.15,         X0
        =X_start,
      computeTransport=false)
                  "REMI - Sciacca Presa 2. Dati Taratura: 
Pressione = 4.93 bar;
Portata = 2088 Stm3/h;"                                         annotation (
        Placement(transformation(
          extent={{-24,-24},{24,24}},
          rotation=180,
          origin={-122,26})));
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
      n=33,
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
      n=17,
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
      n=11,
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
      n=7,
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
      n=15,
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
      n=7,
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
      n=19,
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
      n=11,
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
      n=5,
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
      n=7,
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
      n=27)            annotation (Placement(transformation(
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
      n=31)            annotation (Placement(transformation(
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
      n=7,
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
      n=5,
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
      n=81)            annotation (Placement(transformation(
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
      n=21)            annotation (Placement(transformation(
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
      n=135)           annotation (Placement(transformation(
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
      n=9,
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
      n=11)            annotation (Placement(transformation(
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
    inner System system(T_amb=288.15)
      annotation (Placement(transformation(extent={{-270,264},{-250,284}})));
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
    connect(s36_Stadio.outlet, GRM_3.inlet) annotation (Line(
        points={{72,-110},{36,-110}},
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
    connect(s21.outlet, GRM_1.inlet) annotation (Line(
        points={{182,-82},{222,-82}},
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
    connect(s30.outlet, GRM_2.inlet) annotation (Line(
        points={{234,-242},{234,-242},{234,-270}},
        color={182,109,49},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
              300}})),
      experiment(
        StopTime=100,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_nosources;

  model Rete_Gas_2i_2sources
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_nosources
                                    (              constantFrictionFactor = false, FrictionFactor = 0.003,
      sds7(pin_start=467300));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
      L=Data.PipelineData_2i.sds16.L,
      H=Data.PipelineData_2i.sds16.h,
      cm=Data.PipelineData_2i.sds16.cm,
      rhom=Data.PipelineData_2i.sds16.rhom,
      lambdam=Data.PipelineData_2i.sds16.lambdam,
      m_flow_start=Data.PipelineData_2i.sds16.m_flow_start,
      pin_start=Data.PipelineData_2i.sds16.pin_start,
      pout_start=Data.PipelineData_2i.sds16.pout_start,
      kappa=Data.PipelineData_2i.sds16.kappa,
      k=Data.PipelineData_2i.sds16.k,
      redeclare model Gas = Medium,
      X_start=X_start,
      Di=Data.PipelineData_2i.sds16.Di,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-188,218})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
      L=Data.PipelineData_2i.sds17.L,
      H=Data.PipelineData_2i.sds17.h,
      cm=Data.PipelineData_2i.sds17.cm,
      rhom=Data.PipelineData_2i.sds17.rhom,
      lambdam=Data.PipelineData_2i.sds17.lambdam,
      m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
      pin_start=Data.PipelineData_2i.sds17.pin_start,
      pout_start=Data.PipelineData_2i.sds17.pout_start,
      n=11,
      kappa=Data.PipelineData_2i.sds17.kappa,
      k=Data.PipelineData_2i.sds17.k,
      redeclare model Gas = Medium,
      X_start=X_start,
      Di=Data.PipelineData_2i.sds17.Di,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-246,218})));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={-300,220},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H1(
      duration=60,
      height=0.09889,
      offset=0,
      startTime=32400)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-399,224},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H5(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=46800)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-405,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-346,240},{-326,260}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
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
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-146,-58})));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={-96,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Ramp m_flow_H2(
      duration=60,
      height=0.09889,
      offset=0,
      startTime=3600)                                                                                         annotation (
      Placement(visible = true, transformation(origin={-51,52},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H3(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=18000)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-51,88},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{8,60},{28,80}})));
  equation
    connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-394,268},{-358,268},{
            -358,256},{-348,256}},  color={0,0,127}));
    connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,224},{-360,224},{
            -360,244},{-348,244}},  color={0,0,127}));
    connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-325,250},{
            -300,250},{-300,238},{-304,238},{-304,225},{-306,225}},
                                               color={0,0,127}));
    connect(sds16.inlet, sds11.outlet) annotation (Line(
        points={{-178,218},{-176,216},{-121,216},{-121,210}},
        color={182,109,49},
        thickness=0.5));
    connect(sds17.inlet, sds16.outlet) annotation (Line(
        points={{-236,218},{-198,218}},
        color={182,109,49},
        thickness=0.5));
    connect(Immissione_2.outlet, sds17.outlet) annotation (Line(
        points={{-290,220},{-288,218},{-256,218}},
        color={182,109,49},
        thickness=0.5));
    connect(m_flow_H3.y,add. u1) annotation (Line(points={{-40,88},{-4,88},{-4,76},
            {6,76}},      color={0,0,127}));
    connect(m_flow_H2.y,add. u2) annotation (Line(points={{-40,52},{-4,52},{-4,64},
            {6,64}},      color={0,0,127}));
    connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{29,70},{36,70},
            {36,12},{-80,12},{-80,-31},{-90,-31}},                 color={0,0,127}));
    connect(s3.inlet, s2.outlet) annotation (Line(
        points={{-156,-58},{-156,-60},{-198,-60},{-198,-44}},
        color={182,109,49},
        thickness=0.5));
    connect(s3.outlet, Immissione_1.outlet) annotation (Line(
        points={{-136,-58},{-136,-60},{-116,-60},{-116,-26},{-106,-26}},
        color={182,109,49},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StopTime=90000,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_2sources;

  model Rete_Gas_2i_3sources
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources
                                   (              break connect(GRM_7.inlet, sds8.outlet));
    // extends DistrictHeatingNetwork.Icons.Generic.InProgress;
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
      redeclare model Medium = Medium,
      p0=437100,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0.1,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={404,234},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H4(
      duration=60,
      height=0.09889,
      offset=0,
      startTime=61200)                                                                                        annotation (
      Placement(visible = true, transformation(origin={299,254},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H6(
      duration=360,
      height=-0.09889,
      offset=0,
      startTime=75600)                                                                                        annotation (
      Placement(visible = true, transformation(origin={293,298},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{352,270},{372,290}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo2(
      L=100,
      H=0,
      redeclare model Gas = Medium,
      X_start=X_start,
      Di=0.1325,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom,
      n=2) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={274,216})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
      L=100,
      H=0,
      redeclare model Gas = Medium,
      X_start=X_start,
      Di=0.1325,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom,
      n=2) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={338,190})));
  equation
    connect(m_flow_H6.y, add2.u1) annotation (Line(points={{304,298},{340,298},{
            340,286},{350,286}}, color={0,0,127}));
    connect(m_flow_H4.y, add2.u2) annotation (Line(points={{310,254},{338,254},{
            338,274},{350,274}}, color={0,0,127}));
    connect(add2.y, Immissione_3.in_m_flow0) annotation (Line(points={{373,280},{
            382,280},{382,239},{398,239}}, color={0,0,127}));
    connect(raccordo1.outlet, Immissione_3.outlet) annotation (Line(
        points={{348,190},{428,190},{428,234},{414,234}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_7.inlet, raccordo2.outlet) annotation (Line(
        points={{242,236},{244,236},{244,268},{274,268},{274,226}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo2.inlet, sds8.outlet) annotation (Line(
        points={{274,206},{276,206},{276,200},{242,200},{242,186}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo1.inlet, sds8.outlet) annotation (Line(
        points={{328,190},{286,190},{286,194},{242,194},{242,186}},
        color={182,109,49},
        thickness=0.5));
    annotation (experiment(
        StopTime=86000,
        __Dymola_NumberOfIntervals=100,
        Tolerance=1e-06,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_3sources;

  model Rete_Gas_2i_2sources_nV
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources
                                   (
      sds7(n=nV),
      s1(n=nV),
      sds8(n=nV),
      sds6(n=nV),
      sds3(n=nV),
      sds12(n=nV),
      sds15(n=nV),
      s2(n=nV),
      s4(n=nV),
      s11(n=nV),
      s14(n=nV),
      s16(n=nV),
      s18(n=nV),
      s31(n=nV),
      s36_Stadio(n=nV),
      s19(n=nV),
      sds1(n=nV),
      sds17(n=nV),
      sds16(n=nV),
      sds13(n=nV),
      sds14(n=nV),
      sds10(n=nV),
      sds11(n=nV),
      sds9(n=nV),
      sds4(n=nV),
      sds2(n=nV),
      s3(n=nV),
      s8(n=nV),
      s9(n=nV),
      s12(n=nV),
      s20(n=nV),
      s21(n=nV),
      s22(n=nV),
      s24(n=nV),
      s26(n=nV),
      s28(n=nV),
      s30(n=nV));
    parameter Integer nV = 5;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=54000, __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_2sources_nV;

  model Rete_Gas_2i_3sources_nV
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources_nV
                                   (
                                    break connect(GRM_7.inlet, sds8.outlet),
      m_flow_H2(offset=0.00001),
      m_flow_H1(offset=0.00001),
      s30(pin_start(displayUnit="bar")),
      GRM_2(p0(displayUnit="bar")),
      Immissione_2(p0=464600),
      Immissione_1(p0=482900));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
      redeclare model Medium = Medium,
      p0=437100,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0.1,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={422,202},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H4(
      duration=60,
      height=0.09889,
      offset=0,
      startTime=61200)                                                                                        annotation (
      Placement(visible = true, transformation(origin={317,222},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H6(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=75600)                                                                                        annotation (
      Placement(visible = true, transformation(origin={311,266},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{370,238},{390,258}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
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
          rotation=0,
          origin={356,158})));
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
          origin={272,220})));
  equation
    connect(m_flow_H6.y,add2. u1) annotation (Line(points={{322,266},{358,266},{
            358,254},{368,254}}, color={0,0,127}));
    connect(m_flow_H4.y,add2. u2) annotation (Line(points={{328,222},{356,222},{
            356,242},{368,242}}, color={0,0,127}));
    connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{391,248},{
            400,248},{400,207},{416,207}}, color={0,0,127}));
    connect(raccordo1.outlet,Immissione_3. outlet) annotation (Line(
        points={{366,158},{446,158},{446,202},{432,202}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_7.inlet, raccordo2.outlet) annotation (Line(
        points={{242,236},{242,230},{272,230}},
        color={182,109,49},
        thickness=0.5));
    connect(sds8.outlet, raccordo2.inlet) annotation (Line(
        points={{242,186},{242,204},{272,204},{272,210}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo1.inlet, sds8.outlet) annotation (Line(
        points={{346,158},{264,158},{264,204},{242,204},{242,186}},
        color={182,109,49},
        thickness=0.5));
    annotation (experiment(
        StopTime=90000,
        Interval=1,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_3sources_nV;

  model Rete_Gas_2i_nosources_REMI
    "Simplified version of Rete Gas 2i with only backbone and no sources with the Valve REMI station"
    extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4.Rete_Gas_2i_nosources
                                                                                 (break
        REMI);
    MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
      valveLinearOpening(
      redeclare model Medium = Medium,
      pin_start=6000000,
      Tin_start=288.15,
      Tout_start=288.15,
      X_start=X_start,
      m_flow_nom=0.41267,
      rho_in_nom=40.17625,
      PressureDropLinear=false)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-138,26})));
    MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      redeclare model Medium = Medium,
      p0=6000000,
      T0=288.15,
      X0=X_start)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-104,26})));
    Modelica.Blocks.Sources.Ramp opening1(
      height=0,
      duration=0,
      offset=1,
      startTime=200)                                                                                 annotation (
      Placement(visible = true, transformation(origin={-116,-8},   extent={{-6,-6},
              {6,6}},                                                                               rotation=0)));
  equation
    connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
        points={{-114,26},{-128,26}},
        color={182,109,49},
        thickness=0.5));
    connect(opening1.y,valveLinearOpening. opening)
      annotation (Line(points={{-109.4,-8},{-98,-8},{-98,8},{-138,8},{-138,18}},
                                                          color={0,0,127}));
    connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
        points={{-162,26},{-148,26}},
        color={182,109,49},
        thickness=0.5));
  end Rete_Gas_2i_nosources_REMI;

  model Rete_Gas_2i_2sources_REMI
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_nosources_REMI
                                         (              constantFrictionFactor = false, FrictionFactor = 0.003,
      sds7(pin_start=467300),
      sourcePressure(p0=6000000),
      valveLinearOpening(PressureDropLinear=false));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(
      L=Data.PipelineData_2i.sds16.L,
      H=Data.PipelineData_2i.sds16.h,
      cm=Data.PipelineData_2i.sds16.cm,
      rhom=Data.PipelineData_2i.sds16.rhom,
      lambdam=Data.PipelineData_2i.sds16.lambdam,
      m_flow_start=Data.PipelineData_2i.sds16.m_flow_start,
      pin_start=Data.PipelineData_2i.sds16.pin_start,
      pout_start=Data.PipelineData_2i.sds16.pout_start,
      kappa=Data.PipelineData_2i.sds16.kappa,
      k=Data.PipelineData_2i.sds16.k,
      redeclare model Medium = Medium,
      X_start=X_start,
      Di=Data.PipelineData_2i.sds16.Di,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=Data.PipelineData_2i.sds16.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-188,218})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(
      L=Data.PipelineData_2i.sds17.L,
      H=Data.PipelineData_2i.sds17.h,
      cm=Data.PipelineData_2i.sds17.cm,
      rhom=Data.PipelineData_2i.sds17.rhom,
      lambdam=Data.PipelineData_2i.sds17.lambdam,
      m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
      pin_start=Data.PipelineData_2i.sds17.pin_start,
      pout_start=Data.PipelineData_2i.sds17.pout_start,
      n=11,
      kappa=Data.PipelineData_2i.sds17.kappa,
      k=Data.PipelineData_2i.sds17.k,
      redeclare model Medium = Medium,
      X_start=X_start,
      Di=Data.PipelineData_2i.sds17.Di,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=Data.PipelineData_2i.sds17.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-246,218})));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0.00001,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={-300,220},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H1(
      duration=60,
      height=0.09889,
      offset=0.00001,
      startTime=32400)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-399,224},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H5(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=46800)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-405,268},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-346,240},{-326,260}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
      H=Data.PipelineData_2i.s3.h,
      cm=Data.PipelineData_2i.s3.cm,
      rhom=Data.PipelineData_2i.s3.rhom,
      lambdam=Data.PipelineData_2i.s3.lambdam,
      m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
      pin_start=Data.PipelineData_2i.s3.pin_start,
      pout_start=Data.PipelineData_2i.s3.pout_start,
      kappa=Data.PipelineData_2i.s3.kappa,
      k=Data.PipelineData_2i.s3.k,
      redeclare model Medium = Medium,
      L=Data.PipelineData_2i.s3.L,
      X_start=X_start,
      Di=Data.PipelineData_2i.s3.Di,
      quasiStatic=quasiStatic,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=Data.PipelineData_2i.s3.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-146,-58})));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0.00001,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={-96,-26},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Ramp m_flow_H2(
      duration=60,
      height=0.09889,
      offset=0.00001,
      startTime=3600)                                                                                         annotation (
      Placement(visible = true, transformation(origin={-51,52},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H3(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=18000)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-51,88},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{8,60},{28,80}})));
  equation
    connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-394,268},{-358,268},{
            -358,256},{-348,256}},  color={0,0,127}));
    connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,224},{-360,224},{
            -360,244},{-348,244}},  color={0,0,127}));
    connect(add1.y, Immissione_2.in_m_flow0) annotation (Line(points={{-325,250},{
            -300,250},{-300,238},{-304,238},{-304,225},{-306,225}},
                                               color={0,0,127}));
    connect(sds16.inlet, sds11.outlet) annotation (Line(
        points={{-178,218},{-176,216},{-121,216},{-121,210}},
        color={182,109,49},
        thickness=0.5));
    connect(sds17.inlet, sds16.outlet) annotation (Line(
        points={{-236,218},{-198,218}},
        color={182,109,49},
        thickness=0.5));
    connect(Immissione_2.outlet, sds17.outlet) annotation (Line(
        points={{-290,220},{-288,218},{-256,218}},
        color={182,109,49},
        thickness=0.5));
    connect(m_flow_H3.y,add. u1) annotation (Line(points={{-40,88},{-4,88},{-4,76},
            {6,76}},      color={0,0,127}));
    connect(m_flow_H2.y,add. u2) annotation (Line(points={{-40,52},{-4,52},{-4,64},
            {6,64}},      color={0,0,127}));
    connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{29,70},{36,70},
            {36,12},{-80,12},{-80,-31},{-90,-31}},                 color={0,0,127}));
    connect(s3.inlet, s2.outlet) annotation (Line(
        points={{-156,-58},{-156,-60},{-198,-60},{-198,-44}},
        color={182,109,49},
        thickness=0.5));
    connect(s3.outlet, Immissione_1.outlet) annotation (Line(
        points={{-136,-58},{-136,-60},{-116,-60},{-116,-26},{-106,-26}},
        color={182,109,49},
        thickness=0.5));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StopTime=90000,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_2sources_REMI;

  model Rete_Gas_2i_2sources_REMI_nV
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources_nV
                                   (
      break REMI,
      m_flow_H1(height=0, offset=0),
      m_flow_H2(offset=0.0001),
      m_flow_H5(height=0, offset=0));
    MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
      valveLinearOpening(
      redeclare model Medium = Medium,
      pin_start=6000000,
      Tin_start=288.15,
      Tout_start=288.15,
      X_start=X_start,
      m_flow_nom=0.41245,
      PressureDropLinear=false)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-134,26})));
    MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      p0=6000000,
      redeclare model Medium = Medium,
      T0=288.15,
      X0=X_start)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-100,26})));
    Modelica.Blocks.Sources.Ramp opening1(
      height=0,
      duration=0,
      offset=1,
      startTime=200)                                                                                 annotation (
      Placement(visible = true, transformation(origin={-146,-4},   extent={{-6,-6},
              {6,6}},                                                                               rotation=0)));
  equation
    connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
        points={{-110,26},{-124,26}},
        color={182,109,49},
        thickness=0.5));
    connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
        points={{-162,26},{-144,26}},
        color={182,109,49},
        thickness=0.5));
    connect(opening1.y, valveLinearOpening.opening)
      annotation (Line(points={{-139.4,-4},{-134,-4},{-134,18}},
                                                               color={0,0,127}));
  end Rete_Gas_2i_2sources_REMI_nV;

  model Rete_Gas_2i_2sources_controlled
    "The valve is controlled in order to not overcome the maximum pressure of the net."
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources_nV
                                   (
      break REMI,
      m_flow_H2(offset=0.001),
      Immissione_1(m_flow0=0.0001),
      m_flow_H1(offset=0.00001));
    MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
      valveLinearOpening(
      redeclare model Medium = Medium,
      pin_start=6000000,
      Tin_start=288.15,
      Tout_start=288.15,
      X_start=X_start,
      m_flow_nom=0.41245 + 0*0.41055,
      PressureDropLinear=false)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-114,26})));
    MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      p0=6000000,
      redeclare model Medium = Medium,
      T0=288.15,
      X0=X_start)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-80,26})));
    Sensors.IdealPressureSensor idealPressureSensor(
      pin_start=493000,
      pout_start=493000,
      Tin_start=288.15,
      Tout_start=288.15,
      m_flow_start=0.4110,
      hin_start=-4650159.5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-144,26})));
    Controllers.Valve_controller valve_controller
      annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  equation
    connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
        points={{-90,26},{-104,26}},
        color={182,109,49},
        thickness=0.5));
    connect(s1.inlet, idealPressureSensor.outlet) annotation (Line(
        points={{-162,26},{-154,26}},
        color={182,109,49},
        thickness=0.5));
    connect(idealPressureSensor.inlet, valveLinearOpening.outlet) annotation (
        Line(
        points={{-134,26},{-124,26}},
        color={182,109,49},
        thickness=0.5));
    connect(valve_controller.P_meas, idealPressureSensor.p_meas) annotation (Line(
          points={{-140.8,0},{-150,0},{-150,18},{-147.8,18},{-147.8,18.6}}, color
          ={0,0,127}));
    connect(valve_controller.ACT_x, valveLinearOpening.opening)
      annotation (Line(points={{-118.6,0},{-114,0},{-114,18}}, color={0,0,127}));
  end Rete_Gas_2i_2sources_controlled;

  model Rete_Gas_2i_3sources_controlled
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources_controlled
                                           (break connect(GRM_7.inlet, sds8.outlet));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_3(
      redeclare model Medium = Medium,
      p0=437100,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0.1,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={460,196},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H4(
      duration=60,
      height=0.09889,
      offset=0,
      startTime=61200)                                                                                        annotation (
      Placement(visible = true, transformation(origin={355,216},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H6(
      duration=60,
      height=-0.09889,
      offset=0,
      startTime=75600)                                                                                        annotation (
      Placement(visible = true, transformation(origin={349,260},     extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{408,232},{428,252}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV raccordo1(
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
          rotation=0,
          origin={394,152})));
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
          origin={282,222})));
  equation
    connect(m_flow_H6.y,add2. u1) annotation (Line(points={{360,260},{396,260},{
            396,248},{406,248}}, color={0,0,127}));
    connect(m_flow_H4.y,add2. u2) annotation (Line(points={{366,216},{394,216},{
            394,236},{406,236}}, color={0,0,127}));
    connect(add2.y,Immissione_3. in_m_flow0) annotation (Line(points={{429,242},{
            438,242},{438,201},{454,201}}, color={0,0,127}));
    connect(raccordo1.outlet,Immissione_3. outlet) annotation (Line(
        points={{404,152},{484,152},{484,196},{470,196}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo1.inlet, sds8.outlet) annotation (Line(
        points={{384,152},{264,152},{264,196},{242,196},{242,186}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo2.outlet, GRM_7.inlet) annotation (Line(
        points={{282,232},{282,272},{242,272},{242,236}},
        color={182,109,49},
        thickness=0.5));
    connect(raccordo2.inlet, sds8.outlet) annotation (Line(
        points={{282,212},{282,192},{264,192},{264,196},{242,196},{242,186}},
        color={182,109,49},
        thickness=0.5));
    annotation (experiment(
        StopTime=90000,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end Rete_Gas_2i_3sources_controlled;

  model Rete_Gas_2i_complete
    extends Rete_Gas_2i_CH4.Rete_Gas_2i_2sources
                                   (
      break connect(s19.outlet, s18.inlet),
      break connect(s18.inlet, s31.outlet),
      break connect(s20.inlet, s21.outlet),
      break connect(s26.inlet, s28.outlet),
      break connect(s24.inlet, s26.outlet),
      m_flow_H2(height=0.1, offset=0.1),
      m_flow_H1(height=0.1, offset=0.1),
      break connect(s18.outlet, s31.inlet),
      break connect(s19.inlet, s18.outlet),
      break connect(s22.inlet, s21.inlet),
      break connect(s20.outlet, s21.inlet),
      break connect(s19.outlet, s20.inlet));
    extends DistrictHeatingNetwork.Icons.Generic.InProgress;

    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds18(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-210,282},{-190,302}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-324,-118},{-304,-98}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser1(
      redeclare model Medium = Medium,
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-274,-76},{-254,-56}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s10(
    redeclare model Medium = Medium,
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
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-104,-240},{-84,-220}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser3(
      redeclare model Medium = Medium,
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-32,-238},{-12,-218}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s15(
      redeclare model Medium = Medium,
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
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{34,-80},{54,-60}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser11(
      redeclare model Medium = Medium,
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{-8,-82},{12,-62}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s32(
      redeclare model Medium = Medium,
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
      redeclare model Medium = Medium,
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
      redeclare model Medium = Medium,
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
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{100,-250},{120,-230}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser idealUser4(
      redeclare model Medium = Medium,
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{36,-206},{56,-186}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s25(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{136,-264},{156,-244}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s23(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{244,-136},{264,-116}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s27(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{318,-176},{338,-156}})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s29(
      redeclare model Medium = Medium,
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
      m_flow0=1e-7,
      X0=X_start)
      annotation (Placement(transformation(extent={{174,-224},{194,-204}})));
  equation
    connect(sds18.outlet,idealUser13. inlet) annotation (Line(
        points={{-200,266},{-200,292}},
        color={182,109,49},
        thickness=0.5));
    connect(sds18.inlet, sds16.outlet) annotation (Line(
        points={{-200,246},{-202,246},{-202,218},{-198,218}},
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
    connect(s25.inlet, s24.outlet) annotation (Line(
        points={{146,-196},{146,-156}},
        color={182,109,49},
        thickness=0.5));
    connect(s29.inlet, s30.inlet) annotation (Line(
        points={{220,-214},{234,-214},{234,-222}},
        color={182,109,49},
        thickness=0.5));
    connect(s27.inlet, s26.outlet) annotation (Line(
        points={{292,-166},{200,-166}},
        color={182,109,49},
        thickness=0.5));
    connect(s35_ViaAndretta.inlet, s33.outlet) annotation (Line(
        points={{92,-196},{110,-196},{110,-186}},
        color={182,109,49},
        thickness=0.5));
    connect(s34_ViaSalerno.inlet, s33.outlet) annotation (Line(
        points={{110,-206},{110,-186}},
        color={182,109,49},
        thickness=0.5));
    connect(s23.inlet, s24.inlet) annotation (Line(
        points={{214,-126},{180,-126},{180,-124},{146,-124},{146,-136}},
        color={182,109,49},
        thickness=0.5));
    connect(s17.inlet, s18.inlet) annotation (Line(
        points={{44,-38},{44,-6},{58,-6}},
        color={182,109,49},
        thickness=0.5));
    connect(s15.inlet, s16.inlet) annotation (Line(
        points={{2,-44},{2,-6},{8,-6}},
        color={182,109,49},
        thickness=0.5));
    connect(s13.inlet, s12.outlet) annotation (Line(
        points={{-22,-192},{-22,-110},{-60,-110}},
        color={182,109,49},
        thickness=0.5));
    connect(s10.inlet, s11.inlet) annotation (Line(
        points={{-122,-150},{-122,-110},{-114,-110}},
        color={182,109,49},
        thickness=0.5));
    connect(s5_ViaCartabubbo.inlet, s8.inlet) annotation (Line(
        points={{-232,-108},{-200,-108},{-200,-110},{-184,-110}},
        color={182,109,49},
        thickness=0.5));
    connect(s32.inlet, s31.outlet) annotation (Line(
        points={{110,-132},{110,-94}},
        color={182,109,49},
        thickness=0.5));
    connect(s18.outlet, s19.inlet) annotation (Line(
        points={{78,-6},{146,-6},{146,-24}},
        color={182,109,49},
        thickness=0.5));
    connect(s31.inlet, s19.inlet) annotation (Line(
        points={{110,-74},{110,-6},{146,-6},{146,-24}},
        color={182,109,49},
        thickness=0.5));
    connect(s22.inlet, s20.outlet) annotation (Line(
        points={{146,-92},{146,-74}},
        color={182,109,49},
        thickness=0.5));
    connect(s21.inlet, s20.outlet) annotation (Line(
        points={{162,-82},{146,-82},{146,-74}},
        color={182,109,49},
        thickness=0.5));
    connect(s20.inlet, s19.outlet) annotation (Line(
        points={{146,-54},{146,-44}},
        color={182,109,49},
        thickness=0.5));
    annotation (experiment(
        StopTime=0,
        Interval=2,
        Tolerance=0.001,
        __Dymola_Algorithm="Dassl"),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
      Icon(coordinateSystem(preserveAspectRatio=false)));
  end Rete_Gas_2i_complete;
end Rete_Gas_2i_CH4;
