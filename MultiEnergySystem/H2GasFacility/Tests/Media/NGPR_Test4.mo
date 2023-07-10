within MultiEnergySystem.H2GasFacility.Tests.Media;
model NGPR_Test4 "Molar fraction from paper reference"
  extends NaturalGasPR(
    T_ref = 20 + 273.15,
    p_ref = 75e2,
    Y = {97.201, 1.862, 0.393, 0, 0, 0, 0,  0, 0.544}/100);
    //paper: Non-stoichiometric methanation as strategy to overcome the limitations of green hydrogen injection into the natural gas grid pp. 7
equation

end NGPR_Test4;
