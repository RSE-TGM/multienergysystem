within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
model FCVC02_Seq_0412Test2
  extends Valves.Validation.TestBase(
  redeclare model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity,
  MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat"),
  matrixPTi = "PTA20",
  matrixPTo = "PTA19",
  matrixTTi = "TT732",
  matrixtheta = "theta_FCVC02",
  matrixFT = "FTA12",
  Q_nom = 15,
  Kv = 33,
  L = 0.001,
  h = 0,
  theta_ex = 0,
    cvalve(
      minimumOpening=0.002,
      openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear,
      dp_nom=Valve.FCVC02.dp_nom,
      rho_nom=Valve.FCVC02.rho_nom,
      q_m3h_nom=Valve.FCVC02.q_nom_m3h,
      Tin_start=Valve.FCVC02.Tin_start,
      pin_start=Valve.FCVC02.pin_start,
      rho_start=Valve.FCVC02.rho_nom,
      q_m3h_start=Valve.FCVC02.q_nom_m3h),
    sourceP(R=1e-3),
    sinkP(R=1e-3),
    realExpression1(y=0),
    realExpression(y=0));
equation

annotation (
    experiment(
      StopTime=10000,
      Interval=20,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end FCVC02_Seq_0412Test2;
