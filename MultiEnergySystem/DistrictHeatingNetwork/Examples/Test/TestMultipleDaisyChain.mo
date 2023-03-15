within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model TestMultipleDaisyChain
  MultiEnergySystem.DistrictHeatingNetwork.Actuators.MultipleDaisyChain multipleDaisyChain annotation(
    Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression U(y = if time < 10 then 20e3 else 38e3)  annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Actuators.DaisyChainMO daisyChainMO(Umax = {10e3, 10e3, 10e3, 10e3}, Umin = {0, 0, 0, 0}, n = 4)  annotation(
    Placement(visible = true, transformation(origin = {5, -39}, extent = {{-29, -29}, {29, 29}}, rotation = 0)));
equation
  connect(U.y, multipleDaisyChain.U);
  connect(U.y, daisyChainMO.U) annotation(
    Line(points = {{-48, 0}, {-40, 0}, {-40, -38}, {-30, -38}}, color = {0, 0, 127}));
end TestMultipleDaisyChain;
