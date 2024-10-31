within MultiEnergySystem.ElectricNetwork.Interfaces;
connector ElectricPort "Generic electric power port"
  flow DistrictHeatingNetwork.Types.Power P;
  Modelica.Units.SI.ElectricPotential v;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ElectricPort;
