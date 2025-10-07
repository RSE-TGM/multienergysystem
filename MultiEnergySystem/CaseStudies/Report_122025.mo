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
    extends H2GasFacility.Tests.SubSystem.RG2i_controllers.RG2i_pipes(
      raccordo2(pin_start=H2GasFacility.Data.PipelineData_2i.sds8.pout_start,
          pout_start=H2GasFacility.Data.PipelineData_2i.sds8.pout_start),
      constantFrictionFactor=false,
      massFractionDynamicBalance=false);
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(
      redeclare model Medium = Medium,
      p0=463200,
      m_flow0=0.021261,
      X0=X_start)
      annotation (Placement(transformation(extent={{-212,154},{-168,198}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_5(
      redeclare model Medium = Medium,
      p0=460300,
      m_flow0=0.007765,
      X0=X_start)
      annotation (Placement(transformation(extent={{28,262},{66,300}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
      redeclare model Medium = Medium,
      p0=461900,
      m_flow0=0.019358,
      X0=X_start)
      annotation (Placement(transformation(extent={{88,200},{122,234}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_7(
      redeclare model Medium = Medium,
      p0=437100,
      m_flow0=0.098685,
      X0=X_start)
      annotation (Placement(transformation(extent={{222,234},{262,274}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_3(
      redeclare model Medium = Medium,
      p0=459100,
      m_flow0=0.034069,
      X0=X_start)
      annotation (Placement(transformation(extent={{40,-128},{76,-92}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_1(
      redeclare model Medium = Medium,
      p0=459500,
      m_flow0=0.112338,
      X0=X_start)
      annotation (Placement(transformation(extent={{188,-102},{228,-62}})));
    MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_2(
      redeclare model Medium = Medium,
      p0=454700,
      m_flow0=0.119588,
      X0=X_start)
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

  model RG2i_inj1_ProdDemand_profiles
    "Profiles of both injection and demand"
    extends Rete_Gas_2i_pipes_users(
      constantFrictionFactor=false,
      massFractionDynamicBalance=false,
      valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)
            *1e5))),
      X_start={1,0},
      GRM_1(massflowratedemand=[0,0.0443; 840,0.0443; 900,0.0441; 1740,0.0441; 1800,
            0.0558; 2640,0.0558; 2700,0.0552; 3540,0.0552; 3600,0.0445; 4440,0.0445;
            4500,0.0552; 5340,0.0552; 5400,0.056; 6240,0.056; 6300,0.0443; 7140,0.0443;
            7200,0.0441; 8040,0.0441; 8100,0.0447; 8940,0.0447; 9000,0.0441; 9840,
            0.0441; 9900,0.0556; 10740,0.0556; 10800,0.0449; 11640,0.0449; 11700,0.0328;
            12540,0.0328; 12600,0.0443; 13440,0.0443; 13500,0.0449; 14340,0.0449;
            14400,0.0441; 15240,0.0441; 15300,0.0445; 16140,0.0445; 16200,0.0447;
            17040,0.0447; 17100,0.0441; 17940,0.0441; 18000,0.0447; 18840,0.0447;
            18900,0.0443; 19740,0.0443; 19800,0.0554; 20640,0.0554; 20700,0.0554;
            21540,0.0554; 21600,0.0556; 22440,0.0556; 22500,0.0552; 23340,0.0552;
            23400,0.0665; 24240,0.0665; 24300,0.0771; 25140,0.0771; 25200,0.0663;
            26040,0.0663; 26100,0.0882; 26940,0.0882; 27000,0.0775; 27840,0.0775;
            27900,0.0771; 28740,0.0771; 28800,0.0882; 29640,0.0882; 29700,0.0771;
            30540,0.0771; 30600,0.0773; 31440,0.0773; 31500,0.0882; 32340,0.0882;
            32400,0.0775; 33240,0.0775; 33300,0.0775; 34140,0.0775; 34200,0.0663;
            35040,0.0663; 35100,0.0667; 35940,0.0667; 36000,0.0663; 36840,0.0663;
            36900,0.0558; 37740,0.0558; 37800,0.0554; 38640,0.0554; 38700,0.056; 39540,
            0.056; 39600,0.0441; 40440,0.0441; 40500,0.0562; 41340,0.0562; 41400,0.0334;
            42240,0.0334; 42300,0.0332; 43140,0.0332; 43200,0.0449; 44040,0.0449;
            44100,0.0336; 44940,0.0336; 45000,0.0332; 45840,0.0332; 45900,0.0449;
            46740,0.0449; 46800,0.0223; 47640,0.0223; 47700,0.0332; 48540,0.0332;
            48600,0.0447; 49440,0.0447; 49500,0.034; 50340,0.034; 50400,0.022; 51240,
            0.022; 51300,0.0334; 52140,0.0334; 52200,0.0453; 53040,0.0453; 53100,0.0222;
            53940,0.0222; 54000,0.0334; 54840,0.0334; 54900,0.0336; 55740,0.0336;
            55800,0.0338; 56640,0.0338; 56700,0.0332; 57540,0.0332; 57600,0.0336;
            58440,0.0336; 58500,0.0338; 59340,0.0338; 59400,0.0334; 60240,0.0334;
            60300,0.0334; 61140,0.0334; 61200,0.0338; 62040,0.0338; 62100,0.0441;
            62940,0.0441; 63000,0.0336; 63840,0.0336; 63900,0.0445; 64740,0.0445;
            64800,0.0332; 65640,0.0332; 65700,0.0447; 66540,0.0447; 66600,0.0443;
            67440,0.0443; 67500,0.0443; 68340,0.0443; 68400,0.0445; 69240,0.0445;
            69300,0.0554; 70140,0.0554; 70200,0.0447; 71040,0.0447; 71100,0.0548;
            71940,0.0548; 72000,0.056; 72840,0.056; 72900,0.0439; 73740,0.0439; 73800,
            0.0556; 74640,0.0556; 74700,0.0554; 75540,0.0554; 75600,0.0445; 76440,
            0.0445; 76500,0.0556; 77340,0.0556; 77400,0.0548; 78240,0.0548; 78300,
            0.0445; 79140,0.0445; 79200,0.056; 80040,0.056; 80100,0.0439; 80940,0.0439;
            81000,0.056; 81840,0.056; 81900,0.0443; 82740,0.0443; 82800,0.0441; 83640,
            0.0441; 83700,0.0449; 84540,0.0449; 84600,0.0441; 85440,0.0441; 85500,
            0.0443; 86340,0.0443; 86400,0.056; 87240,0.056; 90000,0.056]),
      GRM_2(massflowratedemand=[0,0.0473; 840,0.0473; 900,0.0469; 1740,0.0469; 1800,
            0.0593; 2640,0.0593; 2700,0.0587; 3540,0.0587; 3600,0.0475; 4440,0.0475;
            4500,0.0587; 5340,0.0587; 5400,0.0595; 6240,0.0595; 6300,0.0473; 7140,
            0.0473; 7200,0.0469; 8040,0.0469; 8100,0.0477; 8940,0.0477; 9000,0.0469;
            9840,0.0469; 9900,0.0591; 10740,0.0591; 10800,0.0479; 11640,0.0479; 11700,
            0.035; 12540,0.035; 12600,0.0473; 13440,0.0473; 13500,0.0479; 14340,0.0479;
            14400,0.0469; 15240,0.0469; 15300,0.0475; 16140,0.0475; 16200,0.0477;
            17040,0.0477; 17100,0.0469; 17940,0.0469; 18000,0.0477; 18840,0.0477;
            18900,0.0473; 19740,0.0473; 19800,0.0589; 20640,0.0589; 20700,0.0589;
            21540,0.0589; 21600,0.0591; 22440,0.0591; 22500,0.0587; 23340,0.0587;
            23400,0.0708; 24240,0.0708; 24300,0.0821; 25140,0.0821; 25200,0.0706;
            26040,0.0706; 26100,0.0939; 26940,0.0939; 27000,0.0825; 27840,0.0825;
            27900,0.0821; 28740,0.0821; 28800,0.0939; 29640,0.0939; 29700,0.0821;
            30540,0.0821; 30600,0.0823; 31440,0.0823; 31500,0.0939; 32340,0.0939;
            32400,0.0825; 33240,0.0825; 33300,0.0825; 34140,0.0825; 34200,0.0706;
            35040,0.0706; 35100,0.071; 35940,0.071; 36000,0.0706; 36840,0.0706; 36900,
            0.0593; 37740,0.0593; 37800,0.0589; 38640,0.0589; 38700,0.0595; 39540,
            0.0595; 39600,0.0469; 40440,0.0469; 40500,0.0597; 41340,0.0597; 41400,
            0.0356; 42240,0.0356; 42300,0.0352; 43140,0.0352; 43200,0.0479; 44040,
            0.0479; 44100,0.0358; 44940,0.0358; 45000,0.0352; 45840,0.0352; 45900,
            0.0479; 46740,0.0479; 46800,0.0237; 47640,0.0237; 47700,0.0352; 48540,
            0.0352; 48600,0.0477; 49440,0.0477; 49500,0.0362; 50340,0.0362; 50400,
            0.0233; 51240,0.0233; 51300,0.0356; 52140,0.0356; 52200,0.0481; 53040,
            0.0481; 53100,0.0235; 53940,0.0235; 54000,0.0356; 54840,0.0356; 54900,
            0.0358; 55740,0.0358; 55800,0.036; 56640,0.036; 56700,0.0352; 57540,0.0352;
            57600,0.0358; 58440,0.0358; 58500,0.036; 59340,0.036; 59400,0.0356; 60240,
            0.0356; 60300,0.0356; 61140,0.0356; 61200,0.036; 62040,0.036; 62100,0.0469;
            62940,0.0469; 63000,0.0358; 63840,0.0358; 63900,0.0475; 64740,0.0475;
            64800,0.0352; 65640,0.0352; 65700,0.0477; 66540,0.0477; 66600,0.0473;
            67440,0.0473; 67500,0.0473; 68340,0.0473; 68400,0.0475; 69240,0.0475;
            69300,0.0589; 70140,0.0589; 70200,0.0477; 71040,0.0477; 71100,0.0583;
            71940,0.0583; 72000,0.0595; 72840,0.0595; 72900,0.0467; 73740,0.0467;
            73800,0.0591; 74640,0.0591; 74700,0.0589; 75540,0.0589; 75600,0.0475;
            76440,0.0475; 76500,0.0591; 77340,0.0591; 77400,0.0583; 78240,0.0583;
            78300,0.0475; 79140,0.0475; 79200,0.0595; 80040,0.0595; 80100,0.0467;
            80940,0.0467; 81000,0.0595; 81840,0.0595; 81900,0.0473; 82740,0.0473;
            82800,0.0469; 83640,0.0469; 83700,0.0479; 84540,0.0479; 84600,0.0469;
            85440,0.0469; 85500,0.0473; 86340,0.0473; 86400,0.0595; 87240,0.0595;
            90000,0.0595]),
      GRM_3(massflowratedemand=[0,0.0134; 840,0.0134; 900,0.0134; 1740,0.0134; 1800,
            0.0168; 2640,0.0168; 2700,0.0166; 3540,0.0166; 3600,0.0134; 4440,0.0134;
            4500,0.0166; 5340,0.0166; 5400,0.017; 6240,0.017; 6300,0.0134; 7140,0.0134;
            7200,0.0134; 8040,0.0134; 8100,0.0136; 8940,0.0136; 9000,0.0134; 9840,
            0.0134; 9900,0.0168; 10740,0.0168; 10800,0.0136; 11640,0.0136; 11700,0.0099;
            12540,0.0099; 12600,0.0134; 13440,0.0134; 13500,0.0136; 14340,0.0136;
            14400,0.0134; 15240,0.0134; 15300,0.0134; 16140,0.0134; 16200,0.0136;
            17040,0.0136; 17100,0.0134; 17940,0.0134; 18000,0.0136; 18840,0.0136;
            18900,0.0134; 19740,0.0134; 19800,0.0168; 20640,0.0168; 20700,0.0168;
            21540,0.0168; 21600,0.0168; 22440,0.0168; 22500,0.0166; 23340,0.0166;
            23400,0.0202; 24240,0.0202; 24300,0.0233; 25140,0.0233; 25200,0.0202;
            26040,0.0202; 26100,0.0267; 26940,0.0267; 27000,0.0235; 27840,0.0235;
            27900,0.0233; 28740,0.0233; 28800,0.0267; 29640,0.0267; 29700,0.0233;
            30540,0.0233; 30600,0.0233; 31440,0.0233; 31500,0.0267; 32340,0.0267;
            32400,0.0235; 33240,0.0235; 33300,0.0235; 34140,0.0235; 34200,0.0202;
            35040,0.0202; 35100,0.0202; 35940,0.0202; 36000,0.0202; 36840,0.0202;
            36900,0.0168; 37740,0.0168; 37800,0.0168; 38640,0.0168; 38700,0.017; 39540,
            0.017; 39600,0.0134; 40440,0.0134; 40500,0.017; 41340,0.017; 41400,0.0101;
            42240,0.0101; 42300,0.0101; 43140,0.0101; 43200,0.0136; 44040,0.0136;
            44100,0.0101; 44940,0.0101; 45000,0.0101; 45840,0.0101; 45900,0.0136;
            46740,0.0136; 46800,0.0067; 47640,0.0067; 47700,0.0101; 48540,0.0101;
            48600,0.0136; 49440,0.0136; 49500,0.0103; 50340,0.0103; 50400,0.0067;
            51240,0.0067; 51300,0.0101; 52140,0.0101; 52200,0.0136; 53040,0.0136;
            53100,0.0067; 53940,0.0067; 54000,0.0101; 54840,0.0101; 54900,0.0101;
            55740,0.0101; 55800,0.0103; 56640,0.0103; 56700,0.0101; 57540,0.0101;
            57600,0.0101; 58440,0.0101; 58500,0.0103; 59340,0.0103; 59400,0.0101;
            60240,0.0101; 60300,0.0101; 61140,0.0101; 61200,0.0103; 62040,0.0103;
            62100,0.0134; 62940,0.0134; 63000,0.0101; 63840,0.0101; 63900,0.0134;
            64740,0.0134; 64800,0.0101; 65640,0.0101; 65700,0.0136; 66540,0.0136;
            66600,0.0134; 67440,0.0134; 67500,0.0134; 68340,0.0134; 68400,0.0134;
            69240,0.0134; 69300,0.0168; 70140,0.0168; 70200,0.0136; 71040,0.0136;
            71100,0.0166; 71940,0.0166; 72000,0.017; 72840,0.017; 72900,0.0133; 73740,
            0.0133; 73800,0.0168; 74640,0.0168; 74700,0.0168; 75540,0.0168; 75600,
            0.0134; 76440,0.0134; 76500,0.0168; 77340,0.0168; 77400,0.0166; 78240,
            0.0166; 78300,0.0134; 79140,0.0134; 79200,0.017; 80040,0.017; 80100,0.0133;
            80940,0.0133; 81000,0.017; 81840,0.017; 81900,0.0134; 82740,0.0134; 82800,
            0.0134; 83640,0.0134; 83700,0.0136; 84540,0.0136; 84600,0.0134; 85440,
            0.0134; 85500,0.0134; 86340,0.0134; 86400,0.017; 87240,0.017; 90000,0.017]),
      GRM_4(massflowratedemand=[0,0.0031; 840,0.003; 900,0.003; 1740,0.003; 1800,0.0038;
            2640,0.0038; 2700,0.0038; 3540,0.0038; 3600,0.0032; 4440,0.0032; 4500,
            0.0038; 5340,0.0038; 5400,0.004; 6240,0.004; 6300,0.003; 7140,0.003; 7200,
            0.003; 8040,0.003; 8100,0.0032; 8940,0.0032; 9000,0.003; 9840,0.003; 9900,
            0.0038; 10740,0.0038; 10800,0.0032; 11640,0.0032; 11700,0.0024; 12540,
            0.0024; 12600,0.003; 13440,0.003; 13500,0.0032; 14340,0.0032; 14400,0.003;
            15240,0.003; 15300,0.0032; 16140,0.0032; 16200,0.0032; 17040,0.0032; 17100,
            0.003; 17940,0.003; 18000,0.0032; 18840,0.0032; 18900,0.003; 19740,0.003;
            19800,0.0038; 20640,0.0038; 20700,0.0038; 21540,0.0038; 21600,0.0038;
            22440,0.0038; 22500,0.0038; 23340,0.0038; 23400,0.0045; 24240,0.0045;
            24300,0.0053; 25140,0.0053; 25200,0.0045; 26040,0.0045; 26100,0.0061;
            26940,0.0061; 27000,0.0053; 27840,0.0053; 27900,0.0053; 28740,0.0053;
            28800,0.0061; 29640,0.0061; 29700,0.0053; 30540,0.0053; 30600,0.0053;
            31440,0.0053; 31500,0.0061; 32340,0.0061; 32400,0.0053; 33240,0.0053;
            33300,0.0053; 34140,0.0053; 34200,0.0045; 35040,0.0045; 35100,0.0045;
            35940,0.0045; 36000,0.0045; 36840,0.0045; 36900,0.0038; 37740,0.0038;
            37800,0.0038; 38640,0.0038; 38700,0.004; 39540,0.004; 39600,0.003; 40440,
            0.003; 40500,0.004; 41340,0.004; 41400,0.0024; 42240,0.0024; 42300,0.0024;
            43140,0.0024; 43200,0.0032; 44040,0.0032; 44100,0.0024; 44940,0.0024;
            45000,0.0024; 45840,0.0024; 45900,0.0032; 46740,0.0032; 46800,0.0016;
            47640,0.0016; 47700,0.0024; 48540,0.0024; 48600,0.0032; 49440,0.0032;
            49500,0.0024; 50340,0.0024; 50400,0.0016; 51240,0.0016; 51300,0.0024;
            52140,0.0024; 52200,0.0032; 53040,0.0032; 53100,0.0016; 53940,0.0016;
            54000,0.0024; 54840,0.0024; 54900,0.0024; 55740,0.0024; 55800,0.0024;
            56640,0.0024; 56700,0.0024; 57540,0.0024; 57600,0.0024; 58440,0.0024;
            58500,0.0024; 59340,0.0024; 59400,0.0024; 60240,0.0024; 60300,0.0024;
            61140,0.0024; 61200,0.0024; 62040,0.0024; 62100,0.003; 62940,0.003; 63000,
            0.0024; 63840,0.0024; 63900,0.0032; 64740,0.0032; 64800,0.0024; 65640,
            0.0024; 65700,0.0032; 66540,0.0032; 66600,0.003; 67440,0.003; 67500,0.003;
            68340,0.003; 68400,0.0032; 69240,0.0032; 69300,0.0038; 70140,0.0038; 70200,
            0.0032; 71040,0.0032; 71100,0.0038; 71940,0.0038; 72000,0.004; 72840,0.004;
            72900,0.003; 73740,0.003; 73800,0.0038; 74640,0.0038; 74700,0.0038; 75540,
            0.0038; 75600,0.0032; 76440,0.0032; 76500,0.0038; 77340,0.0038; 77400,
            0.0038; 78240,0.0038; 78300,0.0032; 79140,0.0032; 79200,0.004; 80040,0.004;
            80100,0.003; 80940,0.003; 81000,0.004; 81840,0.004; 81900,0.003; 82740,
            0.003; 82800,0.003; 83640,0.003; 83700,0.0032; 84540,0.0032; 84600,0.003;
            85440,0.003; 85500,0.003; 86340,0.003; 86400,0.004; 87240,0.004; 90000,
            0.004]),
      GRM_5(massflowratedemand=[0,0.0083; 840,0.0083; 900,0.0083; 1740,0.0083; 1800,
            0.0105; 2640,0.0105; 2700,0.0105; 3540,0.0105; 3600,0.0085; 4440,0.0085;
            4500,0.0105; 5340,0.0105; 5400,0.0107; 6240,0.0107; 6300,0.0083; 7140,
            0.0083; 7200,0.0083; 8040,0.0083; 8100,0.0085; 8940,0.0085; 9000,0.0083;
            9840,0.0083; 9900,0.0105; 10740,0.0105; 10800,0.0085; 11640,0.0085; 11700,
            0.0063; 12540,0.0063; 12600,0.0083; 13440,0.0083; 13500,0.0085; 14340,
            0.0085; 14400,0.0083; 15240,0.0083; 15300,0.0085; 16140,0.0085; 16200,
            0.0085; 17040,0.0085; 17100,0.0083; 17940,0.0083; 18000,0.0085; 18840,
            0.0085; 18900,0.0083; 19740,0.0083; 19800,0.0105; 20640,0.0105; 20700,
            0.0105; 21540,0.0105; 21600,0.0105; 22440,0.0105; 22500,0.0105; 23340,
            0.0105; 23400,0.0127; 24240,0.0127; 24300,0.0146; 25140,0.0146; 25200,
            0.0125; 26040,0.0125; 26100,0.0166; 26940,0.0166; 27000,0.0146; 27840,
            0.0146; 27900,0.0146; 28740,0.0146; 28800,0.0166; 29640,0.0166; 29700,
            0.0146; 30540,0.0146; 30600,0.0146; 31440,0.0146; 31500,0.0166; 32340,
            0.0166; 32400,0.0146; 33240,0.0146; 33300,0.0146; 34140,0.0146; 34200,
            0.0125; 35040,0.0125; 35100,0.0127; 35940,0.0127; 36000,0.0125; 36840,
            0.0125; 36900,0.0105; 37740,0.0105; 37800,0.0105; 38640,0.0105; 38700,
            0.0107; 39540,0.0107; 39600,0.0083; 40440,0.0083; 40500,0.0107; 41340,
            0.0107; 41400,0.0063; 42240,0.0063; 42300,0.0063; 43140,0.0063; 43200,
            0.0085; 44040,0.0085; 44100,0.0063; 44940,0.0063; 45000,0.0063; 45840,
            0.0063; 45900,0.0085; 46740,0.0085; 46800,0.0042; 47640,0.0042; 47700,
            0.0063; 48540,0.0063; 48600,0.0085; 49440,0.0085; 49500,0.0065; 50340,
            0.0065; 50400,0.0042; 51240,0.0042; 51300,0.0063; 52140,0.0063; 52200,
            0.0085; 53040,0.0085; 53100,0.0042; 53940,0.0042; 54000,0.0063; 54840,
            0.0063; 54900,0.0063; 55740,0.0063; 55800,0.0063; 56640,0.0063; 56700,
            0.0063; 57540,0.0063; 57600,0.0063; 58440,0.0063; 58500,0.0063; 59340,
            0.0063; 59400,0.0063; 60240,0.0063; 60300,0.0063; 61140,0.0063; 61200,
            0.0063; 62040,0.0063; 62100,0.0083; 62940,0.0083; 63000,0.0063; 63840,
            0.0063; 63900,0.0085; 64740,0.0085; 64800,0.0063; 65640,0.0063; 65700,
            0.0085; 66540,0.0085; 66600,0.0083; 67440,0.0083; 67500,0.0083; 68340,
            0.0083; 68400,0.0085; 69240,0.0085; 69300,0.0105; 70140,0.0105; 70200,
            0.0085; 71040,0.0085; 71100,0.0105; 71940,0.0105; 72000,0.0107; 72840,
            0.0107; 72900,0.0083; 73740,0.0083; 73800,0.0105; 74640,0.0105; 74700,
            0.0105; 75540,0.0105; 75600,0.0085; 76440,0.0085; 76500,0.0105; 77340,
            0.0105; 77400,0.0105; 78240,0.0105; 78300,0.0085; 79140,0.0085; 79200,
            0.0107; 80040,0.0107; 80100,0.0083; 80940,0.0083; 81000,0.0107; 81840,
            0.0107; 81900,0.0083; 82740,0.0083; 82800,0.0083; 83640,0.0083; 83700,
            0.0085; 84540,0.0085; 84600,0.0083; 85440,0.0083; 85500,0.0083; 86340,
            0.0083; 86400,0.0107; 87240,0.0107; 90000,0.0107]),
      GRM_6(massflowratedemand=[0,0.0077; 840,0.0077; 900,0.0075; 1740,0.0075; 1800,
            0.0097; 2640,0.0097; 2700,0.0095; 3540,0.0095; 3600,0.0077; 4440,0.0077;
            4500,0.0095; 5340,0.0095; 5400,0.0097; 6240,0.0097; 6300,0.0077; 7140,
            0.0077; 7200,0.0075; 8040,0.0075; 8100,0.0077; 8940,0.0077; 9000,0.0075;
            9840,0.0075; 9900,0.0095; 10740,0.0095; 10800,0.0077; 11640,0.0077; 11700,
            0.0057; 12540,0.0057; 12600,0.0077; 13440,0.0077; 13500,0.0077; 14340,
            0.0077; 14400,0.0075; 15240,0.0075; 15300,0.0077; 16140,0.0077; 16200,
            0.0077; 17040,0.0077; 17100,0.0075; 17940,0.0075; 18000,0.0077; 18840,
            0.0077; 18900,0.0077; 19740,0.0077; 19800,0.0095; 20640,0.0095; 20700,
            0.0095; 21540,0.0095; 21600,0.0095; 22440,0.0095; 22500,0.0095; 23340,
            0.0095; 23400,0.0115; 24240,0.0115; 24300,0.0133; 25140,0.0133; 25200,
            0.0115; 26040,0.0115; 26100,0.0152; 26940,0.0152; 27000,0.0134; 27840,
            0.0134; 27900,0.0133; 28740,0.0133; 28800,0.0152; 29640,0.0152; 29700,
            0.0133; 30540,0.0133; 30600,0.0133; 31440,0.0133; 31500,0.0152; 32340,
            0.0152; 32400,0.0134; 33240,0.0134; 33300,0.0134; 34140,0.0134; 34200,
            0.0115; 35040,0.0115; 35100,0.0115; 35940,0.0115; 36000,0.0115; 36840,
            0.0115; 36900,0.0097; 37740,0.0097; 37800,0.0095; 38640,0.0095; 38700,
            0.0097; 39540,0.0097; 39600,0.0075; 40440,0.0075; 40500,0.0097; 41340,
            0.0097; 41400,0.0057; 42240,0.0057; 42300,0.0057; 43140,0.0057; 43200,
            0.0077; 44040,0.0077; 44100,0.0057; 44940,0.0057; 45000,0.0057; 45840,
            0.0057; 45900,0.0077; 46740,0.0077; 46800,0.004; 47640,0.004; 47700,0.0057;
            48540,0.0057; 48600,0.0077; 49440,0.0077; 49500,0.0059; 50340,0.0059;
            50400,0.0038; 51240,0.0038; 51300,0.0057; 52140,0.0057; 52200,0.0077;
            53040,0.0077; 53100,0.0038; 53940,0.0038; 54000,0.0057; 54840,0.0057;
            54900,0.0057; 55740,0.0057; 55800,0.0057; 56640,0.0057; 56700,0.0057;
            57540,0.0057; 57600,0.0057; 58440,0.0057; 58500,0.0057; 59340,0.0057;
            59400,0.0057; 60240,0.0057; 60300,0.0057; 61140,0.0057; 61200,0.0057;
            62040,0.0057; 62100,0.0075; 62940,0.0075; 63000,0.0057; 63840,0.0057;
            63900,0.0077; 64740,0.0077; 64800,0.0057; 65640,0.0057; 65700,0.0077;
            66540,0.0077; 66600,0.0077; 67440,0.0077; 67500,0.0077; 68340,0.0077;
            68400,0.0077; 69240,0.0077; 69300,0.0095; 70140,0.0095; 70200,0.0077;
            71040,0.0077; 71100,0.0095; 71940,0.0095; 72000,0.0097; 72840,0.0097;
            72900,0.0075; 73740,0.0075; 73800,0.0095; 74640,0.0095; 74700,0.0095;
            75540,0.0095; 75600,0.0077; 76440,0.0077; 76500,0.0095; 77340,0.0095;
            77400,0.0095; 78240,0.0095; 78300,0.0077; 79140,0.0077; 79200,0.0097;
            80040,0.0097; 80100,0.0075; 80940,0.0075; 81000,0.0097; 81840,0.0097;
            81900,0.0077; 82740,0.0077; 82800,0.0075; 83640,0.0075; 83700,0.0077;
            84540,0.0077; 84600,0.0075; 85440,0.0075; 85500,0.0077; 86340,0.0077;
            86400,0.0097; 87240,0.0097; 90000,0.0097]),
      GRM_7(massflowratedemand=[0,0.039; 840,0.039; 900,0.0388; 1740,0.0388; 1800,
            0.049; 2640,0.049; 2700,0.0485; 3540,0.0485; 3600,0.0392; 4440,0.0392;
            4500,0.0485; 5340,0.0485; 5400,0.0492; 6240,0.0492; 6300,0.039; 7140,0.039;
            7200,0.0388; 8040,0.0388; 8100,0.0394; 8940,0.0394; 9000,0.0388; 9840,
            0.0388; 9900,0.0489; 10740,0.0489; 10800,0.0396; 11640,0.0396; 11700,0.0289;
            12540,0.0289; 12600,0.039; 13440,0.039; 13500,0.0396; 14340,0.0396; 14400,
            0.0388; 15240,0.0388; 15300,0.0392; 16140,0.0392; 16200,0.0394; 17040,
            0.0394; 17100,0.0388; 17940,0.0388; 18000,0.0394; 18840,0.0394; 18900,
            0.039; 19740,0.039; 19800,0.0487; 20640,0.0487; 20700,0.0487; 21540,0.0487;
            21600,0.0489; 22440,0.0489; 22500,0.0485; 23340,0.0485; 23400,0.0583;
            24240,0.0583; 24300,0.0676; 25140,0.0676; 25200,0.0581; 26040,0.0581;
            26100,0.0775; 26940,0.0775; 27000,0.068; 27840,0.068; 27900,0.0676; 28740,
            0.0676; 28800,0.0775; 29640,0.0775; 29700,0.0676; 30540,0.0676; 30600,
            0.0678; 31440,0.0678; 31500,0.0775; 32340,0.0775; 32400,0.068; 33240,0.068;
            33300,0.068; 34140,0.068; 34200,0.0581; 35040,0.0581; 35100,0.0585; 35940,
            0.0585; 36000,0.0581; 36840,0.0581; 36900,0.049; 37740,0.049; 37800,0.0487;
            38640,0.0487; 38700,0.0492; 39540,0.0492; 39600,0.0388; 40440,0.0388;
            40500,0.0492; 41340,0.0492; 41400,0.0293; 42240,0.0293; 42300,0.0291;
            43140,0.0291; 43200,0.0396; 44040,0.0396; 44100,0.0295; 44940,0.0295;
            45000,0.0291; 45840,0.0291; 45900,0.0396; 46740,0.0396; 46800,0.0196;
            47640,0.0196; 47700,0.0291; 48540,0.0291; 48600,0.0394; 49440,0.0394;
            49500,0.0299; 50340,0.0299; 50400,0.0192; 51240,0.0192; 51300,0.0293;
            52140,0.0293; 52200,0.0398; 53040,0.0398; 53100,0.0194; 53940,0.0194;
            54000,0.0293; 54840,0.0293; 54900,0.0295; 55740,0.0295; 55800,0.0297;
            56640,0.0297; 56700,0.0291; 57540,0.0291; 57600,0.0295; 58440,0.0295;
            58500,0.0297; 59340,0.0297; 59400,0.0293; 60240,0.0293; 60300,0.0293;
            61140,0.0293; 61200,0.0297; 62040,0.0297; 62100,0.0388; 62940,0.0388;
            63000,0.0295; 63840,0.0295; 63900,0.0392; 64740,0.0392; 64800,0.0291;
            65640,0.0291; 65700,0.0394; 66540,0.0394; 66600,0.039; 67440,0.039; 67500,
            0.039; 68340,0.039; 68400,0.0392; 69240,0.0392; 69300,0.0487; 70140,0.0487;
            70200,0.0394; 71040,0.0394; 71100,0.0483; 71940,0.0483; 72000,0.0492;
            72840,0.0492; 72900,0.0386; 73740,0.0386; 73800,0.0489; 74640,0.0489;
            74700,0.0487; 75540,0.0487; 75600,0.0392; 76440,0.0392; 76500,0.0489;
            77340,0.0489; 77400,0.0483; 78240,0.0483; 78300,0.0392; 79140,0.0392;
            79200,0.0492; 80040,0.0492; 80100,0.0386; 80940,0.0386; 81000,0.0492;
            81840,0.0492; 81900,0.039; 82740,0.039; 82800,0.0388; 83640,0.0388; 83700,
            0.0396; 84540,0.0396; 84600,0.0388; 85440,0.0388; 85500,0.039; 86340,0.039;
            86400,0.0492; 87240,0.0492; 90000,0.0492]),
      s36_Stadio(n=21));

    parameter H2GasFacility.Types.Density rho0_h2=0.0899;
    parameter H2GasFacility.Types.MassFlowRate H2Production_old[:,2]=[0,0; 1*3600,
        0; 2*3600,0.00007490; 3*3600,0.00129827; 4*3600,0.00129827; 5*3600,0.00007490;
        6*3600,0; 12*3600,0; 13*3600,0.00099867; 14*3600,0.0008655; 15*3600,0.0003956;
        16*3600,0.0003956; 17*3600,0; 24*3600,0]
      "Hydrogen production profile over a day.";
    parameter H2GasFacility.Types.MassFlowRate H2Production[:,2]=[0,16*rho0_h2/3600;
        1*3600,0; 9*3600,0; 10*3600,4*rho0_h2/3600; 11*3600,52*rho0_h2/3600; 12*3600,
        52*rho0_h2/3600; 13*3600,4*rho0_h2/3600; 14*3600,0; 20*3600,0; 21*3600,40*
        rho0_h2/3600; 22*3600,35*rho0_h2/3600; 23*3600,16*rho0_h2/3600; 24*3600,16
        *rho0_h2/3600] "Hydrogen production profile over a day.";

    Modelica.Blocks.Sources.TimeTable H2_Production(table=H2Production)
      annotation (Placement(visible = true, transformation(origin={-194,157},extent={{342,
              -133},{304,-95}},                                                                                   rotation = 0)));
    MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
      n=nV,
      H=H2GasFacility.Data.PipelineData_2i.s3.h,
      cm=H2GasFacility.Data.PipelineData_2i.s3.cm,
      rhom=H2GasFacility.Data.PipelineData_2i.s3.rhom,
      lambdam=H2GasFacility.Data.PipelineData_2i.s3.lambdam,
      m_flow_start=H2GasFacility.Data.PipelineData_2i.s3.m_flow_start,
      pin_start=H2GasFacility.Data.PipelineData_2i.s3.pin_start,
      pout_start=H2GasFacility.Data.PipelineData_2i.s3.pout_start,
      kappa=H2GasFacility.Data.PipelineData_2i.s3.kappa,
      k=H2GasFacility.Data.PipelineData_2i.s3.k,
      redeclare model Gas = Medium,
      L=H2GasFacility.Data.PipelineData_2i.s3.L,
      X_start=X_start,
      Di=H2GasFacility.Data.PipelineData_2i.s3.Di,
      massFractionDynamicBalance=massFractionDynamicBalance,
      constantFrictionFactor=constantFrictionFactor,
      computeInertialTerm=computeInertialTerm,
      hctype=hctype,
      momentum=momentum,
      rho_nom=rho_nom) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-148,-56})));
    MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_1(
      m_flow0=0,
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-15,
      T0=288.15,
      X0={0,1},
      computeEnthalpyWithFixedPressure=true,
      use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
          origin={-90,-28},
          extent={{-10,10},{10,-10}},
          rotation=180)));
    Modelica.Blocks.Math.Gain gain(k=1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={84,44})));
    H2GasFacility.Controllers.Valve_controller
                                 valve_controller
      annotation (Placement(transformation(extent={{-140,-22},{-110,8}})));
  equation
    connect(s3.outlet, s2.outlet) annotation (Line(
        points={{-158,-56},{-178,-56},{-178,-58},{-198,-58},{-198,-44}},
        color={182,109,49},
        thickness=0.5));
    connect(s3.inlet, Immissione_1.outlet) annotation (Line(
        points={{-138,-56},{-112,-56},{-112,-28},{-100,-28}},
        color={182,109,49},
        thickness=0.5));
    connect(gain.u, H2_Production.y) annotation (Line(points={{96,44},{100,44},
            {100,43},{108.1,43}}, color={0,0,127}));
    connect(Immissione_1.in_m_flow0, gain.y)
      annotation (Line(points={{-84,-23},{-84,8},{42,8},{42,44},{73,44}},
                                                             color={0,0,127}));
    connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
          points={{-141.2,-7},{-141.2,-8},{-146,-8},{-146,18},{-135.8,18},{
            -135.8,18.6}},                                                  color=
           {0,0,127}));
    connect(valve_controller.ACT_x,valveLinearOpening. opening)
      annotation (Line(points={{-107.9,-7},{-100,-7},{-100,8},{-104,8},{-104,18},
            {-102,18}},                                        color={0,0,127}));
    annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
  end RG2i_inj1_ProdDemand_profiles;

  model RG2i_inj1_ProdDemand_profiles_NG6
    extends RG2i_inj1_ProdDemand_profiles(
      redeclare model Medium =
          MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
      nX=7,
      X_start = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
      Immissione_1(X0={0,0,0,0,0,0,1}),
      gain(k=1),
      massFractionDynamicBalance = false);
      //X_start={0.922,0.065,0.011,0.002,0},
      //  X_start = {0.922, 0.065, 0.011, 0.002, 0} Algerian Natural Gas
      // MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2
      // MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND

    annotation (experiment(
        StopTime=86400,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end RG2i_inj1_ProdDemand_profiles_NG6;

  model RG2i_inj1_ProdDemand_profiles_NG6_offset
    extends RG2i_inj1_ProdDemand_profiles(
      redeclare model Medium =
          MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
      nX=7,
      X_start = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
      Immissione_1(X0={0,0,0,0,0,0,1}),
      gain(k=1),
      massFractionDynamicBalance = false,
      H2Production=[0,40*rho0_h2/3600; 24*3600,40*rho0_h2/3600]);

      // [0,16*rho0_h2/3600; 1*3600,5*rho0_h2/3600; 9*3600,5*rho0_h2/3600; 10*3600,5*rho0_h2/3600; 11*3600,52*rho0_h2/3600; 12*3600,
      //  52*rho0_h2/3600; 13*3600,5*rho0_h2/3600; 14*3600,5*rho0_h2/3600; 20*3600,5*rho0_h2/3600; 21*3600,40*
      //  rho0_h2/3600; 22*3600,35*rho0_h2/3600; 23*3600,16*rho0_h2/3600; 24*3600,16
      //  *rho0_h2/3600]

    annotation (experiment(
        StopTime=86400,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end RG2i_inj1_ProdDemand_profiles_NG6_offset;

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

  model BaseFluid "Fluid test"
    extends Modelica.Icons.Example;
    replaceable model Medium1 = H2GasFacility.Media.IdealGases.NG6_H2 constrainedby
      H2GasFacility.Media.BaseClasses.PartialMixture                                                                               "Fluid reference";

    constant Real p0(unit = "s") = 1 "Reference value for units";

    parameter H2GasFacility.Types.Temperature T_ref=15 + 273.15
      "Reference temperature";
    parameter H2GasFacility.Types.Pressure p_ref=p_min "Reference pressure";
    parameter H2GasFacility.Types.MassFraction X_ref[:]=M/Mt
      "Mass Fraction of the real gas";
    parameter H2GasFacility.Types.MoleFraction Y[:]=H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.Y;
    parameter H2GasFacility.Types.MolarMass M[:]=Y .* medium1.MM;
    parameter H2GasFacility.Types.MolarMass Mt=sum(M);
    parameter H2GasFacility.Types.Pressure p_min=0.05e6 "Reference pressure";
    parameter H2GasFacility.Types.Pressure p_max=1.2e6 "Reference pressure";

    H2GasFacility.Types.MassFraction Xh2 "Hydrogen Fraction";

    Medium1 medium1(T_start = T_ref, p_start = p_ref, X_start = X_ref);

  equation
    Xh2 = 0 + (0.01 - 0)*time/p0;

    medium1.T = T_ref;
    medium1.p = p_ref;
    medium1.Xi[1:6] = X_ref[1:6];
    medium1.Xi[7] = Xh2;


    annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
  end BaseFluid;

  model RG2i_H2_limit_test
    extends Rete_Gas_2i_pipes_users(
    constantFrictionFactor=false,
      valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)
            *1e5))),
    redeclare model Medium =
          MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
      nX=7,
      X_start = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
      massFractionDynamicBalance = false);
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
      X0={0,0,0,0,0,0,1},
      m_flow0=0.01,
      redeclare model Medium = Medium,
      p0=480000,
      G=1e-12,
      T0=288.15,
      computeEnthalpyWithFixedPressure=true,
      use_in_m_flow0=true,
      use_in_X0=false)     annotation (Placement(visible=true, transformation(
          origin={-2,24},
          extent={{-10,-10},{10,10}},
          rotation=180)));
    H2GasFacility.Controllers.Valve_controller
                                 valve_controller(P_rng=(6 - 4.93)*10^5)
      annotation (Placement(transformation(extent={{-140,-32},{-110,-2}})));
    Modelica.Blocks.Sources.Ramp m_flow_H2(
      offset=0.001*0,
      duration=300,
      height=0.0042,
      startTime=1000)                                                                                         annotation (
      Placement(visible = true, transformation(origin={33,60},       extent = {{-10, -10}, {10, 10}}, rotation=0)));
  equation
    connect(s3.inlet,Immissione_1. outlet) annotation (Line(
        points={{-82,-60},{-56,-60},{-56,8},{-36,8},{-36,24},{-12,24}},
        color={182,109,49},
        thickness=0.5));
    connect(s3.outlet, s2.outlet) annotation (Line(
        points={{-102,-60},{-198,-60},{-198,-44}},
        color={182,109,49},
        thickness=0.5));
    connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
          points={{-141.2,-17},{-148,-17},{-148,8},{-135.8,8},{-135.8,18.6}},
                                                                            color=
           {0,0,127}));
    connect(valve_controller.ACT_x,valveLinearOpening. opening)
      annotation (Line(points={{-107.9,-17},{-100,-17},{-100,8},{-104,8},{-104,18},
            {-102,18}},                                        color={0,0,127}));
    connect(m_flow_H2.y, Immissione_1.in_m_flow0) annotation (Line(points={{44,60},
            {60,60},{60,10},{4,10},{4,19}}, color={0,0,127}));
    annotation (experiment(
        StopTime=20000,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end RG2i_H2_limit_test;

  model RG2i_source2_H2_limits
    extends Rete_Gas_2i_pipes_users(
    constantFrictionFactor=false,
      valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)
            *1e5))),
    redeclare model Medium =
          MultiEnergySystem.H2GasFacility.Media.IdealGases.NG6_H2,
      nX=7,
      X_start = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X,
      massFractionDynamicBalance = false);
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
      T0=288.15,
      X0={0,0,0,0,0,0,1},
      G=1e-15,
      computeEnthalpyWithFixedPressure=true,
      m_flow0=0,
      use_in_m_flow0=true,
      use_in_X0=false)     annotation (Placement(visible=true, transformation(
          origin={-302,222},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    H2GasFacility.Controllers.Valve_controller
                                 valve_controller(P_rng=(6 - 2.5)*10^5)
      annotation (Placement(transformation(extent={{-134,-38},{-104,-8}})));
    Modelica.Blocks.Sources.Ramp m_flow_H2(
      offset=0.001*0,
      duration=5000,
      height=10/3600,
      startTime=1000)                                                                                         annotation (
      Placement(visible = true, transformation(origin={-387,256},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  equation
    connect(sds17e16.inlet,Immissione_2. outlet) annotation (Line(
        points={{-258,222},{-292,222}},
        color={182,109,49},
        thickness=0.5));
    connect(sds17e16.outlet, sds13.inlet) annotation (Line(
        points={{-238,222},{-202,222},{-202,218},{-164,218},{-164,220},{-54,220},
            {-54,202},{14,202}},
        color={182,109,49},
        thickness=0.5));
    connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
          points={{-135.2,-23},{-148,-23},{-148,8},{-135.8,8},{-135.8,18.6}},
                                                                            color=
           {0,0,127}));
    connect(valve_controller.ACT_x,valveLinearOpening. opening)
      annotation (Line(points={{-101.9,-23},{-92,-23},{-92,8},{-104,8},{-104,18},{
            -102,18}},                                         color={0,0,127}));
    connect(m_flow_H2.y, Immissione_2.in_m_flow0) annotation (Line(points={{-376,256},
            {-308,256},{-308,227}}, color={0,0,127}));
    annotation (experiment(
        StopTime=10000,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end RG2i_source2_H2_limits;

  model RG2i_inj1_MaxH2Inj
    "Maximu injection of point 1 in order to respect quality indices."
    extends RG2i_inj1_ProdDemand_profiles_NG6(H2_Production(table=H2MaxProd));

    parameter H2GasFacility.Types.MassFlowRate H2MaxProd[:,2] = [0,0.001221; 347,0.001221; 694,0.001221; 1041,0.001214; 1388,0.001214; 1735,0.001298; 2082,0.001534; 2429,0.001534; 2776,0.001518; 3123,0.001518; 3470,0.001498; 3817,0.001226; 4164,0.001226; 4511,0.001366; 4858,0.001518; 5205,0.001518; 5552,0.001541; 5899,0.001541; 6246,0.001502; 6593,0.001221; 6940,0.001221; 7287,0.001215; 7634,0.001214; 7981,0.001215; 8328,0.001233; 8675,0.001233; 9022,0.001229; 9369,0.001214; 9716,0.001216; 10063,0.001529; 10410,0.001529; 10757,0.001513; 11104,0.001237; 11451,0.001237; 11798,0.001099; 12145,0.000904; 12492,0.000908; 12839,0.001221; 13186,0.001221; 13533,0.001223; 13880,0.001237; 14227,0.001237; 14573,0.001220; 14920,0.001214; 15267,0.001214; 15614,0.001226; 15961,0.001226; 16308,0.001227; 16655,0.001233; 17002,0.001233; 17349,0.001214; 17696,0.001214; 18043,0.001215; 18390,0.001233; 18737,0.001233; 19084,0.001229; 19431,0.001221; 19778,0.001225; 20125,0.001525; 20472,0.001525; 20819,0.001525; 21166,0.001529; 21513,0.001529; 21860,0.001529; 22207,0.001518; 22554,0.001518; 22901,0.001600; 23248,0.001832; 23595,0.001834; 23942,0.002122; 24289,0.002122; 24636,0.002103; 24983,0.001827; 25330,0.001827; 25677,0.001827; 26024,0.001827; 26371,0.001837; 26718,0.002428; 27065,0.002428; 27412,0.002424; 27759,0.002134; 28106,0.002134; 28453,0.002133; 28800,0.002122; 29147,0.002123; 29494,0.002243; 29841,0.002428; 30188,0.002424; 30535,0.002122; 30882,0.002122; 31229,0.002123; 31576,0.002127; 31923,0.002128; 32270,0.002339; 32617,0.002428; 32964,0.002421; 33311,0.002134; 33658,0.002134; 34005,0.002131; 34352,0.001827; 34699,0.001827; 35046,0.001827; 35393,0.001836; 35740,0.001836; 36087,0.001834; 36434,0.001827; 36781,0.001827; 37128,0.001827; 37475,0.001813; 37822,0.001534; 38169,0.001534; 38516,0.001531; 38863,0.001525; 39210,0.001525; 39557,0.001541; 39904,0.001541; 40251,0.001513; 40598,0.001214; 40945,0.001215; 41292,0.001410; 41639,0.001546; 41986,0.001532; 42333,0.000920; 42680,0.000920; 43027,0.000919; 43373,0.000913; 43720,0.000914; 44067,0.001237; 44414,0.001237; 44761,0.001225; 45108,0.000925; 45455,0.000925; 45802,0.000921; 46149,0.000913; 46496,0.000916; 46843,0.001237; 47190,0.001237; 47537,0.001195; 47884,0.000613; 48231,0.000613; 48578,0.000758; 48925,0.000913; 49272,0.000918; 49619,0.001233; 49966,0.001233; 50313,0.001196; 50660,0.000936; 51007,0.000935; 51354,0.000645; 51701,0.000605; 52048,0.000614; 52395,0.000920; 52742,0.000920; 53089,0.000994; 53436,0.001244; 53783,0.001240; 54130,0.000609; 54477,0.000609; 54824,0.000627; 55171,0.000920; 55518,0.000920; 55865,0.000922; 56212,0.000925; 56559,0.000925; 56906,0.000932; 57253,0.000932; 57600,0.000930; 57947,0.000913; 58294,0.000913; 58641,0.000922; 58988,0.000925; 59335,0.000925; 59682,0.000932; 60029,0.000932; 60376,0.000929; 60723,0.000920; 61070,0.000920; 61417,0.000921; 61764,0.000932; 62111,0.000932; 62458,0.001098; 62805,0.001214; 63152,0.001208; 63499,0.000925; 63846,0.000925; 64193,0.000970; 64540,0.001226; 64887,0.001224; 65234,0.000913; 65581,0.000913; 65928,0.000925; 66275,0.001233; 66622,0.001233; 66969,0.001230; 67316,0.001221; 67663,0.001221; 68010,0.001222; 68357,0.001226; 68704,0.001227; 69051,0.001478; 69398,0.001525; 69745,0.001516; 70092,0.001233; 70439,0.001233; 70786,0.001293; 71133,0.001508; 71480,0.001509; 71827,0.001541; 72173,0.001541; 72520,0.001523; 72867,0.001208; 73214,0.001209; 73561,0.001336; 73908,0.001529; 74255,0.001529; 74602,0.001525; 74949,0.001525; 75296,0.001494; 75643,0.001226; 75990,0.001227; 76337,0.001442; 76684,0.001529; 77031,0.001529; 77378,0.001508; 77725,0.001508; 78072,0.001456; 78419,0.001226; 78766,0.001228; 79113,0.001541; 79460,0.001541; 79807,0.001525; 80154,0.001208; 80501,0.001209; 80848,0.001318; 81195,0.001541; 81542,0.001537; 81889,0.001221; 82236,0.001221; 82583,0.001220; 82930,0.001214; 83277,0.001214; 83624,0.001228; 83971,0.001237; 84318,0.001237; 84665,0.001214; 85012,0.001214; 85359,0.001215; 85706,0.001221; 86053,0.001223; 86400,0.001541] "Hydrogen production profile over a day.";
    annotation (experiment(
        StopTime=86400,
        Tolerance=1e-05,
        __Dymola_Algorithm="Dassl"));
  end RG2i_inj1_MaxH2Inj;
  annotation (Documentation(info="<html>
<p>This package includes the models that have been used to generate the results of the following article:</p>
<p>Sassaroli G., Casamassima V. &amp; Muro Alvarado M.</p>
<p>&quot;Dynamic modeling and simulation of gas distribution networks with decentralized hydrogen injections.&quot;</p>
<p>2025 IFAC Workshop on Smart Energy Systems for Efficient and Sustainable Smart Grids and Smart Cities&nbsp;(SENSYS 2025)</p>
<p>Status: UNDER REVIEW</p>
</html>"));
end Report_122025;
