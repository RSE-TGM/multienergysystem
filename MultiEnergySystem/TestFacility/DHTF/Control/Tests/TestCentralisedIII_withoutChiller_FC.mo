within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model TestCentralisedIII_withoutChiller_FC
  extends TestCentralisedIII_withoutChiller(
    actuator(
      omegaP101(table = [0, 1.4; 1E6, 1.4]),
      domegaP401(table = [0, 1.88; 1E6, 1.88]),
      domegaP501_var(y = 0.95764),
      PtEX7X1SP(table = [0, 48000, 48000, 48000, 48000; 3600, 48000, 48000, 48000, 48000; 7200, 48000, 48000, 48000, 48000; 10800, 48000, 48000, 48000, 48000; 14400, 48000, 48000, 48000, 48000; 18000, 48000, 48000, 48000, 48000; 21600, 45000, 45000, 45000, 45000; 25200, 45000, 45000, 45000, 45000; 28800, 45000, 45000, 45000, 45000; 32400, 45000, 45000, 45000, 45000; 36000, 49000, 49000, 49000, 49000; 39600, 49000, 49000, 49000, 49000; 43200, 49000, 49000, 49000, 49000; 46800, 49000, 49000, 49000, 49000; 50400, 49000, 49000, 49000, 49000; 54000, 48000, 48000, 48000, 48000; 57600, 48000, 48000, 48000, 48000; 61200, 48000, 48000, 48000, 48000; 64800, 48000, 48000, 48000, 48000; 68400, 48000, 48000, 48000, 48000; 72000, 48000, 48000, 48000, 48000; 75600, 48000, 48000, 48000, 48000; 79200, 48000, 48000, 48000, 48000; 82800, 48000, 48000, 48000, 48000; 86400, 48000, 48000, 48000, 48000]),
      bool_thetaFCVC01(y = false),
      thetaFCVC01(table = [0, 0; 1e6, 0]),
      bool_thetaFCVC02(y = false),
      thetaFCVC02(table = [0, 0.3; 1e6, 0.3]),
      bool_omegaP901(y = false),
      omegaP901(table = [0, 1.2e5; 1e6, 1.2e5])),
    redeclare DHTF.Networks.Centralised.LoadControl.CSLC_III_withoutChiller_FC plant(
      heatGeneration(X_gas = {1}),
      load(
        EX701_Tin_hot = 353.15,
        EX701_Tout_hot = 338.15,
        EX711_Tin_hot = 353.15,
        EX711_Tout_hot = 338.15,
        EX721_Tin_hot = 353.15,
        EX721_Tout_hot = 338.15,
        EX731_Tin_hot = 353.15,
        EX731_Tout_hot = 338.15,
        EX701_Tin_cold = 288.15,
        EX701_Tout_cold = 313.15,
        EX711_Tin_cold = 288.15,
        EX711_Tout_cold = 313.15,
        EX721_Tin_cold = 288.15,
        EX721_Tout_cold = 313.15,
        EX731_Tin_cold = 288.15,
        EX731_Tout_cold = 313.15,
        S701(
          y_start_PI_TT = 0.4,
          y_start_PI_Pt = 0.6),
        S711(
          y_start_PI_TT = 0.4,
          y_start_PI_Pt = 0.6),
        S721(
          y_start_PI_TT = 0.4,
          y_start_PI_Pt = 0.6),
        S731(
          y_start_PI_TT = 0.4,
          y_start_PI_Pt = 0.6)),
        distribution(S900(P901(omega(start = 2*pi*40))))));
  annotation (
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-06, Interval = 1.728));
end TestCentralisedIII_withoutChiller_FC;
