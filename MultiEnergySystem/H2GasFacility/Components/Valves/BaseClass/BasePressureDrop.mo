within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;

partial model BasePressureDrop
  extends H2GasFacility.Interfaces.PartialHorizontalTwoPort;


  replaceable package Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture 
    "fluid model"; 

  // Basic parameters for declaring fluids 
  parameter Types.Pressure dp_nom = 0.1e5 
    "Pressure drop between supply and return, as imposed by the differential pump" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Pressure pin_start = 1e5
    "Inlet nominal and start pressure" annotation (
    Dialog(group = "Initialization"));
  final parameter Types.Pressure pout_start = pin_start - dp_nom
    "Outlet nominal and start pressure" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Temperature Tin_start = 25 + 273.15
    "Inlet nominal and start temperature" annotation (
    Dialog(group = "Initialization"));
  parameter Types.Temperature Tout_start = 20 + 273.15
    "Outlet nominal and start temperature" annotation (
    Dialog(group = "Initialization"));
  final parameter Types.MassFraction X_start[fluidIn.nX] = fluidIn.X_start
    "Nominal mass fraction through the valve" annotation (
    Dialog(group = "Initialization"));

  
  Medium fluidIn(
    T_start = Tin_start, 
    p_start = pin_start, 
    X_start = X_start)
    "inlet fluid";
  Medium fluidOut(
    T_start = Tout_start, 
    p_start = pout_start, 
    X_start = X_start) 
    "outlet fluid";

  Types.Density rhoin
    "Density at the inlet";
  Types.Pressure pin 
    "Actual inlet pressure";
  Types.Pressure pout 
    "Actual outlet pressure";
  Types.Temperature Tin 
    "Actual inlet temperature";
  Types.Temperature Tout 
    "Actual outlet temperature";

equation

end BasePressureDrop;
