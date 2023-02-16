within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model CombinedHeatPowerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource source(mflownom=1, Tnom=343.15)
    annotation (Placement(visible=true, transformation(
        origin={-44,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sink annotation (Placement(visible=true,
        transformation(
        origin={40,16},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor massFlowSensor annotation (Placement(
        visible=true, transformation(
        origin={-22,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor warmStartTSensor annotation (
      Placement(visible=true, transformation(
        origin={26,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP(eta_electrical=0.4,
      eta_thermal=0.5) annotation (Placement(visible=true, transformation(
          extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Blocks.Sources.RealExpression TrefCHP(y=10*4186*0.4/0.5)
    annotation (Placement(transformation(extent={{-36,12},{-20,28}})));
equation
  connect(massFlowSensor.outlet, CHP.inlet)
    annotation (Line(points={{-16,0},{-10,0}}, color={168,168,168}));
  connect(CHP.outlet, warmStartTSensor.inlet)
    annotation (Line(points={{10,0},{20,0}}, color={168,168,168}));

  connect(warmStartTSensor.outlet, sink.inlet)
    annotation (Line(points={{32,0},{40,0},{40,6}}, color={168,168,168}));
  connect(massFlowSensor.inlet, source.outlet)
    annotation (Line(points={{-28,0},{-33.8,0}}, color={168,168,168}));
  connect(TrefCHP.y, CHP.PelectricRef) annotation (Line(points={{-19.2,20},{-14,
          20},{-14,10},{-8,10}}, color={0,0,127}));
annotation (
    Diagram(coordinateSystem(extent={{-80,-60},{80,60}})));
end CombinedHeatPowerTest;
