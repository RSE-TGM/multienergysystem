within MultiEnergySystem.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemLoadSimplifiedI_D "Gas Boiler, Electric Boiler & Water Tanks"
  extends CentralisedSystemLoadSimplifiedI_B(
    P901omega=[0,2*pi*30; 500,2*pi*30],
    P101omega=[0,2*pi*40; 500,2*pi*40],
    P401omega=[0,2*pi*40; 500,2*pi*40],
    q_m3h_S9 = 15,
    EB401_ToutSP = [0, 80+273.15; 4000, 80+273.15; 4000, 85+273.15; 1e6, 85+273.15],
    GB101_ToutSP = [0, 80+273.15; 4000, 80+273.15; 4000, 85+273.15; 1e6, 85+273.15]);
  // System S200
  // Unloading
//   parameter Boolean FV201_state = true;
//   parameter Boolean FV202_state = true;
//   parameter Boolean FV203_state = true;
//   parameter Boolean FV204_state = true;
//   parameter Boolean FV205_state = true;
//   parameter Boolean FV206_state = false;
//   parameter Boolean FV207_state = false;
//   parameter Boolean FV208_state = true;
//   parameter Boolean FV209_state = true;


  // Loading
  parameter Boolean FV201_state = false;
  parameter Boolean FV202_state = true;
  parameter Boolean FV203_state = false;
  parameter Boolean FV204_state = true;
  parameter Boolean FV205_state = true;
  parameter Boolean FV206_state = true;
  parameter Boolean FV207_state = true;
  parameter Boolean FV208_state = true;
  parameter Boolean FV209_state = false;

  parameter Integer nTank = 4 "Number of volumes in stratified tank";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2=2.1e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2=1.8e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump=1.79e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump=3e5;
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank=
      pout_start_S2_pump;
  final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank=
      pin_start_S2_tank - 9.81*4*990;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2=80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2=70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S2=10;
  parameter DistrictHeatingNetwork.Types.Length Di_S2=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S2=1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 4;
  final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q=q_m3h_S2/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2=q*985;
  parameter Real P201omega[:,:] = [0, 2*pi*30; 100, 2*pi*30; 150, 2*pi*30; 200, 2*pi*30];
  parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

  parameter Real FCV201theta[:,:] = [0, 1; 100, 1; 105, 1; 200, 1];

  // Pipe length
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL0=24.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL1=1.7;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL2=1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL3=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL4=1.0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL5=2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL6=2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL7=2;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL8=3;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL9=21.5;

  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202=0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High=-2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201=1;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201=0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201=2;
  parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201=0;

  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
    H=4,
    Tin_start=Tin_start_S2,
    Tout_start=Tout_start_S2,
    n=nTank,
    D=1.7,
    T_start(displayUnit="K") = 70 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2) "Stratified tank 1" annotation (Placement(transformation(extent={{-762,-480},{-818,-368}})));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P201(
    pout_start(displayUnit="Pa") = 3e5,
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start,
    Tout_start=DistrictHeatingNetwork.Data.PumpData.P201.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P201.a,
    b=DistrictHeatingNetwork.Data.PumpData.P201.b,
    m_flow_start=m_flow_S2,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P201.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P201.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P201.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P201.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P201.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P201.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    headnom=DistrictHeatingNetwork.Data.PumpData.P201.headnom,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P201.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P201.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h,
    use_in_omega=true) annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-794,-212})));

  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
    H=4,
    Tin_start=Tin_start_S2,
    Tout_start=Tout_start_S2,
    n=nTank,
    D=1.7,
    T_start(displayUnit="K") = 70 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2) "Stratified tank 2" annotation (Placement(transformation(extent={{-700,-480},{-644,-368}})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start=
        Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-795.75,-70.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-796,-90.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
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
        origin={-794,-112})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-854,-202})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
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
        origin={-854,-172})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-794,-244})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
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
        origin={-854,-232})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start=
        Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-752,-72})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202
    "Pressure sensor at the outlet of system S200" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-752,-142})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    L=L_S2_PL9,
    t=t_S2,
    pin_start=pout_start_S2,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-754,-52})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
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
        origin={-714,-416})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
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
        origin={-794,-52})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
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
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-748,-416})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-730,-444})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
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
        origin={-730,-460})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
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
        origin={-822,-494})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
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
        origin={-834,-444})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
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
        origin={-794,-174})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-824,-132})));

  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-824,-120})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-824,-114})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-794,-152})));

  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-812,-158},{-800,-146}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-802,-162},{-822,-142}})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-774,-190})));

  Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},
        rotation=270,
        origin={-774,-176})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-774,-170})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-794,-272})));

  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=0,
        origin={-806.5,-272})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-812,-272})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-774,-258})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-754,-222})));

  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-734,-228},{-745,-216}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-734,-222})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
        Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
      Placement(transformation(
        extent={{7,7},{-7,-7}},
        rotation=90,
        origin={-751,-283})));
  Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
    annotation (Placement(transformation(extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={-774,-270})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-774,-276})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-888,-212},{-868,-192}})));
  DistrictHeatingNetwork.Sources.PumpInput P201_input(
    useOmega=true,
    omega=P201omega,
    q_m3h=P201qm3h)
    annotation (Placement(transformation(extent={{-828,-218},{-808,-198}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-794,-90.5},{-794,-81.625},{-793.85,-81.625},{-793.85,-70.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
      points={{-794,-102},{-794,-90.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
      points={{-794,-221.6},{-794,-234}},
      color={140,56,54},
      thickness=0.5));
  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-754.4,-72},{-754.4,-142}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
      points={{-754,-62},{-754,-72},{-754.4,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
      points={{-794,-62},{-794,-73.375},{-793.85,-73.375},{-793.85,-70.75}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
      points={{-762,-389},{-748,-389},{-748,-406}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
      Line(
      points={{-720,-444},{-714,-444},{-714,-426}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
      Line(
      points={{-740,-444},{-748,-444},{-748,-426}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
      points={{-714,-406},{-714,-389},{-700,-389}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
      points={{-740,-460},{-756,-460},{-756,-459},{-762,-459}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
      points={{-720,-460},{-716,-460},{-716,-459},{-700,-459}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
      points={{-812,-494},{-748,-494},{-748,-459},{-762,-459}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
      points={{-854,-222},{-854,-212}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
      points={{-854,-192},{-854,-182}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
      points={{-794,-184},{-794,-202.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
      points={{-854,-162},{-854,-132},{-830,-132}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
      points={{-794,-122},{-794,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
      points={{-794,-158},{-794,-164}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet,FV201. inlet) annotation (Line(
      points={{-818,-132},{-794,-132},{-794,-146}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet,P201. inlet) annotation (Line(
      points={{-780,-190},{-794,-190},{-794,-202.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
      points={{-794,-254},{-794,-266}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet,FV209. inlet) annotation (Line(
      points={{-780,-258},{-794,-258},{-794,-266}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet,FV203. inlet) annotation (Line(
      points={{-768,-258},{-754,-258},{-754,-228}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet,FV203. outlet) annotation (Line(
      points={{-768,-190},{-754,-190},{-754,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet,FV203. outlet) annotation (Line(
      points={{-754.4,-142},{-754,-142},{-754,-216}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-867,-202},
          {-862,-202}},                                color={0,0,127}));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
      Line(
      points={{-854,-242},{-854,-494},{-832,-494}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206_OnOff.y,FV206_Status. activePort)
    annotation (Line(points={{-774,-182.6},{-774,-181.5}}, color={255,0,255}));
  connect(FV206_OnOff.y,FV206. u) annotation (Line(points={{-774,-182.6},{-774,
          -188.08}}, color={255,0,255}));
  connect(FV203_OnOff.y,FV203. u) annotation (Line(points={{-745.55,-222},{-752.08,-222}},
                          color={255,0,255}));
  connect(FV203_OnOff.y,FV203_Status. activePort) annotation (Line(points={{-745.55,-222},{-745.5,-222}},
                                        color={255,0,255}));
  connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
      points={{-824,-444},{-748,-444},{-748,-426}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
      points={{-794,-278},{-794,-334},{-854,-334},{-854,-494},{-832,-494}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201_OnOff.y,FV201. u) annotation (Line(points={{-799.4,-152},{
          -795.92,-152}}, color={255,0,255}));
  connect(FV201_OnOff.y,FV201_Status. activePort)
    annotation (Line(points={{-799.4,-152},{-800.5,-152}}, color={255,0,255}));
  connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-824,-126.6},{-824,
          -130.08}}, color={255,0,255}));
  connect(FV202_OnOff.y,FV202_Status. activePort)
    annotation (Line(points={{-824,-126.6},{-824,-125.5}}, color={255,0,255}));
  connect(FV209_OnOff.y,FV209. u) annotation (Line(points={{-800.45,-272},{-795.92,-272}},
                          color={255,0,255}));
  connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-800.45,-272},{-800.5,-272}},
                                        color={255,0,255}));
  connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
      points={{-794,-42},{-796,-42},{-796,-8},{-708,-8},{-708,5.25},{-668,5.25}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
      points={{-754,-42},{-754,-14},{-700,-14},{-700,44.75},{-727,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(P201_input.y, P201.in_omega) annotation (Line(points={{-807,-208},{-806.5,-208},{-806.5,-207.2},
          {-800,-207.2}}, color={0,0,127}));
  connect(PL_S200_D201_FT201.inlet, FT201.outlet) annotation (Line(
      points={{-844,-444},{-848,-444},{-848,-344},{-753.8,-344},{-753.8,-287.2}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet, FV203.inlet) annotation (Line(
      points={{-753.8,-278.8},{-754,-258},{-754,-228}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207_OnOff.y, FV207_Status.activePort)
    annotation (Line(points={{-774,-263.4},{-774,-264.5}}, color={255,0,255}));
  connect(FV207_OnOff.y, FV207.u)
    annotation (Line(points={{-774,-263.4},{-774,-259.92}}, color={255,0,255}));
  annotation (experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
end CentralisedSystemLoadSimplifiedI_D;
