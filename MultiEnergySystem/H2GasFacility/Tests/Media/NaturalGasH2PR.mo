within MultiEnergySystem.H2GasFacility.Tests.Media;
model NaturalGasH2PR
  extends MultiEnergySystem.H2GasFacility.Tests.Media.SinglePTXFluidTest(
    redeclare model Medium = H2GasFacility.Media.RealGases.NaturalGasH2PR,
    T_ref = 500 + 273.15,
    p_ref = 1e5,
    Y = {0.81, 0.054, 0.009, 0.0045, 0.0225, 0.1});

equation

end NaturalGasH2PR;
