within MultiEnergySystem.TestFacility.Simulations.Sequences.Networks.Centralised;
model Seq_2401_Test1 "Sequence 1 done on 24/01/24"
  extends Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_A(
    P101omega = [0, 2*pi*30; 1e6, 2*pi*30],
    P901omega = [0, 2*pi*36.4; 1.6e3, 2*pi*36.4; 1.6e3, 2*pi*34.6; 3.52e3, 2*pi*34.6; 3.52e3, 2*pi*30; 11.68e3, 2*pi*30; 11.68e3, 2*pi*35; 1e6, 2*pi*35],
    FCV101theta = [0, 0.6; 3.52e3, 0.6; 3.52e3, 1; 1e6, 1],
    FCV901theta = [0, 1; 1e6, 1],
    FCVC01theta = [0, 0.2; 1.6e3, 0.2; 1.6e3, 0; 1e6, 0],
    FCVC02theta = [0, 0; 1.6e3, 0; 1.6e3, 0.25; 2.52e3, 0.25; 2.52e3, 0.5; 4.96e3, 0.5; 4.96e3, 0.25; 1e6, 0.25],
    FCV701theta = [0, 0.7361; 1e6, 0.7361],
    FCV711theta = [0, 0.8267; 1e6, 0.8267],
    FCV721theta = [0, 0.9241; 1e6, 0.9241],
    FCV731theta = [0, 0.9; 1e6, 0.9],
    EX701q_m3h_cold = [0, 1.2918; 1e6, 1.2918],
    EX711q_m3h_cold = [0, 1.5267; 1e6, 1.5267],
    EX721q_m3h_cold = [0, 1.0565; 1e6, 1.0565],
    EX731q_m3h_cold = [0, 1.1762; 1e6, 1.1762],
    EX701_Tin_hot = 60 + 273.15,
    EX711_Tin_hot = 60 + 273.15,
    EX721_Tin_hot = 60 + 273.15,
    EX731_Tin_hot = 60 + 273.15,
    EX701_Tin_cold = 25 + 273.15,
    EX711_Tin_cold = 25 + 273.15,
    EX721_Tin_cold = 25 + 273.15,
    EX731_Tin_cold = 25 + 273.15,
    EX701_TinCold = [0, 25+273.15; 1e6, 25+273.15],
    EX711_TinCold = [0, 25+273.15; 1e6, 25+273.15],
    EX721_TinCold = [0, 25+273.15; 1e6, 25+273.15],
    EX731_TinCold = [0, 25+273.15; 1e6, 25+273.15],
    FCV901(Kv=20, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot),
    Tout_start_S9 = 41.87 + 273.15,
    T_start_hot = 41.87 + 273.15,
    GB101(Tout_start=315.02, initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState),
    FCVC02(Kv=25),
    FCV101(Kv=20),
    FCVC01(Kv=25),
    VE901(p0=180000));
    //FCV731theta = [0, 0.5; 800, 0.5; 805, 0.85; 1e6, 0.85],
    //FCV731theta = [0, 0.7222; 1e6, 0.7222],

//     FCV701theta = [0, 0.1; 800, 0.1; 810, 0.7361; 1e6, 0.7361],
//     FCV711theta = [0, 0.1; 800, 0.1; 810, 0.8267; 1e6, 0.8267],
//     FCV721theta = [0, 0.1; 800, 0.1; 810, 0.9241; 1e6, 0.9241],
//     FCV731theta = [0, 0.1; 800, 0.1; 810, 0.7222; 1e6, 0.7222],

  annotation (experiment(StopTime=13100, __Dymola_Algorithm="Dassl"));
end Seq_2401_Test1;