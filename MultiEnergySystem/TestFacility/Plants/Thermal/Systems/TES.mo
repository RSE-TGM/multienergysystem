within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model TES
  extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
  extends TestFacility.Interfaces.SystemInterfaceBaseIII(MultiPort(n=n));
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  constant Real pi = Modelica.Constants.pi;

  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";
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
  parameter Boolean Load = true;
  final parameter Boolean Unload = not Load;
  parameter Real Load2Unload = 4e5;
  parameter Real Unload2Load = 5e5;
  parameter Integer nTank = 9 "Number of volumes in stratified tank";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 1.8e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
  final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 75 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 76 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
  parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 4;
  final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:, :] = [0, 2*pi*30; 4.2e5, 2*pi*30; 1e6, 2*pi*30];
  parameter Real P201qm3h[:, :] = [0, 14.5; 100, 14.5];
  parameter Real FCV201theta[:, :] = [0, 1; 4.1e5, 1; 4.1e5, 0.5; 1e6, 0.5];
  // Pipe length
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
  parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
  parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
  parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
  parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
  parameter Integer ny(min=0) = 4 "Number of output connections";

  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
    H=4,
    Tin_start=Tin_start_S2,
    Tout_start=Tout_start_S2,
    n=nTank,
    D=1.7,
    T_start(displayUnit="K") = 70 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)                                                                                                                                                                                                         "Stratified tank 1" annotation (
    Placement(transformation(extent={{14,-338},{-42,-226}})));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P201(
    redeclare model Medium = Medium,
    pout_start(displayUnit="Pa") = 3e5,
    Tin_start(displayUnit="K") = TestFacility.Data.PumpData.P201.Tin_start,
    Tout_start=TestFacility.Data.PumpData.P201.Tout_start,
    a=TestFacility.Data.PumpData.P201.a,
    b=TestFacility.Data.PumpData.P201.b,
    m_flow_start=m_flow_S2,
    dpnom=TestFacility.Data.PumpData.P201.dpnom,
    etaelec=TestFacility.Data.PumpData.P201.etaelec,
    etamech=TestFacility.Data.PumpData.P201.etamech,
    etanom=TestFacility.Data.PumpData.P201.etanom,
    hin_start=TestFacility.Data.PumpData.P201.hin_start,
    m_flow_nom=TestFacility.Data.PumpData.P201.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.P201.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    headnom=TestFacility.Data.PumpData.P201.headnom,
    qnom_inm3h=TestFacility.Data.PumpData.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.P201.rhonom,
    headmax=TestFacility.Data.PumpData.P201.headnommax,
    headmin=TestFacility.Data.PumpData.P201.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.P201.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.P201.qnommax_inm3h,
    use_in_omega=true)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin={-18,-70})));
  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
    H=4,
    Tin_start=Tin_start_S2,
    Tout_start=Tout_start_S2,
    n=nTank,
    D=1.7,
    T_start(displayUnit="K") = 70 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)                                                                                                                                                                                                         "Stratified tank 2" annotation (
    Placement(transformation(extent={{76,-338},{132,-226}})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(redeclare model Medium = Medium, T_start=Tin_start_S2, p_start=pin_start_S2)     "Temperature sensor at the inlet of pump 201" annotation (
    Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin={-19.75,71.25})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
    Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin={-20,51.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-18,30})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV201.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin={-74,-60})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL3,
    t=L_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                      annotation (
    Placement(transformation(extent={{10,10},{-10,-10}},      rotation = 270, origin={-74,-30})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-18,-102})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL4,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                      annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin={-74,-90})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(redeclare model Medium = Medium, T_start=Tout_start_S2, p_start=pout_start_S2)     "Temperature sensor at the outlet of System 200" annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin={24,70})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
    Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin={24,0})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_tank,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={62,-274})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_tank,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin={28,-274})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={46,-302})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin={46,-318})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL6,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{-10,-10},{10,10}},      rotation = 0, origin={-46,-352})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_D201_FT201,
    h=h_S2_D201_FT201,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{10,-10},{-10,10}},      rotation = 0, origin={-56,-302})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S2_PL1,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-18,-32})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin={-48,10})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin={-48,36})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin={-18,-10})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status annotation (
    Placement(transformation(extent={{-34,-20},{-54,0}})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin={2,-48})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin={2,-26})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin={-18,-130})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={-44,-130})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin={2,-116})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin={22,-80})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={42,-80})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(redeclare model Medium = Medium, T_start=Tout_start_S2)   "Flow sensor at the outlet of system S200" annotation (
    Placement(transformation(extent = {{7, 7}, {-7, -7}}, rotation = 90, origin={25,-141})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={2,-138})));
  Modelica.Blocks.Logical.Not not3 annotation (
    Placement(transformation(extent={{138,-48},{118,-28}})));
  Modelica.Blocks.Interfaces.RealOutput T_D201[ny] annotation (Placement(transformation(extent={{-106,-290},{-126,-270}}),
                                                                                                                       iconTransformation( origin={-6,248},               extent={{106,-290},{126,-270}})));
  Modelica.Blocks.Interfaces.RealOutput T_D202[ny] annotation (Placement(transformation(extent={{172,-296},{192,-276}}),
                                                                                                                       iconTransformation(origin={0,20},    extent={{100,-80},{120,-60}})));
equation
  connect(PT201.inlet,TT201. inlet) annotation (
    Line(points={{-18,51.5},{-18,60.375},{-17.85,60.375},{-17.85,71.25}},                  color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (
    Line(points={{-18,40},{-18,51.5}},           color = {140, 56, 54}, thickness = 0.5));
  connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (
    Line(points={{-18,-79.6},{-18,-92}},          color = {140, 56, 54}, thickness = 0.5));
  connect(TT202.inlet,PT202. inlet) annotation (
    Line(points={{21.6,70},{21.6,0}},              color = {140, 56, 54}, thickness = 0.5));
  connect(D201.outlet,PL_S200_D201_High. inlet) annotation (
    Line(points={{14,-247},{28,-247},{28,-264}},              color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
    Line(points={{56,-302},{62,-302},{62,-284}},              color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
    Line(points={{36,-302},{28,-302},{28,-284}},              color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D202_High.inlet,D202. outlet) annotation (
    Line(points={{62,-264},{62,-247},{76,-247}},              color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (
    Line(points={{36,-318},{20,-318},{20,-317},{14,-317}},                  color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (
    Line(points={{56,-318},{60,-318},{60,-317},{76,-317}},                  color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (
    Line(points={{-36,-352},{28,-352},{28,-317},{14,-317}},                 color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (
    Line(points={{-74,-80},{-74,-70}},          color = {140, 56, 54}, thickness = 0.5));
  connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (
    Line(points={{-74,-50},{-74,-40}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (
    Line(points={{-18,-42},{-18,-60.4}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (
    Line(points={{-74,-20},{-74,10},{-54,10}},                color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (
    Line(points={{-18,20},{-18,-4}},            color = {140, 56, 54}, thickness = 0.5));
  connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (
    Line(points={{-18,-16},{-18,-22}},          color = {140, 56, 54}, thickness = 0.5));
  connect(FV202.outlet,FV201. inlet) annotation (
    Line(points={{-42,10},{-18,10},{-18,-4}},                 color = {140, 56, 54}, thickness = 0.5));
  connect(FV206.outlet,P201. inlet) annotation (
    Line(points={{-4,-48},{-18,-48},{-18,-60.4}},               color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (
    Line(points={{-18,-112},{-18,-124}},        color = {140, 56, 54}, thickness = 0.5));
  connect(FV207.inlet,FV209. inlet) annotation (
    Line(points={{-4,-116},{-18,-116},{-18,-124}},            color = {140, 56, 54}, thickness = 0.5));
  connect(FV207.outlet,FV203. inlet) annotation (
    Line(points={{8,-116},{22,-116},{22,-86}},                color = {140, 56, 54}, thickness = 0.5));
  connect(FV206.inlet,FV203. outlet) annotation (
    Line(points={{8,-48},{22,-48},{22,-74}},                  color = {140, 56, 54}, thickness = 0.5));
  connect(PT202.inlet,FV203. outlet) annotation (
    Line(points={{21.6,0},{22,0},{22,-74}},                     color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
    Line(points={{-74,-100},{-74,-352},{-56,-352}},           color = {140, 56, 54}, thickness = 0.5));
  connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (
    Line(points={{-18,-136},{-18,-192},{-74,-192},{-74,-352},{-56,-352}},                 color = {140, 56, 54}, thickness = 0.5));
  connect(FT201.inlet,FV203. inlet) annotation (
    Line(points={{22.2,-136.8},{22,-116},{22,-86}},               color = {140, 56, 54}, thickness = 0.5));
  connect(FV206_Status.activePort,FV206. u) annotation (
    Line(points={{2,-37.5},{2,-46.08}},              color = {255, 0, 255}));
  connect(FV207_Status.activePort,FV207. u) annotation (
    Line(points={{2,-126.5},{2,-117.92}},            color = {255, 0, 255}));
  connect(not3.y,FV201. u) annotation (
    Line(points={{117,-38},{64,-38},{64,-18},{-26,-18},{-26,-10},{-19.92,-10}},                            color = {255, 0, 255}));
  connect(not3.y,FV203. u) annotation (
    Line(points={{117,-38},{64,-38},{64,-58},{28,-58},{28,-80},{23.92,-80}},                               color = {255, 0, 255}));
  connect(FV203_Status.activePort,FV203. u) annotation (
    Line(points={{30.5,-80},{23.92,-80}},            color = {255, 0, 255}));
  connect(FV201_Status.activePort,FV201. u) annotation (
    Line(points={{-32.5,-10},{-19.92,-10}},          color = {255, 0, 255}));
  connect(not3.y,FV209. u) annotation (
    Line(points={{117,-38},{64,-38},{64,-150},{-26,-150},{-26,-130},{-19.92,-130}},                        color = {255, 0, 255}));
  connect(FV209_Status.activePort,FV209. u) annotation (
    Line(points={{-32.5,-130},{-19.92,-130}},        color = {255, 0, 255}));
  connect(FV202_Status.activePort,FV202. u) annotation (
    Line(points={{-48,24.5},{-48,11.92}},            color = {255, 0, 255}));
  connect(PL_S200_D201_High.outlet,PL_S200_D201_FT201. inlet) annotation (
    Line(points={{28,-284},{28,-302},{-46,-302}},             color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S200_D201_FT201.outlet,FT201. outlet) annotation (
    Line(points={{-66,-302},{-70,-302},{-70,-202},{22.2,-202},{22.2,-145.2}},                   color = {140, 56, 54}, thickness = 0.5));
  connect(status, not3.u) annotation (Line(points={{-110,10},{-88,10},{-88,-108},{158,-108},{158,-38},{140,-38}}, color={255,0,255}));
  connect(status, FV202.u) annotation (Line(points={{-110,10},{-84,10},{-84,18},{-48,18},{-48,11.92}}, color={255,0,255}));
  connect(status, FV207.u) annotation (Line(points={{-110,10},{-88,10},{-88,-122},{2,-122},{2,-117.92}}, color={255,0,255}));
  connect(status, FV206.u) annotation (Line(points={{-110,10},{-88,10},{-88,-44},{2,-44},{2,-46.08}}, color={255,0,255}));
  connect(outlet, TT202.inlet) annotation (Line(
      points={{20,110},{20,90},{21.6,90},{21.6,70}},
      color={140,56,54},
      thickness=0.5));
  connect(inlet, TT201.inlet) annotation (Line(
      points={{-20,110},{-20,71.25},{-17.85,71.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_FCV201_FV202.wall, MultiPort) annotation (Line(points={{-78.1,-30},{-96,-30},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_FV209_FCV201.wall, MultiPort) annotation (Line(points={{-78.1,-90},{-96,-90},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_P201_FV209.wall, MultiPort) annotation (Line(points={{-22.1,-102},{-96,-102},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_FV201_P201.wall, MultiPort) annotation (Line(points={{-22.1,-32},{-36,-32},{-36,-46},{-96,-46},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_TT201_FV201.wall, MultiPort) annotation (Line(points={{-22.1,30},{-96,30},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_D201_FT201.wall, MultiPort) annotation (Line(points={{-56,-297.9},{-56,-268},{-96,-268},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_FV209_D201.wall, MultiPort) annotation (Line(points={{-46,-347.9},{-46,-340},{-96,-340},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_D201_D202_Low.wall, MultiPort) annotation (Line(points={{46,-322.1},{46,-340},{-96,-340},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_D201_D202_High.wall, MultiPort) annotation (Line(points={{46,-297.9},{46,-286},{-56,-286},{-56,-268},{-96,-268},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_D202_High.wall, MultiPort) annotation (Line(points={{57.9,-274},{56,-274},{56,-220},{-96,-220},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S200_D201_High.wall, MultiPort) annotation (Line(points={{32.1,-274},{40,-274},{40,-220},{-96,-220},{-96,-70},{-110,-70}}, color={255,238,44}));
  connect(FT201.m_flow, m_flow_) annotation (Line(points={{29.2,-145.9},{29.2,-158},{74,-158},{74,70},{110,70}}, color={0,0,127}));
  connect(omega, P201.in_omega) annotation (Line(points={{-110,70},{-52,70},{-52,-68},{-24,-68},{-24,-65.2}}, color={0,0,127}));
  connect(theta, FCV201.opening) annotation (Line(points={{-110,50},{-92,50},{-92,-60},{-82,-60}}, color={0,0,127}));
  connect(TT202.T, TTout) annotation (Line(points={{31.8,70},{50,70},{50,30},{110,30}}, color={0,0,127}));
  connect(TT201.T, TTin) annotation (Line(points={{-25.925,71.25},{-32,71.25},{-32,78},{68,78},{68,50},{110,50}}, color={0,0,127}));
  connect(PT201.p, PTin) annotation (Line(points={{-26.5,51.5},{-34,51.5},{-34,58},{38,58},{38,10},{110,10}}, color={0,0,127}));
  connect(PT202.p, PTout) annotation (Line(points={{31.8,0},{40,0},{40,-10},{110,-10},{110,-10}}, color={0,0,127}));
  connect(D202.T1, T_D202[1]) annotation (Line(points={{133.12,-313.5},{168,-313.5},{168,-289.75},{182,-289.75}}, color={0,0,127}));
  connect(D202.T2, T_D202[2]) annotation (Line(points={{132.56,-292.5},{164,-292.5},{164,-287.25},{182,-287.25}}, color={0,0,127}));
  connect(D202.T3, T_D202[3]) annotation (Line(points={{132.56,-271.5},{164,-271.5},{164,-284.75},{182,-284.75}}, color={0,0,127}));
  connect(D202.T4, T_D202[4]) annotation (Line(points={{132.56,-250.5},{168,-250.5},{168,-282.25},{182,-282.25}}, color={0,0,127}));
  connect(D201.T1, T_D201[1]) annotation (Line(points={{-43.12,-313.5},{-86,-313.5},{-86,-283.75},{-116,-283.75}}, color={0,0,127}));
  connect(D201.T2, T_D201[2]) annotation (Line(points={{-42.56,-292.5},{-82,-292.5},{-82,-281.25},{-116,-281.25}}, color={0,0,127}));
  connect(D201.T3, T_D201[3]) annotation (Line(points={{-42.56,-271.5},{-88,-271.5},{-88,-278.75},{-116,-278.75}}, color={0,0,127}));
  connect(D201.T4, T_D201[4]) annotation (Line(points={{-42.56,-250.5},{-90,-250.5},{-90,-276.25},{-116,-276.25}}, color={0,0,127}));
  annotation (Icon(                                             graphics={Bitmap(
          extent={{-48,-46},{48,46}},
          imageSource="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",
          fileName="modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/2ppk0w6u.png")}),
                                                                 Diagram(coordinateSystem(extent={{-240,-360},{240,240}}, preserveAspectRatio=false)));
end TES;
