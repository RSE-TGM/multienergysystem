within MultiEnergySystem.H2GasFacility.Tests.Components.Valves;
model Valve_REMI "Valve test to validate the REMI System"
extends Modelica.Icons.Example;
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;
  parameter Types.MassFraction X_start[1] = {1};
  parameter Boolean useEnergyDemand = false;
  parameter Boolean quasiStatic = true;
  parameter Boolean constantFrictionFactor = true;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 7 "Number of components in the gas fluid";
  //parameter Types.MassFraction X_start[nX] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter Types.MassFraction X_start_H2[nX] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.712;

  parameter Types.Pressure p_nom = 1.5e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;

  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start=X_start,
    rho_in_nom=40.17625,
    PressureDropLinear=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-2,4})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(
      redeclare model Medium = Medium,
    p0=6000000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,4})));
  MultiEnergySystem.H2GasFacility.Sources.SinkPressure sinkPressure(
    redeclare model Medium = Medium,
    p0=493000,
    T0=288.15,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-78,4})));
  inner System system(T_amb=288.15)
    annotation (Placement(transformation(extent={{-90,76},{-70,96}})));
  Modelica.Blocks.Sources.Ramp opening1(
    height=-1,
    duration=300,
    offset=1,
    startTime=200)                                                                                 annotation (
    Placement(visible = true, transformation(origin={34,-44},    extent = {{-10, -10}, {10, 10}}, rotation=0)));
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
    n=9,
    kappa=Data.PipelineData_2i.s1.kappa,
    k=Data.PipelineData_2i.s1.k,
    redeclare model Medium = Medium,
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
        origin={-42,4})));
equation
  connect(sourcePressure.outlet, valveLinearOpening.inlet) annotation (Line(
      points={{64,4},{8,4}},
      color={182,109,49},
      thickness=0.5));
  connect(opening1.y, valveLinearOpening.opening)
    annotation (Line(points={{45,-44},{50,-44},{50,-14},{-2,-14},{-2,-4}},
                                                        color={0,0,127}));
  connect(sinkPressure.inlet, s1.outlet) annotation (Line(
      points={{-68,4},{-52,4}},
      color={182,109,49},
      thickness=0.5));
  connect(s1.inlet, valveLinearOpening.outlet) annotation (Line(
      points={{-32,4},{-12,4}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=500, __Dymola_Algorithm="Dassl"));
end Valve_REMI;
