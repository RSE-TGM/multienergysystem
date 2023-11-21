within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBPumpingSystem
  extends GasBoilerPumpingSystem(
    FV933_theta(height=0, offset=0),
    FCVC02_theta(
      height=-1,
      duration=50,
      startTime=700),
    FCVC01_theta(
      height=1,
      duration=50,
      startTime=600),
    omega_P901(height=2*3.141592654*5));

  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 17 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 16 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

  parameter Types.MassFlowRate m_flow_S4 = 1.2;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    Tout_start=288.15,
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=288.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=170000,
    pout_start=160000,
    nR=0)              annotation (Placement(visible=true, transformation(
        origin={-246,-258},
        extent={{-44,-44},{44,44}},
        rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    Tin_start(displayUnit="K") = Pump.P401.Tin_start,
    Tout_start(displayUnit="K") = Pump.P401.Tout_start,
    a=Pump.P401.a,
    b=Pump.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=Pump.P401.dpnom,
    etaelec=Pump.P401.etaelec,
    etamech=Pump.P401.etamech,
    etanom=Pump.P401.etanom,
    hin_start=Pump.P401.hin_start,
    m_flow_nom=Pump.P401.m_flow_nom,
    omeganom=Pump.P401.omeganom,
    pin_start(displayUnit="Pa") = Pump.P401.pin_start,
    pout_start(displayUnit="Pa") = Pump.P401.pout_start,
    qnom_inm3h=Pump.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P401.rhonom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-228,-159})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV401(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-122})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-198})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-264,-200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-86})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-222,-44})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-222,-56})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-266,-58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-266,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-267,-169})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-264,-140})));
  Modelica.Blocks.Sources.Ramp FCV101_theta_1(
    height=0,
    duration=1500,
    offset=1,
    startTime=3000)
    annotation (Placement(transformation(extent={{-186,-132},{-206,-112}})));
  Modelica.Blocks.Sources.Ramp omega_P401(
    offset=2*3.141592654*50,
    height=-2*3.141592654*10*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-186,-174},{-207,-154}})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-228,-168.6},{-228,-188}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-228,-132},{-228,-149.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-224.4,-44},{-224.4,-56}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-228,-96},{-228,-112}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-224.4,-56},{-224.4,-65},{-228,-65},{-228,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-264.2,-173.2},{-264.2,-181.6},{-264,-181.6},{-264,-190}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-264,-150},{-264,-157.4},{-264.2,-157.4},{-264.2,-164.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-264,-130},{-264,-58},{-263.6,-58}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-263.6,-58},{-263.6,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta_1.y, FCV401.opening)
    annotation (Line(points={{-207,-122},{-220,-122}}, color={0,0,127}));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-264,-210},{-264,-231.6},{-263.6,-231.6}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-228.4,-231.6},{-228.4,-230},{-228,-230},{-228,-208}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-224.4,-44},{-224,-44},{-224,20},{-240,20}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
      points={{-263.6,-46},{-264,-46},{-264,-19.75},{-310.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P401.y,P401. in_omega) annotation (Line(points={{-208.05,-164},{
          -215.025,-164},{-215.025,-163.8},{-222,-163.8}}, color={0,0,127}));
  annotation (experiment(StopTime=800, __Dymola_Algorithm="Dassl"));
end GBEBPumpingSystem;
