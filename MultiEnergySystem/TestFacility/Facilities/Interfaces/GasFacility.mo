within MultiEnergySystem.TestFacility.Facilities.Interfaces;
partial model GasFacility "Interface for a full gas facility"
  parameter Integer nXi_in1 = 6;
  parameter Integer nXi_in2 = 6;
  H2GasFacility.Interfaces.FluidPortOutlet outletGas(nXi=nXi_in1) "Output connector for one gas line" annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  annotation (Icon(                                             graphics={
                     Rectangle(lineColor = {182, 109, 49}, fillColor={253,234,218},    fillPattern=FillPattern.Solid,                lineThickness = 1, extent={{-100,100},{100,-100}},      radius=20)}),
                        Diagram(coordinateSystem(preserveAspectRatio=false)));
end GasFacility;
