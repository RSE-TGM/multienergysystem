within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBPumpingSystem
  extends GasBoilerPumpingSystem(
    FV933_theta(height=0, offset=0),
    FCVC02_theta(
      height=-1,
      duration=50,
      startTime=700),
    FCVC01_theta(
      height=1,
      duration=50,
      startTime=600),
    omega_P901(height=2*3.141592654*5));

  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 17 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 16 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length L_S4_rCD_cold = 5.5;
  parameter Types.Length L_S4_rCD_hot = 6;

  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

  parameter Types.MassFlowRate m_flow_S4 = 1.2;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    Tout_start=288.15,
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=288.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=170000,
    pout_start=160000,
    nR=0)              annotation (Placement(visible=true, transformation(
        origin={-244,-280},
        extent={{-34,-34},{34,34}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
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
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-228,-175})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV401(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-138})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-214})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
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
        origin={-264,-216})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
    L=L_S4_PL3,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-228,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-222,-64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-222,-76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-266,-108})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-266,-96})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-267,-185})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
    L=L_S4_PL1,
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
        origin={-264,-156})));
  Modelica.Blocks.Sources.Ramp FCV401_theta(
    height=0,
    duration=1500,
    offset=1,
    startTime=3000)
    annotation (Placement(transformation(extent={{-190,-148},{-210,-128}})));
  Modelica.Blocks.Sources.Ramp omega_P401(
    offset=2*3.141592654*50,
    height=-2*3.141592654*10*0,
    duration=50,
    startTime=100)
    annotation (Placement(transformation(extent={{-190,-190},{-211,-170}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
    L=L_S4_rCD_hot,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-224,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
    L=L_S4_rCD_cold,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-264,-44})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-228,-184.6},{-228,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-228,-148},{-228,-165.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-224.4,-64},{-224.4,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-228,-112},{-228,-128}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-224.4,-76},{-224.4,-85},{-228,-85},{-228,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-264.2,-189.2},{-264.2,-197.6},{-264,-197.6},{-264,-206}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-264,-166},{-264,-173.4},{-264.2,-173.4},{-264.2,-180.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-264,-146},{-264,-108},{-263.6,-108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-263.6,-108},{-263.6,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401_theta.y, FCV401.opening)
    annotation (Line(points={{-211,-138},{-220,-138}}, color={0,0,127}));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-264,-226},{-264,-236},{-254.2,-236},{-254.2,-252.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-233.8,-252.8},{-233.8,-236},{-228,-236},{-228,-224}},
      color={140,56,54},
      thickness=0.5));
  connect(omega_P401.y,P401. in_omega) annotation (Line(points={{-212.05,-180},{
          -219.025,-180},{-219.025,-179.8},{-222,-179.8}}, color={0,0,127}));
  connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (Line(
      points={{-224.4,-64},{-224,-64},{-224,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-224,-32},{-224,20},{-240,20}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (Line(
      points={{-263.6,-96},{-264,-96},{-264,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_cold.inlet, rackCD_Cold_S300_S400.outlet) annotation (
      Line(
      points={{-264,-34},{-264,-19.75},{-310.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=800, __Dymola_Algorithm="Dassl"));
end GBEBPumpingSystem;
