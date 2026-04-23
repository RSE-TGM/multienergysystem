within MultiEnergySystem.H2GasFacility.Export.FMU;
model RG2i_low_connections
  extends Interfaces.TwoSignalBusConnector;
  extends MultiEnergySystem.H2GasFacility.Export.FMU.RG2i_low_1sources;
equation
  connect(Immissione_1.in_m_flow0, controlSignalBus.m_flow_h2) annotation (Line(
        points={{-80,-25},{-80,-80},{-896,-80},{-896,-3},{-897,-3}}, color={0,0,
          127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_1.in_m_flow0, controlSignalBus.demand_1) annotation (Line(
        points={{209.2,-74.5},{209.2,-50},{386,-50},{386,-288},{-896,-288},{
          -896,-3},{-897,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(demand_2.in_m_flow0, controlSignalBus.demand_2) annotation (Line(
        points={{244.5,-245.6},{112,-245.6},{112,-246},{-898,-246},{-898,-3},{
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
  connect(idealPressureSensor1.p_meas, processVariableBus.p_meas_GRM2)
    annotation (Line(points={{249.4,-221.8},{896,-221.8},{896,-3}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end RG2i_low_connections;
