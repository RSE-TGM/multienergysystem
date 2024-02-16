within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Pipe_CH4H2
  extends Components.Pipes.TestSinglePipe_A(
    redeclare model Medium = H2GasFacility.Media.IdealGases.NG4_H2, n = 15, Xref = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477},
    roundPipe(
      X_start=Xref,
    Di =           Pipe.pipe1.Di,
    L =           Pipe.pipe1.L,
      Tin_start=288.15,
      Tout_start=288.15,
    rho_nom =           Pipe.pipe1.rho_nom,
    k =           Pipe.pipe1.k,
    m_flow_start =           Pipe.pipe1.m_flow_start,
    pin_start =           Pipe.pipe1.pin_start,
    pout_start =           Pipe.pipe1.pout_start),
    m_flow_start = Pipe.pipe1.m_flow_start,
    sourceP(
    p0(                                            displayUnit =            "Pa")=
                 Pipe.pipe1.pin_start,                                                                                                                                            T0 =         15 + 273.15),
    p_in(
    height =      0.5e5*0.05, offset =      0.5e5),
    sink(                                                                         T0 =      15 + 273.15, p0 =      Pipe.pipe1.pout_start, pin_start =      Pipe.pipe1.pout_start,
      X0=Xref,                                                                                                                                                                                              G =      0),
    T_in(                                                                                                                                                                                                        duration =      10),
    m_flow(                                                                                                                                                                                                        duration =        10));
  annotation (
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.070014),
  Diagram);
end Pipe_CH4H2;
