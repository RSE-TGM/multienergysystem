within MultiEnergySystem.DistrictHeatingNetwork.Data;

record BPHeatExchanger
  String Name "Name of the HX";
  String ReferenceLocation "Information about the location in the system";
  Integer nPlates "Number of plates in BPHE";
  SI.Density rhoin_nom_hot "Nominal density of inlet fluid in hot side";
  SI.Density rhoout_nom_hot "Nominal density of outlet fluid in hot side";
  SI.Density rhoin_nom_cold "Nominal density of inlet fluid in cold side";
  SI.Density rhoout_nom_cold "Nominal density of outlet fluid in cold side";
  Real q_nom_hot(unit = "m3/h") "Nominal volumetric flow rate in the hot side";
  Real q_nom_cold(unit = "m3/h") "Nominal volumetric flow rate in the cold side";
  SI.Velocity u_nom_hot "Nominal fluid velocity in hot side";
  SI.Velocity u_nom_cold "Nominal fluid velocity in cold side"; 
  SI.MassFlowRate m_flow_start_hot = (q_nom_hot/3600)*((rhoin_nom_hot+rhoout_nom_hot)/2) "Nominal mass flow rate in the hot side";
  SI.MassFlowRate m_flow_start_cold = (q_nom_cold/3600)*((rhoin_nom_cold+rhoout_nom_cold)/2) "Nominal mass flow rate in the cold side";
  SI.Pressure pin_start_hot "Nominal inlet pressure in the hot side";
  SI.Pressure pin_start_cold "Nominal inlet pressure in the cold side";
  SI.Pressure dp_nom_hot "Nominal delta pressure in the hot side";
  SI.Pressure dp_nom_cold "Nominal delta pressure in the cold side";
  SI.Pressure pout_start_hot = pin_start_hot - dp_nom_hot "Nominal outlet pressure in the hot side";
  SI.Pressure pout_start_cold = pin_start_cold - dp_nom_cold "Nominal outlet pressure in the cold side";
  SI.Temperature Tin_start_hot "Nominal inlet temperature in the hot side";
  SI.Temperature Tout_start_hot "Nominal outlet temperature in the hot side";
  SI.Temperature Tin_start_cold "Nominal inlet temperature in the cold side";
  SI.Temperature Tout_start_cold "Nominal outlet temperature in the cold side";
  SI.SpecificEnthalpy hin_start_hot = 4185*Tin_start_hot "Nominal inlet specific enthalpy in the hot side";
  SI.SpecificEnthalpy hin_start_cold = 4185*Tin_start_cold "Nominal inlet specific enthalpy in the cold side"; 
  SI.Length L_hot "Length of the tube in the hot side";
  SI.Length L_cold "Length of the tube in the cold side";
  SI.Length h_hot "Height of the tube in the hot side";
  SI.Length h_cold "Height of the tube in the cold side";
  SI.Length dWall_hot "Thickness of the tube in the hot side";
  SI.Length dWall_cold "Thickness of the tube in the cold side";
  SI.Mass MWall "Mass of the wall (exchange surface";
  SI.Length Di_hot "Internal diameter of a single tube in the hot side";
  SI.Length Di_cold "Internal diameter of a single tube in the cold side";
  SI.Area Stot_hot "Exchange area in the hot side";
  SI.Area Stot_cold = Stot_hot "Exchage are in the cold side";
  Integer nPipes_hot "Number of parallel pipes in the hot side";
  Integer nPipes_cold "Number of parallel pipes in the cold side";
  Real k_hot(unit = "Pa/(kg/s)") = (pin_start_hot - pout_start_hot)/m_flow_start_hot "Pressure loss coefficient in the hot side";
  Real k_cold(unit = "Pa/(kg/s)") = (pin_start_cold - pout_start_cold)/m_flow_start_cold  "Pressure loss coefficient in the cold side";
  SI.CoefficientOfHeatTransfer gamma_nom_hot = 2*Unom "Nominal heat transfer coefficient hot side";
  SI.CoefficientOfHeatTransfer gamma_nom_cold = gamma_nom_hot "Nominal heat transfer coefficient cold side";
  SI.SpecificHeatCapacity cpm_hot "Nominal specific heat capacity of the metal hot side";
  SI.SpecificHeatCapacity cpm_cold "Nominal specific heat capacity of the metal cold side";
  SI.Density rhom_hot "Nominal density of metal hot side";
  SI.Density rhom_cold "Nominal density of metal cold side";
  SI.ThermalConductivity lambdam_hot "Nominal thermal conductivity of metal hot side";
  SI.ThermalConductivity lambdam_cold "Nominal thermal conductivity of metal cold side";
  Real Rfoul(unit = "m2.K/W") "Fouling resistance";
  SI.Power Qnom;
  SI.Temperature LMTD = ((Tout_start_hot - Tin_start_cold)-(Tin_start_hot-Tout_start_cold))/log((Tout_start_hot - Tin_start_cold)/(Tin_start_hot-Tout_start_cold));
  SI.CoefficientOfHeatTransfer Unom = Qnom/(Stot_hot*LMTD);
end BPHeatExchanger;