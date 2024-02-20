within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E701_Seq_0412Test3
  extends E700Test(
    CorrectFactorHot = 1.02,
    CorrectFactorCold = 1,
    deltaThotmax = 26,
    deltaTcoldmax = 22.5,
    E701(coldside(alpha=0), hotside(alpha=0)));
end E701_Seq_0412Test3;
