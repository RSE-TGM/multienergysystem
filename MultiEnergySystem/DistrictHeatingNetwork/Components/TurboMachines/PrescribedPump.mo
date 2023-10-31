within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;
model PrescribedPump
  extends BaseClass.PumpBase;
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
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end PrescribedPump;
