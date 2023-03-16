within MultiEnergySystem.GasFacility.Interfaces;
connector FluidPort "Generic fluid port"
  Modelica.Units.SI.Pressure p "Absolute pressure";
  flow Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate";
  stream Modelica.Units.SI.SpecificEnthalpy h_out "Outgoing specific enthalpy";
end FluidPort;
