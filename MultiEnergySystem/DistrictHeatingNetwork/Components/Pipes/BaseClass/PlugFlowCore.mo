within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
model PlugFlowCore
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialRoundTube;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  import Modelica.Fluid.Utilities.regSquare;

  constant Real g_n = Modelica.Constants.g_n;
// Parameter declaration
  parameter Types.PerUnit cf = 0.004 "Constant Fanning factor";
  parameter Types.Velocity u_nom = 1 "Nominal fluid velocity";
  parameter Types.MassFlowRate m_flow_small = 0.001 "Small mass flow rate for regularization of zero flow";
  parameter Types.Temperature T_start = 25 + 273.15 "Start value to be used for specific enthalpy initialization";
  // Final parameter computation
  final parameter Modelica.Units.SI.PressureDifference dp_nom = cf / 2 * rho0 * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter Types.MassFlowRate m_flow_nom = rho0 * A * u_nom "Nominal mass flow rate";
  //Variables
  Types.Length x "Spatial coordinate for spatialDistribution operator";
  Types.Velocity v "Flow velocity of medium in pipe";
  Types.VolumeFlowRate V_flow = inlet.m_flow / rho0 "Volume flow rate at inflowing port (positive when flow from port_a to port_b)";

protected
    parameter Types.SpecificEnthalpy h_ini_in = cp * T_start "For initialization of spatialDistribution inlet";
    parameter Types.SpecificEnthalpy h_ini_out = cp * T_start "For initialization of spatialDistribution outlet";
initial equation
  x = 0;
equation
// Pressure drop due to friction
  inlet.p - outlet.p = rho0 * g_n * h + homotopy(cf / 2 * rho0 * omega * L / A * regSquare(v, u_nom * 0.05), dp_nom / m_flow_nom * V_flow * rho0);
// Mass balance (no storage)
  inlet.m_flow + outlet.m_flow = 0;
  der(x) = v;
  v = V_flow / A;
  (inlet.h_out, outlet.h_out) = spatialDistribution(inStream(inlet.h_out), inStream(outlet.h_out), x / L, v >= 0, {0.0, 1.0}, {h_ini_in, h_ini_out});
end PlugFlowCore;
