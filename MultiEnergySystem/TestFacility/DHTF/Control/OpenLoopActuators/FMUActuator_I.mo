within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_I
  extends BaseClass.FMUActuatorBase;

  Modelica.Blocks.Interfaces.RealInput FCV101theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={70,100}), iconTransformation(extent={{-110,-20},{-100,-10}})));
  Modelica.Blocks.Sources.BooleanExpression GB101_status(y=true)  annotation (Placement(transformation(extent={{80,-5},{100,15}})));
  Modelica.Blocks.Interfaces.RealInput P101omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={77.5,100}), iconTransformation(extent={{-110,-10},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={85.5,100}), iconTransformation(extent={{-110,0},{-100,10}})));
equation
  connect(GB101_status.y, controlSignalBus.statusGB101) annotation (Line(points={{101,5},{110,5},{110,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCV101theta, controlSignalBus.thetaFCV101) annotation (Line(points={{70,100},{70,86},{160,86},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P101omega, controlSignalBus.omegaP101) annotation (Line(points={{77.5,100},{77.5,88},{160,88},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(GB101Tout_SP, controlSignalBus.ToutGB101)
    annotation (Line(points={{85.5,100},{85.5,90},{160,90},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
end FMUActuator_I;
