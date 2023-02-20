within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall;
model Wall_inputQ
  /*Componente che imposta una potenza termica entrante [W], quindi negativa*/
  extends Thermal.BaseClasses.BaseSingleMultiPortWall;
  Modelica.Blocks.Interfaces.RealInput S annotation (
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {1.33227e-15, 40}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  for i in 1:n loop
    MultiPort.Q_flow[i] = -S/n;
  end for;
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-48, 10}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
            fillPattern =                                                                                                                                                                                                        FillPattern.Backward, extent = {{-12, -10}, {108, 10}}), Text(origin = {1, 71},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, extent = {{-21, 9}, {19, -11}}, textString = "Q_flow")}));
end Wall_inputQ;
