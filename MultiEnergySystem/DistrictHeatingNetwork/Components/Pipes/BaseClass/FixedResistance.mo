within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
partial model FixedResistance
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  import Modelica.Fluid.Utilities.regSquare;
  import Modelica.Fluid.Utilities.regStep;

  // Fluid
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby
    DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;


  // Constants
  constant Real g_n = Modelica.Constants.g_n;

  // Parameter declaration
  parameter Types.PerUnit cf = 0.004 "Constant Fanning factor";
  parameter Types.Velocity u_nom = 2 "Nominal fluid velocity";
  parameter Types.Density rho_nom = 1000 "Nominal fluid density";
  parameter Types.MassFlowRate m_flow_small = 0.001 "Small mass flow rate for regularization of zero flow";
  parameter Types.Temperature T_start = 25 + 273.15 "Start value to be used for specific enthalpy initialization";
  parameter Types.Length h_nom = 0 "Nominal pipe heigth";
  parameter Types.Pressure dp_nom = rho_nom*g_n*h_nom + cf/2*rho_nom*omega*L/A*u_nom^2 "Nominal pressure drop";

  // Final parameter computation
  final parameter Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom "Nominal mass flow rate";

  //Variables
  Types.VolumeFlowRate q "Volume flow rate at inflowing port (positive when flow from inlet to outlet)";
  Types.Pressure pin(start = pin_start) "inlet pressure";
  Types.Pressure pout "outlet pressure";
  Types.MassFlowRate m_flow(start = m_flow_start, nominal = m_flow_nom) "mass flow rate";
  Types.Velocity vel "fluid velocity";
  Types.Pressure dp;
  Real k_c(unit = "Pa/(s2.kg2)");

  //Medium
  Medium fluidIn(p_start = pin_start, T_start = Tin_start);

equation

  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = regStep(m_flow, inStream(inlet.h_out), inStream(outlet.h_out), m_flow_nom*1e-5);
// Pressure drop due to friction
//  inlet.p - outlet.p = rho0 * g_n * h + homotopy(cf / 2 * rho0 * omega * L / A * regSquare(v, u_nom * 0.05), dp_nom / m_flow_nom * q * rho0);
  pin - pout = fluidIn.rho*g_n*h + homotopy(k_c*regSquare(m_flow, m_flow_nom*0.05), dp_nom/m_flow_nom*inlet.m_flow);

// Mass balance (no storage)
  inlet.m_flow + outlet.m_flow = 0;
  outlet.h_out = inStream(inlet.h_out) - g_n*h;
  inlet.h_out = inStream(outlet.h_out) + g_n*h;

  pin = inlet.p;
  pout = outlet.p;
  dp = pin - pout;
  m_flow = inlet.m_flow;
  vel = m_flow/(fluidIn.rho*A);
  q = inlet.m_flow / fluidIn.rho;
end FixedResistance;
