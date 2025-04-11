within MultiEnergySystem.TestFacility.DHTF.Systems.Distribution;
partial model CentralPlantBaseII "Base Case considering rack CD and the pipelines connecting to the loads"
  //Fluids
  replaceable model MediumCP =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingcp                          constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  //Constants
  constant Real pi = Modelica.Constants.pi;
  //General parameters of pipesù
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "friction factor for pipes";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Types.Temperature T_start_cold = T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_hot = T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start = 15 + 273.15;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_total = 2.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
  parameter Real rL2L3cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL3L4cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL5L6cold_mflow_start(unit = "m3/h") = 1;
  parameter Real rL6L7cold_mflow_start(unit = "m3/h") = 1;
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_UsersValve = 50000;
  // Rack CD
  parameter DistrictHeatingNetwork.Types.Length t_rCD = 2e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rCD = 72e-3;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD = p_VE901;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD = 1.60e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD_cold = 1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD_cold = 1.60e5;
  // Cold Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C1 = 10.8;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_C1 = -0.3 + 1.3;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C2 = 2.85;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C3 = 0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C4 = 0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C5 = 0.65;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C6 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C7 = 1.2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C8 = 1.0;
  // Hot Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H1 = 1;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H2 = 0.6;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H3 = 2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H4 = 1.37;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H5 = 1.4;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H6 = 1.25;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H7 = 15;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_H7 = 1.8 - 0.3 - 2.2;
  // Cold Side L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_C = 4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_C = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_C = 1.8;
  parameter DistrictHeatingNetwork.Types.Length t_rL_C = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_C = 51e-3;
  // Hot side Rack L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_H = 4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_H = 3;
  parameter DistrictHeatingNetwork.Types.Length h_rL3L4_FCVC01_H = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_H = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_H = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_H = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_H = 1.8;
  parameter DistrictHeatingNetwork.Types.Length h_rL6L7_FCVC02_H = 1.4;
  parameter DistrictHeatingNetwork.Types.Length t_rL_H = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_H = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length L_v = 1;
  parameter DistrictHeatingNetwork.Types.Length L_RL2L3 = 4.53;
  parameter DistrictHeatingNetwork.Types.Length L_RL3L4 = 3.02;
  parameter DistrictHeatingNetwork.Types.Length L_RL4L5 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL5L6 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL6L7 = 3;
  parameter Real q_m3h_rackCold(unit = "m3/h") = q_m3h_S9;
  parameter Real q_m3h_rackHot(unit = "m3/h") = q_m3h_S9;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = 4.04;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start = 3e5;
  // System S900
  parameter DistrictHeatingNetwork.Types.Pressure p_VE901 = 2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = p_VE901;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = 2.7e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_P901 = 2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_P901 = 3.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9 = 17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9 = 17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S9 = 10;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL1 = 0.82;
  //parameter DistrictHeatingNetwork.Types.Length L_S9_PL2=2.3;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL2 = 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_S9_PL2 = 0.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL3 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL4 = 0.65;
  parameter DistrictHeatingNetwork.Types.Length Di_S9 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S9 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9 = 4.04;
  parameter Real q_m3h_S9(unit = "m3/h") = 14;
  // Cooling System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users = 3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users = 2.5e5;
  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;
  // Valves Nominal Data
  parameter Real Kv_FCVC01(unit = "m3/h") = 30.55;
  parameter Real Kv_FCVC02(unit = "m3/h") = 30.55;
  parameter Boolean FV933_state = true;
  parameter Real FCV901theta[:, :] = [0, 1];
  parameter Real FCVC01theta[:, :] = [0, 1];
  parameter Real FCVC02theta[:, :] = [0, 1];
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot "opening characteristic";
  //Pumps
  parameter Real P901omega[:, :] = [0, 2*3.141592654*40];
  parameter Real P901qm3h[:, :] = [0, 12];
  parameter Real pumpcorrectionfactor = 1;
  parameter Real b[3] = {23.6, 0.62, -0.0435} "Head Characteristic coefficients";
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(redeclare
      model                                                                                                  Medium = MediumCP, Kv = 33, dp_nom = 50000, Tin_start = T_start, pin_start = pin_start) annotation (
    Placement(visible = true, transformation(origin = {-218, 45}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(redeclare
      model                                                                                              Medium = MediumCP, Kv = TestFacility.Data.ValveData.FCVC02.Kv, openingChar=TestFacility.Data.ValveData.FCVC02.openingChar, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot, pin_start=200000,                                                                                                                                                                                                        q_m3h_start = q_m3h_rackHot) annotation (
    Placement(transformation(extent={{10,10},{-10,-10}},      rotation = -90, origin={690,221})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(redeclare
      model                                                                                              Medium = MediumCP, Kv = TestFacility.Data.ValveData.FCVC01.Kv, openingChar=TestFacility.Data.ValveData.FCVC01.openingChar, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = 60 + 273.15, pin_start=200000)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{5,5},{-5,-5}},          rotation = -90, origin={249,223})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S100_S400(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H1, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of gas boiler and the outlet of electric boiler" annotation (
    Placement(transformation(extent = {{-10.25, 10.25}, {10.25, -10.25}}, rotation = 180, origin = {-267.75, 44.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S400_S300(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H2, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of the electric boiler and the outlet of heat pump HP301" annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-348, 45})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S300_S500(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H3, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-428, 45})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S500_SXXX(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H4, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-510, 45})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SXXX_SYYY(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H5, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-588, 45})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SYYY_S200(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H6, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system" annotation (
    Placement(transformation(extent = {{-10, 10.25}, {10, -10.25}}, rotation = 180, origin = {-668, 44.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rCD_H7, h = h_rCD_H7, t = t_rCD, pin_start = pin_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, q_m3h_start = q_m3h_S9, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system" annotation (
    Placement(transformation(extent = {{-10, 10.25}, {10, -10.25}}, rotation = 180, origin = {-737, 44.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S400_S100(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C7, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S400 and S100 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-337.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S400(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C6, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-419.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S300(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C5, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-459.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S300(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C4, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-517.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S500(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C3, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-557.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S200_S500(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C2, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S200 and S500 cold side" annotation (
    Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-657.25, 5.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rCD_C1, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S200 and S500 cold side" annotation (
    Placement(transformation(extent={{10.75,10.75},{-10.75,-10.75}},      rotation = 180, origin={-727.25,4.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(redeclare
      model                                                                                                 Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pin_start_Users + 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-50, 205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(redeclare
      model                                                                                                   Medium = MediumCP, L = L_rL3L4_FCVC01_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {190, 205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(redeclare
      model                                                                                                     Medium = MediumCP, L = L_rL4L5_rL5L6_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin={430,205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(redeclare
      model                                                                                                   Medium = MediumCP, L = L_rL6L7_FCVC02_H, h = h_rL6L7_FCVC02_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {650, 205})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(redeclare
      model                                                                                                  Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pout_start_Users - 0.03e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
    Placement(transformation(extent={{11,-11},{-11,11}},      rotation = 0, origin={-71,241})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rL3L4_FCVC01_C, t = t_rL_C, pin_start = pout_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={210,241})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(redeclare
      model                                                                                                      Medium = MediumCP, L = L_rL4L5_rL5L6_C, t = t_rL_C, pin_start = pout_start_Users, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={450,241})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(redeclare
      model                                                                                                    Medium = MediumCP, L = L_rL6L7_FCVC02_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={656,241})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12(redeclare
      model                                                                                  Medium = MediumCP, T_start = T_start_hot) "Flow sensor at the inlet of valve FCVC02" annotation (
    Placement(transformation(extent = {{666, 207}, {674, 199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA20 "Pressure sensor at the inlet of valve FCVC02" annotation (
    Placement(transformation(extent = {{677, 207}, {685, 199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA19 "Pressure sensor at the outlet of valve FCVC02" annotation (
    Placement(transformation(extent={{680,245},{688,253}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA08 "Pressure sensor at the inlet of valve FCVC01" annotation (
    Placement(transformation(extent = {{220, 207}, {228, 199}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA07 "Pressure sensor at the outlet of valve FCVC01" annotation (
    Placement(transformation(extent={{230,237},{238,245}})));
  TestFacility.DHTF.Subsystems.Distribution.CirculationPump S900(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    pumpcorrectionfactor=pumpcorrectionfactor,
    Kv=Kv,
    openingChar=openingChar,
    cf=cf,
    b=b) "Pumping Circulation System"
    annotation (Placement(transformation(extent={{-840,72},{-738,174}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL3L4(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot*3/4,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_rL2L3_rL3L4_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_rL2L3_rL3L4_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{64,178},{154,268}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junctionHotFCVC01 annotation (Placement(transformation(extent={{244,210},{254,200}})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junctionColdFCVC01 annotation (Placement(transformation(extent={{254,236},{244,246}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL4L5(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot/2,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_FCVC01_rL4L5_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_FCVC01_rL4L5_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{302,178},{392,268}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL6L7(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot/4,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_rL5L6_rL6L7_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_rL5L6_rL6L7_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{506,178},{596,268}})));
equation
  connect(rackCD_Hot_S400_S300.outlet, rackCD_Hot_S300_S500.inlet) annotation (
    Line(points = {{-358, 45}, {-418, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Hot_S300_S500.outlet, rackCD_Hot_S500_SXXX.inlet) annotation (
    Line(points = {{-438, 45}, {-500, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Hot_S500_SXXX.outlet, rackCD_Hot_SXXX_SYYY.inlet) annotation (
    Line(points = {{-520, 45}, {-578, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Hot_SXXX_SYYY.outlet, rackCD_Hot_SYYY_S200.inlet) annotation (
    Line(points = {{-598, 45}, {-627.5, 45}, {-627.5, 44.75}, {-658, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Hot_S100_S400.outlet, rackCD_Hot_S400_S300.inlet) annotation (
    Line(points = {{-278, 44.75}, {-308, 44.75}, {-308, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S400_S100.inlet, rackCD_Cold_S300_S400.outlet) annotation (
    Line(points = {{-348, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Hot_SYYY_S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (
    Line(points = {{-678, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S900_S200.outlet, rackCD_Cold_S200_S500.inlet) annotation (
    Line(points={{-716.5,4.75},{-692,4.75},{-692,5.25},{-668,5.25}},
                                                  color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S200_S500.outlet, rackCD_Cold_S500_S500.inlet) annotation (
    Line(points = {{-646.5, 5.25}, {-568, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S500_S500.outlet, rackCD_Cold_S500_S300.inlet) annotation (
    Line(points = {{-546.5, 5.25}, {-528, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S500_S300.outlet, rackCD_Cold_S300_S300.inlet) annotation (
    Line(points = {{-506.5, 5.25}, {-470, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S300_S300.outlet, rackCD_Cold_S300_S400.inlet) annotation (
    Line(points = {{-448.5, 5.25}, {-430, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (
    Line(points = {{660, 205}, {666, 205}, {666, 204.6}, {667.6, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FTA12.outlet, PTA20.inlet) annotation (
    Line(points = {{672.4, 204.6}, {681, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackL3L4_FCVC01_hot.outlet, PTA08.inlet) annotation (
    Line(points = {{200, 205}, {212, 205}, {212, 204.6}, {224, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
  connect(FV933.outlet, rackCD_Hot_S100_S400.inlet) annotation (
    Line(points = {{-223, 45}, {-237.75, 45}, {-237.75, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
  connect(rackCD_Cold_S400_S100.outlet, FV933.inlet) annotation (
    Line(points = {{-326.5, 5.25}, {-200, 5.25}, {-200, 45}, {-213, 45}}, color = {140, 56, 54}, thickness = 0.5));
  connect(S900_rackL2L3_cold.outlet, S900.inletcold) annotation (Line(
      points={{-82,241},{-808.89,241},{-808.89,181.65}},
      color={140,56,54},
      thickness=0.5));
  connect(S900_rackL3L4_hot.inlet, S900.outlethot) annotation (Line(
      points={{-60,205},{-416,205},{-416,206},{-769.11,206},{-769.11,181.65}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Hot_S200_S900.outlet, S900.inlethot) annotation (Line(
      points={{-747,44.75},{-769.11,44.75},{-769.11,64.35}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S900_S200.inlet, S900.outletcold) annotation (Line(
      points={{-738,4.75},{-774,4.75},{-774,6},{-808.89,6},{-808.89,64.35}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_hot.inlet, rackL3L4.outletHot) annotation (Line(
      points={{180,205},{160.3,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4.inletHot, S900_rackL3L4_hot.outlet) annotation (Line(
      points={{57.7,205},{-40,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4.outletCold, S900_rackL2L3_cold.inlet) annotation (Line(
      points={{57.7,241},{-60,241}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionHotFCVC01.inoutlet, FCVC01.inlet) annotation (Line(
      points={{249,210},{249,218}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionHotFCVC01.inlet, PTA08.inlet) annotation (Line(
      points={{244,205},{235,205},{235,204.6},{224,204.6}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionColdFCVC01.inoutlet, FCVC01.outlet) annotation (Line(
      points={{249,236},{249,228}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA07.inlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{234,239.4},{234,241},{220,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.inletHot, junctionHotFCVC01.outlet) annotation (Line(
      points={{295.7,205},{254,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_hot.inlet, rackL4L5.outletHot) annotation (Line(
      points={{420,205},{398.3,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.outletCold, junctionColdFCVC01.inlet) annotation (Line(
      points={{295.7,241},{254,241}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionColdFCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{244,241},{240,241},{240,240},{236,240},{236,241},{220,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.outlet, rackL4L5.inletCold) annotation (Line(
      points={{440,241},{398.3,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_cold.outlet, rackL3L4.inletCold) annotation (Line(
      points={{200,241},{160.3,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_hot.outlet, rackL6L7.inletHot) annotation (Line(
      points={{440,205},{499.7,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.inlet, rackL6L7.outletCold) annotation (Line(
      points={{460,241},{499.7,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_hot.inlet, rackL6L7.outletHot) annotation (Line(
      points={{640,205},{602.3,205}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.outlet, rackL6L7.inletCold) annotation (Line(
      points={{646,241},{602.3,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (Line(
      points={{666,241},{678,241},{678,242},{690,242},{690,231}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA20.inlet, FCVC02.inlet) annotation (Line(
      points={{681,204.6},{690,204.6},{690,211}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA19.inlet, FCVC02.outlet) annotation (Line(
      points={{684,247.4},{684,242},{690,242},{690,231}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent = {{-900, -500}, {900, 320}}), graphics={                                                                                                                                                                                                    Text(extent = {{-590, 105}, {-460, 67}}, textColor = {28, 108, 200}, textString = "Rack C/D")}),
    Icon(coordinateSystem(grid = {0.5, 0.5})),
    experiment(StopTime = 500, __Dymola_Algorithm = "Dassl"));
end CentralPlantBaseII;
