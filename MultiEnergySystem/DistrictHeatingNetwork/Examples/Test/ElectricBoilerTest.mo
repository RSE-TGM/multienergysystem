within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model ElectricBoilerTest
  extends Modelica.Icons.Example;
  DHN4Control.Components.ExpansionTank expansionTank annotation (Placement(
        visible=true, transformation(
        origin={60,36},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource sourceHot(mflownom=1, Tnom=352.15)
    annotation (Placement(visible=true, transformation(
        origin={-60,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealMassFlowSensor mflowSensor1 annotation (Placement(
        visible=true, transformation(
        origin={-30,20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Sensors.IdealMassFlowSensor mflowSensor2 annotation (Placement(
        visible=true, transformation(
        origin={-30,-20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation (
    Placement(visible = true, transformation(origin={60,-4},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource sourceCold(mflownom=1, Tnom=338.15)
    annotation (Placement(visible=true, transformation(
        origin={-60,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor TSensorCold annotation (Placement(
        visible=true, transformation(
        origin={36,-20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor TSensorWarm annotation (Placement(
        visible=true, transformation(
        origin={36,20},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Components.Machines.ElectricBoiler eBoilerHot(onOffController(
        pre_y_start=true))
    annotation (Placement(transformation(extent={{-6,10},{14,30}})));
  DHN4Control.Components.Machines.ElectricBoiler eBoilerCold
    annotation (Placement(transformation(extent={{-6,-30},{14,-10}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler2(y=80)
    annotation (Placement(transformation(extent={{-28,-12},{-12,4}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler1(y=80)
    annotation (Placement(transformation(extent={{-28,28},{-12,44}})));
equation
  connect(TSensorCold.outlet, expansionTank1.inlet)
    annotation (Line(points={{42,-20},{60,-20},{60,-14}},
                                                 color={168,168,168}));
  connect(TSensorWarm.outlet, expansionTank.inlet)
    annotation (Line(points={{42,20},{60,20},{60,26}},
                                             color={168,168,168}));
  connect(mflowSensor1.outlet, eBoilerHot.inlet)
    annotation (Line(points={{-24,20},{-6,20}},color={168,168,168}));
  connect(eBoilerHot.outlet, TSensorWarm.inlet)
    annotation (Line(points={{14,20},{30,20}},
                                            color={168,168,168}));
  connect(mflowSensor2.outlet, eBoilerCold.inlet)
    annotation (Line(points={{-24,-20},{-6,-20}},  color={168,168,168}));
  connect(eBoilerCold.outlet, TSensorCold.inlet)
    annotation (Line(points={{14,-20},{30,-20}},color={168,168,168}));
  connect(TrefBoiler2.y, eBoilerCold.referenceT) annotation (Line(points={{-11.2,
          -4},{0.6,-4},{0.6,-10}},           color={0,0,127}));
  connect(TrefBoiler1.y, eBoilerHot.referenceT) annotation (Line(points={{-11.2,
          36},{0.6,36},{0.6,30}},   color={0,0,127}));
  connect(sourceCold.outlet, mflowSensor2.inlet)
    annotation (Line(points={{-49.8,-20},{-36,-20}}, color={168,168,168}));
  connect(sourceHot.outlet, mflowSensor1.inlet)
    annotation (Line(points={{-49.8,20},{-36,20}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-80,-80},{80,80}})));
end ElectricBoilerTest;
