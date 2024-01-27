within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;
model PrescribedPump
  extends TurboMachines.BaseClass.PumpBase;
  parameter Boolean use_in_omega = false "Use connector input for the rotational speed" annotation (
    Dialog(group = "External inputs"), choices(checkBox = true));
  Modelica.Blocks.Interfaces.RealInput in_omega if use_in_omega "rad" annotation (
    Placement(visible = true, transformation(origin = {-26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
protected
  Modelica.Blocks.Interfaces.RealInput in_omega_int "Internal connector for rotational speed";
equation
  if not use_in_omega then
    in_omega_int = omeganom "Rotational speed provided by parameter";
  end if;
  omega = in_omega_int "Rotational speed";
  connect(in_omega, in_omega_int);
  W = homotopy((omega/omeganom)^3*(a[1] + q_m3h*(omeganom/omega)*(a[2] + a[3]*q_m3h*(omeganom/omega))),
               ((a[1] + q_m3h*(omeganom/omega)*(a[2] + a[3]*q_m3h*(omeganom/omega)))))  "Power Characteristic equation";
  head = if q_m3h >= qnom_inm3h_min then homotopy((omega/omeganom)^2*(b[1]+ q_m3h*(omeganom/omega)*(b[2] + b[3]*q_m3h*(omeganom/omega))),
                  ((b[1]+ q_m3h*(omeganom/omega)*(b[2] + b[3]*q_m3h*(omeganom/omega))))) else (omega/omeganom)^2*(b[1]+ (qnom_inm3h_min)*(omeganom/omega)*(b[2] + b[3]*(qnom_inm3h_min)*(omeganom/omega))) "Head Characteristic equation";
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end PrescribedPump;
