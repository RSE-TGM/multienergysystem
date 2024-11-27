within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_CH4;
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
