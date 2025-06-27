within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S100;
model S100_Seq_241014Test1
  extends DHTF.Subsystems.Validation.S100.TestBase(
    MeasuredData=Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/241014_Test1.mat"),
    Tout_start_S1 = 20.889 + 273.15,
    Pmaxnom=147.6e3*0.85,
    eta_combustion=0.95,
    tdelay=5,
    GB101_ToutSP(table=[0, 78 + 273.15; 4500, 78 + 273.15; 4500, 70 + 273.15; 5285, 70 + 273.15; 5285, 72 + 273.15; 6640,72 + 273.15; 6640,80 + 273.15; 1e6,80 + 273.15]),
    realExpression(y=1e-5),
    GB101_Status(table={1947}, startValue=false));
  annotation (
    experiment(StopTime = 18000, __Dymola_Algorithm = "Dassl"));
end S100_Seq_241014Test1;
