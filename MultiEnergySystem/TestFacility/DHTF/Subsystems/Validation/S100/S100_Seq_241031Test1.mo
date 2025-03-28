within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241031Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241031_Test1.mat"),
    Pmaxnom=147.6e3*0.92,
    eta_combustion=0.84,
    tdelay=0,
    GB101_ToutSP(table=[0,80 + 273.15; 3400,80 + 273.15; 1e6,80 + 273.15]),
    realExpression(y=1e-5),
    Tout_start_S1=79.9 + 273.15);
  //   eta_combustion = 0.90,
  //   tdelay = 180,
  annotation (
    experiment(StopTime = 8450, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241031Test1;
