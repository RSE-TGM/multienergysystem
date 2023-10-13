within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model GasBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expTankHot annotation (Placement(visible=
         true, transformation(
        origin={72,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
        1, Tnom(displayUnit = "K")=352.15)                                                                    annotation (
      Placement(visible=true, transformation(
        origin={-60,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor massFlowSensor annotation (Placement(
        visible=true, transformation(
        origin={-30,22},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor idealMassFlowSensor annotation (
    Placement(visible = true, transformation(origin={-30,-18},    extent={{-6,-6},
            {6,6}},                                                                                rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expTankCold annotation (Placement(
        visible=true, transformation(
        origin={72,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=
        1, Tnom=338.15)                                                                     annotation (
    Placement(visible = true, transformation(origin={-60,-20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor coldStartTSensor annotation (
      Placement(visible=true, transformation(
        origin={34,-16},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor warmStartTSensor annotation (
      Placement(visible=true, transformation(
        origin={32,24},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.Boiler warmBoiler(T_start=348.15) annotation (
     Placement(visible=true, transformation(extent={{-10,10},{10,30}},
          rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.Boiler coldBoiler annotation (Placement(
        visible=true, transformation(
        origin={0,-20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression TrefBoiler2(y=80)
    annotation (Placement(transformation(extent={{-40,-8},{-24,8}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler1(y=80)
    annotation (Placement(transformation(extent={{-40,32},{-24,48}})));
equation
  connect(coldStartTSensor.outlet, expTankCold.inlet)
    annotation (Line(points={{40,-20},{72,-20}}, color={168,168,168}));
  connect(warmStartTSensor.outlet, expTankHot.inlet)
    annotation (Line(points={{38,20},{72,20}},
                                             color={168,168,168}));
  connect(massFlowSensor.outlet, warmBoiler.inlet)
    annotation (Line(points={{-26, 20},{-10,20}},
                                               color={168,168,168}));
  connect(warmBoiler.outlet, warmStartTSensor.inlet)
    annotation (Line(points={{10,20},{26,20}},
                                             color={168,168,168}));
  connect(TrefBoiler2.y, coldBoiler.T_Ref) annotation (Line(points={{-23.2,0},{
          -20,0},{-20,-10},{-8,-10}},    color={0,0,127}));
  connect(TrefBoiler1.y, warmBoiler.T_Ref)
    annotation (Line(points={{-23.2,40},{-8,40},{-8,30}}, color={0,0,127}));
  connect(idealMassFlowSensor.outlet, coldBoiler.inlet)
    annotation (Line(points={{-26,-20},{-10,-20}}, color={168,168,168}));
  connect(coldBoiler.outlet, coldStartTSensor.inlet)
    annotation (Line(points={{10,-20},{28,-20}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, massFlowSensor.inlet)
    annotation (Line(points={{-49.8,20},{-34, 20}}, color={168,168,168}));
  connect(idealMassFlowSource1.outlet, idealMassFlowSensor.inlet)
    annotation (Line(points={{-49.8,-20},{-34,-20}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})));
end GasBoilerTest;
