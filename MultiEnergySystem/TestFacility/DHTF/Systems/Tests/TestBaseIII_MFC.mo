within MultiEnergySystem.TestFacility.DHTF.Systems.Tests;
model TestBaseIII_MFC
  extends TestBaseI(
  redeclare HeatGeneration.CentralizedThreeGenGBEBCHPTES heatGen(
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC S100,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.ElectricBoilerFC S400,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.CHPFC S500,
    redeclare TestFacility.DHTF.Subsystems.HeatGeneration.TESFC S200(
        Tin_start=65 + 273.15,
        Tout_start=65 + 273.15,
        FCV201(dp_nom=0.5e5)),
      pout_start_S100=220000,
      pout_start_S400=220000,
      PL_S200_rCD_cold(set_m_flow_start=true, m_flow_start=2,
        pin_start=2e5,
        q_m3h_start=7),
      PL_S200_rCD_hot(set_m_flow_start=true, m_flow_start=2,
        pin_start=2.1e5,
        q_m3h_start=7)),
    ramp(height=0, offset=2.2e5),
    redeclare Control.OpenLoopActuators.OLA_ThreeGen_GBEBCHPTES actuator(
      domegaP201_var(y=2),
      dthetaFCV201_var(y=1),
      omegaP101(table=[0,1.4; 1e3,1.4]),
      domegaP401(table=[0,1; 1e3,1]),
      domegaP501_var(y=1.0),
      S200status(y=if time < 1e3 then 2 else 1)),
    sinkPressure(R=1e-4));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(
    Kv=33,
    dp_nom=50000,
    Tin_start=338.15,
    pin_start=200000)                                                                                                                                                                                annotation (
    Placement(visible = true, transformation(origin={0.5,0},      extent={{-4,3.5},{4,-3.5}},  rotation=90)));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false)         annotation (
    Placement(transformation(extent={{48,-4},{39,5}})));
equation
  connect(FV933.inlet, heatGen.senthot) annotation (Line(
      points={{0.5,-4},{0,-4},{0,-17.6},{-8,-17.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933.outlet, heatGen.returncold) annotation (Line(
      points={{0.5,4},{0,4},{0,13.6},{-8,13.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{38.55,0.5},{20.085,0.5},{20.085,-5.55112e-17},{1.62,-5.55112e-17}}, color={255,0,255}));
annotation(
    experiment(StartTime = 0, StopTime = 8000, Tolerance = 1e-06, Interval = 16));
end TestBaseIII_MFC;
