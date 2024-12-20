within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCV721_Seq_0412Test3
  extends Valves.Validation.TestBase(
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat"),
  matrixPTi = "PT722",
  matrixPTo = "PT721",
  matrixTTi = "TT721",
  matrixtheta = "theta_FCV721",
  matrixFT = "FT721");
equation

annotation (
    experiment(
      StopTime=9000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCV721_Seq_0412Test3;
