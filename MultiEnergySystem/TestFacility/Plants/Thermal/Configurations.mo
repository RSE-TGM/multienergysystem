within MultiEnergySystem.TestFacility.Plants.Thermal;
package Configurations "Different possible configurations of the heat generating part of the network"
  extends Modelica.Icons.VariantsPackage;

  package BaseClass "Package with different base models for the possible configurations"
    extends Modelica.Icons.BasesPackage;

    partial model CentralPlantBase "Base Case considering rack CD and the pipelines connecting to the loads"
      //Fluids
      replaceable model MediumCP = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      //Constants
      parameter Real pi = Modelica.Constants.pi;
      //General parameters of pipes
      parameter Integer n = 2 "Number of volumes in each pipe";
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
      //Pumps
      parameter Real P901omega[:, :] = [0, 2*3.141592654*40];
      parameter Real P901qm3h[:, :] = [0, 12];
      DistrictHeatingNetwork.Sources.SourcePressure VE901(redeclare model Medium = MediumCP, p0 = p_VE901, T0(displayUnit = "K") = 30 + 273.15) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-849, 131})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(redeclare model Medium = MediumCP, Tin_start = DistrictHeatingNetwork.Data.PumpData.P901.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P901.Tout_start, hin_start = DistrictHeatingNetwork.Data.PumpData.P901.hin_start, pin_start = pin_start_S9, pout_start = pout_start_S9, a = DistrictHeatingNetwork.Data.PumpData.P901.a, b = DistrictHeatingNetwork.Data.PumpData.P901.b, dpnom = DistrictHeatingNetwork.Data.PumpData.P901.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P901.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P901.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P901.etanom, headnom = DistrictHeatingNetwork.Data.PumpData.P901.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P901.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P901.headnommin, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P901.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P901.omeganom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P901.qnom_inm3h, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P901.qnommin_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P901.rhonom, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P901.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(visible = true, transformation(extent = {{-20.5, 20.5}, {20.5, -20.5}}, rotation = 90, origin = {-757.5, 74.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901(redeclare model Medium = MediumCP, T_start = Tout_start_S9, p_start = pout_start_S9) annotation (
        Placement(transformation(extent = {{-5, 5}, {5, -5}}, rotation = 90, origin = {-755, 166})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT902 "Pressure sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-5, 5}, {5, -5}}, rotation = 90, origin = {-755, 181.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT902(redeclare model Medium = MediumCP, T_start = Tout_start_S9, p_start = pout_start_S9) "Temperature sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-4.75, 4.75}, {4.75, -4.75}}, rotation = 90, origin = {-754.75, 196.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(redeclare model Medium = MediumCP, L = L_S9_PL3, t = t_S9, pin_start = pout_start_S9, Tin_start = Tout_start_S9, Tout_start = Tout_start_S9, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(origin={-757,112},    extent = {{-10, 10}, {10, -10}}, rotation = 90)));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT901(redeclare model Medium = MediumCP, T_start = Tin_start_S9, p_start = pin_start_S9) "Temperature sensor at the inlet of pump 901" annotation (
        Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-809.75, 200.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901 "Pressure sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-810, 162.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(redeclare model Medium = MediumCP, L = L_S9_PL2, h = h_S9_PL2, t = t_S9, pin_start = pin_start_S9, Tin_start = Tin_start_S9, Tout_start = Tin_start_S9, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-808, 101})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV901(redeclare model Medium = MediumCP, Kv = DistrictHeatingNetwork.Data.ValveData.FCV901.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV901.dp_nom,
        openingChar=DistrictHeatingNetwork.Data.ValveData.FCV901.openingChar,                                                                                                                                                                                                        rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV901.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV901.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S9, pin_start = pout_start_S9, q_m3h_start = q_m3h_S9) annotation (
        Placement(transformation(origin={-757.5,140.5},extent={{-9.5,9.5},{9.5,-9.5}},  rotation = 90)));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(redeclare model Medium = MediumCP, Kv = 33, dp_nom = 50000, Tin_start = T_start, pin_start = pin_start) annotation (
        Placement(visible = true, transformation(origin = {-218, 45}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(redeclare model Medium = MediumCP, Kv = DistrictHeatingNetwork.Data.ValveData.FCVC02.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot, pin_start = 200000, q_m3h_start = q_m3h_rackHot) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {690, 235})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(redeclare model Medium = MediumCP, Kv = DistrictHeatingNetwork.Data.ValveData.FCVC01.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = 60 + 273.15, pin_start = 200000) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {250, 235})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S100_S400(redeclare model Medium = MediumCP, L = L_rCD_H1, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of gas boiler and the outlet of electric boiler" annotation (
        Placement(transformation(extent = {{-10.25, 10.25}, {10.25, -10.25}}, rotation = 180, origin = {-267.75, 44.75})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S400_S300(redeclare model Medium = MediumCP, L = L_rCD_H2, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of the electric boiler and the outlet of heat pump HP301" annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-348, 45})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S300_S500(redeclare model Medium = MediumCP, L = L_rCD_H3, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-428, 45})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S500_SXXX(redeclare model Medium = MediumCP, L = L_rCD_H4, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-510, 45})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SXXX_SYYY(redeclare model Medium = MediumCP, L = L_rCD_H5, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of heat pump HP301 and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 180, origin = {-588, 45})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_SYYY_S200(redeclare model Medium = MediumCP, L = L_rCD_H6, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD, pout_start = pout_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10.25}, {10, -10.25}}, rotation = 180, origin = {-668, 44.75})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(redeclare model Medium = MediumCP, L = L_rCD_H7, h = h_rCD_H7, t = t_rCD, pin_start = pin_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, q_m3h_start = q_m3h_S9, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10.25}, {10, -10.25}}, rotation = 180, origin = {-737, 44.75})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S400_S100(redeclare model Medium = MediumCP, L = L_rCD_C7, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S400 and S100 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-337.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S400(redeclare model Medium = MediumCP, L = L_rCD_C6, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-419.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S300_S300(redeclare model Medium = MediumCP, L = L_rCD_C5, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-459.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S300(redeclare model Medium = MediumCP, L = L_rCD_C4, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-517.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S500_S500(redeclare model Medium = MediumCP, L = L_rCD_C3, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S300 and S400 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-557.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S200_S500(redeclare model Medium = MediumCP, L = L_rCD_C2, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S200 and S500 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-657.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(redeclare model Medium = MediumCP, L = L_rCD_C1, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S200 and S500 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-727.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(redeclare model Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pin_start_Users + 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-50, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_hot(redeclare model Medium = MediumCP, L = L_rL2L3_rL3L4_H, t = t_rL_H, pin_start = pin_start_Users, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {70, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(redeclare model Medium = MediumCP, L = L_rL3L4_FCVC01_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {190, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_hot(redeclare model Medium = MediumCP, L = L_FCVC01_rL4L5_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {290, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(redeclare model Medium = MediumCP, L = L_rL4L5_rL5L6_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {410, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_hot(redeclare model Medium = MediumCP, L = L_rL5L6_rL6L7_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {530, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(redeclare model Medium = MediumCP, L = L_rL6L7_FCVC02_H, h = h_rL6L7_FCVC02_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {650, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(redeclare model Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pout_start_Users - 0.03e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-20, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_cold(redeclare model Medium = MediumCP, L = L_rL2L3_rL3L4_C, t = t_rL_C, pin_start = pout_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {100, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(redeclare model Medium = MediumCP, L = L_rL3L4_FCVC01_C, t = t_rL_C, pin_start = pout_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {220, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_cold(redeclare model Medium = MediumCP, L = L_FCVC01_rL4L5_C, t = t_rL_C, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {320, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(redeclare model Medium = MediumCP, L = L_rL4L5_rL5L6_C, t = t_rL_C, pin_start = pout_start_Users, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {440, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_cold(redeclare model Medium = MediumCP, L = L_rL5L6_rL6L7_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {560, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(redeclare model Medium = MediumCP, L = L_rL6L7_FCVC02_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {660, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12(redeclare model Medium = MediumCP, T_start = T_start_hot) "Flow sensor at the inlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{666, 207}, {674, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA20 "Pressure sensor at the inlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{677, 207}, {685, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA19 "Pressure sensor at the outlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{678, 263}, {686, 271}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA08 "Pressure sensor at the inlet of valve FCVC01" annotation (
        Placement(transformation(extent = {{220, 207}, {228, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA07 "Pressure sensor at the outlet of valve FCVC01" annotation (
        Placement(transformation(extent = {{234, 263}, {242, 271}})));
    equation
      connect(rackL3L4_FCVC01_cold.outlet, rackL2L3_rackL3L4_cold.inlet) annotation (
        Line(points = {{210, 265}, {110, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL2L3_rackL3L4_hot.outlet, rackL3L4_FCVC01_hot.inlet) annotation (
        Line(points = {{80, 205}, {180, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(S900_rackL3L4_hot.outlet, rackL2L3_rackL3L4_hot.inlet) annotation (
        Line(points = {{-40, 205}, {60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT901.outlet, PT902.inlet) annotation (
        Line(points = {{-757, 169}, {-757, 181.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT902.inlet, TT902.inlet) annotation (
        Line(points = {{-757, 181.5}, {-757, 194.875}, {-756.65, 194.875}, {-756.65, 196.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S901.inlet, PT901.inlet) annotation (
        Line(points = {{-808, 111}, {-808, 162.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT901.inlet, TT901.inlet) annotation (
        Line(points = {{-808, 162.5}, {-808, 167.375}, {-807.85, 167.375}, {-807.85, 200.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT902.inlet, S900_rackL3L4_hot.inlet) annotation (
        Line(points = {{-756.65, 196.25}, {-756.65, 205}, {-60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT901.inlet, S900_rackL2L3_cold.outlet) annotation (
        Line(points = {{-807.85, 200.25}, {-807.85, 265}, {-30, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
        Line(points = {{250, 245}, {250, 265}, {230, 265}}, color = {140, 56, 54}, thickness = 0.5));
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
      connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (
        Line(points = {{-747, 44.75}, {-757.5, 44.75}, {-757.5, 58.1}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S901.outlet, rackCD_Cold_S900_S200.inlet) annotation (
        Line(points = {{-808, 91}, {-808, 5.25}, {-738, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S900_S200.outlet, rackCD_Cold_S200_S500.inlet) annotation (
        Line(points = {{-716.5, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S200_S500.outlet, rackCD_Cold_S500_S500.inlet) annotation (
        Line(points = {{-646.5, 5.25}, {-568, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S500_S500.outlet, rackCD_Cold_S500_S300.inlet) annotation (
        Line(points = {{-546.5, 5.25}, {-528, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S500_S300.outlet, rackCD_Cold_S300_S300.inlet) annotation (
        Line(points = {{-506.5, 5.25}, {-470, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S300_S300.outlet, rackCD_Cold_S300_S400.inlet) annotation (
        Line(points = {{-448.5, 5.25}, {-430, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL3L4_FCVC01_hot.outlet, FCVC01_rackL4L5_hot.inlet) annotation (
        Line(points = {{200, 205}, {280, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01_rackL4L5_hot.outlet, rackL4L5_rackL5L6_hot.inlet) annotation (
        Line(points = {{300, 205}, {400, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.inlet, FCVC01_rackL4L5_hot.inlet) annotation (
        Line(points = {{250, 225}, {250, 205}, {280, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_hot.outlet, rackL5L6_rackL6L7_hot.inlet) annotation (
        Line(points = {{420, 205}, {520, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL5L6_rackL6L7_hot.outlet, rackL6L7_FCVC02_hot.inlet) annotation (
        Line(points = {{540, 205}, {640, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (
        Line(points = {{660, 205}, {666, 205}, {666, 204.6}, {667.6, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (
        Line(points = {{670, 265}, {690, 265}, {690, 245}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PTA19.inlet, rackL6L7_FCVC02_cold.inlet) annotation (
        Line(points = {{682, 265.4}, {675, 265.4}, {675, 265}, {670, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_cold.inlet, rackL5L6_rackL6L7_cold.outlet) annotation (
        Line(points = {{450, 265}, {550, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL5L6_rackL6L7_cold.inlet, rackL6L7_FCVC02_cold.outlet) annotation (
        Line(points = {{570, 265}, {650, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_cold.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
        Line(points = {{430, 265}, {330, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FTA12.outlet, FCVC02.inlet) annotation (
        Line(points = {{672.4, 204.6}, {690, 204.6}, {690, 225}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FTA12.outlet, PTA20.inlet) annotation (
        Line(points = {{672.4, 204.6}, {681, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL3L4_FCVC01_hot.outlet, PTA08.inlet) annotation (
        Line(points = {{200, 205}, {212, 205}, {212, 204.6}, {224, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.outlet, PTA07.inlet) annotation (
        Line(points = {{250, 245}, {250, 265}, {238, 265.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01_rackL4L5_cold.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
        Line(points = {{310, 265}, {230, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(S900_rackL2L3_cold.inlet, rackL2L3_rackL3L4_cold.outlet) annotation (
        Line(points = {{-10, 265}, {90, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(VE901.outlet, PT901.inlet) annotation (
        Line(points = {{-839, 131}, {-808, 131}, {-808, 162.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV933.outlet, rackCD_Hot_S100_S400.inlet) annotation (
        Line(points = {{-223, 45}, {-237.75, 45}, {-237.75, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S400_S100.outlet, FV933.inlet) annotation (
        Line(points = {{-326.5, 5.25}, {-200, 5.25}, {-200, 45}, {-213, 45}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV901.outlet, FT901.inlet) annotation (Line(
          points={{-757.5,150},{-757.5,156},{-757,156},{-757,163}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S901.outlet, FCV901.inlet) annotation (Line(
          points={{-757,122},{-757,131},{-757.5,131}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S901.inlet, P901.outlet) annotation (Line(
          points={{-757,102},{-757,96.45},{-757.5,96.45},{-757.5,90.9}},
          color={140,56,54},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(extent = {{-900, -500}, {900, 320}}), graphics={  Text(extent = {{-20, 217}, {40, 179}}, textColor = {28, 108, 200}, textString = "RackL2L3_hot"), Text(extent = {{10, 291}, {70, 251}}, textColor = {28, 108, 200}, textString = "RackL2L3_cold"), Text(extent = {{-590, 105}, {-460, 67}}, textColor = {28, 108, 200}, textString = "Rack C/D"), Text(extent = {{100, 217}, {160, 179}}, textColor = {28, 108, 200}, textString = "RackL3L4_hot"), Text(extent = {{320, 217}, {380, 179}}, textColor = {28, 108, 200}, textString = "RackL4L5_hot"), Text(extent = {{442, 217}, {502, 179}}, textColor = {28, 108, 200}, textString = "RackL5L6_hot"), Text(extent = {{558, 217}, {618, 179}}, textColor = {28, 108, 200}, textString = "RackL6L7_hot"), Text(extent = {{130, 291}, {190, 251}}, textColor = {28, 108, 200}, textString = "RackL3L4_cold"), Text(extent = {{350, 291}, {410, 251}}, textColor = {28, 108, 200}, textString = "RackL4L5_cold"), Text(extent = {{470, 291}, {530, 251}}, textColor = {28, 108, 200}, textString = "RackL5L6_cold")}),
        Icon(coordinateSystem(grid = {0.5, 0.5})),
        experiment(StopTime = 500, __Dymola_Algorithm = "Dassl"));
    end CentralPlantBase;

    partial model CentralPlantBaseSimplified "Base Case considering rack CD and the pipelines connecting to the loads"
      //Constants
      parameter Real pi = Modelica.Constants.pi;
      //General parameters of pipes
      parameter Integer n = 2 "Number of volumes in each pipe";
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
      //Pumps
      parameter Real P901omega[:, :] = [0, 2*3.141592654*40];
      parameter Real P901qm3h[:, :] = [0, 12];
      DistrictHeatingNetwork.Sources.SourcePressure VE901(p0 = p_VE901, T0(displayUnit = "K") = 30 + 273.15) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-849, 131})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(Tin_start = DistrictHeatingNetwork.Data.PumpData.P901.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P901.Tout_start, hin_start = DistrictHeatingNetwork.Data.PumpData.P901.hin_start, pin_start = pin_start_S9, pout_start = pout_start_S9, a = DistrictHeatingNetwork.Data.PumpData.P901.a, b = DistrictHeatingNetwork.Data.PumpData.P901.b, dpnom = DistrictHeatingNetwork.Data.PumpData.P901.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P901.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P901.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P901.etanom, headnom = DistrictHeatingNetwork.Data.PumpData.P901.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P901.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P901.headnommin, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P901.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P901.omeganom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P901.qnom_inm3h, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P901.qnommin_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P901.rhonom, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P901.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(visible = true, transformation(extent = {{-20.5, 20.5}, {20.5, -20.5}}, rotation = 90, origin = {-757.5, 74.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT901(T_start = Tout_start_S9, p_start = pout_start_S9) annotation (
        Placement(transformation(extent = {{-5, 5}, {5, -5}}, rotation = 90, origin = {-755, 166})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT902 "Pressure sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-5, 5}, {5, -5}}, rotation = 90, origin = {-755, 181.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT902(T_start = Tout_start_S9, p_start = pout_start_S9) "Temperature sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-4.75, 4.75}, {4.75, -4.75}}, rotation = 90, origin = {-754.75, 196.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S901(L = L_S9_PL3, t = t_S9, pin_start = pout_start_S9, Tin_start = Tout_start_S9, Tout_start = Tout_start_S9, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-757, 146})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT901(T_start = Tin_start_S9, p_start = pin_start_S9) "Temperature sensor at the inlet of pump 901" annotation (
        Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-809.75, 200.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901 "Pressure sensor at the outlet of pump 901" annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-810, 162.5})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S901(L = L_S9_PL2, h = h_S9_PL2, t = t_S9, pin_start = pin_start_S9, Tin_start = Tin_start_S9, Tout_start = Tin_start_S9, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-808, 101})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV901(Kv = DistrictHeatingNetwork.Data.ValveData.FCV901.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV901.dp_nom, openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV901.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV901.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S9, pin_start = pout_start_S9, q_m3h_start = q_m3h_S9) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-757, 115})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(Kv = 33, dp_nom = 50000, Tin_start = T_start, pin_start = pin_start) annotation (
        Placement(visible = true, transformation(origin = {-218, 45}, extent = {{-5, 5}, {5, -5}}, rotation = 180)));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(Kv = DistrictHeatingNetwork.Data.ValveData.FCVC02.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot, pin_start = 200000, q_m3h_start = q_m3h_rackHot) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {690, 235})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(Kv = DistrictHeatingNetwork.Data.ValveData.FCVC01.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = 60 + 273.15, pin_start = 200000) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {250, 235})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Hot_S200_S900(L = L_rCD_H7, h = h_rCD_H7, t = t_rCD, pin_start = pin_start_rCD, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di, q_m3h_start = q_m3h_S9, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the outlet of future heat storage and the outlet of hot side of CHP system" annotation (
        Placement(transformation(extent = {{-10, 10.25}, {10, -10.25}}, rotation = 180, origin = {-737, 44.75})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD_Cold_S900_S200(L = L_rCD_C1, h = 0, t = t_rCD, m_flow_start = m_flow_start, pin_start = pin_start_rCD_cold, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di, nPipes = 1, n = n, hctype = hctype) "Pipe connecting the system S200 and S500 cold side" annotation (
        Placement(transformation(extent = {{10.75, 10.25}, {-10.75, -10.25}}, rotation = 180, origin = {-727.25, 5.25})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(L = L_S9, t = t_S9, pin_start = pin_start_Users + 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-50, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_hot(L = L_rL2L3_rL3L4_H, t = t_rL_H, pin_start = pin_start_Users, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {70, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(L = L_rL3L4_FCVC01_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {190, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_hot(L = L_FCVC01_rL4L5_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {290, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(L = L_rL4L5_rL5L6_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {410, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_hot(L = L_rL5L6_rL6L7_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {530, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(L = L_rL6L7_FCVC02_H, h = h_rL6L7_FCVC02_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {650, 205})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(L = L_S9, t = t_S9, pin_start = pout_start_Users - 0.03e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-20, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL2L3_rackL3L4_cold(L = L_rL2L3_rL3L4_C, t = t_rL_C, pin_start = pout_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {100, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(L = L_rL3L4_FCVC01_C, t = t_rL_C, pin_start = pout_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {220, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV FCVC01_rackL4L5_cold(L = L_FCVC01_rL4L5_C, t = t_rL_C, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {320, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(L = L_rL4L5_rL5L6_C, t = t_rL_C, pin_start = pout_start_Users, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {440, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL5L6_rackL6L7_cold(L = L_rL5L6_rL6L7_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {560, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(L = L_rL6L7_FCVC02_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C, q_m3h_start = q_m3h_rackCold, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {660, 265})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12(T_start = T_start_hot) "Flow sensor at the inlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{666, 207}, {674, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA20 "Pressure sensor at the inlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{677, 207}, {685, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA19 "Pressure sensor at the outlet of valve FCVC02" annotation (
        Placement(transformation(extent = {{678, 263}, {686, 271}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA08 "Pressure sensor at the inlet of valve FCVC01" annotation (
        Placement(transformation(extent = {{220, 207}, {228, 199}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA07 "Pressure sensor at the outlet of valve FCVC01" annotation (
        Placement(transformation(extent = {{234, 263}, {242, 271}})));
    equation
      connect(rackL3L4_FCVC01_cold.outlet, rackL2L3_rackL3L4_cold.inlet) annotation (
        Line(points = {{210, 265}, {110, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL2L3_rackL3L4_hot.outlet, rackL3L4_FCVC01_hot.inlet) annotation (
        Line(points = {{80, 205}, {180, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(S900_rackL3L4_hot.outlet, rackL2L3_rackL3L4_hot.inlet) annotation (
        Line(points = {{-40, 205}, {60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT901.outlet, PT902.inlet) annotation (
        Line(points = {{-757, 169}, {-757, 181.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT902.inlet, TT902.inlet) annotation (
        Line(points = {{-757, 181.5}, {-757, 194.875}, {-756.65, 194.875}, {-756.65, 196.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT901.inlet, PL4_S901.outlet) annotation (
        Line(points = {{-757, 163}, {-757, 156}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S901.inlet, PT901.inlet) annotation (
        Line(points = {{-808, 111}, {-808, 162.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT901.inlet, TT901.inlet) annotation (
        Line(points = {{-808, 162.5}, {-808, 167.375}, {-807.85, 167.375}, {-807.85, 200.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV901.outlet, PL4_S901.inlet) annotation (
        Line(points = {{-757, 125}, {-757, 136}}, color = {140, 56, 54}, thickness = 0.5));
      connect(P901.outlet, FCV901.inlet) annotation (
        Line(points = {{-757.5, 90.9}, {-757.5, 98.15}, {-757, 98.15}, {-757, 105}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT902.inlet, S900_rackL3L4_hot.inlet) annotation (
        Line(points = {{-756.65, 196.25}, {-756.65, 205}, {-60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT901.inlet, S900_rackL2L3_cold.outlet) annotation (
        Line(points = {{-807.85, 200.25}, {-807.85, 265}, {-30, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
        Line(points = {{250, 245}, {250, 265}, {230, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Hot_S200_S900.outlet, P901.inlet) annotation (
        Line(points = {{-747, 44.75}, {-757.5, 44.75}, {-757.5, 58.1}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S901.outlet, rackCD_Cold_S900_S200.inlet) annotation (
        Line(points = {{-808, 91}, {-808, 5.25}, {-738, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL3L4_FCVC01_hot.outlet, FCVC01_rackL4L5_hot.inlet) annotation (
        Line(points = {{200, 205}, {280, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01_rackL4L5_hot.outlet, rackL4L5_rackL5L6_hot.inlet) annotation (
        Line(points = {{300, 205}, {400, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.inlet, FCVC01_rackL4L5_hot.inlet) annotation (
        Line(points = {{250, 225}, {250, 205}, {280, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_hot.outlet, rackL5L6_rackL6L7_hot.inlet) annotation (
        Line(points = {{420, 205}, {520, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL5L6_rackL6L7_hot.outlet, rackL6L7_FCVC02_hot.inlet) annotation (
        Line(points = {{540, 205}, {640, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (
        Line(points = {{660, 205}, {666, 205}, {666, 204.6}, {667.6, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (
        Line(points = {{670, 265}, {690, 265}, {690, 245}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PTA19.inlet, rackL6L7_FCVC02_cold.inlet) annotation (
        Line(points = {{682, 265.4}, {675, 265.4}, {675, 265}, {670, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_cold.inlet, rackL5L6_rackL6L7_cold.outlet) annotation (
        Line(points = {{450, 265}, {550, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL5L6_rackL6L7_cold.inlet, rackL6L7_FCVC02_cold.outlet) annotation (
        Line(points = {{570, 265}, {650, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL4L5_rackL5L6_cold.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
        Line(points = {{430, 265}, {330, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FTA12.outlet, FCVC02.inlet) annotation (
        Line(points = {{672.4, 204.6}, {690, 204.6}, {690, 225}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FTA12.outlet, PTA20.inlet) annotation (
        Line(points = {{672.4, 204.6}, {681, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackL3L4_FCVC01_hot.outlet, PTA08.inlet) annotation (
        Line(points = {{200, 205}, {212, 205}, {212, 204.6}, {224, 204.6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.outlet, PTA07.inlet) annotation (
        Line(points = {{250, 245}, {250, 265}, {238, 265.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01_rackL4L5_cold.outlet, rackL3L4_FCVC01_cold.inlet) annotation (
        Line(points = {{310, 265}, {230, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(S900_rackL2L3_cold.inlet, rackL2L3_rackL3L4_cold.outlet) annotation (
        Line(points = {{-10, 265}, {90, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(VE901.outlet, PT901.inlet) annotation (
        Line(points = {{-839, 131}, {-808, 131}, {-808, 162.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV933.outlet, rackCD_Hot_S200_S900.inlet) annotation (
        Line(points = {{-223, 45}, {-475, 45}, {-475, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(rackCD_Cold_S900_S200.outlet, FV933.inlet) annotation (
        Line(points = {{-716.5, 5.25}, {-200, 5.25}, {-200, 45}, {-213, 45}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Diagram(coordinateSystem(extent = {{-900, -500}, {900, 320}}), graphics={  Text(extent = {{-20, 217}, {40, 179}}, textColor = {28, 108, 200}, textString = "RackL2L3_hot"), Text(extent = {{10, 291}, {70, 251}}, textColor = {28, 108, 200}, textString = "RackL2L3_cold"), Text(extent = {{-590, 105}, {-460, 67}}, textColor = {28, 108, 200}, textString = "Rack C/D"), Text(extent = {{100, 217}, {160, 179}}, textColor = {28, 108, 200}, textString = "RackL3L4_hot"), Text(extent = {{320, 217}, {380, 179}}, textColor = {28, 108, 200}, textString = "RackL4L5_hot"), Text(extent = {{442, 217}, {502, 179}}, textColor = {28, 108, 200}, textString = "RackL5L6_hot"), Text(extent = {{558, 217}, {618, 179}}, textColor = {28, 108, 200}, textString = "RackL6L7_hot"), Text(extent = {{130, 291}, {190, 251}}, textColor = {28, 108, 200}, textString = "RackL3L4_cold"), Text(extent = {{350, 291}, {410, 251}}, textColor = {28, 108, 200}, textString = "RackL4L5_cold"), Text(extent = {{470, 291}, {530, 251}}, textColor = {28, 108, 200}, textString = "RackL5L6_cold")}),
        Icon(coordinateSystem(grid = {0.5, 0.5})),
        experiment(StopTime = 500, __Dymola_Algorithm = "Dassl"));
    end CentralPlantBaseSimplified;
  end BaseClass;

  package Centralised
    extends DistrictHeatingNetwork.Icons.Generic.Centralised;

    partial model CentralisedPlantI_A
      extends BaseClass.CentralPlantBase;
      // System S100
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S1 = 10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1 = 0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2 = 0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3 = 1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 3.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 3.5;
      parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
      parameter Real q_m3h_S1 = 9;
      parameter Real P101omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
      parameter Real FCV101theta[:, :] = [0, 1];
      parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P101(Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P101.a, b = DistrictHeatingNetwork.Data.PumpData.P101.b, m_flow_start = m_flow_total, dpnom = DistrictHeatingNetwork.Data.PumpData.P101.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P101.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P101.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P101.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P101.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P101.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P101.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P101.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P101.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h, use_q_m3hr = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-230, -239})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S1, pin_start = pout_start_S1, q_m3h_start = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-230, -204})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(L = L_S1_PL3, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-230, -294})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(L = L_S1_PL2, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-266, -296})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(L = L_S1_PL3, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-230, -170})));
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(Tin_start = Tin_start_S1, pin_start = pin_start_S1, pout_start = pout_start_S1, Tout_start = Tout_start_S1, HH = 55.5e6) annotation (
        Placement(visible = true, transformation(origin = {-247, -365}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(T_start = Tout_start_S1, p_start = pout_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-228, -136})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102 "Pressure sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-228, -148})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-268, -194})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(T_start = Tin_start_S1, p_start = pin_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-268, -158})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start = Tin_start_S1, p_start = pin_start_S1) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-269, -259})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(L = L_S1_PL1, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-266, -224})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(L = L_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-230, -104})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(L = L_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-266, -104})));
    equation
      connect(P101.inlet, PL3_S101.outlet) annotation (
        Line(points = {{-230, -248.6}, {-230, -284}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV101.inlet, P101.outlet) annotation (
        Line(points = {{-230, -214}, {-230, -229.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT102.inlet, PT102.inlet) annotation (
        Line(points = {{-230.4, -136}, {-230.4, -148}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL4_S101.inlet, FCV101.outlet) annotation (
        Line(points = {{-230, -180}, {-230, -194}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT102.inlet, PL4_S101.outlet) annotation (
        Line(points = {{-230.4, -148}, {-230.4, -157}, {-230, -157}, {-230, -160}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT101.outlet, PL2_S101.inlet) annotation (
        Line(points = {{-266.2, -263.2}, {-266.2, -265.6}, {-266, -265.6}, {-266, -286}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S101.outlet, FT101.inlet) annotation (
        Line(points = {{-266, -234}, {-266, -241.4}, {-266.2, -241.4}, {-266.2, -254.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S101.inlet, PT101.inlet) annotation (
        Line(points = {{-266, -214}, {-266, -194}, {-265.6, -194}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT101.inlet, TT101.inlet) annotation (
        Line(points = {{-265.6, -194}, {-265.6, -158}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (
        Line(points = {{-230, -114}, {-230, -136}, {-230.4, -136}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT101.inlet, PL_S100_rCD_cold.outlet) annotation (
        Line(points = {{-265.6, -158}, {-265.6, -153}, {-266, -153}, {-266, -114}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
        Line(points = {{-266, -94}, {-266, 5.25}, {-326.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S101.outlet, GB101.inlet) annotation (
        Line(points = {{-266, -306}, {-266, -318}, {-257.5, -318}, {-257.5, -337}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL3_S101.inlet, GB101.outlet) annotation (
        Line(points = {{-230, -304}, {-230, -318}, {-236.5, -318}, {-236.5, -337}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (
        Line(points = {{-230, -94}, {-232, -94}, {-232, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralisedPlantI_A;

    partial model CentralisedPlantI_B
      extends CentralisedPlantI_A;
      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
      parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
      parameter Real q_m3h_S4 = 5;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
      parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
      parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
      parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
        Placement(visible = true, transformation(origin = {-335, -365}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h, use_q_m3hr = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-316, -235})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-316, -200})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-316, -296})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-356, -298})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-316, -172})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-314, -134})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-314, -146})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-358, -178})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-358, -166})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-359, -255})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-356, -226})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-316, -112})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-356, -114})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-356, -80})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-316, -80})));
    equation
      connect(P401.inlet, PL3_S401.outlet) annotation (
        Line(points = {{-316, -244.6}, {-316, -286}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV401.inlet, P401.outlet) annotation (
        Line(points = {{-316, -210}, {-316, -225.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PT402.inlet) annotation (
        Line(points = {{-316.4, -134}, {-316.4, -146}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL4_S401.inlet, FCV401.outlet) annotation (
        Line(points = {{-316, -182}, {-316, -190}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT402.inlet, PL4_S401.outlet) annotation (
        Line(points = {{-316.4, -146}, {-316.4, -155}, {-316, -155}, {-316, -162}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT401.outlet, PL2_S401.inlet) annotation (
        Line(points = {{-356.2, -259.2}, {-356.2, -267.6}, {-356, -267.6}, {-356, -288}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.outlet, FT401.inlet) annotation (
        Line(points = {{-356, -236}, {-356, -243.4}, {-356.2, -243.4}, {-356.2, -250.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.inlet, PT401.inlet) annotation (
        Line(points = {{-356, -216}, {-356, -178}, {-355.6, -178}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT401.inlet, TT401.inlet) annotation (
        Line(points = {{-355.6, -178}, {-355.6, -166}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EB401.outlet, PL3_S401.inlet) annotation (
        Line(points = {{-324.5, -337}, {-324.5, -320}, {-316, -320}, {-316, -306}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
        Line(points = {{-316.4, -134}, {-316, -134}, {-316, -122}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
        Line(points = {{-355.6, -166}, {-356, -166}, {-356, -124}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
        Line(points = {{-356, -104}, {-356, -90}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
        Line(points = {{-316, -102}, {-316, -90}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (
        Line(points = {{-356, -308}, {-356, -322}, {-345.5, -322}, {-345.5, -337}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
        Line(points = {{-356, -70}, {-356, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
        Line(points = {{-316, -70}, {-316, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
    end CentralisedPlantI_B;
  end Centralised;
end Configurations;
