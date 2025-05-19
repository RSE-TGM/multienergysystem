within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
partial model LoadPlantFourHXBaseWithChiller
  extends LoadPlantFourHXBase;
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVR01(
    redeclare model Medium = MediumCold,
    Kv=Kvalve,
    openingChar=TestFacility.Data.ValveData.FCVR01.openingChar,
    dp_nom(displayUnit="Pa") = 1.09928e5,
    rho_nom(displayUnit="kg/m3") = 1000,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    pin_start(displayUnit="Pa") = TestFacility.Data.ValveData.FCVR01.pin_start,
    N=10)                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={344,-154})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_VER901_FCVR01(
    redeclare model Medium = MediumCold,
    L=L_VER901_FCVR01,
    h=h_VER901_FCVR01,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={314,-154})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FCVR01_FTR03(
    redeclare model Medium = MediumCold,
    L=L_FCVR01_FTR03,
    h=h_FCVR01_FTR03,
    t=t_RR,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool - q_Users_total,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={374,-154})));
  DistrictHeatingNetwork.Sources.SinkPressure VER901(
    redeclare model Medium = MediumCold,
    p0=210000,
    T0(displayUnit="K") = 15 + 273.15,
    R=1e-3)
         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={261,-119})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR03(T_start=Tout_start_Cool, p_start=pin_start_Cool)
    "Flow Sensor at the outlet of valve FCVR01" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={390,-152})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PTR01_FTR01(
    redeclare model Medium = MediumCold,
    L=L_PTR01_FTR01,
    h=h_PTR01_FTR01,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,-48})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR01(
    redeclare model Medium = MediumCold,
    T_start=Tin_start_Cool,
    p_start=pin_start_Cool)
    "Temperature sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={406,-93})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR01
    "Pressure sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={406,-83})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTR01(
    redeclare model Medium = MediumCold,
    T_start=Tin_start_Cool,
    p_start=pin_start_Cool)
    "Flow Sensor at the inlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={406,-23})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR01_RR01(
    redeclare model Medium = MediumCold,
    L=L_FTR01_RR01,
    h=h_FTR01_RR01,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of the flow sensor and the inlet of the chiller"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,2})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_FTR03_PTR01(
    redeclare model Medium = MediumCold,
    L=L_FTR03_PTR01,
    h=h_FTR03_PTR01,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tin_start_Cool,
    Tout_start=Tin_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={404,-128})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TTR02(
    redeclare model Medium = MediumCold,
    T_start=Tout_start_Cool,
    p_start=pin_start_Users)
    "Temperature sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={279,-80})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTR02
    "Pressure sensor at the outlet of chiller RR01" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={279,-70})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_PR01_PTR02(
    L=L_PR01_PTR02,
    h=h_PR01_PTR02,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n)
    "Pipeline connecting the outlet of pump PR01 and sensors PTR02 & TTR02"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,-50})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV
       RR00_PL_TTR02_VER901(
    L=L_TTR02_VER901,
    h=h_TTR02_VER901,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,-100})));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump PR01(
    redeclare model Medium = MediumCold,
    Tin_start(displayUnit="K") = Tout_start_Cool,
    Tout_start(displayUnit="K") = Tout_start_Cool,
    a=TestFacility.Data.PumpData.PR01.a,
    b=TestFacility.Data.PumpData.PR01.b,
    m_flow_start=m_flow_Cool_total,
    dpnom=TestFacility.Data.PumpData.PR01.dpnom,
    etaelec=TestFacility.Data.PumpData.PR01.etaelec,
    etamech=TestFacility.Data.PumpData.PR01.etamech,
    etanom=TestFacility.Data.PumpData.PR01.etanom,
    m_flow_nom=TestFacility.Data.PumpData.PR01.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.PR01.omeganom,
    pin_start(displayUnit="Pa") = 2e5,
    pout_start(displayUnit="Pa") = 2.6e5,
    qnom_inm3h=TestFacility.Data.PumpData.PR01.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.PR01.rhonom,
    headnom=TestFacility.Data.PumpData.PR01.headnom,
    headmax=TestFacility.Data.PumpData.PR01.headnommax,
    headmin=TestFacility.Data.PumpData.PR01.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.PR01.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.PR01.qnommax_inm3h,
    use_in_omega=true)                                                      annotation (Placement(transformation(
        extent={{-13,-13},{13,13}},
        rotation=-90,
        origin={282,-7})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV RR00_PL_RR01_PR01(
    redeclare model Medium = MediumCold,
    L=L_RR01_PR01,
    h=h_RR01_PR01,
    t=t_RR,
    set_m_flow_start=true,
    m_flow_start=m_flow_Cool_total,
    pin_start=pin_start_Users,
    Tin_start=Tout_start_Cool,
    Tout_start=Tout_start_Cool,
    Di=Di_RR,
    q_m3h_start=q_Cool,
    hctype=hctype,
    n=n) "Pipeline connecting the outlet of Chiller and the inlet of pump PR01"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={282,28})));
    DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamics
    RR01(
    redeclare model Medium = MediumCold,
    use_in_Tout_cold_set=true,
    Tin_cold_start=Tin_start_Cool,
    Tout_cold_nom(displayUnit="K") = Tout_start_Cool,
    dp_cold_start=dp_RR01,
    m_flow_cold_start=m_flow_Cool_total,
    V=0.001) "Chiller"
    annotation (Placement(transformation(extent={{310,52},{381,123}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junction3
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={282,-154})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction4
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={404,-154})));
equation
  connect(RR00_PL_VER901_FCVR01.outlet,FCVR01. inlet) annotation (Line(
      points={{324,-154},{334,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(FCVR01.outlet,RR00_PL_FCVR01_FTR03. inlet) annotation (Line(
      points={{354,-154},{364,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.inlet,RR00_PL_FCVR01_FTR03. outlet) annotation (Line(
      points={{387,-154},{384,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,PTR01. inlet) annotation (Line(
      points={{403.6,-93},{403.6,-83}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR01.inlet,RR00_PL_PTR01_FTR01. inlet) annotation (Line(
      points={{403.6,-83},{403.6,-65.5},{404,-65.5},{404,-58}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PTR01_FTR01.outlet,FTR01. inlet) annotation (Line(
      points={{404,-38},{404,-26}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR01.outlet,RR00_PL_FTR01_RR01. inlet) annotation (Line(
      points={{404,-20},{404,-8}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR01.inlet,RR00_PL_FTR03_PTR01. outlet) annotation (Line(
      points={{403.6,-93},{404,-93},{404,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_PR01_PTR02.outlet,PTR02. inlet) annotation (Line(
      points={{282,-60},{282,-65},{281.4,-65},{281.4,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(PTR02.inlet,TTR02. inlet) annotation (Line(
      points={{281.4,-70},{282,-70},{282,-80},{281.4,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(TTR02.inlet,RR00_PL_TTR02_VER901. inlet) annotation (Line(
      points={{281.4,-80},{282,-80},{282,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.outlet,PR01. inlet) annotation (Line(
      points={{282,18},{282,3.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PR01.outlet,RR00_PL_PR01_PTR02. inlet) annotation (Line(
      points={{282,-17.4},{282,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_FTR01_RR01.outlet,RR01. incold) annotation (Line(
      points={{404,12},{404,44},{368,44},{368,66.2},{366.8,66.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_RR01_PR01.inlet,RR01. outcold) annotation (Line(
      points={{282,38},{284,38},{284,48},{326,48},{326,66.2},{324.2,66.2}},
      color={140,56,54},
      thickness=0.5));
  connect(RR00_PL_TTR02_VER901.outlet,junction3. inlet) annotation (Line(
      points={{282,-110},{282,-148}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.outlet, suddenAreaChange.inlet) annotation (Line(
      points={{282,-160},{282,-164},{274,-164},{274,-152},{246,-152}},
      color={140,56,54},
      thickness=0.5));
  connect(junction3.inoutlet,RR00_PL_VER901_FCVR01. inlet) annotation (Line(
      points={{288,-154},{304,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(FTR03.outlet,junction4. inoutlet) annotation (Line(
      points={{393,-154},{398,-154}},
      color={140,56,54},
      thickness=0.5));
  connect(junction4.outlet,RR00_PL_FTR03_PTR01. inlet) annotation (Line(
      points={{404,-148},{404,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.outlet,junction4. inlet) annotation (Line(
      points={{244,-192},{404,-192},{404,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.thetaFCVR01,FCVR01. opening) annotation (Line(
      points={{0,300},{0,300},{0,284},{236,284},{236,-138},{344,-138},{344,-146}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaPR01,PR01. in_omega) annotation (Line(
      points={{0,300},{122,300},{122,286},{242,286},{242,8},{288.5,8},{288.5,-1.8}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.statusRR01,RR01. cold_on) annotation (Line(
      points={{0,300},{0,300},{0,288},{290,288},{290,87.5},{306.45,87.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutRR01,RR01. in_Tout_cold_set) annotation (Line(
      points={{0,300},{10,300},{10,292},{345.5,292},{345.5,112.35}},
      color={255,204,51},
      thickness=0.5));
  connect(VER901.inlet, suddenAreaChange.inlet) annotation (Line(
      points={{261,-129},{261,-152},{246,-152}},
      color={140,56,54},
      thickness=0.5));
  annotation (Diagram(graphics={
        Line(
          points={{0,-14},{0,14}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1,
          origin={346,-168},
          rotation=-90)}));
end LoadPlantFourHXBaseWithChiller;
