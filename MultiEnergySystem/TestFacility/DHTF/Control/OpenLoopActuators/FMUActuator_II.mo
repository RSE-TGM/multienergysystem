within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_II
  extends FMUActuator_I;
  Modelica.Blocks.Sources.BooleanExpression EB101_status(y=true) annotation (Placement(transformation(extent={{80,-19},{100,1}})));
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-51}),  iconTransformation(extent={{-110,-35},{-100,-25}})));
  Modelica.Blocks.Interfaces.RealInput P401omega annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-58.5}),  iconTransformation(extent={{-110,-45},{-100,-35}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-66}),  iconTransformation(extent={{-110,-55},{-100,-45}})));

equation
  connect(EB101_status.y, controlSignalBus.statusEB401) annotation (Line(points={{101,-9},{110,-9},{110,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EB401Tout_SP, controlSignalBus.ToutEB401) annotation (Line(points={{2.22045e-16,-51},{160,-51},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P401omega, controlSignalBus.omegaP401) annotation (Line(points={{2.22045e-16,-58.5},{160,-58.5},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCV401theta, controlSignalBus.thetaFCV401) annotation (Line(points={{2.22045e-16,-66},{160,-66},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end FMUActuator_II;
