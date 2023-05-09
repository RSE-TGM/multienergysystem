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
  connector InputMassFraction = input Types.MassFraction "The fluid properties are defined by a temperature value";
  InputPressure p(start = p_start) "Absolute pressure";
  InputTemperature T(start = T_start) "Temperature";
  InputMassFraction Xi[nXi](start = Xi_start) "Independent Mass fraction vector";
  Types.MassFraction X[nX](start = X_start) "Mass fraction vector";
  Types.SpecificEnergy u "Specific Internal Energy of the fluid";
  Types.SpecificEnthalpy h "Specific Enthalpy of the fluid";
  Types.SpecificEntropy s "Specific Entropy" annotation(
    HideResult = not ComputeEntropy);
  Types.DerSpecEnergyByPressure du_dp "Pressure derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByTemperature du_dT "Temperature derivative of the Specific Internal Energy";
  Types.SpecificEnergy du_dX[nX] "Mass fraction derivative of Specific Internal Energy at constant pressure, per each component";
  Types.SpecificHeatCapacity cp "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid";
  Types.DerSpecificVolumeByPressure dv_dp "Pressure derivative of specific volume at constant Temperature" annotation(
    HideResult = not CompressibilityEffect);
  Types.DerSpecificVolumeByTemperature dv_dT "Temperature derivative of specific volume at constant pressure";
  Real dv_dX[nX](each unit = "m3/kg") "Mass fraction derivative of specific volumen, per each component";
  Types.DynamicViscosity mu "Dynamic viscosity" annotation(
    HideResult = not ComputeTransport);
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  Types.Density rho "Density of the fluid, needed in the pipe";
  annotation(
    Documentation(info = "<html><head></head><body><p><b><span style=\"font-size: 13pt;\">Interface for real mixture gas models</span></b></p>
<p>The objetive of this model is to have an interface and use it as a base model for any real mixture model. In this first version of the library, Peng-Robinson EoS is the one to be considered, however, it is possible to develop different real fluid models using other EoS.</p>
<p>The <u><span style=\"color: #0000ff;\">PartialMixture</span></u> model includes three input variables for pressure, temperature and mass fraction, in order to define the full properties of the fluid. The other variables are going to be used when it comes to develop the real mixture fluid model.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end PartialMixture;
