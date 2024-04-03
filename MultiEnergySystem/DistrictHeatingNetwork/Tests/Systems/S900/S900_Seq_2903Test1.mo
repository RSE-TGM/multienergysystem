within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S900;
model S900_Seq_2903Test1
  extends S900_Test(
    T_sampling = 2,
    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2903_Test1/Temperatures.mat"),
    FCV901(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot),
    P901(correctionfactor=correctionfactor),
    PL4_S901(h=h1),
    rackCD_Hot_S200_S900(h=h2));
  parameter Real h1 = 0;
  parameter Real h2 = 0;
  parameter Real correctionfactor = 1;
                                                                                                                                                                                                          annotation (experiment(
      StopTime=3500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S900_Seq_2903Test1;
