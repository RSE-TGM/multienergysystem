within MultiEnergySystem.DistrictHeatingNetwork.Media.BaseClasses;

partial model PartialSubstance
  extends Modelica.Icons.MaterialProperty;
  parameter Boolean computeTransport = true "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean compressibilityEffect = false "Used to enable compressibility effects";
  parameter Boolean computeEnthalpyCondensation = false "Used to enable water condensation enthalpy";
  parameter Boolean fixedX = false;
  parameter Types.Pressure p_start "Start value of the fluid pressure";
  parameter Types.Temperature T_start "Start value of the fluid temperature";
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  parameter Integer nX = 0 "Number of elements in the mass fraction array";
  parameter Types.MolarMass MM;
  
  //Variables
  connector InputPressure = input Types.Pressure "Pseudo-input to check model balancedness";
  connector InputTemperature = input Types.Temperature "Pseudo-input to check model balancedness";
  connector InputMassFraction = input Types.MassFraction "The fluid properties are defined by a temperature value";
  InputPressure p(start = p_start) "Absolute pressure";
  InputTemperature T(start = T_start) "Temperature";
  InputMassFraction X[nX] "Mass fraction vector";
  Types.MolarVolume v "Molar volume";
  Types.SpecificEnergy u "Specific Internal Energy of the fluid";
  Types.SpecificEnthalpy h "Specific Enthalpy of the fluid";
  Types.SpecificEntropy s "Specific Entropy" annotation(
    HideResult = not ComputeEntropy);
  Types.SpecificHeatCapacity cp "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid";
  Real dv_dX[nX](each unit = "m3/kg") "Mass fraction derivative of specific volumen, per each component";
  Types.SpecificEnergy du_dX[nX] "Mass fraction derivative of Specific Internal Energy at constant pressure, per each component";
  Types.DerSpecEnergyByTemperature du_dT "Temperature derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByPressure du_dp "Pressure derivative of the Specific Internal Energy" annotation(
    HideResult = not CompressibilityEffect);
  Types.DerSpecificVolumeByTemperature dv_dT "Temperature derivative of specific volume at constant pressure";
  Types.DerSpecificVolumeByPressure dv_dp "Pressure derivative of specific volume at constant Temperature" annotation(
    HideResult = not CompressibilityEffect);
  Types.DynamicViscosity mu(start = mu_start) "Dynamic viscosity" annotation(
    HideResult = not ComputeTransport);
  Types.ThermalConductivity k "Thermal Conductivity" annotation(
    HideResult = not ComputeTransport);
  annotation(
    Documentation(info = "<HTML>
        <p>Liquid Water modeled using polynomial correlations obtained by interpolation of data from IF-97 standard to determine the saturated liquid state as a function of temperature.
        <p>From that reference point the water is modeled as an incompressible liquid with the density of the saturated liquid, so it obeys the following equations of state:
        <ul>
        <li>d(T,p) = d_sat(T)</li>
        </ul>
        For an incompressible fluid Internal energy os only a function of temperature, so:
        <ul>
        <li>u(T,p) = u_sat(T)</li>
        </ul>
        And cp = cv and it defined as the temperature derivative of internal energy.
        And to conclude, enthalpy is calculated following the definition:
        <ul>
        <li>h = u + p / d</li>
        </ul>
        </HTML>"));
end PartialSubstance;
