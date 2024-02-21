within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E721_Seq_0412Test3
  extends E700Test(
    matrixTT701 = "TT721",
    matrixTT702 = "TT722",
    matrixTT703 = "TT723",
    matrixTT704 = "TT724",
    matrixFT701 = "FT721",
    matrixFT703 = "FT723",
    matrixPT701 = "PT721",
    CorrectFactorHot = 1.02,
    CorrectFactorCold = 1,
    deltaThotmax = 26,
    deltaTcoldmax = 22.5,
    E701(
      gamma_nom_hot=3000,
      gamma_nom_cold=3000,
         coldside(alpha=0), hotside(alpha=0)));
end E721_Seq_0412Test3;
