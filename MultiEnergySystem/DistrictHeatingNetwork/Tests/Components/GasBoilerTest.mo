within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components;
model GasBoilerTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.GasBoiler gasBoiler(Tin_start = 60 + 273.15, pin_start = 300000, pout_start = 289999.9999999999) annotation (
    Placement(visible = true, transformation(origin = {-8.88178e-16, 8.88178e-16}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Sources.SourceMassFlow CH4(T0 = 60 + 273.15, m_flow0 = 0.002370206, p0(displayUnit = "Pa") = 2000, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {-20, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0 = 80 + 273.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = true) annotation (
    Placement(visible = true, transformation(origin = {-48, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(
    use_in_T0=true,
    T0=333.15,
    p0=310000)                                                                                          annotation (
    Placement(visible = true, transformation(origin = {-48, -12}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp fuel_flow(duration = 20,
    height=0.002370206*0.05*0,                                                    offset = 0.002370206,
    startTime=50)                                                                                                       annotation (
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp Tin(duration = 20,
    height=0,                                                  offset = 60 + 273.15, startTime = 40) annotation (
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp m_flow(
    duration=0,
    height=-0.5,                                                    offset = 2,
    startTime=100)                                                                              annotation (
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(CH4.outlet, gasBoiler.inletfuel) annotation (
    Line(points={{-10,50},{0,50},{0,20.8}},      color = {136, 136, 136}));
  connect(sinkM.inlet, gasBoiler.outlet) annotation (
    Line(points={{-38,10},{-26,10},{-26,10.4},{-15.6,10.4}},
                                          color = {136, 136, 136}));
  connect(sourceP.outlet, gasBoiler.inlet) annotation (
    Line(points={{-38,-12},{-15.6,-12},{-15.6,-9.88}},  color = {136, 136, 136}));
  connect(fuel_flow.y, CH4.in_m_flow) annotation (
    Line(points={{-39,70},{-26,70},{-26,55}},        color = {0, 0, 127}));
  connect(m_flow.y, sinkM.in_m_flow) annotation (
    Line(points={{-59,30},{-42,30},{-42,15}},        color = {0, 0, 127}));
  connect(Tin.y, sourceP.in_T0) annotation (Line(points={{-59,-30},{-44,-30},{
          -44,-20.4}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=4000,
      Interval=0.8,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end GasBoilerTest;
