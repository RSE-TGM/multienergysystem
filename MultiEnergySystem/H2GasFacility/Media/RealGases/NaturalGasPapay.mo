within MultiEnergySystem.H2GasFacility.Media.RealGases;

model NaturalGasPapay "Natural Gas using PR EoS"
  extends MultiEnergySystem.H2GasFacility.Media.BaseClasses.PapayMixture(
      nXi = 8,
      MM_mix_start = Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
      X_start = {0.85306, 0.06486, 0.02058, 0.0028, 0.00437, 0.00099, 0.00063, 0.03882, 0.01268},
      T_start = 100+273.15,
      posDom = 1,
      w =   {Modelica.Media.IdealGases.Common.FluidData.CH4.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.C2H6.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.C3H8.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.acentricFactor,
             0.183531783208,
             Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.acentricFactor,
             0.2274,
             Modelica.Media.IdealGases.Common.FluidData.CO2.acentricFactor,
             Modelica.Media.IdealGases.Common.FluidData.N2.acentricFactor},
      MM =  {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C2H6.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C3H8.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_n_butane.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_isobutane.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C5H12_n_pentane.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.C5H12_i_pentane.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.CO2.MM,
             Modelica.Media.IdealGases.Common.SingleGasesData.N2.MM},
      p_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.CO2.criticalPressure,
             Modelica.Media.IdealGases.Common.FluidData.N2.criticalPressure},
      T_c = {Modelica.Media.IdealGases.Common.FluidData.CH4.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.CO2.criticalTemperature,
             Modelica.Media.IdealGases.Common.FluidData.N2.criticalTemperature},
      v_c = { Modelica.Media.IdealGases.Common.FluidData.CH4.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C2H6.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C3H8.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.C5H12_n_pentane.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.CO2.criticalMolarVolume,
              Modelica.Media.IdealGases.Common.FluidData.N2.criticalMolarVolume},
      delta=
            
         {{ 0.00000,  -0.00260, 	0.01400,   0.01330,	0.02560,   0.02300,-0.00560,   0.09190,	0.03110},
         { -0.00260,   0.00000, 	0.00110,   0.00960,-0.00670,   0.00780,	0.00000,   0.13220,	0.05150},
         {  0.01400,   0.00110, 	0.00000,   0.00330,-0.00780,   0.02670,	0.01110,   0.12410,	0.08520},
         {  0.01330,   0.00960, 	0.00330,   0.00000,-0.00040,   0.01740,	0.00292,   0.13330,	0.08000},
         {  0.02560,  -0.00670,    -0.00780,  -0.00040,	0.00000,   0.00000,	0.00000,   0.12000,	0.10330},
         {  0.02300,   0.00780, 	0.02670,   0.01740,	0.00000,   0.00000,	0.00000,   0.12220,	0.10000},
         { -0.00560,   0.00000, 	0.01110,   0.00292,	0.00000,   0.00000,	0.00000,   0.12190,	0.09220},
         {  0.09190,   0.13220, 	0.12410,   0.13330,	0.12000,   0.12220,	0.12190,   0.00000,-0.01700},
         {  0.03110,   0.05150, 	0.08520,   0.08000,	0.10330,   0.10000,	0.09220,  -0.01700,	0.00000}},

            
      Hf = {Modelica.Media.IdealGases.Common.SingleGasesData.CH4.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C2H6.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C3H8.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_n_butane.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_isobutane.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C5H12_n_pentane.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.C5H12_i_pentane.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.CO2.Hf,
            Modelica.Media.IdealGases.Common.SingleGasesData.N2.Hf},
      HHV = {37.669e6, 66.433e6, 95.830e6, 120160e3, 114488.63e3, 148328e3, 148328e3, 0, 0},
      LHV = {50e6, 47.62e6, 46.35e6, 0, 0, 0, 0, 0, 0},
      cp_coeff = {{-5.6776551798464e-07,     0.0004856226884952,     3.5809130457096,     1087.3242540246},
                  {3.9336581603911e-07,     -0.0025939417819359,     6.1606820767477,     115.30876220525},
                  {6.9469559921695e-07,     -0.0034853852149653,     6.8351551007804,    -82.089844972399},
                  {7.1379237407726e-07,     -0.0035119111734142,     6.7355090155386,    -21.590244098504},
                  {7.1379237407726e-07,     -0.0035119111734142,     6.7355090155386,    -21.590244098504},
                  {7.7294141596151e-07,     -0.0037104132127322,     6.9504505844114,    -110.40954291906},
                  {7.7294141596151e-07,     -0.0037104132127322,     6.9504505844114,    -110.40954291906},
                  {2.2131327339673e-07,     -0.00092151007501243,    1.4416059822539,     493.52730053016},
                  {-1.7194266972964e-07,     0.00044985407669627,   -0.16123790188216,    1048.8091727539}},
      mu_start = 0);

end NaturalGasPapay;