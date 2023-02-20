within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall;
model Wall_FixedT
  extends Thermal.BaseClasses.BaseSingleMultiPortWall;
equation
  for i in 1:n loop
    MultiPort.T[i] = Twall;
  end for;
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-48, 10}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Backward, extent = {{-12, -10}, {108, 10}})}));
end Wall_FixedT;
