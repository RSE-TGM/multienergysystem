within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model BPHETest

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger HX1(Di_cold = 0.023, Di_hot = 0.03, L_cold = 0.96275, L_hot = 0.7073, Stot_cold = 0.5, Stot_hot = 0.5,
    Tin_start_cold=323.15,
    Tin_start_hot=353.15,
    Tout_start_cold=303.15,
    Tout_start_hot=333.15,                                                                                                                                                                                                        cpm_hot = 500, gamma_nom_cold = 3440, gamma_nom_hot = 3440, hin_start_cold = 1e5, hin_start_hot = 1e5, k_cold = 13923.8, k_hot = 4162.27, kc_cold = 1, kc_hot = 1, lambdam_hot = 16.3, m_flow_start_cold = 5, m_flow_start_hot = 0.6154,
    n=7,                                                                                                                                                                                                        nPipes_cold = 1, nPipes_hot = 1,
    pin_start_cold=110000,
    pin_start_hot=110000,
    pout_start_cold=101000,
    pout_start_hot=101000,                                                                                                                                                                                                        rhom_cold(displayUnit = "kg/m3") = 7990, rhom_hot(displayUnit = "g/cm3") = 7990, thermalInertia = false) annotation (
    Placement(visible = true, transformation(origin={-89,0},   extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold(p0(displayUnit = "kPa") = 110000, use_T = true, T = 280.15) annotation (
    Placement(visible = true, transformation(origin={-142,-38},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkCold(p0(displayUnit = "kPa") = 1000*(110 - 19.3), use_T = true, T = 288.75) annotation (
    Placement(visible = true, transformation(origin={-144,34},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot(p0(displayUnit = "kPa") = 110000, use_T = true, T = 353.15) annotation (
    Placement(visible = true, transformation(origin={-36,34},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkHot(p0(displayUnit = "kPa") = 1000*(110 - 2.5), use_T = true, T = 303.15) annotation (
    Placement(visible = true, transformation(origin={-36,-36},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System system annotation (
    Placement(visible = true, transformation(origin={90,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Pipes.BrazedPlateHeatExchanger                                          HX2(
    nPlates=80,
    u_nom_hot=6.09,
    hctype_hot=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,
    Di_cold=0.023,
    Di_hot=0.03,
    L_cold=9.6351,
    L_hot=5.765,
    Stot_cold=4.5,
    Stot_hot=4.5,
    u_nom_cold=6.46,
    hctype_cold=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,

    Tin_start_cold=293.15,
    Tin_start_hot=301.15,
    Tout_start_cold=298.15,
    Tout_start_hot=298.05,
    cpm_hot=500,
    gamma_nom_cold=gamma_HX2,
    gamma_nom_hot=gamma_HX2,
    hin_start_cold=1e5,
    hin_start_hot=1e5,
    k_cold=10881.6965,
    k_hot=9880.9187,
    kc_cold=1,
    kc_hot=1,
    lambdam_hot=16.3,
    m_flow_start_cold=2.673031,
    m_flow_start_hot=4.31134,
    n=7,
    nPipes_cold=1,
    nPipes_hot=1,
    pin_start_cold=110000,
    pin_start_hot=110000,
    pout_start_cold=99999.99999999999*(1.1 - 0.289),
    pout_start_hot=99999.99999999999*(1.1 - 0.426),
    rhom_cold(displayUnit="kg/m3") = 7990,
    rhom_hot(displayUnit="g/cm3") = 7990,
    thermalInertia=false)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={83,0},    extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  Sources.SourcePressure                                          sourceCold2(
    p0(displayUnit="kPa") = 110000,
    use_T=true,
    T=293.15)                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={30,-38},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkPressure                                          sinkCold2(
    p0(displayUnit="kPa") = 1000*(110 - 28.9),
    use_T=true,
    T=298.15)                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={28,34},     extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.SourcePressure                                          sourceHot2(
    p0(displayUnit="kPa") = 110000,
    use_T=true,
    T=301.15)                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={136,34},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.SinkPressure                                          sinkHot2(
    p0(displayUnit="kPa") = 1000*(110 - 42.6),
    use_T=true,
    T=298.05)                                                                                                                                 annotation (
    Placement(visible = true, transformation(origin={136,-36},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sourceCold.outlet, HX1.incold) annotation (
    Line(points={{-132,-38},{-104.5,-38},{-104.5,-35}}, color = {168, 168, 168}));
  connect(sinkCold.inlet, HX1.outcold) annotation (
    Line(points={{-134,34},{-103.467,34}},           color = {168, 168, 168}));
  connect(HX1.inhot, sourceHot.outlet) annotation (
    Line(points={{-73.5,35},{-60,35},{-60,34},{-46,34}},
                                        color = {168, 168, 168}));
  connect(HX1.outhot, sinkHot.inlet) annotation (
    Line(points={{-73.5,-35},{-46,-35},{-46,-36}},   color = {168, 168, 168}));
  connect(sourceCold2.outlet, HX2.incold) annotation (Line(points={{40,-38},{67.5,
          -38},{67.5,-35}}, color={168,168,168}));
  connect(sinkCold2.inlet, HX2.outcold)
    annotation (Line(points={{38,34},{68.5333,34}}, color={168,168,168}));
  connect(HX2.inhot, sourceHot2.outlet) annotation (Line(points={{98.5,35},{112,
          35},{112,34},{126,34}}, color={168,168,168}));
  connect(HX2.outhot, sinkHot2.inlet) annotation (Line(points={{98.5,-35},{126,-35},
          {126,-36}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent={{-180,-100},{180,
            100}})));
end BPHETest;
