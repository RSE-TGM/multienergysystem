within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_PID_source2_sensor
  extends RG2i_pipes_users(       redeclare model Medium =
        MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2,
    nX=2,
    X_start={1,0},
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))));

    parameter Types.MassFraction X_inj[nX] = {1, 0};
  Sensors.IdealPressureSensor idealPressureSensor1(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-240,220})));
  MultiEnergySystem.H2GasFacility.Sources.SourceMassFlow Immissione_2(
    X0=X_inj,
    redeclare model Medium = Medium,
    p0=480000,
    G=1e-8,
    T0=288.15,
    computeEnthalpyWithFixedPressure=true,
    m_flow0=0,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={-292,224},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H1(
    height=25/3600,
    duration=300,
    offset=0*0.001,
    startTime=3600)                                                                                         annotation (
    Placement(visible = true, transformation(origin={-399,236},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow_H5(
    height=(-25/3600),
    duration=300,
    startTime=18000,
    offset=0)                                                                                               annotation (
    Placement(visible = true, transformation(origin={-397,272},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-338,244},{-318,264}})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17e16(
    n=6,
    L=Data.PipelineData_2i.sds17.L + Data.PipelineData_2i.sds16.L,
    H=Data.PipelineData_2i.sds17.h + Data.PipelineData_2i.sds16.h,
    cm=Data.PipelineData_2i.sds17.cm,
    rhom=Data.PipelineData_2i.sds17.rhom,
    lambdam=Data.PipelineData_2i.sds17.lambdam,
    m_flow_start=Data.PipelineData_2i.sds17.m_flow_start,
    pin_start=Data.PipelineData_2i.sds17.pin_start,
    pout_start=Data.PipelineData_2i.sds16.pout_start,
    kappa=Data.PipelineData_2i.sds17.kappa,
    k=Data.PipelineData_2i.sds17.k,
    redeclare model Gas = Medium,
    X_start=X_start,
    Di=Data.PipelineData_2i.sds17.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-198,220})));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-5,
    Kd=0,
    Ki=1,
    Ti=5e9,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-128,-32},{-108,-12}})));
  Modelica.Blocks.Sources.Ramp p_ref(
    height=0*10^5,
    startTime=8000,
    offset=4.8*10^5,
    duration=0)     annotation (Placement(visible=true, transformation(
        origin={-165,-2},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(add1.y,Immissione_2. in_m_flow0) annotation (Line(points={{-317,254},{
          -292,254},{-292,242},{-296,242},{-296,229},{-298,229}},
                                             color={0,0,127}));
  connect(m_flow_H5.y,add1. u1) annotation (Line(points={{-386,272},{-376,272},{
          -376,274},{-362,274},{-362,260},{-340,260}}, color={0,0,127}));
  connect(m_flow_H1.y,add1. u2) annotation (Line(points={{-388,236},{-378,236},{
          -378,234},{-340,234},{-340,248}},  color={0,0,127}));
  connect(sds17e16.outlet, sds13.inlet) annotation (Line(
      points={{-188,220},{-54,220},{-54,202},{14,202}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione_2.outlet, idealPressureSensor1.inlet) annotation (Line(
      points={{-282,224},{-260,224},{-260,220},{-250,220}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor1.outlet, sds17e16.inlet) annotation (Line(
      points={{-230,220},{-208,220}},
      color={182,109,49},
      thickness=0.5));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-107,-22},{-107,-24},{-100,-24},{-100,8},{-104,8},
          {-104,18},{-102,18}}, color={0,0,127}));
  connect(p_ref.y, aWPIDContinuous.REF) annotation (Line(points={{-154,-2},{-148,
          -2},{-148,-18},{-126,-18}}, color={0,0,127}));
  connect(idealPressureSensor1.p_meas, aWPIDContinuous.FeedBack) annotation (
      Line(points={{-236.2,212.6},{-234,212.6},{-234,-58},{-150,-58},{-150,-26},
          {-126,-26}}, color={0,0,127}));
  annotation (experiment(
      StopTime=360000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end RG2i_PID_source2_sensor;
