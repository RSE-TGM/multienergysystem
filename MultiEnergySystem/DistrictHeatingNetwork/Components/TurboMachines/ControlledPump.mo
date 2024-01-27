within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;
model ControlledPump
  extends TurboMachines.BaseClass.PumpBase;
  parameter Boolean use_q_m3hr = false "= true to use input signal m_flow_set instead of m_flow_nominal" annotation (
    Dialog(group = "External inputs"), choices(checkBox = true));
  Modelica.Blocks.Interfaces.RealInput in_q_m3hr(start = qnom_inm3h_min) if use_q_m3hr "Prescribed mass flow rate" annotation (
    Placement(visible = true, transformation(origin = {-54, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Modelica.Blocks.Interfaces.RealInput in_q_m3hr_int "Internal connector for volumetric flow rate in m3/h";
equation
  if not use_q_m3hr then
    in_q_m3hr_int = qnom_inm3h;
  end if;
  q_m3h = in_q_m3hr_int;
  connect(in_q_m3hr, in_q_m3hr_int);
  W = homotopy((omega/omeganom)^3*(a[1] + q_m3h*(omeganom/omega)*(a[2] + a[3]*q_m3h*(omeganom/omega))),
               ((dpnom*qnom/etanom)*(omega/omeganom)*(q_m3h/qnom_inm3h)))  "Power Characteristic equation";
  head = homotopy((omega/omeganom)^2*(b[1]+ q_m3h*(omeganom/omega)*(b[2] + b[3]*q_m3h*(omeganom/omega))),
                  (headnom*(omega/omeganom)*(q_m3h/qnom_inm3h))) "Head Characteristic equation";
end ControlledPump;
