within MultiEnergySystem.H2GasFacility.Tests.Media;
model NGPR_Test1 "Molar fraction from paper reference"
  extends SinglePTXFluidTest(
    T_ref = 0 + 273.15,
    p_ref = 101325,
    Y = {0.85306, 0.06486, 0.02058, 0.00437, 0.0028, 0.00063, 0.00099, 0.01268, 0.03882});
    //paper: Solar hydrogen from North Africa to Europe through greenstream: A simulation-based analysis of blending scenarios and production plant sizing pp. 8
equation

end NGPR_Test1;
