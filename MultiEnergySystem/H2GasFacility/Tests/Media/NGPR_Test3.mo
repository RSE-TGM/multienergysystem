within MultiEnergySystem.H2GasFacility.Tests.Media;
model NGPR_Test3 "Molar fraction from paper reference"
  extends SinglePTXFluidTest(
    T_ref = 15 + 273.15,
    p_ref = 75e2,
    Y = {0.90, 0.06, 0.01, 0.001, 0, 0, 0,  0.005, 0.024});
    //paper: Steady state analysis of gas networks with distributed injection of alternativa gas pp.7
equation

end NGPR_Test3;
