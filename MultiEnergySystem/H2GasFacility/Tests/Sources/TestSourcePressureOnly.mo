within MultiEnergySystem.H2GasFacility.Tests.Sources;
model TestSourcePressureOnly
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPR;
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure source(redeclare model Medium = Medium, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0,  0, 0.544}/100) annotation (
    Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end TestSourcePressureOnly;
