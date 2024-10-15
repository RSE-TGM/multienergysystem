within MultiEnergySystem.H2GasFacility.Components.Manifold;
model Junction2
  Interfaces.FluidPortInlet fluidPortInlet annotation (Placement(transformation(
          extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-120,-20},
            {-80,20}})));
  Interfaces.FluidPortOutlet fluidPortOutlet annotation (Placement(
        transformation(extent={{80,-20},{120,20}}), iconTransformation(extent={
            {80,-20},{120,20}})));
  Interfaces.FluidPortInlet fluidPortInlet1 annotation (Placement(
        transformation(extent={{-20,-120},{20,-80}}), iconTransformation(extent
          ={{-20,-120},{20,-80}})));
equation
  connect(fluidPortInlet, fluidPortOutlet) annotation (Line(
      points={{-100,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(fluidPortInlet1, fluidPortOutlet) annotation (Line(
      points={{0,-100},{0,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,26},{100,-28}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{26,-100},{-28,-14}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end Junction2;
