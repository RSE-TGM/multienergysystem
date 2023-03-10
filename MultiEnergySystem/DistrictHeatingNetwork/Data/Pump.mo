within MultiEnergySystem.DistrictHeatingNetwork.Data;
record Pump
  String Name "Name of the pump";
  Modelica.Units.SI.Temperature Tin "Nominal Inlet Temperature";
  Modelica.Units.SI.Temperature Tout "Nominal Outlet Temperature";
  Modelica.Units.SI.Pressure pin "Nominal Inlet Pressure";
  Modelica.Units.SI.Pressure dp "Nomimal difference pressure";
  Modelica.Units.SI.Pressure pout = pin + dp "Nominal Outlet pressure";
  Modelica.Units.SI.SpecificEnthalpy hin "Nominal inlet Specific Enthalpy";
  Modelica.Units.SI.SpecificEnthalpy hout "Nominal outlet specific Enthalpy";
  Modelica.Units.SI.Density rho "Density at the inlet";
  Modelica.Units.SI.VolumeFlowRate q "Volumetric flow rate at the inlet";
  Modelica.Units.SI.MassFlowRate m_flow = q*rho "Mass Flow Rate of the fluid";
  Modelica.Units.SI.AngularVelocity omega "Nominal angular velocity";
  SI.Efficiency eta "Nominal efficiency of the pump";
  SI.Power W "Nominal power";
  Modelica.Units.SI.Efficiency etaelec "Electrical efficiency";
  Modelica.Units.SI.Efficiency etamech "Mechanical efficiency";
  Real a[2] "Power Characteristic coefficients";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  Documentation(info = "<html><head></head><body>Record class including main variables to describe the different pumps of the RSE heating network.</body></html>"));
end Pump;
