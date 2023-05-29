within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;

model Pipe_CH4H2
  extends Components.Pipes.TestSinglePipe_A(redeclare model Medium = H2GasFacility.Media.IdealGases.CH4H2, Xref = {0.8, 0.2});
  Real dv_dt(unit = "(m3/kg)/s");
  Real dv_dt_check(unit = "(m3/kg)/s");
  Real du_dt, du_dt_check;
equation
  dv_dt = roundPipe.fluid[1].dv_dT*der(roundPipe.fluid[1].T) + roundPipe.fluid[1].dv_dp*der(roundPipe.fluid[1].p) + roundPipe.fluid[1].dv_dX*der(roundPipe.fluid[1].X);
  dv_dt_check = roundPipe.fluid[1].dv_dT*der(roundPipe.fluid[1].T) + roundPipe.fluid[1].dv_dp*der(roundPipe.fluid[1].p) + roundPipe.fluid[1].dv_dXi*der(roundPipe.fluid[1].Xi);
  du_dt = roundPipe.fluid[3].du_dT*der(roundPipe.fluid[3].T) + roundPipe.fluid[3].du_dp*der(roundPipe.fluid[3].p) + roundPipe.fluid[3].du_dX*der(roundPipe.fluid[3].X);
  du_dt_check = roundPipe.fluid[3].du_dT*der(roundPipe.fluid[3].T) + roundPipe.fluid[3].du_dp*der(roundPipe.fluid[3].p) + roundPipe.fluid[3].du_dXi*der(roundPipe.fluid[3].Xi);
  annotation(
    experiment(StartTime = 0, StopTime = 350, Tolerance = 1e-06, Interval = 0.070014));
end Pipe_CH4H2;
