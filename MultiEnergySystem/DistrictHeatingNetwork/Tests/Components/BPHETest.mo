within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;
model BPHETest
  "Test that includes all 04 heat exchanger of the RSE DistrictHeatingNetwork at Nominal Conditions"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter Integer gammahotovercold_factor = 1;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;
  inner System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E301(Di_cold = BPHE.E301.Di_cold, Di_hot = BPHE.E301.Di_hot, L_cold = BPHE.E301.L_cold, L_hot = BPHE.E301.L_hot, MWall = BPHE.E301.MWall, Stot_cold = BPHE.E301.Stot_cold, Stot_hot = BPHE.E301.Stot_hot, Tin_start_cold = BPHE.E301.Tin_start_cold, Tin_start_hot = BPHE.E301.Tin_start_hot, Tout_start_cold = BPHE.E301.Tout_start_cold, Tout_start_hot = BPHE.E301.Tout_start_hot, cpm_cold = BPHE.E301.cpm_cold, cpm_hot = BPHE.E301.cpm_hot, t_cold = BPHE.E301.t_cold, t_hot = BPHE.E301.t_hot, gamma_nom_cold = BPHE.E301.gamma_nom_cold, gamma_nom_hot = BPHE.E301.gamma_nom_hot, h_cold = BPHE.E301.h_cold, h_hot = BPHE.E301.h_hot, hin_start_cold = BPHE.E301.hin_start_cold, hin_start_hot = BPHE.E301.hin_start_hot, k_cold = BPHE.E301.k_cold, k_hot = BPHE.E301.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E301.lambdam_cold, lambdam_hot = BPHE.E301.lambdam_hot, m_flow_start_cold = BPHE.E301.m_flow_start_cold, m_flow_start_hot = BPHE.E301.m_flow_start_hot, n = n_E301, nPipes_cold = BPHE.E301.nPipes_cold, nPipes_hot = BPHE.E301.nPipes_hot, nPlates = BPHE.E301.nPlates, pin_start_cold = BPHE.E301.pin_start_cold, pin_start_hot = BPHE.E301.pin_start_hot, pout_start_cold = BPHE.E301.pout_start_cold, pout_start_hot = BPHE.E301.pout_start_hot, rho_nom_cold = (BPHE.E301.rhoin_nom_cold + BPHE.E301.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E301.rhoin_nom_hot + BPHE.E301.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E301.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E301.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E301.u_nom_cold, u_nom_hot = BPHE.E301.u_nom_hot) annotation (
    Placement(visible = true, transformation(origin = {-389, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E301(T0 = BPHE.E301.Tout_start_cold, m_flow0 = BPHE.E301.m_flow_start_cold, p0 = BPHE.E301.pout_start_cold, pin_start = BPHE.E301.pout_start_cold) annotation (
    Placement(visible = true, transformation(origin = {-449, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  Sources.SourcePressure sourceCold_E301(T = BPHE.E301.Tin_start_cold, p0 = BPHE.E301.pin_start_cold, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {-450, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E501(T0 = BPHE.E501.Tout_start_cold, m_flow0 = 2.45957, p0 = BPHE.E501.pout_start_cold, pin_start = BPHE.E501.pout_start_cold) annotation (
    Placement(visible = true, transformation(origin = {-235, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E501(T = BPHE.E501.Tin_start_cold, p0 = BPHE.E501.pin_start_cold, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {-238, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkMassFlow sinkHot_E301(T0 = BPHE.E301.Tout_start_hot, m_flow0 = BPHE.E301.m_flow_start_hot, p0 = BPHE.E301.pout_start_hot, pin_start = BPHE.E301.pout_start_hot) annotation (
    Placement(visible = true, transformation(origin = {-335, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E301(T = BPHE.E301.Tin_start_hot, p0 = BPHE.E301.pin_start_hot, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {-338, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E501(T0 = BPHE.E501.Tout_start_hot, m_flow0 = BPHE.E501.m_flow_start_hot, p0 = BPHE.E501.pout_start_hot, pin_start = BPHE.E501.pout_start_hot) annotation (
    Placement(visible = true, transformation(origin = {-117, -35}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E501(T = BPHE.E501.Tin_start_hot, p0 = BPHE.E501.pin_start_hot, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {-118, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(Di_cold = BPHE.E501.Di_cold, Di_hot = BPHE.E501.Di_hot, L_cold = BPHE.E501.L_cold, L_hot = BPHE.E501.L_hot, MWall = BPHE.E501.MWall, Stot_cold = BPHE.E501.Stot_cold, Stot_hot = BPHE.E501.Stot_hot, Tin_start_cold = BPHE.E501.Tin_start_cold, Tin_start_hot = BPHE.E501.Tin_start_hot, Tout_start_cold = BPHE.E501.Tout_start_cold, Tout_start_hot = BPHE.E501.Tout_start_hot, cpm_cold = BPHE.E501.cpm_cold, cpm_hot = BPHE.E501.cpm_hot, t_cold = BPHE.E501.t_cold, t_hot = BPHE.E501.t_hot, gamma_nom_cold = BPHE.E501.gamma_nom_cold, gamma_nom_hot = BPHE.E501.gamma_nom_hot, h_cold = BPHE.E501.h_cold, h_hot = BPHE.E501.h_hot, hctype_cold = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream, hctype_hot = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle, hin_start_cold = BPHE.E501.hin_start_cold, hin_start_hot = BPHE.E501.hin_start_hot, k_cold = BPHE.E501.k_cold, k_hot = BPHE.E501.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E501.lambdam_cold, lambdam_hot = BPHE.E501.lambdam_hot, m_flow_start_cold = BPHE.E501.m_flow_start_cold, m_flow_start_hot = BPHE.E501.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E501.nPipes_cold, nPipes_hot = BPHE.E501.nPipes_hot, nPlates = BPHE.E501.nPlates, pin_start_cold = BPHE.E501.pin_start_cold, pin_start_hot = BPHE.E501.pin_start_hot, pout_start_cold = BPHE.E501.pout_start_cold, pout_start_hot = BPHE.E501.pout_start_hot, rho_nom_cold = (BPHE.E501.rhoin_nom_cold + BPHE.E501.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E501.rhoin_nom_hot + BPHE.E501.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E501.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E501.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E501.u_nom_cold, u_nom_hot = BPHE.E501.u_nom_hot) annotation (
    Placement(visible = true, transformation(origin = {-181, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E601(T0 = BPHE.E601.Tout_start_cold, m_flow0 = BPHE.E601.m_flow_start_cold, p0 = BPHE.E601.pout_start_cold, pin_start = BPHE.E601.pout_start_cold, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {29, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E601(Di_cold = BPHE.E601.Di_cold, Di_hot = BPHE.E601.Di_hot, L_cold = BPHE.E601.L_cold, L_hot = BPHE.E601.L_hot, MWall = BPHE.E601.MWall, Stot_cold = BPHE.E601.Stot_cold, Stot_hot = BPHE.E601.Stot_hot, Tin_start_cold = BPHE.E601.Tin_start_cold, Tin_start_hot = BPHE.E601.Tin_start_hot, Tout_start_cold = BPHE.E601.Tout_start_cold, Tout_start_hot = BPHE.E601.Tout_start_hot, cpm_cold = BPHE.E601.cpm_cold, cpm_hot = BPHE.E601.cpm_hot, t_cold = BPHE.E601.t_cold, t_hot = BPHE.E601.t_hot, gamma_nom_cold = BPHE.E601.gamma_nom_cold, gamma_nom_hot = BPHE.E601.gamma_nom_hot, h_cold = BPHE.E601.h_cold, h_hot = BPHE.E601.h_hot, hin_start_cold = BPHE.E601.hin_start_cold, hin_start_hot = BPHE.E601.hin_start_hot, k_cold = BPHE.E601.k_cold, k_hot = BPHE.E601.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E601.lambdam_cold, lambdam_hot = BPHE.E601.lambdam_hot, m_flow_start_cold = BPHE.E601.m_flow_start_cold, m_flow_start_hot = BPHE.E601.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E601.nPipes_cold, nPipes_hot = BPHE.E601.nPipes_hot, nPlates = BPHE.E601.nPlates, pin_start_cold = BPHE.E601.pin_start_cold, pin_start_hot = BPHE.E601.pin_start_hot, pout_start_cold = BPHE.E601.pout_start_cold, pout_start_hot = BPHE.E601.pout_start_hot, rho_nom_cold = (BPHE.E601.rhoin_nom_cold + BPHE.E601.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E601.rhoin_nom_hot + BPHE.E601.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E601.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E601.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E601.u_nom_cold, u_nom_hot = BPHE.E601.u_nom_hot) annotation (
    Placement(visible = true, transformation(origin = {87, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E601(T = BPHE.E601.Tin_start_cold, p0 = BPHE.E601.pin_start_cold, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E601(T = BPHE.E601.Tin_start_hot, p0 = BPHE.E601.pin_start_hot, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {150, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E601(T0 = BPHE.E601.Tout_start_hot, m_flow0 = BPHE.E601.m_flow_start_hot, p0 = BPHE.E601.pout_start_hot, pin_start = BPHE.E601.pout_start_hot) annotation (
    Placement(visible = true, transformation(origin = {151, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E701(T0 = BPHE.E701.Tout_start_cold, m_flow0 = BPHE.E701.m_flow_start_cold, p0 = BPHE.E701.pout_start_cold, pin_start = BPHE.E701.pout_start_cold) annotation (
    Placement(visible = true, transformation(origin = {239, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (
    Placement(visible = true, transformation(origin = {297, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E701(T = BPHE.E701.Tin_start_cold, p0 = BPHE.E701.pin_start_cold, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {240, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E701(T0 = BPHE.E701.Tout_start_hot, m_flow0 = BPHE.E701.m_flow_start_hot, p0 = BPHE.E701.pout_start_hot, pin_start = BPHE.E701.pout_start_hot) annotation (
    Placement(visible = true, transformation(origin = {361, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E701(T = BPHE.E701.Tin_start_hot, p0 = BPHE.E701.pin_start_hot, use_T = true) annotation (
    Placement(visible = true, transformation(origin = {360, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp E601_mflow_cold(duration = 20, height = -BPHE.E601.m_flow_start_cold*0.2, offset = BPHE.E601.m_flow_start_cold, startTime = 20)  annotation (
    Placement(visible = true, transformation(origin = {4, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  connect(sinkCold_E301.inlet, E301.outcold) annotation (
    Line(points={{-436,33},{-420,33},{-420,33},{-404.5,33}},          color = {168, 168, 168}));
  connect(sourceCold_E301.outlet, E301.incold) annotation (
    Line(points={{-440,-36},{-422,-36},{-422,-37},{-404.5,-37}},
                                              color = {168, 168, 168}));
  connect(E301.outhot, sinkHot_E301.inlet) annotation (
    Line(points={{-373.5,-37},{-366,-37},{-366,-38},{-360,-38},{-360,-37},{-348,
          -37}},                              color = {168, 168, 168}));
  connect(E301.inhot, sourceHot_E301.outlet) annotation (
    Line(points={{-373.5,33},{-348,33},{-348,32}},      color = {168, 168, 168}));
  connect(sinkCold_E501.inlet, E501.outcold) annotation (
    Line(points={{-222,33},{-196.5,33}},    color = {168, 168, 168}));
  connect(sourceCold_E501.outlet, E501.incold) annotation (
    Line(points={{-228,-36},{-212,-36},{-212,-37},{-196.5,-37}},
                                              color = {168, 168, 168}));
  connect(E501.inhot, sourceHot_E501.outlet) annotation (
    Line(points={{-165.5,33},{-146,33},{-146,34},{-128,34}},
                                                color = {168, 168, 168}));
  connect(E501.outhot, sinkHot_E501.inlet) annotation (
    Line(points={{-165.5,-37},{-148.5,-37},{-148.5,-35},{-130,-35}},            color = {168, 168, 168}));
  connect(sinkCold_E601.inlet, E601.outcold) annotation (
    Line(points={{42,33},{71.5,33}},    color = {168, 168, 168}));
  connect(sourceCold_E601.outlet, E601.incold) annotation (
    Line(points={{40,-36},{56,-36},{56,-37},{71.5,-37}},
                                          color = {168, 168, 168}));
  connect(E601.outhot, sinkHot_E601.inlet) annotation (
    Line(points = {{102.5, -37}, {138, -37}}, color = {168, 168, 168}));
  connect(E601.inhot, sourceHot_E601.outlet) annotation (
    Line(points={{102.5,33},{122,33},{122,34},{140,34}},
                                              color = {168, 168, 168}));
  connect(sinkCold_E701.inlet, E701.outcold) annotation (
    Line(points={{252,33},{260,33},{260,34},{267.5,34},{267.5,33},{281.5,33}},
                                          color = {168, 168, 168}));
  connect(sourceCold_E701.outlet, E701.incold) annotation (
    Line(points={{250,-36},{266,-36},{266,-37},{281.5,-37}},
                                            color = {168, 168, 168}));
  connect(E701.outhot, sinkHot_E701.inlet) annotation (
    Line(points={{312.5,-37},{322,-37},{322,-38},{330,-38},{330,-37},{348,-37}},
                                            color = {168, 168, 168}));
  connect(E701.inhot, sourceHot_E701.outlet) annotation (
    Line(points={{312.5,33},{332,33},{332,34},{350,34}},
                                          color = {168, 168, 168}));
  connect(E601_mflow_cold.y, sinkCold_E601.in_m_flow) annotation (
    Line(points={{15,70},{36.8,70},{36.8,39.5}},  color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-500, -100}, {500, 100}})),
    Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"));
end BPHETest;
