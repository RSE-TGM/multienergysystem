within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;
model BoilerTestBase
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    Boiler(trise=60)
    annotation (Placement(transformation(extent={{-22,-24},{24,22}})));
  Sources.SinkMassFlow                                          sinkM(
    T0=80 + 273.15,
    m_flow0=1.2,
    p0=300000,
    pin_start=300000,
    use_in_m_flow=true)                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin={-84,-8},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Sources.SourcePressure                                          sourceP(
    use_in_T0=true,
    T0=333.15,
    p0=310000)                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-74,-30},   extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(
    duration=100,
    height=35,
    offset=25 + 273.15,
    startTime=200)                                                                                      annotation (
    Placement(visible = true, transformation(origin={-126,-78},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(
    duration=100,
    height=0.25*0,
    offset=1.8,
    startTime=1800)                                                                                  annotation (
    Placement(visible = true, transformation(origin={-106,12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin_up(
    duration=100*0,
    height=10,
    offset=0,
    startTime=1000)                                                                             annotation (
    Placement(visible = true, transformation(origin={-126,-18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin={-94,-48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(m_flow.y,sinkM. in_m_flow) annotation (
    Line(points={{-95,12},{-78,12},{-78,-3}},        color = {0, 0, 127}));
  connect(Tin_up.y,add. u1) annotation (
    Line(points={{-115,-18},{-113,-18},{-113,-42},{-106,-42}},  color = {0, 0, 127}));
  connect(Tin.y,add. u2) annotation (
    Line(points={{-115,-78},{-113,-78},{-113,-54},{-106,-54}},      color = {0, 0, 127}));
  connect(add.y,sourceP. in_T0)
    annotation (Line(points={{-83,-48},{-70,-48},{-70,-38.4}},
                                                             color={0,0,127}));
  connect(sourceP.outlet, Boiler.inlet) annotation (Line(
      points={{-64,-30},{-26,-30},{-26,-10.2},{-12.8,-10.2}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkM.inlet, Boiler.outlet) annotation (Line(
      points={{-74,-8},{-56,-8},{-56,-6},{-36,-6},{-36,8.2},{-12.8,8.2}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end BoilerTestBase;
