within MultiEnergySystem.TestFacility.Loads.Thermal.Systems;
model CoolingSingleLoad
  extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient  constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  parameter Integer np = 5 "Number of volumes in each pipe";
  parameter Integer nHX = 9 "Number of volumes in heat exchanger";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";

  // Flow Control Valve parameters
  parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.Kv "Metri Flow Coefficient" annotation (
    Dialog(tab = "Valve", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic" annotation (
    Dialog(tab = "Valve", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve = TestFacility.Data.ValveData.FCV701.dp_nom "Pressure drop between supply and return, as imposed by the differential pump" annotation (
    Dialog(tab = "Valve", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Types.Density rho_nom_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Nominal fluid density at supply" annotation (
    Dialog(tab = "Valve", group = "Characteristics"));
  parameter Real q_m3h_nom_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve = 20 + 273.15 annotation (
    Dialog(tab = "Valve", group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve = 2e5 annotation (
    Dialog(tab = "Valve", group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Density rho_start_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Start value fluid density at the inlet" annotation (
    Dialog(tab = "Valve", group = "Initialisation"));
  parameter Real q_m3h_start_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Start value volumetric flowrate in m3/h" annotation (
    Dialog(tab = "Valve", group = "Initialisation"));

  // Sudden Area Change parameters
  parameter DistrictHeatingNetwork.Types.Length D_i = 0.1 "Input diameter" annotation (
    Dialog(tab = "Sudden Area Change", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Types.Length D_o = 0.05 "Output diameter" annotation (
    Dialog(tab = "Sudden Area Change", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Types.PerUnit beta_restriction = 0.5 "Attrition coefficient for a diameter restriction" annotation (
    Dialog(tab = "Sudden Area Change", group = "Characteristics"));
  parameter DistrictHeatingNetwork.Types.PerUnit beta_increase = 1 "Attrition coefficient for a diameter increase" annotation (
    Dialog(tab = "Sudden Area Change", group = "Characteristics"));

  // EX7X1
  parameter Real EX7X1_q_m3h_hot(unit = "m3/h") = 2.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_hot = EX7X1_q_m3h_hot*980/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_hot=80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_hot=65 + 273.15;

  parameter Real EX7X1_q_m3h_cold(unit = "m3/h") = 1.5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_cold = EX7X1_q_m3h_cold*995/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Temperature T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall" annotation (
    Dialog(group = "Wall"));
  parameter DistrictHeatingNetwork.Types.Temperature TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall" annotation (
    Dialog(group = "Wall"));

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 4314.9346 "nominal heat transfer coefficient";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 11200.497 "nominal heat transfer coefficient";
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_hot = 0 "Exponent in the flow-dependency law";
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_cold = 0 "Exponent in the flow-dependency law";

  // Lengths of pipelines Cold Side

//   parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;

  // Lengths of pipelines Hot side
  parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=2.9;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
//   parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;


  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_cold = 16 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_cold = 7 + 273.15;
  // Length of pipelines Cooling side
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT7X3=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT7X3=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_TT7X4_TCV7X1=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT7X4_TCV7X1=0.65;
  parameter DistrictHeatingNetwork.Types.Length t_Users=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Users=32e-3;

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV7X1(
    redeclare model Medium = Medium,
    Kv=Kv,
    openingChar=openingChar,
    dp_nom(displayUnit="Pa") = dp_nom_valve,
    rho_nom=rho_nom_valve,
    q_m3h_nom=q_m3h_nom_valve,
    Tin_start(displayUnit="K") = Tin_start_valve,
    pin_start=pin_start_valve,
    rho_start=rho_start_valve,
    q_m3h_start=q_m3h_start_valve)
                                 "Flow Control Valve - Hot side" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={20,10})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX7X1(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    hctype_hot=hctype,
    alpha_hot=alpha_hot,
    Di_cold=TestFacility.Data.BPHEData.E701.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E701.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E701.L_cold,
    L_hot=TestFacility.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    alpha_cold=alpha_cold,
    MWall=TestFacility.Data.BPHEData.E701.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E701.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX7X1_Tin_cold,
    Tin_start_hot=EX7X1_Tin_hot,
    Tout_start_cold=EX7X1_Tout_cold,
    Tout_start_hot=EX7X1_Tout_hot,
    cpm_cold=TestFacility.Data.BPHEData.E701.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E701.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E701.t_cold,
    t_hot=TestFacility.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=gamma_nom_cold,
    gamma_nom_hot=gamma_nom_hot,
    h_cold=TestFacility.Data.BPHEData.E701.h_cold,
    h_hot=TestFacility.Data.BPHEData.E701.h_hot,
    k_cold=TestFacility.Data.BPHEData.E701.k_cold,
    k_hot=TestFacility.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=m_flow_EX7X1_cold,
    m_flow_start_hot=m_flow_EX7X1_hot,
    n=nHX,
    nPipes_cold=TestFacility.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E701.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E701.nPlates,
    pin_start_cold=EX7X1_pin_cold,
    pin_start_hot=EX7X1_pin_hot,
    pout_start_cold=EX7X1_pout_cold,
    pout_start_hot=EX7X1_pout_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E701.rhoin_nom_cold + TestFacility.Data.BPHEData.E701.rhoout_nom_cold)
        /2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E701.rhoin_nom_hot + TestFacility.Data.BPHEData.E701.rhoout_nom_hot)
        /2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=TestFacility.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={1,-48.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = Medium,
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX7X1_Tout_hot,
    Tout_start=EX7X1_Tout_hot,
    Di=Di_S700,
    n=np,
    hctype=hctype,
    nPipes=1)      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,34})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = Medium,
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX7X1_pout_hot,
    Tin_start=EX7X1_Tout_hot,
    Tout_start=EX7X1_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX7X1_q_m3h_hot,
    n=np,
    hctype=hctype,
    nPipes=1)      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-16})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = Medium,
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX7X1_pin_hot,
    Tin_start=EX7X1_Tin_hot,
    Tout_start=EX7X1_Tin_hot,
    Di=Di_S700,
    n=np,
    hctype=hctype,
    nPipes=1)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-20,10})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn1(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_cold,
    redeclare model Medium = Medium,
    L=L_TT7X4_TCV7X1,
    h=h_TT7X4_TCV7X1,
    t=t_Users,
    pin_start=EX7X1_pin_hot,
    Tin_start=EX7X1_Tin_hot,
    Tout_start=EX7X1_Tin_hot,
    Di=Di_Users,
    n=np,
    hctype=hctype,
    nPipes=1)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-20,-90})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn2(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_cold,
    redeclare model Medium = Medium,
    L=L_rUsersIn_TT7X3,
    h=h_rUsersIn_TT7X3,
    t=t_Users,
    pin_start=EX7X1_pin_hot,
    Tin_start=EX7X1_Tin_hot,
    Tout_start=EX7X1_Tin_hot,
    Di=Di_Users,
    n=np,
    hctype=hctype,
    nPipes=1)      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-96})));

  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X1(redeclare model Medium = Medium, T_start=EX7X1_Tout_hot,
    p_start=EX7X1_pout_hot)
                           "Temperature sensor at the outlet of EX7X1 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,68})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X2(redeclare model Medium = Medium, T_start=EX7X1_Tin_hot,
      p_start=EX7X1_pin_hot) "Temperature sensor at the inlet of EX7X1 - hot side"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,66})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X4(redeclare model Medium = Medium,
    T_start=EX7X1_Tout_cold,
    p_start(displayUnit="Pa") = EX7X1_pout_cold)
                                 "Temperature sensor at the outlet of EX7X1 - cold side"   annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,-73})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X3(redeclare model Medium = Medium,
    T_start=EX7X1_Tin_cold,
    p_start(displayUnit="Pa") = EX7X1_pin_cold)
                                 "Temperature sensor at the inlet of EX7X1 - cold side" annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={22,-72})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=EX7X1_Tout_hot, p_start=EX7X1_pout_hot)
                                                                                                        "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,56})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT7X1 "Pressure sensor at the outlet of EX7X1 - hot side"   annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,78})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT7X2 "Pressure sensor at the inlet of EX7X1 - hot side"   annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,74})));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort(n=np)
                                                                 annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealInput theta "Opening valve" annotation (
    Placement(visible = true,
              transformation(extent={{60,0},{40,20}}),
              iconTransformation(origin={-110,60},   extent = {{-10, -10}, {10, 10}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot "Inlet connector at hot side"   annotation (
    Placement(visible = true, transformation(origin={-20,129}, extent = {{-10, -10}, {10, 10}}, rotation = 0),
              iconTransformation(origin={-48,115}, extent={{-15,-15},{15,15}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot "Outlet connector at hot side"  annotation (
    Placement(visible = true, transformation(origin={20,129},  extent = {{-10, -10}, {10, 10}}, rotation = 0),
              iconTransformation(origin={51,115},    extent={{-15,-15},{15,15}},      rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet incold "Inlet connector at cold side" annotation (
    Placement(visible = true, transformation(origin={20,-130},extent={{-10, -10}, {10, 10}}, rotation = 0),
              iconTransformation(origin={49,-115}, extent={{-15,-15},{15,15}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold "Outlet connector at cold side" annotation (
    Placement(visible = true, transformation(extent={{-30,-140},{-10,-120}}, rotation = 0),
              iconTransformation(origin={-50,-115}, extent={{-15,-15},{15,15}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealOutput FT7X1_FT annotation (Placement(transformation(extent={{100,35},{120,55}}), iconTransformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Interfaces.RealOutput TT7X1_TT annotation (Placement(transformation(extent={{100,50},{120,70}}), iconTransformation(extent={{100,60},{120,80}})));
  Modelica.Blocks.Interfaces.RealOutput TT7X3_TT annotation (Placement(transformation(extent={{100,-85},{120,-65}}), iconTransformation(extent={{100,20},{120,40}})));
  Modelica.Blocks.Interfaces.RealOutput TT7X4_TT annotation (Placement(transformation(extent={{100,-105},{120,-85}}),iconTransformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Interfaces.RealOutput TT7X2_TT annotation (Placement(transformation(extent={{100,95},{120,115}}),iconTransformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealOutput PT7X2_PT annotation (Placement(transformation(extent={{100,80},{120,100}}),  iconTransformation(extent={{100,-60},{120,-40}})));
  Modelica.Blocks.Interfaces.RealOutput PT7X1_PT annotation (Placement(transformation(extent={{100,65},{120,85}}),  iconTransformation(extent={{100,-40},{120,-20}})));
equation


  connect(PL701_FCV701_FT701.inlet,FCV7X1. outlet) annotation (Line(
      points={{20,24},{20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV7X1.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{20,1.77636e-15},{20,-6}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX7X1. outhot) annotation (Line(
      points={{20,-26},{20,-39.75},{21.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{20,53},{20,44}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT7X2. inlet) annotation (Line(
      points={{-20,20},{-20,66}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X2.inlet,PT7X2. inlet) annotation (Line(
      points={{-20,66},{-20,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX7X1. inhot) annotation (Line(
      points={{-20,3.55271e-15},{-19.3,3.55271e-15},{-19.3,-39.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT7X1.inlet,TT7X1. inlet) annotation (Line(
      points={{20,78},{20,68}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X1.inlet,FT701. outlet) annotation (Line(
      points={{20,68},{20,59}},
      color={140,56,54},
      thickness=0.5));
  connect(EX7X1.outcold,TT7X4. inlet) annotation (Line(
      points={{-19.3,-57.25},{-19.6,-57.25},{-19.6,-73}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X3.inlet,EX7X1. incold) annotation (Line(
      points={{19.6,-72},{19.6,-58.125},{21.3,-58.125},{21.3,-57.25}},
      color={140,56,54},
      thickness=0.5));
  connect(MultiPort, MultiPort) annotation (Line(points={{-110,0},{-110,0}}, color={255,238,44}));
  connect(PL701_TT702_SourceIn1.outlet, outcold) annotation (Line(
      points={{-20,-100},{-20,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn1.inlet, TT7X4.inlet) annotation (Line(
      points={{-20,-80},{-20,-76.5},{-19.6,-76.5},{-19.6,-73}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn2.outlet, TT7X3.inlet) annotation (Line(
      points={{20,-86},{19.6,-86},{19.6,-72}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn2.inlet, incold) annotation (Line(
      points={{20,-106},{20,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X3_TT, TT7X3_TT) annotation (Line(points={{110,-75},{110,-75}}, color={0,0,127}));
  connect(PT7X2.inlet, inhot) annotation (Line(
      points={{-20,74},{-20,129}},
      color={140,56,54},
      thickness=0.5));
  connect(PT7X1.inlet, outhot) annotation (Line(
      points={{20,78},{20,129}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn1.wall, MultiPort) annotation (Line(
      points={{-24.1,-90},{-40,-90},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.wall, MultiPort) annotation (Line(
      points={{15.9,-16},{-40,-16},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.wall, MultiPort) annotation (Line(
      points={{-24.1,10},{-40,10},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL701_TT702_SourceIn2.wall, MultiPort) annotation (Line(
      points={{15.9,-96},{-40,-96},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PT7X2.p, PT7X2_PT) annotation (Line(points={{-28.5,74},{-30.5,74},{-30.5,114.5},{94.5,114.5},{94.5,90},{110,90}}, color={0,0,127}));
  connect(PT7X1.p, PT7X1_PT) annotation (Line(points={{28.5,78},{30,78},{30,113},{93.5,113},{93.5,75},{110,75}}, color={0,0,127}));
  connect(TT7X1.T, TT7X1_TT) annotation (Line(points={{28.5,68},{31.5,68},{31.5,111.5},{92.5,111.5},{92.5,60},{110,60}}, color={0,0,127}));
  connect(TT7X2.T, TT7X2_TT) annotation (Line(points={{-28.5,66},{-31.5,66},{-31.5,116},{95.5,116},{95.5,105},{110,105}}, color={0,0,127}));
  connect(theta, FCV7X1.opening) annotation (Line(points={{50,10},{28,10}}, color={0,0,127}));
  connect(TT7X4.T, TT7X4_TT) annotation (Line(points={{-29.8,-73},{-33,-73},{-33,-116},{97,-116},{97,-95},{110,-95}}, color={0,0,127}));
  connect(TT7X3.T, TT7X3_TT) annotation (Line(points={{29.8,-72},{30,-72},{30,-115},{96,-115},{96,-75},{110,-75}}, color={0,0,127}));
  connect(PL701_FCV701_FT701.wall, MultiPort) annotation (Line(
      points={{15.9,34},{3,34},{3,-16},{-40,-16},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(FT701.m_flow, FT7X1_FT) annotation (Line(points={{25,59.5},{25,63},{33,63},{33,110},{91,110},{91,45},{110,45}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={1,1})),
                                                                         Icon(graphics={
                             Bitmap(
          extent={{-50,-40},{50,60}},
          imageSource=
              "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",
          fileName=
              "modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/radiator.png")}));
end CoolingSingleLoad;
