within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S700;
model E711_Seq_0412Test3
  extends E700Test(
    E7X1(coldside(alpha=0.67402256), hotside(alpha=0.67402256)),
    matrixTT701 = "TT711",
    matrixTT702 = "TT712",
    matrixTT703 = "TT713",
    matrixTT704 = "TT714",
    matrixFT701 = "FT711",
    matrixFT703 = "FT713",
    matrixPT701 = "PT711",
    CorrectFactorHot = 1,
    CorrectFactorCold = 1,
    deltaThotmax = 26,
    deltaTcoldmax = 22.5);
end E711_Seq_0412Test3;
