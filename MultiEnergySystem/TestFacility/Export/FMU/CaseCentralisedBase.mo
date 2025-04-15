within MultiEnergySystem.TestFacility.Export.FMU;
partial model CaseCentralisedBase
  extends Modelica.Icons.Example;
  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  // Gas composition
  parameter Integer nX = 1 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {1} "Mass composition";

  H2GasFacility.Sources.SourcePressure sourceGas(redeclare model Medium = Gas, X0 = X_gas, R = 1e-3, computeEnergyVariables = true, computeTransport = false) annotation (
    Placement(transformation(extent={{-10,10},{10,-10}},      rotation=180,   origin={60,-60})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent={{-69,-69},{-49,-49}})));
  inner System system annotation (
    Placement(transformation(extent={{80,-100},{100,-80}})));
  replaceable DHTF.Networks.Centralised.CentralizedSystem_LoadControlled plant annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  Interfaces.ControlSignalBus        controlSignalBus annotation (Placement(transformation(extent={{-20,26},{20,66}}),   iconTransformation(extent={{-20,80},{20,120}})));
  Modelica.Blocks.Interfaces.RealInput TT701_SP
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-35,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-30,100})));
  Modelica.Blocks.Interfaces.RealInput TT711_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-25,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,100})));
  Modelica.Blocks.Interfaces.RealInput TT721_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-15,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,100})));
  Modelica.Blocks.Interfaces.RealInput TT731_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-5,100}),  iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-90,100})));
  Modelica.Blocks.Interfaces.RealInput EX701Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={5,100}),  iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={30,100})));
  Modelica.Blocks.Interfaces.RealInput EX711Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={15,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,100})));
  Modelica.Blocks.Interfaces.RealInput EX721Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={25,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={70,100})));
  Modelica.Blocks.Interfaces.RealInput EX731Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={35,100}), iconTransformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={90,100})));
  Modelica.Blocks.Interfaces.RealInput FCVC01theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-55,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,90})));
  Modelica.Blocks.Interfaces.RealInput FCVC02theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-45.5,100}),
                           iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,70})));
  Modelica.Blocks.Interfaces.RealInput P901omega annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={44.5,100}),
                          iconTransformation(extent={{-110,-40},{-90,-20}})));
  Modelica.Blocks.Interfaces.RealInput FCV901theta annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={55,100}), iconTransformation(extent={{-110,-20},{-90,0}})));
  Modelica.Blocks.Interfaces.RealInput RR01Tout_SP
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,75}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,50})));
  Modelica.Blocks.Interfaces.RealInput FCVR01theta
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,67.5}),
                           iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,30})));
  Modelica.Blocks.Interfaces.RealInput PR01omega
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,60}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-100,10})));
  Modelica.Blocks.Sources.BooleanExpression RR01_status(y=true) annotation (Placement(transformation(extent={{100,10},{80,30}})));
equation
  connect(plant.inletGas, sourceGas.outlet) annotation (Line(
      points={{30,0},{40,0},{40,-60},{50,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceVoltage.outlet, plant.electricPortInlet) annotation (Line(
      points={{-49,-59},{-40,-59},{-40,0},{-30,0}},
      color={56,93,138},
      thickness=1));
  connect(controlSignalBus, plant.controlSignalBus)
    annotation (Line(
      points={{0,46},{0,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT731_SP, controlSignalBus.ToutEX731) annotation (Line(points={{-5,100},{-5,86},{0,86},{0,46}},   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT721_SP, controlSignalBus.ToutEX721) annotation (Line(points={{-15,100},{-15,85},{0,85},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT711_SP, controlSignalBus.ToutEX711) annotation (Line(points={{-25,100},{-25,84},{0,84},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(TT701_SP, controlSignalBus.ToutEX701) annotation (Line(points={{-35,100},{-35,83},{0,83},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX701Pt_SP, controlSignalBus.PtEX701) annotation (Line(points={{5,100},{5,86},{0,86},{0,46}},   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX711Pt_SP, controlSignalBus.PtEX711) annotation (Line(points={{15,100},{15,85},{0,85},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX721Pt_SP, controlSignalBus.PtEX721) annotation (Line(points={{25,100},{25,84},{0,84},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(EX731Pt_SP, controlSignalBus.PtEX731) annotation (Line(points={{35,100},{35,83},{0,83},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(RR01_status.y, controlSignalBus.statusRR01) annotation (Line(points={{79,20},{70,20},{70,46},{0,46}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC02theta, controlSignalBus.thetaFCVC02) annotation (Line(points={{-45.5,100},{-45.5,82},{0,82},{0,46}},
                                                                                                                 color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCVC01theta, controlSignalBus.thetaFCVC01) annotation (Line(points={{-55,100},{-55,81},{0,81},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(P901omega, controlSignalBus.omegaP901) annotation (Line(points={{44.5,100},{44.5,82},{0,82},{0,46}},
                                                                                                           color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FCV901theta, controlSignalBus.thetaFCV901) annotation (Line(points={{55,100},{55,81},{0,81},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(RR01Tout_SP, controlSignalBus.ToutRR01) annotation (Line(points={{-100,75},{0,75},{0,46}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(FCVR01theta, controlSignalBus.thetaFCVR01)
    annotation (Line(points={{-100,67.5},{0,67.5},{0,46}},               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PR01omega, controlSignalBus.omegaPR01) annotation (Line(points={{-100,60},{0,60},{0,46}},                   color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime= 86400,
      Interval=17.28,
      Tolerance=1e-06, StartTime = 0));
end CaseCentralisedBase;
