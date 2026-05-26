within MultiEnergySystem.H2GasFacility.Export.FMU;
model RG2i_sensors_connections
  extends Interfaces.TwoSignalBusConnector;
  extends MultiEnergySystem.H2GasFacility.Export.FMU.RG2i_sensors_1source;
equation
  connect(Immissione_1.in_m_flow0, controlSignalBus.m_flow_h2) annotation (Line(
        points={{-80,-25},{-80,-80},{-896,-80},{-896,-3},{-897,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_1.in_m_flow0, controlSignalBus.demand_1) annotation (Line(
        points={{253.2,-74.5},{253.2,-50},{386,-50},{386,-288},{-896,-288},{
          -896,-3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_2.in_m_flow0, controlSignalBus.demand_2) annotation (Line(
        points={{242.5,-269.6},{112,-269.6},{112,-246},{-898,-246},{-898,-3},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(demand_3.in_m_flow0, controlSignalBus.demand_3) annotation (Line(
        points={{-2,-118.5},{-2,-208},{-897,-208},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_4.in_m_flow0, controlSignalBus.demand_4) annotation (Line(
        points={{-262,171.5},{-262,88},{-896,88},{-896,-3},{-897,-3}},
                                                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_5.in_m_flow0, controlSignalBus.demand_5) annotation (Line(
        points={{-34,283.5},{-34,200},{-897,200},{-897,-3}},
                                                           color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_7.in_m_flow0, controlSignalBus.demand_7) annotation (Line(
        points={{216,279.5},{216,168},{184,168},{184,262},{-897,262},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_6.in_m_flow0, controlSignalBus.demand_6) annotation (Line(
        points={{172,224.5},{172,308},{-898,308},{-898,-3},{-897,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor2.Y_meas, processVariableBus.Y_GMR1) annotation (Line(
        points={{235.8,-72.6},{235.8,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor2.p_meas, processVariableBus.p_GRM1) annotation (
      Line(points={{201.8,-74.6},{201.8,-3},{896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor1.Y_meas, processVariableBus.Y_GRM2) annotation (Line(
        points={{241.4,-249.8},{722,-249.8},{722,-3},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(idealPressureSensor1.p_meas, processVariableBus.p_GRM2) annotation (
      Line(points={{249.4,-221.8},{724,-221.8},{724,-3},{896,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(idealPressureSensor3.p_meas, processVariableBus.p_GRM3) annotation (
      Line(points={{46.2,-117.4},{46.2,-390},{634,-390},{634,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor.Y_meas, processVariableBus.Y_GRM3) annotation (Line(
        points={{20.2,-117.4},{20.2,-410},{614,-410},{614,-16},{896,-16},{896,
          -3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor3.Y_meas, processVariableBus.Y_GRM4) annotation (Line(
        points={{-221.8,172.6},{-221.8,78},{896,78},{896,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor4.p_meas, processVariableBus.p_GRM4) annotation (
      Line(points={{-181.8,172.6},{-181.8,78},{896,78},{896,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor5.p_meas, processVariableBus.p_GRM5) annotation (
      Line(points={{32.6,277.8},{-14,277.8},{-14,314},{896,314},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor4.Y_meas, processVariableBus.Y_GRM5) annotation (Line(
        points={{10.2,284.6},{0,284.6},{0,336},{570,336},{570,326},{896,326},{
          896,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor7.p_meas, processVariableBus.p_GRM6) annotation (
      Line(points={{117.8,225.4},{117.8,244},{882,244},{882,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor5.Y_meas, processVariableBus.Y_GRM6) annotation (Line(
        points={{151.8,225.4},{150,225.4},{150,44},{896,44},{896,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealYSensor6.Y_meas, processVariableBus.Y_GRM7) annotation (Line(
        points={{234.6,277.8},{234.6,256},{854,256},{854,-3},{896,-3}}, color={
          0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor6.p_meas, processVariableBus.p_GRM7) annotation (
      Line(points={{234.6,247.8},{232,247.8},{232,218},{896,218},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end RG2i_sensors_connections;
