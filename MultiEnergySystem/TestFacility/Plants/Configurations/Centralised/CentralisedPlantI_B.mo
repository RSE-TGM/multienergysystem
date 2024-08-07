within MultiEnergySystem.TestFacility.Plants.Configurations.Centralised;
partial model CentralisedPlantI_B
  extends CentralisedPlantI_A;
  // System 400
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=80 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
  parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;

  parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

  parameter Real q_m3h_S4 = 5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/
      3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
  parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
  parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
    Tout_start=Tout_start_S4,
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=Tin_start_S4,
    etanom=0.98,
    h=1.25,
    m_flow_nom=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=160000,
    nR=5) annotation (Placement(visible=true, transformation(
        origin={-335,-365},
        extent={{-35,-35},{35,35}},
        rotation=0)));
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P401.a,
    b=DistrictHeatingNetwork.Data.PumpData.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P401.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P401.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P401.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P401.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P401.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P401.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
    use_q_m3hr=true) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-316,-235})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-316,-200})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-316,-296})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-356,-298})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-316,-172})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
        Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-314,-134})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
    "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-314,-146})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
    "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-358,-178})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
        Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-358,-166})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
      p_start=pin_start_S4) annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-359,-255})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-356,-226})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
    L=L_S4_rCD_hot,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-316,-112})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
    L=L_S4_rCD_cold,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-356,-114})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    Tin_start=Tin_start_S4,
    pin_start=pin_start_S4,
    q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-356,-80})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-316,-80})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-316,-244.6},{-316,-286}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-316,-210},{-316,-225.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-316.4,-134},{-316.4,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-316,-182},{-316,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-316.4,-146},{-316.4,-155},{-316,-155},{-316,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-356.2,-259.2},{-356.2,-267.6},{-356,-267.6},{-356,-288}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-356,-236},{-356,-243.4},{-356.2,-243.4},{-356.2,-250.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-356,-216},{-356,-178},{-355.6,-178}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-355.6,-178},{-355.6,-166}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-324.5,-337},{-324.5,-320},{-316,-320},{-316,-306}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
      points={{-316.4,-134},{-316,-134},{-316,-122}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
      points={{-355.6,-166},{-356,-166},{-356,-124}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
      points={{-356,-104},{-356,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
      points={{-316,-102},{-316,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-356,-308},{-356,-322},{-345.5,-322},{-345.5,-337}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
      points={{-356,-70},{-356,5.25},{-408.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-316,-70},{-316,45},{-338,45}},
      color={140,56,54},
      thickness=0.5));
end CentralisedPlantI_B;
