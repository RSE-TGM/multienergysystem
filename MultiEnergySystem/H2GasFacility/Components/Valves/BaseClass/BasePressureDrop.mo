within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;
partial model BasePressureDrop
  extends H2GasFacility.Interfaces.PartialHorizontalTwoPort(
    inlet(nXi = fluidIn.nXi), outlet(nXi = fluidOut.nXi));

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.CH4Papay
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
      "fluid model";

  // Basic parameters for declaring fluids
  parameter Boolean computeTransport = false
    "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false
    "Used to decide if it is necessary to calculate entropy";
  parameter Types.Pressure dp_nom = 60e5 - 4.93e5
    "Pressure drop between supply and return, as imposed by the differential pump" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Pressure pin_start = 60e5
    "Inlet nominal and start pressure" annotation (
    Dialog(group = "Initialization"));
  final parameter Types.Pressure pout_start = pin_start - dp_nom
    "Outlet nominal and start pressure" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Temperature Tin_start = 15 + 273.15
    "Inlet nominal and start temperature" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Temperature Tout_start = 15 + 273.15
    "Outlet nominal and start temperature" annotation (
    Dialog(group = "Initialization"));
  parameter Types.MassFraction X_start[fluidIn.nX]
    "Nominal mass fraction through the valve" annotation (
    Dialog(group = "Initialization"));


  Medium fluidIn(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start,
    computeTransport = computeTransport,
    computeEntropy = computeEntropy)
    "inlet fluid";
  Medium fluidOut(
    T_start = Tout_start,
    p_start = pout_start,
    X_start = X_start,
    computeTransport = computeTransport,
    computeEntropy = computeEntropy)
    "outlet fluid";

  Types.Density rhoin "Density at the inlet";
  Types.Pressure pin "Actual inlet pressure";
  Types.Pressure pout "Actual outlet pressure";
  Types.Temperature Tin "Actual inlet temperature";
  Types.Temperature Tout "Actual outlet temperature";

equation

  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">BasePressureDrop</span> is a partial Modelica model that provides a foundation for simulating pressure drops in fluid systems. It is designed to handle fluid flow between two ports with configurable parameters for the fluid medium, pressure, and temperature.</p>
<h4>Use Case</h4>
<p>This model is a base class for components such as valves, pipes, or flow restrictors where a pressure drop occurs. It can be extended with specific equations to define the pressure drop dynamics and other fluid properties.</p>
</html>"));
end BasePressureDrop;
