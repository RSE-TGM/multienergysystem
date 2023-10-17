within MultiEnergySystem.DistrictHeatingNetwork.Data;
record Pump
  String Name "Name of the pump";
  Modelica.Units.SI.Temperature Tin_start "Nominal Inlet Temperature";
  Modelica.Units.SI.Temperature Tout_start "Nominal Outlet Temperature";
  Modelica.Units.SI.Pressure pin_start "Nominal Inlet Pressure";
  Modelica.Units.SI.VolumeFlowRate qnom=Wnom*etanom/dpnom "Volumetric flow rate at the inlet";
  SI.Efficiency etanom "Nominal efficiency of the pump";
  SI.Power Wnom "Nominal power";
  Modelica.Units.SI.Pressure dpnom = headnom*rhonom*9.81 "Nomimal difference pressure";
  Modelica.Units.SI.Pressure pout_start = pin_start + dpnom "Nominal Outlet pressure";
  Modelica.Units.SI.SpecificEnthalpy hin_start "Nominal inlet Specific Enthalpy";
  Modelica.Units.SI.SpecificEnthalpy hout_start "Nominal outlet specific Enthalpy";
  Modelica.Units.SI.Density rhonom "Density at the inlet";
  Modelica.Units.SI.MassFlowRate m_flow_nom = qnom*rhonom "Mass Flow Rate of the fluid";
  Modelica.Units.SI.AngularVelocity omeganom "Nominal angular velocity"; 
  Modelica.Units.SI.Efficiency etaelec "Electrical efficiency";
  Modelica.Units.SI.Efficiency etamech "Mechanical efficiency";
  Modelica.Units.SI.Length headnom "Head";
  Real a[3] "Power Characteristic coefficients";
  Real b[3] "Head Characteristic coefficients";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  Documentation(info = "<html><head></head><body>Record class including main variables to describe the different pumps of the RSE heating network.</body></html>"));
end Pump;
