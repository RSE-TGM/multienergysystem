within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_II
  extends FMUActuator_I;
  Modelica.Blocks.Interfaces.RealInput EB401Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-51}),  iconTransformation(extent={{-110,-41},{-100,-31}})));
  Modelica.Blocks.Interfaces.RealInput P401input annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-58.5}),  iconTransformation(extent={{-110,-51},{-100,-41}})));
  Modelica.Blocks.Interfaces.RealInput FCV401theta annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-66}),  iconTransformation(extent={{-110,-61},{-100,-51}})));

  Modelica.Blocks.Interfaces.BooleanInput EB401_status annotation (Placement(transformation(extent={{-5,-5},{5,5}}, origin={0,-76.5}), iconTransformation(extent={{-5,-5},{5,5}}, origin={-105,-66})));
equation
  connect(EB401Tout_SP, controlSignalBus.ToutEB401) annotation (Line(points={{2.22045e-16,-51},{160,-51},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P401input, controlSignalBus.omegaP401) annotation (Line(points={{2.22045e-16,-58.5},{160,-58.5},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCV401theta, controlSignalBus.thetaFCV401) annotation (Line(points={{2.22045e-16,-66},{160,-66},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EB401_status, controlSignalBus.statusEB401) annotation (Line(points={{0,-76.5},{160,-76.5},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end FMUActuator_II;
