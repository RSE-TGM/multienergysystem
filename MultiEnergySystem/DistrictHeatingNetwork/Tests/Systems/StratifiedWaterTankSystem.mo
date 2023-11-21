within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model StratifiedWaterTankSystem
  extends WaterTankSystem(
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H=4,
                 n=4),
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H=4,
                 n=4),
    Tin_start_S2 = 60 + 273.15,
    Tout_start_S2 = 60 + 273.15,
    theta = 0,
    P201(pout_start=3e5),
    source(
      use_in_T0=true,
      T0=288.15,
           R=1e-3),
    sink(T0=333.15));
  Modelica.Blocks.Sources.Ramp T_in(
    height=45,
    duration=0,
    offset=15 + 273.15,
    startTime=1500)
    annotation (Placement(transformation(extent={{-112,150},{-92,170}})));
equation
  connect(T_in.y, source.in_T0) annotation (Line(points={{-91,160},{-56,160},{
          -56,148.4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end StratifiedWaterTankSystem;
