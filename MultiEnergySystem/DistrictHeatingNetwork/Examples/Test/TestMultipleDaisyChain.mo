within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model TestMultipleDaisyChain
  MultiEnergySystem.DistrictHeatingNetwork.Actuators.MultipleDaisyChain multipleDaisyChain annotation(
    Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression U(y = 35e3)  annotation(
    Placement(visible = true, transformation(origin = {-54, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(U.y, multipleDaisyChain.U);

end TestMultipleDaisyChain;
