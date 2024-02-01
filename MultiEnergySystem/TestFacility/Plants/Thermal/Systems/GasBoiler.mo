within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model GasBoiler "System 100"
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;
  DistrictHeatingNetwork.Interfaces.FluidPortInlet                   inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet                   outlet annotation (
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points={{-21,-35},
              {-27,-3},{-21,-13},{-19,25},{-11,13},{1,37},{13,13},{19,25},{23,-15},{27,-5},{23,-35},
              {1,-43},{-21,-35}}),                                                                                                                                                                                                        Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points={{-15,-35},
              {-23,-13},{-15,-17},{-15,3},{-9,-1},{1,25},{9,-1},{15,3},{17,-17},{23,-13},{15,-37},{
              1,-43},{-15,-35}})}),                              Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end GasBoiler;
