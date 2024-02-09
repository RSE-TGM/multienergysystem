within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass;
model TimeDelayPlugFlow
  extends Modelica.Icons.RoundSensor;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  // Base tube parameters
  parameter Modelica.Units.SI.Length L "Pipe length";
  parameter Modelica.Units.SI.Length D "Diameter (assuming a round cross section area)";

  // Parameters
  parameter Boolean initDelay = false "Initialize delay for a constant m_flow_start if true, otherwise start from 0";
  parameter Modelica.Units.SI.MassFlowRate m_flow_start = 0 "Initialization of mass flow rate to calculate initial time delay";
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal(min = 0) "Nominal mass flow rate";
  parameter Boolean ss = true;
  // Final parameter
  final parameter Modelica.Units.SI.Time t_in_start = if initDelay and abs(m_flow_start) > 1E-10 * m_flow_nominal then min(L / m_flow_start * (rho0 * D ^ 2 / 4 * Modelica.Constants.pi), 0) else 0 "Initial value of input time at inlet";
  final parameter Modelica.Units.SI.Time t_out_start = if initDelay and abs(m_flow_start) > 1E-10 * m_flow_nominal then min(-L / m_flow_start * (rho0 * D ^ 2 / 4 * Modelica.Constants.pi), 0) else 0 "Initial value of input time at outlet";

  // Variables
  Modelica.Units.SI.Time time_out_rev "Reverse flow direction output time";
  Modelica.Units.SI.Time time_out_des "Design flow direction output time";
  Real x(start = 0) "Spatial coordinate for spatialDistribution operator";
  Modelica.Units.SI.Frequency u "Normalized fluid velocity (1/s)";
  Modelica.Blocks.Interfaces.RealInput m_flow "Mass flow of fluid" annotation (
    Placement(visible = true, transformation(origin = {-82, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-82, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tau "Time delay for design flow direction" annotation (
    Placement(visible = true, transformation(origin = {84, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {93, 43}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput tau_rev "Time delay for reverse flow" annotation (
    Placement(visible = true, transformation(origin = {84, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {95, -35}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));

protected
  parameter Modelica.Units.SI.Time t0(fixed = false) "Start time of the simulation";
initial equation
  x = 0;
  t0 = time;
equation
  u = m_flow / (rho0 * D ^ 2 / 4 * Modelica.Constants.pi) / L;
  der(x) = u;
  (time_out_rev, time_out_des) = spatialDistribution(time, time, x, u >= 0, {0.0, 1.0}, {t0 + t_in_start, t0 + t_out_start});
  tau = time - time_out_des;
  tau_rev = time - time_out_rev;

end TimeDelayPlugFlow;
