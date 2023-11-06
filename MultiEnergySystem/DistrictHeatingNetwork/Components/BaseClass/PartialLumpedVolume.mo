within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
partial model PartialLumpedVolume
  "Partial model of a Cylindrical lumped volume of water, operated ideally at constant mass with losses to ambient"
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  import MultiEnergySystem.DistrictHeatingNetwork.Types;

  // Definition of System
  outer System system "system object for global defaults";

  //Fluid model
//   replaceable package Medium = Water constrainedby Modelica.Media.Interfaces.PartialMedium "Medium model" annotation (
//     choicesAllMatching = true);
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid "Medium model" annotation (
    choicesAllMatching = true);

  // Constants
  constant Types.Acceleration g_n = Modelica.Constants.g_n;
  constant Real pi = Modelica.Constants.pi;

  // Parameters
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= false prohibits flow reversal" annotation (
    Dialog(tab = "Data", group = "Operating conditions"));
  parameter Types.Length H = 0 "High of the lumped water tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Length D = 0.5 "Diameter of the lumped water tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Temperature T_start = 298.15 "Starting temperature" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature T_ext = system.T_amb "Ambient temperature" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Pressure pin_start = 5e5 "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Pressure pout_start = pin_start - g_n*rho0*H "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.MassFlowRate m_flow_start = 1 "Start mass flow rate through the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Integer n = 2 "Number of volumes (min = 2)" annotation (
    Dialog(tab = "Data", group = "Fluid"));

  // Final parameters
  final parameter Types.Volume V = pi*H*(D/2)^2 "Volume of water inside the mixing volume";
  final parameter Types.Mass M_id = V * rho0 "Mass of water inside the mixing volume";

  // Fluids
  //Medium.ThermodynamicState fluid[n]
  //  "Number of volumes in the vertical lumped volume";

  // Variables
  SI.MassFlowRate m_flow_in(start = m_flow_start) "Mass flow rate across the volume";
  SI.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  SI.Temperature Tin "Temperatue of the water entering/leaving the volume";
  SI.Temperature Tout "Temperatue of the water entering/leaving the volume";
  SI.HeatFlowRate Q_amb "Heat losses to ambient";
  SI.Pressure pin(start = pin_start) "Pressure in the lower part of the tank";
  SI.Pressure pout "Pressure in the high part of the tank";

  // Connectors
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation

  // Definition of some variables
  m_flow_in = inlet.m_flow "Mass flow rate entering the fluid";
  pout = outlet.p;
  pin = inlet.p;

  // Boundary Conditions
  inlet.h_out = inStream(inlet.h_out);

  annotation (
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 140}})));
end PartialLumpedVolume;
