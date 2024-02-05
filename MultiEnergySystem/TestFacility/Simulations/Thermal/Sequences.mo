within MultiEnergySystem.TestFacility.Simulations.Thermal;
package Sequences

  package Networks
    package Centralised
      model Seq_2401_Test1 "Sequence 1 done on 24/01/24"
        extends Thermal.Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_A(
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

        annotation (experiment(StopTime=13100, __Dymola_Algorithm="Dassl"));
      end Seq_2401_Test1;

      model Seq_0412_Test2 "Sequence 2 done on 04/12/23"
        extends Thermal.Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_B(
          TT703_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          TT713_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          TT723_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          TT733_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          FT703_mflow(table=kq*[0,1.32*998/3600; 1e6,1.32*998/3600]),
          FT713_mflow(table=kq*[0,1.6193*998/3600; 1e6,1.6193*998/3600]),
          FT723_mflow(table=kq*[0,1.1859*998/3600; 1e6,1.1859*998/3600]),
          FT733_mflow(table=kq*[0,1.3281*998/3600; 1e6,1.3281*998/3600]),
          EX701_Tin_hot = T_start_hot,
          EX711_Tin_hot = T_start_hot,
          EX721_Tin_hot = T_start_hot,
          EX731_Tin_hot = T_start_hot,
          EX701_Tout_hot = T_start_hot-20,
          EX711_Tout_hot = T_start_hot-20,
          EX721_Tout_hot = T_start_hot-20,
          EX731_Tout_hot = T_start_hot-20,
          EX701_q_m3h_hot = 0.62,
          EX701_Tin_cold = 16.5 + 273.15,
          EX711_Tin_cold = 16.5 + 273.15,
          EX721_Tin_cold = 16.5 + 273.15,
          EX731_Tin_cold = 16.5 + 273.15,
          FCVC01theta = [0, 0;  338, 0; 338, 0; 1e6, 0],
          FCVC02theta = [0, 1; 1e6, 1],
          FCV101theta = [0, 0.8; 0.27e4, 0.8; 0.27e4, 0.7; 0.28e4, 0.7; 0.28e4, 0.6; 0.305e4, 0.6; 0.305e4, 0.5; 0.7740e4, 0.5; 0.7740e4, 1; 0.7761e4, 1; 0.7761e4, 0.8; 0.807e4, 0.8; 0.807e4, 1; 1e6, 1],
          FCV401theta = [0, 0.1; 1e6, 0.1],
          FCV901theta = [0, 0.4; 1e6, 0.4],
          FCV701theta = [0, 0.59; 334, 0.59; 438, 1; 480, 1; 815, 0.59; 3511, 0.66; 4973, 0.66; 6866, 0.56; 8000, 0.56; 10000, 0.69; 1e6, 0.69],
          FCV711theta = [0, 0.73; 442, 0.73; 442, 1; 482, 1; 890, 0.68; 1018, 0.68; 1724, 0.78; 2665, 0.78; 3390, 0.66; 3689, 0.66; 4013, 0.78; 4372, 0.78; 6272, 0.65; 6400, 0.65; 6875, 0.77; 7024, 0.77;  7264, 0.74; 7798, 0.74; 8517, 0.8; 8658, 0.8; 9071, 0.65; 9138, 0.65; 9452, 0.78; 9689, 0.78; 9689, 0.79; 1e6, 0.79],
          FCV721theta = [0, 0.75; 442, 0.75; 442, 1; 890, 1; 1848, 0.79; 4505, 0.79; 7250, 0.96; 9538, 0.78; 1e6, 0.78],
          FCV731theta = [0, 0.9; 0.041e4, 0.9; 0.041e4, 1; 0.3684e4, 1; 0.5e4, 0.92; 1e6, 0.92],
          VE901(p0=1.76e5),
          Tout_start_S9 = 72 + 273.15,
          T_start_hot = 72 + 273.15,
          FCV901(Kv=20),
          GB101(Tout_start=346.15, initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState),
          EB401(
            Tout_start=342.15,
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
                                    nR=4),
          FCVC01(Tin_start=T_start_hot),
          VER3(T0=EX701_Tin_cold),
          VER2(T0=EX731_Tin_cold),
          VER1(T0=EX711_Tin_cold),
          VER901(T0=EX721_Tin_cold),
          FCV101(Kv=20),
          EB401_Status(table={537,768,2271,2500}),
          rackL6L7_FCVC02_cold(h=-h_rL6L7_FCVC02_H*0.5),
          FCVC02(Kv=25));
          //FCV701theta = [0, 0.6269; 1e6, 0.6269],
        parameter Real kq = 3.5;
        annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
      end Seq_0412_Test2;

    end Centralised;
  end Networks;
end Sequences;
