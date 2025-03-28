within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation.S400;
model S400_Seq_2601Test1
  extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"), electricBoiler(FCV401(openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear)));
  annotation (
    experiment(StopTime = 7000, Interval = 0.166889, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end S400_Seq_2601Test1;
