within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model IdealMassFlowSource "Generate a fixed mass flow rate at a temperature given from outside"

  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};

  parameter Boolean allowFlowReversal = false "= if true, allow flow reversal" annotation (
    Evaluate=true, Dialog(group = "Choices"));
  parameter Boolean use_in_m_flow = false "Use connector input for the nominal flow rate" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));
  parameter Boolean use_in_T = false "Use connector input for the temperature" annotation (
    Dialog(group = "External inputs"),
    choices(checkBox = true));

  parameter Modelica.Units.SI.MassFlowRate mflownom = 1 "nominal mass flow";
  parameter Modelica.Units.SI.Temperature Tnom = 80 + 273.15 "nominal temperature";

  Modelica.Blocks.Interfaces.RealInput in_m_flow if use_in_m_flow "Output mass flow" annotation (
      Placement(
      visible=true,
      transformation(
        origin={-22,-18},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-50,62},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealInput in_T if use_in_T "Temperature" annotation (
      Placement(visible = true, transformation(origin={-24,36},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={50,62},      extent={{-10,-10},
            {10,10}},                                                                                                                                                                       rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(
        transformation(extent={{82,-20},{122,20}}), iconTransformation(extent={{
            82,-20},{122,20}})));
protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_internal;
  Modelica.Blocks.Interfaces.RealInput in_T_internal;

equation
    //inlet.m_flow =-m_flow;
  outlet.h_out = cp * in_T_internal;

  outlet.m_flow = -in_m_flow_internal;

  if use_in_m_flow == false then
    in_m_flow_internal = mflownom "Flow rate set by parameter";
  end if;

  if use_in_T == false then
    in_T_internal = Tnom "Temperature set by parameter";
  end if;

  connect(in_m_flow, in_m_flow_internal);
  connect(in_T, in_T_internal);

    annotation (Icon(graphics={
                     Text(origin={0,-100},  extent={{-100,20}, {100,-20}}, textString = "%name"),
                     Rectangle(lineColor = {173, 173, 173}, lineThickness = 3, extent={{-100,58}, {100,-62}}),
                     Polygon(lineColor={135,135,135}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-20,-20}, {60,0},{-20,20},{18,0},{-20,-20}}, lineThickness=0.5)}));
end IdealMassFlowSource;
