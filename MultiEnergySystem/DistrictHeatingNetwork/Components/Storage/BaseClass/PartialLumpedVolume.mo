within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.BaseClass;
partial model PartialLumpedVolume "Partial model of a Cylindrical lumped volume of water, operated ideally at constant mass with losses to ambient"
  import MultiEnergySystem.DistrictHeatingNetwork.Types;

  //-------------------------------
  // System-wide object for shared default values
  //-------------------------------
  outer MultiEnergySystem.System system "system object for global defaults";

  //-------------------------------
  // Fluid model definition
  //-------------------------------
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp "Medium model" annotation (
    choicesAllMatching = true);

  //-------------------------------
  // Constants
  //-------------------------------
  constant Types.Acceleration g_n = Modelica.Constants.g_n;
  constant Real pi = Modelica.Constants.pi;

  //-------------------------------
  // Tank Geometry and derived parameters
  //-------------------------------
  parameter Types.Length H = 0 "High of the lumped water tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Length D = 0.5 "Diameter of the lumped water tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  final parameter Types.Volume V = pi*H*(D/2)^2 "Volume of water inside the mixing volume";
  final parameter Types.Mass M_id = V * rho_start "Mass of water inside the mixing volume";

  //-------------------------------
  // Initial conditions
  //-------------------------------
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= false prohibits flow reversal" annotation (
    Dialog(tab = "Data", group = "Operating conditions"));
  parameter Types.Temperature T_start = 298.15 "Starting temperature" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature T_ext = system.T_amb "Ambient temperature" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Pressure pin_start = 5e5 "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Pressure pout_start = pin_start - g_n*rho_start*H "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.MassFlowRate m_flow_start = 1 "Start mass flow rate through the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature Tin_start = T_start annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature Tout_start = T_start annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Density rho_start = 985 annotation (
    Dialog(tab = "Data", group = "Initialization"));

  //-------------------------------
  // Variables
  //-------------------------------
  SI.MassFlowRate m_flow_in(start = m_flow_start) "Mass flow rate entering the tank";
  SI.Temperature Tin "Inlet temperature";
  SI.Temperature Tout "Outlet temperature";
  SI.Pressure pin(start = pin_start) "Pressure at the bottom of the tank";
  SI.Pressure pout "Pressure at the too of the tank";

  // Connectors
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet(m_flow(start = m_flow_start))  annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-100,
            -100},                                                                                                                                        extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet(m_flow(start = -m_flow_start)) annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,100},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation

  // Definition of some variables
  m_flow_in = inlet.m_flow "Mass flow rate entering the fluid";

  // Pressure definition from ports
  pout = outlet.p;
  pin = inlet.p;


  annotation (
    Icon(coordinateSystem(extent={{-100,-200},{100,200}})), Documentation(info="<html>

  <h4>PartialLumpedVolume – Base Model for Cylindrical Thermal Storage</h4>

  <p>This partial model represents an ideally mixed cylindrical water tank, modeled initially as a single control volume (lumped).</p>

  <h5>Key Features</h5>
  <ul>
    <li>Includes tank geometry (diameter <code>D</code>, height <code>H</code>)</li>
    <li>Ambient temperature input <code>T_ext</code> allows modeling thermal losses</li>
    <li>Supports flow direction settings via <code>allowFlowReversal</code></li>
    <li>Initial values for mass flow, temperature, pressure, and density</li>
  </ul>

  <p>Extend this model to add dynamic energy balance, heat loss computation, and thermal inertia for transient simulations.</p>



</html>"));
end PartialLumpedVolume;
