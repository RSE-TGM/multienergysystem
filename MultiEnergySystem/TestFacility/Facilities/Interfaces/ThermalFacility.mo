within MultiEnergySystem.TestFacility.Facilities.Interfaces;
partial model ThermalFacility
  parameter Integer nXi_in1 = 6;
  parameter Integer nXi_in2 = 6;
  H2GasFacility.Interfaces.FluidPortInlet inletGas1(nXi=nXi_in1)
    "Connector for one component of the thermal facility" annotation (Placement(transformation(
          extent={{-60,-120},{-20,-80}}), iconTransformation(extent={{-60,-120},{-20,-80}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas2(nXi=nXi_in2)
    "Connector for one component of the test facility" annotation (Placement(transformation(extent={{22,-120},
            {62,-80}}),             iconTransformation(extent={{20,-120},{60,-80}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Rectangle(
          lineColor={140,56,54},
          fillColor={192,80,77},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-100,100},{100,-100}},
          radius=0)}),  Diagram(coordinateSystem(preserveAspectRatio=false)));
end ThermalFacility;
