within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E721_Seq_0412Test3
  extends E700Test(
    E7X1(
      gamma_nom_hot=3666.84441,
      gamma_nom_cold=9520.42245,
         coldside(alpha=0.8257757), hotside(alpha=0.8257757)),
    matrixTT701 = "TT721",
    matrixTT702 = "TT722",
    matrixTT703 = "TT723",
    matrixTT704 = "TT724",
    matrixFT701 = "FT721",
    matrixFT703 = "FT723",
    matrixPT701 = "PT721",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    deltaThotmax = 26,
    deltaTcoldmax = 22.5);
end E721_Seq_0412Test3;
