within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GBEBPumpingSystem
  extends GasBoilerPumpingSystem(FCVC01theta = [0, 0;600, 0;600, 1; 800, 1], FCVC02theta = [0, 1; 700, 1; 700, 0; 800, 0]);
  Modelica.Blocks.Interaction.Show.RealValue TT402_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-276,-91},{-228,-38}})));

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

  parameter Real q_m3h_S4 = 9;
  parameter Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*40; 200, 2*3.141592654*40];
  parameter Real P401qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV401theta[:,:] = [0, 1];
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;


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
        origin={-314,-280},
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
    headnom=Pump.P401.headnom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h)                      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={-294,-165})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
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
        origin={-294,-130})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
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
        origin={-294,-214})));
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
        origin={-334,-216})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
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
        origin={-294,-102})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-292,-64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-292,-76})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-336,-108})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-336,-96})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=
        Tin_start_S4, p_start=pin_start_S4)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-337,-185})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
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
        origin={-334,-156})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
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
        origin={-294,-42})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
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
        origin={-334,-44})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table=P401omega)
    annotation (Placement(transformation(extent={{-254,-246},{-274,-226}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta)
    annotation (Placement(transformation(extent={{-260,-140},{-280,-120}})));
  Sources.PumpInput P401_input(omega=P401omega, q_m3h=P401qm3h)
    annotation (Placement(transformation(extent={{-260,-179},{-280,-158}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV401(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tin_start_S4,
    pin_start=pin_start_S4,
    q_m3h_start=q_m3h_S4)
          "On-Off valve connecting inlet S400 & S900 " annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-334,-10})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
    FV402(
    Kv=Valve.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-294,-10})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state)
    annotation (Placement(transformation(extent={{-364,-20},{-344,0}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV401_Status
    annotation (Placement(transformation(extent={{-346,-28},{-383,8}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=FV402_state)
    annotation (Placement(transformation(extent={{-264,-20},{-284,0}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV401_Status1
    annotation (Placement(transformation(extent={{-281,-28},{-244,8}})));
  Modelica.Blocks.Interaction.Show.RealValue TT401_(use_numberPort=true,
      significantDigits=4)
    annotation (Placement(transformation(extent={{-352,-70},{-400,-123}})));
equation
  connect(P401.inlet,PL3_S401. outlet) annotation (Line(
      points={{-294,-174.6},{-294,-204}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{-294,-140},{-294,-155.4}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{-294.4,-64},{-294.4,-76}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{-294,-112},{-294,-120}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{-294.4,-76},{-294.4,-85},{-294,-85},{-294,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
      points={{-334.2,-189.2},{-334.2,-197.6},{-334,-197.6},{-334,-206}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-334,-166},{-334,-173.4},{-334.2,-173.4},{-334.2,-180.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-334,-146},{-334,-108},{-333.6,-108}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-333.6,-108},{-333.6,-96}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-334,-226},{-334,-236},{-324.2,-236},{-324.2,-252.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
      points={{-303.8,-252.8},{-303.8,-236},{-294,-236},{-294,-224}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (Line(
      points={{-294.4,-64},{-294,-64},{-294,-52}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (Line(
      points={{-333.6,-96},{-334,-96},{-334,-54}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401_theta.y, FCV401.opening)
    annotation (Line(points={{-281,-130},{-286,-130}}, color={0,0,127}));
  connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (Line(
      points={{-334,-34},{-334,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
      points={{-334,-1.77636e-15},{-334,5.25},{-380.5,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401_OnOff.y, FV401.u)
    annotation (Line(points={{-343,-10},{-337.2,-10}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401_Status.activePort)
    annotation (Line(points={{-343,-10},{-343.225,-10}}, color={255,0,255}));
  connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (Line(
      points={{-294,-32},{-294,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-294,0},{-294,45},{-310,45}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402_OnOff.y, FV402.u)
    annotation (Line(points={{-285,-10},{-290.8,-10}}, color={255,0,255}));
  connect(FV402.u, FV401_Status1.activePort)
    annotation (Line(points={{-290.8,-10},{-283.775,-10}}, color={255,0,255}));
  connect(TT402.T, TT402_.numberPort) annotation (Line(points={{-284.2,-64},{
          -280.9,-64},{-280.9,-64.5},{-279.6,-64.5}}, color={0,0,127}));
  connect(TT401.T, TT401_.numberPort) annotation (Line(points={{-343.8,-96},{
          -347.1,-96},{-347.1,-96.5},{-348.4,-96.5}}, color={0,0,127}));
  annotation (experiment(StopTime=800, __Dymola_Algorithm="Dassl"));
end GBEBPumpingSystem;
