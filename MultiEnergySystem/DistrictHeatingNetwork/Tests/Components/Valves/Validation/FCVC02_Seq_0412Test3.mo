within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCVC02_Seq_0412Test3
  extends Valves.Validation.TestBase(
  redeclare model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity,
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat"),
  matrixPTi = "PTA20",
  matrixPTo = "PTA19",
  matrixTTi = "TT732",
  matrixtheta = "theta_FCVC02",
  matrixFT = "FTA12",
  Kv = 27.5,
  L = 0.001,
  h = 0,
    cvalve(
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage,
      dp_nom=Valve.FCVC02.dp_nom,
      rho_nom=Valve.FCVC02.rho_nom,
      q_m3h_nom=Valve.FCVC02.q_nom_m3h,
      Tin_start=Valve.FCVC02.Tin_start,
      pin_start=Valve.FCVC02.pin_start,
      rho_start=Valve.FCVC02.rho_nom,
      q_m3h_start=Valve.FCVC02.q_nom_m3h));
equation

annotation (
    experiment(
      StopTime=9000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCVC02_Seq_0412Test3;
