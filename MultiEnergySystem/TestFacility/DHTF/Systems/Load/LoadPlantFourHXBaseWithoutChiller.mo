within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
partial model LoadPlantFourHXBaseWithoutChiller
  extends LoadPlantFourHXBase;
  DistrictHeatingNetwork.Sources.SinkPressure VER901(
    redeclare model Medium = MediumCold,
    use_in_T0=false,
    p0=210000,
    T0(displayUnit="K") = 15 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={277,-123})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
    redeclare model Medium = MediumCold,
    pin_start=100000,
    p0=100000,
    T0(displayUnit="K") = 30 + 273.15,
    m_flow0=3) annotation (Placement(transformation(extent={{268,-202},{288,-182}})));
equation
  connect(VER901.inlet, suddenAreaChange.inlet) annotation (Line(
      points={{277,-133},{277,-152},{246,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkMassFlow.inlet, suddenAreaChange1.outlet) annotation (Line(
      points={{268,-192},{244,-192}},
      color={140,56,54},
      thickness=0.5));
end LoadPlantFourHXBaseWithoutChiller;
