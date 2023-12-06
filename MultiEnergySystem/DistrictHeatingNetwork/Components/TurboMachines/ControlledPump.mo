within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;
model ControlledPump
  extends BaseClass.PumpBase;
  parameter Boolean use_q_m3hr = false "= true to use input signal m_flow_set instead of m_flow_nominal" annotation (
    Dialog(group = "External inputs"), choices(checkBox = true));
  Modelica.Blocks.Interfaces.RealInput in_q_m3hr if use_q_m3hr "Prescribed mass flow rate" annotation (
    Placement(visible = true, transformation(origin = {-54, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Modelica.Blocks.Interfaces.RealInput in_q_m3hr_int "Internal connector for mass flow rate";
equation
  if not use_q_m3hr then
    in_q_m3hr_int = qnom_inm3h;
  end if;
  q_m3h = in_q_m3hr_int;
  connect(in_q_m3hr, in_q_m3hr_int);
end ControlledPump;
