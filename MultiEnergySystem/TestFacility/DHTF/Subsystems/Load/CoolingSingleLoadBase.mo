within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
partial model CoolingSingleLoadBase "S900 - Base load model"
  extends DistrictHeatingNetwork.Icons.Water.LoadModel;

//-------------------------------
  // Declaration of fluid
  //-------------------------------
  replaceable model MediumHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model MediumCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

//-------------------------------
  // Heat Exchanger heat transfer model
  //-------------------------------
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient  constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;

  parameter Integer np = 5 "Number of volumes in each pipe";
  parameter Integer nHX = 9 "Number of volumes in heat exchanger" annotation(Dialog(group = "HX"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient";

// Flow Control Valve parameters
  parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.Kv "Metri Flow Coefficient" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_FCV = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic   "opening characteristic" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve = TestFacility.Data.ValveData.FCV701.dp_nom "Nominal pressure drop in the valve" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Types.Density rho_nom_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Nominal fluid density at supply" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter Real q_m3h_nom_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve = 20 + 273.15 annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve = 2e5 annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter DistrictHeatingNetwork.Types.Density rho_start_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Start value fluid density at the inlet" annotation (
    Dialog(tab = "Valve", group = "FCV"));
  parameter Real q_m3h_start_valve(unit = "m3/h") = EX7X1_q_m3h_hot "Start value volumetric flowrate in m3/h" annotation (
    Dialog(tab = "Valve", group = "FCV"));

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
  parameter Real EX7X1_q_m3h_hot(unit = "m3/h") = 2.5 "hot mass flow - start value" annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_hot = EX7X1_q_m3h_hot*980/3600  annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_hot=2.5e5 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_hot=2.4e5 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_hot=80 + 273.15 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_hot=65 + 273.15 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));

  parameter Real EX7X1_q_m3h_cold(unit = "m3/h") = 1.5 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_cold = EX7X1_q_m3h_cold*995/3600 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_cold=2.2e5 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_cold=2e5 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_cold=7 + 273.15 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));
  parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_cold=14 + 273.15 annotation(Dialog(tab = "Initialization", group= "Heat exchanger"));

  parameter DistrictHeatingNetwork.Types.Temperature T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall" annotation (
    Dialog(tab = "Initialization", group = "Wall"));
  parameter DistrictHeatingNetwork.Types.Temperature TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall" annotation (
    Dialog(tab = "Initialization", group = "Wall"));

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 4314.9346 "nominal heat transfer coefficient" annotation(Dialog(group = "HX"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 11200.497 "nominal heat transfer coefficient" annotation(Dialog(group = "HX"));
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_hot = 0 "Exponent in the flow-dependency law" annotation(Dialog(group = "HX"));
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_cold = 0 "Exponent in the flow-dependency law" annotation(Dialog(group = "HX"));

// Lengths of pipelines Cold Side
  //   parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
  //   parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;
  // Lengths of pipelines Hot side
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3 "Inlet diameter - hot side" annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3 "Tickness - hot side" annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_HX7X1_TT7X2_SourceIn=2.9 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_HX7X1_TT7X2_SourceIn=2.5 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_HX7X1_SourceOut_FCV7X1=0.6 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_HX7X1_SourceOut_FCV7X1=0 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length L_FCV7X1_FT7X1=2.5 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));
  parameter DistrictHeatingNetwork.Types.Length h_FCV7X1_FT7X1=0 annotation(Dialog(tab = "Pipe", group = "Dimensions - hot side"));

// Length of pipelines Cooling side
  parameter DistrictHeatingNetwork.Types.Length t_Users=1.5e-3 "Tickness - cold side" annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));
  parameter DistrictHeatingNetwork.Types.Length Di_Users=51e-3 "Inlet diameter - cold side" annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT7X3=1.65 + 0.45 annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT7X3=-1.65*0.1 annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));
  parameter DistrictHeatingNetwork.Types.Length L_TT7X4_TCV7X1=0.65 annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));
  parameter DistrictHeatingNetwork.Types.Length h_TT7X4_TCV7X1=0.65 annotation(Dialog(tab = "Pipe", group = "Dimensions - cold side"));

// Temperature Control Valve parameters
  parameter Real Kv_TCV(unit = "m3/h") = TestFacility.Data.ValveData.TCV701.Kv "Metri Flow Coefficient" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_TCV = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic "opening characteristic" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve_TCV = TestFacility.Data.ValveData.TCV701.dp_nom "Nominal pressure drop in the valve" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Types.Density rho_nom_valve_TCV = TestFacility.Data.ValveData.TCV701.rho_nom "Nominal fluid density at supply" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter Real q_m3h_nom_valve_TCV(unit = "m3/h") = TestFacility.Data.ValveData.TCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve_TCV = 20 + 273.15 annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve_TCV = 2e5 annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter DistrictHeatingNetwork.Types.Density rho_start_valve_TCV = TestFacility.Data.ValveData.TCV701.rho_nom "Start value fluid density at the inlet" annotation (
    Dialog(tab = "Valve", group = "TCV"));
  parameter Real q_m3h_start_valve_TCV(unit = "m3/h") = EX7X1_q_m3h_cold "Start value volumetric flowrate in m3/h" annotation (
    Dialog(tab = "Valve", group = "TCV"));

//-------------------------------
  // Controllers' parameters
  //-------------------------------
  //   parameter Real Kp_TT7X1 = -0.001 "proportional gain for temperature controller" annotation(Dialog(group="Controller Parameters"));
  //   parameter Real Ti_TT7X1 = 40 "integral time for temperature controller" annotation(Dialog(group="Controller Parameters"));
  //   parameter Real Kp_PtEX7X1 = 0.113 "proportional gain for thermal power controller" annotation(Dialog(group="Controller Parameters"));
  //   parameter Real Ti_PtEX7X1 = 0.268 "integral time for thermal power controller" annotation(Dialog(group="Controller Parameters"));
  //   parameter Real Ki_PtEX7X1 = 1 "integral gain for thermal power controller" annotation(Dialog(group="Controller Parameters"));
  //   parameter Real y_start_PI_TT(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(group="Initialization"));
  //   parameter Real y_start_PI_Pt(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(group="Initialization"));
  //   parameter Real y_start_I_m_flow(min = 0, max = 2) = 0.5 "Nominal output" annotation(Dialog(group="Initialization"));
  //   parameter Modelica.Blocks.Types.Init initType_PI = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(group="Initialization"));
  //   parameter Modelica.Blocks.Types.Init initType_I = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(group="Initialization"));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV7X1(
    redeclare model Medium = MediumHot,
    Kv=TestFacility.Data.ValveData.FCV701.Kv,
    openingChar=openingChar_FCV,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV701.dp_nom,
    rho_nom=TestFacility.Data.ValveData.FCV701.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.FCV701.q_nom_m3h,
    Tin_start(displayUnit="K") = Tin_start_valve,
    pin_start=pin_start_valve,
    rho_start=rho_start_valve,
    q_m3h_start=q_m3h_start_valve)
                                 "Flow Control Valve - Hot side" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={20,37.5})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX7X1(
    redeclare model Medium = MediumHot,
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
    u_nom_hot=TestFacility.Data.BPHEData.E701.u_nom_hot,
    T1_wall_start=T1_wall_start,
    TN_wall_start=TN_wall_start)        annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={1,-21.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S700_FCV7X1_FT7X1(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = MediumHot,
    L=L_FCV7X1_FT7X1,
    h=h_FCV7X1_FT7X1,
    t=t_S700,
    pin_start=EX7X1_pout_hot - 0.5e5,
    Tin_start=EX7X1_Tout_hot,
    Tout_start=EX7X1_Tout_hot,
    Di=Di_S700,
    n=np,
    hctype=hctype,
    nPipes=1,
    cf=cf)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,64.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S700_OutHot_FCV7X1(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = MediumHot,
    L=L_HX7X1_SourceOut_FCV7X1,
    h=h_HX7X1_SourceOut_FCV7X1,
    t=t_S700,
    pin_start=EX7X1_pout_hot,
    Tin_start=EX7X1_Tout_hot,
    Tout_start=EX7X1_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX7X1_q_m3h_hot,
    n=np,
    hctype=hctype,
    nPipes=1,
    cf=cf)    "Pipeline connecting the outlet of the hotside of the heat exchanger the valve FCV7X1" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,11.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S700_TT7X2_InHot(
    allowFlowReversal=false,
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_hot,
    redeclare model Medium = MediumHot,
    L=L_HX7X1_TT7X2_SourceIn,
    h=h_HX7X1_TT7X2_SourceIn,
    t=t_S700,
    pin_start=EX7X1_pin_hot,
    Tin_start=EX7X1_Tin_hot,
    Tout_start=EX7X1_Tin_hot,
    Di=Di_S700,
    n=np,
    hctype=hctype,
    nPipes=1,
    cf=cf, u_nom = 2.5)    "Pipe connecting sensors 7x2 with the inlet of the hot side of the heat exchanger" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-20,65.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S700_TT7X4_TCV7X1(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_cold,
    redeclare model Medium = MediumCold,
    L=L_TT7X4_TCV7X1,
    h=h_TT7X4_TCV7X1,
    t=t_Users,
    pin_start=EX7X1_pout_cold,
    Tin_start=EX7X1_Tout_cold,
    Tout_start=EX7X1_Tout_cold,
    Di=Di_Users,
    n=np,
    hctype=hctype,
    nPipes=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-20.5,-73.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S700_TT7X3_InCold(
    set_m_flow_start=true,
    m_flow_start=m_flow_EX7X1_cold,
    redeclare model Medium = MediumCold,
    L=L_rUsersIn_TT7X3,
    h=h_rUsersIn_TT7X3,
    t=t_Users,
    pin_start=EX7X1_pin_cold,
    Tin_start=EX7X1_Tin_cold,
    Tout_start=EX7X1_Tin_cold,
    Di=Di_Users,
    n=np,
    hctype=hctype,
    nPipes=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20.5,-68})));

  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X1(redeclare model Medium = MediumHot, T_start=EX7X1_Tout_hot,
    p_start=EX7X1_pout_hot)
                           "Temperature sensor at the outlet of EX7X1 - hot side"   annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,95})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X2(redeclare model Medium = MediumHot, T_start=EX7X1_Tin_hot,
      p_start=EX7X1_pin_hot) "Temperature sensor at the inlet of EX7X1 - hot side"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,91.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X4(redeclare model Medium = MediumCold,
    T_start=EX7X1_Tout_cold,
    p_start(displayUnit="Pa") = EX7X1_pout_cold)
                                 "Temperature sensor at the outlet of EX7X1 - cold side"   annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22.5,-44})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X3(redeclare model Medium = MediumCold,
    T_start=EX7X1_Tin_cold,
    p_start(displayUnit="Pa") = EX7X1_pin_cold)
                                 "Temperature sensor at the inlet of EX7X1 - cold side" annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={23,-47.5})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT7X1(redeclare model Medium = MediumHot, T_start=EX7X1_Tout_hot, p_start=EX7X1_pout_hot)
                                                                                                        "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,83})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT7X1 "Pressure sensor at the outlet of EX7X1 - hot side"   annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,105})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT7X2 "Pressure sensor at the inlet of EX7X1 - hot side"   annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,99.5})));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort(n=np)
                                                                 annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
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
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve TCV7X1(
    redeclare model Medium = MediumCold,
    Kv=TestFacility.Data.ValveData.TCV701.Kv,
    openingChar=openingChar_TCV,
    dp_nom=TestFacility.Data.ValveData.TCV701.dp_nom,
    rho_nom=TestFacility.Data.ValveData.TCV701.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.TCV701.q_nom_m3h,
    Tin_start=Tin_start_valve_TCV,
    pin_start=pin_start_valve_TCV,
    q_m3h_start=q_m3h_start_valve_TCV)
                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-20,-103.5})));
  DistrictHeatingNetwork.Components.Valves.HomotopyInitializer homotopyhot(
    redeclare model Medium = MediumHot,
    p_start=EX7X1_pin_hot,
    T_start=EX7X1_Tin_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20.5,25.5})));
  DistrictHeatingNetwork.Components.Valves.HomotopyInitializer homotopycold(
    redeclare model Medium = MediumCold,
    p_start=EX7X1_pin_cold,
    T_start=EX7X1_Tin_cold) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20.5,-103})));
equation

  connect(PL_S700_FCV7X1_FT7X1.inlet, FCV7X1.outlet) annotation (Line(
      points={{20,54.5},{20,47.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV7X1.inlet, PL_S700_OutHot_FCV7X1.outlet) annotation (Line(
      points={{20,27.5},{20,21.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S700_OutHot_FCV7X1.inlet, EX7X1.outhot) annotation (Line(
      points={{20,1.5},{20,-12.75},{21.3,-12.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT7X1.inlet, PL_S700_FCV7X1_FT7X1.outlet) annotation (Line(
      points={{20,80},{20,74.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S700_TT7X2_InHot.inlet, TT7X2.inlet) annotation (Line(
      points={{-20,75.5},{-20,91.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X2.inlet,PT7X2. inlet) annotation (Line(
      points={{-20,91.5},{-20,99.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT7X1.inlet,TT7X1. inlet) annotation (Line(
      points={{20,105},{20,95}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X1.inlet,FT7X1. outlet) annotation (Line(
      points={{20,95},{20,86}},
      color={140,56,54},
      thickness=0.5));
  connect(EX7X1.outcold,TT7X4. inlet) annotation (Line(
      points={{-19.3,-30.25},{-20,-30.25},{-20,-44.5},{-20.1,-44.5},{-20.1,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(MultiPort, MultiPort) annotation (Line(points={{-110,0},{-110,0}}, color={255,238,44}));
  connect(PL_S700_TT7X4_TCV7X1.inlet, TT7X4.inlet) annotation (Line(
      points={{-20.5,-63.5},{-20.5,-59.5},{-20.1,-59.5},{-20.1,-44}},
      color={140,56,54},
      thickness=0.5));
  connect(TT7X3_TT, TT7X3_TT) annotation (Line(points={{110,-75},{110,-75}}, color={0,0,127}));
  connect(PT7X2.inlet, inhot) annotation (Line(
      points={{-20,99.5},{-20,129}},
      color={140,56,54},
      thickness=0.5));
  connect(PT7X1.inlet, outhot) annotation (Line(
      points={{20,105},{20,129}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S700_TT7X4_TCV7X1.wall, MultiPort) annotation (Line(
      points={{-24.6,-73.5},{-40,-73.5},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S700_OutHot_FCV7X1.wall, MultiPort) annotation (Line(
      points={{15.9,11.5},{-5,11.5},{-5,-11},{-40,-11},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S700_TT7X2_InHot.wall, MultiPort) annotation (Line(
      points={{-24.1,65.5},{-32,65.5},{-32,64.5},{-39.5,64.5},{-39.5,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S700_TT7X3_InCold.wall, MultiPort) annotation (Line(
      points={{16.4,-68},{-6,-68},{-6,-56},{-21,-56},{-21,-57},{-40,-57},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(PT7X2.p, PT7X2_PT) annotation (Line(points={{-28.5,99.5},{-30.5,99.5},{-30.5,115.5},{94.5,115.5},{94.5,90},{110,90}},
                                                                                                                            color={0,0,127}));
  connect(PT7X1.p, PT7X1_PT) annotation (Line(points={{28.5,105},{30,105},{30,114},{93.5,114},{93.5,75},{110,75}},
                                                                                                                 color={0,0,127}));
  connect(TT7X1.T, TT7X1_TT) annotation (Line(points={{28.5,95},{31.5,95},{31.5,112.5},{92.5,112.5},{92.5,60},{110,60}}, color={0,0,127}));
  connect(TT7X2.T, TT7X2_TT) annotation (Line(points={{-28.5,91.5},{-31.5,91.5},{-31.5,117},{95.5,117},{95.5,105},{110,105}},
                                                                                                                          color={0,0,127}));
  connect(TT7X4.T, TT7X4_TT) annotation (Line(points={{-30.3,-44},{-31,-44},{-31,-52},{95,
          -52},{95,-95},{110,-95}},                                                                                   color={0,0,127}));
  connect(TT7X3.T, TT7X3_TT) annotation (Line(points={{30.8,-47.5},{98.5,-47.5},{98.5,-75},
          {110,-75}},                                                                                              color={0,0,127}));
  connect(PL_S700_FCV7X1_FT7X1.wall, MultiPort) annotation (Line(
      points={{15.9,64.5},{-5,64.5},{-5,-11},{-40,-11},{-40,0},{-110,0}},
      color={255,101,98},
      thickness=0.5));
  connect(FT7X1.m_flow, FT7X1_FT) annotation (Line(points={{25,86.5},{33,86.5},{33,111},{91,111},{91,45},{110,45}},       color={0,0,127}));
  connect(PL_S700_TT7X3_InCold.outlet, TT7X3.inlet) annotation (Line(
      points={{20.5,-58},{20,-58},{20,-54},{16,-54},{16,-40},{20.6,-40},{20.6,-47.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EX7X1.incold, TT7X3.inlet) annotation (Line(
      points={{21.3,-30.25},{21,-30.25},{21,-47},{20.5,-47},{20.5,-47.5},{20.6,-47.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S700_TT7X4_TCV7X1.outlet, TCV7X1.inlet) annotation (Line(
      points={{-20.5,-83.5},{-20.5,-88.5},{-20,-88.5},{-20,-93.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TCV7X1.outlet, outcold) annotation (Line(
      points={{-20,-113.5},{-20,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(homotopyhot.inlet, PL_S700_TT7X2_InHot.outlet) annotation (Line(
      points={{-20.5,35.5},{-20.5,45.25},{-20,45.25},{-20,55.5}},
      color={140,56,54},
      thickness=0.5));
  connect(homotopyhot.outlet, EX7X1.inhot) annotation (Line(
      points={{-20.5,15.5},{-20.5,-2},{-28,-2},{-28,-12.75},{-19.3,-12.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S700_TT7X3_InCold.inlet, homotopycold.outlet) annotation (Line(
      points={{20.5,-78},{20.5,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(homotopycold.inlet, incold) annotation (Line(
      points={{20.5,-113},{20.5,-121.5},{20,-121.5},{20,-130}},
      color={140,56,54},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={0.5,0.5})));
end CoolingSingleLoadBase;
