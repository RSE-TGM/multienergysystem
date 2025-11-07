within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_source1_Ycontrol
  "Immission is modeled as the REMI station, considering valve opening with respect to H2 mass composition fraction."
  extends RG2i_pipes_users(
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))),
    X_start={1,0},
    break connect(GRM_1.inlet, s21.outlet));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
    n=nV,
    H=Data.PipelineData_2i.s3.h,
    cm=Data.PipelineData_2i.s3.cm,
    rhom=Data.PipelineData_2i.s3.rhom,
    lambdam=Data.PipelineData_2i.s3.lambdam,
    m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
    pin_start=Data.PipelineData_2i.s3.pin_start,
    pout_start=Data.PipelineData_2i.s3.pout_start,
    kappa=Data.PipelineData_2i.s3.kappa,
    k=Data.PipelineData_2i.s3.k,
    redeclare model Gas = Medium,
    L=Data.PipelineData_2i.s3.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s3.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-172,-44})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening vlave_immissione(
    m_flow_nom=0.4138,
    A_v=0.1*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5)),
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start={0,1},
    PressureDropLinear=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-106,-44})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure Immissione(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0={0,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-72,-44})));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.93*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-161,4},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Blocks.Sources.Ramp SG_ref(
    offset=0,
    height=0.10,
    duration=0,
    startTime=50)   annotation (Placement(visible=true, transformation(
        origin={-161,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sensors.IdealYSensor idealYSensor(
    redeclare model Medium = Medium,
    pin_start=Data.PipelineData_2i.s21.pin_start,
    pout_start=Data.PipelineData_2i.s21.pin_start,
    Tin_start=Data.PipelineData_2i.s21.Tin_start,
    Tout_start=Data.PipelineData_2i.s21.Tin_start,
    X_start=X_start,
    p_start=Data.PipelineData_2i.s21.pin_start,
    element=2,
    m_flow_start=Data.PipelineData_2i.s21.m_flow_start)
    annotation (Placement(transformation(extent={{186,-52},{206,-32}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    k=4,
    Ti=15000000,
    yMax=1,
    yMin=0)
    annotation (Placement(transformation(extent={{-132,-78},{-112,-58}})));
equation
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-182,-44},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione.outlet, vlave_immissione.inlet) annotation (Line(
      points={{-82,-44},{-96,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-150,4},{-114,
          4}},                   color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-135.8,-4},{-114,-4}},
                                 color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-95,0},{-90,0},{-90,2},{-88,2},{-88,18},{-102,18}},
        color={0,0,127}));
  connect(s3.inlet, vlave_immissione.outlet) annotation (Line(
      points={{-162,-44},{-116,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_1.inlet, idealYSensor.outlet) annotation (Line(
      points={{208,-82},{206,-82},{206,-42}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, idealYSensor.inlet) annotation (Line(
      points={{182,-82},{186,-82},{186,-42}},
      color={182,109,49},
      thickness=0.5));
  connect(SG_ref.y, PID.u_s) annotation (Line(points={{-150,-70},{-142,-70},{
          -142,-68},{-134,-68}}, color={0,0,127}));
  connect(PID.y, vlave_immissione.opening) annotation (Line(points={{-111,-68},
          {-108,-68},{-108,-56},{-106,-56},{-106,-52}}, color={0,0,127}));
  connect(PID.u_m, idealYSensor.Y_meas) annotation (Line(points={{-122,-80},{
          -122,-88},{40,-88},{40,-18},{199.8,-18},{199.8,-34.6}}, color={0,0,
          127}));
  annotation (experiment(StopTime=20000, __Dymola_Algorithm="Dassl"));
end RG2i_source1_Ycontrol;
