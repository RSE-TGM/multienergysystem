within MultiEnergySystem.CaseStudies.Report_062024;
partial model PaperCaseI "Distribution network example from [1]"
  extends Modelica.Icons.Example;
  //Medium used for the gas facility, based on real gas properties
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                                                                              "Network medium.";
  replaceable model MediumUsers =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                                                                                 "User medium.";
   replaceable model Hydrogen =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND(posDom = 7) constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                                                                                             "Hydrogen medium.";

  // General parameters for system behavior and configuration
  parameter Boolean useEnergyDemand = false "Flag to determine if energy demand is used.";
  parameter Boolean massFractionDynamicBalance = false "Enable quasi-static assumptions for calculations.";
  parameter Boolean constantFrictionFactor = true "Assume constant friction factor in calculations.";
  parameter Boolean computeInertialTerm = false "Whether to include inertial effects in calculations.";

  // Pipeline configuration parameters
  parameter Integer n = 3 "Number of volumes in each pipeline.";
  parameter Integer nX = 7 "Number of components in the gas fluid.";

  // Initial mass fractions of the gas components
  parameter H2GasFacility.Types.MassFraction X_start[nX]=H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter H2GasFacility.Types.MassFraction X_start_H2[nX]={0.0,0.0,0.0,0.0,
      0.0,0.0,1.0};
  parameter H2GasFacility.Types.MassFlowRate m_flow_H2_ref=0.005
    "Reference hydrogen mass flow rate.";
  parameter H2GasFacility.Types.Pressure p_nom=1.5e5
    "Nominal pressure for the system.";
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  //parameter Types.MassFlowRate H2Production[:, 2] = [0, m_flow_H2_ref*0; 1*3600, 0; 2*3600, 0.00007490; 3*3600, 0.00129827; 4*3600, 0.00129827; 5*3600, 0.00007490; 6*3600, 0; 12*3600, 0; 13*3600, 0.00099867; 14*3600, 0.00119840; 15*3600, 0.00169773; 16*3600, 0.00109853; 17*3600, 0; 24*3600, 0];
  parameter H2GasFacility.Types.MassFlowRate H2Production[:,2]=[0,m_flow_H2_ref
      *0; 1*3600,0; 2*3600,0.00007490; 3*3600,0.00129827; 4*3600,0.00129827; 5*
      3600,0.00007490; 6*3600,0; 12*3600,0; 13*3600,0.00099867; 14*3600,
      0.0008655; 15*3600,0.0003956; 16*3600,0.0003956; 17*3600,0; 24*3600,0]
    "Hydrogen production profile over a day.";
  parameter H2GasFacility.Types.Length kappa=0.045e-3
    "Thermal conductivity of the pipeline.";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;

  // Maximum mass flowrate demand for each user
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user4=0.044645108
    "User 4 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user5=0.03493965
    "User 5 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user10=0.040762925
    "User 10 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user11=0.009705458
    "User 11 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user12=0.014558188
    "User 12 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user13=0.006793821
    "User 13 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user14=0.008734913
    "User 14 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user15=0.017469825
    "User 15 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user16=0.012723856
    "User 16 max flow rate.";
  parameter H2GasFacility.Types.MassFlowRate m_flow_max_user17=0.010676004
    "User 17 max flow rate.";

  // Maximum energy demand for each user
  parameter Real W_max_user4 = 0.044645108*3.84E+07/0.696977 "User 4 max energy demand.";
  parameter Real W_max_user5 = 0.03493965*3.84E+07/0.696977 "User 5 max energy demand.";
  parameter Real W_max_user10 = 0.040762925*3.84E+07/0.696977 "User 10 max energy demand.";
  parameter Real W_max_user11 = 0.009705458*3.84E+07/0.696977 "User 11 max energy demand.";
  parameter Real W_max_user12 = 0.014558188*3.84E+07/0.696977 "User 12 max energy demand.";
  parameter Real W_max_user13 = 0.006793821*3.84E+07/0.696977 "User 13 max energy demand.";
  parameter Real W_max_user14 = 0.008734913*3.84E+07/0.696977 "User 14 max energy demand.";
  parameter Real W_max_user15 = 0.017469825*3.84E+07/0.696977 "User 15 max energy demand.";
  parameter Real W_max_user16 = 0.012723856*3.84E+07/0.696977 "User 16 max energy demand.";
  parameter Real W_max_user17 = 0.010676004*3.84E+07/0.696977 "User 17 max energy demand.";

// total demand (mass flowrate or energy) profile in one day
  parameter Real industrialDemand4[5, 2] = industrialDemand_mfr(m_flow_max_user4) "Industrial demand 4.";
  parameter Real industrialDemand5[5, 2] = industrialDemand_mfr(m_flow_max_user5) "Industrial demand 5.";
  parameter Real industrialDemand10[5, 2] = industrialDemand_mfr(m_flow_max_user10) "Industrial demand 10.";
  parameter Real residentialDemand11[14, 2] = residentialDemand_mfr(m_flow_max_user11) "Residential demand 11.";
  parameter Real residentialDemand12[14, 2] = residentialDemand_mfr(m_flow_max_user12) "Residential demand 12.";
  parameter Real residentialDemand13[14, 2] = residentialDemand_mfr(m_flow_max_user13) "Residential demand 13.";
  parameter Real residentialDemand14[14, 2] = residentialDemand_mfr(m_flow_max_user14) "Residential demand 14.";
  parameter Real residentialDemand15[14, 2] = residentialDemand_mfr(m_flow_max_user15) "Residential demand 15.";
  parameter Real residentialDemand16[14, 2] = residentialDemand_mfr(m_flow_max_user16) "Residential demand 16.";
  parameter Real residentialDemand17[14, 2] = residentialDemand_mfr(m_flow_max_user17) "Residential demand 17.";

  H2GasFacility.Types.MassFlowRate total_m_flow_demand
    "Total mass flowrate demand.";

  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={170,130},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe1.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe1.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe1.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe1.Tout_start,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe1.rho_nom,                                                                                                                                                      X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe1.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe1.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe1.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe1.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe1.pout_start,                                                                                                                                                                                                        momentum = momentum,
    kappa=kappa,
    constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe2.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe2.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe2.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe2.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe2.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe2.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe2.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe2.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe2.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe2.rho_nom,
    kappa=kappa,
constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe3.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe3.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe3.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe3.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe3.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe3.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe3.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe3.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe3.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe3.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe4.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe4.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe4.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe4.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe4.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe4.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe4.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe4.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe4.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe4.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe5(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe5.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe5.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe5.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe5.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe5.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe5.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe5.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe5.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe5.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe5.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe6(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe6.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe6.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe6.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe6.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe6.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe6.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe6.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe6.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe6.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe6.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe7.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe7.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe7.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe7.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe7.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe7.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe7.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe7.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe7.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe7.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe8(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe8.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe8.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe8.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe8.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe8.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe8.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe8.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe8.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe8.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe8.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe9(redeclare model
            Medium =                                                                        Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe9.Di,                                                                       L=
        CaseStudies.Report_062024.PipelineData.pipe9.L,                                                                                          Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe9.Tin_start,                                                                                                                    Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe9.Tout_start,                                                                                                                                                       X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe9.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe9.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe9.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe9.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe9.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe9.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe10(Di=
        CaseStudies.Report_062024.PipelineData.pipe10.Di,                                       L=
        CaseStudies.Report_062024.PipelineData.pipe10.L,                                                           redeclare model
            Medium =                                                                                                                 Medium, Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe10.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe10.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe10.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe10.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe10.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe10.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe10.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe10.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-70, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe11(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe11.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe11.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe11.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe11.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe11.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe11.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe11.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe11.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe11.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe11.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe12.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe12.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe12.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe12.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe12.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe12.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe12.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe12.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe12.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe12.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe13.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe13.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe13.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe13.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe13.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe13.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe13.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe13.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe13.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe13.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe14(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe14.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe14.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe14.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe14.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe14.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe14.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe14.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe14.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe14.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe14.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={55,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe15(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe15.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe15.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe15.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe15.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe15.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe15.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe15.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe15.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe15.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe15.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={105,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe16(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe16.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe16.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe16.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe16.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe16.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe16.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe16.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe16.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe16.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe16.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={130,-60},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe17(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe17.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe17.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe17.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe17.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe17.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe17.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe17.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe17.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe17.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe17.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={55,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe18(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe18.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe18.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe18.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe18.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe18.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe18.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe18.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe18.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe18.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe18.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={80,20},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe19(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe19.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe19.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe19.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe19.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe19.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe19.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe19.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe19.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe19.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe19.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe20(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe20.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe20.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe20.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe20.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe20.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe20.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe20.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe20.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe20.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe20.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-44, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe21(redeclare model
            Medium =                                                                         Medium, Di=
        CaseStudies.Report_062024.PipelineData.pipe21.Di,                                                                        L=
        CaseStudies.Report_062024.PipelineData.pipe21.L,                                                                                            Tin_start=
        CaseStudies.Report_062024.PipelineData.pipe21.Tin_start,                                                                                                                       Tout_start=
        CaseStudies.Report_062024.PipelineData.pipe21.Tout_start,                                                                                                                                                           X_start = X_start, hin_start=
        CaseStudies.Report_062024.PipelineData.pipe21.hin_start,                                                                                                                                                                                                        k=
        CaseStudies.Report_062024.PipelineData.pipe21.k,                                                                                                                                                                                                        kc = 1, m_flow_start=
        CaseStudies.Report_062024.PipelineData.pipe21.m_flow_start,                                                                                                                                                                                                        n = n, pin_start=
        CaseStudies.Report_062024.PipelineData.pipe21.pin_start,                                                                                                                                                                                                        pout_start=
        CaseStudies.Report_062024.PipelineData.pipe21.pout_start,                                                                                                                                                                                                        momentum = momentum,
    massFractionDynamicBalance=massFractionDynamicBalance, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=CaseStudies.Report_062024.PipelineData.pipe21.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user4(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe3.pout_start,                                            X0 = X_start,
    m_flow0=0.045489,
    massflowratedemand=[0,0.045489; 3600,0.045489],                                                                                                                                                                                                      useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {30, 40}, extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user5(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe4.pout_start,                                            X0 = X_start,
    m_flow0=0.0356,
    massflowratedemand=[0,0.0356; 3600,0.0356],                                                                                                                                                                                                 useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation=180)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user10(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe10.pout_start,                                            X0 = X_start,
    m_flow0=0.041533,
    massflowratedemand=[0,0.041533; 3600,0.041533],                                                                                                                                                                                                   useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user11(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe14.pout_start,                                            X0 = X_start,
    m_flow0=0.009889,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user12(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe15.pout_start,                                            X0 = X_start,
    m_flow0=0.014833,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={130,-40},    extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user13(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe16.pout_start,                                            X0 = X_start,
    m_flow0=0.006922,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={130,-80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user14(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe17.pout_start,                                            X0 = X_start,
    m_flow0=0.008900,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user15(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe18.pout_start,                                            X0 = X_start,
    m_flow0=0.017800,                                                                                                                                                                                                        useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,40},    extent = {{-10, -10}, {10, 10}}, rotation=180)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user16(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe19.pout_start,                                            X0 = X_start,
    m_flow0=0.012856,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user17(redeclare model
            Medium =
        MediumUsers,
    p0=CaseStudies.Report_062024.PipelineData.pipe20.pout_start,                                            X0 = X_start,
    m_flow0=0.010878,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare model
            Medium =
        MediumUsers,
    T0=288.15,                                                                                                            X0 = X_start,
    p0=150000,
    R=1e-3)                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-20,96},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP18(redeclare model
            Medium =
        MediumUsers,
    T0=288.15,                                                                                                             X0 = X_start,
    p0=150000,
    R=1e-3)                                                                                                                                          annotation (
    Placement(visible = true, transformation(origin={-132,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceH2_A(redeclare model
            Medium =
        Hydrogen, G = 1e-8, T0 = 15 + 273.15, X0 = X_start_H2, computeEnthalpyWithFixedPressure = true, m_flow0 = m_flow_H2_ref, p0 = 1.5e5, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin={-104,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(duration = 50, height = m_flow_H2_ref, offset = 0, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={-135,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable H2_Production(table=H2Production)
    annotation (Placement(visible = true, transformation(origin={35,0},    extent = {{-180, -70}, {-160, -50}}, rotation = 0)));

  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O(redeclare model
            Medium =                                                                                     Medium,
    p_start=CaseStudies.Report_062024.PipelineData.pipe8.pin_start,
    T_start=CaseStudies.Report_062024.PipelineData.pipe8.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{-74,-4},{-66,4}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O1(
    redeclare model Medium = Medium,
    p_start=CaseStudies.Report_062024.PipelineData.pipe9.pin_start,
    T_start=CaseStudies.Report_062024.PipelineData.pipe9.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{26,-4},{34,4}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O2(
    redeclare model Medium = Medium,
    p_start=CaseStudies.Report_062024.PipelineData.pipe2.pin_start,
    T_start=CaseStudies.Report_062024.PipelineData.pipe2.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={-20,40})));
protected
  function residentialDemand_mfr
    input H2GasFacility.Types.MassFlowRate m_flow_max;
    output Real[14,2] demand;
  algorithm
    demand := [0, m_flow_max*0.9; 1*3600, m_flow_max*0.9; 2*3600, m_flow_max*0.4; 3*3600, m_flow_max*0.4; 4*3600, m_flow_max*0.8; 6*3600, m_flow_max*0.8; 7*3600, m_flow_max*0.4; 9*3600, m_flow_max*0.4; 10*3600, m_flow_max*1; 13*3600, m_flow_max*1; 15*3600, m_flow_max*0.1; 21*3600, m_flow_max*0.1; 22*3600, m_flow_max*0.9; 24*3600, m_flow_max*0.9];
    annotation (
      Inline = true);
  end residentialDemand_mfr;

  function industrialDemand_mfr
    input H2GasFacility.Types.MassFlowRate m_flow_max;
    output Real[5,2] demand;
  algorithm
    demand := [0, m_flow_max*1; 10*3600, m_flow_max*1; 11*3600, m_flow_max*0.2; 22*3600, m_flow_max*0.2; 24*3600, m_flow_max*1];
    annotation (
      Inline = true);
  end industrialDemand_mfr;

equation
  total_m_flow_demand = user4.inlet.m_flow + user5.inlet.m_flow + user10.inlet.m_flow + user11.inlet.m_flow + user12.inlet.m_flow + user13.inlet.m_flow + user14.inlet.m_flow + user15.inlet.m_flow + user16.inlet.m_flow + user17.inlet.m_flow;
  connect(pipe16.outlet, user13.inlet) annotation (
    Line(points={{130,-70},{130,-80}},      color = {182, 109, 49}));
  connect(user5.inlet, pipe8.outlet) annotation (
    Line(points = {{-70, 40}, {-70, 30}}, color = {182, 109, 49}));
  connect(user5.inlet, pipe4.outlet) annotation (
    Line(points = {{-70, 40}, {-50, 40}}, color = {182, 109, 49}));
  connect(pipe2.outlet, pipe7.inlet) annotation (
    Line(points = {{-20, 10}, {-20, -10}}, color = {182, 109, 49}));
  connect(pipe5.outlet, pipe7.inlet) annotation (
    Line(points = {{-30, 0}, {-20, 0}, {-20, -10}}, color = {182, 109, 49}));
  connect(pipe6.inlet, pipe7.inlet) annotation (
    Line(points = {{-10, 0}, {-20, 0}, {-20, -10}}, color = {182, 109, 49}));
  connect(user16.inlet, pipe20.inlet) annotation (
    Line(points = {{-20, -80}, {-34, -80}}, color = {182, 109, 49}));
  connect(pipe20.outlet, user17.inlet) annotation (
    Line(points = {{-54, -80}, {-70, -80}}, color = {182, 109, 49}));
  connect(pipe19.outlet, user16.inlet) annotation (
    Line(points = {{-20, -70}, {-20, -80}}, color = {182, 109, 49}));
  connect(pipe7.outlet, pipe19.inlet) annotation (
    Line(points = {{-20, -30}, {-20, -50}}, color = {182, 109, 49}));
  connect(pipe11.outlet, pipe14.inlet) annotation (
    Line(points={{30,-30},{30,-40},{45,-40}},        color = {182, 109, 49}));
  connect(pipe15.outlet, user12.inlet) annotation (
    Line(points={{115,-40},{130,-40}},      color = {182, 109, 49}));
  connect(user12.inlet, pipe16.inlet) annotation (
    Line(points={{130,-40},{130,-50}},      color = {182, 109, 49}));
  connect(pipe17.outlet, user14.inlet) annotation (
    Line(points={{65,0},{80,0}},      color = {182, 109, 49}));
  connect(user14.inlet, pipe18.inlet) annotation (
    Line(points={{80,0},{80,10}},      color = {182, 109, 49}));
  connect(pipe18.outlet, user15.inlet) annotation (
    Line(points={{80,30},{80,40}},      color = {182, 109, 49}));
  connect(pipe14.outlet, user11.inlet) annotation (
    Line(points={{65,-40},{80,-40}},      color = {182, 109, 49}));
  connect(user11.inlet, pipe15.inlet) annotation (
    Line(points={{80,-40},{95,-40}},       color = {182, 109, 49}));
  connect(user10.inlet, pipe13.outlet) annotation (
    Line(points = {{-70, -40}, {-50, -40}}, color = {182, 109, 49}));
  connect(pipe13.inlet, pipe19.inlet) annotation (
    Line(points = {{-30, -40}, {-20, -40}, {-20, -50}}, color = {182, 109, 49}));
  connect(pipe3.outlet, user4.inlet) annotation (
    Line(points = {{10, 40}, {30, 40}}, color = {182, 109, 49}));
  connect(user4.inlet, pipe9.outlet) annotation (
    Line(points = {{30, 40}, {30, 30}}, color = {182, 109, 49}));
  connect(pipe12.inlet, pipe19.inlet) annotation (
    Line(points = {{-10, -40}, {-20, -40}, {-20, -50}}, color = {182, 109, 49}));
  connect(pipe12.outlet, pipe11.outlet) annotation (
    Line(points = {{10, -40}, {30, -40}, {30, -30}}, color = {182, 109, 49}));
  connect(pipe10.outlet, user10.inlet) annotation (
    Line(points = {{-70, -28}, {-70, -40}}, color = {182, 109, 49}));
  connect(sourceP18.outlet, pipe21.inlet) annotation (
    Line(points={{-122,0},{-110,0}},      color = {182, 109, 49}));
  connect(sourceP1.outlet, pipe1.inlet) annotation (
    Line(points={{-20,86},{-20,70}},       color = {182, 109, 49}));
  connect(manifold2I2O.outlet, pipe8.inlet) annotation (Line(
      points={{-70,3.92},{-70,10}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O.outlet1, pipe5.inlet) annotation (Line(
      points={{-66,0},{-50,0}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O.outlet2, pipe10.inlet) annotation (Line(
      points={{-70,-4},{-70,-8}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O.inlet, pipe21.outlet) annotation (Line(
      points={{-74,0},{-90,0}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O1.inlet, pipe6.outlet) annotation (Line(
      points={{26,0},{10,0}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O1.outlet, pipe9.inlet) annotation (Line(
      points={{30,3.92},{30,10}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O1.outlet1, pipe17.inlet) annotation (Line(
      points={{34,0},{45,0}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O1.outlet2, pipe11.inlet) annotation (Line(
      points={{30,-4},{30,-10}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O2.outlet2, pipe4.inlet) annotation (Line(
      points={{-24,40},{-30,40}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O2.outlet, pipe3.inlet) annotation (Line(
      points={{-16.08,40},{-10,40}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O2.outlet1, pipe2.inlet) annotation (Line(
      points={{-20,36},{-20,30}},
      color={182,109,49},
      thickness=0.5));
  connect(manifold2I2O2.inlet, pipe1.outlet) annotation (Line(
      points={{-20,44},{-20,50}},
      color={182,109,49},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    experiment(StartTime = 0, StopTime = 22000, Tolerance = 1e-06, Interval = 44),
    Documentation(info="<html>
<p>The following test model takes the information of the study case in paper <a href=\"https://www.sciencedirect.com/science/article/pii/S0360319921018541\">[1]</a>. This case corresponds to a <b>medium pressure</b> distribution network with 0.5 bar as working pressure.</p>
<p>This partial model is taken as reference structure and it is extended in the next examples.</p>
</html>"));
end PaperCaseI;
