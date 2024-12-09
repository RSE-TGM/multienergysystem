within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
partial model PaperCaseI "Distribution network example from [1]"
  extends Modelica.Icons.Example;
  //replaceable model Medium = H2GasFacility.Media.IdealGases.NG6_H2;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumUsers =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
   replaceable model Hydrogen =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND(posDom = 7) constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = true;
  parameter Boolean constantFrictionFactor = true;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 7 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter Types.MassFraction X_start_H2[nX] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Pressure p_nom = 1.5e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  //parameter Types.MassFlowRate H2Production[:, 2] = [0, m_flow_H2_ref*0; 1*3600, 0; 2*3600, 0.00007490; 3*3600, 0.00129827; 4*3600, 0.00129827; 5*3600, 0.00007490; 6*3600, 0; 12*3600, 0; 13*3600, 0.00099867; 14*3600, 0.00119840; 15*3600, 0.00169773; 16*3600, 0.00109853; 17*3600, 0; 24*3600, 0];
  parameter Types.MassFlowRate H2Production[:, 2] = [0, m_flow_H2_ref*0; 1*3600, 0; 2*3600, 0.00007490; 3*3600, 0.00129827; 4*3600, 0.00129827; 5*3600, 0.00007490; 6*3600, 0; 12*3600, 0; 13*3600, 0.00099867; 14*3600, 0.0008655; 15*3600, 0.0003956; 16*3600, 0.0003956; 17*3600, 0; 24*3600, 0];
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;

// Maximum mass flowrate demand for each user
  parameter Types.MassFlowRate m_flow_max_user4 = 0.044645108;
  parameter Types.MassFlowRate m_flow_max_user5 = 0.03493965;
  parameter Types.MassFlowRate m_flow_max_user10 = 0.040762925;
  parameter Types.MassFlowRate m_flow_max_user11 = 0.009705458;
  parameter Types.MassFlowRate m_flow_max_user12 = 0.014558188;
  parameter Types.MassFlowRate m_flow_max_user13 = 0.006793821;
  parameter Types.MassFlowRate m_flow_max_user14 = 0.008734913;
  parameter Types.MassFlowRate m_flow_max_user15 = 0.017469825;
  parameter Types.MassFlowRate m_flow_max_user16 = 0.012723856;
  parameter Types.MassFlowRate m_flow_max_user17 = 0.010676004;

// Maximum energy demand for each user
  parameter Real W_max_user4 = 0.044645108*3.84E+07/0.696977;
  parameter Real W_max_user5 = 0.03493965*3.84E+07/0.696977;
  parameter Real W_max_user10 = 0.040762925*3.84E+07/0.696977;
  parameter Real W_max_user11 = 0.009705458*3.84E+07/0.696977;
  parameter Real W_max_user12 = 0.014558188*3.84E+07/0.696977;
  parameter Real W_max_user13 = 0.006793821*3.84E+07/0.696977;
  parameter Real W_max_user14 = 0.008734913*3.84E+07/0.696977;
  parameter Real W_max_user15 = 0.017469825*3.84E+07/0.696977;
  parameter Real W_max_user16 = 0.012723856*3.84E+07/0.696977;
  parameter Real W_max_user17 = 0.010676004*3.84E+07/0.696977;

// total demand (mass flowrate or energy) profile in one day
  parameter Real industrialDemand4[5, 2] = industrialDemand_mfr(m_flow_max_user4);
  parameter Real industrialDemand5[5, 2] = industrialDemand_mfr(m_flow_max_user5);
  parameter Real industrialDemand10[5, 2] = industrialDemand_mfr(m_flow_max_user10);
  parameter Real residentialDemand11[14, 2] = residentialDemand_mfr(m_flow_max_user11) "Table for demand";
  parameter Real residentialDemand12[14, 2] = residentialDemand_mfr(m_flow_max_user12);
  parameter Real residentialDemand13[14, 2] = residentialDemand_mfr(m_flow_max_user13);
  parameter Real residentialDemand14[14, 2] = residentialDemand_mfr(m_flow_max_user14);
  parameter Real residentialDemand15[14, 2] = residentialDemand_mfr(m_flow_max_user15);
  parameter Real residentialDemand16[14, 2] = residentialDemand_mfr(m_flow_max_user16);
  parameter Real residentialDemand17[14, 2] = residentialDemand_mfr(m_flow_max_user17);

  Types.MassFlowRate total_m_flow_demand "Total mass flowrate demand";

  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={170,130},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe1(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe1.Di, L = Pipe.pipe1.L, Tin_start = Pipe.pipe1.Tin_start, Tout_start = Pipe.pipe1.Tout_start,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe1.rho_nom,                                                                                                                                                                                 X_start = X_start, hin_start = Pipe.pipe1.hin_start, k = Pipe.pipe1.k, kc = 1, m_flow_start = Pipe.pipe1.m_flow_start, n = n, pin_start = Pipe.pipe1.pin_start, pout_start = Pipe.pipe1.pout_start, momentum = momentum,
    kappa=kappa,
    constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe2(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe2.Di, L = Pipe.pipe2.L, Tin_start = Pipe.pipe2.Tin_start, Tout_start = Pipe.pipe2.Tout_start, X_start = X_start, hin_start = Pipe.pipe2.hin_start, k = Pipe.pipe2.k, kc = 1, m_flow_start = Pipe.pipe2.m_flow_start, n = n, pin_start = Pipe.pipe2.pin_start, pout_start = Pipe.pipe2.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe2.rho_nom,
    kappa=kappa,
constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe3(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe3.Di, L = Pipe.pipe3.L, Tin_start = Pipe.pipe3.Tin_start, Tout_start = Pipe.pipe3.Tout_start, X_start = X_start, hin_start = Pipe.pipe3.hin_start, k = Pipe.pipe3.k, kc = 1, m_flow_start = Pipe.pipe3.m_flow_start, n = n, pin_start = Pipe.pipe3.pin_start, pout_start = Pipe.pipe3.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe3.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe4(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe4.Di, L = Pipe.pipe4.L, Tin_start = Pipe.pipe4.Tin_start, Tout_start = Pipe.pipe4.Tout_start, X_start = X_start, hin_start = Pipe.pipe4.hin_start, k = Pipe.pipe4.k, kc = 1, m_flow_start = Pipe.pipe4.m_flow_start, n = n, pin_start = Pipe.pipe4.pin_start, pout_start = Pipe.pipe4.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe4.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe5(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe5.Di, L = Pipe.pipe5.L, Tin_start = Pipe.pipe5.Tin_start, Tout_start = Pipe.pipe5.Tout_start, X_start = X_start, hin_start = Pipe.pipe5.hin_start, k = Pipe.pipe5.k, kc = 1, m_flow_start = Pipe.pipe5.m_flow_start, n = n, pin_start = Pipe.pipe5.pin_start, pout_start = Pipe.pipe5.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe5.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, 0}, extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe6(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe6.Di, L = Pipe.pipe6.L, Tin_start = Pipe.pipe6.Tin_start, Tout_start = Pipe.pipe6.Tout_start, X_start = X_start, hin_start = Pipe.pipe6.hin_start, k = Pipe.pipe6.k, kc = 1, m_flow_start = Pipe.pipe6.m_flow_start, n = n, pin_start = Pipe.pipe6.pin_start, pout_start = Pipe.pipe6.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe6.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe7(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe7.Di, L = Pipe.pipe7.L, Tin_start = Pipe.pipe7.Tin_start, Tout_start = Pipe.pipe7.Tout_start, X_start = X_start, hin_start = Pipe.pipe7.hin_start, k = Pipe.pipe7.k, kc = 1, m_flow_start = Pipe.pipe7.m_flow_start, n = n, pin_start = Pipe.pipe7.pin_start, pout_start = Pipe.pipe7.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe7.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe8(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe8.Di, L = Pipe.pipe8.L, Tin_start = Pipe.pipe8.Tin_start, Tout_start = Pipe.pipe8.Tout_start, X_start = X_start, hin_start = Pipe.pipe8.hin_start, k = Pipe.pipe8.k, kc = 1, m_flow_start = Pipe.pipe8.m_flow_start, n = n, pin_start = Pipe.pipe8.pin_start, pout_start = Pipe.pipe8.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe8.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe9(redeclare
      model                                                                        Medium = Medium, Di = Pipe.pipe9.Di, L = Pipe.pipe9.L, Tin_start = Pipe.pipe9.Tin_start, Tout_start = Pipe.pipe9.Tout_start, X_start = X_start, hin_start = Pipe.pipe9.hin_start, k = Pipe.pipe9.k, kc = 1, m_flow_start = Pipe.pipe9.m_flow_start, n = n, pin_start = Pipe.pipe9.pin_start, pout_start = Pipe.pipe9.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe9.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe10(Di = Pipe.pipe10.Di, L = Pipe.pipe10.L, redeclare
      model                                                                                                                 Medium = Medium, Tin_start = Pipe.pipe10.Tin_start, Tout_start = Pipe.pipe10.Tout_start, X_start = X_start, hin_start = Pipe.pipe10.hin_start, k = Pipe.pipe10.k, kc = 1, m_flow_start = Pipe.pipe10.m_flow_start, n = n, pin_start = Pipe.pipe10.pin_start, pout_start = Pipe.pipe10.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe10.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-70, -18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe11(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe11.Di, L = Pipe.pipe11.L, Tin_start = Pipe.pipe11.Tin_start, Tout_start = Pipe.pipe11.Tout_start, X_start = X_start, hin_start = Pipe.pipe11.hin_start, k = Pipe.pipe11.k, kc = 1, m_flow_start = Pipe.pipe11.m_flow_start, n = n, pin_start = Pipe.pipe11.pin_start, pout_start = Pipe.pipe11.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe11.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe12(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe12.Di, L = Pipe.pipe12.L, Tin_start = Pipe.pipe12.Tin_start, Tout_start = Pipe.pipe12.Tout_start, X_start = X_start, hin_start = Pipe.pipe12.hin_start, k = Pipe.pipe12.k, kc = 1, m_flow_start = Pipe.pipe12.m_flow_start, n = n, pin_start = Pipe.pipe12.pin_start, pout_start = Pipe.pipe12.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe12.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe13(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe13.Di, L = Pipe.pipe13.L, Tin_start = Pipe.pipe13.Tin_start, Tout_start = Pipe.pipe13.Tout_start, X_start = X_start, hin_start = Pipe.pipe13.hin_start, k = Pipe.pipe13.k, kc = 1, m_flow_start = Pipe.pipe13.m_flow_start, n = n, pin_start = Pipe.pipe13.pin_start, pout_start = Pipe.pipe13.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe13.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe14(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe14.Di, L = Pipe.pipe14.L, Tin_start = Pipe.pipe14.Tin_start, Tout_start = Pipe.pipe14.Tout_start, X_start = X_start, hin_start = Pipe.pipe14.hin_start, k = Pipe.pipe14.k, kc = 1, m_flow_start = Pipe.pipe14.m_flow_start, n = n, pin_start = Pipe.pipe14.pin_start, pout_start = Pipe.pipe14.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe14.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={55,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe15(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe15.Di, L = Pipe.pipe15.L, Tin_start = Pipe.pipe15.Tin_start, Tout_start = Pipe.pipe15.Tout_start, X_start = X_start, hin_start = Pipe.pipe15.hin_start, k = Pipe.pipe15.k, kc = 1, m_flow_start = Pipe.pipe15.m_flow_start, n = n, pin_start = Pipe.pipe15.pin_start, pout_start = Pipe.pipe15.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe15.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={105,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe16(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe16.Di, L = Pipe.pipe16.L, Tin_start = Pipe.pipe16.Tin_start, Tout_start = Pipe.pipe16.Tout_start, X_start = X_start, hin_start = Pipe.pipe16.hin_start, k = Pipe.pipe16.k, kc = 1, m_flow_start = Pipe.pipe16.m_flow_start, n = n, pin_start = Pipe.pipe16.pin_start, pout_start = Pipe.pipe16.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe16.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={130,-60},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe17(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe17.Di, L = Pipe.pipe17.L, Tin_start = Pipe.pipe17.Tin_start, Tout_start = Pipe.pipe17.Tout_start, X_start = X_start, hin_start = Pipe.pipe17.hin_start, k = Pipe.pipe17.k, kc = 1, m_flow_start = Pipe.pipe17.m_flow_start, n = n, pin_start = Pipe.pipe17.pin_start, pout_start = Pipe.pipe17.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe17.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={55,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe18(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe18.Di, L = Pipe.pipe18.L, Tin_start = Pipe.pipe18.Tin_start, Tout_start = Pipe.pipe18.Tout_start, X_start = X_start, hin_start = Pipe.pipe18.hin_start, k = Pipe.pipe18.k, kc = 1, m_flow_start = Pipe.pipe18.m_flow_start, n = n, pin_start = Pipe.pipe18.pin_start, pout_start = Pipe.pipe18.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe18.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={80,20},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe19(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe19.Di, L = Pipe.pipe19.L, Tin_start = Pipe.pipe19.Tin_start, Tout_start = Pipe.pipe19.Tout_start, X_start = X_start, hin_start = Pipe.pipe19.hin_start, k = Pipe.pipe19.k, kc = 1, m_flow_start = Pipe.pipe19.m_flow_start, n = n, pin_start = Pipe.pipe19.pin_start, pout_start = Pipe.pipe19.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe19.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe20(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe20.Di, L = Pipe.pipe20.L, Tin_start = Pipe.pipe20.Tin_start, Tout_start = Pipe.pipe20.Tout_start, X_start = X_start, hin_start = Pipe.pipe20.hin_start, k = Pipe.pipe20.k, kc = 1, m_flow_start = Pipe.pipe20.m_flow_start, n = n, pin_start = Pipe.pipe20.pin_start, pout_start = Pipe.pipe20.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe20.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-44, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV pipe21(redeclare
      model                                                                         Medium = Medium, Di = Pipe.pipe21.Di, L = Pipe.pipe21.L, Tin_start = Pipe.pipe21.Tin_start, Tout_start = Pipe.pipe21.Tout_start, X_start = X_start, hin_start = Pipe.pipe21.hin_start, k = Pipe.pipe21.k, kc = 1, m_flow_start = Pipe.pipe21.m_flow_start, n = n, pin_start = Pipe.pipe21.pin_start, pout_start = Pipe.pipe21.pout_start, momentum = momentum,
    quasiStatic=quasiStatic, hctype = hctype,
    pin_nom=p_nom,
    rho_nom=Pipe.pipe21.rho_nom,
    kappa=kappa, constantFrictionFactor=constantFrictionFactor)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user4(redeclare
      model                                                                        Medium =
        MediumUsers,
    p0=Pipe.pipe3.pout_start,                                                                       X0 = X_start,
    m_flow0=0.045489,
    massflowratedemand=[0,0.045489; 3600,0.045489],                                                                                                                                                                                                      useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {30, 40}, extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user5(redeclare
      model                                                                        Medium =
        MediumUsers,
    p0=Pipe.pipe4.pout_start,                                                                       X0 = X_start,
    m_flow0=0.0356,
    massflowratedemand=[0,0.0356; 3600,0.0356],                                                                                                                                                                                                 useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation=180)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user10(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe10.pout_start,                                                                       X0 = X_start,
    m_flow0=0.041533,
    massflowratedemand=[0,0.041533; 3600,0.041533],                                                                                                                                                                                                   useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user11(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe14.pout_start,                                                                       X0 = X_start,
    m_flow0=0.009889,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user12(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe15.pout_start,                                                                       X0 = X_start,
    m_flow0=0.014833,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={130,-40},    extent={{-10,10},{10,-10}},      rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user13(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe16.pout_start,                                                                       X0 = X_start,
    m_flow0=0.006922,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={130,-80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user14(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe17.pout_start,                                                                       X0 = X_start,
    m_flow0=0.008900,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user15(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe18.pout_start,                                                                       X0 = X_start,
    m_flow0=0.017800,                                                                                                                                                                                                        useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin={80,40},    extent = {{-10, -10}, {10, 10}}, rotation=180)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user16(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe19.pout_start,                                                                       X0 = X_start,
    m_flow0=0.012856,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser user17(redeclare
      model                                                                         Medium =
        MediumUsers,
    p0=Pipe.pipe20.pout_start,                                                                       X0 = X_start,
    m_flow0=0.010878,                                                                                                                     useEnergyDemand = useEnergyDemand) annotation (
    Placement(visible = true, transformation(origin = {-70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP1(redeclare
      model                                                                       Medium =
        MediumUsers,
    T0=288.15,                                                                                                            X0 = X_start,
    p0=150000,
    R=1e-3)                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-20,96},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP18(redeclare
      model                                                                        Medium =
        MediumUsers,
    T0=288.15,                                                                                                             X0 = X_start,
    p0=150000,
    R=1e-3)                                                                                                                                          annotation (
    Placement(visible = true, transformation(origin={-132,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow sourceH2_A(redeclare
      model                                                                         Medium =
        Hydrogen, G = 1e-8, T0 = 15 + 273.15, X0 = X_start_H2, computeEnthalpyWithFixedPressure = true, m_flow0 = m_flow_H2_ref, p0 = 1.5e5, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin={-104,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow_H2(duration = 50, height = m_flow_H2_ref, offset = 0, startTime = 50) annotation (
    Placement(visible = true, transformation(origin={-135,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable H2_Production(table=H2Production)
    annotation (Placement(visible = true, transformation(origin={35,0},    extent = {{-180, -70}, {-160, -50}}, rotation = 0)));

  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O(redeclare
      model                                                                                     Medium = Medium,
    p_start=Pipe.pipe8.pin_start,
    T_start=Pipe.pipe8.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{-74,-4},{-66,4}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O1(
    redeclare model Medium = Medium,
    p_start=Pipe.pipe9.pin_start,
    T_start=Pipe.pipe9.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{26,-4},{34,4}})));
  MultiEnergySystem.H2GasFacility.Components.Manifold.Manifold2I2O manifold2I2O2(
    redeclare model Medium = Medium,
    p_start=Pipe.pipe2.pin_start,
    T_start=Pipe.pipe2.Tin_start,
    X_start=X_start)                                                                                             annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={-20,40})));
protected
  function residentialDemand_mfr
    input Types.MassFlowRate m_flow_max;
    output Real[14,2] demand;
  algorithm
    demand := [0, m_flow_max*0.9; 1*3600, m_flow_max*0.9; 2*3600, m_flow_max*0.4; 3*3600, m_flow_max*0.4; 4*3600, m_flow_max*0.8; 6*3600, m_flow_max*0.8; 7*3600, m_flow_max*0.4; 9*3600, m_flow_max*0.4; 10*3600, m_flow_max*1; 13*3600, m_flow_max*1; 15*3600, m_flow_max*0.1; 21*3600, m_flow_max*0.1; 22*3600, m_flow_max*0.9; 24*3600, m_flow_max*0.9];
    annotation (
      Inline = true);
  end residentialDemand_mfr;

  function industrialDemand_mfr
    input Types.MassFlowRate m_flow_max;
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
<p><img src=\"modelica://MultiEnergySystem/../../../Lavoro/3. ReteGas/Figures/MediumPressureNaturalGasGridLayout_Cheli.PNG\"/></p>
</html>"));
end PaperCaseI;
