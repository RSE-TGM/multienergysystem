within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedOneGenGB
  extends DistrictHeatingNetwork.Icons.Water.HeatGeneration;
  extends Systems.HeatGeneration.BaseHeatGeneration(inletGas(nXi=nXi), final nXi = S100.fuel.nXi);

  // System S100

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S100 = 1.695e5 annotation (
    Dialog(group = "S100"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S100 = 1.6e5 annotation (
    Dialog(group = "S100"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S100 = 70 + 273.15 annotation (
    Dialog(group = "S100"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S100 = 80 + 273.15 annotation (
    Dialog(group = "S100"));
  parameter Real q_m3h_start_S100(unit = "m3/h") = 9 annotation (
    Dialog(group = "S100"));


  //-------------------------------
  // Final parameters
  //-------------------------------
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start_S100 = q_m3h_start_S100*975/3600;
  final parameter DistrictHeatingNetwork.Types.Length Di_S100 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S100 = 1.5e-3;
  final parameter DistrictHeatingNetwork.Types.PerUnit eta_combustion = 0.92 "Combustion efficiency";
  final parameter Modelica.Units.SI.Time tdelay = 0 "Rising time of heater from 0 to full power";


  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_start_S100,
    redeclare model Medium = WaterHot,
    L=L_S1_rCD_hot,
    t=t_S100,
    pin_start=pout_start_S100,
    Tin_start=Tout_start_S100,
    Tout_start=Tout_start_S100,
    Di=Di_S100,
    q_m3h_start=q_m3h_start_S100,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-158,74})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_start_S100,
    redeclare model Medium = WaterHot,
    L=L_S1_rCD_cold,
    t=t_S100,
    pin_start=pin_start_S100,
    Tin_start=Tin_start_S100,
    Tout_start=Tin_start_S100,
    Di=Di_S100,
    q_m3h_start=q_m3h_start_S100,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-192,74})));
  Subsystems.HeatGeneration.GasBoiler S100(
    redeclare model Medium = WaterHot,
    redeclare model Gas = Gas,
    hctype=hctype,
    n=n,
    pin_start=pin_start_S100,
    pout_start=pout_start_S100,
    Tin_start=Tin_start_S100,
    Tout_start=Tout_start_S100,
    eta_combustion=eta_combustion,
    tdelay=tdelay,
    q_m3h_S1=q_m3h_start_S100,
    Pmaxnom=147.6e3*0.92) annotation (Placement(transformation(extent={{-220,-48},{-132,40}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-310,-22},{-270,18}}),
                                                                                                                         iconTransformation(extent={{-20,80},{20,120}})));
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
  connect(inletGas, S100.inletFuel) annotation (Line(
      points={{0,-282},{-176,-282},{-176,-55.04}},
      color={182,109,49},
      thickness=0.5));
  connect(PL_S100_rCD_cold.inlet, returncold) annotation (Line(
      points={{-192,84},{-194,84},{-194,248},{-18,248},{-18,282},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.outlet, senthot) annotation (Line(
      points={{-158,84},{-158,238},{36,238},{36,282}},
      color={140,56,54},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-300,-300},{300,300}})), Icon(coordinateSystem(grid={1,1})));
end CentralizedOneGenGB;
