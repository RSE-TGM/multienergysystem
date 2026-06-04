within MultiEnergySystem.H2GasFacility.Tests.Components.Controllers;
model PIDdz "PID with dead zone"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4H2;
      //MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay;
  parameter Integer nX = 2 "Number of components in the gas fluid";
  //parameter Types.MassFraction  X_start[nX] = H2GasFacility.Data.MassMolFractionData.NG_Paolini_Algerian.X;
  parameter Types.MassFraction  X_start[nX] = {1,0};
  parameter Boolean useEnergyDemand = false;
  parameter Boolean massFractionDynamicBalance = false;
  parameter Boolean constantFrictionFactor = false;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.657;

  parameter Types.Pressure p_nom = 4.93e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
  parameter Integer nV = 3;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(
    H=Data.PipelineData_2i.s1.h,
    cm=Data.PipelineData_2i.s1.cm,
    rhom=Data.PipelineData_2i.s1.rhom,
    lambdam=Data.PipelineData_2i.s1.lambdam,
    m_flow_start=Data.PipelineData_2i.s1.m_flow_start,
    pin_start=Data.PipelineData_2i.s1.pin_start,
    pout_start=Data.PipelineData_2i.s1.pout_start,
    redeclare model Gas = Medium,
    pin_nom=Data.PipelineData_2i.s1.pin_start,
    rho_nom=Data.PipelineData_2i.s1.rho_nom,
    ff_nom=FrictionFactor,
    nX=nX,
    n=nV,
    kappa=Data.PipelineData_2i.s1.kappa,
    k=Data.PipelineData_2i.s1.k,
    L=Data.PipelineData_2i.s1.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s1.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-26,2})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    m_flow_nom=0.4138,
    A_v=2*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5)),
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={44,2})));
  Sensors.IdealPressureSensor               idealPressureSensor(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,2})));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.9*10^5,
    height=0.3*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-27,-22},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.H2GasFacility.Controllers.AWPID_deadzone
                                           aWPID_deadzone(
    Kp=1e-3,
    Ki=1,
    Ti=1e6,
    y_start=0.5)
    annotation (Placement(transformation(extent={{12,-36},{32,-16}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={82,2})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    p0=490000,
    T0=288.15,
    X0=X_start,
    use_in_p0=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,2})));
  Modelica.Blocks.Sources.Ramp p_in(
    offset=4.8*10^5,
    height=0.2*10^5,
    duration=0,
    startTime=500) annotation (Placement(visible=true, transformation(
        origin={-89,-28},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{72,2},{54,2}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet,idealPressureSensor. outlet) annotation (Line(
      points={{-16,2},{4,2}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor.inlet,valveLinearOpening. outlet) annotation (
      Line(
      points={{24,2},{34,2}},
      color={182,109,49},
      thickness=0.5));
  connect(p_ref.y,aWPID_deadzone. REF)
    annotation (Line(points={{-16,-22},{12,-22}},color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPID_deadzone. FeedBack) annotation (Line(
        points={{10.2,-5.4},{0,-5.4},{0,-30},{12,-30}},         color={0,0,127}));
  connect(aWPID_deadzone.controlAction,valveLinearOpening. opening)
    annotation (Line(points={{33,-26},{44,-26},{44,-6}},     color={0,0,127}));
  connect(sinkPressure.inlet, s1.outlet) annotation (Line(
      points={{-64,2},{-36,2}},
      color={182,109,49},
      thickness=0.5));
  connect(p_in.y, sinkPressure.in_p0) annotation (Line(points={{-78,-28},{-70,-28},
          {-70,-6.4}}, color={0,0,127}));
  annotation (experiment(StopTime=2000, __Dymola_Algorithm="Dassl"));
end PIDdz;
