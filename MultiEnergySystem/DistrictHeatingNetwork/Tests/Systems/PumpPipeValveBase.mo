within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model PumpPipeValveBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  // System
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start = 60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start = 2.8e5;
  parameter Real q_m3h_start(unit = "m3/h") = 9.25;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow[:, :] = [0, m_flow_start; 100, m_flow_start];
  parameter DistrictHeatingNetwork.Types.Pressure pout[:, :] = [0, pout_start; 100, pout_start];
  final parameter Types.MassFlowRate m_flow_start = q_m3h_start/3600*985;
  // Valve
  parameter Real Kv = Valve.FCV101.Kv;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve = pin_start_pipe;
  parameter Real theta[:, :] = [0, 1];
  // Pipe
  parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L = 1;
  parameter DistrictHeatingNetwork.Types.Length h = 1;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_pipe = pout_start_pump;
  // Pump
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_pump = pin_start;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_pump = pin_start_pump + dp_start_pump;
  parameter DistrictHeatingNetwork.Types.Pressure dp_start_pump = Pump.P101.dpnom;
  parameter Real omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 200, 2*pi*30; 300, 2*pi*30];



  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump pump(redeclare model Medium = Medium,
      Tin_start=Pump.P101.Tin_start,
      Tout_start=Pump.P101.Tout_start,
      hin_start=Pump.P101.hin_start,
      pin_start=Pump.P101.pin_start,
      pout_start=Pump.P101.pout_start,
      a=Pump.P101.a,
      b=Pump.P101.b,
      m_flow_start=m_flow_start,
      dpnom=Pump.P101.dpnom,
      etaelec=Pump.P101.etaelec,
      etamech=Pump.P101.etamech,
      etanom=Pump.P101.etanom,
      headnom=Pump.P101.headnom,
      headmax=Pump.P101.headnommax,
      headmin=Pump.P101.headnommin,
      m_flow_nom=Pump.P101.m_flow_nom,
      omeganom=Pump.P101.omeganom,
      qnom_inm3h=Pump.P101.qnom_inm3h,
      qnom_inm3h_min=Pump.P101.qnommin_inm3h,
      rhonom=Pump.P101.rhonom,
      qnom_inm3h_max=Pump.P101.qnommax_inm3h,
    use_in_omega=true)                        annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV pipe(redeclare model Medium = Medium, n=n,
    L=L,
    h=h,                                                                                                                                                   t = t,
    pin_start=pin_start_pipe,
    Tin_start=Tin_start,
    Tout_start=Tin_start,                                                                                                                                                                                                        Di = Di,
    q_m3h_start=q_m3h_start,
    hctype=hctype)      annotation (Placement(transformation(extent={{-14,-14},{14,14}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve valve(redeclare model Medium = Medium,
    Kv=Kv,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    q_m3h_nom=Valve.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tin_start,
    pin_start=pin_start_valve,
    q_m3h_start=q_m3h_start)
                       annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Sources.SinkPressure sinkP(redeclare model Medium = Medium,
    use_in_p0=true,
    p0=pout_start,
    T0=Tin_start)                                             annotation (Placement(transformation(extent={{70,10},{90,-10}})));
  Modelica.Blocks.Sources.TimeTable thetaSet(table=theta)
                                             annotation (Placement(transformation(extent={{12,20},{32,40}})));
  Modelica.Blocks.Sources.TimeTable omegaSet(table=omega)
                                             annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  inner MultiEnergySystem.System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Sources.SourceMassFlow sourceMassFlow(redeclare model Medium = Medium,
    use_in_m_flow=true,
    p0=pin_start,
    T0=Tin_start,
    m_flow0=m_flow_start)                                                annotation (Placement(transformation(extent={{-80,10},{-60,-10}})));
  Modelica.Blocks.Sources.TimeTable m_flowSet(table=m_flow)
                                             annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.TimeTable poutSet(table=pout)  annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
equation
  connect(pump.outlet, pipe.inlet) annotation (Line(
      points={{-32,0},{-23,0},{-23,1.77636e-15},{-14,1.77636e-15}},
      color={140,56,54},
      thickness=0.5));
  connect(pipe.outlet, valve.inlet) annotation (Line(
      points={{14,1.77636e-15},{22,1.77636e-15},{22,0},{30,0}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkP.inlet, valve.outlet) annotation (Line(
      points={{70,0},{50,0}},
      color={140,56,54},
      thickness=0.5));
  connect(thetaSet.y, valve.opening) annotation (Line(points={{33,30},{40,30},{40,8}}, color={0,0,127}));
  connect(omegaSet.y, pump.in_omega) annotation (Line(points={{-49,30},{-44,30},{-44,5}}, color={0,0,127}));
  connect(sourceMassFlow.outlet, pump.inlet) annotation (Line(
      points={{-60,0},{-48,0}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flowSet.y, sourceMassFlow.in_m_flow) annotation (Line(points={{-79,-30},{-76,-30},{-76,-5}}, color={0,0,127}));
  connect(poutSet.y, sinkP.in_p0) annotation (Line(points={{71,-30},{76,-30},{76,-8.4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PumpPipeValveBase;
