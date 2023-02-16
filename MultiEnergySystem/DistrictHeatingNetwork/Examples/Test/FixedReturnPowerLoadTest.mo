within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model FixedReturnPowerLoadTest
  extends Modelica.Icons.Example;
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=1, Tnom=
        353.15) annotation (Placement(visible=true, transformation(
        origin={-58,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.ExpansionTank sinkLP(p=250000) annotation (Placement(
        visible=true, transformation(
        origin={58,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant returnRef(k=73)   annotation (
    Placement(visible = true, transformation(origin={-32,16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant loadProfile(k = -4186 * 5) annotation (
    Placement(visible = true, transformation(origin={0,28},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DHN4Control.Sensors.IdealTemperatureSensor sensorTout annotation (Placement(
        visible=true, transformation(
        origin={30,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Components.Loads.FixedReturnPowerLoad load(Kv=12, dp_nominale(
        displayUnit="Pa") = 4e5) annotation (Placement(visible=true,
        transformation(extent={{-10,-10},{10,10}}, rotation=0)));
equation
  connect(load.outlet, sensorTout.inlet)
    annotation (Line(points={{10,0},{24,0}},color={168,168,168}));
  connect(loadProfile.y, load.loadConsumptionRef)
    annotation (Line(points={{0,17},{0,8}},     color={0,0,127}));
  connect(returnRef.y, load.valveRef)
    annotation (Line(points={{-21,16},{-8,16},{-8,6}},   color={0,0,127}));
  connect(sensorTout.outlet, sinkLP.inlet)
    annotation (Line(points={{36,0},{58,0},{58,10}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, load.inlet)
    annotation (Line(points={{-47.8,0},{-10,0}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-80,-60},{80,60}})));
end FixedReturnPowerLoadTest;
