within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model VariableDifferentialPressurePump
  "Controllable differential pressure pump, flow from inlet to outlet"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sources.BaseClass.PartialIdealPump;
  Modelica.Blocks.Interfaces.RealInput Dp "Imposed pressure increase" annotation (
    Placement(visible = true, transformation(origin = {-78, 58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-78, 60}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  outlet.p - inlet.p = Dp;
end VariableDifferentialPressurePump;
