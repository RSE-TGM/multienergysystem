within MultiEnergySystem.H2GasFacility.Components.Pipes;

model Round1DFV "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube(inlet.nXi = nXi, outlet.nXi = nXi);
  import Modelica.Fluid.Utilities.regSquare;
  import HCtypes = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes;
  
  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.NaturalGasPapay constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation(
     choicesAllMatching = true);
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer "Heat transfer model for " annotation(
     choicesAllMatching = true);
 
 
  constant Types.Acceleration g_n = Modelica.Constants.g_n;
  
  // Main Parameters
  parameter Boolean computeTransport = false
    "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false
    "Used to decide if it is necessary to calculate specific entropy";
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
  parameter Integer nX = fluid[1].nX 
    "Number of components in the fluid" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Integer nXi = fluid[1].nXi
    "Number of independent components in the fluid" annotation(
    Dialog(tab = "Data", group = "Fluid"));
  parameter Types.Area Stot = S*nPipes 
    "Total surface of the wall" annotation(
    Dialog(tab = "Data", group = "Pipe"));
  parameter Types.CoefficientOfHeatTransfer gamma_nom = 1500 
    "nominal heat transfer coeffcient" annotation(
    Dialog(group = "Heat Transfer Model"));
  parameter Types.MassFraction X_start[nX]
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
  Types.MassFraction Xitilde[n, nXi](each stateSelect = StateSelect.prefer, start = fill(X_start[1:nXi], n)) 
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
  Types.Mass M[n]
    "Mass of fluid in each finite volume";
  Types.Density rho[n + 1]
    "Density at each volume boundary";
  Types.MassFlowRate m_flow[n + 1](each min = 0, each start = m_flow_start)
    "Mass flow at each volume boundary";
  Types.VolumeFlowRate q[n + 1]
    "Mass flow rate in each volume across the pipe";
  Types.Temperature T[n + 1] 
    "Volume boundary temperatures";
  Types.SpecificEnthalpy h[n + 1] 
    "Specific enthalpy at each fluid";
  Types.MassFraction Xi[n + 1, nXi] 
    "Mass fractions at each volume boundary";
  Types.Velocity u[n + 1](each start = u_nom)
    "Velocity at each volume boundary";
  Real dv_dt[n + 1](each unit = "m3/(kg.s)")
    "Derivative of specific volume w.r.t. time";

  // Fluids
  Medium fluid[n + 1](
    T_start = T_start,
    each X_start = X_start,
    each p_start = pout_start,
    each computeTransport = computeTransport,
    each computeEntropy = computeEntropy);

equation

  // Equations to set the fluid properties
  for i in 1:n + 1 loop
    fluid[i].T = T[i] "Temperature at each volume boundary is equal to its equivalent value in the vector variable T";
    fluid[i].Xi = Xi[i, :] "Mass fraction at each volume boundary is equal to its equivalent value in the vector variable Xi";
    fluid[i].p = ptilde "Pressure at each volume boundary is equal to ptilde";
  end for;

  // Equations to assign values from fluids properties
  for i in 1:n + 1 loop
    h[i] = fluid[i].h "Specific enthalpy at each volume boundary";
    rho[i] = fluid[i].rho "Density at each volume boundary";
    dv_dt[i] = fluid[i].dv_dT * der(fluid[i].T) + fluid[i].dv_dp * der(fluid[i].p) + fluid[i].dv_dX * der(fluid[i].X);
    q[i] = m_flow[i]/rho[i];
    m_flow[i] = A * u[i]* rho[i];
  end for;

  // Relationships for state variables
  Ttilde = T[2:n+1];
  Xitilde = Xi[2:n+1,:];
  ptilde = pout;

  // Boundary variables
  m_flow[1] = inlet.m_flow;
  m_flow[n + 1] = -outlet.m_flow;
  h[1] = inStream(inlet.h_out);
  h[n+1] = outlet.h_out;
  Xi[1,:] = inStream(inlet.Xi);
  Xi[n+1,:] = outlet.Xi;
  Tin = fluid[1].T "Inlet temperature equals to temperature of first fluid";
  Tout = fluid[n+1].T "Outlet temperature equals to temperature of last fluid";
  hin = fluid[1].h "Inlet specific enthalpy equals to specific enthalpy of first fluid";
  hout = fluid[n+1].h "Outlet specific enthalpy equals to specific enthalpy of last fluid";
  pin = inlet.p "Inlet pressure equals to pressure of the inlet connector";
  pout = outlet.p "Outlet pressure equals to pressure of the outlet connector";
  inlet.Xi = X_start[1:nXi] "Dummy equation (not flow reversal)";
  inlet.h_out = hin_start "Dummy equation (not flow reversal)";
  
  // Balances
  for i in 1:n loop
     M[i] = Vi * rho[i + 1];
     m_flow[i] - m_flow[i + 1] = -Vi * rho[i + 1] ^ 2 * dv_dt[i + 1] "Total Mass Balance";
     M[i]*der(fluid[i+1].Xi) = m_flow[i]* (Xi[i, :] - Xi[i + 1, :]);
     T[i] - T[i + 1] = 0;
  end for;
  pin - pout = (rho[1]+rho[n+1])/2 * g_n * H + homotopy(cf / 2 * (rho[1]+rho[n+1])/2 * omega * L / A * regSquare(u[1], u_nom * 0.05), dp_nom / m_flow_nom * m_flow[1]);
  
initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    for i in 1:n loop
      der(Xitilde[i,:]) = zeros(nXi);
    end for;
    if not noInitialPressure then
      der(ptilde) = 0;
    else
//  No initial pressure
    end if;
  elseif initOpt == DistrictHeatingNetwork.Choices.Init.Options.fixedState then
    for i in 1:n loop
      fluid[i+1].X = X_start;
    end for;
    if not noInitialPressure then
      ptilde = pout_start;
    else
//  No initial pressure
    end if;
  else
// No initial equations
  end if;  
end Round1DFV;
