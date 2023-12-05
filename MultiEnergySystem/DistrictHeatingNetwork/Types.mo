within MultiEnergySystem.DistrictHeatingNetwork;
package Types
  extends Modelica.Icons.TypesPackage;
  type Area = Modelica.Units.SI.Area (
                                    nominal = 10);
  type SpecificHeatCapacity =
      Modelica.Units.SI.SpecificHeatCapacity (                      nominal = 500);
  type Length = Modelica.Units.SI.Length (
                                        nominal = 1);
  type ThermalConductivity =
      Modelica.Units.SI.ThermalConductivity (                     nominal = 1e3);
  type HeatCapacity =
      Modelica.Units.SI.HeatCapacity (              nominal = 1e3);
  type Temperature =
      Modelica.Units.SI.Temperature (             nominal = 370);
  type Pressure = Modelica.Units.SI.Pressure (
                                            nominal = 1e5);
  type Density = Modelica.Units.SI.Density (
                                          nominal = 1e2, displayUnit="kg/m3");
  type Volume = Modelica.Units.SI.Volume (
                                        nominal = 10);
  type SpecificVolume = Real (
      final quantity="SpecificVolume",
      final unit="m3/kg");
  type MolarVolume =
      Modelica.Units.SI.MolarVolume (             nominal = 1e-3);
  type MassFlowRate =
      Modelica.Units.SI.MassFlowRate (              nominal = 100);
  type HeatFlowRate =
      Modelica.Units.SI.HeatFlowRate (              nominal = 1e6);
  type SpecificEnthalpy = SpecificEnergy;
  type SpecificEnergy =
      Modelica.Units.SI.SpecificEnergy (                nominal = 1e6);
  type SpecificEntropy =
      Modelica.Units.SI.SpecificEntropy (                 nominal = 5e2);
  type SpecificHeatCapacityWater =
      Modelica.Units.SI.SpecificHeatCapacity (                           nominal = 1e3);
  type SpecificHeatCapacityAtConstantPressure =
      Modelica.Units.SI.SpecificHeatCapacity (                                        nominal = 1e3);
  type SpecificHeatCapacityAtConstantVolume =
      Modelica.Units.SI.SpecificHeatCapacity (                                      nominal = 1e3);
  type HeatFlux = Real(final quantity = "HeatFlux", final unit = "W/m2", nominal = 1e4);
  type Stress = Modelica.Units.SI.NormalStress (
                                              nominal = 1e7);
  type ThermalConductance =
      Modelica.Units.SI.ThermalConductance (                    nominal = 1e-2);
  type DynamicViscosity =
      Modelica.Units.SI.DynamicViscosity (                  nominal = 1e-5);
  type Velocity = Modelica.Units.SI.Velocity (
                                            nominal = 1e3);
  type CoefficientOfHeatTransfer =
      Modelica.Units.SI.CoefficientOfHeatTransfer (                           nominal = 5000, min = 0);
  type DerSpecificVolumeByPressure = Real(final unit = "m4.s2/kg2", nominal = 1e-10);
  type DerSpecificVolumeByTemperature = Real(final unit = "m3/(kg.K)", nominal = 2e-5);
  type DerSpecificVolumeByTemperatureWater = Real(final unit = "m3/(kg.K)", nominal = 1e-5);
  type DerSpecEnergyByPressure = Real(final unit = "J.m.s2/kg2");
  type DerPressureByTemperature =
      Modelica.Units.SI.DerPressureByTemperature (                          nominal = 1e5);
  type DerSpecEnergyByTemperature = Real(final unit = "J/(kg.K)", nominal = 1e3);
  type Power = Modelica.Units.SI.Power (
                                      nominal = 1e7);
  type ReynoldsNumber =
      Modelica.Units.SI.ReynoldsNumber(nominal = 1e5);
  type NusseltNumber =
      Modelica.Units.SI.NusseltNumber(nominal = 100);
  type PrandtlNumber =
      Modelica.Units.SI.PrandtlNumber(nominal = 10);
  type PressureRatio = Real(final quantity = "PressureRatio", final unit = "1", nominal = 2);
  type Mass = Modelica.Units.SI.Mass (
                                    nominal = 1e2);
  type Energy = Modelica.Units.SI.Energy (
                                        nominal = 1e6);
  type MolarMass = Modelica.Units.SI.MolarMass;
  type MassFraction = Modelica.Units.SI.MassFraction;
  type MoleFraction = Modelica.Units.SI.MoleFraction;
  type PerUnit = Modelica.Units.SI.PerUnit;
  type DerPressurebySpecificVolume = Real(final unit = "Pa/(m3/kg)", nominal = 2e9);
  type SpecificHeatCapacityMol = Real(final unit="J/(mol.K)");
  type AttractionForce = Real(final unit = "J.m3/mol2");
  type DerAttractionForcebyTemperature = Real(final unit="J.m3/(mol2.K)");
  type DerPerUnitbyTemperature = Real(final unit = "1/K");
  type MolarEnthalpy = Modelica.Units.SI.MolarEnthalpy(nominal = 1);
  type HydraulicConductance = Real (final quantity="HydraulicConductance", final unit="(kg/s)/Pa");
  type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit= "m3/s");
  type Torque = Real (final quantity="Torque", final unit="N.m");
  type AngularVelocity = Real (    final quantity="AngularVelocity",    final unit="rad/s", nominal = 100);
  type Angle = Real (
    final quantity="Angle",
    final unit="rad",
    displayUnit="deg");
  type Efficiency = Real (
    final quantity="Efficiency",
    final unit="1",
    min=0);
  type Acceleration = Real (final quantity="Acceleration", final unit="m/s2");
  type HydraulicResistance = Real (final quantity="HydraulicResistance",final unit="Pa.s/kg") "Real type for hydraulic resistance";
  type Time = Modelica.Units.SI.Time;
  type TemperatureDifference = Modelica.Units.SI.TemperatureDifference;
  type Frequency = Real (final quantity="Frequency", final unit="Hz");
  type AngularFrequency = Real (final quantity="AngularFrequency", final unit=
        "rad/s");
  type valveOpeningChar = enumeration(
      Linear
           "Linear opening characteristic",
      Quadratic
              "Quadratic opening characteristic")
  "Enumeration to define the choice of valve flow coefficient";
end Types;
