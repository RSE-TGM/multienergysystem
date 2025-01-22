within MultiEnergySystem.H2GasFacility.Tests.SubSystem.Rete_Gas_2i_NG;
model TestProgressive
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  extends Modelica.Icons.Example;

  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4
    constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;

  // Parameters
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = false;
  parameter Boolean constantFrictionFactor = false;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 1 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {1};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.657;

  parameter Types.Pressure p_nom = 4.93e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
  //parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
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
    n=nV,
    kappa=Data.PipelineData_2i.s1.kappa,
    k=Data.PipelineData_2i.s1.k,
    L=Data.PipelineData_2i.s1.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s1.Di,
    quasiStatic=quasiStatic,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-40,0})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_nom=0.41245 + 0*0.41055,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,0})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={64,0})));
  Sensors.IdealPressureSensor idealPressureSensor(
    redeclare model Medium = Medium,
    pin_start=493000,
    pout_start=493000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    m_flow_start=0.4110)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Controllers.Valve_controller valve_controller
    annotation (Placement(transformation(extent={{4,-36},{24,-16}})));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow
                                     sink_demand(
    G=1e-10,
    redeclare model Medium = Medium,
    T0(displayUnit="K") = 15 + 273.15,
    X0=X_start,
    m_flow0=Data.PipelineData_2i.s1.m_flow_start,
    p0=Data.PipelineData_2i.s1.pout_start,
    pin_start=Data.PipelineData_2i.s1.pout_start,
    use_in_m_flow0=false)                                                                                                                                                      annotation (
    Placement(visible = true, transformation(origin={-74,0},  extent={{10,-10},{-10,10}},      rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{4,-60},{24,-40}})));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{54,0},{40,0}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet,idealPressureSensor. outlet) annotation (Line(
      points={{-30,0},{-10,0}},
      color={182,109,49},
      thickness=0.5));
  connect(idealPressureSensor.inlet,valveLinearOpening. outlet) annotation (
      Line(
      points={{10,0},{20,0}},
      color={182,109,49},
      thickness=0.5));
  connect(valve_controller.P_meas,idealPressureSensor. p_meas) annotation (Line(
        points={{3.2,-26},{-6,-26},{-6,-8},{-3.8,-8},{-3.8,-7.4}},        color=
         {0,0,127}));
  connect(s1.outlet, sink_demand.inlet) annotation (Line(
      points={{-50,7.77156e-16},{-57,7.77156e-16},{-57,0},{-64,0}},
      color={182,109,49},
      thickness=0.5));
  connect(valve_controller.ACT_x, valveLinearOpening.opening) annotation (Line(points={{25.4,-26},{30,-26},{30,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end TestProgressive;
