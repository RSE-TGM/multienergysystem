within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence7
  extends Sequence6(q_m3h_S1 = 9, q_m3h_S4 = 2, q_m3h_S9 = 17);
  parameter Boolean FV201_state = true;
  parameter Boolean FV202_state = true;
  parameter Boolean FV203_state = true;
  parameter Boolean FV204_state = true;
  parameter Boolean FV205_state = true;
  parameter Boolean FV206_state = false;
  parameter Boolean FV207_state = false;
  parameter Boolean FV208_state = true;
  parameter Boolean FV209_state = true;

  parameter Types.Pressure pin_start_S2 = 2.1e5;
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
  parameter Real q_m3h_S2(unit = "m3/h") = 6;
  final parameter Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
  parameter Real P201qm3h[:,:] = [0, 2.8289046; 100, 2.8289046];

  parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];


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

  parameter Types.Length L_S2_S201_S202 = 2.5;
  parameter Types.Length h_S2_S201_S202 = 0;
  parameter Types.Length L_S2_Tanks_High = 2.5;
  parameter Types.Length h_S2_Tanks_High = -2.5;
  parameter Types.Length L_S2_S201_FT201 = 1;
  parameter Types.Length h_S2_S201_FT201 = 0;
  parameter Types.Length L_S2_D201_FT201 = 2;
  parameter Types.Length h_S2_D201_FT201 = 0;

              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D201(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-764,-478},{-820,-366}})));
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
    headnom=Pump.P201.headnom,
    qnom_inm3h=Pump.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h,
    use_in_omega=true)                        annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-796,-210})));
              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
                                                                                        D202(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-702,-478},{-646,-366}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-797.75,-68.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-798,-88.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-796,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-856,-200})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
    L=L_S2_PL3,
    t=L_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-856,-170})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-796,-242})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
    L=L_S2_PL4,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-856,-230})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-754,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-754,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    L=L_S2_PL9,
    t=t_S2,
    pin_start=pout_start_S2,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-756,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-716,-414})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
    L=L_S2_PL0,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-796,-50})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-750,-414})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-732,-442})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-732,-458})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
    L=L_S2_PL6,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-824,-492})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
    L=L_S2_D201_FT201,
    h=h_S2_D201_FT201,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-836,-442})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-796,-172})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-826,-130})));
  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-826,-118})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-826,-112})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-796,-150})));
  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-814,-156},{-802,-144}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-804,-160},{-824,-140}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-776,-188})));
  Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-776,-174})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-776,-168})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-796,-270})));
  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=0,
        origin={-808.5,-270})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-814,-270})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-776,-256})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-756,-220})));
  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-736,-226},{-747,-214}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-734,-220})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-753,-281})));
  Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={-776,-266})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-776,-270})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-890,-210},{-870,-190}})));
  Modelica.Blocks.Interaction.Show.RealValue TT202_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-736,-97},{-688,-44}})));
  Modelica.Blocks.Interaction.Show.RealValue TT202_1(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-812,-97},{-860,-44}})));
  Sources.PumpInput P201_input(omega=P201omega, q_m3h=P201qm3h)
    annotation (Placement(transformation(extent={{-836,-216},{-816,-196}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-796,-88.5},{-796,-79.625},{-795.85,-79.625},{-795.85,-68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
      points={{-796,-100},{-796,-88.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
      points={{-796,-219.6},{-796,-232}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-756.4,-70},{-756.4,-140}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
      points={{-756,-60},{-756,-70},{-756.4,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
      points={{-796,-60},{-796,-71.375},{-795.85,-71.375},{-795.85,-68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
      points={{-764,-387},{-750,-387},{-750,-404}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
      Line(
      points={{-722,-442},{-716,-442},{-716,-424}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
      Line(
      points={{-742,-442},{-750,-442},{-750,-424}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
      points={{-716,-404},{-716,-387},{-702,-387}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
      points={{-742,-458},{-758,-458},{-758,-457},{-764,-457}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
      points={{-722,-458},{-718,-458},{-718,-457},{-702,-457}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
      points={{-814,-492},{-750,-492},{-750,-457},{-764,-457}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
      points={{-856,-220},{-856,-210}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
      points={{-856,-190},{-856,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
      points={{-796,-182},{-796,-200.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
      points={{-856,-160},{-856,-130},{-832,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
      points={{-796,-120},{-796,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
      points={{-796,-156},{-796,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet,FV201. inlet) annotation (Line(
      points={{-820,-130},{-796,-130},{-796,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet,P201. inlet) annotation (Line(
      points={{-782,-188},{-796,-188},{-796,-200.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
      points={{-796,-252},{-796,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet,FV209. inlet) annotation (Line(
      points={{-782,-256},{-796,-256},{-796,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet,FV203. inlet) annotation (Line(
      points={{-770,-256},{-756,-256},{-756,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet,FV203. outlet) annotation (Line(
      points={{-770,-188},{-756,-188},{-756,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FV203. outlet) annotation (Line(
      points={{-756.4,-140},{-756,-140},{-756,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.outlet,FV203. inlet) annotation (Line(
      points={{-755.8,-276.8},{-756,-256},{-756,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-869,-200},{
          -864,-200}},                                 color={0,0,127}));
  connect(FV207.u,FV207_Status. activePort)
    annotation (Line(points={{-776,-257.92},{-776,-260.8}},
                                                        color={255,0,255}));
  connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-776,
          -261.6},{-776,-260.8}},                          color={255,0,255}));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
      Line(
      points={{-856,-240},{-856,-492},{-834,-492}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-796,-40},{-796,-20},{-708,-20},{-708,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-756,-40},{-756,-34},{-694,-34},{-694,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206_OnOff.y, FV206_Status.activePort)
    annotation (Line(points={{-776,-180.6},{-776,-179.5}}, color={255,0,255}));
  connect(FV206_OnOff.y, FV206.u) annotation (Line(points={{-776,-180.6},{-776,-186.08}},
                     color={255,0,255}));
  connect(FV203_OnOff.y, FV203.u) annotation (Line(points={{-747.55,-220},{-754.08,
          -220}},         color={255,0,255}));
  connect(FV203_OnOff.y, FV203_Status.activePort) annotation (Line(points={{-747.55,
          -220},{-747.8,-220}},         color={255,0,255}));
  connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (Line(
      points={{-846,-442},{-850,-442},{-850,-352},{-755.8,-352},{-755.8,-285.2}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (Line(
      points={{-826,-442},{-750,-442},{-750,-424}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (Line(
      points={{-796,-276},{-796,-332},{-856,-332},{-856,-492},{-834,-492}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.T, TT202_.numberPort) annotation (Line(points={{-746.2,-70},{-742.9,
          -70},{-742.9,-70.5},{-739.6,-70.5}},           color={0,0,127}));
  connect(TT201.T, TT202_1.numberPort) annotation (Line(points={{-803.925,-68.75},
          {-803.925,-70.5},{-808.4,-70.5}},         color={0,0,127}));
  connect(FV201_OnOff.y, FV201.u) annotation (Line(points={{-801.4,-150},{-797.92,
          -150}},         color={255,0,255}));
  connect(FV201_OnOff.y, FV201_Status.activePort)
    annotation (Line(points={{-801.4,-150},{-802.5,-150}}, color={255,0,255}));
  connect(FV202_OnOff.y, FV202.u) annotation (Line(points={{-826,-124.6},{-826,-128.08}},
                     color={255,0,255}));
  connect(FV202_OnOff.y, FV202_Status.activePort)
    annotation (Line(points={{-826,-124.6},{-826,-123.5}}, color={255,0,255}));
  connect(FV209_OnOff.y, FV209.u) annotation (Line(points={{-802.45,-270},{-797.92,
          -270}},         color={255,0,255}));
  connect(FV209_OnOff.y, FV209_Status.activePort) annotation (Line(points={{-802.45,
          -270},{-802.5,-270}},         color={255,0,255}));
  connect(P201_input.y, P201.in_omega) annotation (Line(points={{-815,-206},{-808.5,
          -206},{-808.5,-205.2},{-802,-205.2}}, color={0,0,127}));
  annotation (experiment(
      StopTime=50,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-900,-500},
            {900,320}})));
end Sequence7;
