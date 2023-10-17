within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;

model ControlledPump
  extends BaseClass.PumpBase;
  parameter Boolean use_m_flow = false "= true to use input signal m_flow_set instead of m_flow_nominal" annotation (
    Dialog(group = "External inputs", enable = control_m_flow), choices(checkBox = true)); 
  Modelica.Blocks.Interfaces.RealInput in_m_flow if use_m_flow "Prescribed mass flow rate" annotation(
    Placement(visible = true, transformation(origin = {-54, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_int "Internal connector for mass flow rate";
equation
  if not use_m_flow then
    in_m_flow_int = m_flow_nom;
  end if;
  m_flow = in_m_flow_int;  
  connect(in_m_flow, in_m_flow_int);
end ControlledPump;
