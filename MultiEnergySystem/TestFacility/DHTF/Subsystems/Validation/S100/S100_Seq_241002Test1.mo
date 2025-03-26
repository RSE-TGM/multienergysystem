within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241002Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241002_Test1.mat"),
    Pmaxnom=147.6e3*0.92,
    eta_combustion=0.84,
    tdelay=5,
    GB101_ToutSP(table=[0,80 + 273.15; 3400,80 + 273.15; 1e6,80 + 273.15]),
    GB101_Status(table={1350}, startValue=false),
    realExpression(y=1e-5));
  //GB101_ToutSP(table=[0, 77.3 + 273.15; 3400, 77.3 + 273.15; 1e6, 77.3 + 273.15]),
  //Tout_start_S1 = 29.71 + 273.15);
  //StartTime=1550,
  annotation (
    experiment(StartTime = 0, StopTime = 12600, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241002Test1;
