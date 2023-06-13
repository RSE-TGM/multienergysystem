within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;

model Pipe_CH4H2
  extends Components.Pipes.TestSinglePipe_A(
    redeclare model Medium = H2GasFacility.Media.IdealGases.NG4_H2, n = 15, Xref = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477}, 
    roundPipe.Di = Pipe.pipe1.Di, 
    roundPipe.L = Pipe.pipe1.L, 
    roundPipe.Tin_start = 15 + 273.15, 
    roundPipe.Tout_start = 15 + 273.15, 
    roundPipe.rho_nom = Pipe.pipe1.rho_nom, 
    m_flow_ref = Pipe.pipe1.m_flow_start, 
    roundPipe.k = Pipe.pipe1.k, 
    roundPipe.quasistaticEnergyBalance = false, 
    roundPipe.m_flow_start = Pipe.pipe1.m_flow_start, 
    roundPipe.pin_start = Pipe.pipe1.pin_start, 
    roundPipe.pout_start = Pipe.pipe1.pout_start, 
    sourceP.p0 = Pipe.pipe1.pin_start, 
    p_in.height = 0.5e5*0.05, p_in.offset = 0.5e5, roundPipe.u_nom = Pipe.pipe1.u_nom, sourceP.p0.displayUnit = "Pa", sink.T0 = 15 + 273.15, sink.p0 = Pipe.pipe1.pout_start, sink.pin_start = Pipe.pipe1.pout_start, sourceP.T0 = 15 + 273.15, roundPipe.computeTransport = true, sink.G = 0, T_in.duration = 10, m_flow.duration = 10);
equation
  annotation(
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.070014),
  Diagram);
end Pipe_CH4H2;
