within MultiEnergySystem.DistrictHeatingNetwork.Examples.SubSystems;

model System100_Configuration5
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler gasBoiler annotation(
    Placement(visible = true, transformation(origin = {-25, -29}, extent = {{-19, -19}, {19, 19}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourceMassFlow CH4(T0 = 60 + 273.15, m_flow0 = 0.002370206, p0(displayUnit = "Pa") = 2000, use_in_m_flow = true) annotation(
    Placement(visible = true, transformation(origin = {18, -28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(T = 61 + 273.15, p0 = Pump.P101.pin_start, use_T = true, use_in_T = false) annotation(
    Placement(visible = true, transformation(origin = {-58, 4}, extent = {{-8, 8}, {8, -8}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.Pump P101(Tin_start = Pump.P101.Tin_start, Tout_start = Pump.P101.Tout_start, a = Pump.P101.a, b = Pump.P101.b, dpnom = Pump.P101.dpnom, etaelec = Pump.P101.etaelec, etamech = Pump.P101.etamech, hin_start = Pump.P101.hin_start, m_flow_nom = Pump.P101.m_flow_nom, omeganom = Pump.P101.omeganom, pin_start = Pump.P101.pin_start, pout_start = Pump.P101.pout_start, rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom) annotation(
    Placement(visible = true, transformation(origin = {1, 5}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp fuel_flow(duration = 20, height = 0.002370206*0.21, offset = 0.002370206, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {52, -16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(T0(displayUnit = "K") = Pump.P101.Tout_start, m_flow0 = 147.6e3/(20*4186), p0 = 935228928, pin_start = 935228928, use_in_m_flow = true)  annotation(
    Placement(visible = true, transformation(origin = {31, 11}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp water_flow(duration = 0, height = -147.6e3/(20*4186)*0.21, offset = 147.6e3/(20*4186), startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {58, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(gasBoiler.inletfuel, CH4.outlet) annotation(
    Line(points = {{-9.8, -29}, {8.2, -29}}, color = {136, 136, 136}));
  connect(sourceP.outlet, gasBoiler.inlet) annotation(
    Line(points = {{-50, 4}, {-32, 4}, {-32, -18}}, color = {136, 136, 136}));
  connect(gasBoiler.outlet, P101.inlet) annotation(
    Line(points = {{-17.4, -17.6}, {-17.4, 5}, {-8, 5}}, color = {136, 136, 136}));
  connect(fuel_flow.y, CH4.in_m_flow) annotation(
    Line(points = {{41, -16}, {23, -16}, {23, -22}}, color = {0, 0, 127}));
  connect(P101.outlet, sinkM.inlet) annotation(
    Line(points = {{7, 11}, {20, 11}}, color = {136, 136, 136}));
  connect(water_flow.y, sinkM.in_m_flow) annotation(
    Line(points = {{47, 30}, {24, 30}, {24, 16.5}}, color = {0, 0, 127}));
annotation(
    Documentation(info = "<html><head></head><body>The system100 in Configuration5 is composed by the GasBoiler &amp; pump P101. This test models tries to replicate the behaviour of this subsystem starting at nominal conditions, and then evaluating how the main variables of water change with some disturbances in the fuel mass flow and the water mass flow.<div><br></div><div>The study of this test is in progress, pending to validate the nominal condition parameters such as pressure and temperatures.</div></body></html>"));
end System100_Configuration5;
