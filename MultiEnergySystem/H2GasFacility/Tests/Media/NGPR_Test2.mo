within MultiEnergySystem.H2GasFacility.Tests.Media;
model NGPR_Test2 "Molar fraction from paper reference"
  extends SinglePTXFluidTest(
    T_ref = 0 + 273.15,
    p_ref = 101325,
    Y = {0.86486, 0.08788, 0.01179, 0.00107, 0.00085, 0.00015, 0.00021,  0.01894, 0.01323});
    //paper: Non-stoichiometric methanation as strategy to overcome the limitations of green hydrogen injection into the natural gas grid pp. 7
equation

end NGPR_Test2;
