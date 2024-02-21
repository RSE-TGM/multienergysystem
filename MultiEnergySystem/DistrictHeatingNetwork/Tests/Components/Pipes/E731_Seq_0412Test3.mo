within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E731_Seq_0412Test3
  extends E700Test(
    matrixTT701 = "TT731",
    matrixTT702 = "TT732",
    matrixTT703 = "TT733",
    matrixTT704 = "TT734",
    matrixFT701 = "FT731",
    matrixFT703 = "FT733",
    matrixPT701 = "PT731",
    CorrectFactorHot = 1.02,
    CorrectFactorCold = 1,
    deltaThotmax = 26,
    deltaTcoldmax = 22.5,
    E701(coldside(alpha=0.8257757), hotside(alpha=0.8257757)));
end E731_Seq_0412Test3;
