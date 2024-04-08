within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model StratifiedWaterTankSystem
  extends WaterTankSystem(
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H=4),
    redeclare DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H=4),
    Tin_start_S2 = 60 + 273.15,
    Tout_start_S2 = 60 + 273.15,
    P201(pout_start=3e5),
    source(
      use_in_T0=true,
      T0=288.15,
           R=1e-3),
    sink(T0=333.15, G=1e-8),
    ramp(height=-1.5*m_flow_S2, startTime=2e4),
    FCV201theta= [0, 1; 100, 1; 105, 1; 200, 1]);

//  parameter Real Tin[:,:] = [0, 15+273.15; 1e3, 15+273.15; 1e3, 60 + 273.15; 1e5, 60 + 273.15; 1e5, 30 + 273.15; 3e5, 30+273.15];
  parameter Real Tin[:,:] = [0, 40+273.15; 1e3, 40 + 273.15; 1e5, 40 + 273.15];

  Modelica.Blocks.Sources.TimeTable T_in(table=Tin)
    annotation (Placement(transformation(extent={{-140,180},{-120,200}})));
  Sources.SourcePressure sourcePressure
    annotation (Placement(transformation(extent={{30,152},{50,172}})));
equation
  connect(T_in.y, source.in_T0) annotation (Line(points={{-119,190},{-104,190},{
          -104,174.4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=50000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end StratifiedWaterTankSystem;
