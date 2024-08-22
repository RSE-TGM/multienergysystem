within MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings;
model Junction
  Interfaces.FluidPortInlet inlet "First Inlet" annotation (Placement(transformation(
          extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-120,-20},{-80,20}})));
  Interfaces.FluidPortOutlet outlet "first outlet" annotation (Placement(transformation(
          extent={{80,-20},{120,20}}), iconTransformation(extent={{80,-20},{120,20}})));
  Interfaces.FluidPortOutlet inoutlet annotation (Placement(transformation(extent={{-20,
            -120},{20,-80}}), iconTransformation(extent={{-20,-120},{20,-80}})));
equation
  connect(inlet, inoutlet) annotation (Line(
      points={{-100,0},{0,0},{0,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(outlet, inoutlet) annotation (Line(
      points={{100,0},{0,0},{0,-100}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(graphics={
                     Rectangle(                   lineColor = {102, 102, 102}, fillColor={192,80,77},       fillPattern
            = FillPattern.Solid,                                                                                                                          extent={{-33,36},
              {33,-36}},
          origin={0,-67},
          rotation=90,
          radius=5), Rectangle(                   lineColor = {102, 102, 102}, fillColor={192,80,77},       fillPattern
            = FillPattern.Solid,                                                                                                                          extent={{-100,36},
              {100,-36}},
          radius=5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Junction;
