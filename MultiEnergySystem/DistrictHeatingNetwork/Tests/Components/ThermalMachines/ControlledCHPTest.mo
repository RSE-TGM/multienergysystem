within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.ThermalMachines;
model ControlledCHPTest "Initial test for a single controlled CHP with ideal boundary conditions"
  extends Modelica.Icons.Example;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture "Gas fluid";
  replaceable model Water = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Water fluid";

  // Gas composition
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};
  parameter DistrictHeatingNetwork.Types.Power Pel_SP[:,:] = [0, 40e3; 1e3, 40e3; 1e3, 35e3; 1e6, 35e3];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_ref[:,:] = [0, 60+273.15; 1e3, 60+273.15; 2e3, 75+273.15; 3e6, 72+273.15];


  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledCHP CHP(
    redeclare model Medium = Water,
    h=1e-3,
    redeclare model Gas = Gas,
    Pmaxnom=147.6e3*0.8,
    Tin_start=333.15,
    pin_start=300000,
    pout_start=290000,
    tdelay=120) annotation (Placement(visible=true, transformation(
        origin={-8.88178e-16,8.88178e-16},
        extent={{-26,-26},{26,26}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SinkMassFlow sinkM(redeclare model Medium = Water, T0 = 353.15, m_flow0 = 1.2, p0 = 300000, pin_start = 300000, use_in_m_flow = false) annotation (
    Placement(transformation(origin={32,40},    extent = {{-12, 12}, {12, -12}}, rotation = -0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(redeclare model Medium = Water,
    T0=333.15,
    p0=310000,
    use_in_T0=true)                                                                                                                                    annotation (
    Placement(transformation(origin={-30,40},    extent = {{-10, 10}, {10, -10}})));
  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e6}, startValue=true)
    "Input to decide whether or nor the gas boiler is working"
    annotation (Placement(transformation(extent={{-52,-32},{-40,-20}})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={42,0})));
  Modelica.Blocks.Sources.TimeTable GB101_PelSP(table=Pel_SP) annotation (Placement(transformation(extent={{-52,-6},{-40,6}})));
  Modelica.Blocks.Sources.TimeTable incold_T(table=Tin_ref)      annotation (
    Placement(transformation(origin={7.9997,12.6667},
                                                extent={{-59.9996,1.33333},{-47.9996,13.3333}})));
equation
  connect(sourceP.outlet, CHP.inlet) annotation (Line(points={{-20,40},{-7.8,40},{-7.8,20.8}}, color={140,56,54}));
  connect(sinkM.inlet, CHP.outlet) annotation (Line(points={{20,40},{7.8,40},{7.8,20.8}}, color={140,56,54}));
  connect(GB101_Status.y, CHP.heat_on) annotation (Line(points={{-39.4,-26},{-32,-26},{-32,-13},{-18.2,-13}}, color={255,0,255}));
  connect(sourceGas.outlet, CHP.inletfuel) annotation (Line(
      points={{32,7.77156e-16},{25.1,7.77156e-16},{25.1,0},{18.2,0}},
      color={182,109,49},
      thickness=0.5));
  connect(GB101_PelSP.y, CHP.Pel_ref) annotation (Line(points={{-39.4,0},{-18.2,0}}, color={0,0,127}));
  connect(incold_T.y, sourceP.in_T0) annotation (Line(points={{-39.3999,20},{-26,20},{-26,31.6}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=3000,
      Interval=0.5,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info = "<html><head></head><body>Test model for the component:

<a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.GasBoiler\">GasBoiler</a>.<div><br></div><div>The test includes changes in:</div><div><ul><li>fuel flow mass flow rate&nbsp;</li><li>water flow mass flow rate</li><li>water inlet temperature</li></ul></div><div><div><br></div></div></body></html>"));
end ControlledCHPTest;
