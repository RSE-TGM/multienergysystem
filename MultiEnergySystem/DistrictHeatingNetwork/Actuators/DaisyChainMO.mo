within MultiEnergySystem.DistrictHeatingNetwork.Actuators;
model DaisyChainMO
"Daisy Chain actuator with more than 2 control actions (Multiple Outputs)"
  parameter Real Umax[n] "vector of 'n' elements with maximum value of actuation. e.g {10e3, 10e3, 5e3}";
  parameter Real Umin[n] "vector of 'n' elements with minium value of actuation";
  parameter Integer n = 3 " minimum 3, number of (control) actions to be activated using DaisyChain actuators";
  Modelica.Blocks.Interfaces.RealInput U annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Y[n] annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DistrictHeatingNetwork.Actuators.DaisyChain DC[n - 1] "Total number of single daisy chain components with two outputs only";
equation
  assert(n > 2, "There must be at least 2 DaisyChain actuators in series");
  for i in 1:n - 2 loop
    connect(DC[i+1].U, DC[i].Yout2);
  end for;

  for i in 1:n - 1 loop
    connect(DC[i].Yout1, Y[i]);
  end for;

  connect(DC[1].U, U);
  connect(DC[n - 1].Yout2, Y[n]);

  annotation (
    Icon(graphics={  Rectangle(fillColor = {210, 210, 210}, fillPattern = FillPattern.Solid, extent = {{-100, 80}, {100, -80}}), Rectangle(origin = {0, 42}, lineColor = {0, 0, 127}, extent = {{-20, 20}, {20, -20}}), Line(origin = {0.53147, 42.8218}, points = {{0, 18}, {0, -18}}, color = {192, 192, 192}, arrow = {Arrow.Filled, Arrow.None}), Line(origin = {0.53147, 42.8218}, points = {{-18, 0}, {18, 0}}, color = {192, 192, 192}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {0.53147, 42.8218}, points = {{-16, -16}, {-10, -16}, {10, 16}, {16, 16}}), Line(origin = {-58, 21}, points = {{-38, -21}, {-4, -21}, {-4, 19}, {38, 19}}, color = {0, 0, 127}, arrowSize = 5), Line(origin = {54, 42}, points = {{-34, -2}, {46, -2}}, color = {0, 0, 127}), Line(origin = {-7, -21}, points = {{-95, 21}, {-55, 21}, {-55, -19}, {106, -19}}, color = {0, 0, 127}), Text(origin = {0, -100}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
end DaisyChainMO;
