within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTest "Test of System 100 with real data"
  extends Modelica.Icons.Example;

  parameter Integer n = 3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";

  parameter Real Kv_P101 = Valve.FCV101.Kv;
  // Temperatures and pressures

  parameter Types.Pressure pin_start_S1 = 1.695e5 - 0.09273e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;

  // Pipe Data

  parameter Types.Length L_S1_PL1 = 0.4;
  parameter Types.Length h_S1_PL1 = 0;
  parameter Types.Length L_S1_PL2 = 0.8;
  parameter Types.Length h_S1_PL2 = 0;
  parameter Types.Length L_S1_PL3 = 1.5;
  parameter Types.Length h_S1_PL3 = 0;
  parameter Types.Length L_S1_PL4 = 0.7;
  parameter Types.Length h_S1_PL4 = 0;

  parameter Types.Length L_TT101_FT101 = 0.7;
  parameter Types.Length h_TT101_FT101 = 0;
  parameter Types.Length L_FT101_GB101 = 1.25 + 0.7;
  parameter Types.Length h_FT101_GB101 = -0.7;
  parameter Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter Types.Length h_GB101_P101 = 0.7 + 0.95;
  parameter Types.Length L_P101_FCV101 = 1;
  parameter Types.Length h_P101_FCV101 = 1;

  parameter Types.Length L_S1_rCD_cold = 0.66+0.25+0.54+0.5+1.3+1+3+4+0.5+0.2+0.3 "12.25";
  parameter Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
  parameter Types.Length L_S1_rCD_hot = 1 + 3 + 3.2 + 1.1 + 1.2 + 0.5 + 0.25 + 0.6;
  parameter Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6;

  parameter Types.Length Di_S1 = 51e-3;
  parameter Types.Length t_S1 = 1.5e-3;

  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
  final parameter Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;

  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*30; 300, 2*3.141592654*30];
  parameter Real FCV101theta[:,:] = [0, 1];




  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Dicembre 2023\0412_Test1\Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Dicembre 2023\0412_Test1\Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Dicembre 2023\0412_Test1\Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Dicembre 2023\0412_Test1\Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String matrixFT101 = "FT101" "Matrix name in file";
  parameter String matrixPT101 = "PT101" "Matrix name in file";
  parameter String matrixPT102 = "PT102" "Matrix name in file";
  parameter String matrixTT101 = "TT101" "Matrix name in file";
  parameter String matrixTT102 = "TT102" "Matrix name in file";
  parameter String matrixthetaFCV101 = "theta_FCV101" "Matrix name in file";
  parameter String matrixf_P101 = "f_P101" "Matrix name in file";

  parameter String timenoscale = "time" "Matrix name in file";

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT101) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT101,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_102[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT102,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real FT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1]+1,dim[2])*985/3600 "Matrix data";
  final parameter Real q_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1]+1,dim[2]) "Matrix data";
  final parameter Real PT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT101,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_102[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT102,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real thetaFCV101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV101,dim[1],dim[2]) "Matrix data";
  final parameter Real omegaFCV101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixf_P101,dim[1],dim[2])*2*Modelica.Constants.pi "Matrix data";



  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P101(
    Tin_start(displayUnit="K") = Pump.P101.Tin_start,
    Tout_start(displayUnit="K") = Pump.P101.Tout_start,
    a = Pump.P101.a, b = Pump.P101.b,
    m_flow_start=m_flow_S1,
    dpnom = Pump.P101.dpnom,
    etaelec = Pump.P101.etaelec,
    etamech = Pump.P101.etamech,
    etanom = Pump.P101.etanom,
    hin_start = Pump.P101.hin_start,
    m_flow_nom = Pump.P101.m_flow_nom,
    omeganom = Pump.P101.omeganom,
    pin_start(displayUnit="Pa") = Pump.P101.pin_start,
    pout_start(displayUnit="Pa") = Pump.P101.pout_start,
    headnom=Pump.P101.headnom,
    qnom_inm3h=Pump.P101.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P101.rhonom,
    headmax=Pump.P101.headnommax,
    headmin=Pump.P101.headnommin,
    qnom_inm3h_min=Pump.P101.qnommin_inm3h,
    qnom_inm3h_max=Pump.P101.qnommax_inm3h,
    use_in_omega=true)
      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={20,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV101(
    Kv=Kv_P101,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    q_m3h_nom=Valve.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=q_m3h_S1)  annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,62})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_GB101_P101(
    L=L_GB101_P101,
    h=h_GB101_P101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_FT101_GB101(
    L=L_FT101_GB101*0.1,
    h=h_FT101_GB101*0.1,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Pmaxnom=147.6e3*0.79,
    HH=55.5e6)         annotation (Placement(visible=true, transformation(
        origin={0,-100},
        extent={{-46,-46},{46,46}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,92})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,80})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,52})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=
        Tin_start_S1)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-23,1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_TT101_FT101(
    L=L_TT101_FT101,
    h=h_TT101_FT101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,30})));
  Sources.SourcePressure source(
    use_in_p0=true,
    use_in_T0=true,
    p0=pin_start_S1,
    T0=Tin_start_S1)
    annotation (Placement(transformation(extent={{-50,142},{-30,122}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S1,
    p0=pout_start_S1,
    T0=Tout_start_S1,
    m_flow0=m_flow_S1,
    G=0)
    annotation (Placement(transformation(extent={{30,142},{50,122}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
    L=L_S1_rCD_cold*0.01,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,110})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
    L=L_S1_rCD_hot,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    hctype=hctype,
    n=n) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,110})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
    annotation (Placement(transformation(extent={{60,52},{40,72}})));
  Modelica.Blocks.Sources.TimeTable P101_omega(table=[t,omegaFCV101])
    annotation (Placement(transformation(extent={{60,-14},{40,6}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_P101_FCV101(
    L=L_P101_FCV101,
    h=h_P101_FCV101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    n=n)      annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,30})));
  Modelica.Blocks.Sources.TimeTable TT101_profile(table=[t,TT_101])
    annotation (Placement(transformation(extent={{-80,72},{-60,92}})));
  Modelica.Blocks.Sources.TimeTable FT101_profile(table=[t,FT_101[1:end - 1]])
    annotation (Placement(transformation(extent={{80,102},{60,122}})));
  Modelica.Blocks.Sources.TimeTable PT101_profile(table=[t,PT_101[1:end - 1]])
    annotation (Placement(transformation(extent={{-80,102},{-60,122}})));
  Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=[0,80 + 273.15; 100,80 + 273.15])
    annotation (Placement(transformation(extent={{-80,-110},{-60,-90}})));
equation
  connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (Line(
      points={{20,-8.6},{20,-20}},
      color={140,56,54},
      thickness=0.5));

  connect(TT102.inlet, PT102.inlet) annotation (Line(
      points={{19.6,92},{19.6,80}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101.inlet, PL_S100_FT101_GB101.outlet) annotation (Line(
      points={{-13.8,-63.2},{-14,-63.2},{-14,-46},{-20,-46},{-20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (Line(
      points={{-20.2,-3.2},{-20.2,-13.6},{-20,-13.6},{-20,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (Line(
      points={{-20,40},{-20,52},{-19.6,52}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet, TT101.inlet) annotation (Line(
      points={{-19.6,52},{-19.6,64}},
      color={140,56,54},
      thickness=0.5));
  connect(source.outlet, PL_S100_rCD_cold.inlet) annotation (Line(
      points={{-30,132},{-20,132},{-20,120}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_cold.outlet, TT101.inlet) annotation (Line(
      points={{-20,100},{-20,64},{-19.6,64}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (Line(
      points={{20,100},{20,92},{19.6,92}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{39,62},{28,62}}, color={0,0,127}));
  connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (Line(
      points={{20,52},{20,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (Line(
      points={{20,20},{20,10.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet, FCV101.outlet) annotation (Line(
      points={{19.6,80},{20,80},{20,72}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, PL_S100_rCD_hot.outlet) annotation (Line(
      points={{30,132},{20,132},{20,120}},
      color={140,56,54},
      thickness=0.5));
  connect(P101_omega.y, P101.in_omega) annotation (Line(points={{39,-4},{32.5,-4},{32.5,-3.8},{26,-3.8}},
                                    color={0,0,127}));
  connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (Line(
      points={{20,-40},{20,-46},{13.8,-46},{13.8,-63.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101_profile.y, source.in_p0) annotation (Line(points={{-59,112},{-44,112},{-44,123.6}},
                                 color={0,0,127}));
  connect(TT101_profile.y, source.in_T0)
    annotation (Line(points={{-59,82},{-36,82},{-36,123.6}}, color={0,0,127}));
  connect(FT101_profile.y, sink.in_m_flow)
    annotation (Line(points={{59,112},{34,112},{34,127}}, color={0,0,127}));
  connect(PL_S100_TT101_FT101.outlet, FT101.inlet) annotation (Line(
      points={{-20,20},{-20,13.6},{-20.2,13.6},{-20.2,5.2}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101_ToutSP.y, GB101.Tout_ref)
    annotation (Line(points={{-59,-100},{-36.8,-100}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=3880,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end GasBoilerSystemTest;
