within MultiEnergySystem.H2GasFacility.Tests.Media;

model NGPapay_Test1 "Molar fraction from paper reference"
  extends NGPR_Test1(
    redeclare model Medium = H2GasFacility.Media.RealGases.NaturalGasPapay,
    p_ref = 1.01325e5,
    T_ref = 0 + 273.15,
    Y = {97.201, 1.862, 0.393, 0, 0, 0, 0,  0, 0.544}/100);
    //paper: Solar hydrogen from North Africa to Europe through greenstream: A simulation-based analysis of blending scenarios and production plant sizing pp. 8
equation

end NGPapay_Test1;
