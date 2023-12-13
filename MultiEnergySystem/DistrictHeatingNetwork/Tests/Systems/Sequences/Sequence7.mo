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
    annotation (Placement(transformation(extent={{-748,-466},{-804,-354}})));
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
        origin={-780,-204})));
              MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
                                                                                        D202(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-686,-466},{-630,-354}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-781.75,-74.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-782,-84.5})));
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
        origin={-780,-110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-840,-200})));
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
        origin={-840,-170})));
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
        origin={-780,-240})));
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
        origin={-840,-230})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-738,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-738,-114})));
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
        origin={-740,-50})));
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
        origin={-700,-402})));
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
        origin={-780,-50})));
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
        origin={-734,-402})));
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
        origin={-716,-430})));
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
        origin={-716,-446})));
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
        origin={-808,-480})));
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
        origin={-820,-430})));
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
        origin={-780,-172})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-810,-130})));
  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-810,-118})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-810,-112})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-780,-150})));
  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-798,-156},{-786,-144}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-788,-160},{-808,-140}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-760,-188})));
  Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-760,-174})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-760,-168})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-780,-270})));
  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=0,
        origin={-792.5,-270})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-798,-270})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-760,-256})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-740,-220})));
  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-720,-226},{-731,-214}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-718,-220})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{-7,7},{7,-7}},
        rotation=90,
        origin={-737,-281})));
  Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={-760,-266})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-760,-270})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-880,-210},{-860,-190}})));
  Modelica.Blocks.Interaction.Show.RealValue TT202_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-720,-129},{-672,-76}})));
  Modelica.Blocks.Interaction.Show.RealValue TT202_1(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-796,-103},{-844,-50}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-780,-84.5},{-780,-79.625},{-779.85,-79.625},{-779.85,-74.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
      points={{-780,-100},{-780,-84.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
      points={{-780,-213.6},{-780,-230}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-740.4,-102},{-740.4,-114}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
      points={{-740,-60},{-740,-102},{-740.4,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
      points={{-780,-60},{-780,-71.375},{-779.85,-71.375},{-779.85,-74.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
      points={{-748,-375},{-734,-375},{-734,-392}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
      Line(
      points={{-706,-430},{-700,-430},{-700,-412}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
      Line(
      points={{-726,-430},{-734,-430},{-734,-412}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
      points={{-700,-392},{-700,-375},{-686,-375}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
      points={{-726,-446},{-742,-446},{-742,-445},{-748,-445}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
      points={{-706,-446},{-702,-446},{-702,-445},{-686,-445}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
      points={{-798,-480},{-734,-480},{-734,-445},{-748,-445}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
      points={{-840,-220},{-840,-210}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
      points={{-840,-190},{-840,-180}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
      points={{-780,-182},{-780,-194.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
      points={{-840,-160},{-840,-130},{-816,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
      points={{-780,-120},{-780,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
      points={{-780,-156},{-780,-162}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet,FV201. inlet) annotation (Line(
      points={{-804,-130},{-780,-130},{-780,-144}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet,P201. inlet) annotation (Line(
      points={{-766,-188},{-780,-188},{-780,-194.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
      points={{-780,-250},{-780,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet,FV209. inlet) annotation (Line(
      points={{-766,-256},{-780,-256},{-780,-264}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet,FV203. inlet) annotation (Line(
      points={{-754,-256},{-740,-256},{-740,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet,FV203. outlet) annotation (Line(
      points={{-754,-188},{-740,-188},{-740,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FV203. outlet) annotation (Line(
      points={{-740.4,-114},{-740,-114},{-740,-214}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.outlet,FV203. inlet) annotation (Line(
      points={{-739.8,-276.8},{-740,-256},{-740,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-810,-124.6},{-810,
          -128.08},{-810,-128.08}},
                      color={255,0,255}));
  connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-859,-200},
          {-848,-200}},                                color={0,0,127}));
  connect(FV209.u,FV209_Status. activePort)
    annotation (Line(points={{-781.92,-270},{-786.5,-270}},
                                                        color={255,0,255}));
  connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-786.45,
          -270},{-786.5,-270}},             color={255,0,255}));
  connect(FV207.u,FV207_Status. activePort)
    annotation (Line(points={{-760,-257.92},{-760,-260.8}},
                                                        color={255,0,255}));
  connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-760,
          -261.6},{-760,-260.8}},                          color={255,0,255}));
  connect(FV202_Status.activePort,FV202. u) annotation (Line(points={{-810,
          -123.5},{-810,-128.08}},           color={255,0,255}));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
      Line(
      points={{-840,-240},{-840,-480},{-818,-480}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-780,-40},{-780,-20},{-680,-20},{-680,5.25},{-640,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-740,-40},{-740,-34},{-672,-34},{-672,44.75},{-699,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202_OnOff.y, FV202_Status.activePort)
    annotation (Line(points={{-810,-124.6},{-810,-123.5}}, color={255,0,255}));
  connect(FV201.u, FV201_Status.activePort) annotation (Line(points={{-781.92,
          -150},{-786.5,-150}}, color={255,0,255}));
  connect(FV201_OnOff.y, FV201_Status.activePort)
    annotation (Line(points={{-785.4,-150},{-786.5,-150}}, color={255,0,255}));
  connect(FV201.u, FV201_OnOff.y) annotation (Line(points={{-781.92,-150},{
          -785.4,-150}}, color={255,0,255}));
  connect(FV206_OnOff.y, FV206_Status.activePort)
    annotation (Line(points={{-760,-180.6},{-760,-179.5}}, color={255,0,255}));
  connect(FV206_OnOff.y, FV206.u) annotation (Line(points={{-760,-180.6},{-760,
          -186.08}}, color={255,0,255}));
  connect(FV203_OnOff.y, FV203.u) annotation (Line(points={{-731.55,-220},{
          -738.08,-220}}, color={255,0,255}));
  connect(FV203_OnOff.y, FV203_Status.activePort) annotation (Line(points={{
          -731.55,-220},{-731.8,-220}}, color={255,0,255}));
  connect(FV209.u, FV209_OnOff.y) annotation (Line(points={{-781.92,-270},{
          -786.45,-270}}, color={255,0,255}));
  connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (Line(
      points={{-830,-430},{-834,-430},{-834,-340},{-739.8,-340},{-739.8,-285.2}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (Line(
      points={{-810,-430},{-734,-430},{-734,-412}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (Line(
      points={{-780,-276},{-780,-320},{-840,-320},{-840,-480},{-818,-480}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.T, TT202_.numberPort) annotation (Line(points={{-730.2,-102},{
          -726.9,-102},{-726.9,-102.5},{-723.6,-102.5}}, color={0,0,127}));
  connect(TT201.T, TT202_1.numberPort) annotation (Line(points={{-787.925,
          -74.75},{-787.925,-76.5},{-792.4,-76.5}}, color={0,0,127}));
  annotation (experiment(
      StopTime=50,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-900,-500},
            {900,320}})));
end Sequence7;
