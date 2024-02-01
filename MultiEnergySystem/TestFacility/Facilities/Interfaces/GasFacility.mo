within MultiEnergySystem.TestFacility.Facilities.Interfaces;
partial model GasFacility "Interface for a full gas facility"
  parameter Integer nXi_in1 = 6;
  parameter Integer nXi_in2 = 6;
  H2GasFacility.Interfaces.FluidPortOutlet outletGas1(nXi=nXi_in1)
    "Output connector for one gas line" annotation (Placement(transformation(extent={{-60,80},{-20,
            120}}), iconTransformation(extent={{-60,80},{-20,120}})));
  H2GasFacility.Interfaces.FluidPortOutlet inletGas2(nXi=nXi_in2)
    "Output connector for one gas line"                annotation (Placement(transformation(extent={
            {-60,-120},{-20,-80}}), iconTransformation(extent={{20,80},{60,120}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Rectangle(
          lineColor={140,56,54},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-100,100},{100,-100}},
          radius=25),                                                                                                                                                                                                        Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-48,44},
              {44,-46}}),
                     Polygon(origin={-3,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin={-3,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}}),
        Text(
          extent={{-60,-52},{60,-92}},
          textColor={255,255,255},
          textString="Gas")}),
                        Diagram(coordinateSystem(preserveAspectRatio=false)));
end GasFacility;
