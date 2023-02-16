within MultiEnergySystem.DistrictHeatingNetwork.Media;
model AccurateValues "Computes accurate values of water properties for reference"
  package Water = Modelica.Media.Water.StandardWater;
  Water.AbsolutePressure p = 5e5;
  Water.Temperature T = 273.15 + 30 + time * (90 - 30);
  Water.ThermodynamicState state = Water.setState_pT(p, T);
  Water.Density rho = Water.density(state);
  Modelica.Units.SI.SpecificHeatCapacity cp = Water.specificHeatCapacityCp(state);
end AccurateValues;
