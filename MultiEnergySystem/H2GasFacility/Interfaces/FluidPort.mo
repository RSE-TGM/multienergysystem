within MultiEnergySystem.H2GasFacility.Interfaces;

connector FluidPort "Generic fluid port"
  parameter Integer nXi "Number of chemical species nX - 1";
  Types.Pressure p "Absolute pressure";
  flow Types.MassFlowRate m_flow "Mass flow rate";
  stream Types.SpecificEnthalpy h_out "Outgoing specific enthalpy";
  stream Types.MassFraction Xi[nXi](each min = 0) "Independent mixture mass fractions m_i/m";
end FluidPort;
