within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.S500;
model S500 "Combined Heat and Power System Model from RSE's test facility"
  extends Modelica.Icons.Example;

  ////////////////////////////////////
  // Fluids' base model
  ////////////////////////////////////
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  ////////////////////////////////////
  // Constants
  ////////////////////////////////////
  constant Real pi = Modelica.Constants.pi;

  ////////////////////////////////////
  // Parameters
  ////////////////////////////////////
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";

  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_CHP = 60+273.15 "CHP Starting Inlet temperature";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_CHP = 72+273.15 "CHP Starting Outlet temperature";


  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_fuel_nom = 0.004 "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Combustion Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6 "Nominal fuel calorific power" annotation (
    Dialog(tab = "Combustion Data"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter DistrictHeatingNetwork.Types.Time tau_el = 10 "Time constant of electric power first order response";
  parameter DistrictHeatingNetwork.Types.PerUnit eta_el_nom = 0.3448 "Nominal electrical efficiency" annotation (
    Dialog(tab = "Nominal Data"));
  parameter DistrictHeatingNetwork.Types.PerUnit eta_th_nom = 0.5453 "Nominal thermal efficiency" annotation (
    Dialog(tab = "Nominal Data"));
  parameter DistrictHeatingNetwork.Types.Power Pnom = eta_el_nom*Pnom "Nominal Combustion Power";
  parameter DistrictHeatingNetwork.Types.Power Pel_nom = eta_el_nom*Pnom "Electrical Nominal Power";
  parameter DistrictHeatingNetwork.Types.Power Pth_nom = eta_th_nom*Pnom "Thermal Nominal Power";


  // Heat exchanger parameters

  parameter Real EX501_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX501_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX501_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX501_Tin_hot=44.84 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX501_Tout_hot=32.6 + 273.15;

  parameter Real EX501_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX501_cold=
      EX501_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX501_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX501_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX501_Tin_cold=34.12 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX501_Tout_cold=34.74 + 273.15;


  // Gas composition
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};
  parameter DistrictHeatingNetwork.Types.Power Pel_SP[:,:] = [0, 40e3; 1e3, 40e3; 1e3, 35e3; 1e6, 35e3];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_ref[:,:] = [0, 60+273.15; 1e3, 60+273.15; 2e3, 75+273.15; 3e3, 65+273.15];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_SP_CHP[:,:] = [0, 90+273.15; 1e3, 90+273.15; 2e3, 90+273.15; 3e3, 90+273.15];


  DistrictHeatingNetwork.Components.ThermalMachines.ControlledCHP CHP(redeclare model Medium = Medium,
    Tin_start=333.15,
    Tout_start=345.15,                                                                                 use_Tout_ref=true,
    Tout_nom=353.15)                                                                                                      annotation (Placement(transformation(extent={{-24.25,-24.25},{24.25,24.25}},
        rotation=90,
        origin={79.75,-69.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_CHPHP_CHP(
    Tin_start=Tin_start_CHP,
    Tout_start=Tin_start_CHP,                                             redeclare model Medium = Medium, hctype=hctype) "Pipe connecting the circulating water pump with the internal CHP system"
    annotation (Placement(transformation(extent={{36.25,-71.75},{46.25,-81.75}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_CHP_FV502(redeclare model Medium = Medium, hctype=hctype) "Pipe connecting CHP with three-way valve FV502"
    annotation (Placement(transformation(extent={{46,-57.75},{36,-67.75}})));
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump CHPCWP(
    redeclare model Medium = Medium,
    Tin_start(displayUnit="K") = Tin_start_CHP,
    Tout_start(displayUnit="K") = Tin_start_CHP,
    pin_start=120000,
    pout_start=250000) "Water circulating pump for heating" annotation (Placement(transformation(extent={{14.25,-69.75},{28.25,-83.75}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_FV501_CHPWP(
    Tin_start=Tin_start_CHP,
    Tout_start=Tin_start_CHP,                                               redeclare model Medium = Medium, hctype=hctype) "Pipe connecting three-way valve FV501 and CHP water circulation pump"
    annotation (Placement(transformation(extent={{-3,-71.75},{7,-81.75}})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX501(redeclare model Medium = Medium,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E501.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E501.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E501.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot,
    Tin_start_cold=EX501_Tin_cold,
    Tin_start_hot=EX501_Tin_hot,
    Tout_start_cold=EX501_Tout_cold,
    Tout_start_hot=EX501_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E501.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E501.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E501.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E501.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E501.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E501.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E501.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot,
    thermalInertia=true,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot,
    UA_ext=750,
    UA_int=750) annotation (Placement(transformation(
        extent={{-11.875,-19.875},{11.875,19.875}},
        rotation=-90,
        origin={0.625,4.375})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV roundPipe1DFV3(redeclare model Medium = Medium, hctype = hctype)
                                                                      annotation (Placement(transformation(extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-13,-50.25})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV roundPipe1DFV4(redeclare model Medium = Medium, hctype = hctype)
                                                                      annotation (Placement(transformation(extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={14.5,-50.25})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange ReducerCold "Pipe fitting reducer in the cold side"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-13,-37.75})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange ReducerHot "Pipe fitting reducer in the hot side"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={14.5,-37.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV roundPipe1DFV5(redeclare model Medium = Medium, hctype = hctype)    annotation (Placement(transformation(extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={14.5,-25.25})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV roundPipe1DFV6(redeclare model Medium = Medium, hctype = hctype)    annotation (Placement(transformation(extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-13,-25.25})));

  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P501(redeclare model Medium = Medium, use_in_omega=true,
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P501.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P501.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P501.a,
    b=DistrictHeatingNetwork.Data.PumpData.P501.b,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h) "Water pump in CHP system (side heat exchanger)"
    annotation (Placement(transformation(
        extent={{-5.75,5.75},{5.75,-5.75}},
        rotation=90,
        origin={20,41})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_EX501_P501(redeclare model Medium = Medium, hctype=hctype)
    annotation (Placement(transformation(
        extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={20,26.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV roundPipe1DFV8(redeclare model Medium = Medium, hctype = hctype)
                                                                      annotation (Placement(transformation(extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={20,56.25})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensorFirstOrderDyn TT501(redeclare model Medium = Medium) "Temperature sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-21,66.25})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensorFirstOrderDyn TT502(redeclare model Medium = Medium) "Temperature sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=-90,
        origin={21,66})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensorFirstOrderDyn TT503(redeclare model Medium = Medium) "Temperature sensor - outlet EX501"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-14,-17})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensorFirstOrderDyn TT504(redeclare model Medium = Medium) "Temperature sensor - inlet EX501"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=-90,
        origin={15.75,-17.25})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 "Pressure sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-21,68.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 "Pressure sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=-90,
        origin={21,68.75})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(redeclare model Medium = Medium) "Flow sensor" annotation (Placement(transformation(
        extent={{2.5,-2.5},{-2.5,2.5}},
        rotation=90,
        origin={-21,72.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_FT501_EX501(redeclare model Medium = Medium, hctype=hctype) "Pipeline connecting sensor FT501 and EX501"
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-20,41.25})));
  Modelica.Blocks.Sources.Ramp FV501_theta(
    height=0,
    duration=0,
    offset=1)                              annotation (Placement(transformation(extent={{-22.5,-90},{-17.5,-85}})));
  Modelica.Blocks.Sources.Ramp FV502_theta(
    height=0,
    duration=0,
    offset=1)                              annotation (Placement(transformation(extent={{5,-72.5},{10,-67.5}})));
  inner System system annotation (Placement(transformation(extent={{80,79.75},{100,99.75}})));
  Sources.SourceMassFlow flowSource_FT501(redeclare model Medium = Medium,
    p0=210000,
    T0(displayUnit="K") = 60 + 273.15,
    m_flow0=0.5)                                                           annotation (Placement(transformation(extent={{-43.5,74},{-23.5,94}})));
  Sources.SinkPressure sinkP_PT502(redeclare model Medium = Medium,
    p0=295000,
    T0(displayUnit="K") = 68 + 273.15)                              annotation (Placement(transformation(extent={{25.25,72.25},{45.25,92.25}})));
  Modelica.Blocks.Sources.Ramp P501_omega(
    height=0,
    duration=0,
    offset=2*pi*30) annotation (Placement(transformation(extent={{33.5,35.75},{28.5,40.75}})));
  Modelica.Blocks.Sources.Ramp PCHP_m_flow(
    height=0,
    duration=0,
    offset=1.2)     annotation (Placement(transformation(extent={{27.5,-90},{22.5,-85}})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={80,-37.5})));
  Sources.SourcePressure sourcePressure(p0=120000, R=1e-3)
                                                   annotation (Placement(transformation(extent={{-43.75,-98.75},{-34.5,-89.5}})));
  Modelica.Blocks.Sources.Ramp ToutSP(
    height=0,
    duration=0,
    offset=80 + 273.15) annotation (Placement(transformation(extent={{67.5,-97.5},{72.5,-92.5}})));
  Modelica.Blocks.Sources.Ramp PelSP(
    height=0,
    duration=0,
    offset=45e3) annotation (Placement(transformation(extent={{87.5,-97.5},{82.5,-92.5}})));
  Modelica.Blocks.Sources.BooleanTable CHP_Status(table={1e6}, startValue=true) "Input to decide whether or nor the CHP is working"
    annotation (Placement(transformation(extent={{100.25,-99.5},{94.5,-93.75}})));
equation
  connect(CHPCWP.outlet, PL_S500_CHPHP_CHP.inlet) annotation (Line(
      points={{26.85,-76.75},{36.25,-76.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_CHP_FV502.inlet, CHP.outlet) annotation (Line(
      points={{46,-62.75},{52.5,-62.75},{52.5,-62.225},{60.35,-62.225}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_CHPHP_CHP.outlet, CHP.inlet) annotation (Line(
      points={{46.25,-76.75},{52.8,-76.75},{52.8,-76.775},{60.35,-76.775}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_FV501_CHPWP.outlet, CHPCWP.inlet) annotation (Line(
      points={{7,-76.75},{15.65,-76.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.inlet, ReducerCold.inlet) annotation (Line(
      points={{-13,-45.25},{-13,-40.25}},
      color={140,56,54},
      thickness=0.5));
  connect(ReducerHot.inlet, roundPipe1DFV4.outlet)
    annotation (Line(
      points={{14.5,-40.25},{14.5,-45.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.inlet, ReducerHot.outlet) annotation (Line(
      points={{14.5,-30.25},{14.5,-35.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV6.outlet, ReducerCold.outlet) annotation (Line(
      points={{-13,-30.25},{-13,-35.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_FT501_EX501.outlet, EX501.incold) annotation (Line(
      points={{-20,36.25},{-20,19},{-13.2875,19},{-13.2875,10.3125}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_P501.inlet, EX501.outcold) annotation (Line(
      points={{20,21.75},{20,18.5},{14.5375,18.5},{14.5375,10.3125}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_P501.outlet, P501.inlet) annotation (Line(
      points={{20,31.75},{20,36.4}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.outlet, roundPipe1DFV8.inlet) annotation (Line(
      points={{20,45.6},{20,51.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV8.outlet, TT502.inlet) annotation (Line(
      points={{20,61.25},{20,66}},
      color={140,56,54},
      thickness=0.5));
  connect(TT502.inlet, PT502.inlet) annotation (Line(
      points={{20,66},{20,68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_FT501_EX501.inlet, TT501.inlet) annotation (Line(
      points={{-20,46.25},{-20,66.25}},
      color={140,56,54},
      thickness=0.5));
  connect(TT501.inlet, PT501.inlet) annotation (Line(
      points={{-20,66.25},{-20,68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV6.inlet, TT503.inlet) annotation (Line(
      points={{-13,-20.25},{-13,-17}},
      color={140,56,54},
      thickness=0.5));
  connect(EX501.outhot, TT503.inlet) annotation (Line(
      points={{-13.2875,-1.5625},{-13.2875,-9.2812},{-13,-9.2812},{-13,-17}},
      color={140,56,54},
      thickness=0.5));
  connect(EX501.inhot, TT504.inlet) annotation (Line(
      points={{14.5375,-1.5625},{14.5375,-9.4062},{14.75,-9.4062},{14.75,-17.25}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV5.outlet, TT504.inlet) annotation (Line(
      points={{14.5,-20.25},{14.5,-18.75},{14.75,-18.75},{14.75,-17.25}},
      color={140,56,54},
      thickness=0.5));
  connect(flowSource_FT501.outlet, FT501.inlet) annotation (Line(
      points={{-23.5,84},{-21.75,84},{-21.75,83.75},{-20,83.75},{-20,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet, PT501.inlet) annotation (Line(
      points={{-20,71},{-20,68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP_PT502.inlet, PT502.inlet) annotation (Line(
      points={{25.25,82.25},{20,82.25},{20,68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(P501_omega.y, P501.in_omega) annotation (Line(points={{28.25,38.25},{28.25,38.7},{22.875,38.7}}, color={0,0,127}));
  connect(PCHP_m_flow.y, CHPCWP.in_m_flow) annotation (Line(points={{22.25,-87.5},{18.45,-87.5},{18.45,-79.97}}, color={0,0,127}));
  connect(sourceGas.outlet, CHP.inletfuel) annotation (Line(
      points={{80,-42.5},{80,-47.5125},{79.75,-47.5125},{79.75,-52.525}},
      color={182,109,49},
      thickness=0.5));
  connect(CHP_Status.y, CHP.heat_on) annotation (Line(points={{94.2125,-96.625},{91.875,-96.625},{91.875,-86.475}}, color={255,0,255}));
  connect(PelSP.y, CHP.in_Pel_ref) annotation (Line(points={{82.25,-95},{79.75,-95},{79.75,-86.475}}, color={0,0,127}));
  connect(ToutSP.y, CHP.in_Tout_ref) annotation (Line(points={{72.75,-95},{74.9,-95},{74.9,-86.475}}, color={0,0,127}));
  connect(roundPipe1DFV4.inlet, PL_S500_CHP_FV502.outlet) annotation (Line(
      points={{14.5,-55.25},{14.75,-63},{14.75,-62.75},{36,-62.75}},
      color={140,56,54},
      thickness=0.5));
  connect(roundPipe1DFV3.outlet, PL_S500_FV501_CHPWP.inlet) annotation (Line(
      points={{-13,-55.25},{-13,-76.75},{-3,-76.75}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, CHPCWP.inlet)
    annotation (Line(
      points={{-34.5,-94.125},{-15,-94.125},{-15,-94},{10.5,-94},{10.5,-76.75},{15.65,-76.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false, grid={0.25,0.25})),
    experiment(
      StopTime=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end S500;
