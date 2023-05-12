within MultiEnergySystem.H2GasFacility.Tests.Media;

model NGPapay_Test1 "Molar fraction from paper reference"
  extends NGPR_Test1(
    redeclare model Medium = H2GasFacility.Media.RealGases.NaturalGasPapay);
    //paper: Solar hydrogen from North Africa to Europe through greenstream: A simulation-based analysis of blending scenarios and production plant sizing pp. 8
equation

end NGPapay_Test1;
