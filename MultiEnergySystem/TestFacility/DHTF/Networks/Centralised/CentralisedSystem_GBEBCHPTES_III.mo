within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
model CentralisedSystem_GBEBCHPTES_III
  extends CentralisedSystem_GBEBCHP_III;

  DHTF.Subsystems.HeatGeneration.TES S200 annotation (Placement(transformation(extent={{-842,-162},{-756,-76}})));
equation
  connect(S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-781.37,-69.55},{-781.37,-20},{-692,-20},{-692,44},{-690,44},{-690,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S200.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-815.77,-69.55},{-815.77,-12},{-704,-12},{-704,4.75},{-692,4.75},{-692,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.thetaFCV201, S200.theta)
    annotation (Line(
      points={{-339,399},{-892,399},{-892,-97.5},{-846.3,-97.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.statusS200, S200.status)
    annotation (Line(
      points={{-339,399},{-898,399},{-898,-114.7},{-846.3,-114.7}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.omegaP201, S200.omega)
    annotation (Line(
      points={{-339,399},{-888,399},{-888,-88.9},{-846.3,-88.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end CentralisedSystem_GBEBCHPTES_III;
