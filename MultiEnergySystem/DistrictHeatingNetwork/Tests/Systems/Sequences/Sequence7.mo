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

  parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.8; 200, 0.8];


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
    annotation (Placement(transformation(extent={{-624,-354},{-680,-242}})));
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
    qnom_inm3h_max=Pump.P201.qnommax_inm3h)   annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-784,-204})));
              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
                                                                                        D202(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-540,-354},{-484,-242}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-785.75,-74.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-786,-84.5})));
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
        origin={-784,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-844,-200})));
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
        origin={-844,-170})));
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
        origin={-784,-240})));
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
        origin={-844,-230})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-722,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-722,-114})));
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
        origin={-724,-50})));
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
        origin={-554,-290})));
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
        origin={-784,-50})));
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
        origin={-610,-290})));
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
        origin={-582,-308})));
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
        origin={-582,-326})));
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
        origin={-700,-368})));
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
        origin={-702,-308})));
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
        origin={-784,-172})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-814,-130})));
  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-836,-132},{-824,-120}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{9,-9},{-9,9}},
        rotation=-90,
        origin={-813,-113})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-784,-150})));
  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-814,-156},{-802,-144}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-796,-158},{-778,-140}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-754,-188})));
  Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-734,-182})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{9,-9},{-9,9}},
        rotation=-90,
        origin={-755,-171})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-784,-270})));
  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=90,
        origin={-788.5,-286})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-802,-270})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-756,-256})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-724,-220})));
  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-690,-226},{-701,-214}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{10.25,-10.25},{-10.25,10.25}},
        rotation=0,
        origin={-720.25,-220.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-721,-281})));
  Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
    annotation (Placement(transformation(extent={{-742,-264},{-748,-258}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-756,-270})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-884,-210},{-864,-190}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-784,-84.5},{-784,-79.625},{-783.85,-79.625},{-783.85,-74.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
      points={{-784,-100},{-784,-84.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
      points={{-784,-213.6},{-784,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-724.4,-102},{-724.4,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
      points={{-724,-60},{-724,-102},{-724.4,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
      points={{-784,-60},{-784,-71.375},{-783.85,-71.375},{-783.85,-74.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
      points={{-624,-263},{-610,-263},{-610,-280}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
      Line(
      points={{-572,-308},{-554,-308},{-554,-300}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
      Line(
      points={{-592,-308},{-610,-308},{-610,-300}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
      points={{-554,-280},{-554,-263},{-540,-263}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
      points={{-592,-326},{-608,-326},{-608,-333},{-624,-333}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
      points={{-572,-326},{-556,-326},{-556,-333},{-540,-333}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
      points={{-690,-368},{-614,-368},{-614,-333},{-624,-333}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
      points={{-692,-308},{-610,-308},{-610,-300}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
      points={{-844,-220},{-844,-210}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
      points={{-844,-190},{-844,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
      points={{-784,-182},{-784,-194.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
      points={{-844,-160},{-844,-130},{-820,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
      points={{-784,-120},{-784,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
      points={{-784,-156},{-784,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet,FV201. inlet) annotation (Line(
      points={{-808,-130},{-784,-130},{-784,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet,P201. inlet) annotation (Line(
      points={{-760,-188},{-784,-188},{-784,-194.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
      points={{-784,-250},{-784,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet,FV209. inlet) annotation (Line(
      points={{-762,-256},{-784,-256},{-784,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet,FV203. inlet) annotation (Line(
      points={{-750,-256},{-724,-256},{-724,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet,FV203. outlet) annotation (Line(
      points={{-748,-188},{-724,-188},{-724,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FV203. outlet) annotation (Line(
      points={{-724.4,-114},{-724,-114},{-724,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.outlet,FV203. inlet) annotation (Line(
      points={{-723.8,-276.8},{-724,-256},{-724,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet,PL_S200_D201_FT201. inlet) annotation (Line(
      points={{-723.8,-285.2},{-723.8,-308},{-712,-308}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.u,FV206_OnOff. y) annotation (Line(points={{-754,-186.08},{-754,
          -182},{-740.6,-182}},
                color={255,0,255}));
  connect(FV206.u,FV206_Status. activePort) annotation (Line(points={{-754,-186.08},
          {-754,-181.35},{-755,-181.35}},              color={255,0,255}));
  connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-823.4,-126},{-814,-126},
          {-814,-128.08}},
                      color={255,0,255}));
  connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-863,-200},{
          -852,-200}},                                 color={0,0,127}));
  connect(FV209.u,FV209_Status. activePort)
    annotation (Line(points={{-785.92,-270},{-790.5,-270}},
                                                        color={255,0,255}));
  connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-788.5,
          -279.95},{-788.5,-270},{-790.5,-270}},
                                            color={255,0,255}));
  connect(FV207.u,FV207_Status. activePort)
    annotation (Line(points={{-756,-257.92},{-756,-260.8}},
                                                        color={255,0,255}));
  connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-748.3,
          -261},{-752,-261},{-752,-260},{-756,-260},{-756,-260.8}},
                                                           color={255,0,255}));
  connect(FV202_Status.activePort,FV202. u) annotation (Line(points={{-813,-123.35},
          {-813,-126},{-814,-126},{-814,-128.08}},
                                             color={255,0,255}));
  connect(FV201_OnOff.y,FV201_Status. activePort) annotation (Line(points={{-801.4,
          -150},{-800,-150},{-800,-149},{-797.35,-149}},
                                              color={255,0,255}));
  connect(FV201_OnOff.y,FV201. u) annotation (Line(points={{-801.4,-150},{-800,-150},
          {-800,-154},{-788,-154},{-788,-150},{-785.92,-150}},
                                                  color={255,0,255}));
  connect(FV203_OnOff.y,FV203_Status. activePort) annotation (Line(points={{-701.55,
          -220},{-703.006,-220},{-703.006,-220.25},{-708.462,-220.25}},
                                                                 color={255,0,255}));
  connect(FV203.u,FV203_Status. activePort) annotation (Line(points={{-722.08,
          -220},{-720,-220},{-720,-214},{-704,-214},{-704,-220},{-705.006,-220},
          {-705.006,-220.25},{-708.462,-220.25}},
                            color={255,0,255}));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
      Line(
      points={{-844,-240},{-844,-368},{-710,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
      points={{-784,-276},{-784,-308},{-844,-308},{-844,-368},{-710,-368}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-784,-40},{-784,-32},{-680,-32},{-680,-19.75},{-640,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-724,-40},{-724,-34},{-672,-34},{-672,19.75},{-699,19.75}},
      color={140,56,54},
      thickness=0.5));
end Sequence7;
