within MultiEnergySystem.H2GasFacility.Data;
record FuelHeatingValues
  Real LHV_SCM(each unit = "J/m3") "Lower Heating Value of each component in J/Sm3 units T = 15°C, p = 1.01325 bar";
  Real HHV_SCM(each unit = "J/m3") "Higher Heating Value of each component in J/Sm3 units T = 15°C, p = 1.01325 bar";
  Real LHV(each unit = "J/kg") "Lower Heating Value of each component in J/kg units";
  Real HHV(each unit = "J/kg") "Higher Heating Value of each component in J/kg units";
end FuelHeatingValues;
