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
  outer MultiEnergySystem.System system "system object for global defaults";

  // Add model of the fluid in the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture "Medium model" annotation (
     choicesAllMatching = true);
  import MultiEnergySystem.H2GasFacility.Types;


  // Constants
  constant Types.Acceleration g_n = Modelica.Constants.g_n;
  constant Real pi = Modelica.Constants.pi;

  // Parameters
  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density of the fluid";
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= false prohibits flow reversal";
  parameter Types.Length H = 0 "Height of the lumped tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Length D = 0.5 "Diameter of the lumped tank" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Temperature T_start = 298.15 "Starting temperature of the fluid" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature T_ext = system.T_amb "Ambient temperature" annotation (
    Dialog(tab = "Data", group = "Tank"));
  parameter Types.Pressure pin_start = 5e5 "Start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Pressure pout_start = pin_start - g_n*rho_nom*H "Start pressure at lower part of the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.MassFlowRate m_flow_start = 1 "Start mass flow rate through the tank" annotation (
    Dialog(tab = "Data", group = "Initialization"));
  parameter Types.Temperature Tin_start = T_start "Initial inlet temperature";
  parameter Types.Temperature Tout_start = T_start "Initial outlet temperature";
  parameter H2GasFacility.Types.MassFraction X_start[fluidIn.nX] = H2GasFacility.Data.MassMolFractionData.NG_Abeysekera.X "Initial Mass fraction of the fluid" annotation (
    Dialog(group = "Initialisation"));

  // Final parameters
  final parameter Types.Volume V = pi*H*(D/2)^2 "Volume of fluid inside the mixing volume";
  final parameter Types.Mass M_id = V * rho_nom "Mass of fluid inside the mixing volume";

  // Variables
  Modelica.Units.SI.MassFlowRate m_flow_in(start = m_flow_start) "Mass flow rate across the volume";
  Modelica.Units.SI.Temperature T_a_inflow(start = T_start) "Temperatue of the fluid entering the volume";
  Modelica.Units.SI.Temperature T_b_outflow(start = T_start) "Temperatue of the fluid leaving the volume";
  Modelica.Units.SI.Pressure pin(start = pin_start) "Pressure at the lower part of the tank";
  Modelica.Units.SI.Pressure pout "Pressure at the upper part of the tank";


  // Medium Initialization
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

     // Conservation Equations
     m_flow_in = inlet.m_flow "Mass flow rate entering the fluid";
     pout = outlet.p "Pressure at the outlet equals outlet port pressure";
     pin = inlet.p "Pressure at the inlet equals inlet port pressure";


  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">PartialLumpedVolume</span> is a simplified model of a cylindrical tank used to simulate fluid dynamics with idealized conditions. It supports configurable tank dimensions, initial conditions, and fluid properties, making it suitable for storage, transport, or mixing applications.</p>
<h4>Key Features</h4>
<ul>
<li>Fluid ports for inflow (<span style=\"font-family: Courier New;\">inlet</span>) and outflow (<span style=\"font-family: Courier New;\">outlet</span>).</li>
<li>Configurable tank dimensions (<span style=\"font-family: Courier New;\">H</span>, <span style=\"font-family: Courier New;\">D</span>) and initial conditions (e.g., <span style=\"font-family: Courier New;\">T_start</span>, <span style=\"font-family: Courier New;\">pin_start</span>).</li>
<li>Calculates pressure dynamics with hydrostatic effects.</li>
<li>Optional flow reversal support.</li>
</ul>
<p>This model assumes constant fluid mass and lumped flow behavior, ideal for simple thermal or hydraulic simulations.</p>
</html>"));
end PartialLumpedVolume;
