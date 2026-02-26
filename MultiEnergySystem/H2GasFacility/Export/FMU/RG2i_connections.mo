within MultiEnergySystem.H2GasFacility.Export.FMU;
model RG2i_connections
  extends Interfaces.TwoSignalBusConnector;
  extends MultiEnergySystem.H2GasFacility.Export.FMU.RG2i_1sources;
equation
  connect(Immissione_1.in_m_flow0, controlSignalBus.m_flow_h2) annotation (Line(
        points={{-80,-25},{-80,-78},{-818,-78},{-818,-3},{-897,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_1.in_m_flow0, controlSignalBus.demand_1) annotation (Line(
        points={{209.2,-74.5},{209.2,-50},{434,-50},{434,-288},{-848,-288},{
          -848,-3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_2.in_m_flow0, controlSignalBus.demand_2) annotation (Line(
        points={{244.5,-245.6},{288,-245.6},{288,-346},{-722,-346},{-722,-3},{
          -897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(demand_3.in_m_flow0, controlSignalBus.demand_3) annotation (Line(
        points={{48,-118.5},{48,-208},{-897,-208},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_4.in_m_flow0, controlSignalBus.demand_4) annotation (Line(
        points={{-190,173.5},{-190,-3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_5.in_m_flow0, controlSignalBus.demand_5) annotation (Line(
        points={{36,265.5},{36,200},{-897,200},{-897,-3}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_7.in_m_flow0, controlSignalBus.demand_7) annotation (Line(
        points={{230,251.5},{230,168},{184,168},{184,262},{-897,262},{-897,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealPressureSensor1.p_meas, processVariableBus.p_meas_GRM2)
    annotation (Line(points={{249.4,-221.8},{652,-221.8},{652,-3},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(demand_6.in_m_flow0, controlSignalBus.demand_6) annotation (Line(
        points={{108,222.5},{108,310},{-800,310},{-800,-3},{-897,-3}}, color={0,
          0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
end RG2i_connections;
