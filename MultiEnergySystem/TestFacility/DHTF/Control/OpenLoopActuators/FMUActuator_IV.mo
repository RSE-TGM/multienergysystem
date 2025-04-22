within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_IV
  extends FMUActuator_III;
  Modelica.Blocks.Interfaces.RealInput P201omega
    annotation (
    Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={0,-112}),
    iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,-75})));
  Modelica.Blocks.Interfaces.IntegerInput S200_status annotation (
    Placement(transformation(
        extent={{-5,-132.5},{5,-122.5}},
        rotation=0),
    iconTransformation(
        extent={{105.004,29.5001},{95.0038,39.5001}},
        rotation=180,
        origin={-4.99621,-60.4999})));
  Modelica.Blocks.Interfaces.RealInput FCV201theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={0,-119.5}),  iconTransformation(extent={{-110,-90},{-100,-80}})));

equation
  connect(P201omega, controlSignalBus.omegaP201) annotation (Line(points={{0,-112},{160,-112},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCV201theta, controlSignalBus.thetaFCV201) annotation (Line(points={{0,-119.5},{160,-119.5},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(S200_status, controlSignalBus.statusS200) annotation (Line(points={{0,-127.5},{160,-127.5},{160,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end FMUActuator_IV;
