within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators.BaseClass;
model FMUActuatorBase
  constant Real pi = Modelica.Constants.pi;
  parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
  parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
  parameter Boolean useRealExpression = true "true if use RealExpression blocks as set-point variables";

  Modelica.Blocks.Interfaces.RealInput TT701_SP
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-35,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-76,105})));
  Modelica.Blocks.Interfaces.RealInput TT711_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-25,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-66,105})));
  Modelica.Blocks.Interfaces.RealInput TT721_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-15,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-56,105})));
  Modelica.Blocks.Interfaces.RealInput TT731_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-5,100}),  iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-46,105})));
  Modelica.Blocks.Interfaces.RealInput EX701Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={5,100}),  iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={6,105})));
  Modelica.Blocks.Interfaces.RealInput EX711Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={15,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={16,105})));
  Modelica.Blocks.Interfaces.RealInput EX721Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={25,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={26,105})));
  Modelica.Blocks.Interfaces.RealInput EX731Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={35,100}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={36,105})));
  Modelica.Blocks.Interfaces.RealInput FCVC01theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-55,100}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,90})));
  Modelica.Blocks.Interfaces.RealInput FCVC02theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-45.5,100}),
                           iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,80})));
  Modelica.Blocks.Interfaces.RealInput P901input annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={44.5,100}),
                          iconTransformation(extent={{-110,15.5},{-100,25.5}})));
  Modelica.Blocks.Interfaces.RealInput FCV901theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={55,100}), iconTransformation(extent={{-110,25},{-100,35}})));
  Modelica.Blocks.Interfaces.RealInput RR01Tout_SP
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,75}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,65})));
  Modelica.Blocks.Interfaces.RealInput FCVR01theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,67.5}),
                           iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,55})));
  Modelica.Blocks.Interfaces.RealInput PR01omega
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,60}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,45})));
  Modelica.Blocks.Sources.BooleanExpression RR01_status(y=true) annotation (Placement(transformation(extent={{80,10},{100,30}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin={0,-96},   extent = {{-30, -30}, {30, 30}}, rotation=180)));
  Modelica.Blocks.Interfaces.BooleanInput FV933status
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-87,105}), iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-87,105})));
  Modelica.Blocks.Sources.BooleanExpression FV933_status(y=false)
                                                                annotation (Placement(transformation(extent={{64,-21},{84,-1}})));
equation
  connect(FCV901theta, controlSignalBus.thetaFCV901) annotation (Line(points={{55,100},{55,93},{160,93},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P901input, controlSignalBus.omegaP901) annotation (Line(points={{44.5,100},{44.5,84},{160,84},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX731Pt_SP, controlSignalBus.PtEX731) annotation (Line(points={{35,100},{36,100},{36,80},{160,80},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX721Pt_SP, controlSignalBus.PtEX721) annotation (Line(points={{25,100},{26,100},{26,75},{160,75},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EX711Pt_SP, controlSignalBus.PtEX711) annotation (Line(points={{15,100},{15,70},{160,70},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701Pt_SP, controlSignalBus.PtEX701) annotation (Line(points={{5,100},{5,64},{160,64},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT731_SP, controlSignalBus.ToutEX731)
    annotation (Line(points={{-5,100},{-5,60},{156,60},{156,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT721_SP, controlSignalBus.ToutEX721) annotation (Line(points={{-15,100},{-15,54},{160,54},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT711_SP, controlSignalBus.ToutEX711) annotation (Line(points={{-25,100},{-25,47},{160,47},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT701_SP, controlSignalBus.ToutEX701) annotation (Line(points={{-35,100},{-35,42},{160,42},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC01theta, controlSignalBus.thetaFCVC01)
    annotation (Line(points={{-55,100},{-55,32},{160,32},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC02theta, controlSignalBus.thetaFCVC02)
    annotation (Line(points={{-45.5,100},{-45.5,37},{160,37},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(PR01omega, controlSignalBus.omegaPR01) annotation (Line(points={{-100,60},{-90,60},{-90,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCVR01theta, controlSignalBus.thetaFCVR01) annotation (Line(points={{-100,67.5},{-85,67.5},{-85,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(RR01Tout_SP, controlSignalBus.ToutRR01) annotation (Line(points={{-100,75},{-79,75},{-79,0},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(RR01_status.y, controlSignalBus.statusRR01)
    annotation (Line(points={{101,20},{122,20},{122,19},{141,19},{141,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FV933_status.y, controlSignalBus.statusFV933) annotation (Line(points={{85,-11},{112,-11},{112,0},{160,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(                                               graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-70, 100}, {70, -100}}, textColor={0,0,0},     textStyle={
              TextStyle.Bold},
          textString="Actuator")}),
    Diagram(coordinateSystem(extent={{-160,-220},{160,220}}, grid={1,1})));
end FMUActuatorBase;
