within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Storage;
model StratifiedTankTest "Test of a single stratified tank"
  extends Modelica.Icons.Example;

  parameter Integer n = 41 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";

  parameter Types.Pressure pin_start_S2 = 2.1e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 30 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 2;
  final parameter Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter Types.MassFlowRate m_flow_S2 = q*985;

  parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.8; 200, 0.8];

// Pipe length
  parameter Types.Length L_S2_PL0 = 24.5;
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;
  parameter Types.Length L_S2_PL7 = 2;
  parameter Types.Length L_S2_PL8 = 3;
  parameter Types.Length L_S2_PL9 = 21.5;

  parameter Types.Length L_S2_S201_S202 = 2.5;
  parameter Types.Length h_S2_S201_S202 = 0;
  parameter Types.Length L_S2_Tanks_High = 2.5;
  parameter Types.Length h_S2_Tanks_High = -2.5;
  parameter Types.Length L_S2_S201_FT201 = 1;
  parameter Types.Length h_S2_S201_FT201 = 0;
  parameter Types.Length L_S2_D201_FT201 = 2;
  parameter Types.Length h_S2_D201_FT201 = 0;

  inner MultiEnergySystem.System system annotation (
    Placement(visible = true, transformation(origin={90,90},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.StratifiedStorage
    D201(H=4,
    D=1.75,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2, n = n)
    annotation (Placement(transformation(extent={{-16,-50},{-58,18}})));
  Sources.SourcePressure source(p0=pin_start_S2, T0=Tin_start_S2,
    R=1e-3)
    annotation (Placement(transformation(extent={{60,-48},{40,-28}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    use_in_T=true,
    pin_start=pout_start_S2_tank,
    p0=pout_start_S2_tank,
    T0=Tout_start_S2,
    m_flow0=m_flow_S2,
    G=1e-8)
    annotation (Placement(transformation(extent={{36,-4},{56,16}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-2*m_flow_S2,
    duration=1500,
    offset=m_flow_S2,
    startTime=1000)
    annotation (Placement(transformation(extent={{70,20},{50,40}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
    L=L_S2_PL9,
    t=t_S2,
    pin_start=pout_start_S2,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={8,6})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
    L=L_S2_PL0,
    t=t_S2,
    pin_start=pin_start_S2,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={16,-38})));

  Modelica.Blocks.Sources.Ramp ramp1(
    height=-15,
    duration=1500,
    offset=Tout_start_S2,
    startTime=3e4)
    annotation (Placement(transformation(extent={{70,52},{50,72}})));
equation

  connect(ramp.y, sink.in_m_flow) annotation (Line(points={{49,30},{40,30},{40,11}}, color={0,0,127}));
  connect(sink.inlet, PL_S200_rCD_hot.outlet) annotation (Line(
      points={{36,6},{18,6}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, PL_S200_rCD_cold.inlet) annotation (Line(
      points={{40,-38},{26,-38}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_cold.outlet, D201.inlet) annotation (Line(
      points={{6,-38},{-5,-38},{-5,-37.25},{-16,-37.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S200_rCD_hot.inlet, D201.outlet) annotation (Line(
      points={{-2,6},{-9,6},{-9,5.25},{-16,5.25}},
      color={140,56,54},
      thickness=0.5));
  connect(ramp1.y, sink.in_T) annotation (Line(points={{49,62},{46,62},{46,11}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=60000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end StratifiedTankTest;
