within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model LumpedTESTest
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant temperature(k=75)   annotation (
    Placement(visible = true, transformation(origin = {-130, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant massflow(k=1)   annotation (
    Placement(visible = true, transformation(origin = {-102, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource annotation (
    Placement(visible = true, transformation(origin = {-68, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank(T = 353.15)  annotation (
    Placement(visible = true, transformation(origin={88,12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.Storage.LumpedStorage tes(
    D=1.7,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        origin={-20,-50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant constant1(k = 10) annotation (
    Placement(visible = true, transformation(origin = {-106, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource idealMassFlowSource1 annotation (
    Placement(visible = true, transformation(origin = {-72, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant2(k=65)   annotation (
    Placement(visible = true, transformation(origin={-134,-48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DHN4Control.Components.ExpansionTank expansionTank1 annotation (
    Placement(visible = true, transformation(origin={88,-56},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  DHN4Control.Components.Storage.LumpedStorage lumpedStorage(
    D=1.7,
    T_ext=298.15,
    T_start=338.15,
    h=5) annotation (Placement(visible=true, transformation(
        origin={-20,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(massflow.y, idealMassFlowSource.m_flow)
    annotation (Line(points={{-91,18},{-77.8,18}},
                                                 color={0,0,127}));
  connect(temperature.y, idealMassFlowSource.T) annotation (
    Line(points={{-119,2},{-77.8,2}},    color = {0, 0, 127}));
  connect(constant2.y, idealMassFlowSource1.T) annotation (
    Line(points={{-123,-48},{-102,-48},{-102,-46},{-81.8,-46}},
                                             color = {0, 0, 127}));
  connect(constant1.y, idealMassFlowSource1.m_flow)
    annotation (Line(points={{-95,-30},{-81.8,-30}},
                                                   color={0,0,127}));
  connect(idealMassFlowSource.inlet, lumpedStorage.inlet) annotation (
    Line(points={{-68,0},{-44,0},{-44,-10},{-20,-10}},
                                        color = {168, 168, 168}));
  connect(lumpedStorage.outlet, expansionTank.inlet) annotation (
    Line(points={{-20,10},{36,10},{36,2},{88,2}},
                                       color = {168, 168, 168}));
  connect(idealMassFlowSource1.inlet, tes.inlet) annotation (Line(points={{-72,
          -48},{-70,-48},{-70,-72},{-68,-72},{-68,-74},{-26,-74},{-26,-76},{-20,
          -76},{-20,-60}}, color={168,168,168}));
  connect(tes.outlet, expansionTank1.inlet) annotation (Line(points={{-20,-40},
          {-20,-34},{50,-34},{50,-74},{88,-74},{88,-66}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, 40}, {100, -80}})));
end LumpedTESTest;
