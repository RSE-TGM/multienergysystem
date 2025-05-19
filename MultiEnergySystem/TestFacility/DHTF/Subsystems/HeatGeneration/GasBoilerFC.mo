within MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration;
model GasBoilerFC "System 100 - Gas Boiler Flow controlled"
  extends BaseClass.GasBoilerBase;
  import pipeData = MultiEnergySystem.TestFacility.Data.PipelineData.S100;

  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P101(
    redeclare model Medium = Medium,
    Tin_start(displayUnit="K") = Tout_start,
    Tout_start(displayUnit="K") = Tout_start,
    a=TestFacility.Data.PumpData.P101.a,
    b=TestFacility.Data.PumpData.P101.b,
    m_flow_start=m_flow_S1,
    dpnom=TestFacility.Data.PumpData.P101.dpnom,
    etaelec=TestFacility.Data.PumpData.P101.etaelec,
    etamech=TestFacility.Data.PumpData.P101.etamech,
    etanom=TestFacility.Data.PumpData.P101.etanom,
    m_flow_nom=TestFacility.Data.PumpData.P101.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.P101.omeganom,
    pin_start(displayUnit="Pa") = TestFacility.Data.PumpData.P101.pin_start,
    pout_start(displayUnit="Pa") = TestFacility.Data.PumpData.P101.pout_start,
    qnom_inm3h=TestFacility.Data.PumpData.P101.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.P101.rhonom,
    headnom=TestFacility.Data.PumpData.P101.headnom,
    headmax=TestFacility.Data.PumpData.P101.headnommax,
    headmin=TestFacility.Data.PumpData.P101.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.P101.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.P101.qnommax_inm3h)                                                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={20,5})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB(
    redeclare model Medium = Medium,
    etanom=eta_combustion,
    redeclare model Gas = Gas,
    h=h,
    D=D,
    Pmaxnom=Pmaxnom,
    Tin_start=Tin_start,
    pin_start=pin_start,
    pout_start=pout_start,
    Tout_start=Tout_start,
    Pnimnom=Pminnom,
    Pnom=Pnom,
    tdelay=tdelay)
               annotation (Placement(visible=true, transformation(
        origin={0,-96.5},
        extent={{-36,-36},{36,36}},
        rotation=0)));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_GB101_P101(
    set_m_flow_start=true,
    m_flow_start=m_flow_S1,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_GB101_P101.L,
    h=pipeData.PL_GB101_P101.h,
    t=pipeData.PL_GB101_P101.t,
    pin_start=pout_start,
    Tin_start=Tout_start,
    Tout_start=Tout_start,
    Di=pipeData.PL_GB101_P101.Di,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=pipeData.PL_GB101_P101.u_nom,
    hctype=hctype,
    cf=pipeData.PL_GB101_P101.cf)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-24})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_FT101_GB101(
    set_m_flow_start=true,
    m_flow_start=m_flow_S1,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_FT101_GB101.L,
    h=pipeData.PL_FT101_GB101.h,
    t=pipeData.PL_FT101_GB101.t,
    pin_start=pin_start,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    Di=pipeData.PL_FT101_GB101.Di,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=pipeData.PL_FT101_GB101.u_nom,
    hctype=hctype,
    cf=pipeData.PL_FT101_GB101.cf)
                   annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-20,-23.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_P101_FCV101(
    set_m_flow_start=true,
    m_flow_start=m_flow_S1,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_P101_FCV101.L,
    h=pipeData.PL_P101_FCV101.h,
    t=pipeData.PL_P101_FCV101.t,
    pin_start=pout_start,
    Tin_start=Tout_start,
    Tout_start=Tout_start,
    Di=pipeData.PL_P101_FCV101.Di,
    q_m3h_start=q_m3h_S1,
    n=n,
    rho_nom=pipeData.PL_P101_FCV101.rho_nom,
    u_nom=pipeData.PL_P101_FCV101.u_nom,
    hctype=hctype,
    cf=pipeData.PL_P101_FCV101.cf)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,34})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT(
    redeclare model Medium = Medium,
    T_start=Tin_start,
    p_start=pin_start)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-24,44})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(
    redeclare model Medium = Medium,
    T_start=Tin_start,
    p_start=pin_start)  "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,76})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(
    redeclare model Medium = Medium,
    T_start=Tout_start,
    p_start=pout_start)  "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,92})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,64})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,82})));
  Modelica.Blocks.Interfaces.RealOutput Pe annotation (Placement(transformation(extent={{100,-40},{120,-20}}), iconTransformation(extent={{100,-40},{120,-20}})));
  H2GasFacility.Interfaces.FluidPortInlet inletFuel(nXi = fuel.nXi) annotation (Placement(transformation(extent={{38,-138},{70,-106}}),  iconTransformation(extent={{-16,-132},{16,-100}})));
equation

  //-------------------------------
  // Fuel definition
  //-------------------------------
  fuel.h = inStream(inletFuel.h_out);
  fuel.Xi = inStream(inletFuel.Xi);
  fuel.p = 1.013e5;

  //-------------------------------
  // Total pump consumed electric power
  //-------------------------------
  Pe = P101.W;
  connect(P101.inlet,PL_S100_GB101_P101. outlet) annotation (Line(
      points={{20,-4.6},{20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet,P101. outlet) annotation (Line(
      points={{20,24},{20,14.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.outlet, PL_S100_FT101_GB101.inlet) annotation (Line(
      points={{-20,38},{-20,-13.5}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.inlet, PT101.inlet) annotation (Line(
      points={{-20,50},{-20,57},{-19.6,57},{-19.6,64}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.inlet, TT101.inlet) annotation (Line(
      points={{-20,50},{-20,63},{-19.6,63},{-19.6,76}},
      color={140,56,54},
      thickness=0.5));
  connect(MultiPort, MultiPort) annotation (Line(points={{-110,-80},{-110,-80}}, color={255,238,44}));
  connect(TT101.inlet, inlet) annotation (Line(
      points={{-19.6,76},{-20,76},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(TT102.inlet, outlet) annotation (Line(
      points={{19.6,92},{19.6,101},{20,101},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(Toutset, GB.Tout_ref) annotation (Line(points={{-110,30},{-95.5,30},{-95.5,-137.5},{-31.5,-137.5},{-31.5,-96.5},{-25.2,-96.5}},
                                                                                                    color={0,0,127}));
  connect(status, GB.heat_on) annotation (Line(points={{-110,10},{-97.5,10},{-97.5,-139},{-30,-139},{-30,-114.5},{-25.2,-114.5}},
                                                                                                    color={255,0,255}));
  connect(FT.m_flow, m_flow_) annotation (Line(points={{-30,37},{-30,32},{-40,32},{-40,136},{96,136},{96,70},{110,70}}, color={0,0,127}));
  connect(TT101.T, TTin) annotation (Line(points={{-29.8,76},{-34,76},{-34,134.5},{94,134.5},{94,50},{110,50}}, color={0,0,127}));
  connect(TT102.T, TTout) annotation (Line(points={{29.8,92},{32,92},{32,133},{92,133},{92,30},{110,30}}, color={0,0,127}));
  connect(PT101.p, PTin) annotation (Line(points={{-29.8,64},{-32,64},{-32,131.5},{90,131.5},{90,10},{110,10}}, color={0,0,127}));
  connect(PT102.p, PTout) annotation (Line(points={{29.8,82},{34,82},{34,129.5},{88,129.5},{88,-10},{110,-10}}, color={0,0,127}));
  connect(GB.inletfuel, inletFuel) annotation (Line(
      points={{21.6,-96.5},{30,-96.5},{30,-125},{54,-125},{54,-122}},
      color={182,109,49},
      thickness=0.5));
  connect(GB.inlet, PL_S100_FT101_GB101.outlet) annotation (Line(
      points={{-10.8,-67.7},{-10.8,-55},{-20,-55},{-20,-33.5}},
      color={140,56,54},
      thickness=0.5));
  connect(GB.outlet, PL_S100_GB101_P101.inlet) annotation (Line(
      points={{10.8,-67.7},{10.8,-55},{20,-55},{20,-34}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.wall, PL_S100_GB101_P101.wall) annotation (Line(
      points={{15.9,34},{8,34},{8,34.5},{0,34.5},{0,-24},{15.9,-24}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S100_FT101_GB101.wall, PL_S100_GB101_P101.wall) annotation (Line(
      points={{-15.9,-23.5},{0,-23.5},{0,-24},{15.9,-24}},
      color={255,101,98},
      thickness=0.5));
  connect(MultiPort, PL_S100_GB101_P101.wall) annotation (Line(
      points={{-110,-80},{-29.5,-80},{-29.5,-45},{0,-45},{0,-24},{15.9,-24}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.outlet, PT102.inlet) annotation (Line(
      points={{20,44},{20,73},{19.5,73},{19.5,82},{19.6,82}},
      color={140,56,54},
      thickness=0.5));
  connect(TT102.inlet, PT102.inlet) annotation (Line(
      points={{19.6,92},{19.6,82}},
      color={140,56,54},
      thickness=0.5));
  connect(pumpset, P101.in_m_flow) annotation (Line(points={{-110,70},{-96.5,70},{-96.5,139},{8,139},{8,0.2},{14.48,0.2}}, color={0,0,127}));
  annotation (                                                   Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}}, grid={0.5,0.5})));
end GasBoilerFC;
