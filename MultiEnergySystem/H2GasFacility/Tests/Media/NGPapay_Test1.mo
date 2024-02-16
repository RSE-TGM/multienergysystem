within MultiEnergySystem.H2GasFacility.Tests.Media;
model NGPapay_Test1 "Molar fraction from paper reference"
  extends NGPR_Test1(
    redeclare model Medium = H2GasFacility.Media.RealGases.NG6_H2_Papay_ND,
    p_ref = 1.01325e5,
    T_ref = 15 + 273.15,
    Y = H2GasFacility.Data.MassMolFractionData.NG_Cheli.Y);
    //paper: Solar hydrogen from North Africa to Europe through greenstream: A simulation-based analysis of blending scenarios and production plant sizing pp. 8
equation

end NGPapay_Test1;
