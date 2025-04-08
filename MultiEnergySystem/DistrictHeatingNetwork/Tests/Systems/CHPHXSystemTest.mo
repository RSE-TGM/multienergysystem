within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model CHPHXSystemTest "Combined Heat and Power System Model from RSE's test facility"
  extends Modelica.Icons.Example;

  ////////////////////////////////////
  // Fluids' base model
  ////////////////////////////////////
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
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

  ////////////////////////////////////
  // Start values
  ////////////////////////////////////
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_low_start = 1.50 "Starting mass flow rate rack side";
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_high_start = 1.70 "Starting mass flow rate CHP side";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_low_start = 80 + 273.15 "Starting Inlet temperature HX501 CHP side";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_low_start = 70 + 273.15 "Starting Outlet temperature HX501 CHP side";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_high_start = 60 + 273.15 "Starting Inlet temperature HX501 rack side";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_high_start = 70 + 273.15 "Starting Outlet temperature HX501 rack side";
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_CHP = Tout_low_start "CHP Starting Inlet temperature";
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_CHP = Tin_low_start "CHP Starting Outlet temperature";
  parameter DistrictHeatingNetwork.Types.Pressure p_low_ref = 1.2e5 "Reference pressure CHP side";
  parameter DistrictHeatingNetwork.Types.Pressure dp_low_ref = 0.5e5 "Reference pressure CHP side";
  parameter DistrictHeatingNetwork.Types.Pressure pout_low_start = p_low_ref "Reference pressure side";
  parameter DistrictHeatingNetwork.Types.Pressure pin_high_start = 1.8e5 "Reference pressure rack side";
  parameter DistrictHeatingNetwork.Types.Pressure pout_high_start = 2e5 "Reference pressure rack side";

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_fuel_nom = 0.004 "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Combustion Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6 "Nominal fuel calorific power" annotation (
    Dialog(tab = "Combustion Data"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter DistrictHeatingNetwork.Types.Time tau_el = 10 "Time constant of electric power first order response";
  parameter DistrictHeatingNetwork.Types.PerUnit eta_el_nom = 0.3448273 "Nominal electrical efficiency" annotation (
    Dialog(tab = "Nominal Data"));
  parameter DistrictHeatingNetwork.Types.PerUnit eta_th_nom = 0.5586210 "Nominal thermal efficiency" annotation (
    Dialog(tab = "Nominal Data"));
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 145e3 "Nominal Combustion Power";

  // Gas composition
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};
  parameter DistrictHeatingNetwork.Types.Power Pel_SP[:,:] = [0, 40e3; 1e3, 40e3; 1e3, 35e3; 1e6, 35e3];
  parameter DistrictHeatingNetwork.Types.Temperature Tin_ref[:,:] = [0, 60+273.15; 1e3, 60+273.15; 2e3, 75+273.15; 3e3, 65+273.15];
  parameter DistrictHeatingNetwork.Types.Temperature Tout_SP_CHP[:,:] = [0, 90+273.15; 1e3, 90+273.15; 2e3, 90+273.15; 3e3, 90+273.15];

  DistrictHeatingNetwork.Components.ThermalMachines.ControlledCHP CHP(redeclare model Medium = Medium,
    Tin_start=Tin_start_CHP,
    Tout_start=Tout_start_CHP,
    Pmaxnom=Pmaxnom,
    use_Tout_ref=true,
    Tout_nom=Tout_ref,
    tau_el=tau_el,
    eta_el_nom=eta_el_nom,
    eta_th_nom=eta_th_nom) annotation (Placement(transformation(extent={{-24.25,-24.25},{24.25,24.25}},
        rotation=90,
        origin={62.5,-68})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_CHPHP_CHP(redeclare model Medium = Medium,
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    Tin_start=Tout_low_start,
    Tout_start=Tout_low_start,
    hctype=hctype) "Pipe connecting the circulating water pump with the internal CHP system"
    annotation (Placement(transformation(extent={{19.25,-70.25},{29.25,-80.25}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_CHP_FV502(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    Tin_start=Tin_low_start,
    Tout_start=Tin_low_start,                                             redeclare model Medium = Medium, hctype=hctype) "Pipe connecting CHP with three-way valve FV502"
    annotation (Placement(transformation(extent={{28.75,-56.25},{18.75,-66.25}})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_FV501_CHPWP(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    pin_start=pout_low_start,
    Tin_start=Tout_low_start,
    Tout_start=Tout_low_start,                                              redeclare model Medium = Medium, hctype=hctype) "Pipe connecting three-way valve FV501 and CHP water circulation pump"
    annotation (Placement(transformation(extent={{-34.5,-70.25},{-24.5,-80.25}})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX501(redeclare model Medium = Medium,
    hctype_hot=hctype,
    Di_cold=TestFacility.Data.BPHEData.E501.Di_cold,
    Di_hot=TestFacility.Data.BPHEData.E501.Di_hot,
    L_cold=TestFacility.Data.BPHEData.E501.L_cold,
    L_hot=TestFacility.Data.BPHEData.E501.L_hot,
    hctype_cold=hctype,
    MWall=TestFacility.Data.BPHEData.E501.MWall,
    Stot_cold=TestFacility.Data.BPHEData.E501.Stot_cold,
    Stot_hot=TestFacility.Data.BPHEData.E501.Stot_hot,
    Tin_start_cold=Tin_high_start,
    Tin_start_hot=Tin_low_start,
    Tout_start_cold=Tout_high_start,
    Tout_start_hot=Tout_low_start,
    cpm_cold=TestFacility.Data.BPHEData.E501.cpm_cold,
    cpm_hot=TestFacility.Data.BPHEData.E501.cpm_hot,
    t_cold=TestFacility.Data.BPHEData.E501.t_cold,
    t_hot=TestFacility.Data.BPHEData.E501.t_hot,
    gamma_nom_cold=TestFacility.Data.BPHEData.E501.gamma_nom_cold,
    gamma_nom_hot=TestFacility.Data.BPHEData.E501.gamma_nom_hot,
    h_cold=TestFacility.Data.BPHEData.E501.h_cold,
    h_hot=TestFacility.Data.BPHEData.E501.h_hot,
    k_cold=TestFacility.Data.BPHEData.E501.k_cold,
    k_hot=TestFacility.Data.BPHEData.E501.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=TestFacility.Data.BPHEData.E501.lambdam_cold,
    lambdam_hot=TestFacility.Data.BPHEData.E501.lambdam_hot,
    m_flow_start_cold=m_flow_high_start,
    m_flow_start_hot=m_flow_low_start,
    n=9,
    nPipes_cold=TestFacility.Data.BPHEData.E501.nPipes_cold,
    nPipes_hot=TestFacility.Data.BPHEData.E501.nPipes_hot,
    nPlates=TestFacility.Data.BPHEData.E501.nPlates,
    pin_start_cold=TestFacility.Data.BPHEData.E501.pin_start_cold,
    pin_start_hot=TestFacility.Data.BPHEData.E501.pin_start_hot,
    pout_start_cold=TestFacility.Data.BPHEData.E501.pout_start_cold,
    pout_start_hot=TestFacility.Data.BPHEData.E501.pout_start_hot,
    rho_nom_cold=(TestFacility.Data.BPHEData.E501.rhoin_nom_cold +
        TestFacility.Data.BPHEData.E501.rhoout_nom_cold)/2,
    rho_nom_hot=(TestFacility.Data.BPHEData.E501.rhoin_nom_hot +
        TestFacility.Data.BPHEData.E501.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = TestFacility.Data.BPHEData.E501.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = TestFacility.Data.BPHEData.E501.rhom_hot,
    thermalInertia=true,
    u_nom_cold=TestFacility.Data.BPHEData.E501.u_nom_cold,
    u_nom_hot=TestFacility.Data.BPHEData.E501.u_nom_hot,
    UA_ext=750,
    UA_int=750) annotation (Placement(transformation(
        extent={{-11.875,-19.875},{11.875,19.875}},
        rotation=-90,
        origin={-30.625,5.875})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_ReducerOut_FV501(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    pout_start=pout_low_start,
    Tin_start=Tout_low_start,
    Tout_start=Tout_low_start,
    redeclare model Medium = Medium,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-44.25,-48.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_FV502_ReducerHot(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    Tin_start=Tin_low_start,
    Tout_start=Tin_low_start,
    redeclare model Medium = Medium,
    hctype=hctype) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-16.75,-48.75})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange ReducerCold "Pipe fitting reducer in the cold side"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-44.25,-36.25})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange ReducerHot "Pipe fitting reducer in the hot side"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-16.75,-36.25})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_ReducerHot_EX501(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    Tin_start=Tin_low_start,
    Tout_start=Tin_low_start,
    redeclare model Medium = Medium,
    hctype=hctype) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=-90,
        origin={-16.75,-23.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_EX501_ReducerOut(
    set_m_flow_start=true,
    m_flow_start=m_flow_low_start,
    pin_start=pout_low_start,
    Tin_start=Tout_low_start,
    Tout_start=Tout_low_start,
    redeclare model Medium = Medium,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-44.25,-23.75})));

  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P501(redeclare model Medium = Medium, use_in_omega=true,
    Tin_start(displayUnit="K") = Tout_high_start,
    Tout_start(displayUnit="K") = Tout_high_start,
    a=TestFacility.Data.PumpData.P501.a,
    b=TestFacility.Data.PumpData.P501.b,
    dpnom=TestFacility.Data.PumpData.P501.dpnom,
    etaelec=TestFacility.Data.PumpData.P501.etaelec,
    etamech=TestFacility.Data.PumpData.P501.etamech,
    etanom=TestFacility.Data.PumpData.P501.etanom,
    hin_start=TestFacility.Data.PumpData.P501.hin_start,
    m_flow_nom=TestFacility.Data.PumpData.P501.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.P501.omeganom,
    pin_start(displayUnit="Pa") = TestFacility.Data.PumpData.P501.pin_start,
    pout_start(displayUnit="Pa") = TestFacility.Data.PumpData.P501.pout_start,
    qnom_inm3h=TestFacility.Data.PumpData.P501.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.P501.rhonom,
    headnom=TestFacility.Data.PumpData.P501.headnom,
    headmax=TestFacility.Data.PumpData.P501.headnommax,
    headmin=TestFacility.Data.PumpData.P501.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.P501.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.P501.qnommax_inm3h) "Water pump in CHP system (side heat exchanger)"
    annotation (Placement(transformation(
        extent={{-5.75,5.75},{5.75,-5.75}},
        rotation=90,
        origin={-11.25,42})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_EX501_P501(
    set_m_flow_start=true,
    m_flow_start=m_flow_high_start,
    Tin_start=Tout_high_start,
    Tout_start=Tout_high_start,                                            redeclare model Medium = Medium, hctype=hctype)
    "Pipeline connecting EX501 and P501 inlet"
    annotation (Placement(transformation(
        extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={-11.5,28.25})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_P501_PT501(
    set_m_flow_start=true,
    m_flow_start=m_flow_high_start,
    pin_start=pout_high_start,
    Tin_start=Tout_high_start,
    Tout_start=Tout_high_start,
    redeclare model Medium = Medium,
    hctype=hctype) "Pipeline connecting P501 outlet and sensors" annotation (Placement(
        transformation(
        extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={-11.25,57.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 "Pressure sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-52.25,68.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 "Pressure sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=-90,
        origin={-10.25,70.25})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(redeclare model Medium = Medium, T_start=Tin_high_start,
    p_start=pin_high_start)                                                                 "Flow sensor" annotation (Placement(transformation(
        extent={{2.5,-2.5},{-2.5,2.5}},
        rotation=90,
        origin={-52.25,74})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_FT501_EX501(
    set_m_flow_start=true,
    m_flow_start=m_flow_high_start,
    pin_start=pin_high_start,
    Tin_start(displayUnit="K") = Tin_high_start,
    Tout_start=Tin_high_start, redeclare model Medium = Medium, hctype=hctype) "Pipeline connecting sensor FT501 and EX501"
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-51.25,42.5})));
  inner MultiEnergySystem.System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.Ramp P501_omega(
    height=0,
    duration=0,
    offset=2*pi*40) annotation (Placement(transformation(extent={{2.25,37.25},{-2.75,42.25}})));
  Modelica.Blocks.Sources.Ramp PCHP_m_flow(
    height=0,
    duration=0,
    offset=m_flow_low_start)
                    annotation (Placement(transformation(extent={{-51.75,-80},{-56.75,-75}})));
  H2GasFacility.Sources.SourcePressure sourceGas(
    redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-4,
    computeEnergyVariables=true) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={62.75,-36})));
  Sources.SourcePressure sourcePressure(
    p0=p_low_ref,
    T0=Tout_low_start,                             R=0)
                                                   annotation (Placement(transformation(extent={{-31,
            -93.25},{-21.75,-84}})));
  Modelica.Blocks.Sources.Ramp ToutSP(
    height=0,
    duration=0,
    offset=80 + 273.15) annotation (Placement(transformation(extent={{50.25,-96},{55.25,-91}})));
  Modelica.Blocks.Sources.Ramp PelSP(
    height=5e3,
    duration=0,
    offset=45e3,
    startTime=1000)
                 annotation (Placement(transformation(extent={{70.25,-96},{65.25,-91}})));
  Modelica.Blocks.Sources.BooleanTable CHP_Status(table={1e6}, startValue=true) "Input to decide whether or nor the CHP is working"
    annotation (Placement(transformation(extent={{83,-98},{77.25,-92.25}})));
  Sources.VariableMassFlowPump CHPCWP_ "Water circulating pump for heating" annotation (Placement(transformation(extent={{-4.25,
            4.25},{4.25,-4.25}},
        rotation=-90,
        origin={-44.25,-65.75})));
  Sources.VariableDifferentialPressurePump variableDifferentialPressurePump annotation (Placement(transformation(
        extent={{-4.25,4.25},{4.25,-4.25}},
        rotation=0,
        origin={0.5,-75.25})));
  Modelica.Blocks.Sources.Ramp PCHP_m_flow1(
    height=0,
    duration=0,
    offset=dp_low_ref)
                    annotation (Placement(transformation(extent={{-12.25,-89.5},{-7.25,-84.5}})));
  Sources.SourcePressure sourcePressure1(redeclare model Medium = Medium,
    p0(displayUnit="Pa") = pin_high_start,                                                              T0=Tin_high_start)
    annotation (Placement(transformation(extent={{-86,79.75},{-66,99.75}})));
  Sources.SinkMassFlow sinkMassFlow(redeclare model Medium = Medium,
    pin_start=pout_high_start,
    p0=pout_high_start,
    T0=Tout_high_start,
    m_flow0=m_flow_high_start,
    G=0)
    annotation (Placement(transformation(extent={{-4.5,80},{15.5,100}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(redeclare model Medium = Medium, T_start=
        Tin_high_start,
    p_start=pin_high_start)
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-52.5,63})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(
      redeclare model Medium = Medium, T_start=Tout_high_start,
    p_start=pout_high_start)                                    "Temperature Sensor"
    annotation (Placement(transformation(
        extent={{-2.5,2.5},{2.5,-2.5}},
        rotation=90,
        origin={-10.25,66.75})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(
      redeclare model Medium = Medium, T_start=Tin_low_start) "Temperature Sensor"
    annotation (Placement(transformation(
        extent={{-2.5,2.5},{2.5,-2.5}},
        rotation=90,
        origin={-15.5,-12.25})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(
      redeclare model Medium = Medium, T_start=Tout_low_start) "Temperature Sensor"
    annotation (Placement(transformation(
        extent={{-2.5,-2.5},{2.5,2.5}},
        rotation=90,
        origin={-45.25,-12.5})));
  ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{59,-24.25},{79,-4.25}})));
equation
  connect(PL_S500_CHP_FV502.inlet, CHP.outlet) annotation (Line(
      points={{28.75,-61.25},{35.25,-61.25},{35.25,-60.725},{43.1,-60.725}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_CHPHP_CHP.outlet, CHP.inlet) annotation (Line(
      points={{29.25,-75.25},{35.55,-75.25},{35.55,-75.275},{43.1,-75.275}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_ReducerOut_FV501.inlet, ReducerCold.inlet) annotation (Line(
      points={{-44.25,-43.75},{-44.25,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(ReducerHot.inlet, PL_S500_FV502_ReducerHot.outlet) annotation (Line(
      points={{-16.75,-38.75},{-16.75,-43.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_ReducerHot_EX501.inlet, ReducerHot.outlet) annotation (Line(
      points={{-16.75,-28.75},{-16.75,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_ReducerOut.outlet, ReducerCold.outlet) annotation (Line(
      points={{-44.25,-28.75},{-44.25,-33.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_FT501_EX501.outlet, EX501.incold) annotation (Line(
      points={{-51.25,37.5},{-51.25,20.5},{-44.5375,20.5},{-44.5375,11.8125}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_P501.inlet, EX501.outcold) annotation (Line(
      points={{-11.5,23.25},{-11.5,20},{-16.7125,20},{-16.7125,11.8125}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_P501.outlet, P501.inlet) annotation (Line(
      points={{-11.5,33.25},{-11.5,37.4},{-11.25,37.4}},
      color={140,56,54},
      thickness=0.5));
  connect(P501.outlet, PL_S500_P501_PT501.inlet) annotation (Line(
      points={{-11.25,46.6},{-11.25,52.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT501.outlet, PT501.inlet) annotation (Line(
      points={{-51.25,72.5},{-51.25,68.75}},
      color={140,56,54},
      thickness=0.5));
  connect(P501_omega.y, P501.in_omega) annotation (Line(points={{-3,39.75},{-3,39.7},{-8.375,
          39.7}},                                                                                          color={0,0,127}));
  connect(sourceGas.outlet, CHP.inletfuel) annotation (Line(
      points={{62.75,-41},{62.75,-46.0125},{62.5,-46.0125},{62.5,-51.025}},
      color={182,109,49},
      thickness=0.5));
  connect(CHP_Status.y, CHP.heat_on) annotation (Line(points={{76.9625,-95.125},{74.625,-95.125},
          {74.625,-84.975}},                                                                                        color={255,0,255}));
  connect(PelSP.y, CHP.in_Pel_ref) annotation (Line(points={{65,-93.5},{62.5,-93.5},{62.5,
          -84.975}},                                                                                  color={0,0,127}));
  connect(ToutSP.y, CHP.in_Tout_ref) annotation (Line(points={{55.5,-93.5},{57.65,-93.5},{
          57.65,-84.975}},                                                                            color={0,0,127}));
  connect(PL_S500_FV502_ReducerHot.inlet, PL_S500_CHP_FV502.outlet) annotation (Line(
      points={{-16.75,-53.75},{-16.75,-61.25},{18.75,-61.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_ReducerOut.inlet, EX501.outhot) annotation (Line(
      points={{-44.25,-18.75},{-44.25,-9.4062},{-44.5375,-9.4062},{-44.5375,-0.0625}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_ReducerHot_EX501.outlet, EX501.inhot) annotation (Line(
      points={{-16.75,-18.75},{-16.75,-9.4063},{-16.7125,-9.4063},{-16.7125,-0.0625}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet, PL_S500_FT501_EX501.inlet) annotation (Line(
      points={{-51.25,68.75},{-51.25,47.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_P501_PT501.outlet, PT502.inlet) annotation (Line(
      points={{-11.25,62.75},{-11.25,70.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkMassFlow.inlet, PT502.inlet) annotation (Line(
      points={{-4.5,90},{-11.25,90},{-11.25,70.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure1.outlet, FT501.inlet) annotation (Line(
      points={{-66,89.75},{-51.25,89.75},{-51.25,75.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT501.inlet, TT501.inlet) annotation (Line(
      points={{-51.25,68.75},{-51.25,65.875},{-51.5,65.875},{-51.5,63}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_P501_PT501.outlet, TT502.inlet) annotation (Line(
      points={{-11.25,62.75},{-11.25,66.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_ReducerHot_EX501.outlet, TT504.inlet) annotation (Line(
      points={{-16.75,-18.75},{-16.75,-15.5},{-16.5,-15.5},{-16.5,-12.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_EX501_ReducerOut.inlet, TT503.inlet) annotation (Line(
      points={{-44.25,-18.75},{-44.25,-12.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PCHP_m_flow1.y, variableDifferentialPressurePump.Dp) annotation (Line(points={{-7,
          -87},{-5.5,-87},{-5.5,-87.5},{-2.815,-87.5},{-2.815,-77.8}}, color={0,0,127}));
  connect(PCHP_m_flow.y, CHPCWP_.m_flow) annotation (Line(points={{-57,-77.5},{-60.75,-77.5},
          {-60.75,-62.435},{-46.8,-62.435}}, color={0,0,127}));
  connect(PL_S500_ReducerOut_FV501.outlet, CHPCWP_.inlet) annotation (Line(
      points={{-44.25,-53.75},{-44.25,-61.5}},
      color={140,56,54},
      thickness=0.5));
  connect(CHPCWP_.outlet, PL_S500_FV501_CHPWP.inlet) annotation (Line(
      points={{-44.25,-70},{-44,-70},{-44,-75.25},{-34.5,-75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S500_FV501_CHPWP.outlet, variableDifferentialPressurePump.inlet) annotation (
     Line(
      points={{-24.5,-75.25},{-3.75,-75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(variableDifferentialPressurePump.outlet, PL_S500_CHPHP_CHP.inlet) annotation (
      Line(
      points={{4.75,-75.25},{19.25,-75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, variableDifferentialPressurePump.inlet) annotation (Line(
      points={{-21.75,-88.625},{-17.5,-88.625},{-17.5,-75.25},{-3.75,-75.25}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceVoltage.outlet, CHP.outletPower) annotation (Line(
      points={{79,-14.25},{90.75,-14.25},{90.75,-37.75},{69.775,-37.75},{69.775,-51.025}},
      color={56,93,138},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false, grid={0.25,0.25})),
    experiment(
      StopTime=4500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CHPHXSystemTest;
