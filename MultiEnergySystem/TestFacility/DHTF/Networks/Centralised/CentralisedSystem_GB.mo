within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
partial model CentralisedSystem_GB "System with only Gas Boiler Systemm as source of heat"
  extends DHTF.Networks.BaseClass.CentralisedNetworkBaseII(Tout_start_S9 = T_start_hot, Tin_start_S9 = T_start_cold);
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

  // System S100
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  //parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
  //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";

  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0; //0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 2*0;

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
  parameter Real q_m3h_S1 = 9;
  parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
  parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:, :] = [0, 1];
  parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  parameter Real Kv_FCV101(unit = "m3/h") = 33 "Metri Flow Coefficient";
  parameter DistrictHeatingNetwork.Types.PerUnit eta_combustion = 0.84;
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_FCV101 = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(redeclare
      model                                                                             Medium = WaterHot,L = L_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-232,-206})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(redeclare
      model                                                                              Medium = WaterHot,L = L_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-266,-206})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true) annotation (Placement(transformation(
        extent={{14,-14},{-14,14}},
        rotation=-90,
        origin={-250,-376})));
  DHTF.Subsystems.HeatGeneration.GasBoiler S100(
    redeclare model Medium = WaterHot,
    hctype=hctype,
    n=np,
    pin_start_S1=pin_start_S1,
    pout_start_S1=pout_start_S1,
    Tin_start_S1=Tin_start_S1,
    Tout_start_S1=Tout_start_S1,
    cf=cfp,
    eta_combustion=eta_combustion,
    h_FT101_GB101=h_FT101_GB101,
    h_GB101_P101=h_GB101_P101,
    L_P101_FCV101=L_P101_FCV101,
    h_P101_FCV101=h_P101_FCV101,
    q_m3h_S1=q_m3h_S1,
    Kv=Kv_FCV101,
    openingChar=openingChar_FCV101,
    Pmaxnom=147.6e3*0.92) annotation (Placement(transformation(extent={{-294,-328},{-206,-240}})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-400,-470})));
equation
  connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
    Line(points={{-266,-196},{-266,5.25},{-326.5,5.25}},       color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_rCD_cold.outlet, S100.inlet) annotation (Line(
      points={{-266,-216},{-266,-225.775},{-267.16,-225.775},{-267.16,-233.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet, S100.outlet) annotation (Line(
      points={{-232,-216},{-232,-225.775},{-231.96,-225.775},{-231.96,-233.4}},
      color={140,56,54},
      thickness=0.5));
  connect(S100.inletFuel, sourceGas.outlet) annotation (Line(
      points={{-250,-335.04},{-250,-362}},
      color={182,109,49},
      thickness=0.5));
  connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{-232,-196},{-232,45},{-235.75,45},{-235.75,44.75},{-257.5,44.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CentralisedSystem_GB;
