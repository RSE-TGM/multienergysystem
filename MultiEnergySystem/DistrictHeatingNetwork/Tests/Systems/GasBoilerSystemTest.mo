within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model GasBoilerSystemTest "Test of System 100 with real data"
  extends Modelica.Icons.Example;

  // Constants
  constant Real pi = Modelica.Constants.pi;
  // Temperatures and pressures
  parameter Types.Pressure pin_start_S1 = 1.695e5 - 0.09273e5;
  parameter Types.Pressure pout_start_S1 = 1.6e5;
  parameter Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;  
  final parameter Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;    

  // Valve
  parameter Real Kv_P101 = Valve.FCV101.Kv;

  // Pipe Data
  parameter Integer n = 3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle "Location of pressure state";
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
  parameter Types.Length h_FT101_GB101 = -0.7*0;
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

  //Sources' parameters
  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*30; 300, 2*3.141592654*30];
  parameter Real FCV101theta[:,:] = [0, 1];
  parameter Types.Temperature GB101ToutSP[:,:] = [0, 80 + 273.15; 0, 80 + 273.15];
  parameter Types.MassFlowRate mflowS1[:,:] = [0, 4; 100, 4];
  parameter Types.Temperature TinS1[:,:] = [0, 60 + 273.15; 100, 60 + 273.15];
  parameter Types.Pressure pinS1[:,:] = [0, 1.8e5; 100, 1.8e5];

//  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/DiscoD/Muro/Lavoro/Simulations/ModelicaSimulations/Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

//  parameter String matrixFT101 = "FT101" "Matrix name in file";
//  parameter String matrixPT101 = "PT101" "Matrix name in file";
//  parameter String matrixPT102 = "PT102" "Matrix name in file";
//  parameter String matrixTT101 = "TT101" "Matrix name in file";
//  parameter String matrixTT102 = "TT102" "Matrix name in file";
//  parameter String matrixthetaFCV101 = "theta_FCV101" "Matrix name in file";
//  parameter String matrixf_P101 = "f_P101" "Matrix name in file";

//  parameter String timenoscale = "time" "Matrix name in file";

//  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT101) "Dimension of matrix";
//  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";
//  final parameter Real TT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT101,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
//  final parameter Real TT_102[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT102,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
//  parameter Real FT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1]+1,dim[2])*985/3600 "Matrix data";
//  parameter Real q_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT101,dim[1]+1,dim[2]) "Matrix data";
//  parameter Real PT_101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT101,dim[1]+1,dim[2])*1e5 "Matrix data";
//  parameter Real PT_102[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT102,dim[1]+1,dim[2])*1e5 "Matrix data";
//  final parameter Real thetaFCV101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV101,dim[1],dim[2]) "Matrix data";
//  final parameter Real omegaFCV101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixf_P101,dim[1],dim[2])*2*Modelica.Constants.pi "Matrix data";



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
        origin={20,-5})));
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
        origin={20,56})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_GB101_P101(
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
        origin={20,-36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_FT101_GB101(
    L=L_FT101_GB101,
    h=h_FT101_GB101*0.1,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-36})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler
    GB101(
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Pmaxnom=147.6e3*0.8,
    HH=55.5e6)         annotation (Placement(visible=true, transformation(
        origin={0,-106},
        extent={{-46,-46},{46,46}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT102(T_start=Tout_start_S1, p_start=pout_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,86})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT102 "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,74})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT101 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,46})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT101(T_start=Tin_start_S1, p_start=pin_start_S1)
          "Temperature sensor at the outlet of valve FCV101" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,58})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=
        Tin_start_S1)
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-23,-5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_TT101_FT101(
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
        origin={-20,24})));
  Sources.SourcePressure source(
    use_in_p0=true,
    use_in_T0=true,
    p0=pin_start_S1,
    T0=Tin_start_S1)
    annotation (Placement(transformation(extent={{-50,136},{-30,116}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    pin_start=pout_start_S1,
    p0=pout_start_S1,
    T0=Tout_start_S1,
    m_flow0=m_flow_S1,
    G=0)
    annotation (Placement(transformation(extent={{30,136},{50,116}})));
  Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
    annotation (Placement(transformation(extent={{60,46},{40,66}})));
  Modelica.Blocks.Sources.TimeTable P101_omega(table=P101omega)
    annotation (Placement(transformation(extent={{60,-20},{40,0}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_P101_FCV101(
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
        origin={20,24})));
  Modelica.Blocks.Sources.TimeTable TT101_profile(table=TinS1)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.TimeTable FT101_profile(table=mflowS1)
    annotation (Placement(transformation(extent={{80,94},{60,114}})));
  Modelica.Blocks.Sources.TimeTable PT101_profile(table=pinS1)
    annotation (Placement(transformation(extent={{-80,100},{-60,120}})));
  Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=[0,80 + 273.15; 100,80 + 273.15])
    annotation (Placement(transformation(extent={{-80,-116},{-60,-96}})));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e6}, startValue=true)
    "Input to decide whether or nor the gas boiler is working"
    annotation (Placement(transformation(extent={{-80,-148},{-60,-128}})));
equation
  connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (Line(
      points={{20,-14.6},{20,-26}},
      color={140,56,54},
      thickness=0.5));

  connect(TT102.inlet, PT102.inlet) annotation (Line(
      points={{19.6,86},{19.6,74}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101.inlet, PL_S100_FT101_GB101.outlet) annotation (Line(
      points={{-13.8,-69.2},{-14,-69.2},{-14,-52},{-20,-52},{-20,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (Line(
      points={{-20.2,-9.2},{-20.2,-19.6},{-20,-19.6},{-20,-26}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (Line(
      points={{-20,34},{-20,46},{-19.6,46}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101.inlet, TT101.inlet) annotation (Line(
      points={{-19.6,46},{-19.6,58}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101_theta.y, FCV101.opening)
    annotation (Line(points={{39,56},{28,56}}, color={0,0,127}));
  connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (Line(
      points={{20,46},{20,34}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (Line(
      points={{20,14},{20,4.6}},
      color={140,56,54},
      thickness=0.5));
  connect(PT102.inlet, FCV101.outlet) annotation (Line(
      points={{19.6,74},{20,74},{20,66}},
      color={140,56,54},
      thickness=0.5));
  connect(P101_omega.y, P101.in_omega) annotation (Line(points={{39,-10},{32.5,-10},{32.5,-9.8},{26,
          -9.8}},                   color={0,0,127}));
  connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (Line(
      points={{20,-46},{20,-52},{13.8,-52},{13.8,-69.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PT101_profile.y, source.in_p0) annotation (Line(points={{-59,110},{-44,110},{-44,117.6}},
                                 color={0,0,127}));
  connect(TT101_profile.y, source.in_T0)
    annotation (Line(points={{-59,70},{-36,70},{-36,117.6}}, color={0,0,127}));
  connect(FT101_profile.y, sink.in_m_flow)
    annotation (Line(points={{59,104},{34,104},{34,121}}, color={0,0,127}));
  connect(PL_S100_TT101_FT101.outlet, FT101.inlet) annotation (Line(
      points={{-20,14},{-20,7.6},{-20.2,7.6},{-20.2,-0.8}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101_ToutSP.y, GB101.Tout_ref)
    annotation (Line(points={{-59,-106},{-36.8,-106}}, color={0,0,127}));
  connect(source.outlet, TT101.inlet) annotation (Line(
      points={{-30,126},{-19.6,126},{-19.6,58}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, TT102.inlet) annotation (Line(
      points={{30,126},{19.6,126},{19.6,86}},
      color={140,56,54},
      thickness=0.5));
  connect(GB101_Status.y, GB101.heat_on) annotation (Line(points={{-59,-138},{-52,-138},{-52,-133.6},
          {-36.8,-133.6}}, color={255,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),             Icon(
        coordinateSystem(grid={0.5,0.5})),
    experiment(
      StopTime=3880,
      Tolerance=1e-06, StartTime = 0, Interval = 7.76));
end GasBoilerSystemTest;
