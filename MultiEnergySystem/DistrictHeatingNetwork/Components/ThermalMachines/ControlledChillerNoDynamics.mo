within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledChillerNoDynamics
  extends DistrictHeatingNetwork.Icons.ThermalMachines.HeatPump;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Medium model"    annotation (
     choicesAllMatching = true);

  parameter Boolean use_in_Tout_cold_set = false "Use connector input for the pressure" annotation (
    Dialog(group="External inputs"), choices(checkBox=true));
  parameter DistrictHeatingNetwork.Types.PerUnit COP_nom = 2.7 "Nominal coefficient of performance";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_cold_start = 14 + 273.15 "Start/Nominal value for Cold side inlet temperature";
  final parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_start = Tout_cold_nom "Start/Nominal value for Cold side outlet temperature";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_cold_nom = 8 + 273.15 "Nominal value at the outlet of the hot fluid";
  parameter DistrictHeatingNetwork.Types.Pressure pin_cold_start = 2e5 "Start/Nominal value for cold side inlet pressure";
  parameter DistrictHeatingNetwork.Types.Pressure dp_cold_start = 50e3 "Start/Nominal value for delta pressure in cold side";
  final parameter DistrictHeatingNetwork.Types.Pressure pout_cold_start = pin_cold_start - dp_cold_start "Start/Nominal value for Cold side outlet pressure";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold_start = 1 "Cold fluid mass flow rate";
  parameter Real k_cold(unit = "Pa/(kg/s)") = (pin_cold_start - pout_cold_start)/m_flow_cold_start "Pressure loss across the cold side";
  parameter DistrictHeatingNetwork.Types.Volume V = 0.1;
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option";
  parameter Real T_bandwidth = 4 "Temperature Bandwidth for the on/off temperature controller";

  outer DistrictHeatingNetwork.System system "system object for global defaults";

  //Boolean compressor1_on(start = false); // Compressor 1 ON/OFF state
  //Boolean compressor2_on(start = false); // Compressor 2 ON/OFF state
  //Real P_compressor1; // Power of compressor 1 (W)
  //Real P_compressor2; // Power of compressor 2 (W)

// Internal control signals
  //Boolean comp1_control(start=true);
  //Boolean comp2_control(start=false);
  //Boolean cooling_phase(start=true); // Indicates cooling phase

  DistrictHeatingNetwork.Types.Pressure pin_cold "Cold side inlet pressure";
  DistrictHeatingNetwork.Types.Pressure pout_cold "Cold side outlet pressure";

  DistrictHeatingNetwork.Types.Temperature Tin_cold(start = Tin_cold_start) "Cold side inlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold(start = Tout_cold_start) "Cold side outlet temperature";
  //DistrictHeatingNetwork.Types.Temperature Tout_cold_min "Minimum possible cold side outlet temperature";
  DistrictHeatingNetwork.Types.Temperature Tout_cold_set "Actual set-point for the outlet cold temperature";

  DistrictHeatingNetwork.Types.SpecificEnthalpy hin_cold "Cold side inlet Specific Enthalpy";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_cold "Cold side outlet Specific Enthalpy";

  DistrictHeatingNetwork.Types.MassFlowRate m_flow_cold(start = m_flow_cold_start) "Cold fluid mass flow rate";
  DistrictHeatingNetwork.Types.VolumeFlowRate q_m3h_cold "Cold volumetric flow rate in m3h";
  //SI.PerUnit COP "Coefficient of performance";
  //SI.Power Pcomp "Compression Power";
  DistrictHeatingNetwork.Types.Power Pcold "Thermal Power cold side (cold source side)";
  //SI.Power Phot "Themal Power hot side (lato utenze)";
  DistrictHeatingNetwork.Types.Mass M;
  //DistrictHeatingNetwork.Types.Power Pcold "Total power";
  DistrictHeatingNetwork.Types.SpecificHeatCapacity cp "Outlet specific heat capacity of the fluid";

  // Declaration of fluid models
  Medium fluidIn(T_start = Tin_cold_start, p_start = pin_cold_start) "Cold inlet fluid";
  Medium fluidOut(T_start = Tout_cold_start, p_start = pout_cold_start) "Cold outlet fluid";


  // Reference Variables
  DistrictHeatingNetwork.Types.Power Pcold_ref "Reference value for computed Heat Power required";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_cold_ref "Reference required temperature";

  Medium fluidOut_ref(T_start = Tout_cold_start, p_start = pout_cold_start) "Reference outlet fluid";


  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold annotation (
    Placement(visible = true, transformation(origin = {-76, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold annotation (
    Placement(visible = true, transformation(origin = {-76, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set if use_in_Tout_cold_set
    "Externally supplied temperature"                                                                          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={10,70}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,70})));
  Modelica.Blocks.Logical.TriggeredTrapezoid TT1(
    amplitude=100e3,
    rising=10,
    falling=0)  annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Modelica.Blocks.Sources.BooleanExpression C1(y=true)           annotation (Placement(transformation(extent={{-44,6},
            {-24,26}})));
  Modelica.Blocks.Logical.TriggeredTrapezoid TT2(
    amplitude=100e3,
    rising=10,
    falling=0)  annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));
  Modelica.Blocks.Sources.BooleanExpression C2(y=true)           annotation (Placement(transformation(extent={{-44,-24},
            {-24,-4}})));
  Modelica.Blocks.Continuous.FirstOrder FO1(T=60, initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{20,6},{
            40,26}})));
  Modelica.Blocks.Continuous.FirstOrder FO2(T=60, initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{20,-24},
            {40,-4}})));
  Modelica.Blocks.Interfaces.BooleanInput cold_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-120,-10},{-100,10}})));
protected
  Modelica.Blocks.Interfaces.RealInput in_Tout_cold_set_internal;

equation

// Fluid Definition

  {fluidIn.p, fluidIn.h} = {pin_cold, hin_cold};
  {fluidOut.p, fluidOut.h} = {pout_cold, hout_cold};

  cp = fluidOut.cp;

// Assignation of name variables

  pin_cold = incold.p;
  pout_cold = outcold.p;
  hin_cold = inStream(incold.h_out);
  hout_cold = outcold.h_out;

  Tin_cold = fluidIn.T;
  Tout_cold = fluidOut.T;
  m_flow_cold = incold.m_flow;
  q_m3h_cold = m_flow_cold/fluidIn.rho;

// Ideal Controlled variables
  // Tout_cold_min = min(Tout_cold_set, Tin_cold);
  // Tout_cold = Tout_cold_min "Fixed hot side outlet temperature";

// Balance equation
  incold.m_flow + outcold.m_flow = 0 "Mass Balance cold side";
  M = V*fluidIn.rho;
  //pin_cold - pout_cold = k_cold*m_flow_cold  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.243353*m_flow_cold - 0.76)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.245867*m_flow_cold - 0.77)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.2692545*m_flow_cold - 0.92)*1e5  "Momentum balance cold side";
  //pin_cold - pout_cold = (0.24522758*m_flow_cold -0.732359)*1e5  "Momentum balance cold side";
  pin_cold - pout_cold = (0.24522758*m_flow_cold -0.772359)*1e5  "Momentum balance cold side";

  //pin_cold = pout_cold;
  //Pcold = m_flow_cold*(hin_cold - hout_cold) "Themal Power Cold side";

  //M*cp*der(Tout_cold) = outcold.m_flow*hout_cold + incold.m_flow*hin_cold + Pcold;
  M*cp*der(Tout_cold) = incold.m_flow*(hin_cold-hout_cold) - Pcold;

//  Phot = Pcomp + Pcold "Energy Balance";
//Pcomp =  a[1]*m_flow_hot + a[2]*m_flow_cold + a[3]*Tin_cold + a[4]*m_flow_hot*Tin_cold + a[5]*m_flow_cold*Tin_cold + a[6]*m_flow_hot*m_flow_cold;
//  COP = Phot/Pcomp;
//COP = Tin_cold*a[1]+a[2];
// Dummy equations for energy balance

  incold.h_out = inStream(incold.h_out);


  fluidOut_ref.p = pin_cold;
  fluidOut_ref.T = Tout_cold_set;
  hout_cold_ref = fluidOut_ref.h;
  0 = incold.m_flow*(-hout_cold_ref + hin_cold) - Pcold_ref;


  // Definition of Tout_cold_set
  Tout_cold_set = in_Tout_cold_set_internal;
  if not use_in_Tout_cold_set then
    in_Tout_cold_set_internal = Tout_cold_nom "Pressure set by parameter";
  end if;

  // Connect protected connectors to public conditional connectors
  connect(in_Tout_cold_set, in_Tout_cold_set_internal);




///////////////////////


  // Power of compressors
  //P_compressor1 = if compressor1_on then -100e3 else 0;
  //P_compressor2 = if compressor2_on then -100e3 else 0;
  //P_compressor1 = if compressor1_on then FO1.y else 0;
  //P_compressor2 = if compressor2_on then FO2.y else 0;
  //P_compressor1 = FO1.y;
  //P_compressor2 = FO2.y;
  // Total cooling power
  //Pcold = if cold_on then P_compressor1 + P_compressor2 else 0;
  Pcold = if cold_on then homotopy(min(Pcold_ref, 200e3),200e3) else 40e3;
  //Pcold = TT.y;
  //Pcold = 200e3;


///////////


initial equation
  if initOpt == Choices.Init.Options.steadyState then
    //der(M) = 0;
    der(Tout_cold) = 0;
    //der(pout) = 0;
  elseif initOpt == Choices.Init.Options.fixedState then
    Tout_cold = Tout_cold_start;
  else
//No initial equations
  end if;


equation
  /*
  if Tout_cold <= Tout_cold_set - T_bandwidth then
    cooling_phase :=false; // Enter heating phase
  elseif Tout_cold >= Tout_cold_set + T_bandwidth then
    cooling_phase :=true; // Enter cooling phase
  end if;
  //  cooling_phase := onOffController.y;
*/
//   when Tout_cold == Tout_cold_set then
//     if Pcold_ref < 100e3 then
//       comp1_control :=false;
//       comp2_control :=false;
//     else
//       comp1_control :=true;
//       comp2_control :=false;
//     end if;
//   end when;


/*  // Hysteresis control logic for compressor 1
  if cooling_phase then
    // In cooling phase, turn on compressors based on required cooling power
    if Pcold_ref < 10e3 then
      comp1_control := false;
      comp2_control := false;
    elseif Pcold_ref < 150e3 then
      comp1_control :=true;
      comp2_control :=false;
    else
      comp1_control :=true;
      comp2_control :=true;
    end if;
  else
    // In heating phase, turn off compressors based on temperature
    comp1_control :=false;
    comp2_control :=false;
       
//     if Tout_cold > Tout_cold_set + T_bandwidth then
//       comp1_control :=false;
//       comp2_control :=false;
//     else
//       comp1_control :=false;//if Tout_cold > Tout_cold_set then true else false;
//       comp2_control :=false;
//     end if;
  end if;
 */

//   if cooling_phase then
//     // In cooling phase, control compressors based on temperature thresholds
//     if Tout_cold > Tout_cold_set then
//       comp1_control :=true;
//       comp2_control :=false;
//     else
//       comp1_control :=false;
//       comp2_control :=false;
//     end if;
//
//     if Tout_cold <= Tout_cold_set -  T_bandwidth then
//       comp2_control :=true;
//     end if;
//   else
//     // In heating phase, turn off compressors based on temperature thresholds
//     if Tout_cold > Tout_cold_set +  T_bandwidth then
//       comp1_control :=false;
//       comp2_control :=false;
//     else
//       comp1_control :=if Tout_cold > Tout_cold_set then true else false;
//       comp2_control :=false;
//     end if;
//   end if;

    // Actual compressor ON/OFF state
  //compressor1_on :=comp1_control;
  //compressor2_on :=comp2_control;


algorithm
equation
  connect(C1.y, TT1.u) annotation (Line(points={{-23,16},{-12,16}},                     color={255,0,255}));
  connect(C2.y, TT2.u) annotation (Line(points={{-23,-14},{-12,-14}},                         color={255,0,255}));
  connect(TT1.y, FO1.u) annotation (Line(points={{11,16},{18,16}},                     color={0,0,127}));
  connect(TT2.y, FO2.u) annotation (Line(points={{11,-14},{18,-14}},                       color={0,0,127}));
  annotation (
    Icon);
end ControlledChillerNoDynamics;
