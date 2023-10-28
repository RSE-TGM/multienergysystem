within MultiEnergySystem.DistrictHeatingNetwork.Data;
package PumpData
  "Data of the different models of pump in Heating Nework"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P7(
    Name = "P7",
    Tin_start = 25+273.15,
    Tout_start = 26 + 273.15,
    pin_start = 1e5,
    hin_start = 0.105e6,
    qnom = 0.0021,
    rhonom = 997,
    etanom = 0.63,
    omeganom = 2*3.14159*1450/60,
    Wnom = 0.21e3,
    etaelec = 1,
    etamech = 1,
    a = {338.084416, 36.357516, -0.623066},
    b = {12.235634, 0.250802, -0.023149});

    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P101(
    Name = "P101",
    Tin_start = 80 + 273.15,
    Tout_start = 85 + 273.15,
    pin_start = 3e5,
    hin_start = 0.105e6,
    qnom = 15.60340167/3600,
    rhonom = 971.892,
    omeganom = 2*3.14159*1450/60,
    headnom = 10.875,
    Wnom = 0.749e3,
    etanom = 0.6,
    etaelec = 1,
    etamech = 1,
    a = {338.084416, 36.357516, -0.623066},
    b = {12.235634, 0.250802, -0.023149});

    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P201(
    Name = "P201",
    Tin_start = 45 + 273.15,
    Tout_start = 45.5 + 273.15,
    pin_start = 3e5,
    hin_start = 0.105e6,
    qnom = 16.5/3600,
    rhonom = 990.198,
    headnom = 12.5,
    omeganom = 2*3.14159*1450/60,
    Wnom = 0.89e3,
    etanom = 0.63,
    etaelec = 1,
    etamech = 1,
    a = {388.549620, 131794.193604, -4853678.406628},
    b = {14.230465,650.687103,-229082.650277});

    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P601(
    Name = "P601",
    Tin_start = 45 + 273.15,
    Tout_start = 45.5 + 273.15,
    pin_start = 3e5,
    hin_start = 0.105e6,
    qnom = 16.5/3600,
    rhonom = 990.198,
    omeganom = 2*3.14159*1450/60,
    Wnom = 0.89e3,
    etanom = 0.63,
    etaelec = 1,
    etamech = 1,
    a = {388.549620, 131794.193604, -4853678.406628},
    b = {14.230465,650.687103,-229082.650277});

    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump PR01(
    Name = "PR01",
    Tin_start = 15 + 273.15,
    Tout_start = 17 + 273.15,
    pin_start = 2e5,
    hin_start = 0.105021e6,
    qnom = 32.34652403/3600,
    rhonom = 999.147,
    omeganom = 2*3.14159*2900/60,
    headnom = 27.5,
    Wnom = 3.51e3,
    etanom = 0.69,
    etaelec = 1,
    etamech = 1,
    a = {1139.365534, 128.328267, -1.759478},
    b = {31.670260, 0.358044, -0.015408});

end PumpData;
