within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves;
model TestValveTCV301
  extends Components.BaseClass.ValveTestBase(
  cvalve(
    Kv=Valve.TCV301.Kv,
    dp_nom=Valve.TCV301.dp_nom,
    rho_nom=Valve.TCV301.rho_nom,
    Tin_start=Valve.TCV301.Tin_start,
    pin_start=Valve.TCV301.pin_start),
  sink(
    T0=Valve.TCV301.Tin_start,
    m_flow0=Valve.TCV301.m_flow_nom,
    p0(displayUnit="Pa") = Valve.TCV301.pin_start - Valve.TCV301.dp_nom,
    pin_start(displayUnit="Pa") = Valve.TCV301.pin_start - Valve.TCV301.dp_nom,
    use_in_m_flow = true),
  sourceP(
    T0=Valve.TCV301.Tin_start,
    p0=Valve.TCV301.pin_start),
  m_flow_set(duration = 20,
    height=1*Valve.TCV301.m_flow_nom,
    offset=0.5*Valve.TCV301.m_flow_nom,
    startTime = 30));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestValveTCV301;
