within MultiEnergySystem.CaseStudies;
package Report_122025
  "Set of tests which have been developed for the study of the hydrogen injection in a local italian natural gas distribution network"
  extends Modelica.Icons.ExamplesPackage;

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
    parameter H2GasFacility.Types.MassFraction X_start[nX]={1,0};
    //parameter Types.MassFraction X_start[nX] = {1, 0, 0, 0};
    parameter H2GasFacility.Types.MassFlowRate m_flow_H2_ref=0.005;
    parameter H2GasFacility.Types.Density rho_nom=0.657;

    parameter H2GasFacility.Types.Pressure p_nom=4.93e5;
    parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
    parameter H2GasFacility.Types.Length kappa=0.045e-3;
    parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
    //parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
    parameter Integer nV = 3;

    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(
      H=H2GasFacility.Data.PipelineData_2i.s1.h,
      cm=H2GasFacility.Data.PipelineData_2i.s1.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s1.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s1.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s1.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s1.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s1.pout_start,
      redeclare model Gas = Medium,
      pin_nom=H2GasFacility.Data.PipelineData_2i.s1.pin_start,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s1.rho_nom,
      ff_nom=FrictionFactor,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s1.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s1.k,
      L=H2GasFacility.Data.PipelineData_2i.s1.L,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s1.Di,
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
      H=H2GasFacility.Data.PipelineData_2i.s2.h,
      t=H2GasFacility.Data.PipelineData_2i.s2.t,
      cm=H2GasFacility.Data.PipelineData_2i.s2.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s2.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s2.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s2.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s2.pin_start,
      redeclare model Gas = Medium,
      pout_start=H2GasFacility.Data.PipelineData_2i.s2.pout_start,
      ff_nom=FrictionFactor,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s2.rho_nom,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s2.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s2.k,
      L=H2GasFacility.Data.PipelineData_2i.s2.L,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s2.Di,
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
      H=H2GasFacility.Data.PipelineData_2i.s4.h
                                  +H2GasFacility.Data.PipelineData_2i.s8.h,
      cm=H2GasFacility.Data.PipelineData_2i.s4.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s4.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.s4.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s4.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s4.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s8.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s4.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s4.k,
      L=H2GasFacility.Data.PipelineData_2i.s4.L
                                  +H2GasFacility.Data.PipelineData_2i.s8.L,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s4.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s4.rho_nom)
                                               annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-200,-82})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9e11(
      H=H2GasFacility.Data.PipelineData_2i.s9.h
                                  +H2GasFacility.Data.PipelineData_2i.s11.h,
      cm=H2GasFacility.Data.PipelineData_2i.s9.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s9.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.s9.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s9.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s9.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s11.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s9.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s9.k,
      L=H2GasFacility.Data.PipelineData_2i.s9.L
                                  +H2GasFacility.Data.PipelineData_2i.s11.L,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s9.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s9.rho_nom)
                                               annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-142,-110})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(
      L=H2GasFacility.Data.PipelineData_2i.s12.L,
      H=H2GasFacility.Data.PipelineData_2i.s12.h,
      cm=H2GasFacility.Data.PipelineData_2i.s12.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.s12.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s12.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s12.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s12.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s12.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s12.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s12.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s12.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s12.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-70,-110})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14e16e18(
      L=H2GasFacility.Data.PipelineData_2i.s14.L
                                   +H2GasFacility.Data.PipelineData_2i.s16.L
                                                                +H2GasFacility.Data.PipelineData_2i.s18.L,
      H=H2GasFacility.Data.PipelineData_2i.s14.h
                                   +H2GasFacility.Data.PipelineData_2i.s16.h
                                                                +H2GasFacility.Data.PipelineData_2i.s18.h,
      cm=H2GasFacility.Data.PipelineData_2i.s14.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s14.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.s14.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s14.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s14.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s18.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s14.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s14.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s14.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s14.rho_nom)
                                                annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-18,-6})));

    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
      L=H2GasFacility.Data.PipelineData_2i.s19.L,
      H=H2GasFacility.Data.PipelineData_2i.s19.h,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s19.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s19.pin_start,
      redeclare model Gas = Medium,
      pout_start=H2GasFacility.Data.PipelineData_2i.s19.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s19.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s19.k,
      cm=H2GasFacility.Data.PipelineData_2i.s19.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s19.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s19.lambdam,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s19.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s19.rho_nom)
                       "Polyester" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={146,-34})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(
      L=H2GasFacility.Data.PipelineData_2i.s20.L,
      H=H2GasFacility.Data.PipelineData_2i.s20.h,
      cm=H2GasFacility.Data.PipelineData_2i.s20.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.s20.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s20.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s20.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s20.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s20.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s20.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s20.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s20.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s20.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={146,-64})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(
      L=H2GasFacility.Data.PipelineData_2i.s21.L,
      H=H2GasFacility.Data.PipelineData_2i.s21.h,
      cm=H2GasFacility.Data.PipelineData_2i.s21.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.s21.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s21.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s21.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s21.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s21.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s21.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s21.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s21.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s21.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={172,-82})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22e24(
      L=H2GasFacility.Data.PipelineData_2i.s22.L
                                   +H2GasFacility.Data.PipelineData_2i.s24.L,
      cm=H2GasFacility.Data.PipelineData_2i.s22.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s22.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s22.lambdam,
      redeclare model Gas = Medium,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s22.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s22.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s24.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s22.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s22.k,
      H=H2GasFacility.Data.PipelineData_2i.s22.h
                                   +H2GasFacility.Data.PipelineData_2i.s24.h,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s22.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s22.rho_nom)
                                                annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={146,-102})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(
      L=H2GasFacility.Data.PipelineData_2i.s26.L,
      H=H2GasFacility.Data.PipelineData_2i.s26.h,
      cm=H2GasFacility.Data.PipelineData_2i.s26.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s26.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.s26.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s26.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s26.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s26.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s26.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s26.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s26.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s26.rho_nom)
                       "Viale Siena" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={190,-166})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28e30(
      L=H2GasFacility.Data.PipelineData_2i.s28.L
                                   +H2GasFacility.Data.PipelineData_2i.s30.L,
      H=H2GasFacility.Data.PipelineData_2i.s28.h
                                   +H2GasFacility.Data.PipelineData_2i.s30.h,
      cm=H2GasFacility.Data.PipelineData_2i.s28.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.s28.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s28.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s28.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s28.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s30.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.s28.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s28.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s28.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s28.rho_nom)
                                                annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={234,-194})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(
      L=H2GasFacility.Data.PipelineData_2i.s31.L,
      H=H2GasFacility.Data.PipelineData_2i.s31.h,
      redeclare model Gas = Medium,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s31.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s31.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s31.pout_start,
      n=nV,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s31.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s31.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={110,-84})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(
      L=H2GasFacility.Data.PipelineData_2i.s36.L,
      H=H2GasFacility.Data.PipelineData_2i.s36.h,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s36.m_flow_start,
      redeclare model Gas = Medium,
      pin_start=H2GasFacility.Data.PipelineData_2i.s36.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s36.pout_start,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s36.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      ff_nom=FrictionFactor,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.s36.rho_nom,
      n=nV)            annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={82,-110})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds1(
      L=H2GasFacility.Data.PipelineData_2i.sds1.L,
      H=H2GasFacility.Data.PipelineData_2i.sds1.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds1.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds1.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds1.lambdam,
      redeclare model Gas = Medium,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds1.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds1.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds1.pout_start,
      ff_nom=FrictionFactor,
      kappa=H2GasFacility.Data.PipelineData_2i.sds1.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds1.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds1.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds1.rho_nom,
      n=nV)            annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-198,46})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds2(
      L=H2GasFacility.Data.PipelineData_2i.sds2.L,
      H=H2GasFacility.Data.PipelineData_2i.sds2.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds2.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.sds2.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds2.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds2.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds2.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds2.pout_start,
      X_start=X_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds2.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds2.k,
      Di=H2GasFacility.Data.PipelineData_2i.sds2.Di,
          massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      ff_nom=FrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds2.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-180,66})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds3(
      L=H2GasFacility.Data.PipelineData_2i.sds3.L,
      H=H2GasFacility.Data.PipelineData_2i.sds3.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds3.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds3.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds3.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds3.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds3.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds3.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds3.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds3.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds3.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds3.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-146,66})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds7e8(
      L=H2GasFacility.Data.PipelineData_2i.sds7.L
                                    +H2GasFacility.Data.PipelineData_2i.sds8.L,
      H=H2GasFacility.Data.PipelineData_2i.sds7.h
                                    +H2GasFacility.Data.PipelineData_2i.sds8.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds7.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds7.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds7.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds7.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds7.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds8.pout_start,
      kappa=H2GasFacility.Data.PipelineData_2i.sds7.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds7.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds7.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds7.rho_nom,
      n=nV) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={162,140})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds9(
      L=H2GasFacility.Data.PipelineData_2i.sds9.L,
      H=H2GasFacility.Data.PipelineData_2i.sds9.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds9.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.sds9.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds9.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds9.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds9.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds9.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds9.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds9.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds9.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds9.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-122,162})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds10(
      L=H2GasFacility.Data.PipelineData_2i.sds10.L,
      H=H2GasFacility.Data.PipelineData_2i.sds10.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds10.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds10.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds10.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds10.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds10.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds10.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds10.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds10.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds10.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds10.rho_nom)
                  annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-154,180})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds11e12(
      L=H2GasFacility.Data.PipelineData_2i.sds11.L
                                     +H2GasFacility.Data.PipelineData_2i.sds12.L,
      H=H2GasFacility.Data.PipelineData_2i.sds11.h
                                     +H2GasFacility.Data.PipelineData_2i.sds12.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds11.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds11.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds11.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds11.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds11.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds11.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds11.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds11.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds11.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds11.rho_nom)
                                                  annotation (Placement(
          transformation(
          extent={{-9,-9},{9,9}},
          rotation=90,
          origin={-121,201})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds13(
      L=H2GasFacility.Data.PipelineData_2i.sds13.L,
      H=H2GasFacility.Data.PipelineData_2i.sds13.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds13.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.sds13.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds13.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds13.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds13.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds13.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds13.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds13.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds13.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds13.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={24,202})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds14(
      L=H2GasFacility.Data.PipelineData_2i.sds14.L,
      H=H2GasFacility.Data.PipelineData_2i.sds14.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds14.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.sds14.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds14.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds14.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds14.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds14.pout_start,
      X_start=X_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds14.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds14.k,
      Di=H2GasFacility.Data.PipelineData_2i.sds14.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds14.rho_nom)
                       annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={70,216})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds15(
      L=H2GasFacility.Data.PipelineData_2i.sds15.L,
      H=H2GasFacility.Data.PipelineData_2i.sds15.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds15.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.sds15.rhom,
      redeclare model Gas = Medium,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds15.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds15.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds15.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds15.pout_start,
      kappa=H2GasFacility.Data.PipelineData_2i.sds15.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds15.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds15.Di,
        massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds15.rho_nom,
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
      pin_start=Data.PipelineData_2i.sds8.pout_start,
      pout_start=Data.PipelineData_2i.sds8.pout_start,
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
      p_start=H2GasFacility.Data.PipelineData_2i.sds11.pin_start,
      X_start=X_start,
      T_start=288.15)                  annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={-120,184})));
    MultiEnergySystem.H2GasFacility.Components.Manifold.HomotopyInitializer homotopyInitializer1(
      redeclare model Medium = Medium,
      p_start=H2GasFacility.Data.PipelineData_2i.s2.pin_start,
      X_start=X_start,
      T_start=288.15)                  annotation (Placement(transformation(
          extent={{4,-4},{-4,4}},
          rotation=90,
          origin={-200,0})));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds4e6(
      L=H2GasFacility.Data.PipelineData_2i.sds4.L
                                    +H2GasFacility.Data.PipelineData_2i.sds6.L,
      H=H2GasFacility.Data.PipelineData_2i.sds4.h
                                    +H2GasFacility.Data.PipelineData_2i.sds6.h,
      cm=H2GasFacility.Data.PipelineData_2i.sds4.cm,
      redeclare model Gas = Medium,
      rhom=H2GasFacility.Data.PipelineData_2i.sds4.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.sds4.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.sds4.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.sds4.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.sds6.pout_start,
      n=nV,
      kappa=H2GasFacility.Data.PipelineData_2i.sds4.kappa,
      k=H2GasFacility.Data.PipelineData_2i.sds4.k,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.sds4.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      ff_nom=FrictionFactor,
      hctype=hctype,
      momentum=momentum,
      rho_nom=H2GasFacility.Data.PipelineData_2i.sds4.rho_nom)
                                                 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-120,100})));
  equation
    connect(sds2.inlet, sds1.outlet) annotation (Line(
        points={{-190,66},{-198,66},{-198,56}},
        color={182,109,49},
        thickness=0.5));
    connect(sds2.outlet, sds3.inlet) annotation (Line(
        points={{-170,66},{-156,66}},
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

    connect(s1.outlet, sds1.inlet) annotation (Line(
        points={{-182,26},{-198,26},{-198,36}},
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
    connect(homotopyInitializer.outlet, sds11e12.inlet) annotation (Line(
        points={{-120,188},{-120,190},{-121,190},{-121,192}},
        color={182,109,49},
        thickness=0.5));
    connect(homotopyInitializer1.inlet, sds1.inlet) annotation (Line(
        points={{-200,4},{-200,28},{-198,28},{-198,36}},
        color={182,109,49},
        thickness=0.5));
    connect(homotopyInitializer1.outlet, s2.inlet) annotation (Line(
        points={{-200,-4},{-200,-16},{-198,-16},{-198,-24}},
        color={182,109,49},
        thickness=0.5));
    connect(sds3.outlet, sds4e6.inlet) annotation (Line(
        points={{-136,66},{-128,66},{-128,64},{-120,64},{-120,90}},
        color={182,109,49},
        thickness=0.5));
    connect(sds4e6.outlet, sds9.inlet) annotation (Line(
        points={{-120,110},{-122,110},{-122,152}},
        color={182,109,49},
        thickness=0.5));
    connect(sds7e8.inlet, sds9.inlet) annotation (Line(
        points={{152,140},{16,140},{16,134},{-122,134},{-122,152}},
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
    connect(sds7e8.outlet, raccordo2.inlet) annotation (Line(
        points={{172,140},{242,140},{242,200}},
        color={182,109,49},
        thickness=0.5));
    connect(sds11e12.outlet, sds13.inlet) annotation (Line(
        points={{-121,210},{-121,216},{-122,216},{-122,220},{-54,220},{-54,202},{
            14,202}},
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

  model Rete_Gas_2i_pipes_users
    extends H2GasFacility.Tests.SubSystem.RG2i_controllers.Rete_Gas_2i_pipes(
      raccordo2(pin_start=H2GasFacility.Data.PipelineData_2i.sds8.pout_start,
          pout_start=H2GasFacility.Data.PipelineData_2i.sds8.pout_start),
      constantFrictionFactor=false,
      massFractionDynamicBalance=false);
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(
      redeclare model Medium = Medium,
      p0=463200,
      m_flow0=0.021261,
      X0=X_start)
      "Viale Berlinguer"
      annotation (Placement(transformation(extent={{-212,154},{-168,198}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(
      redeclare model Medium = Medium,
      p0=460300,
      m_flow0=0.007765,
      X0=X_start)
      "Via 25 Aprile"
      annotation (Placement(transformation(extent={{28,262},{66,300}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
      redeclare model Medium = Medium,
      p0=461900,
      m_flow0=0.019358,
      X0=X_start)                                                                                     "Via Marx"
      annotation (Placement(transformation(extent={{88,200},{122,234}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(
      redeclare model Medium = Medium,
      p0=437100,
      m_flow0=0.098685,
      X0=X_start)
      "Contessa Entellina Ingresso paese SP.12 "
      annotation (Placement(transformation(extent={{222,234},{262,274}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
      redeclare model Medium = Medium,
      p0=459100,
      m_flow0=0.034069,
      X0=X_start)
      "C.so Marsiglia"
      annotation (Placement(transformation(extent={{40,-128},{76,-92}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(
      redeclare model Medium = Medium,
      p0=459500,
      m_flow0=0.112338,
      X0=X_start)                                                                                     "Osèedaòe"
      annotation (Placement(transformation(extent={{188,-102},{228,-62}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(
      redeclare model Medium = Medium,
      p0=454700,
      m_flow0=0.119588,
      X0=X_start)                                                                                     "Via Lioni"
      annotation (Placement(transformation(extent={{214,-286},{258,-242}})));
    MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
      valveLinearOpening(
      redeclare model Medium = Medium,
      pin_start=6000000,
      Tin_start=288.15,
      Tout_start=288.15,
      X_start=X_start,
      PressureDropLinear=false)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-102,26})));
    MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      p0=6000000,
      redeclare model Medium = Medium,
      T0=288.15,
      X0=X_start)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-68,26})));
    H2GasFacility.Sensors.IdealPressureSensor idealPressureSensor(
      redeclare model Medium = Medium,
      pin_start=493000,
      pout_start=493000,
      Tin_start=288.15,
      Tout_start=288.15,
      X_start=X_start,
      m_flow_start=0.4110) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-132,26})));
  equation
    connect(GRM_4.inlet, sds10.outlet) annotation (Line(
        points={{-190,176},{-178,176},{-178,180},{-164,180}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_5.inlet, sds15.outlet) annotation (Line(
        points={{47,281},{46,281},{46,252}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_6.inlet, sds14.outlet) annotation (Line(
        points={{105,217},{104,216},{80,216}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_7.inlet, raccordo2.outlet) annotation (Line(
        points={{242,254},{242,220}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_3.inlet, s36_Stadio.outlet) annotation (Line(
        points={{58,-110},{72,-110}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_1.inlet, s21.outlet) annotation (Line(
        points={{208,-82},{182,-82}},
        color={182,109,49},
        thickness=0.5));
    connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
        points={{-78,26},{-92,26}},
        color={182,109,49},
        thickness=0.5));
    connect(s1.inlet,idealPressureSensor. outlet) annotation (Line(
        points={{-162,26},{-142,26}},
        color={182,109,49},
        thickness=0.5));
    connect(idealPressureSensor.inlet,valveLinearOpening. outlet) annotation (
        Line(
        points={{-122,26},{-112,26}},
        color={182,109,49},
        thickness=0.5));
    connect(GRM_2.inlet, s28e30.outlet) annotation (Line(
        points={{236,-264},{234,-264},{234,-204}},
        color={182,109,49},
        thickness=0.5));
    annotation (experiment(
        StopTime=100,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
  end Rete_Gas_2i_pipes_users;

  model RG2i_source1
    extends Rete_Gas_2i_pipes_users;
    H2GasFacility.Components.Pipes.Round1DFV                   s3(
      n=nV,
      H=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.h,
      cm=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.cm,
      rhom=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.rhom,
      lambdam=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.lambdam,
      m_flow_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.m_flow_start,
      pin_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.pin_start,
      pout_start=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.pout_start,
      kappa=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.kappa,
      k=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.k,
      redeclare model Gas = Medium,
      L=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.L,
      X_start=X_start,
      Di=CaseStudies.GasNetwork_2iRG.PipelineData_2i.s3.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-92,-60})));
    H2GasFacility.Sources.SourceMassFlow                   Immissione_1(
      X0=X_start,
      m_flow0=0.0001,
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      computeEnthalpyWithFixedPressure=true,
      use_in_m_flow0=true,
      use_in_X0=true)      annotation (Placement(visible=true, transformation(
          origin={-2,24},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    Modelica.Blocks.Sources.Ramp m_flow_H2(
      offset=0.001*0,
      duration=300,
      height=25/3600,
      startTime=3600)                                                                                         annotation (
      Placement(visible = true, transformation(origin={-19,56},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H3(
      duration=300,
      height=-25/3600,
      offset=0,
      startTime=18000)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-19,92},      extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{40,64},{60,84}})));
    Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > (3600)
           and time < (18000 + 300)) then {0,1} else {1,0})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={36,8})));
  equation
    connect(s3.inlet,Immissione_1. outlet) annotation (Line(
        points={{-82,-60},{-56,-60},{-56,8},{-36,8},{-36,24},{-12,24}},
        color={182,109,49},
        thickness=0.5));
    connect(m_flow_H3.y,add. u1) annotation (Line(points={{-8,92},{28,92},{28,80},
            {38,80}},     color={0,0,127}));
    connect(m_flow_H2.y,add. u2) annotation (Line(points={{-8,56},{28,56},{28,68},
            {38,68}},     color={0,0,127}));
    connect(add.y, Immissione_1.in_m_flow0) annotation (Line(points={{61,74},{68,
            74},{68,19},{4,19}},                 color={0,0,127}));
    connect(s3.outlet, s2.outlet) annotation (Line(
        points={{-102,-60},{-198,-60},{-198,-44}},
        color={182,109,49},
        thickness=0.5));
    connect(realExpression.y, Immissione_1.in_X0)
      annotation (Line(points={{25,8},{-8,8},{-8,19}}, color={0,0,127}));
  end RG2i_source1;

  model RG2i_source2
    extends Rete_Gas_2i_pipes_users;
    H2GasFacility.Components.Pipes.Round1DFV                   sds17e16(
      n=nV,
      L=Report_122025.PipelineData_2i.sds17.L +Report_122025.PipelineData_2i.sds16.L,
      H=Report_122025.PipelineData_2i.sds17.h +Report_122025.PipelineData_2i.sds16.h,
      cm=Report_122025.PipelineData_2i.sds17.cm,
      rhom=Report_122025.PipelineData_2i.sds17.rhom,
      lambdam=Report_122025.PipelineData_2i.sds17.lambdam,
      m_flow_start=Report_122025.PipelineData_2i.sds17.m_flow_start,
      pin_start=Report_122025.PipelineData_2i.sds17.pin_start,
      pout_start=Report_122025.PipelineData_2i.sds16.pout_start,
      kappa=Report_122025.PipelineData_2i.sds17.kappa,
      k=Report_122025.PipelineData_2i.sds17.k,
      redeclare model Gas = Medium,
      X_start=X_start,
      Di=Report_122025.PipelineData_2i.sds17.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-248,222})));

    H2GasFacility.Sources.SourceMassFlow                   Immissione_2(
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-8,
      T0=288.15,
      X0=X_start,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0,
      use_in_m_flow0=true,
      use_in_X0=true)      annotation (Placement(visible=true, transformation(
          origin={-302,222},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H1(
      duration=300,
      height=25/3600,
      offset=0,
      startTime=3600)                                                                                         annotation (
      Placement(visible = true, transformation(origin={-409,234},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow_H5(
      duration=300,
      height=-25/3600,
      offset=0,
      startTime=18000)                                                                                        annotation (
      Placement(visible = true, transformation(origin={-407,270},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-348,242},{-328,262}})));
    Modelica.Blocks.Sources.RealExpression realExpression[2](y=if (time > (3600)
           and time < (18000 + 300)) then {0,1} else {1,0})
      annotation (Placement(transformation(extent={{-326,268},{-306,288}})));
  equation
    connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-396,270},{-360,270},
            {-360,258},{-350,258}}, color={0,0,127}));
    connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-398,234},{-350,234},
            {-350,246}},            color={0,0,127}));
    connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-327,252},
            {-302,252},{-302,240},{-306,240},{-306,227},{-308,227}},
                                               color={0,0,127}));
    connect(sds17e16.inlet,Immissione_2. outlet) annotation (Line(
        points={{-258,222},{-292,222}},
        color={182,109,49},
        thickness=0.5));
    connect(sds17e16.outlet, sds13.inlet) annotation (Line(
        points={{-238,222},{-202,222},{-202,218},{-164,218},{-164,220},{-54,220},
            {-54,202},{14,202}},
        color={182,109,49},
        thickness=0.5));
    connect(realExpression.y, Immissione_2.in_X0) annotation (Line(points={{-305,
            278},{-296,278},{-296,227}}, color={0,0,127}));
  end RG2i_source2;

  model RG2i_source1_PID
    extends RG2i_source1(
      valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*1e5))),
      Immissione_1(X0={1,0}));

    Modelica.Blocks.Sources.Ramp p_ref(
      offset=4.92*10^5,
      height=0*0.2*10^5,
      duration=0,
      startTime=1000) annotation (Placement(visible=true, transformation(
          origin={-141,-6},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    H2GasFacility.Controllers.AWPIDContinuous
                                aWPIDContinuous(
      Kp=1e-3,
      Kd=0,
      Ki=1,
      Ti=1e6,
      Td=1,
      y_start=0.5)
      annotation (Placement(transformation(extent={{-114,-24},{-94,-4}})));
  equation
    connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-130,-6},{
            -130,-10},{-112,-10}}, color={0,0,127}));
    connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
        Line(points={{-135.8,18.6},{-152,18.6},{-152,12},{-160,12},{-160,-28},{
            -124,-28},{-124,-18},{-112,-18}},
                                   color={0,0,127}));
    connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
      annotation (Line(points={{-93,-14},{-93,-16},{-76,-16},{-76,8},{-104,8},{
            -104,18},{-102,18}}, color={0,0,127}));
    annotation (experiment(
        StopTime=28800,
        Tolerance=0.001,
        __Dymola_Algorithm="Dassl"));
  end RG2i_source1_PID;

  model RG2i_source2_PID
    extends RG2i_source2(
      valveLinearOpening(m_flow_nom=0.413, A_v=1.9*0.413/(sqrt(40.18*(60 - 4.93)*1e5))),
        m_flow_H1(offset=0.0001));
    Modelica.Blocks.Sources.Ramp p_ref(
      offset=4.92*10^5,
      height=0*0.2*10^5,
      duration=0,
      startTime=1000) annotation (Placement(visible=true, transformation(
          origin={-137,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    H2GasFacility.Controllers.AWPIDContinuous
                                aWPIDContinuous(
      Kp=1e-3,
      Kd=0,
      Ki=1,
      Ti=1e6,
      Td=1,
      y_start=0.5)
      annotation (Placement(transformation(extent={{-110,-28},{-90,-8}})));
  equation
    connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-126,-10},{
            -126,-14},{-108,-14}}, color={0,0,127}));
    connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
        Line(points={{-135.8,18.6},{-135.8,8},{-156,8},{-156,-36},{-108,-36},{
            -108,-22}},            color={0,0,127}));
    connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
      annotation (Line(points={{-89,-18},{-89,-20},{-80,-20},{-80,8},{-104,8},{
            -104,18},{-102,18}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=28800, __Dymola_Algorithm="Dassl"));
  end RG2i_source2_PID;

  package PipelineData_2i "Data of Rete Gas 2i"
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s1(
        L = 842.777,
        Di = 0.2091,
        t = 0.003,
        tIns = 0.15,
        h = -18,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.93e5,
        pout_start = 4.916e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom =  3.3011487,
        m_flow_start = 0.413,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //steel
        //rho_nom =  0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s2(
        L = 3273.422,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -42,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.916e5,
        pout_start = 4.821e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2997186,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s3(
        L = 100.058,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = 0,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.821e5,
        pout_start = 4.821e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2762403,
        m_flow_start = 0.0001,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom =  0.35,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s4(
        L = 1663.921,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -32,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.916e5,
        pout_start = 4.821e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2762403,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s8(
        L = 154.637,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -11,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.668e5,
        pout_start = 4.676e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2398262,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s9(
        L = 1.635,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.676e5,
        pout_start = 4.671e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2381206,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s11(
        L = 503.188,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = 31,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.671e5,
        pout_start = 4.656e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2383168,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
                //looka at pipe orientation
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s12(
        L = 238.385,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -11,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.656e5,
        pout_start = 4.636e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2266467,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
                 //look at pipe orientation
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s13(
        L = 10.754,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.656e5,
        pout_start = 4.636e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 0.657,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
                //look at pipe orientation
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s14(
        L = 589.277,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -5,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.618e5,
        pout_start = 4.636e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2227125,
        m_flow_start = 0.266,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s16(
        L = 19.065,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = 0,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.618e5,
        pout_start = 4.618e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.217787,
        m_flow_start = 0.0001,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s18(
        L = 880.651,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.618e5,
        pout_start = 4.591e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2175937,
        m_flow_start = 0.26601,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s19(
        L = 540.807,
        Di = 0.1472,
        t = 0.003,
        tIns = 0.15,
        h = -18,
        lambdaIns = 0.04,
        lambdam = 2.5,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.591e5,
        pout_start = 4.572e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2088442,
        m_flow_start = 0.23194,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 913,
        rhom = 1850,
        kappa = 0.015e-3);
        //PES5
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s20(
        L = 14.682,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = 14,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.572e5,
        pout_start = 4.571e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2062173,
        m_flow_start = 0.23194,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s21(
        L = 13.074,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -10,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.571e5,
        pout_start = 4.569e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2031567,
        m_flow_start = 0.1123,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s22(
        L = 95.937,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -3,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.571e5,
        pout_start = 4.571e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2031567,
        m_flow_start = 0.1196,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s24(
        L = 92.59,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = 2,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.571e5,
        pout_start = 4.57e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.20359,
        m_flow_start = 0.1196,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s26(
        L = 181.028,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -2,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.57e5,
        pout_start = 4.567e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2029781,
        m_flow_start = 0.1196,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s28(
        L = 84.565,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -2,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.567e5,
        pout_start = 4.55e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2024307,
        m_flow_start = 0.1196,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s30(
        L = 138.527,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -3,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.55e5,
        pout_start = 4.547e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.198188,
        m_flow_start = 0.1196,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s31(
        L = 256.081,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -2,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.591e5,
        pout_start = 4.591e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2088442,
        m_flow_start = 0.0341,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine s36(
        L = 1244.898,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -11,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.591e5,
        pout_start = 4.591e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2092228,
        m_flow_start = 0.0341,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      // ________________________________________________________________________
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds1(
        L = 3081.109,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -71,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.916e5,
        pout_start = 4.888e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2997186,
        m_flow_start = 0.14706,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        // Steel
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds2(
        L = 92.5,
        Di = 0.1472,
        t = 0.003,
        tIns = 0.15,
        h = 0,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.888e5,
        pout_start = 4.887e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.3057911,
        m_flow_start = 0.14706,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds3(
        L = 677.303,
        Di = 0.1603,
        t = 0.003,
        tIns = 0.15,
        h = -14,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.887e5,
        pout_start = 4.881e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.3053627,
        m_flow_start = 0.14706,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds4(
        L = 433.985,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -8,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.881e5,
        pout_start = 4.87e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.3063538,
        m_flow_start = 0.14706,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds6(
        L = 8027.812,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = 59,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.87e5,
        pout_start = 4.673e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.3046892,
        m_flow_start = 0.14706,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds7(
        L = 2103.419,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = 19,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.673e5,
        pout_start = 4.649e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2283714,
        m_flow_start = 0.0987,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds8(
        L = 13379.322,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -107,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.649e5,
        pout_start = 4.371e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2167377,
        m_flow_start = 0.0987,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds9(
        L = 193.484,
        Di = 0.1325,
        t = 0.003,
        tIns = 0.15,
        h = -8,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.673e5,
        pout_start = 4.672e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2283714,
        m_flow_start = 0.04837,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds10(
        L = 7.845,
        Di = 0.1079,
        t = 0.003,
        tIns = 0.15,
        h = -4,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.672e5,
        pout_start = 4.672e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2298996,
        m_flow_start = 0.0213,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds11(
        L = 357.121,
        Di = 0.1079,
        t = 0.003,
        tIns = 0.15,
        h = -12,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.672e5,
        pout_start = 4.671e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2298996,
        m_flow_start = 0.02711,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds12(
        L = 787.51,
        Di = 0.1079,
        t = 0.003,
        tIns = 0.15,
        h = 40,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.671e5,
        pout_start = 4.669e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2321732,
        m_flow_start = 0.02711,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds13(
        L = 190.14,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = 1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.669e5,
        pout_start = 4.667e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2230937,
        m_flow_start = 0.02711,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds14(
        L = 36.829,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = 1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.667e5,
        pout_start = 4.667e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2223463,
        m_flow_start = 0.02711,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds15(
        L = 1015.74,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = 72,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.667e5,
        pout_start = 4.666e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2223463,
        m_flow_start = 0.0078,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds16(
        L = 194.511,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.671e5,
        pout_start = 4.671e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2223463,
        m_flow_start = 0.0001,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,
      constant MultiEnergySystem.H2GasFacility.Data.RoundPipeLine sds17(
        L = 1077.595,
        Di = 0.0831,
        t = 0.003,
        tIns = 0.15,
        h = -1,
        lambdaIns = 0.04,
        lambdam = 45,
        hin_start = -4.65076e6,
        pmax = 6e5,
        pin_start = 4.671e5,
        pout_start = 4.671e5,
        Tin_start = 15 + 273.15,
        Tout_start = 15 + 273.15,
        rho_nom = 3.2223463,
        m_flow_start = 0.0001,
        cf = 0,
        u_nom = 6.93,
        k = 500,
        cm = 420,
        rhom = 7850,
        kappa = 0.045e-3);
        //rho_nom = 0.657,

  end PipelineData_2i;
  annotation (Documentation(info="<html>
<p>This package includes the models that have been used to generate the results of the following article:</p>
<p>Sassaroli G., Casamassima V. &amp; Muro Alvarado M.</p>
<p>&quot;Dynamic modeling and simulation of gas distribution networks with decentralized hydrogen injections.&quot;</p>
<p>2025 IFAC Workshop on Smart Energy Systems for Efficient and Sustainable Smart Grids and Smart Cities&nbsp;(SENSYS 2025)</p>
<p>Status: UNDER REVIEW</p>
</html>"));
end Report_122025;
