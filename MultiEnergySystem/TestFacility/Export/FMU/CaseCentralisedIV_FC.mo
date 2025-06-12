within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedIV_FC
  extends CaseCentralisedIII(
    redeclare DHTF.Networks.Centralised.LoadControl.CSLC_IV_withoutChiller_FC facility(load(
        EX701_Tin_hot=ToutGen_start,
        EX711_Tin_hot=ToutGen_start,
        EX721_Tin_hot=ToutGen_start,
        EX731_Tin_hot=ToutGen_start,
        S701(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S711(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S721(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S731(y_start_PI_TT=0.25, y_start_PI_Pt=0.3)), distribution(T_start_cold=338.15, T_start_hot=ToutGen_start),
      heatGeneration(S500(EX501(T1_wall_start(displayUnit="K") = 90 + 273.15, TN_wall_start(displayUnit="K") = 80 + 273.15)))),
    redeclare DHTF.Control.OpenLoopActuators.FMUActuator_IV actuator,
    multiplexFT7X1(
      n1=1,
      n2=1,
      n3=1,
      n4=1));
  Modelica.Blocks.Interfaces.RealInput P201input
    annotation (
    Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,-23.5}),
    iconTransformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-105,-75})));
  Modelica.Blocks.Interfaces.IntegerInput S200_status(start = 1) annotation (
    Placement(transformation(
        extent={{-105,-44},{-95,-34}},
        rotation=0),
    iconTransformation(
        extent={{105.004,29.5001},{95.0038,39.5001}},
        rotation=180,
        origin={-4.99621,-60.4999})));
  Modelica.Blocks.Interfaces.RealInput FCV201theta(start = 0.5) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-100,-31}),  iconTransformation(extent={{-110,-90},{-100,-80}})));
equation
  connect(P201input, actuator.P201omega) annotation (Line(points={{-100,-23.5},{-50,-23.5},{-50,47.0625},{-21.0125,47.0625}},
                                                                                                                            color={0,0,127}));
  connect(FCV201theta, actuator.FCV201theta) annotation (Line(points={{-100,-31},{-48.5,-31},{-48.5,45.0375},{-21.0125,45.0375}},       color={0,0,127}));
  connect(S200_status, actuator.S200_status) annotation (Line(points={{-100,-39},
          {-47,-39},{-47,43.0125},{-21.0125,43.0125}},                                                                              color={255,127,0}));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
    Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedIV_FC;
