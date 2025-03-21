within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;
package Test "Package to test component equation and behaviour"
  extends Modelica.Icons.ExamplesPackage;

  model IdealMassFlowSourceTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sink annotation (Placement(visible=true,
          transformation(
          origin={30,20},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource source(mflownom=5) annotation (
        Placement(visible=true, transformation(
          origin={-30,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
  equation
    connect(source.outlet, sink.inlet)
      annotation (Line(points={{-19.8,0},{30,0},{30,10}}, color={168,168,168}));
  end IdealMassFlowSourceTest;

  model IdealMassFlowPumpsTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=
          353.15)                                               annotation (
      Placement(visible = true, transformation(origin={-102,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
      Placement(visible = true, transformation(origin={80,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
      Placement(visible = true, transformation(origin={80,14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.FixedMassFlowPump fixedMassFlowPump annotation (
      Placement(visible = true, transformation(                    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
      Placement(visible = true, transformation(origin={80,-16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.VariableMassFlowPump variableMassFlowPump annotation (
      Placement(visible = true, transformation(origin={0,-30},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant variableMassRef(k = 2) annotation (
      Placement(visible = true, transformation(origin={-38,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixedMassFlowPump.outlet, expansionTank1.inlet) annotation (
      Line(points={{10,0},{80,0},{80,4}},             color = {168, 168, 168}));
    connect(variableMassRef.y, variableMassFlowPump.m_flow) annotation (Line(
          points={{-27,-18},{-7.8,-18},{-7.8,-24}},   color={0,0,127}));

    connect(variableMassFlowPump.outlet, expansionTank2.inlet) annotation (Line(
          points={{10,-30},{80,-30},{80,-26}}, color={168,168,168}));
    connect(idealMassFlowSource.outlet, fixedMassFlowPump.inlet)
      annotation (Line(points={{-91.8,0},{-10,0}}, color={168,168,168}));
    connect(idealMassFlowSource.outlet, expansionTank.inlet) annotation (Line(
          points={{-91.8,0},{-80,0},{-80,26},{80,26},{80,30}}, color={168,168,168}));
    connect(idealMassFlowSource.outlet, variableMassFlowPump.inlet) annotation (
        Line(points={{-91.8,0},{-80,0},{-80,-30},{-10,-30}}, color={168,168,168}));
  annotation (
      Diagram(coordinateSystem(extent={{-140,-60},{140,60}})), Icon(
          coordinateSystem(preserveAspectRatio=false)));
  end IdealMassFlowPumpsTest;

  model IdealDPPump
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sinkLP(p = 399999.9999999999)  annotation (
      Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.FixedDifferentialPressurePump fixedDifferentialPressurePump(Dp=
          99999.99999999999) annotation (Placement(visible=true, transformation(
          origin={-24,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=353.15)
      annotation (Placement(visible=true, transformation(
          origin={-82,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.VariableDifferentialPressurePump variableDifferentialPressurePump annotation (
      Placement(visible = true, transformation(origin = {-22, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sinkHP(p = 999999.9999999999) annotation (
      Placement(visible = true, transformation(origin = {90, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=5, Tnom=
         353.15)                                                 annotation (
      Placement(visible = true, transformation(origin={-80,-52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 8, height = 8e5, offset = 1e5, startTime = 1)  annotation (
      Placement(visible = true, transformation(origin = {-48, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixedDifferentialPressurePump.outlet, sinkLP.inlet) annotation (
      Line(points = {{-14, 0}, {90, 0}}, color = {168, 168, 168}));
    connect(sinkHP.inlet, variableDifferentialPressurePump.outlet) annotation (
      Line(points = {{90, -52}, {-12, -52}}, color = {168, 168, 168}));
    connect(ramp.y, variableDifferentialPressurePump.Dp) annotation (
      Line(points={{-37,-30},{-29.8,-30},{-29.8,-46}},    color = {0, 0, 127}));
    connect(idealMassFlowSource.outlet, fixedDifferentialPressurePump.inlet)
      annotation (Line(points={{-71.8,0},{-34,0}}, color={168,168,168}));
    connect(idealMassFlowSource1.outlet, variableDifferentialPressurePump.inlet)
      annotation (Line(points={{-69.8,-52},{-32,-52}}, color={168,168,168}));
    annotation (
      Diagram(coordinateSystem(extent = {{-140, 40}, {100, -60}})));
  end IdealDPPump;

  model ValveTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
          5, Tnom=353.15)                                                                    annotation (
        Placement(visible=true, transformation(
          origin={-70,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(p = 499999.9999999999)  annotation (
      Placement(visible = true, transformation(origin = {92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank HP(p = 499999.9999999999)  annotation (
      Placement(visible = true, transformation(origin = {96, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant halfopen(k = 0.5) annotation (
      Placement(visible = true, transformation(origin = {-28, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant minimumOpen(k = 0) annotation (
      Placement(visible = true, transformation(origin = {-24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve halfOpenValve(Kv=12,
        openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear)
      annotation (Placement(visible=true, transformation(
          origin={6,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve closedValve(Kv = 12)  annotation (
      Placement(visible = true, transformation(origin = {6, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(closedValve.outlet, HP.inlet) annotation (
      Line(points = {{16, -40}, {96, -40}}, color = {168, 168, 168}));
    connect(minimumOpen.y, closedValve.opening) annotation (
      Line(points={{-13,-20},{6,-20},{6,-32}},        color = {0, 0, 127}));
    connect(halfopen.y, halfOpenValve.opening) annotation (
      Line(points={{-17,28},{6,28},{6,8}},        color = {0, 0, 127}));
    connect(halfOpenValve.outlet, expansionTank.inlet) annotation (
      Line(points = {{16, 0}, {92, 0}}, color = {168, 168, 168}));
    connect(idealMassFlowSource.outlet, halfOpenValve.inlet)
      annotation (Line(points={{-59.8,0},{-4,0}}, color={168,168,168}));
    connect(idealMassFlowSource.outlet, closedValve.inlet) annotation (Line(
          points={{-59.8,0},{-50,0},{-50,-40},{-4,-40}}, color={168,168,168}));
    annotation (
      Diagram(coordinateSystem(extent = {{-140, 40}, {120, -60}})));
  end ValveTest;

  model PipeTest "Test with 3 differente pipes"
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=353.15)
                                                                annotation (
      Placement(visible = true, transformation(origin={-70,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
      Placement(visible = true, transformation(origin={70,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV oneSec(Di = 0.0508, L = 50, N = 1, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, tIns = 0.1, t = 0.003, h = 10, lambdaIns = 0.04)  annotation (
      Placement(visible = true, transformation(origin={0,40},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySec(Di = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, tIns = 0.1, t = 0.003, lambdaIns = 0.04) annotation (
      Placement(visible = true, transformation(                    extent={{-10,-10},
              {10,10}},                                                                             rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
      Placement(visible = true, transformation(origin={70,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=5, Tnom=
         353.15)                                                 annotation (
      Placement(visible = true, transformation(origin={-70,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(Di = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, tIns = 0.1, t = 0.003, lambdaIns = 0.04, thermalInertia = false) annotation (
      Placement(visible = true, transformation(origin={0,-40},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
      Placement(visible = true, transformation(origin={70,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(mflownom=5, Tnom=
         353.15)                                                 annotation (
      Placement(visible = true, transformation(origin={-70,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(idealMassFlowSource.outlet, oneSec.inlet)
      annotation (Line(points={{-59.8,40},{-10,40}}, color={168,168,168}));
    connect(idealMassFlowSource1.outlet, fiftySec.inlet)
      annotation (Line(points={{-59.8,0},{-10,0}}, color={168,168,168}));
    connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet)
      annotation (Line(points={{-59.8,-40},{-10,-40}}, color={168,168,168}));
    connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (Line(
        points={{10,-40},{56,-40},{56,-48},{70,-48},{70,-40}},
        color={140,56,54},
        thickness=0.5));
    connect(fiftySec.outlet, expansionTank1.inlet) annotation (Line(
        points={{10,0},{56,0},{56,-8},{70,-8},{70,0}},
        color={140,56,54},
        thickness=0.5));
    connect(oneSec.outlet, expansionTank.inlet) annotation (Line(
        points={{10,40},{56,40},{56,32},{70,32},{70,40}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Documentation(
          info="<html>
<p>The tests are the following:</p>
<p>1. The first test corresponds to a pipe with one finite volume only (lumped) and thermal inertia.</p>
<p>2. The second test corresponds to a pipe with 50 finite volumes and thermal inertia.</p>
<p>3. The third test corresponds to a pipe with 50 finite volumes without thermal inertia.</p>
</html>"));
  end PipeTest;

  model PlugFlowCoreTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(Tnom(displayUnit = "K") = 353.15, allowFlowReversal = true, mflownom = 5, use_in_m_flow = true) annotation (
      Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
      Placement(visible = true, transformation(origin = {40, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(Di = 0.0508, L = 50, T_start(displayUnit = "degC") = 338.15, Tin_start = 25 + 273.15, Tout_start = 25 + 273.15, hin_start = 10000, m_flow_start = 5, pin_start = 200000, pout_start = 150000) annotation (
      Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(Tnom(displayUnit = "K") = 353.15, mflownom = 5, use_in_m_flow = true) annotation (
      Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(Di = 0.0508, L = 50, N = 50, T_ext(displayUnit = "K"), T_start(displayUnit = "degC") = 338.15, Tin_start = 80 + 273.15, Tout_start = 80 + 273.15, allowFlowReversal = true, hin_start = 10000, lambdaIns = 0.04, m_flow_start = 5, pin_start = 200000, pout_start = 150000, t = 0.003, tIns = 0.1, thermalInertia = false) annotation (
      Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
      Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp m_flow_1(duration = 50, height = -15, offset = 5, startTime = 50) annotation (
      Placement(visible = true, transformation(origin = {-64, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp m_flow_2(duration = 50, height = -15, offset = 5, startTime = 50) annotation (
      Placement(visible = true, transformation(origin = {-64, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(plugFlowCore.outlet, expansionTank.inlet) annotation (
      Line(points = {{10, 60}, {40, 60}, {40, 74}}, color = {168, 168, 168}));
    connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
      Line(points = {{10, 20}, {40, 20}, {40, 30}}));
    connect(idealMassFlowSource.outlet, plugFlowCore.inlet) annotation (
      Line(points = {{-29.8, 60}, {-10, 60}}, color = {168, 168, 168}));
    connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet) annotation (
      Line(points = {{-29.8, 20}, {-10, 20}}, color = {168, 168, 168}));
    connect(m_flow_1.y, idealMassFlowSource.in_m_flow) annotation (
      Line(points={{-53,82},{-45,82},{-45,66.2}},      color = {0, 0, 127}));
    connect(m_flow_2.y, idealMassFlowSource2.in_m_flow) annotation (
      Line(points={{-53,40},{-45,40},{-45,26.2}},      color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, 0}, {100, 100}})));
  end PlugFlowCoreTest;

  model PlugFlowPipeTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=true,
      use_in_m_flow=true,                                                                    mflownom=
          5,
      Tnom=353.15)                                                                           annotation (
        Placement(visible=true, transformation(
          origin={-64,72},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(
        allowFlowReversal=true, T=298.15)                                           annotation (Placement(
          visible=true, transformation(
          origin={92,80},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(
      allowFlowReversal=true,
      use_in_m_flow=true,                                                                     mflownom=
          5,
      Tnom=353.15)                                                                            annotation (
      Placement(visible = true, transformation(origin={-68,24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV FV_Pipe(
      allowFlowReversal=true,
      thermalInertia=true,
      cm=880,
      rhom(displayUnit="kg/m3") = 7850,
      pin_start=100000,
      Tin_start=298.15,
      Tout_start=298.15,
      Di=0.0508,
      L=50,
      N=5,
      T_ext=298.15,
      T_start(displayUnit="degC") = 298.15,
      ss=false) annotation (Placement(visible=true, transformation(
          origin={-12,24},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2(
        allowFlowReversal=true, T=298.15)                                            annotation (
      Placement(visible = true, transformation(origin={92,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF PF_Pipe(
      allowFlowReversal=true,
      pin_start=100000,
      D=0.0508,
      L=50,
      H=0.1,
      rhom(displayUnit="kg/m3"),
      T_start(displayUnit="degC") = 298.15,
      T_start_m(displayUnit="degC") = 298.15,
      cpm=880) annotation (Placement(visible=true, transformation(
          origin={-4,72},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_PF
      annotation (Placement(visible=true, transformation(
          origin={46,70},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_FV
      annotation (Placement(visible=true, transformation(
          origin={30,28},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow(
      duration=0,
      height=5,
      offset=1,
      startTime=50) annotation (Placement(visible=true, transformation(
          origin={-105,51},
          extent={{-9,-9},{9,9}},
          rotation=0)));
  equation
    connect(Tout_FV.outlet, expansionTank2.inlet) annotation (Line(
        points={{36,24},{92,24}},
        color={140,56,54},
        thickness=0.5));
    connect(idealMassFlowSource2.outlet, FV_Pipe.inlet) annotation (Line(
        points={{-57.8,24},{-22,24}},
        color={140,56,54},
        thickness=0.5));
    connect(FV_Pipe.outlet, Tout_FV.inlet) annotation (Line(
        points={{-2,24},{24,24}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource2.in_m_flow) annotation (Line(points={
            {-95.1,51},{-73,51},{-73,30.2}}, color={0,0,127}));
    connect(idealMassFlowSource.outlet, PF_Pipe.inlet) annotation (Line(
        points={{-53.8,72},{-14,72}},
        color={140,56,54},
        thickness=0.5));
    connect(PF_Pipe.outlet, Tout_PF.inlet) annotation (Line(
        points={{6,72},{30,72},{30,66},{40,66}},
        color={140,56,54},
        thickness=0.5));
    connect(Tout_PF.outlet, expansionTank.inlet) annotation (Line(
        points={{52,66},{92,66},{92,70}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{
            -95.1,51},{-80,51},{-80,86},{-69,86},{-69,78.2}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(StopTime=
            150, __Dymola_Algorithm="Dassl"));
  end PlugFlowPipeTest;

  model PowerTransferTest "3 tests using Ideal Power Transfer component"
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psink1 annotation (Placement(visible=true,
          transformation(
          origin={50,32},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msource1 annotation (Placement(
          visible=true, transformation(
          origin={-90,12},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt1 annotation (Placement(
          visible=true, transformation(extent={{-30,2},{-10,22}},   rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psink2 annotation (Placement(visible=true,
          transformation(
          origin={50,-10},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt2 annotation (Placement(
          visible=true, transformation(
          origin={-20,-28},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msource2 annotation (Placement(
          visible=true, transformation(
          origin={-90,-28},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens1 annotation (Placement(
          visible=true, transformation(
          origin={20,14},
          extent={{-6,-6},{6,6}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens2 annotation (
      Placement(visible = true, transformation(origin={20,-26},    extent={{-6,-6},
              {6,6}},                                                                               rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msink(mflownom=-1) annotation (
        Placement(visible=true, transformation(
          origin={-90,-68},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psource annotation (Placement(visible=true,
          transformation(
          origin={50,-50},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens3 annotation (Placement(
          visible=true, transformation(
          origin={20,-66},
          extent={{6,-6},{-6,6}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt3 annotation (Placement(
          visible=true, transformation(
          origin={-20,-68},
          extent={{-10,10},{10,-10}},
          rotation=180)));
    Modelica.Blocks.Sources.RealExpression Ptransfer1(y=4186*5)  annotation (Placement(transformation(extent={{-48,24},
              {-32,40}})));
    Modelica.Blocks.Sources.RealExpression Ptransfer2(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-16},
              {-32,0}})));
    Modelica.Blocks.Sources.RealExpression Ptransfer3(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-56},
              {-32,-40}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer
      Pt4(pin_start=200000) annotation (Placement(visible=true, transformation(
          origin={-20,-100},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Sources.SourceMassFlow sourceMassFlow(
      p0=200000,
      T0(displayUnit="K") = 36.7 + 273.15,
      m_flow0=9)
      annotation (Placement(transformation(extent={{-69,-110},{-49,-90}})));
    Sources.SinkPressure sinkPressure(p0=200000, T0(displayUnit="K") = 36 +
        273.15)
      annotation (Placement(transformation(extent={{11,-110},{31,-90}})));
    Modelica.Blocks.Sources.RealExpression Ptransfer4(y=-327159.72)
                                                                  annotation (Placement(transformation(extent={{-47,-93},
              {-31,-77}})));
  equation
    connect(Pt1.outlet, Tsens1.inlet)
      annotation (Line(points={{-10,12},{4,12},{4,11.6},{16.4,11.6}},
                                                color={168,168,168}));
    connect(Pt2.outlet, Tsens2.inlet)
      annotation (Line(points={{-10,-28},{4,-28},{4,-28.4},{16.4,-28.4}},
                                                    color={168,168,168}));
    connect(Ptransfer1.y, Pt1.Ptransfer)
      annotation (Line(points={{-31.2,32},{-20,32},{-20,20}},color={0,0,127}));
    connect(Ptransfer2.y, Pt2.Ptransfer) annotation (Line(points={{-31.2,-8},{-20,
            -8},{-20,-20}},  color={0,0,127}));
    connect(Tsens2.outlet, psink2.inlet) annotation (Line(points={{23.6,-28.4},{
            50,-28.4},{50,-20}},
                       color={168,168,168}));
    connect(Tsens1.outlet, psink1.inlet)
      annotation (Line(points={{23.6,11.6},{50,11.6},{50,22}},
                                                       color={168,168,168}));
    connect(msource1.outlet, Pt1.inlet)
      annotation (Line(points={{-79.8,12},{-30,12}},
                                                   color={168,168,168}));
    connect(msource2.outlet, Pt2.inlet)
      annotation (Line(points={{-79.8,-28},{-30,-28}}, color={168,168,168}));
    connect(msink.outlet, Pt3.outlet)
      annotation (Line(points={{-79.8,-68},{-30,-68}}, color={168,168,168}));
    connect(Ptransfer3.y, Pt3.Ptransfer) annotation (Line(points={{-31.2,-48},{
            -20,-48},{-20,-60}},
                             color={0,0,127}));
    connect(Tsens3.inlet, psource.inlet) annotation (Line(points={{23.6,-68.4},{
            50,-68.4},{50,-60}},
                       color={168,168,168}));
    connect(Tsens3.outlet, Pt3.inlet)
      annotation (Line(points={{16.4,-68.4},{4,-68.4},{4,-68},{-10,-68}},
                                                    color={168,168,168}));
    connect(Ptransfer4.y, Pt4.Ptransfer) annotation (Line(points={{-30.2,-85},{
            -20,-85},{-20,-92}}, color={0,0,127}));
    connect(sourceMassFlow.outlet, Pt4.inlet) annotation (Line(
        points={{-49,-100},{-30,-100}},
        color={140,56,54},
        thickness=0.5));
    connect(Pt4.outlet, sinkPressure.inlet) annotation (Line(
        points={{-10,-100},{11,-100}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-140,40},{100,-120}}, grid={1,1})), Icon(
          coordinateSystem(extent={{-140,40},{100,-120}}, grid={1,1})));
  end PowerTransferTest;

  model LumpedTESTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage tank(D = 1.7, T_start( displayUnit = "K")= 338.15, allowFlowReversal = false, H = 4, pin_start = 250000)  annotation (
      Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -14}, {10, 14}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkP(T0=338.15,                      use_in_p0 = false)  annotation (
      Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceW(T0 = 338.15,m_flow0 = 5, p0( displayUnit = "Pa")= 1.1, use_in_m_flow = true)  annotation (
      Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Blocks.Sources.RealExpression m_flow(y = if time < 10 then 2 else 5)  annotation (
      Placement(visible = true, transformation(origin = {-82, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner System system annotation (
      Placement(visible = true, transformation(origin = {88, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage tank2(D = 1.7, T_start(displayUnit = "K") = 338.15, allowFlowReversal = false, H = 4,
      pin_start=100000,
      n=4)                                                                                                                                                                                             annotation (
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -14}, {10, 14}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sink_mflow(T0 = 68 + 273.15, p0 = 99999.99999999999, pin_start = 99999.99999999999, m_flow0 = 0.5)  annotation (
      Placement(visible = true, transformation(origin = {20, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T0=338.15)                       annotation (
      Placement(visible = true, transformation(origin = {20, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  equation
    connect(sinkP.inlet, tank.outlet) annotation (
      Line(points={{-50,40},{-60,40},{-60,7},{-50,7}},          color = {168, 168, 168}));
    connect(sourceW.outlet, tank.inlet) annotation (
      Line(points={{-60,-30},{-60,-7},{-50,-7}},        color = {168, 168, 168}));
    connect(m_flow.y, sourceW.in_m_flow) annotation (
      Line(points = {{-71, -46}, {-65, -46}}, color = {0, 0, 127}));
    connect(sink_mflow.inlet, tank2.outlet) annotation (
      Line(points={{20,32},{20,8.75},{30,8.75}},  color = {168, 168, 168}));
    connect(sourceP.outlet, tank2.inlet) annotation (
      Line(points={{20,-34},{20,-8.75},{30,-8.75}},  color = {168, 168, 168}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, -80}, {100, 80}})), experiment(
          StopTime=100, __Dymola_Algorithm="Dassl"));
  end LumpedTESTest;

  model StratifiedTESTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      use_in_m_flow=true,
      use_in_T=true,
      mflownom=5,
      Tnom=353.15)                                                                           annotation (
      Placement(visible = true, transformation(origin={-40,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(p=300000,
        T=353.15)                                                                               annotation (
      Placement(visible = true, transformation(origin={40,22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.Stratified1DStorage stratified1DStorage(
      D=1.7,
      N=21,
      T_ext=298.15,
      T_start=338.15,
      h=5) annotation (Placement(visible=true, transformation(
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp ramp(
      height=3,
      duration=100,
      offset=3,
      startTime=1000)
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Blocks.Sources.Ramp ramp1(
      height=30,
      duration=100,
      offset=30 + 273.15,
      startTime=2000)
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  equation
    connect(stratified1DStorage.outlet, expansionTank.inlet) annotation (
      Line(points={{10,0},{40,0},{40,12}},
                                         color = {168, 168, 168}));
    connect(idealMassFlowSource.outlet, stratified1DStorage.inlet)
      annotation (Line(points={{-29.8,0},{-10,0}}, color={168,168,168}));
    connect(ramp.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-59,
            10},{-44,10},{-44,6.2},{-45,6.2}}, color={0,0,127}));
    connect(ramp1.y, idealMassFlowSource.in_T)
      annotation (Line(points={{-59,50},{-35,50},{-35,6.2}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
      experiment(StartTime = 0, StopTime = 6000, Tolerance = 1e-6, Interval = 12));
  end StratifiedTESTest;

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

  model ElectricBoilerTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
      Placement(visible = true, transformation(origin = {58, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource sourceHot(Tnom(displayUnit = "K") = 352.15, mflownom = 1) annotation (
      Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor mflowSensor1 annotation (
      Placement(visible = true, transformation(origin = {-30, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor mflowSensor2 annotation (
      Placement(visible = true, transformation(origin = {-30, -18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
      Placement(visible = true, transformation(origin = {58, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource sourceCold(Tnom(displayUnit = "K") = 338.15, mflownom = 1) annotation (
      Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor TSensorCold annotation (
      Placement(visible = true, transformation(origin = {36, -18}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor TSensorWarm annotation (
      Placement(visible = true, transformation(origin = {36, 22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.ElectricBoiler eBoilerHot                                      annotation (
      Placement(transformation(extent = {{-6, 10}, {14, 30}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.ElectricBoiler eBoilerCold annotation (
      Placement(transformation(extent = {{-6, -30}, {14, -10}})));
    Modelica.Blocks.Sources.RealExpression TrefBoiler2(y = 80) annotation (
      Placement(transformation(extent = {{-28, -12}, {-12, 4}})));
    Modelica.Blocks.Sources.RealExpression TrefBoiler1(y = 80) annotation (
      Placement(transformation(extent = {{-28, 28}, {-12, 44}})));
    inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
      Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(TSensorCold.outlet, expansionTank1.inlet) annotation (
      Line(points={{39.6,-20.4},{58,-20.4},{58,-14}},  color = {168, 168, 168}));
    connect(TSensorWarm.outlet, expansionTank.inlet) annotation (
      Line(points={{39.6,19.6},{58,19.6},{58,26}},  color = {168, 168, 168}));
    connect(mflowSensor1.outlet, eBoilerHot.inlet) annotation (
      Line(points={{-26.4,19.6},{-16,19.6},{-16,20},{-6,20}},
                                           color = {168, 168, 168}));
    connect(eBoilerHot.outlet, TSensorWarm.inlet) annotation (
      Line(points={{14,20},{24,20},{24,19.6},{32.4,19.6}},
                                          color = {168, 168, 168}));
    connect(mflowSensor2.outlet, eBoilerCold.inlet) annotation (
      Line(points={{-26.4,-20.4},{-16,-20.4},{-16,-20},{-6,-20}},
                                             color = {168, 168, 168}));
    connect(eBoilerCold.outlet, TSensorCold.inlet) annotation (
      Line(points={{14,-20},{24,-20},{24,-20.4},{32.4,-20.4}},
                                            color = {168, 168, 168}));
    connect(TrefBoiler2.y, eBoilerCold.referenceT) annotation (
      Line(points={{-11.2,-4},{4,-4},{4,-10}},            color = {0, 0, 127}));
    connect(TrefBoiler1.y, eBoilerHot.referenceT) annotation (
      Line(points={{-11.2,36},{4,36},{4,30}},            color = {0, 0, 127}));
    connect(sourceCold.outlet, mflowSensor2.inlet) annotation (
      Line(points={{-49.8,-20},{-42,-20},{-42,-20.4},{-33.6,-20.4}},
                                                color = {168, 168, 168}));
    connect(sourceHot.outlet, mflowSensor1.inlet) annotation (
      Line(points={{-49.8,20},{-42,20},{-42,19.6},{-33.6,19.6}},
                                              color = {168, 168, 168}));
    annotation (
      Diagram(coordinateSystem(extent = {{-80, -80}, {80, 80}})));
  end ElectricBoilerTest;

  model FixedReturnPowerLoadTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=1, Tnom=353.15)
      annotation (Placement(visible=true, transformation(
          origin={-58,0},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sinkLP(p=250000) annotation (Placement(
          visible=true, transformation(
          origin={58,20},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Constant returnRef(k=73)   annotation (
      Placement(visible = true, transformation(origin={-32,16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant loadProfile(k = -4186 * 5) annotation (
      Placement(visible = true, transformation(origin={0,28},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor sensorTout annotation (Placement(
          visible=true, transformation(
          origin={30,0},
          extent={{-6,-6},{6,6}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Loads.FixedReturnPowerLoad load(Kv=12, dp_nominale(
          displayUnit="Pa") = 4e5) annotation (Placement(visible=true,
          transformation(extent={{-10,-10},{10,10}}, rotation=0)));
  equation
    connect(load.outlet, sensorTout.inlet)
      annotation (Line(points={{10,0},{18,0},{18,-2.4},{26.4,-2.4}},
                                              color={168,168,168}));
    connect(loadProfile.y, load.loadConsumptionRef)
      annotation (Line(points={{0,17},{0,8}},     color={0,0,127}));
    connect(returnRef.y, load.valveRef)
      annotation (Line(points={{-21,16},{-8,16},{-8,6}},   color={0,0,127}));
    connect(sensorTout.outlet, sinkLP.inlet)
      annotation (Line(points={{33.6,-2.4},{58,-2.4},{58,10}},
                                                       color={168,168,168}));
    connect(idealMassFlowSource.outlet, load.inlet)
      annotation (Line(points={{-47.8,0},{-10,0}}, color={168,168,168}));
    annotation (
      Diagram(coordinateSystem(extent={{-80,-60},{80,60}})));
  end FixedReturnPowerLoadTest;

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
      annotation (Line(points={{-18.4,-2.4},{-14,-2.4},{-14,0},{-10,0}},
                                                 color={168,168,168}));
    connect(CHP.outlet, warmStartTSensor.inlet)
      annotation (Line(points={{10,0},{16,0},{16,-2.4},{22.4,-2.4}},
                                               color={168,168,168}));

    connect(warmStartTSensor.outlet, sink.inlet)
      annotation (Line(points={{29.6,-2.4},{40,-2.4},{40,6}},
                                                      color={168,168,168}));
    connect(massFlowSensor.inlet, source.outlet)
      annotation (Line(points={{-25.6,-2.4},{-30,-2.4},{-30,0},{-33.8,0}},
                                                   color={168,168,168}));
    connect(TrefCHP.y, CHP.PelectricRef) annotation (Line(points={{-19.2,20},{
            -14,20},{-14,8},{-10,8}},
                                   color={0,0,127}));
  annotation (
      Diagram(coordinateSystem(extent={{-80,-60},{80,60}})));
  end CombinedHeatPowerTest;

  model RoundPipeTest
    extends Modelica.Icons.Example;
    parameter Integer n = 7 "number of volumes";
    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 6000;
    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 2400;

    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rpipe1(
      L=2,
      thermalInertia=false,
      rhom(displayUnit="kg/m3"),
      m_flow_start=5,
      pin_start=110000,
      pout_start=101000,
      Tin_start=323.15,
      Tout_start=303.15,
      Di=0.1,
      n=n,
      nPipes=1,
      kc=1,
      k=1500) annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    Sources.SourcePressure sourceP(p0=110000, T0=323.15)
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    Sources.SinkPressure sinkP(p0=101000, T0=303.15)
      annotation (Placement(transformation(extent={{58,70},{78,90}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_FixedT
      wall_FixedT(n=n, Twall=308.15)
      annotation (Placement(transformation(extent={{-10,114},{10,134}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rpipe2(
      L=2,
      thermalInertia=false,
      rhom(displayUnit="kg/m3"),
      m_flow_start=5,
      pin_start=110000,
      pout_start=101000,
      Tin_start=323.15,
      Tout_start=303.15,
      Di=0.1,
      n=n,
      nPipes=1,
      kc=1,
      k=1500) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.Wall_inputQ
      wall_inputQ(n=n, Twall=308.15)
      annotation (Placement(transformation(extent={{-10,44},{10,64}})));
    Modelica.Blocks.Sources.RealExpression Q(y=50000)
      annotation (Placement(visible = true, transformation(origin = {2, 0}, extent = {{-32, 58}, {-12, 78}}, rotation = 0)));
    inner System system
      annotation (Placement(transformation(extent={{80,120},{100,140}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV hotside(
      L=0.7073,
      thermalInertia=false,
      cm=500,
      rhom(displayUnit="g/cm3") = 7990,
      lambdam=16.3,
      m_flow_start=0.6154,
      pin_start=110000,
      pout_start=101000,
      Tin_start=353.15,
      Tout_start=333.15,
      Di=0.03,
      n=n,
      nPipes=1,
      kc=1,
      k=4162.27,
      Stot=0.5,
      gamma_nom=gamma_nom_hot)
      annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV coldside(
      L=0.96275,
      thermalInertia=false,
      rhom(displayUnit="kg/m3"),
      m_flow_start=5,
      pin_start=110000,
      pout_start=101000,
      Tin_start=323.15,
      Tout_start=303.15,
      Di=0.023,
      n=n,
      nPipes=1,
      kc=1,
      k=13923.8,
      Stot=0.5,
      gamma_nom=gamma_nom_cold)
      annotation (Placement(transformation(extent={{10,30},{-10,10}})));
    Sources.SourcePressure sourceHot(
      p0(displayUnit="kPa") = 110000, T0=353.15)
      annotation (Placement(transformation(extent={{-80,-42},{-60,-22}})));
    Sources.SinkPressure sinkHot(
      p0(displayUnit="kPa") = 1000*(110 - 2.5), T0=303.15)
                 annotation (Placement(transformation(extent={{62,-42},{82,-22}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV
      metalWallFV(
      Nw=n,
      M=500,
      cm=500,
      Tstartbar=318.15,
      Tstart1=333.15,
      TstartN=303.15)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologyFV
      heatExchangerTopologyFV(Nw=n, redeclare model HeatExchangerTopology =
          MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologies.CounterCurrentFlow)
      annotation (Placement(transformation(extent={{-10,-26},{10,-6}})));
    Sources.SinkPressure sinkCold(
      p0(displayUnit="kPa") = 1000*(110 - 19.3), T0=288.75)
      annotation (Placement(transformation(extent={{-60,10},{-80,30}})));
    Sources.SourcePressure sourceCold(
      p0(displayUnit="kPa") = 110000, T0=280.15)
                 annotation (Placement(transformation(extent={{82,10},{62,30}})));
  equation
    connect(wall_FixedT.MultiPort, rpipe1.wall)
      annotation (Line(points={{0,124},{0,104.1}},
                                                 color={255,238,44}));
    connect(sourceP.outlet, rpipe1.inlet) annotation (Line(points={{-60,80},{-40,80},
            {-40,100},{-10,100}},
                                color={168,168,168}));
    connect(rpipe1.outlet, sinkP.inlet) annotation (Line(points={{10,100},{40,100},
            {40,80},{58,80}},
                           color={168,168,168}));
    connect(wall_inputQ.MultiPort, rpipe2.wall)
      annotation (Line(points={{0,54},{0,44.1}},color={255,238,44}));
    connect(Q.y, wall_inputQ.S) annotation (Line(points={{-9,68},{2,68}, {2, 58},{0,58}},
                            color={0,0,127}));
    connect(sourceP.outlet, rpipe2.inlet)
      annotation (Line(points={{-60,80},{-40,80},{-40,40},{-10,40}},
                                                 color={168,168,168}));
    connect(rpipe2.outlet, sinkP.inlet)
      annotation (Line(points={{10,40},{40,40},{40,80},{58,80}},
                                               color={168,168,168}));
    connect(sourceHot.outlet, hotside.inlet)
      annotation (Line(points={{-60,-32},{-10,-32}}, color={168,168,168}));
    connect(sinkHot.inlet, hotside.outlet)
      annotation (Line(points={{62,-32},{10,-32}}, color={168,168,168}));
    connect(heatExchangerTopologyFV.side2, hotside.wall)
      annotation (Line(points={{0,-19.1},{0,-27.9}}, color={255,238,44}));
    connect(metalWallFV.ext, heatExchangerTopologyFV.side1)
      annotation (Line(points={{0,-3.1},{0,-13}},  color={255,238,44}));
    connect(coldside.wall, metalWallFV.int)
      annotation (Line(points={{0,15.9},{0,3}},    color={255,238,44}));
    connect(sinkCold.inlet, coldside.outlet)
      annotation (Line(points={{-60,20},{-10,20}},   color={168,168,168}));
    connect(coldside.inlet, sourceCold.outlet)
      annotation (Line(points={{10,20},{62,20}},   color={168,168,168}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{100,140}})),
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
  end RoundPipeTest;

  model BPHETest
    "Test that includes all 04 heat exchanger of the RSE DistrictHeatingNetwork at Nominal Conditions"
    extends Modelica.Icons.Example;
    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
    parameter Integer n_E301 = 5;
    parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
    parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
    parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
    parameter Integer gammahotovercold_factor = 1;
    parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
    parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
    parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
    parameter Real CorrectFactorHot = 1;
    parameter Real CorrectFactorCold = 1;
    inner System system annotation (
      Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E301(Di_cold = BPHE.E301.Di_cold, Di_hot = BPHE.E301.Di_hot, L_cold = BPHE.E301.L_cold, L_hot = BPHE.E301.L_hot, MWall = BPHE.E301.MWall, Stot_cold = BPHE.E301.Stot_cold, Stot_hot = BPHE.E301.Stot_hot, Tin_start_cold = BPHE.E301.Tin_start_cold, Tin_start_hot = BPHE.E301.Tin_start_hot, Tout_start_cold = BPHE.E301.Tout_start_cold, Tout_start_hot = BPHE.E301.Tout_start_hot, cpm_cold = BPHE.E301.cpm_cold, cpm_hot = BPHE.E301.cpm_hot, t_cold = BPHE.E301.t_cold, t_hot = BPHE.E301.t_hot, gamma_nom_cold = BPHE.E301.gamma_nom_cold, gamma_nom_hot = BPHE.E301.gamma_nom_hot, h_cold = BPHE.E301.h_cold, h_hot = BPHE.E301.h_hot,                                                                                     k_cold = BPHE.E301.k_cold, k_hot = BPHE.E301.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E301.lambdam_cold, lambdam_hot = BPHE.E301.lambdam_hot, m_flow_start_cold = BPHE.E301.m_flow_start_cold, m_flow_start_hot = BPHE.E301.m_flow_start_hot, n = n_E301, nPipes_cold = BPHE.E301.nPipes_cold, nPipes_hot = BPHE.E301.nPipes_hot, nPlates = BPHE.E301.nPlates, pin_start_cold = BPHE.E301.pin_start_cold, pin_start_hot = BPHE.E301.pin_start_hot, pout_start_cold = BPHE.E301.pout_start_cold, pout_start_hot = BPHE.E301.pout_start_hot, rho_nom_cold = (BPHE.E301.rhoin_nom_cold + BPHE.E301.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E301.rhoin_nom_hot + BPHE.E301.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E301.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E301.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E301.u_nom_cold, u_nom_hot = BPHE.E301.u_nom_hot) annotation (
      Placement(visible = true, transformation(origin = {-389, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E301(T0 = BPHE.E301.Tout_start_cold, m_flow0 = BPHE.E301.m_flow_start_cold, p0 = BPHE.E301.pout_start_cold, pin_start = BPHE.E301.pout_start_cold) annotation (
      Placement(visible = true, transformation(origin = {-449, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
    Sources.SourcePressure sourceCold_E301(T0 = BPHE.E301.Tin_start_cold, p0 = BPHE.E301.pin_start_cold)               annotation (
      Placement(visible = true, transformation(origin = {-450, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E501(T0 = BPHE.E501.Tout_start_cold, m_flow0 = 2.45957, p0 = BPHE.E501.pout_start_cold, pin_start = BPHE.E501.pout_start_cold) annotation (
      Placement(visible = true, transformation(origin = {-235, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E501(T0 = BPHE.E501.Tin_start_cold, p0 = BPHE.E501.pin_start_cold)               annotation (
      Placement(visible = true, transformation(origin = {-238, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Sources.SinkMassFlow sinkHot_E301(T0 = BPHE.E301.Tout_start_hot, m_flow0 = BPHE.E301.m_flow_start_hot, p0 = BPHE.E301.pout_start_hot, pin_start = BPHE.E301.pout_start_hot) annotation (
      Placement(visible = true, transformation(origin = {-335, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E301(T0 = BPHE.E301.Tin_start_hot, p0 = BPHE.E301.pin_start_hot)               annotation (
      Placement(visible = true, transformation(origin = {-338, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E501(T0 = BPHE.E501.Tout_start_hot, m_flow0 = BPHE.E501.m_flow_start_hot, p0 = BPHE.E501.pout_start_hot, pin_start = BPHE.E501.pout_start_hot) annotation (
      Placement(visible = true, transformation(origin = {-117, -35}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E501(T0 = BPHE.E501.Tin_start_hot, p0 = BPHE.E501.pin_start_hot)               annotation (
      Placement(visible = true, transformation(origin = {-118, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(Di_cold = BPHE.E501.Di_cold, Di_hot = BPHE.E501.Di_hot, L_cold = BPHE.E501.L_cold, L_hot = BPHE.E501.L_hot, MWall = BPHE.E501.MWall, Stot_cold = BPHE.E501.Stot_cold, Stot_hot = BPHE.E501.Stot_hot, Tin_start_cold = BPHE.E501.Tin_start_cold, Tin_start_hot = BPHE.E501.Tin_start_hot, Tout_start_cold = BPHE.E501.Tout_start_cold, Tout_start_hot = BPHE.E501.Tout_start_hot, cpm_cold = BPHE.E501.cpm_cold, cpm_hot = BPHE.E501.cpm_hot, t_cold = BPHE.E501.t_cold, t_hot = BPHE.E501.t_hot, gamma_nom_cold = BPHE.E501.gamma_nom_cold, gamma_nom_hot = BPHE.E501.gamma_nom_hot, h_cold = BPHE.E501.h_cold, h_hot = BPHE.E501.h_hot, hctype_cold = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream, hctype_hot = MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,                                                                                     k_cold = BPHE.E501.k_cold, k_hot = BPHE.E501.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E501.lambdam_cold, lambdam_hot = BPHE.E501.lambdam_hot, m_flow_start_cold = BPHE.E501.m_flow_start_cold, m_flow_start_hot = BPHE.E501.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E501.nPipes_cold, nPipes_hot = BPHE.E501.nPipes_hot, nPlates = BPHE.E501.nPlates, pin_start_cold = BPHE.E501.pin_start_cold, pin_start_hot = BPHE.E501.pin_start_hot, pout_start_cold = BPHE.E501.pout_start_cold, pout_start_hot = BPHE.E501.pout_start_hot, rho_nom_cold = (BPHE.E501.rhoin_nom_cold + BPHE.E501.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E501.rhoin_nom_hot + BPHE.E501.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E501.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E501.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E501.u_nom_cold, u_nom_hot = BPHE.E501.u_nom_hot) annotation (
      Placement(visible = true, transformation(origin = {-181, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E601(T0 = BPHE.E601.Tout_start_cold, m_flow0 = BPHE.E601.m_flow_start_cold, p0 = BPHE.E601.pout_start_cold, pin_start = BPHE.E601.pout_start_cold, use_in_m_flow = true) annotation (
      Placement(visible = true, transformation(origin = {29, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E601(Di_cold = BPHE.E601.Di_cold, Di_hot = BPHE.E601.Di_hot, L_cold = BPHE.E601.L_cold, L_hot = BPHE.E601.L_hot, MWall = BPHE.E601.MWall, Stot_cold = BPHE.E601.Stot_cold, Stot_hot = BPHE.E601.Stot_hot, Tin_start_cold = BPHE.E601.Tin_start_cold, Tin_start_hot = BPHE.E601.Tin_start_hot, Tout_start_cold = BPHE.E601.Tout_start_cold, Tout_start_hot = BPHE.E601.Tout_start_hot, cpm_cold = BPHE.E601.cpm_cold, cpm_hot = BPHE.E601.cpm_hot, t_cold = BPHE.E601.t_cold, t_hot = BPHE.E601.t_hot, gamma_nom_cold = BPHE.E601.gamma_nom_cold, gamma_nom_hot = BPHE.E601.gamma_nom_hot, h_cold = BPHE.E601.h_cold, h_hot = BPHE.E601.h_hot,                                                                                     k_cold = BPHE.E601.k_cold, k_hot = BPHE.E601.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E601.lambdam_cold, lambdam_hot = BPHE.E601.lambdam_hot, m_flow_start_cold = BPHE.E601.m_flow_start_cold, m_flow_start_hot = BPHE.E601.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E601.nPipes_cold, nPipes_hot = BPHE.E601.nPipes_hot, nPlates = BPHE.E601.nPlates, pin_start_cold = BPHE.E601.pin_start_cold, pin_start_hot = BPHE.E601.pin_start_hot, pout_start_cold = BPHE.E601.pout_start_cold, pout_start_hot = BPHE.E601.pout_start_hot, rho_nom_cold = (BPHE.E601.rhoin_nom_cold + BPHE.E601.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E601.rhoin_nom_hot + BPHE.E601.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E601.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E601.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E601.u_nom_cold, u_nom_hot = BPHE.E601.u_nom_hot) annotation (
      Placement(visible = true, transformation(origin = {87, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E601(T0 = BPHE.E601.Tin_start_cold, p0 = BPHE.E601.pin_start_cold)               annotation (
      Placement(visible = true, transformation(origin = {30, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E601(T0 = BPHE.E601.Tin_start_hot, p0 = BPHE.E601.pin_start_hot)               annotation (
      Placement(visible = true, transformation(origin = {150, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E601(T0 = BPHE.E601.Tout_start_hot, m_flow0 = BPHE.E601.m_flow_start_hot, p0 = BPHE.E601.pout_start_hot, pin_start = BPHE.E601.pout_start_hot) annotation (
      Placement(visible = true, transformation(origin = {151, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkCold_E701(T0 = BPHE.E701.Tout_start_cold, m_flow0 = BPHE.E701.m_flow_start_cold, p0 = BPHE.E701.pout_start_cold, pin_start = BPHE.E701.pout_start_cold) annotation (
      Placement(visible = true, transformation(origin = {239, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E701(Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot,                                                                                     k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot, n = 7, nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (
      Placement(visible = true, transformation(origin = {297, -2}, extent = {{-31, -50}, {31, 50}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceCold_E701(T0 = BPHE.E701.Tin_start_cold, p0 = BPHE.E701.pin_start_cold)               annotation (
      Placement(visible = true, transformation(origin = {240, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot_E701(T0 = BPHE.E701.Tout_start_hot, m_flow0 = BPHE.E701.m_flow_start_hot, p0 = BPHE.E701.pout_start_hot, pin_start = BPHE.E701.pout_start_hot) annotation (
      Placement(visible = true, transformation(origin = {361, -37}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot_E701(T0 = BPHE.E701.Tin_start_hot, p0 = BPHE.E701.pin_start_hot)               annotation (
      Placement(visible = true, transformation(origin = {360, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp E601_mflow_cold(duration = 20, height = -BPHE.E601.m_flow_start_cold*0.2, offset = BPHE.E601.m_flow_start_cold, startTime = 20)  annotation (
      Placement(visible = true, transformation(origin = {4, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    connect(sinkCold_E301.inlet, E301.outcold) annotation (
      Line(points={{-436,33},{-420,33},{-420,33},{-404.5,33}},          color = {168, 168, 168}));
    connect(sourceCold_E301.outlet, E301.incold) annotation (
      Line(points={{-440,-36},{-422,-36},{-422,-37},{-404.5,-37}},
                                                color = {168, 168, 168}));
    connect(E301.outhot, sinkHot_E301.inlet) annotation (
      Line(points={{-373.5,-37},{-366,-37},{-366,-38},{-360,-38},{-360,-37},{-348,
            -37}},                              color = {168, 168, 168}));
    connect(E301.inhot, sourceHot_E301.outlet) annotation (
      Line(points={{-373.5,33},{-348,33},{-348,32}},      color = {168, 168, 168}));
    connect(sinkCold_E501.inlet, E501.outcold) annotation (
      Line(points={{-222,33},{-196.5,33}},    color = {168, 168, 168}));
    connect(sourceCold_E501.outlet, E501.incold) annotation (
      Line(points={{-228,-36},{-212,-36},{-212,-37},{-196.5,-37}},
                                                color = {168, 168, 168}));
    connect(E501.inhot, sourceHot_E501.outlet) annotation (
      Line(points={{-165.5,33},{-146,33},{-146,34},{-128,34}},
                                                  color = {168, 168, 168}));
    connect(E501.outhot, sinkHot_E501.inlet) annotation (
      Line(points={{-165.5,-37},{-148.5,-37},{-148.5,-35},{-130,-35}},            color = {168, 168, 168}));
    connect(sinkCold_E601.inlet, E601.outcold) annotation (
      Line(points={{42,33},{71.5,33}},    color = {168, 168, 168}));
    connect(sourceCold_E601.outlet, E601.incold) annotation (
      Line(points={{40,-36},{56,-36},{56,-37},{71.5,-37}},
                                            color = {168, 168, 168}));
    connect(E601.outhot, sinkHot_E601.inlet) annotation (
      Line(points = {{102.5, -37}, {138, -37}}, color = {168, 168, 168}));
    connect(E601.inhot, sourceHot_E601.outlet) annotation (
      Line(points={{102.5,33},{122,33},{122,34},{140,34}},
                                                color = {168, 168, 168}));
    connect(sinkCold_E701.inlet, E701.outcold) annotation (
      Line(points={{252,33},{260,33},{260,34},{267.5,34},{267.5,33},{281.5,33}},
                                            color = {168, 168, 168}));
    connect(sourceCold_E701.outlet, E701.incold) annotation (
      Line(points={{250,-36},{266,-36},{266,-37},{281.5,-37}},
                                              color = {168, 168, 168}));
    connect(E701.outhot, sinkHot_E701.inlet) annotation (
      Line(points={{312.5,-37},{322,-37},{322,-38},{330,-38},{330,-37},{348,-37}},
                                              color = {168, 168, 168}));
    connect(E701.inhot, sourceHot_E701.outlet) annotation (
      Line(points={{312.5,33},{332,33},{332,34},{350,34}},
                                            color = {168, 168, 168}));
    connect(E601_mflow_cold.y, sinkCold_E601.in_m_flow) annotation (
      Line(points={{15,70},{36.8,70},{36.8,39.5}},  color = {0, 0, 127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-500, -100}, {500, 100}})),
      Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"));
  end BPHETest;

  model WaterTest
    extends Modelica.Icons.Example;
    replaceable package Medium =
        MultiEnergySystem.DistrictHeatingNetwork.Media.StandardWater                          constrainedby
      Modelica.Media.Interfaces.PartialMedium "Medium model";

    Medium.ThermodynamicState fluidIn, fluidOut;

    parameter Modelica.Units.SI.Temperature Tin = 28 + 273.15;
    parameter Modelica.Units.SI.Temperature Tout = 24.9 + 273.15;
    parameter Modelica.Units.SI.Density rhoin = 995.03;
    parameter Modelica.Units.SI.Density rhoout = 996.01;
    Modelica.Units.SI.Pressure pin, pout, dp;
    Modelica.Units.SI.SpecificHeatCapacity cpin, cpout;
  equation

    fluidIn = Medium.setState_dTX(rhoin, Tin);
    pin = fluidIn.p;
    fluidOut = Medium.setState_dTX(rhoout, Tout);
    pout = fluidOut.p;
    dp = pin - pout;
    cpin = Medium.specificHeatCapacityCp(fluidIn);
    cpout = Medium.specificHeatCapacityCp(fluidOut);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end WaterTest;

  model ControlledHeatPumpNoDynamicsTest
    extends Modelica.Icons.Example;
    parameter SI.MassFlowRate m_flow_hot = 0.56;
    parameter SI.MassFlowRate m_flow_cold = 1;
    parameter SI.Temperature Tin_cold = 14 + 273.15;
    parameter SI.Temperature Tin_hot = 30 + 273.15;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics heatpump annotation (
      Placement(visible = true, transformation(origin = {-6, 6.43929e-15}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkHot(T0 = 45 + 273.15, p0 = 99999.99999999999, pin_start = 99999.99999999999, m_flow0 = m_flow_hot)  annotation (
      Placement(visible = true, transformation(origin = {34, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceHot(
      use_in_T0=true,                                                         T0 = Tin_hot,
      p0=100000)                                                                                                                      annotation (
      Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold(T0 = Tin_cold, m_flow0 = m_flow_cold, p0(displayUnit = "Pa") = 200000, use_in_T = true)  annotation (
      Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkPressure sinkCold(T0=282.15,
        p0=200000)                                                                                                      annotation (
      Placement(visible = true, transformation(origin = {-50, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tincold(duration = 20, height = -7, offset = 14 + 273.15, startTime = 10)  annotation (
      Placement(visible = true, transformation(origin = {-10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tinhot(duration = 20, height = 5, offset = 30 + 273.15, startTime = 40) annotation (
      Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(sinkCold.inlet, heatpump.outcold) annotation (
      Line(points={{-40,-60},{-26.4,-60},{-26.4,-20.4}},  color = {168, 168, 168}));
    connect(heatpump.outhot, sinkHot.inlet) annotation (
      Line(points={{14.4,20.4},{14.4,40},{24,40}},  color = {168, 168, 168}));
    connect(sourceHot.outlet, heatpump.inhot) annotation (
      Line(points={{-40,40},{-26.4,40},{-26.4,20.4}},  color = {168, 168, 168}));
    connect(heatpump.incold, sourceCold.outlet) annotation (
      Line(points={{14.4,-20.4},{14.4,-60},{20,-60}},  color = {168, 168, 168}));
    connect(Tincold.y, sourceCold.in_T) annotation (
      Line(points={{1,-90},{30,-90},{30,-65}},        color = {0, 0, 127}));
    connect(Tinhot.y, sourceHot.in_T0) annotation (Line(points={{-59,70},{-50,70},
            {-50,72},{-46,72},{-46,48.4}}, color={0,0,127}));
  annotation (
      Documentation(info = "<html><head></head><body>Test model for the component:&nbsp;<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics\">ControlledHeatPumpNoDynamics</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>cold water inlet temperature</li><li>hot water inlet temperature</li></ul></div><div></div></body></html>"));
  end ControlledHeatPumpNoDynamicsTest;

  model ElectricBoilerTestII
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3,Tin_start = 60 + 273.15, etanom = 0.98, h = 1.25, m_flow_nom = 1, pin_start = 300000, pout_start = 289999.9999999999)  annotation (
      Placement(visible = true, transformation(origin = {-8.88178e-16, 8.88178e-16}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true)  annotation (
      Placement(visible = true, transformation(origin = {-48, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(
      use_in_T0=true,
      T0=333.15,
      p0=310000)                                                                                                                          annotation (
      Placement(visible = true, transformation(origin = {-48, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tin(duration = 600, height =  0, offset = 60 + 273.15, startTime = 250) annotation (
      Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp m_flow(duration = 100, height = -0.2, offset = 0.5, startTime = 100) annotation (
      Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
      Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(sinkM.inlet, eBoiler.outlet) annotation (
      Line(points={{-38,10},{-16,10},{-16,20.8},{7.8,20.8}},
                                            color = {136, 136, 136}));
    connect(sourceP.outlet, eBoiler.inlet) annotation (
      Line(points={{-38,-12},{-7.8,-12},{-7.8,20.8}},     color = {136, 136, 136}));
    connect(m_flow.y, sinkM.in_m_flow) annotation (
      Line(points={{-59,30},{-42,30},{-42,15}},        color = {0, 0, 127}));

    connect(Tin.y, sourceP.in_T0) annotation (Line(points={{-59,-30},{-50,-30},
            {-50,-32},{-44,-32},{-44,-20.4}}, color={0,0,127}));
  annotation (
      experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-6, Interval = 0.5),
      Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
  end ElectricBoilerTestII;

  model TestMultipleDaisyChain
    MultiEnergySystem.DistrictHeatingNetwork.Actuators.MultipleDaisyChain multipleDaisyChain annotation (
      Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression U(y = if time < 10 then 20e3 else 38e3)  annotation (
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Actuators.DaisyChainMO daisyChainMO(Umax = {10e3, 10e3, 10e3, 10e3}, Umin = {0, 0, 0, 0}, n = 4)  annotation (
      Placement(visible = true, transformation(origin = {5, -39}, extent = {{-29, -29}, {29, 29}}, rotation = 0)));
  equation
    connect(U.y, multipleDaisyChain.U);
    connect(U.y, daisyChainMO.U) annotation (
      Line(points={{-49,0},{-40,0},{-40,-39},{-29.8,-39}},        color = {0, 0, 127}));
  end TestMultipleDaisyChain;

  model ControlledElectricBoilerTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler eBoiler(D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3,
      Tin_start=333.15,                                                                                                                                                                 etanom = 0.98, h = 1.25, m_flow_nom = 1,
      pin_start=300000,
      pout_start=290000,
      T_bandwidth=7)                                                                                                                                                                                                         annotation (
      Placement(visible = true, transformation(origin = {28, 8}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true) annotation (
      Placement(visible = true, transformation(origin={-10,60},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(
      use_in_T0=true,
      T0=333.15,
      p0=310000)                                                                                                                         annotation (
      Placement(visible = true, transformation(origin={-10,42},    extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tin(duration = 100,
      height=-5,                                                   offset = 65 + 273.15, startTime = 250) annotation (
      Placement(visible = true, transformation(origin={-62,-36},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp m_flow(duration = 100,
      height=0.25*0,
      offset=0.7,                                                                    startTime = 1800) annotation (
      Placement(visible = true, transformation(origin={-40,70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
      Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tin_up(duration = 100,
      height=10,                                                     offset = 0, startTime = 500) annotation (
      Placement(visible = true, transformation(origin={-62,-8},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation (
      Placement(visible = true, transformation(origin = {-30, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Tout_ref(
      duration=100,
      height=10,
      offset=80 + 273.15,
      startTime=500) annotation (Placement(visible=true, transformation(
          origin={-34,8},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{94,-8},{62,24}})));
    Modelica.Blocks.Sources.BooleanTable EB401_Status(table={1e6}, startValue=true) "Input to decide whether or nor the electric boiler is working" annotation (Placement(transformation(extent={{-6,-42},{6,-30}})));
  equation
    connect(sinkM.inlet, eBoiler.outlet) annotation (
      Line(points={{0,60},{35.8,60},{35.8,28.8}},
                                           color = {136, 136, 136}));
    connect(sourceP.outlet, eBoiler.inlet) annotation (
      Line(points={{0,42},{20,42},{20,36},{20.2,36},{20.2,28.8}},
                                                   color = {136, 136, 136}));
    connect(m_flow.y, sinkM.in_m_flow) annotation (
      Line(points={{-29,70},{-4,70},{-4,65}},          color = {0, 0, 127}));
    connect(Tin.y, add.u2) annotation (
      Line(points={{-51,-36},{-48,-36},{-48,-28},{-42,-28}},          color = {0, 0, 127}));
    connect(add.y, sourceP.in_T0)
      annotation (Line(points={{-19,-22},{-12,-22},{-12,22},{-6,22},{-6,33.6}},
                                                               color={0,0,127}));
    connect(Tout_ref.y, eBoiler.Tout_ref)
      annotation (Line(points={{-23,8},{9.8,8}}, color={0,0,127}));
    connect(sourceVoltage.outlet, eBoiler.inletPower) annotation (Line(
        points={{62,8},{46.2,8}},
        color={56,93,138},
        thickness=1));
    connect(Tin_up.y, add.u1) annotation (Line(points={{-51,-8},{-48,-8},{-48,-16},{-42,-16}}, color={0,0,127}));
    connect(EB401_Status.y, eBoiler.heat_on) annotation (Line(points={{6.6,-36},{10,-36},{10,-8},{9.8,-8},{9.8,-5}}, color={255,0,255}));
    annotation (
      experiment(StartTime = 0, StopTime = 3500, Tolerance = 1e-06, Interval = 7),
      Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
  end ControlledElectricBoilerTest;

  model LumpedStorageConstantMassTest
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=false,
      use_in_m_flow=false,                                                                   mflownom=
          5,
      Tnom=353.15)                                                                           annotation (
        Placement(visible=true, transformation(
          origin={-76,66},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(p=200000,
        T=323.15)                                                                   annotation (Placement(
          visible=true, transformation(
          origin={78,86},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorageConstantMass
      LumpedStorageConstantMass(H=0.1)  annotation (Placement(transformation(
          extent={{-10,-14},{10,14}},
          rotation=270,
          origin={-6,50})));
  equation
    connect(idealMassFlowSource.outlet, LumpedStorageConstantMass.inlet)
      annotation (Line(
        points={{-65.8,66},{-22,66},{-22,60},{-16,60}},
        color={140,56,54},
        thickness=0.5));
    connect(LumpedStorageConstantMass.outlet, expansionTank.inlet) annotation (
        Line(
        points={{4,60},{4,70},{68,70},{68,64},{78,64},{78,76}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})));
  end LumpedStorageConstantMassTest;

  model PFPipe_vs_AixLibPF_test
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=
          5, Tnom=353.15)                                                                    annotation (
        Placement(visible=true, transformation(
          origin={-76,80},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (Placement(
          visible=true, transformation(
          origin={79,89},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF pipePF(
      allowFlowReversal=false,
      pin_start=100000,
      D=0.0508,
      L=50,
      H=0,
      rhom(displayUnit="kg/m3"),
      T_start(displayUnit="degC") = 338.15,
      T_start_m(displayUnit="degC") = 338.15,
      cpm=880)                                annotation (Placement(visible=true,
          transformation(
          origin={-10,80},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor pfOut annotation (Placement(
          visible=true, transformation(
          origin={40,84},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    AixLib.Fluid.Sources.Boundary_pT
                        sin(
      redeclare package Medium = AixLib.Media.Water,
      T=338.15,
      nPorts=1,
      p(displayUnit="bar") = 250000)
                                    "Pressure boundary condition"
      annotation (Placement(transformation(extent={{70,14},{58,26}})));
    AixLib.Fluid.FixedResistances.PlugFlowPipe pip(
      redeclare package Medium = AixLib.Media.Water,
      m_flow_small=0.1,
      have_symmetry=false,
      dh=0.0508,
      length=50,
      dIns=0.05,
      kIns=0.028,
      m_flow_nominal=1,
      cPip=880,
      thickness=0.003,
      initDelay=true,
      m_flow_start=1,
      rhoPip=7850,
      T_start_in=338.15,
      T_start_out=338.15) "Pipe"
      annotation (Placement(transformation(extent={{-10,12},{4,28}})));
    Modelica.Thermal.HeatTransfer.Sources.FixedTemperature bou[2](each T=298.15)
      "Boundary temperature"
      annotation (Placement(transformation(extent={{-22,40},{-14,48}})));
    AixLib.Fluid.Sources.MassFlowSource_T sou(
      redeclare package Medium = AixLib.Media.Water,
      use_T_in=false,
      m_flow=5,
      T=353.15,
      nPorts=1) "Flow source"
      annotation (Placement(transformation(extent={{-82,10},{-62,30}})));
    AixLib.Fluid.Sensors.TemperatureTwoPort senTemOut(
      redeclare package Medium = AixLib.Media.Water,
      m_flow_nominal=1,
      tau=0,
      T_start(displayUnit="K") = 65)
                      "Temperature sensor"
      annotation (Placement(transformation(extent={{16,10},{36,30}})));
    AixLib.Fluid.Sensors.TemperatureTwoPort senTemIn(
      redeclare package Medium = AixLib.Media.Water,
      m_flow_nominal=1,
      tau=0,
      T_start(displayUnit="degC") = 338.15)
                      "Temperature sensor"
      annotation (Placement(transformation(extent={{-48,10},{-28,30}})));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor pfIn
      annotation (Placement(visible=true, transformation(
          origin={-42,84},
          extent={{-10,-10},{10,10}},
          rotation=0)));
  equation
    connect(pip.port_b,senTemOut. port_a)
      annotation (Line(points={{4,20},{16,20}},color={0,127,255}));
    connect(senTemOut.port_b,sin. ports[1])
      annotation (Line(points={{36,20},{58,20}},
                                               color={0,127,255}));
    connect(senTemIn.port_b,pip. port_a)
      annotation (Line(points={{-28,20},{-10,20}},
                                               color={0,127,255}));
    connect(bou[1].port,pip. heatPort)
      annotation (Line(points={{-14,44},{-3,44},{-3,28}}, color={191,0,0}));
    connect(sou.ports[1],senTemIn. port_a) annotation (Line(points={{-62,20},{
            -48,20}},           color={0,127,255}));
    connect(idealMassFlowSource.outlet, pfIn.inlet) annotation (Line(
        points={{-65.8,80},{-48,80}},
        color={140,56,54},
        thickness=0.5));
    connect(pfIn.outlet, pipePF.inlet) annotation (Line(
        points={{-36,80},{-20,80}},
        color={140,56,54},
        thickness=0.5));
    connect(pipePF.outlet, pfOut.inlet) annotation (Line(
        points={{0,80},{34,80}},
        color={140,56,54},
        thickness=0.5));
    connect(pfOut.outlet, expansionTank.inlet) annotation (Line(
        points={{46,80},{66,80},{66,74},{79,74},{79,80}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(
          StopTime=120, __Dymola_Algorithm="Dassl"));
  end PFPipe_vs_AixLibPF_test;

  model PF_PipeTest
    "Test of the Plug Flow Pipe used to reproduce the test in the paper from Sartor and Dewallef"
    extends Modelica.Icons.Example;
    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=true,
      use_in_m_flow=true,
      use_in_T=true,
      mflownom=1.67,
      Tnom(displayUnit="K") = 38 + 273.15)                                                   annotation (
        Placement(visible=true, transformation(
          origin={-66,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(
        allowFlowReversal=true, T=287.15)                                           annotation (Placement(
          visible=true, transformation(
          origin={92,68},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF PF_Pipe(
      allowFlowReversal=true,
      m_flow_nominal=1.67,
      m_flow_start=0.58,
      pin_start=100000,
      D=0.0508,
      L=39,
      H=0,
      tIns=0.013,
      lambdaIns=0.04,
      t=0.004,
      rhom(displayUnit="kg/m3") = 8000,
      T_start(displayUnit="degC") = 300.65,
      T_start_m(displayUnit="degC") = 300.65,
      cpm=500) annotation (Placement(visible=true, transformation(
          origin={10,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_PF
      annotation (Placement(visible=true, transformation(
          origin={46,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow(
      duration=0,
      height=0,
      offset=1.2,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-105,51},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tin_PF
      annotation (Placement(visible=true, transformation(
          origin={-28,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp T_ref(
      duration=0,
      height=32.5,
      offset=27.5 + 273.15,
      startTime=0) annotation (Placement(visible=true, transformation(
          origin={-105,85},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
      k=1,
      T=10,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=27.5 + 273.15)
      annotation (Placement(transformation(extent={{-84,76},{-66,94}})));
    Modelica.Blocks.Sources.Ramp T_ref1(
      duration=0,
      height=-22.5,
      offset=0,
      startTime=600) annotation (Placement(visible=true, transformation(
          origin={-107,121},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-84,104},{-64,124}})));
  equation
    connect(PF_Pipe.outlet, Tout_PF.inlet) annotation (Line(
        points={{20,54},{40,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tout_PF.outlet, expansionTank.inlet) annotation (Line(
        points={{52,54},{92,54},{92,58}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-95.1,
            51},{-82,51},{-82,68},{-71,68},{-71,60.2}},       color={0,0,127}));
    connect(idealMassFlowSource.outlet, Tin_PF.inlet) annotation (Line(
        points={{-55.8,54},{-34,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tin_PF.outlet, PF_Pipe.inlet) annotation (Line(
        points={{-22,54},{0,54}},
        color={140,56,54},
        thickness=0.5));
    connect(firstOrder.y, idealMassFlowSource.in_T) annotation (Line(points={{
            -65.1,85},{-61,85},{-61,60.2}}, color={0,0,127}));
    connect(T_ref.y, add.u2) annotation (Line(points={{-95.1,85},{-92,85},{-92,
            108},{-86,108}}, color={0,0,127}));
    connect(T_ref1.y, add.u1) annotation (Line(points={{-97.1,121},{-86,121},{
            -86,120}}, color={0,0,127}));
    connect(add.y, firstOrder.u) annotation (Line(points={{-63,114},{-54,114},{
            -54,100},{-90,100},{-90,85},{-85.8,85}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(StopTime=
            900, __Dymola_Algorithm="Dassl"));
  end PF_PipeTest;

  model PF_PipeTest_realdata
    "Test of the Plug Flow Pipe used to reproduce the test in the paper from Sartor and Dewallef"
    extends Modelica.Icons.Example;
    parameter Real time_ref[:] = {0, 0.91, 2.72, 4.53, 6.34, 8.16, 9.97, 13.6,
  19.03,
  30.82,
  35.35,
  59.82,
  73.41,
  87.92,
  116.92,
  127.79,
  138.67,
  141.39,
  145.92,
  151.36,
  154.98,
  157.7,
  161.33,
  162.24,
  164.95,
  168.58,
  173.11,
  177.64,
  182.18,
  185.8,
  192.15,
  198.49,
  202.11,
  205.74,
  211.18,
  216.62,
  222.96,
  230.21,
  236.56,
  245.62,
  251.06,
  254.68,
  267.37,
  274.62,
  275.53,
  292.75,
  296.37,
  314.5,
  318.13,
  334.44,
  341.69,
  361.63,
  385.2,
  403.32,
  405.14,
  420.54,
  430.51,
  450.45,
  475.83,
  495.77,
  519.34,
  539.27,
  564.65,
  584.59,
  588.22};

    parameter Real Tinref[:] = {20.115+273.15, 20.115+273.15,
  23.931+273.15,
  27.748+273.15,
  31.565+273.15,
  35.382+273.15,
  39.198+273.15,
  43.015+273.15,
  46.832+273.15,
  49.819+273.15,
  50.344+273.15,
  51.689+273.15,
  52.023+273.15,
  52.222+273.15,
  52.328+273.15,
  52.328+273.15,
  52.323+273.15,
  52.322+273.15,
  52.321+273.15,
  52.321+273.15,
  52.322+273.15,
  52.324+273.15,
  52.327+273.15,
  52.328+273.15,
  52.332+273.15,
  52.339+273.15,
  52.349+273.15,
  52.362+273.15,
  52.377+273.15,
  52.391+273.15,
  52.417+273.15,
  52.446+273.15,
  52.463+273.15,
  52.481+273.15,
  52.508+273.15,
  52.535+273.15,
  52.565+273.15,
  52.594+273.15,
  52.615+273.15,
  52.632+273.15,
  52.634+273.15,
  52.631+273.15,
  52.598+273.15,
  52.57+273.15,
  52.566+273.15,
  52.494+273.15,
  52.481+273.15,
  52.444+273.15,
  52.442+273.15,
  52.459+273.15,
  52.481+273.15,
  52.573+273.15,
  52.634+273.15,
  52.576+273.15,
  52.568+273.15,
  52.501+273.15,
  52.481+273.15,
  52.525+273.15,
  52.634+273.15,
  52.655+273.15,
  52.634+273.15,
  52.626+273.15,
  52.634+273.15,
  52.64+273.15,
  52.641+273.15};


    parameter Real Toutref[:] = {
  291.432,
  291.432,
  291.438,
  291.444,
  291.45,
  291.455,
  291.461,
  291.472,
  291.486,
  291.509,
  291.513,
  291.509,
  291.501,
  291.509,
  291.558,
  291.585,
  291.814,
  292.654,
  293.57,
  294.562,
  296.089,
  297.158,
  298.303,
  298.544,
  299.295,
  300.593,
  301.814,
  303.57,
  305.173,
  307.387,
  309.6,
  312.043,
  313.952,
  314.742,
  315.784,
  317.31,
  318.532,
  319.829,
  320.898,
  321.967,
  322.546,
  322.883,
  323.799,
  324.104,
  324.41,
  324.868,
  324.912,
  325.02,
  325.02,
  325.173,
  325.262,
  325.478,
  325.213,
  325.326,
  325.478,
  325.555,
  325.52,
  325.478,
  325.554,
  325.631,
  325.666,
  325.631,
  325.54,
  325.478,
  325.631};

    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=true,
      use_in_m_flow=true,
      use_in_T=true,
      mflownom=1.67,
      Tnom(displayUnit="K") = 38 + 273.15)                                                   annotation (
        Placement(visible=true, transformation(
          origin={-66,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(
        allowFlowReversal=true, T=287.15)                                           annotation (Placement(
          visible=true, transformation(
          origin={92,68},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF PF_Pipe(
      allowFlowReversal=true,
      m_flow_nominal=1.67,
      m_flow_start=0.58,
      pin_start=100000,
      D=0.0508,
      L=39,
      H=0,
      tIns=0.013,
      lambdaIns=0.04,
      t=0.004,
      rhom(displayUnit="kg/m3") = 8000,
      T_start(displayUnit="degC") = 291.432,
      T_start_m(displayUnit="degC") = 291.432,
      cpm=500) annotation (Placement(visible=true, transformation(
          origin={10,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_PF
      annotation (Placement(visible=true, transformation(
          origin={46,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow(
      duration=0,
      height=0,
      offset=0.58,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-105,51},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tin_PF
      annotation (Placement(visible=true, transformation(
          origin={-28,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.TimeTable Tin_ref(table=[time_ref,Tinref])
      annotation (Placement(transformation(extent={{-94,90},{-74,110}})));
    Modelica.Blocks.Sources.TimeTable Tout_ref(table=[time_ref,Toutref])
      annotation (Placement(transformation(extent={{-46,90},{-26,110}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-10,86},{10,106}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=273.15)
      annotation (Placement(transformation(extent={{-46,66},{-26,86}})));
  equation
    connect(PF_Pipe.outlet, Tout_PF.inlet) annotation (Line(
        points={{20,54},{40,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tout_PF.outlet, expansionTank.inlet) annotation (Line(
        points={{52,54},{92,54},{92,58}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-95.1,
            51},{-82,51},{-82,68},{-71,68},{-71,60.2}},       color={0,0,127}));
    connect(idealMassFlowSource.outlet, Tin_PF.inlet) annotation (Line(
        points={{-55.8,54},{-34,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tin_PF.outlet, PF_Pipe.inlet) annotation (Line(
        points={{-22,54},{0,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tin_ref.y, idealMassFlowSource.in_T) annotation (Line(points={{-73,100},
            {-61,100},{-61,60.2}}, color={0,0,127}));
    connect(Tout_ref.y, add.u1) annotation (Line(points={{-25,100},{-25,102},{
            -12,102}}, color={0,0,127}));
    connect(realExpression.y, add.u2) annotation (Line(points={{-25,76},{-18,76},
            {-18,90},{-12,90}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(StopTime=
            590, __Dymola_Algorithm="Dassl"));
  end PF_PipeTest_realdata;

  model FV_PipeTest_realdata
    "Test of the Finite Volume Pipe used to reproduce the test in the paper from Sartor and Dewallef, 2017"
    extends Modelica.Icons.Example;
    parameter Real time_ref[:] = {0, 0.91, 2.72, 4.53, 6.34, 8.16, 9.97, 13.6,
  19.03,
  30.82,
  35.35,
  59.82,
  73.41,
  87.92,
  116.92,
  127.79,
  138.67,
  141.39,
  145.92,
  151.36,
  154.98,
  157.7,
  161.33,
  162.24,
  164.95,
  168.58,
  173.11,
  177.64,
  182.18,
  185.8,
  192.15,
  198.49,
  202.11,
  205.74,
  211.18,
  216.62,
  222.96,
  230.21,
  236.56,
  245.62,
  251.06,
  254.68,
  267.37,
  274.62,
  275.53,
  292.75,
  296.37,
  314.5,
  318.13,
  334.44,
  341.69,
  361.63,
  385.2,
  403.32,
  405.14,
  420.54,
  430.51,
  450.45,
  475.83,
  495.77,
  519.34,
  539.27,
  564.65,
  584.59,
  588.22};

    parameter Real Tinref[:] = {18.282+273.15, 20.115+273.15,
  23.931+273.15,
  27.748+273.15,
  31.565+273.15,
  35.382+273.15,
  39.198+273.15,
  43.015+273.15,
  46.832+273.15,
  49.819+273.15,
  50.344+273.15,
  51.689+273.15,
  52.023+273.15,
  52.222+273.15,
  52.328+273.15,
  52.328+273.15,
  52.323+273.15,
  52.322+273.15,
  52.321+273.15,
  52.321+273.15,
  52.322+273.15,
  52.324+273.15,
  52.327+273.15,
  52.328+273.15,
  52.332+273.15,
  52.339+273.15,
  52.349+273.15,
  52.362+273.15,
  52.377+273.15,
  52.391+273.15,
  52.417+273.15,
  52.446+273.15,
  52.463+273.15,
  52.481+273.15,
  52.508+273.15,
  52.535+273.15,
  52.565+273.15,
  52.594+273.15,
  52.615+273.15,
  52.632+273.15,
  52.634+273.15,
  52.631+273.15,
  52.598+273.15,
  52.57+273.15,
  52.566+273.15,
  52.494+273.15,
  52.481+273.15,
  52.444+273.15,
  52.442+273.15,
  52.459+273.15,
  52.481+273.15,
  52.573+273.15,
  52.634+273.15,
  52.576+273.15,
  52.568+273.15,
  52.501+273.15,
  52.481+273.15,
  52.525+273.15,
  52.634+273.15,
  52.655+273.15,
  52.634+273.15,
  52.626+273.15,
  52.634+273.15,
  52.64+273.15,
  52.641+273.15};

    parameter Real Toutref[:] = {
  291.432,
  291.432,
  291.438,
  291.444,
  291.45,
  291.455,
  291.461,
  291.472,
  291.486,
  291.509,
  291.513,
  291.509,
  291.501,
  291.509,
  291.558,
  291.585,
  291.814,
  292.654,
  293.57,
  294.562,
  296.089,
  297.158,
  298.303,
  298.544,
  299.295,
  300.593,
  301.814,
  303.57,
  305.173,
  307.387,
  309.6,
  312.043,
  313.952,
  314.742,
  315.784,
  317.31,
  318.532,
  319.829,
  320.898,
  321.967,
  322.546,
  322.883,
  323.799,
  324.104,
  324.41,
  324.868,
  324.912,
  325.02,
  325.02,
  325.173,
  325.262,
  325.478,
  325.213,
  325.326,
  325.478,
  325.555,
  325.52,
  325.478,
  325.554,
  325.631,
  325.666,
  325.631,
  325.54,
  325.478,
  325.631};

    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=true,
      use_in_m_flow=true,
      use_in_T=true,
      mflownom=1.67,
      Tnom(displayUnit="K") = 38 + 273.15)                                                   annotation (
        Placement(visible=true, transformation(
          origin={-66,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(
        allowFlowReversal=true, T=287.15)                                           annotation (Placement(
          visible=true, transformation(
          origin={92,68},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_PF
      annotation (Placement(visible=true, transformation(
          origin={46,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow(
      duration=0,
      height=0,
      offset=0.58,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-105,51},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tin_PF
      annotation (Placement(visible=true, transformation(
          origin={-28,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.TimeTable Tin_ref(table=[time_ref,Tinref])
      annotation (Placement(transformation(extent={{-94,90},{-74,110}})));
    Modelica.Blocks.Sources.TimeTable Tout_ref(table=[time_ref,Toutref])
      annotation (Placement(transformation(extent={{-46,90},{-26,110}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-10,86},{10,106}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=273.15)
      annotation (Placement(transformation(extent={{-46,66},{-26,86}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV pipeFV(
      L=39,
      t=0.004,
      tIns=0.013,
      lambdaIns=0.04,
      cm=500,
      pin_start=100000,
      pout_start=250000,
      Tin_start=291.432,
      Tout_start=291.432,
      Di=0.0508,
      u_nom=1.67,
      T_start=289.15,
      N=10) annotation (Placement(transformation(extent={{-4,42},{20,66}})));
  equation
    connect(Tout_PF.outlet, expansionTank.inlet) annotation (Line(
        points={{52,54},{92,54},{92,58}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-95.1,
            51},{-82,51},{-82,68},{-71,68},{-71,60.2}},       color={0,0,127}));
    connect(idealMassFlowSource.outlet, Tin_PF.inlet) annotation (Line(
        points={{-55.8,54},{-34,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tin_ref.y, idealMassFlowSource.in_T) annotation (Line(points={{-73,100},
            {-61,100},{-61,60.2}}, color={0,0,127}));
    connect(Tout_ref.y, add.u1) annotation (Line(points={{-25,100},{-25,102},{
            -12,102}}, color={0,0,127}));
    connect(realExpression.y, add.u2) annotation (Line(points={{-25,76},{-18,76},
            {-18,90},{-12,90}}, color={0,0,127}));
    connect(Tin_PF.outlet, pipeFV.inlet) annotation (Line(
        points={{-22,54},{-4,54}},
        color={140,56,54},
        thickness=0.5));
    connect(pipeFV.outlet, Tout_PF.inlet) annotation (Line(
        points={{20,54},{40,54}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(StopTime=
            590, __Dymola_Algorithm="Dassl"));
  end FV_PipeTest_realdata;

  model FV_PipeTest_realdata_doublestep
    "Test of the Finite Volume Pipe used to reproduce the test in the paper from Sartor and Dewallef, 2017"
    extends Modelica.Icons.Example;
    parameter Real time_ref[:] = {0, 1.0765385773482783, 2.1531264354737463, 3.2296650128220703, 3.2296650128220703, 4.306203590170348, 7.535868602992373, 11.842121473939866, 15.071786486761889, 16.148325064110168, 17.224863641458445, 19.37799007693224, 21.531116512405983, 23.68419366710254, 29.066985115398356, 39.83251873121276, 49.521513769678826, 72.1291688594331, 92.58374679449075, 118.42106689706708, 152.870794179984, 176.55503712786376, 202.39235723043996, 227.1530894748908, 249.7607445646451, 272.36839965439935, 305.74163764074507, 322.9665505629808, 361.72253071684526, 390.78951583224364, 437.08131530832316, 482.2966254878316, 509.2105334485335, 531.8181885382877, 556.5789207827385, 591.0287466272098, 614.7128910135352, 631.9378039357707, 647.0095411417556, 661.0047890511692, 666.3875312186877, 668.5407069349386, 669.6171962315096, 672.8468612443318, 675.0000369605827, 676.0765262571538, 678.2297019734049, 682.5358562827979, 686.8421091537456, 692.2248513212639, 696.5311041922116, 706.2200992306775, 721.2918364366624, 751.4354094101863, 775.1196523580659, 798.8037967443912, 823.5646275503964, 850.4784369495437, 866.6267620136539, 886.0047520905862, 896.7703349871778};
    //parameter Real Tinref[:] = {27, 31.293492567677344, 33.9561285134399, 38.07110378381478, 38.07110378381478, 41.58093905399852, 44.00151290540304, 46.42208675680756, 48.66112027023152, 51.08169412163605, 53.19969797294499, 54.71255628380682, 56.0438714865601, 57.25415979732636, 58.645991216201146, 59.49319192568633, 60.037821250011945, 60.52193574328005, 60.82450851350361, 60.94553679055464, 61.127079898663176, 61.42965128382274, 61.30862300677172, 61.55068094593776, 61.611194391931285, 61.671709222988795, 61.85325233109733, 61.85325233109733, 62.03479543920587, 62.09531027026338, 62.1558237162569, 62.21633854731441, 62.33736682436544, 62.276853378371925, 62.45839648648046, 62.33736682436544, 62.1558237162569, 61.55068094593776, 60.642965405395074, 59.977306418954434, 58.76701949325218, 57.25415979732636, 55.92284459457307, 54.6520428378133, 52.65506864861938, 51.142207567629555, 49.08471993244212, 47.02723229725468, 45.393344324277834, 43.3358539189624, 41.58093905399852, 39.5839648648046, 38.313163108044826, 38.01059033782126, 37.7080175675977, 37.647504121604186, 37.647504121604186, 37.465961013495644, 37.465961013495644, 37.34493135138062, 37.34493135138062};

    parameter Real Tinref[:] = {27.546523760003954+273.15, 304.4434925676773, 307.1061285134399, 311.2211037838148, 311.2211037838148, 314.7309390539985, 317.151512905403, 319.57208675680755, 321.8111202702315, 324.231694121636, 326.34969797294497, 327.8625562838068, 329.19387148656006, 330.4041597973263, 331.7959912162011, 332.6431919256863, 333.1878212500119, 333.67193574328, 333.97450851350357, 334.0955367905546, 334.27707989866315, 334.5796512838227, 334.4586230067717, 334.70068094593773, 334.76119439193127, 334.8217092229888, 335.0032523310973, 335.0032523310973, 335.18479543920586, 335.24531027026336, 335.3058237162569, 335.3663385473144, 335.48736682436544, 335.4268533783719, 335.60839648648044, 335.48736682436544, 335.3058237162569, 334.70068094593773, 333.7929654053951, 333.1273064189544, 331.91701949325216, 330.4041597973263, 329.07284459457304, 327.8020428378133, 325.80506864861934, 324.29220756762953, 322.2347199324421, 320.17723229725465, 318.5433443242778, 316.4858539189624, 314.7309390539985, 312.7339648648046, 311.4631631080448, 311.16059033782125, 310.8580175675977, 310.79750412160416, 310.79750412160416, 310.6159610134956, 310.6159610134956, 310.4949313513806, 310.4949313513806};


    MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(
      allowFlowReversal=true,
      use_in_m_flow=true,
      use_in_T=true,
      mflownom=1.2,
      Tnom(displayUnit="K") = 30 + 273.15)                                                   annotation (
        Placement(visible=true, transformation(
          origin={-66,54},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(
        allowFlowReversal=true, T=287.15)                                           annotation (Placement(
          visible=true, transformation(
          origin={92,68},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tout_PF
      annotation (Placement(visible=true, transformation(
          origin={46,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.Ramp m_flow(
      duration=0,
      height=0,
      offset=1.2,
      startTime=10) annotation (Placement(visible=true, transformation(
          origin={-105,51},
          extent={{-9,-9},{9,9}},
          rotation=0)));
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tin_PF
      annotation (Placement(visible=true, transformation(
          origin={-28,58},
          extent={{-10,-10},{10,10}},
          rotation=0)));
    Modelica.Blocks.Sources.TimeTable Tin_ref(table=[time_ref,Tinref])
      annotation (Placement(transformation(extent={{-94,90},{-74,110}})));
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV pipeFV(
      L=39,
      t=0.004,
      tIns=0.013,
      lambdaIns=0.04,
      cm=500,
      m_flow_start=1.2,
      pin_start=100000,
      pout_start=250000,
      Tin_start=303.15,
      Tout_start=303.15,
      Di=0.0508,
      u_nom=0.59,
      T_start=289.15,
      N=25) annotation (Placement(transformation(extent={{-4,42},{20,66}})));
  equation
    connect(Tout_PF.outlet, expansionTank.inlet) annotation (Line(
        points={{52,54},{92,54},{92,58}},
        color={140,56,54},
        thickness=0.5));
    connect(m_flow.y, idealMassFlowSource.in_m_flow) annotation (Line(points={{-95.1,
            51},{-82,51},{-82,68},{-71,68},{-71,60.2}},       color={0,0,127}));
    connect(idealMassFlowSource.outlet, Tin_PF.inlet) annotation (Line(
        points={{-55.8,54},{-34,54}},
        color={140,56,54},
        thickness=0.5));
    connect(Tin_ref.y, idealMassFlowSource.in_T) annotation (Line(points={{-73,100},
            {-61,100},{-61,60.2}}, color={0,0,127}));
    connect(Tin_PF.outlet, pipeFV.inlet) annotation (Line(
        points={{-22,54},{-4,54}},
        color={140,56,54},
        thickness=0.5));
    connect(pipeFV.outlet, Tout_PF.inlet) annotation (Line(
        points={{20,54},{40,54}},
        color={140,56,54},
        thickness=0.5));
    annotation (
      Diagram(coordinateSystem(extent={{-100,0},{100,100}})), experiment(StopTime=
            890, __Dymola_Algorithm="Dassl"));
  end FV_PipeTest_realdata_doublestep;
end Test;
