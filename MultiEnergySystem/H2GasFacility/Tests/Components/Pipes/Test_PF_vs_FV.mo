within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model Test_PF_vs_FV
  "Base test model for a Plug Flow Pipe and Finite Volume Pipe"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      H2GasFacility.Media.IdealGases.NG4_H2                        constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  //parameter Types.MassFraction Xref[:] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X "Nominal mass fraction";
  parameter Types.MassFraction Xref[:] = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477};
  //parameter Types.MassFraction X_start[7] = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X;
  parameter Types.MassFraction X_start[:] = {0.94626, 0.0339757, 0.0105162, 0.0001, 0.0092477};
  parameter Boolean useEnergyDemand = false;
  parameter Boolean massFractionDynamicBalance = false;
  parameter Boolean constantFrictionFactor = true;
  parameter Boolean computeInertialTerm = false;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
  parameter Types.MassFlowRate m_flow_start = Pipe.pipe1.m_flow_start "Initial mass flowrate in the sink";
  parameter Integer n = 3 "Number of volumes in Flow1DFV";
  parameter Types.Pressure pin_start = Pipe.pipe1.pin_start "Initial pressure at the inlet";
  parameter Types.Temperature Tin_start = Pipe.pipe1.Tin_start "Initial temperature at the inlet";
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  // Components
  inner MultiEnergySystem.System system(initOpt = MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.steadyState) annotation (
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.PipePF plugFlow(
    redeclare model Medium = Medium,
    allowFlowReversal=true,
    L=Pipe.pipe1.L,
    H=Pipe.pipe1.h,
    t=Pipe.pipe1.t,
    pmax=Pipe.pipe1.pmax,
    tIns=Pipe.pipe1.tIns,
    lambdaIns=Pipe.pipe1.lambdaIns,
    cm=Pipe.pipe1.cm,
    rhom=Pipe.pipe1.rhom,
    lambdam=Pipe.pipe1.lambdam,
    T_ext=system.T_amb,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=Xref,
    Di=Pipe.pipe1.Di,
    D=Pipe.pipe1.Di,
    T_start=Pipe.pipe1.Tin_start,
    T_start_m=Pipe.pipe1.Tin_start,
    rho_nom=Pipe.pipe1.rho_nom,
    cpm=8000) annotation (Placement(transformation(extent={{-6,-76},{26,-36}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP_PF(
    p0(displayUnit="Pa") = Pipe.pipe1.pin_start,
    T0=288.15,
    redeclare model Medium = Medium,
    X0=Xref,
    use_in_T0=true,
    use_in_p0=true) annotation (Placement(visible=true, transformation(
        origin={-44,-58},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp T_in(
    duration=10,
    height=5,
    offset=15 + 273.15,
    startTime=150) annotation (Placement(visible=true, transformation(
        origin={-110,12},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp p_in(
    height=-1.5e5,
    offset=2.5e5,
    duration=50,
    startTime=200) annotation (Placement(visible=true, transformation(
        origin={-110,-18},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sink_PF(
    T0(displayUnit="degC") = 303.15,
    p0=Pipe.pipe1.pout_start,
    pin_start=Pipe.pipe1.pout_start,
    X0=Xref,
    G=0,
    redeclare model Medium = Medium,
    m_flow0=m_flow_start,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={80,-56},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Ramp m_flow(
    duration=10,
    height=m_flow_start,
    offset=m_flow_start,
    startTime=50) annotation (Placement(visible=true, transformation(
        origin={54,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV round1DFV(
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    hctype=hctype,
    redeclare model Medium = Medium,
    L=Pipe.pipe1.L,
    H=Pipe.pipe1.h,
    t=Pipe.pipe1.t,
    pmax=Pipe.pipe1.pmax,
    tIns=Pipe.pipe1.tIns,
    lambdaIns=Pipe.pipe1.lambdaIns,
    cm=Pipe.pipe1.cm,
    rhom=Pipe.pipe1.rhom,
    lambdam=Pipe.pipe1.lambdam,
    T_ext=system.T_amb,
    m_flow_start=Pipe.pipe1.m_flow_start,
    pin_start=Pipe.pipe1.pin_start,
    pout_start=Pipe.pipe1.pout_start,
    hin_start=Pipe.pipe1.hin_start,
    Tin_start=Pipe.pipe1.Tin_start,
    Tout_start=Pipe.pipe1.Tout_start,
    X_start=Xref,
    Di=Pipe.pipe1.Di,
    n=10)
    annotation (Placement(transformation(extent={{-8,14},{28,50}})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourceP_FV(
    p0(displayUnit="Pa") = Pipe.pipe1.pin_start,
    T0=288.15,
    redeclare model Medium = Medium,
    X0=Xref,
    use_in_T0=true,
    use_in_p0=true) annotation (Placement(visible=true, transformation(
        origin={-44,32},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.H2GasFacility.Sources.SinkMassFlow sink_FV(
    T0(displayUnit="degC") = 303.15,
    p0=Pipe.pipe1.pout_start,
    pin_start=Pipe.pipe1.pout_start,
    X0=Xref,
    G=0,
    redeclare model Medium = Medium,
    m_flow0=m_flow_start,
    use_in_m_flow0=true) annotation (Placement(visible=true, transformation(
        origin={58,32},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(p_in.y, sourceP_PF.in_p0) annotation (Line(points={{-99,-18},{-48,-18},
          {-48,-49.6}}, color={0,0,127}));
  connect(T_in.y, sourceP_PF.in_T0)
    annotation (Line(points={{-99,12},{-44,12},{-44,-48.4}}, color={0,0,127}));
  connect(sourceP_PF.outlet, plugFlow.inlet) annotation (Line(
      points={{-34,-58},{-32,-58},{-32,-56},{-6,-56}},
      color={182,109,49},
      thickness=0.5));
  connect(m_flow.y, sink_PF.in_m_flow0)
    annotation (Line(points={{65,-10},{74,-10},{74,-51}}, color={0,0,127}));
  connect(plugFlow.outlet, sink_PF.inlet) annotation (Line(
      points={{26,-56},{70,-56}},
      color={182,109,49},
      thickness=0.5));
  connect(sourceP_FV.outlet, round1DFV.inlet) annotation (Line(
      points={{-34,32},{-8,32}},
      color={182,109,49},
      thickness=0.5));
  connect(round1DFV.outlet, sink_FV.inlet) annotation (Line(
      points={{28,32},{48,32}},
      color={182,109,49},
      thickness=0.5));
  connect(T_in.y, sourceP_FV.in_T0) annotation (Line(points={{-99,12},{-82,12},{
          -82,70},{-44,70},{-44,41.6}}, color={0,0,127}));
  connect(p_in.y, sourceP_FV.in_p0) annotation (Line(points={{-99,-18},{-70,-18},
          {-70,58},{-48,58},{-48,40.4}}, color={0,0,127}));
  connect(m_flow.y, sink_FV.in_m_flow0) annotation (Line(points={{65,-10},{74,-10},
          {74,46},{52,46},{52,37}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=500,
      Interval=0.0350042,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end Test_PF_vs_FV;
