within MultiEnergySystem.TestFacility.Export.FMU;
partial model CaseCentralisedBase
  extends Modelica.Blocks.Icons.Block;
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
  replaceable DHTF.Networks.Centralised.LoadControl.CentralSystemLoadControl_I facility annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  Interfaces.ControlSignalBus        controlSignalBus annotation (Placement(transformation(extent={{-20,26},{20,66}}),   iconTransformation(extent={{-20,80},{20,120}})));
  Modelica.Blocks.Interfaces.RealInput TT701_SP
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-35,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-90,-105})));
  Modelica.Blocks.Interfaces.RealInput TT711_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-25,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-80,-105})));
  Modelica.Blocks.Interfaces.RealInput TT721_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-15,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-70,-105})));
  Modelica.Blocks.Interfaces.RealInput TT731_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-5,100}),  iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-60,-105})));
  Modelica.Blocks.Interfaces.RealInput EX701Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={5,100}),  iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={10,-105})));
  Modelica.Blocks.Interfaces.RealInput EX711Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={15,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={20,-105})));
  Modelica.Blocks.Interfaces.RealInput EX721Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={25,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={30,-105})));
  Modelica.Blocks.Interfaces.RealInput EX731Pt_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={35,100}), iconTransformation(extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={40,-105})));
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
  Modelica.Blocks.Interfaces.RealInput P901omega annotation (Placement(transformation(
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
  Modelica.Blocks.Sources.BooleanExpression RR01_status(y=true) annotation (Placement(transformation(extent={{100,10},{80,30}})));
  Modelica.Blocks.Sources.RealExpression TT701_exp(y=facility.load.S701.TT7X1.T_meas) annotation (Placement(transformation(extent={{-99,-80.5},{-89,-69.5}})));
  Modelica.Blocks.Sources.RealExpression TT711_exp(y=facility.load.S711.TT7X1.T_meas) annotation (Placement(transformation(extent={{-99,-87.5},{-89,-77.5}})));
  Modelica.Blocks.Sources.RealExpression TT721_exp(y=facility.load.S721.TT7X1.T_meas) annotation (Placement(transformation(extent={{-99,-95.5},{-89,-84.5}})));
  Modelica.Blocks.Sources.RealExpression TT731_exp(y=facility.load.S731.TT7X1.T_meas) annotation (Placement(transformation(extent={{-99,-103},{-89,-92}})));
  Modelica.Blocks.Sources.RealExpression EX701Pt_exp(y=facility.load.S701.EX7X1.Pt) annotation (Placement(transformation(extent={{-70,-80},{-60,-70}})));
  Modelica.Blocks.Sources.RealExpression EX711Pt_exp(y=facility.load.S711.EX7X1.Pt) annotation (Placement(transformation(extent={{-70,-87.5},{-60,-77.5}})));
  Modelica.Blocks.Sources.RealExpression EX721Pt_exp(y=facility.load.S721.EX7X1.Pt) annotation (Placement(transformation(extent={{-70,-95},{-60,-85}})));
  Modelica.Blocks.Sources.RealExpression EX731Pt_exp(y=facility.load.S731.EX7X1.Pt) annotation (Placement(transformation(extent={{-70,-102.5},{-60,-92.5}})));
  Modelica.Blocks.Interfaces.RealOutput EX701Pt annotation (Placement(transformation(extent={{-55,-80},{-45,-70}}),   iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={60,-105})));
  Modelica.Blocks.Interfaces.RealOutput EX711Pt annotation (Placement(transformation(extent={{-55,-87.5},{-45,-77.5}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={70,-105})));
  Modelica.Blocks.Interfaces.RealOutput EX721Pt annotation (Placement(transformation(extent={{-55,-95},{-45,-85}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={80,-105})));
  Modelica.Blocks.Interfaces.RealOutput EX731Pt annotation (Placement(transformation(extent={{-55,-102.5},{-45,-92.5}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=270,
        origin={90,-105})));
  Modelica.Blocks.Interfaces.RealOutput TT701 annotation (Placement(transformation(extent={{-85,-80},{-75,-70}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-40,-105})));
  Modelica.Blocks.Interfaces.RealOutput TT711 annotation (Placement(transformation(extent={{-85,-87.5},{-75,-77.5}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-30,-105})));
  Modelica.Blocks.Interfaces.RealOutput TT721 annotation (Placement(transformation(extent={{-85,-95},{-75,-85}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-20,-105})));
  Modelica.Blocks.Interfaces.RealOutput TT731 annotation (Placement(transformation(extent={{-85,-102.5},{-75,-92.5}}), iconTransformation(extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={-10,-105})));
equation
  connect(facility.inletGas, sourceGas.outlet) annotation (Line(
      points={{30,0},{40,0},{40,-60},{50,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceVoltage.outlet, facility.electricPortInlet) annotation (Line(
      points={{-49,-59},{-40,-59},{-40,0},{-30,0}},
      color={56,93,138},
      thickness=1));
  connect(controlSignalBus, facility.controlSignalBus)
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
  connect(EX711Pt_exp.y, EX711Pt) annotation (Line(points={{-59.5,-82.5},{-50,-82.5}}, color={0,0,127}));
  connect(EX721Pt_exp.y, EX721Pt) annotation (Line(points={{-59.5,-90},{-50,-90}}, color={0,0,127}));
  connect(EX731Pt_exp.y, EX731Pt) annotation (Line(points={{-59.5,-97.5},{-50,-97.5}}, color={0,0,127}));
  connect(TT701_exp.y, TT701) annotation (Line(points={{-88.5,-75},{-80,-75}}, color={0,0,127}));
  connect(TT711_exp.y, TT711) annotation (Line(points={{-88.5,-82.5},{-80,-82.5}}, color={0,0,127}));
  connect(TT721_exp.y, TT721) annotation (Line(points={{-88.5,-90},{-80,-90}}, color={0,0,127}));
  connect(TT731_exp.y, TT731) annotation (Line(points={{-88.5,-97.5},{-80,-97.5}}, color={0,0,127}));
  connect(EX701Pt_exp.y, EX701Pt) annotation (Line(points={{-59.5,-75},{-50,-75}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5}, preserveAspectRatio = false), graphics={
                  Text(
                extent={{-53.5,-49.5},{54.5,-81.5}},
                textColor={135,135,135},
                textString="to FMU"),                                     Bitmap(
          extent={{-60,-50},{60,70}},
          imageSource=
              "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",
          fileName=
              "modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/facility.png")}),
    Diagram(coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime= 86400,
      Interval=17.28,
      Tolerance=1e-06, StartTime = 0));
end CaseCentralisedBase;
