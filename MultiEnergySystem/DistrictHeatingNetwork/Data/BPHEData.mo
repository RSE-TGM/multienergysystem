within MultiEnergySystem.DistrictHeatingNetwork.Data;

package BPHEData  
   "Data of the different models of BPHE in Heating NeTwork"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.BPHeatExchanger E301(
    Name = "E301",
    ReferenceLocation = "After heat pump HP301",
    nPlates = 80,
    rhoin_nom_hot = 995.03,
    rhoout_nom_hot = 996.01,
    rhoin_nom_cold = 997.44,
    rhoout_nom_cold = 995.97,
    q_nom_hot = 15.5,
    q_nom_cold = 9.65,
    u_nom_hot = 6.09,
    u_nom_cold = 6.46,
    pin_start_hot = 2e5,
    pin_start_cold = 2e5,
    dp_nom_hot = 42.6e3,
    dp_nom_cold = 28.9e3,
    Tin_start_hot = 28 + 273.15,
    Tout_start_hot = 24.9 + 273.15,
    Tin_start_cold = 20 + 273.15,
    Tout_start_cold = 25 + 273.15,
    L_hot = 5.765,
    L_cold = 9.6351,
    h_hot = 0,
    h_cold = 0,
    dWall_hot = 0.001,
    dWall_cold = 0.001,
    Di_hot = 0.03,
    Di_cold = 0.023,
    Stot_hot = 4.5,
    nPipes_hot = 1,
    nPipes_cold = 1,
    cpm_hot = 500,
    cpm_cold = 500,
    rhom_hot = 8000,
    rhom_cold = 8000,
    lambdam_hot = 16.3,
    lambdam_cold = 16.3,
    Rfoul = 1.4e-4,
    Qnom = 56e3,
    MWall = 16.8
  );

    constant MultiEnergySystem.DistrictHeatingNetwork.Data.BPHeatExchanger E501(
    Name = "E501",
    ReferenceLocation = "Before the Combined Heat Power Cogeneratore",
    nPlates = 40,
    rhoin_nom_hot = 971.50,
    rhoout_nom_hot = 981.20,
    rhoin_nom_cold = 983.13,
    rhoout_nom_cold = 979.29,
    q_nom_hot = 3.94,
    q_nom_cold = 9,
    u_nom_hot = 1.55,
    u_nom_cold = 6.04,
    pin_start_hot = 20e5,
    pin_start_cold = 30e5,
    dp_nom_hot = 7.4e3,
    dp_nom_cold = 48.5e3,
    Tin_start_hot = 80 + 273.15,
    Tout_start_hot = 62 + 273.15,
    Tin_start_cold = 58 + 273.15,
    Tout_start_cold = 65.8 + 273.15,
    L_hot = 2.974,
    L_cold = 4.835,
    h_hot = 0,
    h_cold = 0,
    dWall_hot = 0.001,
    dWall_cold = 0.001,
    Di_hot = 0.03,
    Di_cold = 0.023,
    Stot_hot = 2.2,
    nPipes_hot = 1,
    nPipes_cold = 1,
    cpm_hot = 500,
    cpm_cold = 500,
    rhom_hot = 8000,
    rhom_cold = 8000,
    lambdam_hot = 16.3,
    lambdam_cold = 16.3,
    Rfoul = 0.8e-4,
    Qnom = 80e3,
    MWall = 9.8
  );  
  
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.BPHeatExchanger E601(
    Name = "E601",
    ReferenceLocation = "After heat pump HP601",
    nPlates = 80,
    rhoin_nom_hot = 998.25,
    rhoout_nom_hot = 998.84,
    rhoin_nom_cold = 1000.64,
    rhoout_nom_cold = 999.02,
    q_nom_hot = 15,
    q_nom_cold = 4.89,
    u_nom_hot = 5.89,
    u_nom_cold = 3.28,
    pin_start_hot = 2e5,
    pin_start_cold = 2e5,
    dp_nom_hot = 40.9e3,
    dp_nom_cold = 7.8e3,
    Tin_start_hot = 17 + 273.15,
    Tout_start_hot = 14.7 + 273.15,
    Tin_start_cold = 7 + 273.15,
    Tout_start_cold = 14 + 273.15,
    L_hot = 2.974,
    L_cold = 4.835,
    Di_hot = 0.03,
    Di_cold = 0.023,
    h_hot = 0,
    h_cold = 0,
    dWall_hot = 0.001,
    dWall_cold = 0.001,
    Stot_hot = 4.5,
    nPipes_hot = 1,
    nPipes_cold = 1,
    cpm_hot = 500,
    cpm_cold = 500,
    rhom_hot = 8000,
    rhom_cold = 8000,
    lambdam_hot = 16.3,
    lambdam_cold = 16.3,
    Rfoul = 3.3e-4,
    Qnom = 40e3,
    MWall = 16.8
  );    
  
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.BPHeatExchanger E701(
    Name = "E701",
    ReferenceLocation = "After heat pump HP601",
    nPlates = 18,
    rhoin_nom_hot = 971.50,
    rhoout_nom_hot = 982.18,
    rhoin_nom_cold = 1000.64,
    rhoout_nom_cold = 998.63,
    q_nom_hot = 2.22,
    q_nom_cold = 5,
    u_nom_hot = 0.87,
    u_nom_cold = 3.35,
    pin_start_hot = 2e5,
    pin_start_cold = 2e5,
    dp_nom_hot = 2.5e3,
    dp_nom_cold = 19.3e3,
    Tin_start_hot = 80 + 273.15,
    Tout_start_hot = 60 + 273.15,
    Tin_start_cold = 7 + 273.15,
    Tout_start_cold = 15.6 + 273.15,
    L_hot = 0.7073,
    L_cold = 0.96275,
    Di_hot = 0.03,
    Di_cold = 0.023,
    h_hot = 0,
    h_cold = 0,
    dWall_hot = 0.001,
    dWall_cold = 0.001,
    Stot_hot = 0.5,
    nPipes_hot = 1,
    nPipes_cold = 1,
    cpm_hot = 500,
    cpm_cold = 500,
    rhom_hot = 8000,
    rhom_cold = 8000,
    lambdam_hot = 16.3,
    lambdam_cold = 16.3,
    Rfoul = 2.8e-4,
    Qnom = 50e3,
    MWall = 3.9
  );   
end BPHEData;