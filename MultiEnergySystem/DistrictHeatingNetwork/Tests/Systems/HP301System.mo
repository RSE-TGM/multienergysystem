within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model HP301System
  extends Modelica.Icons.Example;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";

  final parameter Types.Pressure pin_start_S3_tank = pout_User_start_S3_pump;
  final parameter Types.Pressure pout_start_S3_tank = pin_start_S3_tank - 9.81*2*990;

  // Boundary parameters
  parameter Types.Pressure pin_Source_start_S3 = 1.75e5;
  parameter Types.Pressure pout_Source_start_S3 = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S3 = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3 = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3 = 1.69e5;
  parameter Types.Pressure pout_User_start_S3 = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3 = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3 = 80 + 273.15;


  // Heat Pump
  parameter Types.Pressure pin_Source_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_Source_start_S3_hp = 45 + 273.15;
  parameter Types.Temperature Tout_Source_start_S3_hp = 40 + 273.15;

  parameter Types.Pressure pin_User_start_S3_hp = 1.79e5;
  parameter Types.Pressure pout_User_start_S3_hp = 2.5e5;
  parameter Types.Temperature Tin_User_start_S3_hp = 65 + 273.15;
  parameter Types.Temperature Tout_User_start_S3_hp = 80 + 273.15;

  // Water Pump P301
  parameter Types.Pressure pin_User_start_S3_pump = pin_User_start_S3;
  parameter Types.Pressure pout_User_start_S3_pump = pin_User_start_S3_pump + 1.22e5;

  // Water Pump P302
  parameter Types.Pressure pin_Source_start_S3_pump = 1.79e5;
  parameter Types.Pressure pout_Source_start_S3_pump = pin_Source_start_S3_pump + 0.88e5;


  // General Pipeline Data
  parameter Types.Length Di_S3 = 51e-3;
  parameter Types.Length t_S3 = 1.5e-3;
  parameter Types.MassFlowRate m_flow_Source_S3 = q_m3h_S3_Source*990/3600;
  parameter Real q_m3h_S3_Source = 7;
  parameter Types.MassFlowRate m_flow_User_S3 = q_m3h_S3_User*990/3600;
  parameter Real q_m3h_S3_User = 2.23;

  // Pipe length
  parameter Types.Length L_S3_PL1 = 3;
  parameter Types.Length L_S3_PL2 = 3;
  parameter Types.Length L_S3_PL3 = 3;
  parameter Types.Length L_S3_PL4 = 3;
  parameter Types.Length L_S3_PL5 = 3;
  parameter Types.Length L_S3_PL6 = 3;
  parameter Types.Length L_S3_PL7 = 3;
  parameter Types.Length L_S3_PL8 = 3;
  parameter Types.Length L_S3_PL9 = 3;
  parameter Types.Length L_S3_PL10 = 3;

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledHeatPumpNoDynamics
    HP301(
    Tin_hot_start=Tin_User_start_S3_hp,
    Tin_cold_start=Tin_Source_start_S3_hp,
    Tout_cold_start=Tout_Source_start_S3_hp,
    Tout_hot_set=Tout_User_start_S3_hp,
    m_flow_hot_start=m_flow_User_S3,
    m_flow_cold_start=m_flow_Source_S3,
    k_hot=8000,
    k_cold=8000)
          annotation (Placement(transformation(extent={{-17,-66},{17,-32}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserOut(
    L=L_S3_PL6,
    t=t_S3,
    pin_start=pin_User_start_S3 - 0.04e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-14})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P301(
      Tin_start(displayUnit="K") = Pump.P301.Tin_start,
      Tout_start=Pump.P301.Tout_start,
      a=Pump.P301.a,
      b=Pump.P301.b,
      m_flow_start=m_flow_User_S3,
      dpnom=Pump.P301.dpnom,
      etaelec=Pump.P301.etaelec,
      etamech=Pump.P301.etamech,
      etanom=Pump.P301.etanom,
      hin_start=Pump.P301.hin_start,
      m_flow_nom=Pump.P301.m_flow_nom,
      omeganom=Pump.P301.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
      qnom_inm3h=Pump.P301.qnom_inm3h,
      rhonom(displayUnit="kg/m3") = Pump.P301.rhonom,
      headmax=Pump.P301.headnommax,
      headmin=Pump.P301.headnommin,
      qnom_inm3h_min=Pump.P301.qnommin_inm3h,
      qnom_inm3h_max=Pump.P301.qnommax_inm3h,
    use_in_omega=true)
     "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,15})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage
    D301(
    H=2,
    T_start=Tout_User_start_S3,
    pin_start=pout_User_start_S3_pump,
    m_flow_start=m_flow_User_S3)
         annotation (Placement(transformation(extent={{37,46},{67,94}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,121.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT302 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,112.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_P301_D301(
    L=L_S3_PL4,
    t=t_S3,
    pin_start=pout_User_start_S3_pump,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,40})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_D301out(
    L=L_S3_PL3,
    t=t_S3,
    pin_start=pout_User_start_S3_pump - 0.2e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={10,94})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_H(
    L=L_S3_PL1,
    t=t_S3,
    pin_start=pout_User_start_S3_pump - 0.21e5,
    Tin_start=Tout_User_start_S3,
    Tout_start=Tout_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,141})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT301 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,60.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT301(T_start=Tin_User_start_S3, p_start=pin_User_start_S3)
          annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,51.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT301
    annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={-12,9})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_UserIn(
    L=L_S3_PL7,
    t=t_S3,
    pin_start=pin_User_start_S3 - 0.02e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,-14})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301Sensors_C(
    L=L_S3_PL5,
    t=t_S3,
    pin_start=pin_User_start_S3 - 0.01e5,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S300_rCD_C(L=
        L_S3_PL2,
    pin_start=pin_User_start_S3,
    Tin_start=Tin_User_start_S3,
    Tout_start=Tin_User_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_User,
    n=n,
    hctype=hctype)                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,140})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P302(
      Tin_start(displayUnit="K") = Pump.P302.Tin_start,
      Tout_start=Pump.P302.Tout_start,
      a=Pump.P302.a,
      b=Pump.P302.b,
    m_flow_start=m_flow_Source_S3,
      dpnom=Pump.P302.dpnom,
      etaelec=Pump.P302.etaelec,
      etamech=Pump.P302.etamech,
      etanom=Pump.P302.etanom,
      hin_start=Pump.P302.hin_start,
      m_flow_nom=Pump.P302.m_flow_nom,
      omeganom=Pump.P302.omeganom,
      pin_start(displayUnit="Pa") = 1.8400803e5,
      pout_start(displayUnit="Pa") = 1.9920743e5,
      qnom_inm3h=Pump.P302.qnom_inm3h,
      rhonom(displayUnit="kg/m3") = Pump.P302.rhonom,
      headmax=Pump.P302.headnommax,
      headmin=Pump.P302.headnommin,
      qnom_inm3h_min=Pump.P302.qnommin_inm3h,
      qnom_inm3h_max=Pump.P302.qnommax_inm3h,
    use_in_omega=true)                        "Pump of System 300" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-100})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT303 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-73.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT304 annotation (Placement(transformation(
        extent={{-5.5,5.5},{5.5,-5.5}},
        rotation=90,
        origin={12.5,-82.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_H(
    L=L_S3_PL9,
    t=t_S3,
    m_flow_start=m_flow_Source_S3,
    pin_start=pout_Source_start_S3_pump - 0.1e5,
    pout_start=pout_Source_start_S3_pump,
    Tin_start=Tin_Source_start_S3,
    Tout_start=Tin_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={10,-140})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT303 annotation (Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-12.5,-104.5})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT302
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-12,-118})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_HP301_SourceOut(
    L=L_S3_PL8,
    t=t_S3,
    m_flow_start=m_flow_Source_S3,
    pin_start=pout_Source_start_S3_pump + 0.2e5,
    pout_start=pout_Source_start_S3_pump + 0.1e5,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,-84})));
  Sources.SinkPressure sinkPressure(p0=pout_Source_start_S3_pump, T0=
        Tout_Source_start_S3)
    annotation (Placement(transformation(extent={{-20,-170},{-40,-150}})));
  Sources.SourceMassFlow sourceMassFlow(
    p0=pin_Source_start_S3_pump,
    T0=Tin_Source_start_S3_hp,          m_flow0=m_flow_Source_S3)
    annotation (Placement(transformation(extent={{38,-170},{18,-150}})));
  Sources.SourcePressure sourcePressure(p0=pin_User_start_S3, T0=
        Tin_User_start_S3)
    annotation (Placement(transformation(extent={{-40,160},{-20,180}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=false,
    pin_start=pout_start_S3_tank,
    p0=pout_start_S3_tank,
    T0=Tout_User_start_S3,
    m_flow0=m_flow_User_S3)
    annotation (Placement(transformation(extent={{20,160},{40,180}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S3_PL_S600_S300_C(
    L=L_S3_PL10,
    t=t_S3,
    pin_start=pout_Source_start_S3_pump + 0.1e5,
    Tin_start=Tout_Source_start_S3,
    Tout_start=Tout_Source_start_S3,
    Di=Di_S3,
    q_m3h_start=q_m3h_S3_Source,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-10,-140})));
  inner MultiEnergySystem.System system
    annotation (Placement(transformation(extent={{120,160},{140,180}})));
  Modelica.Blocks.Sources.Ramp omega_P301(
    offset=2*3.141592654*40,
    height=-2*3.141592654*5,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{46,1},{25,21}})));
  Modelica.Blocks.Sources.Ramp omega_P302(
    offset=2*3.141592654*50,
    height=2*3.141592654*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{47,-114},{26,-94}})));
equation
  connect(PT301.inlet, TT301.inlet) annotation (Line(
      points={{-10.3,60.5},{-10.3,51.5}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outhot, S3_PL_HP301_UserOut.inlet) annotation (Line(
      points={{10.2,-38.8},{10.2,-31.4},{10,-31.4},{10,-24}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserOut.outlet, P301.inlet) annotation (Line(
      points={{10,-4},{10,7}},
      color={140,56,54},
      thickness=0.5));
  connect(P301.outlet, S3_PL_P301_D301.inlet) annotation (Line(
      points={{10,23},{10,30}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_P301_D301.outlet, D301.inlet) annotation (Line(
      points={{10,50},{10,58},{37,58}},
      color={140,56,54},
      thickness=0.5));
  connect(D301.outlet, S3_PL_D301out.inlet) annotation (Line(
      points={{37,82},{10,82},{10,84}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_D301out.outlet, TT302.inlet) annotation (Line(
      points={{10,104},{10,108.25},{10.3,108.25},{10.3,112.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT302.inlet, PT302.inlet) annotation (Line(
      points={{10.3,112.5},{10.3,121.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT302.inlet, S3_PL_S300_rCD_H.inlet) annotation (Line(
      points={{10.3,121.5},{10.3,126.25},{10,126.25},{10,131}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.incold, PT303.inlet) annotation (Line(
      points={{10.2,-59.2},{10.2,-66.35},{10.3,-66.35},{10.3,-73.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT303.inlet, TT304.inlet) annotation (Line(
      points={{10.3,-73.5},{10.3,-82.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT304.inlet, P302.outlet) annotation (Line(
      points={{10.3,-82.5},{10.3,-87.25},{10,-87.25},{10,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(P302.inlet, S3_PL_S600_S300_H.outlet) annotation (Line(
      points={{10,-108},{10,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.outlet, TT303.inlet) annotation (Line(
      points={{-10,-115},{-10,-111.25},{-10.3,-111.25},{-10.3,-104.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceMassFlow.outlet, S3_PL_S600_S300_H.inlet) annotation (Line(
      points={{18,-160},{10,-160},{10,-150}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, S3_PL_S300_rCD_H.outlet) annotation (Line(
      points={{20,170},{10,170},{10,151}},
      color={140,56,54},
      thickness=0.5));
  connect(HP301.outcold, S3_PL_HP301_SourceOut.inlet) annotation (Line(
      points={{-10.2,-59.2},{-10.2,-66.6},{-10,-66.6},{-10,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_SourceOut.outlet, TT303.inlet) annotation (Line(
      points={{-10,-94},{-10,-99.25},{-10.3,-99.25},{-10.3,-104.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT302.inlet, S3_PL_S600_S300_C.inlet) annotation (Line(
      points={{-10,-121},{-10,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S600_S300_C.outlet, sinkPressure.inlet) annotation (Line(
      points={{-10,-150},{-10,-160},{-20,-160}},
      color={140,56,54},
      thickness=0.5));
  connect(sourcePressure.outlet, S3_PL_S300_rCD_C.inlet) annotation (Line(
      points={{-20,170},{-10,170},{-10,150}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_S300_rCD_C.outlet, PT301.inlet) annotation (Line(
      points={{-10,130},{-10,60.5},{-10.3,60.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT301.inlet, S3_PL_HP301Sensors_C.inlet) annotation (Line(
      points={{-10.3,51.5},{-10.3,46.25},{-10,46.25},{-10,40}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301Sensors_C.outlet, FT301.inlet) annotation (Line(
      points={{-10,20},{-10,12}},
      color={140,56,54},
      thickness=0.5));
  connect(FT301.outlet, S3_PL_HP301_UserIn.inlet) annotation (Line(
      points={{-10,6},{-10,-4}},
      color={140,56,54},
      thickness=0.5));
  connect(S3_PL_HP301_UserIn.outlet, HP301.inhot) annotation (Line(
      points={{-10,-24},{-10,-31.4},{-10.2,-31.4},{-10.2,-38.8}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P301.y, P301.in_omega)
    annotation (Line(points={{23.95,11},{15,11}}, color={0,0,127}));
  connect(omega_P302.y, P302.in_omega)
    annotation (Line(points={{24.95,-104},{15,-104}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(
        preserveAspectRatio=false,
        extent={{-140,-180},{140,180}},
        grid={1,1}), graphics={
        Line(
          points={{50,-122},{50,-92}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{53,-93},{83,-123}},
          textColor={28,108,200},
          textString="45°C"),
        Line(
          points={{-23,-96},{-23,-126}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-55,-98},{-25,-128}},
          textColor={28,108,200},
          textString="41°C")}),
    experiment(
      StopTime=100,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end HP301System;
