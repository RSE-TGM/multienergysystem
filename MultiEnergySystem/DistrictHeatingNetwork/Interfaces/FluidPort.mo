within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
connector FluidPort "Generic fluid port"
  Types.Pressure p "Absolute pressure";
  flow Types.MassFlowRate m_flow "Mass flow rate";
  stream Types.SpecificEnthalpy h_out "Outgoing specific enthalpy";
end FluidPort;
