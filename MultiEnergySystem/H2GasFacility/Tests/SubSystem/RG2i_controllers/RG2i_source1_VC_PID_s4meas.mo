within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_source1_VC_PID_s4meas
  "Valve controller at REMI and PID at injection with close measurement sensor."
  extends RG2i_pipes_users(
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))),
    X_start={1,0},
    break connect(GRM_1.inlet, s21.outlet),
    break connect(s4e8.outlet, s9e11.inlet));
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
  Modelica.Blocks.Sources.Ramp SG_ref(
    offset=0,
    height=0.1,
    duration=0,
    startTime=50)   annotation (Placement(visible=true, transformation(
        origin={-169,-70},
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
    annotation (Placement(transformation(extent={{-190,-120},{-170,-100}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=6,
    Ti=0.6e3,
    Td=1.6e2,
    yMax=1,
    yMin=0)
    annotation (Placement(transformation(extent={{-130,-80},{-110,-60}})));
  Controllers.Valve_controller valve_controller(P_rng=(5.5 - 3.5)*10^5, P_max=
        5.5e5)
    annotation (Placement(transformation(extent={{-128,-12},{-108,8}})));
equation
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-182,-44},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione.outlet, vlave_immissione.inlet) annotation (Line(
      points={{-82,-44},{-96,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s3.inlet, vlave_immissione.outlet) annotation (Line(
      points={{-162,-44},{-116,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, GRM_1.inlet) annotation (Line(
      points={{182,-82},{208,-82}},
      color={182,109,49},
      thickness=0.5));
  connect(s9e11.inlet, idealYSensor.outlet) annotation (Line(
      points={{-152,-110},{-170,-110}},
      color={182,109,49},
      thickness=0.5));
  connect(idealYSensor.inlet, s4e8.outlet) annotation (Line(
      points={{-190,-110},{-200,-110},{-200,-92}},
      color={182,109,49},
      thickness=0.5));
  connect(PID.y, vlave_immissione.opening) annotation (Line(points={{-109,-70},
          {-106,-70},{-106,-52}}, color={0,0,127}));
  connect(SG_ref.y, PID.u_s)
    annotation (Line(points={{-158,-70},{-132,-70}}, color={0,0,127}));
  connect(idealYSensor.Y_meas, PID.u_m) annotation (Line(points={{-176.2,-102.6},
          {-120,-102.6},{-120,-82}}, color={0,0,127}));
  connect(valve_controller.ACT_x, valveLinearOpening.opening) annotation (Line(
        points={{-106.6,-2},{-102,-2},{-102,18}}, color={0,0,127}));
  connect(valve_controller.P_meas, idealPressureSensor.p_meas) annotation (Line(
        points={{-128.8,-2},{-138,-2},{-138,0},{-154,0},{-154,16},{-135.8,16},{
          -135.8,18.6}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10800,
      Tolerance=0.001,
      __Dymola_Algorithm="Dassl"));
end RG2i_source1_VC_PID_s4meas;
