within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves;
model TestValveFCV401 "Controlled valve of system S400"
  extends Components.BaseClass.ValveTestBase(
  cvalve(
    Kv=Valve.FCV401.Kv,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot,
    dp_nom=Valve.FCV401.dp_nom,
    rho_nom=Valve.FCV401.rho_nom,
    Tin_start=Valve.FCV401.Tin_start,
    pin_start=Valve.FCV401.pin_start),
  sink(
    T0=Valve.FCV401.Tin_start,
    m_flow0=Valve.FCV401.m_flow_nom,
    p0(displayUnit="Pa") = Valve.FCV401.pin_start - Valve.FCV401.dp_nom,
    pin_start(displayUnit="Pa") = Valve.FCV401.pin_start - Valve.FCV401.dp_nom,
    use_in_m_flow = true),
  sourceP(
    T0=Valve.FCV401.Tin_start,
    p0=Valve.FCV401.pin_start),
  m_flow_set(
      duration=60,
      height=1*Valve.FCV401.m_flow_nom*0,
      offset=Valve.FCV401.m_flow_nom,
      startTime=60),
    theta(
      height=-0.95,
      duration=20,
      offset=1,
      startTime=30));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestValveFCV401;
