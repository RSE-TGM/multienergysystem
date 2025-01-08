within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model WaterTankSystemB "System of two tanks"
  extends Modelica.Icons.Example;

  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Boolean FV201_state = false;
  parameter Boolean FV202_state = true;
  parameter Boolean FV203_state = false;
  parameter Boolean FV204_state = true;
  parameter Boolean FV205_state = true;
  parameter Boolean FV206_state = true;
  parameter Boolean FV207_state = true;
  parameter Boolean FV208_state = true;
  parameter Boolean FV209_state = false;
  parameter Boolean Load = true;
  final parameter Boolean Unload = not Load;

  parameter Types.Pressure pin_start_S2 = 2.1e5;
  parameter Types.Pressure pout_start_S2 = 1.8e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 25 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 26 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 2;
  final parameter Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
  parameter Real P201qm3h[:,:] = [0, 2.8289046; 100, 2.8289046];

  parameter Real FCV201theta[:,:] = [0, 1; 100, 1; 105, 1; 200, 1];

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

  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={270,230},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D201(H=4, D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2,
    Tin_start=298.15,
    Tout_start=299.15,
    n=21,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)
    annotation (Placement(transformation(extent={{118,-154},{62,-42}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P201(
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
      pout_start(displayUnit="Pa") = 1.9920743e5,
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
        origin={-80,-4})));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
    H=4,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2,
    Tin_start=298.15,
    Tout_start=299.15,
    n=21,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)
         annotation (Placement(transformation(extent={{202,-154},{258,-42}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-81.75,125.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-82,115.5})));
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
        origin={-80,90})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV201.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-140,0})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
    L=L_S2_PL3,
    t=L_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-140,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-80,-40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
    L=L_S2_PL4,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-140,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-18,98})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-18,86})));
  Sources.SourcePressure source(
    use_in_p0=true,             p0=pin_start_S2, T0=Tin_start_S2,
    R=1e-3)
    annotation (Placement(transformation(extent={{-118,160},{-98,180}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=20,
    duration=1500*0,
    offset=26 + 273.15,
    startTime=1000)
    annotation (Placement(transformation(extent={{40,190},{20,210}})));
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
        origin={-20,150})));
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
        origin={188,-90})));
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
        origin={-80,150})));
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
        origin={132,-90})));
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
        origin={160,-108})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={160,-126})));
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
        origin={42,-168})));
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
        origin={40,-108})));
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
        origin={-80,28})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-110,70})));
  Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
    annotation (Placement(transformation(extent={{-148,84},{-136,96}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
    annotation (Placement(transformation(extent={{9,-9},{-9,9}},
        rotation=-90,
        origin={-111,93})));

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-80,50})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-96,40},{-114,58}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-52,12})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
    annotation (Placement(transformation(extent={{9,-9},{-9,9}},
        rotation=180,
        origin={-39,23})));

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-80,-70})));
  Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
    annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
        rotation=90,
        origin={-94.5,-92})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-108,-70})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-52,-56})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-20,-20})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{10.25,-10.25},{-10.25,10.25}},
        rotation=0,
        origin={-16.25,-20.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
        extent={{7,7},{-7,-7}},
        rotation=90,
        origin={-17,-81})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=-90,
        origin={-52,-76})));
  Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
    annotation (Placement(transformation(extent={{-180,-10},{-160,10}})));
  Sources.SinkPressure sink(
    use_in_p0=false,
    use_in_T0=true,
    p0=pout_start_S2,
    R=1e-3)
    annotation (Placement(transformation(extent={{2,160},{22,180}})));
  Sources.PumpInput P201_input(omega=P201omega, q_m3h=P201qm3h)
    annotation (Placement(transformation(extent={{-118,-10},{-98,10}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=0.08e5,
    duration=2000,
    offset=pin_start_S2,
    startTime=50000)
    annotation (Placement(transformation(extent={{-158,184},{-138,204}})));
  Modelica.Blocks.Sources.BooleanTable FV206_OnOff(table={3e4}, startValue=FV206_state)
    "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-52,84})));
  Modelica.Blocks.Sources.BooleanTable FV203_OnOff(table={3e4 - 1}, startValue=FV203_state)
    "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-20})));
  Modelica.Blocks.Sources.BooleanTable FV207_OnOff(table={3e4}, startValue=FV207_state)
    "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,-92})));
  Modelica.Blocks.Sources.BooleanTable FV201_OnOff(table={3e4 - 1}, startValue=FV201_state)
    "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-168,52})));
  Modelica.Blocks.Sources.BooleanTable Loading(table={3e4}, startValue=Load)
    "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={52,60})));
  Modelica.Blocks.Logical.Not not3
    annotation (Placement(transformation(extent={{20,20},{0,40}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (Line(
      points={{-80,115.5},{-80,120.375},{-79.85,120.375},{-79.85,125.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (Line(
      points={{-80,100},{-80,115.5}},
      color={140,56,54},
      thickness=0.5));
  connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (Line(
      points={{-80,-13.6},{-80,-30}},
      color={140,56,54},
      thickness=0.5));

  connect(TT202.inlet,PT202. inlet) annotation (Line(
      points={{-20.4,98},{-20.4,86}},
      color={140,56,54},
      thickness=0.5));

  connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (Line(
      points={{-20,140},{-20,98},{-20.4,98}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, PL_S200_rCD_cold.inlet) annotation (Line(
      points={{-98,170},{-80,170},{-80,160}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (Line(
      points={{-80,140},{-80,128.625},{-79.85,128.625},{-79.85,125.25}},
      color={140,56,54},
      thickness=0.5));
  connect(D201.outlet, PL_S200_D201_High.inlet) annotation (Line(
      points={{118,-63},{132,-63},{132,-80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
      Line(
      points={{170,-108},{188,-108},{188,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
      Line(
      points={{150,-108},{132,-108},{132,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D202_High.inlet, D202.outlet) annotation (Line(
      points={{188,-80},{188,-63},{202,-63}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (Line(
      points={{150,-126},{134,-126},{134,-133},{118,-133}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (Line(
      points={{170,-126},{186,-126},{186,-133},{202,-133}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (Line(
      points={{52,-168},{128,-168},{128,-133},{118,-133}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (Line(
      points={{50,-108},{132,-108},{132,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (Line(
      points={{-140,-20},{-140,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (Line(
      points={{-140,10},{-140,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (Line(
      points={{-80,18},{-80,5.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (Line(
      points={{-140,40},{-140,70},{-116,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (Line(
      points={{-80,80},{-80,56}},
      color={140,56,54},
      thickness=0.5));
  connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (Line(
      points={{-80,44},{-80,38}},
      color={140,56,54},
      thickness=0.5));
  connect(FV202.outlet, FV201.inlet) annotation (Line(
      points={{-104,70},{-80,70},{-80,56}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.outlet, P201.inlet) annotation (Line(
      points={{-58,12},{-80,12},{-80,5.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (Line(
      points={{-80,-50},{-80,-64}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.inlet, FV209.inlet) annotation (Line(
      points={{-58,-56},{-80,-56},{-80,-64}},
      color={140,56,54},
      thickness=0.5));
  connect(FV207.outlet, FV203.inlet) annotation (Line(
      points={{-46,-56},{-20,-56},{-20,-26}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.inlet, FV203.outlet) annotation (Line(
      points={{-46,12},{-20,12},{-20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PT202.inlet, FV203.outlet) annotation (Line(
      points={{-20.4,86},{-20,86},{-20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(FV206.u, FV206_Status.activePort) annotation (Line(points={{-52,13.92},{-52,18.46},{
          -49.35,18.46},{-49.35,23}},                  color={255,0,255}));
  connect(FCV201_theta.y, FCV201.opening) annotation (Line(points={{-159,0},{-153.5,
          0},{-153.5,4.44089e-16},{-148,4.44089e-16}}, color={0,0,127}));
  connect(FV209.u, FV209_Status.activePort)
    annotation (Line(points={{-81.92,-70},{-96.5,-70}}, color={255,0,255}));
  connect(FV207.u, FV207_Status.activePort)
    annotation (Line(points={{-52,-57.92},{-52,-66.8}}, color={255,0,255}));
  connect(FV202_Status.activePort, FV202.u) annotation (Line(points={{-111,82.65},{-111,74},{-110,74},{-110,71.92}},
                                             color={255,0,255}));
  connect(FV203.u, FV203_Status.activePort) annotation (Line(points={{-18.08,-20},
          {-16,-20},{-16,-14},{0,-14},{0,-20},{-1.00625,-20},{-1.00625,-20.25},{
          -4.4625,-20.25}}, color={255,0,255}));
  connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
      Line(
      points={{-140,-40},{-140,-168},{32,-168}},
      color={140,56,54},
      thickness=0.5));
  connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (Line(
      points={{-80,-76},{-80,-108},{-140,-108},{-140,-168},{32,-168}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_D201_FT201.inlet, FT201.outlet) annotation (Line(
      points={{30,-108},{-19.8,-108},{-19.8,-85.2}},
      color={140,56,54},
      thickness=0.5));
  connect(FT201.inlet, FV203.inlet) annotation (Line(
      points={{-19.8,-76.8},{-20,-56},{-20,-26}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, PL_S200_rCD_hot.outlet) annotation (Line(
      points={{2,170},{-20,170},{-20,160}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp.y, sink.in_T0)
    annotation (Line(points={{19,200},{12,200},{12,179.6}}, color={0,0,127}));
  connect(P201_input.y, P201.in_omega)
    annotation (Line(points={{-97,0},{-91.5,0},{-91.5,0.8},{-86,0.8}}, color={0,0,127}));
  connect(ramp1.y, source.in_p0)
    annotation (Line(points={{-137,194},{-112,194},{-112,178.4}}, color={0,0,127}));
  connect(FV201_Status.activePort, FV201.u) annotation (Line(points={{-94.65,49},{-85.285,49},{
          -85.285,50},{-81.92,50}},
                            color={255,0,255}));
  connect(Loading.y, not3.u)
    annotation (Line(points={{41,60},{28,60},{28,30},{22,30}}, color={255,0,255}));
  connect(not3.y, FV203_Status.activePort) annotation (Line(points={{-1,30},{-4,30},{-4,28},{-8,28},
          {-8,-14},{0,-14},{0,-20},{-1.00625,-20},{-1.00625,-20.25},{-4.4625,-20.25}}, color={255,0,
          255}));
  connect(Loading.y, FV206.u)
    annotation (Line(points={{41,60},{-52,60},{-52,13.92}}, color={255,0,255}));
  connect(Loading.y, FV207_Status.activePort)
    annotation (Line(points={{41,60},{-52,60},{-52,-66.8}}, color={255,0,255}));
  connect(not3.y, FV201.u) annotation (Line(points={{-1,30},{-16,30},{-16,32},{-32,32},{-32,40},{
          -90,40},{-90,48},{-88,48},{-88,49},{-85.285,49},{-85.285,50},{-81.92,50}}, color={255,0,
          255}));
  connect(not3.y, FV209_Status.activePort) annotation (Line(points={{-1,30},{-32,30},{-32,-62},{-88,
          -62},{-88,-70},{-96.5,-70}}, color={255,0,255}));
  connect(Loading.y, FV202.u) annotation (Line(points={{41,60},{28,60},{28,78},{-109,78},{-109,74},{-110,74},{-110,71.92}}, color={255,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-240},{280,240}})),
    experiment(
      StopTime=90000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end WaterTankSystemB;
