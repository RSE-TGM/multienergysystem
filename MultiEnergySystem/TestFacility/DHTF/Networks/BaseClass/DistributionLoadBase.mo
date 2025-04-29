within MultiEnergySystem.TestFacility.DHTF.Networks.BaseClass;
model DistributionLoadBase
  extends DistrictHeatingNetwork.Icons.Water.Network;

  constant Real pi = Modelica.Constants.pi;

  Systems.Distribution.CentralizedFourHX distribution(
    T_start_cold(displayUnit="K") = 65 + 273.15,
    T_start_hot(displayUnit="K") = 80 + 273.15,
    pin_start_P901=200000,
    m_flow_S9=2.5)                                    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Systems.Load.LoadPlantFourHXControlledWithoutChiller load(
    nHX=3,
    EX701_q_m3h_hot=2,
    EX701_Tin_hot=353.15,
    EX701_Tout_hot=338.15,
    EX701_q_m3h_cold=1,
    EX701_Tin_cold=288.15,
    EX701_Tout_cold=313.15,
    EX701_TN_wall_start(displayUnit="K"),
    EX711_q_m3h_hot=2,
    EX711_Tin_hot=353.15,
    EX711_Tout_hot=338.15,
    EX711_q_m3h_cold=1,
    EX711_Tin_cold(displayUnit="degC") = 288.15,
    EX711_Tout_cold(displayUnit="degC") = 313.15,
    EX711_TN_wall_start(displayUnit="K"),
    EX721_q_m3h_hot=2,
    EX721_Tin_hot=353.15,
    EX721_Tout_hot=338.15,
    EX721_q_m3h_cold=1,
    EX721_Tin_cold=288.15,
    EX721_Tout_cold=313.15,
    EX731_q_m3h_hot=2,
    EX731_Tin_hot=353.15,
    EX731_Tout_hot=338.15,
    EX731_q_m3h_cold=1,
    EX731_Tin_cold=288.15,
    EX731_Tout_cold=313.15,
    q_Cool=25,
    q_Users_total=8,
    S701(
      y_start_PI_TT=0.4,
      y_start_PI_Pt=0.5,
      PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
      PI_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState),
      I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S711(
      y_start_PI_TT=0.4,
      y_start_PI_Pt=0.5,
         PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
         PI_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState),
         I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S731(
      y_start_PI_TT=0.4,
      y_start_PI_Pt=0.5,
         PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
         PI_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState),
         I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S721(
      y_start_PI_TT=0.4,
      y_start_PI_Pt=0.5,
         PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
         PI_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)))
                                                             annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,60},{20,100}}),  iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(
    p0=210000,
    T0(displayUnit="K") = 60 + 273.15,
    R=1e-3) annotation (Placement(transformation(extent={{-38,2},{-58,22}})));
  Modelica.Blocks.Sources.RealExpression omegaP901(y=2*pi*40)      annotation (Placement(transformation(extent={{-98,72},{-78,92}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV901(y=1) annotation (Placement(transformation(extent={{-98,58},{-78,78}})));
  Modelica.Blocks.Sources.RealExpression Pt701SP(y=35e3)                              annotation (Placement(transformation(extent={{100,90},{80,110}})));
  Modelica.Blocks.Sources.RealExpression TT7X1SP(y=65 + 273.15) annotation (Placement(transformation(extent={{100,76},{80,96}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVR01(y=1)                             annotation (Placement(transformation(extent={{100,62},{80,82}})));
  Modelica.Blocks.Sources.RealExpression ToutSPRR01(y=15 + 273.15) annotation (Placement(transformation(extent={{100,48},{80,68}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC0X(y=0.3)
                                                          annotation (Placement(transformation(extent={{100,34},{80,54}})));
  Modelica.Blocks.Sources.RealExpression omegaPR01sp(y=2*pi*40)       annotation (Placement(transformation(extent={{100,20},{80,40}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true) annotation (Placement(transformation(extent={{-68,40},{-48,60}})));
  inner System system annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourcePressure(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-3) annotation (Placement(transformation(extent={{-60,-26},{-40,-6}})));
equation
  connect(distribution.fluidPortInlet, load.fluidPortOutlet) annotation (Line(
      points={{20,12},{40,12}},
      color={140,56,54},
      thickness=0.5));
  connect(distribution.fluidPortOutlet, load.fluidPortInlet) annotation (Line(
      points={{20,-12},{40,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(Pt701SP.y, controlSignalBus.PtEX701) annotation (Line(points={{79,100},{0,100},{0,80}}, color={0,0,127}));
  connect(Pt701SP.y, controlSignalBus.PtEX711) annotation (Line(points={{79,100},{0,100},{0,80}}, color={0,0,127}));
  connect(Pt701SP.y, controlSignalBus.PtEX721) annotation (Line(points={{79,100},{66,100},{66,106},{52,106},{52,80},{0,80}}, color={0,0,127}));
  connect(Pt701SP.y, controlSignalBus.PtEX731) annotation (Line(points={{79,100},{72,100},{72,88},{0,88},{0,80}}, color={0,0,127}));
  connect(TT7X1SP.y, controlSignalBus.ToutEX701) annotation (Line(points={{79,86},{50,86},{50,84},{0,84},{0,80}}, color={0,0,127}));
  connect(TT7X1SP.y, controlSignalBus.ToutEX711) annotation (Line(points={{79,86},{50,86},{50,84},{0,84},{0,80}}, color={0,0,127}));
  connect(TT7X1SP.y, controlSignalBus.ToutEX721) annotation (Line(points={{79,86},{50,86},{50,84},{0,84},{0,80}}, color={0,0,127}));
  connect(TT7X1SP.y, controlSignalBus.ToutEX731) annotation (Line(points={{79,86},{72,86},{72,80},{0,80}}, color={0,0,127}));
  connect(thetaFCVC0X.y, controlSignalBus.thetaFCVC01) annotation (Line(points={{79,44},{0,44},{0,80}}, color={0,0,127}));
  connect(thetaFCVC0X.y, controlSignalBus.thetaFCVC02) annotation (Line(points={{79,44},{44,44},{44,48},{0,48},{0,80}}, color={0,0,127}));
  connect(thetaFCVR01.y, controlSignalBus.thetaFCVR01) annotation (Line(points={{79,72},{0,72},{0,80}}, color={0,0,127}));
  connect(ToutSPRR01.y, controlSignalBus.ToutRR01) annotation (Line(points={{79,58},{66,58},{66,62},{0,62},{0,80}}, color={0,0,127}));
  connect(omegaP901.y, controlSignalBus.omegaP901) annotation (Line(points={{-77,82},{-24,82},{-24,80},{0,80}}, color={0,0,127}));
  connect(omegaPR01sp.y, controlSignalBus.omegaPR01) annotation (Line(points={{79,30},{62,30},{62,32},{0,32},{0,80}}, color={0,0,127}));
  connect(thetaFCV901.y, controlSignalBus.thetaFCV901) annotation (Line(points={{-77,68},{-62,68},{-62,66},{0,66},{0,80}}, color={0,0,127}));
  connect(booleanExpression.y, controlSignalBus.statusRR01) annotation (Line(points={{-47,50},{0,50},{0,80}}, color={255,0,255}));
  connect(sourcePressure.outlet, distribution.senthot) annotation (Line(
      points={{-40,-16},{-34,-16},{-34,-14},{-28,-14},{-28,-12},{-20,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus, distribution.controlSignalBus)
    annotation (Line(
      points={{0,80},{0,80},{0,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus, load.controlSignalBus)
    annotation (Line(
      points={{0,80},{60,80},{60,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (experiment(
      StopTime=100000,
      Tolerance=1e-06, StartTime = 0, Interval = 200));
end DistributionLoadBase;
