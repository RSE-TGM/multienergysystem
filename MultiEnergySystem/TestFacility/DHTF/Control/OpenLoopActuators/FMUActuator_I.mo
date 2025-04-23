within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_I
  extends BaseClass.FMUActuatorBase;

  Modelica.Blocks.Interfaces.RealInput FCV101theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-2,-17.5}),
                          iconTransformation(extent={{-110,-20},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealInput P101input annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-2,-10}),   iconTransformation(extent={{-110,-10},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-2,-25}),   iconTransformation(extent={{-110,0},{-100,10}})));
  Modelica.Blocks.Interfaces.BooleanInput GB101_status annotation (Placement(transformation(extent={{-5,-5},{5,5}}, origin={-2,-32.5}), iconTransformation(extent={{-5,-5},{5,5}}, origin={-105,-25})));
equation
  connect(FCV101theta, controlSignalBus.thetaFCV101) annotation (Line(points={{-2,-17.5},{87.5,-17.5},{87.5,0},{160,0}},
                                                                                                                  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P101input, controlSignalBus.omegaP101) annotation (Line(points={{-2,-10},{85.5,-10},{85.5,0},{160,0}},  color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(GB101Tout_SP, controlSignalBus.ToutGB101)
    annotation (Line(points={{-2,-25},{-2,-25.5},{89.5,-25.5},{89.5,0},{160,0}},
                                                                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(GB101_status, controlSignalBus.statusGB101)
    annotation (Line(points={{-2,-32.5},{91.5,-32.5},{91.5,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Diagram(coordinateSystem(extent={{-160,-220},{160,220}}, grid={0.5,0.5})));
end FMUActuator_I;
