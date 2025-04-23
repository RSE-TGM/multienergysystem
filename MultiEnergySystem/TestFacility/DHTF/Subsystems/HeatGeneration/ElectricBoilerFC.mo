within MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration;
model ElectricBoilerFC "System 400 with ideal flow control"
  extends TestFacility.DHTF.Interfaces.SystemInterfaceBaseI(MultiPort(n=n));
  extends BaseClass.ElectricBoilerBase;
  import pipeData = MultiEnergySystem.TestFacility.Data.PipelineData.S400;
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB(
    redeclare model Medium = Medium,
    Tout_start=Tout_start,
    D=D,
    Pmaxnom=Pmaxnom,
    Pnimnom=Pminnom,
    Pnom=Pmaxnom,
    Tin_start=Tin_start,
    etanom=0.98,
    h=h,
    m_flow_nom=m_flow_nom,
    pin_start=pin_start,
    pout_start=pout_start,
    nR=nR,
    Pmaxres=Pmaxres)   annotation (Placement(visible=true, transformation(
        origin={4,-106},
        extent={{-22,-22},{22,22}},
        rotation=0)));
  DistrictHeatingNetwork.Components.TurboMachines.ControlledPump
    P401(
    redeclare model Medium = Medium,
    Tin_start(displayUnit="K") = TestFacility.Data.PumpData.P401.Tin_start,
    Tout_start(displayUnit="K") = TestFacility.Data.PumpData.P401.Tout_start,
    a=TestFacility.Data.PumpData.P401.a,
    b=TestFacility.Data.PumpData.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=TestFacility.Data.PumpData.P401.dpnom,
    etaelec=TestFacility.Data.PumpData.P401.etaelec,
    etamech=TestFacility.Data.PumpData.P401.etamech,
    etanom=TestFacility.Data.PumpData.P401.etanom,
    hin_start=TestFacility.Data.PumpData.P401.hin_start,
    m_flow_nom=TestFacility.Data.PumpData.P401.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.P401.omeganom,
    pin_start(displayUnit="Pa") = TestFacility.Data.PumpData.P401.pin_start,
    pout_start(displayUnit="Pa") = TestFacility.Data.PumpData.P401.pout_start,
    headnom=TestFacility.Data.PumpData.P401.headnom,
    qnom_inm3h=TestFacility.Data.PumpData.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.P401.rhonom,
    headmax=TestFacility.Data.PumpData.P401.headnommax,
    headmin=TestFacility.Data.PumpData.P401.headnommin,
    qnom_inm3h_min=TestFacility.Data.PumpData.P401.qnommin_inm3h,
    qnom_inm3h_max=TestFacility.Data.PumpData.P401.qnommax_inm3h)
                                            annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={24,-17.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_EB401_P401(
    set_m_flow_start=true,
    m_flow_start=m_flow_S4,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_EB401_P401.L,
    h=pipeData.PL_EB401_P401.h,
    t=pipeData.PL_EB401_P401.t,
    pin_start=pout_start,
    Tin_start=Tout_start,
    Tout_start=Tout_start,
    Di=pipeData.PL_EB401_P401.Di,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype,
    cf=cf)                "Pipe connecting outlet of electric boiler and pump P401"
              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={24,-48.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_PT401_EB401(
    set_m_flow_start=true,
    m_flow_start=m_flow_S4,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_PT401_EB401.L,
    h=pipeData.PL_PT401_EB401.h,
    t=pipeData.PL_PT401_EB401.t,
    pin_start=pin_start,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    Di=pipeData.PL_PT401_EB401.Di,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype,
    cf=cf)                "Pipe connecting pressure sensor PT401 and inlet of electric boiler"
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-16,-48.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_P401_FCV401(
    set_m_flow_start=true,
    m_flow_start=m_flow_S4,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=pipeData.PL_P401_FCV401.L,
    h=pipeData.PL_P401_FCV401.h,
    t=pipeData.PL_P401_FCV401.t,
    pin_start=pout_start,
    Tin_start=Tout_start,
    Tout_start=Tout_start,
    Di=pipeData.PL_P401_FCV401.Di,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype,
    cf=cf)                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={24,11.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(
    redeclare model Medium = Medium,
    T_start=Tout_start,
    p_start=pout_start)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={26,77.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={26,63.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-14,71.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(
    redeclare model Medium = Medium,
    T_start=Tin_start,
    p_start=pin_start)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-14,85.5})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT(
    redeclare model Medium = Medium,
    T_start=Tin_start,
    p_start=pin_start) annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-19,54.5})));
  ElectricNetwork.Interfaces.ElectricPortInlet inletPower annotation (Placement(transformation(extent={{-119.5,-65.5},{-99.5,-45.5}}),
                                                                                                                                iconTransformation(extent={{-120,-60},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput Pe annotation (Placement(transformation(extent={{100,-40},{120,-20}}), iconTransformation(extent={{100,-40},{120,-20}})));
equation
  Pe = P401.W;
  connect(P401.inlet,PL_S400_EB401_P401. outlet) annotation (Line(
      points={{24,-27.1},{24,-38.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{23.6,77.5},{24,77.5},{24,71.5},{23.6,71.5},{23.6,63.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-16.4,71.5},{-16.4,85.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_P401_FCV401.inlet,P401. outlet) annotation (Line(
      points={{24,1.5},{24,-7.9}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet, outlet) annotation (Line(
      points={{23.6,77.5},{20,77.5},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, inlet) annotation (Line(
      points={{-16.4,85.5},{-16.4,110},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(Toutset,EB. Tout_ref) annotation (Line(points={{-110,30},{-86.5,30},{-86.5,-132},{-17.5,-132},{-17.5,-106},{-11.4,-106}},
                                                                                                    color={0,0,127}));
  connect(status,EB. heat_on) annotation (Line(points={{-110,10},{-89.5,10},{-89.5,-134.5},{-15.5,-134.5},{-15.5,-117},{-11.4,-117}},
                                                                                                    color={255,0,255}));
  connect(m_flow_,FT. m_flow) annotation (Line(points={{110,70},{101,70},{101,136},{-31,136},{-31,45},{-23,45},{-23,46},{-23.2,46},{-23.2,49.6}},           color={0,0,127}));
  connect(TTin,TT401. T) annotation (Line(points={{110,50},{99.5,50},{99.5,134.5},{-4,134.5},{-4,85.5},{-6.2,85.5}},
                                                                                                              color={0,0,127}));
  connect(TTout,TT402. T) annotation (Line(points={{110,30},{97.5,30},{97.5,133.5},{36,133.5},{36,77.5},{33.8,77.5}},
                                                                                                              color={0,0,127}));
  connect(PTin,PT401. p) annotation (Line(points={{110,10},{96,10},{96,132.5},{-2,132.5},{-2,71.5},{-6.2,71.5}},
                                                                                                          color={0,0,127}));
  connect(PTout,PT402. p) annotation (Line(points={{110,-10},{94.5,-10},{94.5,131.5},{38,131.5},{38,63.5},{33.8,63.5}},
                                                                                                                color={0,0,127}));
  connect(PT401.inlet,FT. inlet) annotation (Line(
      points={{-16.4,71.5},{-16.4,77.5},{-16,77.5},{-16,58.7},{-16.2,58.7}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.outlet,PL_S400_PT401_EB401. inlet) annotation (Line(
      points={{-16.2,50.3},{-16.2,28.5},{-16,28.5},{-16,-38.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EB.inlet,PL_S400_PT401_EB401. outlet) annotation (Line(
      points={{-2.6,-88.4},{-2.6,-71},{-16,-71},{-16,-58.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EB.outlet,PL_S400_EB401_P401. inlet) annotation (Line(
      points={{10.6,-88.4},{10.6,-71.5},{24,-71.5},{24,-58.5}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB401.wall,PL_S400_EB401_P401. wall) annotation (Line(
      points={{-11.9,-48.5},{19.9,-48.5}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S400_P401_FCV401.wall,PL_S400_EB401_P401. wall) annotation (Line(
      points={{19.9,11.5},{4,11.5},{4,-48.5},{19.9,-48.5}},
      color={255,101,98},
      thickness=0.5));
  connect(MultiPort,PL_S400_EB401_P401. wall) annotation (Line(
      points={{-110,-80},{4,-80},{4,-48.5},{19.9,-48.5}},
      color={255,101,98},
      thickness=0.5));
  connect(EB.inletPower, inletPower) annotation (Line(
      points={{19.4,-106},{25.5,-106},{25.5,-105.5},{30,-105.5},{30,-137.5},{-94.5,-137.5},{-94.5,-55.5},{-109.5,-55.5}},
      color={56,93,138},
      thickness=1));
  connect(PT402.inlet, PL_S400_P401_FCV401.outlet) annotation (Line(
      points={{23.6,63.5},{23.5,63.5},{23.5,57},{23,57},{23,24.5},{24,24.5},{24,21.5}},
      color={140,56,54},
      thickness=0.5));
  connect(pumpset, P401.in_m_flow) annotation (Line(points={{-110,70},{-96.5,70},{-96.5,138.5},{8.5,138.5},{8.5,-22.3},{18.48,-22.3}}, color={0,0,127}));
  annotation (                                                   Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}}, grid={0.5,0.5})),
                                                                       Icon(coordinateSystem(grid={
            1,1}),                                                          graphics={Bitmap(
          extent={{-42,-50},{45,52}},
          imageSource="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",
          fileName="modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/light2.png")}));
end ElectricBoilerFC;
