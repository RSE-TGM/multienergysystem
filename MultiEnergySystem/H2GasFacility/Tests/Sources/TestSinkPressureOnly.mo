within MultiEnergySystem.H2GasFacility.Tests.Sources;
model TestSinkPressureOnly
  extends Modelica.Icons.Example;
  replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPR;
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sink(redeclare model Medium = Medium, T0 = 15 + 273.15, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0,  0, 0.544}/100) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end TestSinkPressureOnly;
