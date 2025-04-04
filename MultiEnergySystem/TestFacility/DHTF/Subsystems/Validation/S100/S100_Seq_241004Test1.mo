within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241004Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241004_Test1.mat"),
    Pmaxnom=147.6e3*0.92,
    eta_combustion=0.84,
    tdelay=0,
    GB101_ToutSP(table=[0,80 + 273.15; 3400,80 + 273.15; 1e6,80 + 273.15]),
    realExpression(y=1e-5),
    GB101_Status(table={8130,8530}));
  annotation (
    experiment(StartTime = 0, StopTime = 10500, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241004Test1;
