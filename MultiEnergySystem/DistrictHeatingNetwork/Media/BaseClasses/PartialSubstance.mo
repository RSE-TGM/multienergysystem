within MultiEnergySystem.DistrictHeatingNetwork.Media.BaseClasses;
partial model PartialSubstance "Base model for liquid pure substances"
  extends Modelica.Icons.MaterialProperty;
  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean compressibilityEffect = false "Used to enable compressibility effects";
  parameter Types.Pressure p_start "Start value of the fluid pressure";
  parameter Types.Temperature T_start "Start value of the fluid temperature";
  parameter Types.Density rho_start = 990 "Start value of the fluid density";
  parameter Types.SpecificHeatCapacity cp_start = 4185 "Start value of fluid spe. heat capacity";
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";
  parameter Types.MolarMass MM "Molar mass of the fluid";
  parameter Real rho_coeff[3] "Coefficients to compute fluid density";
  parameter Real cp_coeff[4] "Coefficients to compute specific heat capacity";
  parameter Real kappa_coeff[3] "Coefficients to compute thermal conductivity";
  final parameter Types.SpecificEnthalpy h_start = h_T(T_start,cp_coeff) "Start value specific enthalpy";

  //Variables
  connector InputPressure = input Types.Pressure "Pseudo-input to check model balancedness";
  connector InputTemperature = input Types.Temperature "Pseudo-input to check model balancedness";
  InputPressure p(start = p_start) "Absolute pressure";
  InputTemperature T(start = T_start) "Temperature";
  Types.Density rho(start = rho_start) "Density";
  Real drho_dT(unit = "kg/(m3.K)") annotation (
    HideResult = not compressibilityEffect);
  Types.SpecificVolume v "Specific volume";
  Types.MolarVolume v_mol "Molar volume";
  Types.SpecificEnergy u "Specific Internal Energy of the fluid";
  Types.SpecificEnthalpy h(start = h_start) "Specific Enthalpy of the fluid";
  Types.SpecificEntropy s "Specific Entropy" annotation (
    HideResult = not computeEntropy);
  Types.SpecificHeatCapacity cp(start = cp_start) "Specific heat capacity of the fluid";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid";
  Types.DerSpecEnergyByTemperature du_dT "Temperature derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByPressure du_dp "Pressure derivative of the Specific Internal Energy" annotation (
    HideResult = not compressibilityEffect);
  Types.DerSpecificVolumeByTemperature dv_dT "Temperature derivative of specific volume at constant pressure" annotation (
    HideResult = not compressibilityEffect);
  Types.DerSpecificVolumeByPressure dv_dp "Pressure derivative of specific volume at constant Temperature" annotation (
    HideResult = not compressibilityEffect);
  Types.DynamicViscosity mu(start = mu_start) "Dynamic viscosity" annotation (
    HideResult = not computeTransport);
  Types.ThermalConductivity kappa "Thermal Conductivity" annotation (
    HideResult = not computeTransport);

protected
  function cp_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificHeatCapacity cp;
  algorithm
    cp := a[4] + T*(a[3] + T*(a[2] + T*a[1]));
    annotation (
      Inline = true);
  end cp_T;

  function h_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnthalpy h;
  algorithm
    h := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
  annotation(Inline = true);
  end h_T;

  function kappa_T
    input Types.Temperature T;
    input Real a[3];
    output Types.ThermalConductivity kappa;
  algorithm
    kappa := a[3] + T*(a[2] + T*(a[1]));
    annotation (
      Inline = true);
  end kappa_T;


  function rho_T
    input Types.Temperature T;
    input Real a[3];
    output Types.Density rho;
  algorithm
    rho := a[3] + T*(a[2] + T*(a[1]));
    annotation (
      Inline = true);
  end rho_T;

  function drhodT_T
    input Types.Temperature T;
    input Real a[3];
    output Real drho_dT(unit = "kg/(m3.K)");
  algorithm
    drho_dT := a[2] + T*(2*a[1]);
    annotation (
      Inline = true);
  end drhodT_T;

  function u_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEnergy u;
  algorithm
    u := T*(a[4] + T*(a[3]/2 + T*(a[2]/3 + T*a[1]/4)));
    annotation (
      Inline = true);
  end u_T;

  function s_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEntropy s;
  algorithm
    s := a[4]*log(T) + T*(a[3] + T*(a[2]/2 + T*a[1]/3));
    annotation (
      Inline = true);
  end s_T;
  annotation (
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
