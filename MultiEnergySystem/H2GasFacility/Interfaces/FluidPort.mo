within MultiEnergySystem.H2GasFacility.Interfaces;

connector FluidPort "Generic fluid port"
  parameter Integer nXi "Number of chemical species nX - 1";
  Types.Pressure p "Absolute pressure";
  flow Types.MassFlowRate m_flow "Mass flow rate";
  stream Types.SpecificEnthalpy h_out "Outgoing specific enthalpy";
  stream Types.MassFraction Xi[nXi](each min = 0) "Independent mixture mass fractions m_i/m";annotation(
    Documentation(info = "<html><head></head><body>The fluid port includes:<div><br></div><div><ul><li>01 parameter \"nXi\", defining the number of species \"nX\" minus 1 of the fluid which goes through the connector. Example:&nbsp;</li></ul></div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div>- Mixture of CH4 &amp; H2 : nXi = 1</div><div>- NG composed by CH4, C2H6, C3H8, N2: nXi = 3.</div></blockquote><div><ul><li>01 flow variable m_flow for the mass flow rate going through the connector</li></ul><ul><li>02 stream variables associated with the flow variable m_flow: the first one corresponds to the specific enthalpy h_out and the second one is the mass fraction vector Xi with \"nXi\" components.&nbsp;It is already considered in the fluid models that sum of all mass compositions is equal to 1, which means that the mass composition of the last component is 1 minus the sum of the other ones.</li></ul><div><b>Note</b>: It is important to remark that the parameter \"nXi\" is an input (defines the dimension) of the stream variable \"Xi\", then, it is mandatory to define this parameter every time this connector is used.</div></div></body></html>"));
end FluidPort;
