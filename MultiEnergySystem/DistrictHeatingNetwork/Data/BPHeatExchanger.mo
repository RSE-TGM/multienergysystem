within MultiEnergySystem.DistrictHeatingNetwork.Data;

record BPHeatExchanger
  String Name "Name of the HX";
  SI.MassFlowRate m_flow_start_hot "Nominal mass flow rate in the hot side";
  SI.MassFlowRate m_flow_start_cold "Nominal mass flow rate in the cold side";
  SI.Pressure pin_start_hot "Nominal inlet pressure in the hot side";
  SI.Pressure pin_start_cold "Nominal inlet pressure in the cold side";
  SI.Pressure pout_start_hot "Nominal outlet pressure in the hot side";
  SI.Pressure pout_start_cold "Nominal outlet pressure in the cold side";
  SI.Temperature Tin_start_hot "Nominal inlet temperature in the hot side";
  SI.Temperature Tout_start_hot "Nominal outlet temperature in the hot side";
  SI.Temperature Tin_start_cold "Nominal inlet temperature in the cold side";
  SI.Temperature Tout_start_cold "Nominal outlet temperature in the cold side";
  SI.SpecificEnthalpy hin_start_hot "Nominal inlet specific enthalpy in the hot side";
  SI.SpecificEnthalpy hout_start_hot "Nominal outlet specific enthalpy in the cold side"; 
  SI.Length L_hot "Length of the tube in the hot side";
  SI.Length L_cold "Length of the tube in the cold side";
  SI.Length h_hot "Height of the tube in the hot side";
  SI.Length h_cold "Height of the tube in the cold side";
  SI.Length dWall_hot "Thickness of the tube in the hot side";
  SI.Length dWall_cold "Thickness of the tube in the cold side";
  SI.Length Di_hot "Internal diameter of a single tube in the hot side";
  SI.Length Di_cold "Internal diameter of a single tube in the cold side";
  SI.Area Stot_hot "Exchange area in the hot side";
  SI.Area Stot_cold "Exchage are in the cold side";
  Integer nPipes_hot "Number of parallel pipes in the hot side";
  Integer nPipes_cold "Number of parallel pipes in the cold side";
  Real k_hot(unit = "Pa/(kg/s)") "Pressure loss coefficient in the hot side";
  Real k_cold(unit = "Pa/(kg/s)") "Pressure loss coefficient in the cold side";
  SI.CoefficientOfHeatTransfer gamma_nom_hot "Nominal heat transfer coefficient hot side";
  SI.CoefficientOfHeatTransfer gamma_nom_cold "Nominal heat transfer coefficient cold side";
  SI.SpecificHeatCapacity cpm_hot "Nominal specific heat capacity of the metal hot side";
  SI.SpecificHeatCapacity cpm_cold "Nominal specific heat capacity of the metal cold side";
  SI.Density rhom_hot "Nominal density of metal hot side";
  SI.Density rhom_cold "Nominal density of metal cold side";
  SI.ThermalConductivity lambdam_hot "Nominal thermal conductivity of metal hot side";
  SI.ThermalConductivity lambdam_cold "Nominal thermal conductivity of metal cold side";
  

end BPHeatExchanger;
