within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBTanksPumpingSystem
  extends GBEBPumpingSystem(P901omega = [0, 2*3.141592654*48; 100, 2*3.141592654*48],
                            P101omega = [0, 2*3.141592654*35; 100, 2*3.141592654*35],
                            P401omega = [0, 2*3.141592654*35; 100, 2*3.141592654*35]);

  // System S200
  parameter Types.Pressure pin_start_S2 = 1.79e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 17 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 16.5 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_S2 = 4.5;

  parameter Real theta(max = 1, min = 0) = 1;
  parameter Real thetavar(max = 1) = 0.1;
  // Pipe length
  parameter Types.Length L_S2_PL0 = 24.5;
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;
  parameter Types.Length L_S2_PL7 = 2;
  parameter Types.Length L_S2_PL8 = 3;
  parameter Types.Length L_S2_PL9 = 21.5;

  parameter Real P201omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real FCV201theta[:,:] = [0, 0.2];

  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D201(
    H=4,
    n=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-738,-278},{-786,-202}})));
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
        origin={-772,-135})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D202(
    H=4,
    n=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2) annotation (Placement(transformation(extent={{-673,
            -278},{-721,-202}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-773.75,-62.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-774,-72.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S201(
    L=L_S2_PL1,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-772,-94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-810,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S201(
    L=L_S2_PL3,
    t=L_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-792,-114})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S201(
    L=L_S2_PL2,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-772,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S201(
    L=L_S2_PL4,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-810,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL5_S201(
    L=L_S2_PL5,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-810,-226})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL8_S201(
    L=L_S2_PL8,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_tank,
    pout_start=pout_start_S2_tank - 0.01e5,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-660,-128})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2_tank)
    "Temperature sensor at the outlet of System 200" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-658,-76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-658,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201
    "Flow sensor at the outlet of system S200" annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-657,-101})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL9_S201(
    L=L_S2_PL9,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_tank,
    pout_start=pout_start_S2_tank - 0.01e5,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-660,-46})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL7_S201(
    L=L_S2_PL7,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-698,-186})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL6_S201(
    L=L_S2_PL6,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pout_start_S2_pump,
    pout_start=pout_start_S2_pump - 0.01e5,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-698,-292})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL0_S201(
    L=L_S2_PL0,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-772,-46})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-852,-150},{-832,-130}})));
  Modelica.Blocks.Sources.TimeTable P201_omega(table=P201omega)
    annotation (Placement(transformation(extent={{-722,-140},{-742,-120}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-772,-72.5},{-772,-67.625},{-771.85,-67.625},{-771.85,-62.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.inlet,PT201. inlet) annotation (Line(
      points={{-772,-84},{-772,-72.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.outlet,P201. inlet) annotation (Line(
      points={{-772,-104},{-772,-125.4}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL2_S201. inlet) annotation (Line(
      points={{-772,-144.6},{-772,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-660.4,-76},{-660.4,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FT201. outlet) annotation (Line(
      points={{-660.4,-88},{-660,-88},{-659.8,-96.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet,PL8_S201. outlet) annotation (Line(
      points={{-659.8,-105.2},{-659.8,-109.6},{-660,-109.6},{-660,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.outlet,PL8_S201. inlet) annotation (Line(
      points={{-673,-216.25},{-660,-216.25},{-660,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL9_S201.inlet,TT202. inlet) annotation (Line(
      points={{-660,-56},{-660,-76},{-660.4,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL7_S201.outlet,PL8_S201. inlet) annotation (Line(
      points={{-688,-186},{-660,-186},{-660,-138}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S201.outlet,PL5_S201. inlet) annotation (Line(
      points={{-772,-180},{-772,-186},{-810,-186},{-810,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PL5_S201.outlet,D201. inlet) annotation (Line(
      points={{-810,-236},{-810,-292},{-728,-292},{-728,-263.75},{-738,-263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL0_S201.outlet,TT201. inlet) annotation (Line(
      points={{-772,-56},{-772,-59.375},{-771.85,-59.375},{-771.85,-62.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet, PL7_S201.inlet) annotation (Line(
      points={{-738,-216.25},{-734,-216.25},{-734,-226},{-726,-226},{-726,-186},
          {-708,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(PL9_S201.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-660,-36},{-660,44.75},{-699,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.in_omega, P201_omega.y) annotation (Line(points={{-766,-130.2},{-766,
          -130},{-743,-130}}, color={0,0,127}));
  connect(PL0_S201.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-772,-36},{-772,-32},{-674,-32},{-674,5.25},{-640,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL6_S201.inlet, D201.inlet) annotation (Line(
      points={{-708,-292},{-728,-292},{-728,-263.75},{-738,-263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL6_S201.outlet, D202.inlet) annotation (Line(
      points={{-688,-292},{-660,-292},{-660,-263.75},{-673,-263.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.inlet, PL5_S201.inlet) annotation (Line(
      points={{-810,-180},{-810,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.outlet, FCV201.inlet) annotation (Line(
      points={{-810,-160},{-810,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet, PL3_S201.inlet) annotation (Line(
      points={{-810,-130},{-810,-114},{-802,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.outlet, P201.inlet) annotation (Line(
      points={{-782,-114},{-772,-114},{-772,-125.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta.y, FCV201.opening)
    annotation (Line(points={{-831,-140},{-818,-140}}, color={0,0,127}));
end GBEBTanksPumpingSystem;
