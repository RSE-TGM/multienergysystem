within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model FMUActuator_III
  extends FMUActuator_II;
  Modelica.Blocks.Interfaces.RealInput P501input annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-105}), iconTransformation(extent={{110,-70},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Tout_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-90}),  iconTransformation(extent={{110,-50},{100,-40}})));
  Modelica.Blocks.Interfaces.RealInput CHPmflow annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-112.5}), iconTransformation(extent={{110,-50},{100,-60}})));
  Modelica.Blocks.Interfaces.RealInput CHP501Pel_SP annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={0,-98}),  iconTransformation(extent={{110,-40},{100,-30}})));

  Modelica.Blocks.Interfaces.BooleanInput CHP501_status annotation (Placement(transformation(extent={{-5,5},{5,-5}}, origin={0,-120.5}), iconTransformation(extent={{5,-5},{-5,5}}, origin={105,-76})));
equation
  connect(CHP501Tout_SP, controlSignalBus.ToutCHP501) annotation (Line(points={{2.22045e-16,-90},{160,-90},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHP501Pel_SP, controlSignalBus.PtCHP501) annotation (Line(points={{2.22045e-16,-98},{160,-98},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P501input, controlSignalBus.omegaP501) annotation (Line(points={{4.44089e-16,-105},{160,-105},{160,0}},
                                                                                                                color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHPmflow, controlSignalBus.mflowCHP)
    annotation (Line(points={{0,-112.5},{80,-112.5},{80,-112},{160,-112},{160,0}},
                                                                               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHP501_status, controlSignalBus.statusCHP501) annotation (Line(points={{0,-120.5},{160,-120.5},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end FMUActuator_III;
