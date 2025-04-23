within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
model CentralisedSystem_GBEBCHPTES_III
  extends CentralisedSystem_GBEBCHP_III;

  DHTF.Subsystems.HeatGeneration.TES S200 annotation (Placement(transformation(extent={{-842,-162},{-756,-76}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
    L=24.5,
    t=1.5e-3,
    pin_start(displayUnit="Pa") = 1.8e5,
    Tin_start(displayUnit="K") = 70 + 273.15,
    Tout_start(displayUnit="K") = 70 + 273.15,
    Di=51e-3,
    q_m3h_start=5,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-816,-41})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    L=21.5,
    t=t_S5,
    pin_start(displayUnit="Pa") = 2.1e5,
    Tin_start(displayUnit="K") = 80 + 273.15,
    Tout_start(displayUnit="K") = 80 + 273.15,
    Di=Di_S5,
    q_m3h_start=5,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-782,-41})));
equation
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
  connect(controlSignalBus.omegaP201, S200.pumpset)
    annotation (Line(
      points={{-339,399},{-888,399},{-888,-88.9},{-846.3,-88.9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(S200.outlet, PL_S200_rCD_hot.inlet) annotation (Line(
      points={{-781.37,-69.55},{-781.37,-59.275},{-782,-59.275},{-782,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-782,-31},{-782,-20},{-692,-20},{-692,44},{-690,44},{-690,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(S200.inlet, PL_S200_rCD_cold.outlet) annotation (Line(
      points={{-815.77,-69.55},{-815.77,-58.275},{-816,-58.275},{-816,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-816,-31},{-816,-12},{-704,-12},{-704,4.75},{-692,4.75},{-692,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));
end CentralisedSystem_GBEBCHPTES_III;
