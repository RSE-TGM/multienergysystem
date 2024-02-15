within MultiEnergySystem.H2GasFacility.Components.BaseClass;
partial model PartialLumpedVolume
  "Partial model of a Cylindrical lumped volume of water, operated ideally at constant mass with losses to ambient"

  //extends MultiEnergySystem.H2GasFacility.Interfaces.PartialHorizontalTwoPort(inlet(nXi = fluidIn.nXi), outlet(nXi = fluidOut.nXi));

  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = fluidIn.nXi)
                                                                                    annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-100,
            -100},                                                                                                                                        extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = fluidOut.nXi)
                                                                                       annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,100},
        extent={{-20,-20},{20,20}},
        rotation=0)));

  // Definition of System
  outer System system "system object for global defaults";

  // Add model of the fluid in the pipe
  // import MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);
  import MultiEnergySystem.H2GasFacility.Types;


  // Constants
  constant Types.Acceleration g_n = Modelica.Constants.g_n;
  constant Real pi = Modelica.Constants.pi;

  // Parameters
  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density";
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= false prohibits flow reversal";
  parameter Types.Length H = 0 "High of the lumped tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Length D = 0.5 "Diameter of the lumped tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Temperature T_start = 298.15 "Starting temperature" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature T_ext = system.T_amb "Ambient temperature" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Pressure pin_start = 5e5 "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Pressure pout_start = pin_start - g_n*rho_nom*H "start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.MassFlowRate m_flow_start = 1 "Start mass flow rate through the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature Tin_start = T_start;
  parameter Types.Temperature Tout_start = T_start;
  parameter H2GasFacility.Types.MassFraction X_start[fluidIn.nX] = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X "Mass fraction start value of fluid" annotation (
    Dialog(group = "Initialisation"));

  // Final parameters
  final parameter Types.Volume V = pi*H*(D/2)^2 "Volume of fluid inside the mixing volume";
  final parameter Types.Mass M_id = V * rho_nom "Mass of fluid inside the mixing volume";

  // Variables
  Modelica.Units.SI.MassFlowRate m_flow_in(start = m_flow_start) "Mass flow rate across the volume";
  Modelica.Units.SI.Temperature T_a_inflow(start = T_start) "Temperatue of the fluid entering/leaving the volume";
  Modelica.Units.SI.Temperature T_b_outflow(start = T_start) "Temperatue of the fluid entering/leaving the volume";
//   Modelica.Units.SI.Pressure pin(start = pin_start) "Pressure in the lower part of the tank";
//   Modelica.Units.SI.Pressure pout "Pressure in the high part of the tank";


  // Medium
  Medium fluidIn(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);
  Medium fluidOut(
    T_start = Tout_start,
    p_start = pout_start,
    X_start = X_start,
    computeTransport = false,
    computeEntropy = false);

equation

//   // Definition of some variables
     m_flow_in = inlet.m_flow "Mass flow rate entering the fluid";
//   pout = outlet.p;
//   pin = inlet.p;


end PartialLumpedVolume;
