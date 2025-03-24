within MultiEnergySystem.TestFacility.Data;
record Valve
  String Name "Name of the valve";
  Modelica.Units.SI.Temperature Tin_nom "Nominal inlet temperature";
  Real q_nom_m3h(unit = "m3/h") "Nominal volumetric flowrate in m3/h ";
  Modelica.Units.SI.VolumeFlowRate q_nom = q_nom_m3h/3600 "Nominal Volumetric flow rate at the inlet";
  Modelica.Units.SI.PressureDifference dp_nom "Nomimal difference pressure";
  Modelica.Units.SI.Density rho_nom "Density at the inlet";
  Modelica.Units.SI.MassFlowRate m_flow_nom = q_nom*rho_nom "Mass Flow Rate of the fluid";
  Real Kv(unit = "m3/h") "Metri Flow Coefficient";
  Modelica.Units.SI.Temperature Tin_start "Start value for Inlet Temperature";
  Modelica.Units.SI.Pressure pin_start "Nominal Inlet Pressure";
  MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar "Opening characteristic";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  Documentation(info = "<html><head></head><body>Record class including main variables to describe the different pumps of the RSE heating network.</body></html>"));
end Valve;
