within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model FixedDifferentialPressurePump
  "Impose a fixed pressure increase between inlet and outlet"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sources.BaseClass.PartialIdealPump;
  parameter Modelica.Units.SI.AbsolutePressure Dp = 1.1e5 "Imposed pressure increase";
equation
  // Pressure drop
  outlet.p - inlet.p = Dp;
end FixedDifferentialPressurePump;
