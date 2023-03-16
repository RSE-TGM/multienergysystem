within MultiEnergySystem.H2GasFacility.Tests.Media;

model CH4
  extends Modelica.Icons.Example;
  replaceable package Medium = DistrictHeatingNetwork.Media.IdealGases.CH4 "Ideal CH4 fluid";
  parameter Types.Temperature T_min = 15 + 273.15;
  parameter Types.Temperature T_max = 30 + 273.15;
  parameter Types.Pressure p = 0.3e5;
  parameter Types.MassFraction X[2] = {0.8, 0.2};
  constant Real T0(unit = "s") = 1 "Reference value for units";
  Medium.BaseProperties idealGas;
  Types.Temperature T;
  Types.Density d_id;
  Types.SpecificEnergy u_id;
  Types.SpecificHeatCapacity cp_id;
  Types.SpecificHeatCapacity cv_id;
  Types.SpecificEnthalpy h_id;
equation
  T = T_min + (T_max - T_min) * time / T0;
  idealGas.T = T;
  idealGas.p = p;
  d_id = idealGas.d;
  u_id = idealGas.u;
  cp_id = Medium.specificHeatCapacityCp(idealGas.state);
  cv_id = Medium.specificHeatCapacityCv(idealGas.state);
  h_id = Medium.specificEnthalpy(idealGas.state);
annotation(
    Documentation(info = "<html><head></head><body><h4>Test Model for pure ideal CH4</h4><div>The fluid model is taken from the MSL and the nominal data is consideren from the following .pdf file:</div><div><br></div><div>22007170_SpecTecApp_Progettazione impianti idrogeno_VM.pdf</div><div><br></div><div><ul><li>Linee circuito gas naturale</li><li>Fluido: gas naturale di rete</li><li>Pressione alla radice: 0.3 barg</li><li>Pressione massima: 0.3 barg</li><li>Temperatura: ambiente</li><li>Portata massima: 25 Nm3/h</li><li>Potenza max combustibile: 250 kW</li></ul></div></body></html>"));
end CH4;
