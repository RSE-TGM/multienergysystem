within MultiEnergySystem.H2GasFacility.Components.Pipes;

model Round1DFV "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube;
  import Modelica.Fluid.Utilities.regSquare;
  import HCtypes = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  
  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation(
     choicesAllMatching = true);
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer "Heat transfer model for " annotation(
     choicesAllMatching = true);
  
    // Main Parameters
  parameter Boolean noInitialPressure = false 
    "Remove initial equation for pressure, to be used in case of solver failure";
  parameter Integer n = 3 
    "Number of finite volumes in each pipe" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nPipes = 1 
    "Number of parallel pipes" annotation(
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.PerUnit cf = 0.004 
    "Constant Fanning friction coefficient" annotation(
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Velocity u_nom = 1 
    "Nominal fluid velocity" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.PerUnit kc 
    "Corrective factor for heat tranfer" annotation(
    Dialog(group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle 
    "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt 
    "Initialisation option" annotation(
    Dialog(group = "Initialisation"));
  parameter Real k(unit = "Pa/(kg/s)") = 500 
    "Coefficient for the calculation of the pressure loss across the pipe" annotation(
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.Density rho_nom = 0.68 
    "Nominal density of the fluid" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nX = 1 
    "Number of components in the fluid" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nXi = 0 
    "Number of independent components in the fluid" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Area Stot = S*nPipes 
    "Total surface of the wall" annotation(
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 
    "nominal heat transfer coeffcient" annotation(
    Dialog(group = "Heat Transfer Model"));
  parameter Types.MassFraction X_start[1] = {1} 
    "Start value for the mass fraction" annotation(
    Dialog(group = "Initialisation"));
  
  
  // Final parameters
  final parameter Types.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1)
    "Temperature start value of the fluid";
  final parameter Types.Pressure dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2
    "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom
    "Nominal mass flow rate";
  final parameter Types.Area S = L*omega 
    "Total surface of the walls of one pipe of the heat exchanger";
  final parameter Types.Area Si = S / n
    "Surface of the wall of each finite volume (for one pipe)";
  final parameter Types.Area Atot = A * nPipes
    "Total internal area of all tubes";
  final parameter Types.Volume V = A * L * nPipes
    "Total volume of the fluid in the pipe";
  final parameter Types.Volume Vi = V / n
    "Volume of one finite element";
  outer System system 
    "system object for global defaults";
  
  // State Variables
  Types.MassFraction Xtilde[n, nXi](each stateSelect = StateSelect.prefer, start = fill(X_start[1:nXi], n)) 
    "Composition state for each volume";
  Types.Pressure ptilde(stateSelect = StateSelect.prefer) 
    "Pressure state the pipe";  
  Types.Temperature Ttilde[n](each stateSelect = StateSelect.prefer, start = T_start[2:n+1])
    "State variable temperatures";
  
  // Inlet/Outlet Variables
  Types.Temperature Tin
    "Inlet temperature";
  Types.Temperature Tout
    "Outlet temperature";
  Types.SpecificEnthalpy hin
    "Inlet Specific enthalpy";
  Types.SpecificEnthalpy hout
    "Outlet Specific enthalpy";
  Types.Pressure pin
    "Inlet pressure";
  Types.Pressure pout
    "Outlet pressure";

  // Vector Variables
  Types.MassFlowRate m_flow[n + 1](each min = 0, each start = m_flow_start)
    "Mass flow at each volume boundary";
  Types.VolumeFlowRate q[n + 1]
    "Mass flow rate in each volume across the pipe";
  Types.Temperature Twall[n] 
    "Pipe wall temperature";
  Types.Temperature T[n + 1] 
    "Volume boundary temperatures";
  Types.SpecificEnthalpy h[n + 1] 
    "Specific enthalpy at each fluid";
  Types.SpecificEnergy u[n + 1] 
    "Specific energy at each fluid";
  Types.MassFraction X[n + 1, nXi] 
    "Mass fractions at each volume boundary";

  // Fluids
  Medium fluid[n + 1](
    T_start = T_start,
    each X_start = X_start,
    each p_start = pout_start,
    each computeTransport = computeTransport,
    each computeEntropy = computeEntropy,
    each computeEnthalpyCondensation = computeEnthalpyCondensation);

equation


end Round1DFV;
