within MultiEnergySystem.ElectricNetwork.Interfaces;
connector ElectricPort_i "Generic electric power port"
  flow Modelica.Units.SI.Current i;
  Modelica.Units.SI.ElectricPotential v;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio = false)));
end ElectricPort_i;
