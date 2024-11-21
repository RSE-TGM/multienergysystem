within MultiEnergySystem.H2GasFacility.Media.BaseClasses;
partial model PartialMixture "Interface for real mixture gas models"
  extends Modelica.Icons.MaterialProperty;

  // Constants
  constant Integer ord_cp_ideal = 3 "order of the polynomial for ideal cp(T)";
  constant Real eps = 1e-9 "small constant to avoid 'log(0)' when a gas component molar mass is zero";
  constant Types.Density rhoair = 1.2250 "Reference density of air at T = 15°C and p = 1atm";
  constant Types.SpecificHeatCapacityMol R = Modelica.Constants.R "Universal gas constant per unit mol";

  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean computeDerivatives = true "Used to decide if it is necessary to calculate all thermodynamic derivatives";
  parameter Boolean computeEnergyVariables = true "Used to decide if is necessary to calculate HHV,SG,WI";
  parameter Integer nXi = 0 "Number of independent elements in the mass fraction array that influence fluid properties";
  parameter Integer nX = nXi + 1 "Number of elements in the mass fraction array that influence fluid properties";
  parameter Types.MassFraction Xi_start[nXi] "Start value of the indepentend elements of fluid mass composition";
  parameter Types.Pressure p_start "Start value of the fluid pressure";
  parameter Types.Temperature T_start "Start value of the fluid temperature";
  parameter Types.MassFraction X_start[nX] "Start value of the fluid mass composition";
  parameter Types.DynamicViscosity mu_start "Start value of the fluid dynamic viscosity";

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
  Types.DerSpecEnergyByPressure du_dp if computeDerivatives "Pressure derivative of the Specific Internal Energy";
  Types.DerSpecEnergyByTemperature du_dT if computeDerivatives "Temperature derivative of the Specific Internal Energy";
  Types.SpecificEnergy du_dX[nX] if computeDerivatives "Mass fraction derivative of Specific Internal Energy at constant pressure vector";
  Types.SpecificHeatCapacity cp "Specific heat capacity of the fluid at constant pressure";
  Types.SpecificHeatCapacity cv "Specific heat capacity of the fluid at constant volume";
  Types.DerSpecificVolumeByPressure dv_dp if computeDerivatives "Pressure derivative of specific volume at constant Temperature";
  Types.DerSpecificVolumeByTemperature dv_dT if computeDerivatives "Temperature derivative of specific volume at constant pressure";
  Types.SpecificVolume dv_dX[nX] if computeDerivatives "Mass fraction derivative of specific volume, per each component";
  Types.SpecificEntropy s "Specific Entropy" annotation (
    HideResult = not ComputeEntropy);
  Types.DynamicViscosity mu(start = mu_start) "Dynamic viscosity" annotation (
    HideResult = not ComputeTransport);
  Types.ThermalConductivity k "Thermal Conductivity" annotation (
    HideResult = not ComputeTransport);
  Types.Density rho "Density";

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
    annotation (
      Inline = true);
  end h_T;

  function s_T
    input Types.Temperature T;
    input Real a[4];
    output Types.SpecificEntropy s;
  algorithm
    s := a[4]*log(T) + T*(a[3] + T*(a[2]/2 + T*a[1]/3));
    annotation (
      Inline = true);
  end s_T;

  function massToMoleFractions "Return mole fractions from mass fractions X"
    extends Modelica.Icons.Function;
    input Types.MassFraction X[:] "Mass fractions of mixture";
    input Types.MolarMass[:] MMX "Molar masses of components";
    output Types.MoleFraction moleFractions[size(X, 1)] "Mole fractions of gas mixture";
  protected
    Real invMMX[size(X, 1)] "Inverses of molar weights";
    Types.MolarMass Mmix "Molar mass of mixture";
  algorithm
    for i in 1:size(X, 1) loop
      invMMX[i] := 1/MMX[i];
    end for;
    Mmix := 1/(X*invMMX + eps);
    for i in 1:size(X, 1) loop
      moleFractions[i] := Mmix*X[i]/MMX[i];
    end for;
    annotation (
      smoothOrder = 5);
  end massToMoleFractions;

  annotation (
    Documentation(info = "<html><head></head><body><p><b><span style=\"font-size: 13pt;\">Interface for ideal/real mixture gas models</span></b></p>
<p>The objetive of this model is to have an interface and use it as a base model for any<b> ideal/real &nbsp;single/mixture&nbsp;</b><b>gas&nbsp;</b><b>model.</b> In this first version of the library, ideal gas is the one to be considered, however, it is possible to develop different real fluid models such as Papay, Peng Robinson, etc..</p>
<p>The <u><span style=\"color: #0000ff;\">PartialMixture</span></u> model includes three input variables for pressure \"p\", temperature \"T\" and mass fraction \"Xi\", in order to define the full properties of the fluid. The other variables are going to be used when it comes to develop the real mixture fluid model.</p><p>Since the components which use gases can storage mass and energy, additional relevant variables added to this base gas model are the derivatives of specific volume and specific energy with respect to pressure, temperature and mass fraction.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end PartialMixture;
