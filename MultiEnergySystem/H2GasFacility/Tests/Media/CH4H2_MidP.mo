within MultiEnergySystem.H2GasFacility.Tests.Media;
model CH4H2_MidP "Test for CH4H2 using medium pressure and 3 different fluid models"
  extends BaseThreeFluidsComparison(
    redeclare model Medium1 = H2GasFacility.Media.IdealGases.CH4H2,
    redeclare model Medium2 = H2GasFacility.Media.RealGases.CH4H2Papay,
    redeclare model Medium3 = H2GasFacility.Media.RealGases.CH4H2PR,
    Y = {0.9, 0.1});
end CH4H2_MidP;
