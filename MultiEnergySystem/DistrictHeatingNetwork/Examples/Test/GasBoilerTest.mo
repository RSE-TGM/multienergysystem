within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model GasBoilerTest
  extends Modelica.Icons.Example;
  DHN4Control.Components.ExpansionTank expTankHot annotation (Placement(visible
        =true, transformation(
        origin={92,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant temperature(k = 79) annotation (
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation (
      Placement(visible=true, transformation(
        origin={-68,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealMassFlowSensor massFlowSensor annotation (Placement(
        visible=true, transformation(
        origin={-40,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Sensors.IdealMassFlowSensor idealMassFlowSensor annotation (
    Placement(visible = true, transformation(origin={-40,-40},    extent={{-6,-6},
            {6,6}},                                                                                rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = 65) annotation (
    Placement(visible = true, transformation(origin = {-130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expTankCold annotation (Placement(
        visible=true, transformation(
        origin={92,-30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation (
    Placement(visible = true, transformation(origin={-68,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant3(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-102, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sensors.IdealTemperatureSensor coldStartTSensor annotation (
      Placement(visible=true, transformation(
        origin={34,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor warmStartTSensor annotation (
      Placement(visible=true, transformation(
        origin={32,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.Machines.Boiler warmBoiler(T_start=348.15) annotation (
     Placement(visible=true, transformation(extent={{-10,-10},{10,10}},
          rotation=0)));
  DHN4Control.Components.Machines.Boiler coldBoiler annotation (Placement(
        visible=true, transformation(
        origin={0,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression TrefBoiler2(y=80)
    annotation (Placement(transformation(extent={{-40,-28},{-24,-12}})));
  Modelica.Blocks.Sources.RealExpression TrefBoiler1(y=80)
    annotation (Placement(transformation(extent={{-40,12},{-24,28}})));
equation
  connect(massflow.y, idealMassFlowSource.m_flow)
    annotation (Line(points={{-91,18},{-77.8,18}}, color={0,0,127}));
  connect(temperature.y, idealMassFlowSource.T) annotation (
    Line(points={{-119,2},{-77.8,2}},    color = {0, 0, 127}));
  connect(idealMassFlowSource.inlet, massFlowSensor.inlet) annotation (
    Line(points={{-68,0},{-46,0}},      color = {168, 168, 168}));
  connect(idealMassFlowSource1.inlet, idealMassFlowSensor.inlet) annotation (
    Line(points={{-68,-40},{-46,-40}},      color = {168, 168, 168}));
  connect(constant3.y, idealMassFlowSource1.m_flow)
    annotation (Line(points={{-91,-24},{-84,-24},{-84,-22},{-77.8,-22}},
                                                     color={0,0,127}));
  connect(constant1.y, idealMassFlowSource1.T) annotation (
    Line(points={{-119,-40},{-98,-40},{-98,-38},{-77.8,-38}},
                                             color = {0, 0, 127}));
  connect(coldStartTSensor.outlet, expTankCold.inlet)
    annotation (Line(points={{44,-40},{92,-40}}, color={168,168,168}));
  connect(warmStartTSensor.outlet, expTankHot.inlet)
    annotation (Line(points={{42,0},{92,0}}, color={168,168,168}));
  connect(massFlowSensor.outlet, warmBoiler.inlet)
    annotation (Line(points={{-34,0},{-10,0}}, color={168,168,168}));
  connect(warmBoiler.outlet, warmStartTSensor.inlet)
    annotation (Line(points={{10,0},{22,0}}, color={168,168,168}));
  connect(TrefBoiler2.y, coldBoiler.T_Ref) annotation (Line(points={{-23.2,-20},
          {-20,-20},{-20,-30},{-8,-30}}, color={0,0,127}));
  connect(TrefBoiler1.y, warmBoiler.T_Ref)
    annotation (Line(points={{-23.2,20},{-8,20},{-8,10}}, color={0,0,127}));
  connect(idealMassFlowSensor.outlet, coldBoiler.inlet)
    annotation (Line(points={{-34,-40},{-10,-40}}, color={168,168,168}));
  connect(coldBoiler.outlet, coldStartTSensor.inlet)
    annotation (Line(points={{10,-40},{24,-40}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -60}})));
end GasBoilerTest;
