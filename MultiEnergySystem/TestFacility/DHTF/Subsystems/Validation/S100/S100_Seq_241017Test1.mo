within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241017Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241017_Test1.mat"),
    Tout_start_S1 = 71.2095 + 273.15,
    Pmaxnom=147.6e3*0.77,
    eta_combustion=0.95,
    tdelay=0,
    GB101_ToutSP(table=[0,73.5 + 273.15; 5920,73.5 + 273.15; 5920,80 + 273.15; 1e6,80 + 273.15]),
    realExpression(y=1e-5));
  annotation (
    experiment(StartTime = 0, StopTime = 13000, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241017Test1;
