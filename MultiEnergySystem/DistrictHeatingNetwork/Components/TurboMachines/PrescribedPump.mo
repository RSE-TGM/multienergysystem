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
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})), Documentation(info="<html>
<h3>PrescribedPump</h3>

<p>
  <strong>Summary:</strong><br>
  The <code>PrescribedPump</code> model simulates a pump with a prescribed rotational speed (omega). It extends the
  <a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.BaseClass.PumpBase\">PumpBase</a> class and calculates pump head and power consumption based on polynomial characteristic curves.
</p>

<p>
  <strong>Key Features:</strong>
  <ul>
    <li>Uses externally prescribed or fixed rotational speed</li>
    <li>Includes head and power characteristic curves via polynomial expressions</li>
  </ul>
</p>

<p>
  <strong>Parameters:</strong>
  <ul>
    <li><code>use_in_omega</code>: If <code>true</code>, enables the external input for the pump's angular velocity</li>
  </ul>
</p>

<p>
  <strong>Inputs:</strong>
  <ul>
    <li><code>in_omega</code> (optional): Input for rotational speed in rad/s</li>
  </ul>
</p>

<p>
  <strong>Equations:</strong>
  <ul>
    <li>Pump head and power are computed using polynomial characteristics, scaled by the current omega value</li>
    <li>Handles minimum flow rate conditions for safe pump operation</li>
  </ul>
</p>

<p>
  <strong>Use Case:</strong><br>
  Ideal for simulation of pumps driven by a motor operating at a fixed or externally controlled speed.
</p>

</html>"));
end PrescribedPump;
