within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedOneGenGB
  extends DistrictHeatingNetwork.Icons.Water.HeatGeneration;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  //Constants
  constant Real pi = Modelica.Constants.pi;

  //General parameters of pipesù
  parameter Integer n = 3 "Number of volumes in each pipe";

  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_total = 2.5;

  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "friction factor for pipes";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";

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
  parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2;

  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0;
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



  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
    redeclare model Medium = WaterHot,
    L=L_S1_rCD_hot,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-158,74})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
    redeclare model Medium = WaterHot,
    L=L_S1_rCD_cold,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-192,74})));
  Subsystems.HeatGeneration.GasBoiler      S100(
    redeclare model Medium = WaterHot,
    hctype=hctype,
    n=n,
    pin_start_S1=pin_start_S1,
    pout_start_S1=pout_start_S1,
    Tin_start_S1=Tin_start_S1,
    Tout_start_S1=Tout_start_S1,
    cf=cf,
    eta_combustion=eta_combustion,
    h_TT101_FT101=h_TT101_FT101,
    h_FT101_GB101=h_FT101_GB101,
    h_GB101_P101=h_GB101_P101,
    L_P101_FCV101=L_P101_FCV101,
    h_P101_FCV101=h_P101_FCV101,
    q_m3h_S1=q_m3h_S1,
    Kv=Kv_FCV101,
    openingChar=openingChar_FCV101,
    Pmaxnom=147.6e3*0.92) annotation (Placement(transformation(extent={{-220,-48},{-132,40}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-310,-22},{-270,18}}),
                                                                                                                         iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet senthot annotation (Placement(transformation(extent={{26,272},{46,292}}), iconTransformation(extent={{90,-70},{110,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet returncold annotation (Placement(transformation(extent={{-26,272},{-6,292}}), iconTransformation(extent={{90,50},{110,70}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas(nXi=S100.fuel.nXi) annotation (Placement(transformation(extent={{-10,-292},{10,-272}}), iconTransformation(extent={{-10,-110},{10,-90}})));
equation
  connect(PL_S100_rCD_cold.outlet,S100. inlet) annotation (Line(
      points={{-192,64},{-192,54.225},{-193.16,54.225},{-193.16,46.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet,S100. outlet) annotation (Line(
      points={{-158,64},{-158,54.225},{-157.96,54.225},{-157.96,46.6}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.statusGB101, S100.status) annotation (Line(
      points={{-290,-2},{-274,-2},{-274,-4},{-224.4,-4},{-224.4,0.4}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutGB101, S100.Toutset) annotation (Line(
      points={{-290,-2},{-258,-2},{-258,9.2},{-224.4,9.2}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.thetaFCV101, S100.theta) annotation (Line(
      points={{-290,-2},{-280,-2},{-280,16},{-224.4,16},{-224.4,18}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaP101, S100.omega) annotation (Line(
      points={{-290,-2},{-288,-2},{-288,26.8},{-224.4,26.8}},
      color={255,204,51},
      thickness=0.5));
  connect(PL_S100_rCD_cold.inlet, returncold) annotation (Line(
      points={{-192,84},{-190,84},{-190,246},{-16,246},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.outlet, senthot) annotation (Line(
      points={{-158,84},{-158,238},{36,238},{36,282}},
      color={140,56,54},
      thickness=0.5));
  connect(inletGas, S100.inletFuel) annotation (Line(
      points={{0,-282},{-2,-282},{-2,-280},{-176,-280},{-176,-55.04}},
      color={182,109,49},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-300,-300},{300,300}})), Icon(coordinateSystem(grid={1,1})));
end CentralizedOneGenGB;
