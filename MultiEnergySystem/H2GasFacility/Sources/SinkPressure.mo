within MultiEnergySystem.H2GasFacility.Sources;

model SinkPressure "Pressure sink for water/steam flows"
  extends DistrictHeatingNetwork.Icons.Gas.SourceP;
  replaceable package Medium = MultiEnergySystem.H2GasFacility.Media.RealGases.CH4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
    "Medium model" annotation(
     choicesAllMatching = true);
  type HydraulicResistance = Real(final quantity = "HydraulicResistance", final unit = "Pa/(kg/s)");
  
  parameter Types.Pressure p0 = 1.01325e5
    "Nominal pressure";
  parameter HydraulicResistance R = 0 
    "Hydraulic resistance" annotation(
    Evaluate = true);
  parameter Boolean use_T = false 
    "Use the temperature if true, otherwise use specific enthalpy";
  parameter Types.Temperature T0 = 25 + 237.15 
    "Nominal temperature";
  parameter Types.MassFraction X0[fluid.nX] = fluid.X_start
    "Nominal mass fraction";
  parameter Boolean use_in_p0 = false 
    "Use connector input for the pressure" annotation(
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T0 = false 
    "Use connector input for the temperature" annotation(
    Dialog(group = "External inputs"),
    choices(checkBox = true));


  Types.Pressure p
    "Actual pressure";
  Types.Temperature T
    "Actual temperature";
  Types.MassFraction X[fluid.nX]
    "Actual mass fraction";
  Types.MassFlowRate m_flow
    "Actual mass flow rate";
    
    
  Medium fluid(T_start = T0, p_start = p0);
  
  H2GasFacility.Interfaces.FluidPortInlet inlet annotation(
    Placement(transformation(extent = {{-120, -20}, {-80, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 annotation(
    Placement(transformation(origin = {-40, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {-40, 84})));
  Modelica.Blocks.Interfaces.RealInput in_T0 if use_in_T0 "Externally supplied temperature" annotation(
    Placement(transformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {0, 96})));
protected
  Modelica.Blocks.Interfaces.RealInput in_p0_internal;
  Modelica.Blocks.Interfaces.RealInput in_T0_internal;
equation
  
  inlet.h_out = fluid.h;
  
  if R > 0 then
    inlet.p = p + inlet.m_flow*R;
  else
    inlet.p = p;
  end if;
  
  p = in_p0_internal;
  if not use_in_p0 then
    in_p0_internal = p0 "Pressure set by parameter";
  end if;
  
  T = in_T0_internal; 
  if not use_in_T0 then
    in_T0_internal = T0 "Temperature set by parameter";
  end if;

  
  // Fluid definition
  
  fluid.p = p;
  fluid.T = T;
  fluid.Xi = X0[1:fluid.nXi];
  X = fluid.X;
  
// Variables Definition   
  m_flow = inlet.m_flow;  
  
// Connect protected connectors to public conditional connectors
  connect(in_p0, in_p0_internal);
  connect(in_T0, in_T0_internal);
  
  annotation(
    Diagram(graphics),
    Documentation(info = "<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the incoming flowrate.</p>
<p>If <code>use_T</code> is false, the specific enthalpy is prescribed, otherwise the temperature is prescribed.</p>
<p>The pressure, specific enthalpy and temperature can be supplied from external inputs by setting to true the corresponding <code>use_in_XX</code> parameter and connecting an external signal to the input connector.</p>
</HTML>", revisions = "<html><head></head><body></body></html>"));
end SinkPressure;
