within MultiEnergySystem.TestFacility.DHTF.Networks.BaseClass;
model TestBase
  extends DistrictHeatingNetwork.Icons.Water.Network;
  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer nX = 1 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {1} "Mass composition";

  Systems.Distribution.CentralizedFourHX distribution(
    redeclare TestFacility.DHTF.Subsystems.Distribution.CirculationPumpPC S900,
    T_start_cold(displayUnit="K") = 65 + 273.15,
    T_start_hot(displayUnit="K") = 80 + 273.15,
    pin_start_P901=200000,
    m_flow_S9=2.5,
    FCVC02(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic),
    FCVC01(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic))
                                              annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
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
      y_start_PI_TT=0.3,
      y_start_PI_Pt=0.3,
      PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
      I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S711(
      y_start_PI_TT=0.3,
      y_start_PI_Pt=0.3,
      y_start_I_m_flow=0.6,
      PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
      I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S731(
      y_start_PI_TT=0.3,
      y_start_PI_Pt=0.3,
      PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
      I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)),
    S721(
      y_start_PI_TT=0.3,
      y_start_PI_Pt=0.3,
      y_start_I_m_flow=0.6,
      PI_TT7X1(initType=Modelica.Blocks.Types.Init.SteadyState),
      I_EX7X1Pt(initType=Modelica.Blocks.Types.Init.SteadyState)))
                                                             annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,60},{20,100}}),  iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(
    p0=210000,
    T0(displayUnit="K") = 60 + 273.15,
    R=1e-3) annotation (Placement(transformation(extent={{-4,-74},{-24,-54}})));
  Modelica.Blocks.Sources.RealExpression omegaP901(y=1.20e5)        annotation (Placement(transformation(extent={{-90,94},{-78,106}})));
  Modelica.Blocks.Sources.RealExpression thetaFCV901(y=1) annotation (Placement(transformation(extent={{-90,86},{-78,98}})));
  Modelica.Blocks.Sources.RealExpression Pt701SP(y=if time < 2e5 then 35e3 elseif time < 3e5 then 37e3 else 35e3)
                                                                                      annotation (Placement(transformation(extent={{100,90},{80,110}})));
  Modelica.Blocks.Sources.RealExpression TT7X1SP(y=65 + 273.15) annotation (Placement(transformation(extent={{100,76},{80,96}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVR01(y=1)                             annotation (Placement(transformation(extent={{100,62},{80,82}})));
  Modelica.Blocks.Sources.RealExpression ToutSPRR01(y=15 + 273.15) annotation (Placement(transformation(extent={{100,48},{80,68}})));
  Modelica.Blocks.Sources.RealExpression omegaPR01sp(y=2*pi*40)       annotation (Placement(transformation(extent={{100,20},{80,40}})));
  Modelica.Blocks.Sources.BooleanExpression EB401status(y=true) annotation (Placement(transformation(extent={{-90,102},{-78,112}})));
  inner System system annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourcePressure(
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-3) annotation (Placement(transformation(extent={{6,-66},{26,-46}})));
  replaceable Systems.HeatGeneration.CentralizedThreeGenGBEBCHP heatGeneration(
    redeclare model Gas = Gas,
    X_gas={1},
    pin_start_S100=200000,
    pin_start_S400=200000,
    redeclare Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare Subsystems.HeatGeneration.ElectricBoilerFC S400(nR=5),
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500) annotation (Placement(transformation(extent={{-86,-22},{-46,18}})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true,
    computeTransport=false)                                                                                                                                   annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin={-56,-54})));
  Modelica.Blocks.Sources.RealExpression m_flow_P101(y=1.45) annotation (Placement(transformation(extent={{-90,78},{-78,88}})));
  Modelica.Blocks.Sources.RealExpression GB101_ToutSP(y=80 + 273.15) annotation (Placement(transformation(extent={{-90,42},{-78,52}})));
  Modelica.Blocks.Sources.BooleanExpression GB101status(y=true) annotation (Placement(transformation(extent={{-90,110},{-78,120}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVX01sp(y=1) annotation (Placement(transformation(extent={{-84,26},{-72,36}})));
  Modelica.Blocks.Sources.RealExpression m_flow_P401(y=1.0)   annotation (Placement(transformation(extent={{-90,70},{-78,80}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (
    Placement(transformation(extent={{-104,-90},{-84,-70}})));
  Modelica.Blocks.Sources.RealExpression m_flow_P501(y=1.1)    annotation (Placement(transformation(extent={{-90,62},{-78,72}})));
  Modelica.Blocks.Sources.RealExpression mflowCHP_var(y=1.2) annotation (Placement(transformation(extent={{-89,53},{-79,63}})));
  Modelica.Blocks.Sources.BooleanExpression CHP501status(y=true)   annotation (
    Placement(transformation(extent={{-90,118},{-78,128}})));
  Modelica.Blocks.Sources.RealExpression PeCHP_var(y=30e3) annotation (Placement(transformation(extent={{-89,130},{-79,140}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC01(y=0.25)  annotation (Placement(transformation(extent={{48,50},{38,62}})));
  Modelica.Blocks.Sources.TimeTable thetaFCVC02(table=[0,0.30; 400,0.30])                   annotation (Placement(transformation(extent={{46,38},{40,44}})));
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
  connect(thetaFCVR01.y, controlSignalBus.thetaFCVR01) annotation (Line(points={{79,72},{0,72},{0,80}}, color={0,0,127}));
  connect(ToutSPRR01.y, controlSignalBus.ToutRR01) annotation (Line(points={{79,58},{66,58},{66,62},{0,62},{0,80}}, color={0,0,127}));
  connect(omegaP901.y, controlSignalBus.omegaP901) annotation (Line(points={{-77.4,100},{-62,100},{-62,80},{0,80}},
                                                                                                                color={0,0,127}));
  connect(omegaPR01sp.y, controlSignalBus.omegaPR01) annotation (Line(points={{79,30},{62,30},{62,32},{0,32},{0,80}}, color={0,0,127}));
  connect(thetaFCV901.y, controlSignalBus.thetaFCV901) annotation (Line(points={{-77.4,92},{-64,92},{-64,80},{0,80}},      color={0,0,127}));
  connect(EB401status.y, controlSignalBus.statusRR01) annotation (Line(points={{-77.4,107},{-60,107},{-60,96},{-44,96},{-44,80},{0,80}}, color={255,0,255}));
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
  connect(sourceGas.outlet, heatGeneration.inletGas) annotation (Line(
      points={{-70,-54},{-74,-54},{-74,-52},{-82,-52},{-82,-34},{-66,-34},{-66,-22}},
      color={182,109,49},
      thickness=0.5));
  connect(heatGeneration.senthot, distribution.senthot) annotation (Line(
      points={{-46,-14},{-44,-14},{-44,-12},{-20,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(heatGeneration.returncold, distribution.returncold) annotation (Line(
      points={{-46,10},{-44,10},{-44,12},{-20,12}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus, heatGeneration.controlSignalBus)
    annotation (Line(
      points={{0,80},{-6,80},{-6,40},{-66,40},{-66,18}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(m_flow_P101.y, controlSignalBus.omegaP101)
    annotation (Line(points={{-77.4,83},{-66,83},{-66,80},{0,80}},            color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(GB101_ToutSP.y, controlSignalBus.ToutGB101)
    annotation (Line(points={{-77.4,47},{-72,47},{-72,48},{-74,48},{-74,54},{0,54},{0,80}},
                                                                          color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GB101status.y, controlSignalBus.statusGB101) annotation (Line(points={{-77.4,115},{0,115},{0,80}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(thetaFCVX01sp.y, controlSignalBus.thetaFCV101)
    annotation (Line(points={{-71.4,31},{-71.4,46},{-22,46},{-22,80},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(thetaFCVX01sp.y, controlSignalBus.thetaFCV401)
    annotation (Line(points={{-71.4,31},{-71.4,44},{0,44},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(m_flow_P401.y, controlSignalBus.omegaP401) annotation (Line(points={{-77.4,75},{-38,75},{-38,80},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(GB101_ToutSP.y, controlSignalBus.ToutEB401)
    annotation (Line(points={{-77.4,47},{-62,47},{-62,48},{-46,48},{-46,64},{-36,64},{-36,80},{0,80}},
                                                                                     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(EB401status.y, controlSignalBus.statusEB401)
    annotation (Line(points={{-77.4,107},{-60,107},{-60,96},{-44,96},{-44,80},{0,80}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(m_flow_P501.y, controlSignalBus.omegaP501)
    annotation (Line(points={{-77.4,67},{-66,67},{-66,72},{-14,72},{-14,80},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(mflowCHP_var.y, controlSignalBus.mflowCHP)
    annotation (Line(points={{-78.5,58},{-74,58},{-74,64},{-4,64},{-4,80},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(CHP501status.y, controlSignalBus.statusCHP501) annotation (Line(points={{-77.4,123},{0,123},{0,80},{0,80}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(PeCHP_var.y, controlSignalBus.PtCHP501) annotation (Line(points={{-78.5,135},{0,135},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(sourceVoltage.outlet, heatGeneration.electricPortInlet) annotation (Line(
      points={{-84,-80},{-70,-80},{-70,-58},{-98,-58},{-98,-2},{-86,-2}},
      color={56,93,138},
      thickness=1));
  connect(GB101_ToutSP.y, controlSignalBus.ToutCHP501)
    annotation (Line(points={{-77.4,47},{-34,47},{-34,54},{0,54},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(thetaFCVC01.y, controlSignalBus.thetaFCVC01) annotation (Line(points={{37.5,56},{0,56},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(thetaFCVC02.y, controlSignalBus.thetaFCVC02) annotation (Line(points={{39.7,41},{0,41},{0,80}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (experiment(
      StopTime=600000,
      Interval=200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestBase;
