within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_2703Test1
  extends S900_Test(
    T_sampling = 2,
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2703_Test1/Temperatures.mat"),
    FCV901(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot));
                                                                                                                                                                                                          annotation (experiment(
      StopTime=1300,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_2703Test1;
