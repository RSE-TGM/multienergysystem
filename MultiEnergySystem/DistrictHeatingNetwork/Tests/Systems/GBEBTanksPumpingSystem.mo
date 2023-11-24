within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBTanksPumpingSystem
  extends GBEBPumpingSystem(P901omega = [0, 2*3.141592654*42; 100, 2*3.141592654*42],
                            P101omega = [0, 2*3.141592654*50; 100, 2*3.141592654*50],
                            P401omega = [0, 2*3.141592654*50; 100, 2*3.141592654*50]);

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

  parameter Real P201omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50];
  parameter Real FCV201theta[:,:] = [0, 1];

              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D201(
    H=4,
    n=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-676,-278},{-724,-202}})));
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
        origin={-710,-135})));
              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
                                                                                        D202(
    H=4,
    n=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-611,-278},{-659,-202}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-711.75,-62.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-712,-72.5})));
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
        origin={-710,-94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)
           annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-748,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S201(
    L=L_S2_PL3,
    t=L_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-730,-114})));
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
        origin={-710,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S201(
    L=L_S2_PL4,
    t=t_S2,
    m_flow_start=m_flow_S2,
    pin_start=pin_start_S2,
    pout_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-748,-170})));
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
        origin={-748,-226})));
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
        origin={-596,-126})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2_tank)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-594,-76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-594,-88})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-593,-101})));
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
        origin={-596,-46})));
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
        origin={-636,-186})));
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
        origin={-634,-292})));
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
        origin={-710,-46})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-790,-150},{-770,-130}})));
  Modelica.Blocks.Sources.TimeTable P201_omega(table=P201omega)
    annotation (Placement(transformation(extent={{-660,-140},{-680,-120}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-710,-72.5},{-710,-67.625},{-709.85,-67.625},{-709.85,-62.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.inlet,PT201. inlet) annotation (Line(
      points={{-710,-84},{-710,-72.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S201.outlet,P201. inlet) annotation (Line(
      points={{-710,-104},{-710,-125.4}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL2_S201. inlet) annotation (Line(
      points={{-710,-144.6},{-710,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.inlet,FCV201. outlet) annotation (Line(
      points={{-748,-160},{-748,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.outlet,FCV201. inlet) annotation (Line(
      points={{-740,-114},{-748,-114},{-748,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL3_S201.inlet,P201. inlet) annotation (Line(
      points={{-720,-114},{-710,-114},{-710,-125.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-596.4,-76},{-596.4,-88}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FT201. outlet) annotation (Line(
      points={{-596.4,-88},{-596,-88},{-595.8,-96.8}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet,PL8_S201. outlet) annotation (Line(
      points={{-595.8,-105.2},{-595.8,-109.6},{-596,-109.6},{-596,-116}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.outlet,PL8_S201. inlet) annotation (Line(
      points={{-611,-225.75},{-596,-225.75},{-596,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(PL9_S201.inlet,TT202. inlet) annotation (Line(
      points={{-596,-56},{-596,-76},{-596.4,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL7_S201.outlet,PL8_S201. inlet) annotation (Line(
      points={{-626,-186},{-596,-186},{-596,-136}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S201.outlet,PL5_S201. inlet) annotation (Line(
      points={{-748,-180},{-748,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S201.outlet,PL5_S201. inlet) annotation (Line(
      points={{-710,-180},{-710,-186},{-748,-186},{-748,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PL5_S201.outlet,D201. inlet) annotation (Line(
      points={{-748,-236},{-748,-292},{-666,-292},{-666,-254.25},{-676,-254.25}},
      color={140,56,54},
      thickness=0.5));
  connect(D202.inlet, PL6_S201.outlet) annotation (Line(
      points={{-611,-254.25},{-600,-254.25},{-600,-292},{-624,-292}},
      color={140,56,54},
      thickness=0.5));
  connect(PL0_S201.outlet,TT201. inlet) annotation (Line(
      points={{-710,-56},{-710,-59.375},{-709.85,-59.375},{-709.85,-62.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet, PL7_S201.inlet) annotation (Line(
      points={{-676,-225.75},{-672,-225.75},{-672,-226},{-664,-226},{-664,-186},
          {-646,-186}},
      color={140,56,54},
      thickness=0.5));
  connect(PL6_S201.inlet, D201.inlet) annotation (Line(
      points={{-644,-292},{-666,-292},{-666,-254.25},{-676,-254.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL0_S201.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-710,-36},{-710,-32},{-622,-32},{-622,-19.75},{-580,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL9_S201.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-596,-36},{-596,19.75},{-639,19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta.y, FCV201.opening)
    annotation (Line(points={{-769,-140},{-756,-140}}, color={0,0,127}));
  connect(P201.in_omega, P201_omega.y) annotation (Line(points={{-704,-130.2},{-704,
          -130},{-681,-130}}, color={0,0,127}));
end GBEBTanksPumpingSystem;
