within MultiEnergySystem.H2GasFacility.Tests.Sources;
model TestSinkFlowOnly
  extends Modelica.Icons.Example;
  //replaceable model Medium = H2GasFacility.Media.RealGases.NaturalGasPR;
  //replaceable model Medium = H2GasFacility.Media.RealGases.NG6_H2_Papay;
  replaceable model Medium = H2GasFacility.Media.IdealGases.NG6_H2;
  H2GasFacility.Sources.SinkMassFlow sinkFlow(redeclare model Medium = Medium, G = 1000, X0 = {97.201, 1.862, 0.393, 0, 0, 0, 0.544}/100) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end TestSinkFlowOnly;
