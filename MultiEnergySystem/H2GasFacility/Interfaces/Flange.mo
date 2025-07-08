within MultiEnergySystem.H2GasFacility.Interfaces;
connector Flange "One dimensional rotational flange"
  H2GasFacility.Types.Angle phi "Absolute rotation angle of flange";
  flow H2GasFacility.Types.Torque tau "Cut torque in the flange";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Flange;
