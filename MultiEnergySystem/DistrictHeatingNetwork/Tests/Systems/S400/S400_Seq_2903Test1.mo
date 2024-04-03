within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S400;
model S400_Seq_2903Test1
  extends S400_Test(
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2903_Test1/Temperatures.mat"), FCV401(
        openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage));
  annotation (experiment(
      StopTime=3500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S400_Seq_2903Test1;
