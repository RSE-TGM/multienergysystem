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
    eta = 0.63,
    omeganom = 2*3.14159*1450/60,
    W = 0.21e3,
    etaelec = 1,
    etamech = 1,
    a = {338.084416, 130887.059346, -8074937.668508},
    b = {7.38557689, 617.03274734, -545218.57934041});
    
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P101(
    Name = "P101",
    Tin_start = 80 + 273.15,
    Tout_start = 85 + 273.15,
    pin_start = 3e5,
    hin_start = 0.105e6,
    qnom = 15.25/3600,
    rhonom = 997.2,
    omeganom = 2*3.14159*1450/60,
    W = 0.75e3,
    eta = 0.6,
    etaelec = 1,
    etamech = 1,
    a = {338.084416, 130887.059346, -8074937.668508}, 
    b = {12.235634, 902.886310, -300017.452735});
    
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P201(
    Name = "P201",
    Tin_start = 45 + 273.15,
    Tout_start = 45.5 + 273.15,
    pin_start = 3e5,
    hin_start = 0.105e6,
    qnom = 16.5/3600,
    rhonom = 990.198,
    omeganom = 2*3.14159*1450/60,
    W = 0.89e3,
    eta = 0.63,
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
    W = 0.89e3,
    eta = 0.63,
    etaelec = 1,
    etamech = 1,
    a = {388.549620, 131794.193604, -4853678.406628}, 
    b = {14.230465,650.687103,-229082.650277});    
    
end PumpData;
