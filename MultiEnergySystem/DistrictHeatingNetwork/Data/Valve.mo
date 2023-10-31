within MultiEnergySystem.DistrictHeatingNetwork.Data;
record Valve
  String Name "Name of the valve";
  Modelica.Units.SI.Temperature Tin_start "Nominal Inlet Temperature";
  Modelica.Units.SI.Pressure pin_start "Nominal Inlet Pressure";
  Real Kv(unit = "m3/h") "Metri Flow Coefficient";
  Real qnom_inm3h(unit = "m3/h") "Nominal volumetric flowrate in m3/h ";
  Modelica.Units.SI.VolumeFlowRate qnom = qnom_inm3h/3600 "Nominal Volumetric flow rate at the inlet";
  Modelica.Units.SI.Pressure dp_nom "Nomimal difference pressure";
  Modelica.Units.SI.Density rho_nom "Density at the inlet";
  Modelica.Units.SI.MassFlowRate m_flow_nom = qnom*rhonom "Mass Flow Rate of the fluid";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  Documentation(info = "<html><head></head><body>Record class including main variables to describe the different pumps of the RSE heating network.</body></html>"));
end Valve;
