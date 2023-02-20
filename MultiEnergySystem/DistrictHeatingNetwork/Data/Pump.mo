within MultiEnergySystem.DistrictHeatingNetwork.Data;
record Pump
  String Name "Name of the pump";
  Modelica.Units.SI.Temperature Tin "Nominal Inlet Temperature";
  Modelica.Units.SI.Temperature Tout "Nominal Outlet Temperature";
  Modelica.Units.SI.Pressure pin "Nominal Inlet Pressure";
  Modelica.Units.SI.Pressure pout "Nominal Outlet pressure";
  Modelica.Units.SI.Pressure dp = pout - pin "Nomimal difference pressure";
  Modelica.Units.SI.SpecificEnthalpy hin "Nominal inlet Specific Enthalpy";
  Modelica.Units.SI.SpecificEnthalpy hout "Nominal outlet specific Enthalpy";
  Modelica.Units.SI.Density rho "Density";
  Modelica.Units.SI.MassFlowRate w "Mass Flow Rate of the gas";
  Modelica.Units.SI.AngularVelocity omega "Nominal angular velocity";
  Modelica.Units.SI.Efficiency etaelec "Electrical efficiency";
  Modelica.Units.SI.Efficiency etamech "Mechanical efficiency";
  Real a[2] "Power Characteristic coefficients";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Pump;
