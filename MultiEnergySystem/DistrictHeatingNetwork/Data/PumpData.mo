within MultiEnergySystem.DistrictHeatingNetwork.Data;
package PumpData
  "Data of the different models of pump in Heating Nework"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.Pump P7(
    Name = "P7",
    Tin = 25+273.15,
    Tout = 26 + 273.15,
    pin = 1e5,
    pout = 1.615e5,
    hin = 0.105e6,
    rho = 997,
    w = 2.08,
    omega = 1450,
    etaelec = 1,
    etamech = 1);
end PumpData;
