within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_III
  extends FMUActuator_II;
  Modelica.Blocks.Sources.BooleanExpression CHP501_status(y=true) annotation (Placement(transformation(extent={{80,-35},{100,-15}})));
  Modelica.Blocks.Interfaces.RealInput P501omega annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-91}),  iconTransformation(extent={{110,-70},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-76}),  iconTransformation(extent={{110,-50},{100,-40}})));
  Modelica.Blocks.Interfaces.RealInput CHPmflow annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-98.5}),  iconTransformation(extent={{110,-50},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Pel_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-84}),  iconTransformation(extent={{110,-40},{100,-30}})));

equation
  connect(CHP501_status.y, controlSignalBus.statusCHP501)
    annotation (Line(points={{101,-25},{134,-25},{134,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHP501Tout_SP, controlSignalBus.ToutCHP501) annotation (Line(points={{2.22045e-16,-76},{160,-76},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHP501Pel_SP, controlSignalBus.PtCHP501) annotation (Line(points={{2.22045e-16,-84},{160,-84},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P501omega, controlSignalBus.omegaP501) annotation (Line(points={{4.44089e-16,-91},{160,-91},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHPmflow, controlSignalBus.mflowCHP)
    annotation (Line(points={{0,-98.5},{80,-98.5},{80,-98},{160,-98},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end FMUActuator_III;
