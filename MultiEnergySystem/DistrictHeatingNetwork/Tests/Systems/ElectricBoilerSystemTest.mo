within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model ElectricBoilerSystemTest "Main components of System 400 - Electric Boiler"
  extends Modelica.Icons.Example;

  parameter Types.Pressure pin_start_S4 = 1.695e5;
  parameter Types.Pressure pout_start_S4 = 1.6e5;
  parameter Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter Types.Length L_S4_PL1 = 0.82;
  parameter Types.Length L_S4_PL2 = 0.47;
  parameter Types.Length L_S4_PL3 = 1.3;
  parameter Types.Length L_S4_PL4 = 1.3;
  parameter Types.Length Di_S4 = 51e-3;
  parameter Types.Length t_S4 = 1.5e-3;

  parameter Real q_m3h_S4 = 5;
  parameter Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV401theta[:,:] = [0, 1];
  parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String matrixFT401 = "FT401" "Matrix name in file";
  parameter String matrixPT401 = "PT401" "Matrix name in file";
  parameter String matrixPT402 = "PT402" "Matrix name in file";
  parameter String matrixTT401 = "TT401" "Matrix name in file";
  parameter String matrixTT402 = "TT402" "Matrix name in file";
  parameter String matrixthetaFCV401 = "theta_FCV401" "Matrix name in file";
  parameter String matrixf_P401 = "f_P101" "Matrix name in file";

  parameter String timenoscale = "time" "Matrix name in file";

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT401) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT401,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_402[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT402,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real FT_401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT401,dim[1],dim[2])*985/3600 "Matrix data";
  final parameter Real q_401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT401,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT401,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real PT_402[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT402,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real thetaFCV401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV401,dim[1],dim[2]) "Matrix data";
  final parameter Real omegaFCV401[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixf_P401,dim[1],dim[2])*2*Modelica.Constants.pi "Matrix data";




  inner MultiEnergySystem.DistrictHeatingNetwork.System system annotation (
    Placement(visible = true, transformation(origin={150,150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=333.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=300000,
    pout_start=290000,
    nR=3.5)            annotation (Placement(visible=true, transformation(
        origin={0,-106},
        extent={{-44,-44},{44,44}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    Tin_start(displayUnit="K") = Pump.P401.Tin_start,
    Tout_start(displayUnit="K") = Pump.P401.Tout_start,
    a = Pump.P401.a, b = Pump.P401.b,
    m_flow_start=m_flow_S4,
    dpnom = Pump.P401.dpnom,
    etaelec = Pump.P401.etaelec,
    etamech = Pump.P401.etamech,
    etanom = Pump.P401.etanom,
    hin_start = Pump.P401.hin_start,
    m_flow_nom = Pump.P401.m_flow_nom,
    omeganom = Pump.P401.omeganom,
    pin_start(displayUnit="Pa") = Pump.P401.pin_start,
    pout_start(displayUnit="Pa") = Pump.P401.pout_start,
    headnom=Pump.P401.headnom,
    qnom_inm3h=Pump.P401.qnom_inm3h,                                                                                                                                                                                                        rhonom(displayUnit = "kg/m3") = Pump.P401.rhonom,
    headmax=Pump.P401.headnommax,
    headmin=Pump.P401.headnommin,
    qnom_inm3h_min=Pump.P401.qnommin_inm3h,
    qnom_inm3h_max=Pump.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=90,
        origin={20,-1})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV401(
    Kv=Valve.FCV401.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S400_EB401_P401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-30})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL4_S401(
    L=L_S4_PL3,
    h=0.8,
    t=t_S4,
    m_flow_start=m_flow_S4,
    pin_start=pout_start_S4,
    pout_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,64})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,96})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,84})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,84})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,96})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-23,-9})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    pin_start=pin_start_S4,
    pout_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,30})));
  Sources.SourcePressure source(
    use_in_p0=true,
    use_in_T0=true,
    p0=pin_start_S4,
    T0=Tin_start_S4)
    annotation (Placement(transformation(extent={{-54,130},{-34,110}})));
  Sources.SinkMassFlow sink(
    use_in_m_flow=true,
    use_in_T=false,
    pin_start=pout_start_S4,
    p0=pout_start_S4,
    T0=Tout_start_S4,
    m_flow0=m_flow_S4)
    annotation (Placement(transformation(extent={{36,130},{56,110}})));
  Modelica.Blocks.Sources.TimeTable EB401ToutSP(table=EB401_ToutSP)
    annotation (Placement(transformation(extent={{-80,-116},{-60,-96}})));
  Modelica.Blocks.Sources.TimeTable TT401_profile(table=[t,TT_401])
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.TimeTable PT401_profile(table=[t,PT_401])
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Sources.TimeTable FT401_profile(table=[t,FT_401])
    annotation (Placement(transformation(extent={{80,80},{60,100}})));
  Modelica.Blocks.Sources.TimeTable P401_omega(table=[t,omegaFCV401])
    annotation (Placement(transformation(extent={{60,-16},{40,4}})));
  Modelica.Blocks.Sources.TimeTable FCV401_theta(table=[t,thetaFCV401])
    annotation (Placement(transformation(extent={{60,20},{40,40}})));
equation
  connect(P401.inlet, PL_S400_EB401_P401.outlet) annotation (Line(
      points={{20,-10.6},{20,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,P401. outlet) annotation (Line(
      points={{20,20},{20,8.6}},
      color={140,56,54},
      thickness=0.5));

  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{19.6,96},{19.6,84}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
      points={{20,54},{20,40}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
      points={{19.6,84},{19.6,75},{20,75},{20,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
      points={{-20,20},{-20,7.6},{-20.2,7.6},{-20.2,-4.8}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
      points={{-20,40},{-20,84},{-19.6,84}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-19.6,84},{-19.6,96}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.outlet, EB401.inlet) annotation (Line(
      points={{-20,-40},{-20,-52.7},{-13.2,-52.7},{-13.2,-70.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet, PL_S400_EB401_P401.inlet) annotation (Line(
      points={{13.2,-70.8},{14,-70.8},{14,-52},{20,-52},{20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401ToutSP.y, EB401.Tout_ref)
    annotation (Line(points={{-59,-106},{-30.8,-106}}, color={0,0,127}));
  connect(PL2_S401.inlet, FT401.outlet) annotation (Line(
      points={{-20,-20},{-20,-21.6},{-20.2,-21.6},{-20.2,-13.2}},
      color={140,56,54},
      thickness=0.5));
  connect(FT401_profile.y, sink.in_m_flow)
    annotation (Line(points={{59,90},{40,90},{40,115}},   color={0,0,127}));
  connect(source.outlet, TT401.inlet) annotation (Line(
      points={{-34,120},{-19.6,120},{-19.6,96}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, TT402.inlet) annotation (Line(
      points={{36,120},{19.6,120},{19.6,96}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401_profile.y, source.in_p0)
    annotation (Line(points={{-59,90},{-48,90},{-48,111.6}},   color={0,0,127}));
  connect(TT401_profile.y, source.in_T0)
    annotation (Line(points={{-59,50},{-40,50},{-40,111.6}},   color={0,0,127}));
  connect(P401_omega.y, P401.in_omega)
    annotation (Line(points={{39,-6},{32.5,-6},{32.5,-5.8},{26,-5.8}},     color={0,0,127}));
  connect(FCV401_theta.y, FCV401.opening)
    annotation (Line(points={{39,30},{28,30}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-160},{160,160}})),
    experiment(
      StopTime=7800,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ElectricBoilerSystemTest;
