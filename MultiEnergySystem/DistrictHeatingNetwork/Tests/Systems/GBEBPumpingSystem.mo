within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBPumpingSystem
  extends GasBoilerPumpingSystem(FCVC01theta = [0, 0;600, 0;600, 1; 800, 1], FCVC02theta = [0, 1; 700, 1; 700, 0; 800, 0]);

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
  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*40; 200, 2*3.141592654*40];
  parameter Real FCV401theta[:,:] = [0, 1];

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
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
    nR=0)              annotation (Placement(visible=true, transformation(
        origin={-258,-280},
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
        origin={-236,-165})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    FCV401(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    rho_nom=Valve.FCV401.rho_nom,
    q_m3h_nom=Valve.FCV401.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=Pump.P401.qnom_inm3h)
                             annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-236,-130})));
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
        origin={-236,-214})));
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
        origin={-276,-216})));
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
        origin={-236,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-234,-64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-234,-76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-278,-108})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-278,-96})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-279,-185})));
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
        origin={-276,-156})));
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
        origin={-236,-42})));
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
        origin={-276,-44})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table=P401omega)
    annotation (Placement(transformation(extent={{-200,-180},{-220,-160}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta)
    annotation (Placement(transformation(extent={{-200,-140},{-220,-120}})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-236,-174.6},{-236,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-236,-140},{-236,-155.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-236.4,-64},{-236.4,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-236,-112},{-236,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-236.4,-76},{-236.4,-85},{-236,-85},{-236,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-276.2,-189.2},{-276.2,-197.6},{-276,-197.6},{-276,-206}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-276,-166},{-276,-173.4},{-276.2,-173.4},{-276.2,-180.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-276,-146},{-276,-108},{-275.6,-108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-275.6,-108},{-275.6,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-276,-226},{-276,-236},{-268.2,-236},{-268.2,-252.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-247.8,-252.8},{-247.8,-236},{-236,-236},{-236,-224}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (Line(
      points={{-236.4,-64},{-236,-64},{-236,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-236,-32},{-236,20},{-250,20}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (Line(
      points={{-275.6,-96},{-276,-96},{-276,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_cold.inlet, rackCD_Cold_S300_S400.outlet) annotation (
      Line(
      points={{-276,-34},{-276,-19.75},{-320.5,-19.75}},
      color={140,56,54},
      thickness=0.5));
  connect(P401_omega.y, P401.in_omega) annotation (Line(points={{-221,-170},{-228.5,
          -170},{-228.5,-169.8},{-230,-169.8}}, color={0,0,127}));
  connect(FCV401_theta.y, FCV401.opening)
    annotation (Line(points={{-221,-130},{-228,-130}}, color={0,0,127}));
  annotation (experiment(StopTime=800, __Dymola_Algorithm="Dassl"));
end GBEBPumpingSystem;
