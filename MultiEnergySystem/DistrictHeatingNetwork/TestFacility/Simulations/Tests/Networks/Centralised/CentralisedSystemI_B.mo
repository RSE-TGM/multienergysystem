within MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Simulations.Tests.Networks.Centralised;
model CentralisedSystemI_B
  extends Simulations.Tests.Networks.Centralised.CentralisedSystemI_A(
      FV933_state = false,
      P901omega = [0, 2*3.141592654*40; 500, 2*3.141592654*40],
      pin_start_rCD_cold = 2.2e5,
      VE901(p0(displayUnit="Pa") = 220000),
      P101qm3h = [0, 14; 100, 14],
      Tin_start_S1 = 70 + 273.15,
      Tout_start_S1 = 80 + 273.15,
      FCV101theta = [0, 1; 100, 1],
      FCVC01theta = [0, 0; 100, 0],
      FCVC02theta = [0, 0; 100, 0],
      FCV701theta = [0, 1; 100, 1],
      FCV711theta = [0, 1; 100, 1],
      FCV721theta = [0, 1; 100, 1],
      FCV731theta = [0, 1; 100, 1],
      FCVR01theta = [0, 0.2; 8000, 0.2; 8000, 0.5; 10000, 0.5],
      sinkCold1(T0=15 + 273.15),
      GB101(
      Pmaxnom=147.6e3*0.79),
      ToutcoolSP = [0, 25.5; 500, 25.5; 500, 12; 1000, 12]);


  // System 400
  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length L_S4_rCD_cold = 5.5;
  parameter Types.Length L_S4_rCD_hot = 6;

  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

  parameter Real q_m3h_S4 = 5;
  parameter Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
  parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
  parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;

  Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    Tout_start=Tout_start_S4,
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=Tin_start_S4,
    etanom=0.98,
    h=1.25,
    m_flow_nom=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=160000,
    nR=5)              annotation (Placement(visible=true, transformation(
        origin={-338,-302},
        extent={{-34,-34},{34,34}},
        rotation=0)));
  Components.TurboMachines.ControlledPump
    P401(
    Tin_start(displayUnit="K") = Pump.P401.Tin_start,
    Tout_start(displayUnit="K") = Pump.P401.Tout_start,
    a=Pump.P401.a,
    b=Pump.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=Pump.P401.dpnom,
    etaelec=Pump.P401.etaelec,
    etamech=Pump.P401.etamech,
    etanom=Pump.P401.etanom,
    hin_start=Pump.P401.hin_start,
    m_flow_nom=Pump.P401.m_flow_nom,
    omeganom=Pump.P401.omeganom,
    pin_start(displayUnit="Pa") = Pump.P401.pin_start,
    pout_start(displayUnit="Pa") = Pump.P401.pout_start,
    qnom_inm3h=Pump.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P401.rhonom,
    headnom=Pump.P401.headnom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h,
    use_q_m3hr=true)                           annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-318,-175})));
  Components.Valves.FlowCoefficientValve
    FCV401(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    rho_nom=Valve.FCV401.rho_nom,
    q_m3h_nom=Valve.FCV401.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-318,-140})));
  Components.Pipes.RoundPipe1DFV                                          PL3_S401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-318,-236})));
  Components.Pipes.RoundPipe1DFV                                          PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-358,-238})));
  Components.Pipes.RoundPipe1DFV                                          PL4_S401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-318,-112})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-316,-74})));
  Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-316,-86})));
  Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-360,-118})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-360,-106})));
  Sensors.IdealMassFlowSensor                                          FT401(T_start=
        Tin_start_S4, p_start=pin_start_S4)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-361,-195})));
  Components.Pipes.RoundPipe1DFV                                          PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-358,-166})));
  Components.Pipes.RoundPipe1DFV                                          PL_S400_rCD_hot(
    L=L_S4_rCD_hot,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-318,-52})));
  Components.Pipes.RoundPipe1DFV                                          PL_S400_rCD_cold(
    L=L_S4_rCD_cold,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-358,-54})));
  Components.Valves.FlowCoefficientOnOffValve
    FV401(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tin_start_S4,
    pin_start=pin_start_S4,
    q_m3h_start=q_m3h_S4)
          "On-Off valve connecting inlet S400 & S900 " annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-358,-20})));
  Components.Valves.FlowCoefficientOnOffValve
    FV402(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-318,-20})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state)
    annotation (Placement(transformation(extent={{-390,-30},{-370,-10}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=FV402_state)
    annotation (Placement(transformation(extent={{-286,-30},{-306,-10}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta)
    annotation (Placement(transformation(extent={{-284,-150},{-304,-130}})));
  Sources.PumpInput P401_input(
    useOmega=false,            omega=P401omega, q_m3h=P401qm3h)
    annotation (Placement(transformation(extent={{-284,-191},{-304,-170}})));
  Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table=EB401_ToutSP)
    annotation (Placement(transformation(extent={{-404,-310},{-384,-290}})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-318,-184.6},{-318,-226}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-318,-150},{-318,-165.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-318.4,-74},{-318.4,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-318,-122},{-318,-130}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-318.4,-86},{-318.4,-95},{-318,-95},{-318,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-358.2,-199.2},{-358.2,-207.6},{-358,-207.6},{-358,-228}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-358,-176},{-358,-183.4},{-358.2,-183.4},{-358.2,-190.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-358,-156},{-358,-118},{-357.6,-118}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-357.6,-118},{-357.6,-106}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-358,-248},{-358,-258},{-348.2,-258},{-348.2,-274.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-327.8,-274.8},{-327.8,-258},{-318,-258},{-318,-246}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
      points={{-318.4,-74},{-318,-74},{-318,-62}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
      points={{-357.6,-106},{-358,-106},{-358,-64}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
      points={{-358,-44},{-358,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
      points={{-318,-42},{-318,-30}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
      points={{-358,-10},{-358,6},{-360,6},{-360,5.25},{-408.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-318,-10},{-320,-10},{-320,45},{-338,45}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402_OnOff.y, FV402.u)
    annotation (Line(points={{-307,-20},{-314.8,-20}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u)
    annotation (Line(points={{-369,-20},{-361.2,-20}}, color={255,0,255}));
  connect(FCV401_theta.y, FCV401.opening)
    annotation (Line(points={{-305,-140},{-310,-140}}, color={0,0,127}));
  connect(P401_input.y, P401.in_q_m3hr) annotation (Line(points={{-305,-180.5},{
          -312.48,-180.5},{-312.48,-179.8}}, color={0,0,127}));
  connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (Line(points={{-383,-300},
          {-383,-302},{-365.2,-302}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
end CentralisedSystemI_B;
