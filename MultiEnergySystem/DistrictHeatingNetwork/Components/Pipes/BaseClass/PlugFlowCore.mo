within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
model PlugFlowCore
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialInsulatedTube;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  import Modelica.Fluid.Utilities.regSquare;

  // Parameter declaration
  parameter Modelica.Units.SI.PerUnit cf = 0.004 "Constant Fanning factor";
  parameter Modelica.Units.SI.Velocity u_nom = 1 "Nominal fluid velocity";
  parameter Modelica.Units.SI.MassFlowRate m_flow_small = 0.001 "Small mass flow rate for regularization of zero flow";

  // Final parameter computation
  final parameter Modelica.Units.SI.PressureDifference dp_nom = cf / 2 * rho0 * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter Modelica.Units.SI.MassFlowRate m_flow_nom = rho0 * A * u_nom "Nominal mass flow rate";
  Modelica.Units.SI.Length x "Spatial coordinate for spatialDistribution operator";
  Modelica.Units.SI.Velocity v "Flow velocity of medium in pipe";
  Modelica.Units.SI.VolumeFlowRate V_flow = inlet.m_flow / rho0 "Volume flow rate at inflowing port (positive when flow from port_a to port_b)";

protected
    parameter Modelica.Units.SI.SpecificEnthalpy h_ini_in = cp * T_start "For initialization of spatialDistribution inlet";
    parameter Modelica.Units.SI.SpecificEnthalpy h_ini_out = cp * T_start "For initialization of spatialDistribution outlet";
initial equation
    x = 0;
equation
  // Pressure drop due to friction
  inlet.p - outlet.p = rho0 * Modelica.Constants.g_n * h + homotopy(cf / 2 * rho0 * omega * L / A * regSquare(v, u_nom * 0.05), dp_nom / m_flow_nom * V_flow * rho0);
  // Mass balance (no storage)
  inlet.m_flow + outlet.m_flow = 0;
  der(x) = v;
  v = V_flow / A;
  (inlet.h_out, outlet.h_out) = spatialDistribution(inStream(inlet.h_out), inStream(outlet.h_out), x / L, v >= 0, {0.0, 1.0}, {h_ini_in, h_ini_out});

end PlugFlowCore;
