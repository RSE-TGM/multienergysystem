within MultiEnergySystem.DistrictHeatingNetwork.Data;
package PumpData
  "Data of the different models of pump in Heating Nework"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P7(
    Name = "P7",
    Tin = 25+273.15,
    Tout = 26 + 273.15,
    pin = 1e5,
    dp = W*eta/q,
    hin = 0.105e6,
    q = 0.0021,
    rho = 997,
    omega = 1450,
    W = 0.21e3,
    etaelec = 1,
    etamech = 1);
    
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P101(
    Name = "P101",
    Tin = 80 + 273.15,
    Tout = 90 + 273.15,
    pin = 5e5,
    dp = 1e5,
    hin = 0.105e6,
    q = 15.25/3600,
    rho = 997.2,
    omega = 1450,
    W = 0.75e3,
    eta = 0.6,
    etaelec = 1,
    etamech = 1);
end PumpData;
