within MultiEnergySystem.TestFacility.Plants.Configurations.Centralised;
partial model CentralisedPlantI_A
   extends Plants.Configurations.BaseClass.CentralPlantBase;
  // System S100

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1=1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1=1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1=30 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1=30 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length L_S1=10;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL1=0.4;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL2=0.8;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL3=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S1_PL4=0.7;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=3.5;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=3.5;
  parameter DistrictHeatingNetwork.Types.Length Di_S1=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1=1.5e-3;

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1=m_flow_total;
  parameter Real q_m3h_S1 = 9;

  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];

  parameter Real FCV101theta[:,:] = [0, 1];
  parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P101(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start,

    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start,

    a=DistrictHeatingNetwork.Data.PumpData.P101.a,
    b=DistrictHeatingNetwork.Data.PumpData.P101.b,
    m_flow_start=m_flow_total,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P101.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P101.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P101.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P101.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P101.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P101.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start,

    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start,

    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom,

    headnom=DistrictHeatingNetwork.Data.PumpData.P101.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P101.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P101.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h,
    use_q_m3hr=true) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-230,-239})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,

    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-230,-204})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(
    L=L_S1_PL3,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-230,-294})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(
    L=L_S1_PL2,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-266,-296})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(
    L=L_S1_PL3,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-230,-170})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Tout_start=Tout_start_S1,
    HH=55.5e6) annotation (Placement(visible=true, transformation(
        origin={-247,-365},
        extent={{-35,-35},{35,35}},
        rotation=0)));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(T_start=
        Tout_start_S1, p_start=pout_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-228,-136})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102
    "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-228,-148})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101
    "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-268,-194})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(T_start=
        Tin_start_S1, p_start=pin_start_S1)
    "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-268,-158})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=Tin_start_S1,
      p_start=pin_start_S1) annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-269,-259})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(
    L=L_S1_PL1,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-266,-224})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
    L=L_S1_rCD_hot,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-230,-104})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
    L=L_S1_rCD_cold,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-266,-104})));
equation
  connect(P101.inlet,PL3_S101. outlet) annotation (Line(
      points={{-230,-248.6},{-230,-284}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,P101. outlet) annotation (Line(
      points={{-230,-214},{-230,-229.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT102.inlet,PT102. inlet) annotation (Line(
      points={{-230.4,-136},{-230.4,-148}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S101.inlet,FCV101. outlet) annotation (Line(
      points={{-230,-180},{-230,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet,PL4_S101. outlet) annotation (Line(
      points={{-230.4,-148},{-230.4,-157},{-230,-157},{-230,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet,PL2_S101. inlet) annotation (Line(
      points={{-266.2,-263.2},{-266.2,-265.6},{-266,-265.6},{-266,-286}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.outlet,FT101. inlet) annotation (Line(
      points={{-266,-234},{-266,-241.4},{-266.2,-241.4},{-266.2,-254.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S101.inlet,PT101. inlet) annotation (Line(
      points={{-266,-214},{-266,-194},{-265.6,-194}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet,TT101. inlet) annotation (Line(
      points={{-265.6,-194},{-265.6,-158}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet,TT102. inlet) annotation (Line(
      points={{-230,-114},{-230,-136},{-230.4,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(TT101.inlet,PL_S100_rCD_cold. outlet) annotation (Line(
      points={{-265.6,-158},{-265.6,-153},{-266,-153},{-266,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
      Line(
      points={{-266,-94},{-266,5.25},{-326.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S101.outlet,GB101. inlet) annotation (Line(
      points={{-266,-306},{-266,-318},{-257.5,-318},{-257.5,-337}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S101.inlet,GB101. outlet) annotation (Line(
      points={{-230,-304},{-230,-318},{-236.5,-318},{-236.5,-337}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{-230,-94},{-232,-94},{-232,44.75},{-257.5,44.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedPlantI_A;
