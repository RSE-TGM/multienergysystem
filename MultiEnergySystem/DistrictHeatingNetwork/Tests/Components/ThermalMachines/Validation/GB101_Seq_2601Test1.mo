within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines.Validation;
model GB101_Seq_2601Test1
  extends GB101_Seq_0412Test3(
    Data = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2601_Test1/Temperatures.mat"));
  annotation (experiment(
      StopTime=7000,
      Interval=0.5,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GB101_Seq_2601Test1;
