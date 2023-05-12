within MultiEnergySystem.H2GasFacility.Media.BaseClasses;

partial model PartialMixture "Interface for real mixture gas models"
  extends Modelica.Icons.MaterialProperty;
  parameter Boolean computeTransport = true "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = true "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Integer nXi = 0 "Number of independent elements in the mass fraction array that influence fluid properties";
  parameter Integer nX = nXi + 1 "Number of elements in the mass fraction array that influence fluid properties";
  parameter Types.MassFraction Xi_start[nXi] "Start value of the indepentend elements of fluid mass composition";
  parameter Types.Pressure p_start "Start value of the fluid pressure";
  parameter Types.Temperature T_start "Start value of the fluid temperature";
  parameter Types.MassFraction X_start[nX] "Start value of the fluid mass composition";
  //Variables
  connector InputPressure = input Types.Pressure "Pseudo-input to check model balancedness";
  connector InputTemperature = input Types.Temperature "Pseudo-input to check model balancedness";
  connector InputMassFraction = input Types.MassFraction "Pseudo-input to check model balancedness";
  InputPressure p(start = p_start) "Absolute pressure";
  InputTemperature T(start = T_start) "Temperature";
  InputMassFraction Xi[nXi](start = Xi_start) "Independent Mass fraction vector";
  Types.MassFraction X[nX](start = X_start) "Mass fraction vector";
  Types.SpecificEnergy u "Specific Internal Energy";
  Types.SpecificEnthalpy h "Specific Enthalpy";
  Types.SpecificEntropy s "Specific Entropy" annotation(
    HideResult = not ComputeEntropy);
  Types.DerSpecEnergyByPressure du_dp "Pressure derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByTemperature du_dT "Temperature derivative of the Specific Internal Energy";
  Types.SpecificEnergy du_dX[nX] "Mass fraction derivative of Specific Internal Energy at constant pressure vector";
  Types.SpecificHeatCapacity cp "Specific heat capacity of the fluid at constant pressure";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid at constant volume";
  Types.DerSpecificVolumeByPressure dv_dp "Pressure derivative of specific volume at constant Temperature";
  Types.DerSpecificVolumeByTemperature dv_dT "Temperature derivative of specific volume at constant pressure";
  Types.SpecificVolume dv_dX[nX] "Mass fraction derivative of specific volume, per each component";
  Types.DynamicViscosity mu "Dynamic viscosity" annotation(
    HideResult = not ComputeTransport);
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  Types.Density rho "Density";
  annotation(
    Documentation(info = "<html><head></head><body><p><b><span style=\"font-size: 13pt;\">Interface for real mixture gas models</span></b></p>
<p>The objetive of this model is to have an interface and use it as a base model for any real mixture model. In this first version of the library, Peng-Robinson EoS is the one to be considered, however, it is possible to develop different real fluid models using other EoS.</p>
<p>The <u><span style=\"color: #0000ff;\">PartialMixture</span></u> model includes three input variables for pressure, temperature and mass fraction, in order to define the full properties of the fluid. The other variables are going to be used when it comes to develop the real mixture fluid model.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end PartialMixture;
