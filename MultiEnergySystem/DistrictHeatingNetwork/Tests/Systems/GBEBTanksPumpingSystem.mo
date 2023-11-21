within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBTanksPumpingSystem
  extends GBEBPumpingSystem;

  // System S200
  parameter Types.Pressure pin_start_S2 = 1.79e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_S2 = 4.5;

  parameter Real theta(max = 1, min = 0) = 0;
  parameter Real thetavar(max = 1) = 0.1;
  // Pipe length
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;

  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D201(
    H=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-678,-286},{-726,-210}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P201(
    pout_start(displayUnit="Pa") = 3e5,
    Tin_start(displayUnit="K") = Pump.P201.Tin_start,
    Tout_start=Pump.P201.Tout_start,
    a=Pump.P201.a,
    b=Pump.P201.b,
    m_flow_start=m_flow_S2,
    dpnom=Pump.P201.dpnom,
    etaelec=Pump.P201.etaelec,
    etamech=Pump.P201.etamech,
    etanom=Pump.P201.etanom,
    hin_start=Pump.P201.hin_start,
    m_flow_nom=Pump.P201.m_flow_nom,
    omeganom=Pump.P201.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    qnom_inm3h=Pump.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h,
    use_in_omega=true) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-692,-115})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage             D202(
    H=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-603,-286},{-651,-210}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-693.75,-36.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-694,-46.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S201(
    L=L_S2_PL1,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-692,-72})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-726,-114})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S201(
    L=L_S2_PL3,
    t=L_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-708,-92})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S201(
    L=L_S2_PL2,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-692,-142})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S201(
    L=L_S2_PL4,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-726,-142})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL5_S201(
    L=L_S2_PL5,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-744,-164})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL6_S201(
    L=L_S2_PL6,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_tank,
    pout_start=pout_start_S2_tank - 0.01e5,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-592,-82})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2_tank)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-590,-34})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-590,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-589,-59})));
  Modelica.Blocks.Sources.Ramp FCV201_theta_(
    height=thetavar,
    duration=1500,
    offset=theta,
    startTime=3000)
    annotation (Placement(transformation(extent={{-778,-124},{-758,-104}})));
  Modelica.Blocks.Sources.Ramp omega_P201(
    offset=2*3.141592654*35,
    height=-2*3.141592654*0,
    duration=100,
    startTime=200)
    annotation (Placement(transformation(extent={{-654,-120},{-675,-100}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-692,-46.5},{-692,-41.625},{-691.85,-41.625},{-691.85,-36.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.inlet,PT201. inlet) annotation (Line(
      points={{-692,-62},{-692,-46.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.outlet,P201. inlet) annotation (Line(
      points={{-692,-82},{-692,-105.4}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL2_S201. inlet) annotation (Line(
      points={{-692,-124.6},{-692,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.inlet,FCV201. outlet) annotation (Line(
      points={{-726,-132},{-726,-124}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.outlet,FCV201. inlet) annotation (Line(
      points={{-718,-92},{-726,-92},{-726,-104}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.inlet,P201. inlet) annotation (Line(
      points={{-698,-92},{-692,-92},{-692,-105.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.outlet,PL5_S201. inlet) annotation (Line(
      points={{-726,-152},{-726,-164},{-734,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S201.outlet,PL5_S201. inlet) annotation (Line(
      points={{-692,-152},{-692,-164},{-734,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(PL5_S201.outlet,D201. inlet) annotation (Line(
      points={{-754,-164},{-766,-164},{-766,-298},{-658,-298},{-658,-262.25},{-678,
          -262.25}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.inlet,D201. inlet) annotation (Line(
      points={{-603,-262.25},{-598,-262.25},{-598,-262},{-592,-262},{-592,-298},
          {-658,-298},{-658,-262.25},{-678,-262.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-592.4,-34},{-592.4,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FT201. outlet) annotation (Line(
      points={{-592.4,-46},{-592,-46},{-591.8,-54.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet,PL6_S201. outlet) annotation (Line(
      points={{-591.8,-63.2},{-591.8,-67.6},{-592,-67.6},{-592,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.outlet,PL6_S201. inlet) annotation (Line(
      points={{-603,-233.75},{-592,-233.75},{-592,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL6_S201. inlet) annotation (Line(
      points={{-678,-233.75},{-678,-238},{-658,-238},{-658,-204},{-592,-204},{-592,
          -92}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta_.y,FCV201. opening)
    annotation (Line(points={{-757,-114},{-734,-114}},
                                                  color={0,0,127}));
  connect(TT201.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-691.85,-36.75},{-612,-36.75},{-612,-19.75},{-570,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-592.4,-34},{-592,20},{-592,19.75},{-628,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P201.y, P201.in_omega) annotation (Line(points={{-676.05,-110},{
          -676.05,-110.2},{-686,-110.2}}, color={0,0,127}));
end GBEBTanksPumpingSystem;
