within MultiEnergySystem.TestFacility.Simulations.Tests.Loads;
model ParallelConfiguration4Loads
  extends
    MultiEnergySystem.TestFacility.Loads.Configurations.BaseClass.LoadPlantBase(
    VER901(p0=219000),
    Kvalve=90,
    PL701_rackL2L3_TT702(L=0.001, h=0),
    PL731_rackL6L7_TT732(L=0.001, h=0),
    PL711_rackL3L4_TT712(L=0.001, h=0),
    PL721_rackL4L5_TT722(L=0.001, h=0),
    RR01(pin_cold_start=120000, dp_cold_start=dpRR),
    RR00_PL_TTR02_VER901(h=h1),
    RR00_PL_VER901_FCVR01(h=h2),
    RR00_PL_FCVR01_FTR03(h=h3),
    RR00_PL_FTR03_PTR01(h=h4),
    FCVR01(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot,
        q_m3h_nom=14.5),
    PL_RR_UsersIn(h=0.2));

  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h1 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h2 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h3 = 3;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h4 = 5;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure dpRR = 1e5;


  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test2\Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test2\Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test2\Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Test Gennaio 2024\1701_Test2\Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT712 = "TT712" "Matrix name in file";
  parameter String matrixTT722 = "TT722" "Matrix name in file";
  parameter String matrixTT732 = "TT732" "Matrix name in file";

  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT711 = "TT711" "Matrix name in file";
  parameter String matrixTT721 = "TT721" "Matrix name in file";
  parameter String matrixTT731 = "TT731" "Matrix name in file";

  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT713 = "TT713" "Matrix name in file";
  parameter String matrixTT723 = "TT723" "Matrix name in file";
  parameter String matrixTT733 = "TT733" "Matrix name in file";

  parameter String matrixFT701 = "FT701" "Matrix name in file";
  parameter String matrixFT711 = "FT711" "Matrix name in file";
  parameter String matrixFT721 = "FT721" "Matrix name in file";
  parameter String matrixFT731 = "FT731" "Matrix name in file";

  parameter String matrixPT701 = "PT701" "Matrix name in file";
  parameter String matrixPT711 = "PT711" "Matrix name in file";
  parameter String matrixPT721 = "PT721" "Matrix name in file";
  parameter String matrixPT731 = "PT731" "Matrix name in file";

  parameter String matrixPT702 = "PT702" "Matrix name in file";
  parameter String matrixPT712 = "PT712" "Matrix name in file";
  parameter String matrixPT722 = "PT722" "Matrix name in file";
  parameter String matrixPT732 = "PT732" "Matrix name in file";

  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String matrixthetaFCV711 = "theta_FCV711" "Matrix name in file";
  parameter String matrixthetaFCV721 = "theta_FCV721" "Matrix name in file";
  parameter String matrixthetaFCV731 = "theta_FCV731" "Matrix name in file";

  parameter String matrixthetaTCV701 = "theta_TCV701" "Matrix name in file";
  parameter String matrixthetaTCV711 = "theta_TCV711" "Matrix name in file";
  parameter String matrixthetaTCV721 = "theta_TCV721" "Matrix name in file";
  parameter String matrixthetaTCV731 = "theta_TCV731" "Matrix name in file";

  parameter String matrixthetaFCVR01 = "theta_FCVR01" "Matrix name in file";

  parameter String matrixfPR01 = "f_PR01" "Matrix name in file";

  parameter String matrixTTR02 = "TTR02" "Matrix name in file";

  parameter String timenoscale = "time" "Matrix name in file";


  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT711,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT721,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT731,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real TT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT712,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT722,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT732,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";

  final parameter Real TT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT703,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT713,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT723,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT733,dim[1],dim[2]) "Matrix data";


  final parameter Real PT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT711,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT721,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT731,dim[1]+1,dim[2])*1e5 "Matrix data";

  final parameter Real PT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT702,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT712,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT722,dim[1]+1,dim[2])*1e5 "Matrix data";
  final parameter Real PT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT732,dim[1]+1,dim[2])*1e5 "Matrix data";

  final parameter Real FT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT701,dim[1],dim[2])*1000/3600 "Matrix data";
  final parameter Real FT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT711,dim[1],dim[2])*1000/3600 "Matrix data";
  final parameter Real FT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT721,dim[1],dim[2])*1000/3600 "Matrix data";
  final parameter Real FT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT731,dim[1],dim[2])*1000/3600 "Matrix data";

  final parameter Real thetaFCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaTCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaTCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaTCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaFCVR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCVR01,dim[1],dim[2]) "Matrix data";

  final parameter Real fPR01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixfPR01,dim[1],dim[2])*2*Modelica.Constants.pi*5/3 "Matrix data";
  final parameter Real TT_R02[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTTR02,dim[1],dim[2]) "Matrix data";


  Modelica.Blocks.Sources.TimeTable TCV701_theta(table=[t,thetaTCV701])
    annotation (Placement(transformation(extent={{54,-330},{74,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV731_theta(table=[t,thetaTCV731])
    annotation (Placement(transformation(extent={{208,-330},{228,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV711_theta(table=[t,thetaTCV711])
    annotation (Placement(transformation(extent={{349,-330},{369,-310}})));
  Modelica.Blocks.Sources.TimeTable TCV721_theta(table=[t,thetaTCV721])
    annotation (Placement(transformation(extent={{509,-330},{529,-310}})));
  Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=[t,thetaFCVR01])
    annotation (Placement(transformation(extent={{800,-340},{780,-320}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=[t,thetaFCV701])
    annotation (Placement(transformation(extent={{181,-160},{161,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=[t,thetaFCV731])
    annotation (Placement(transformation(extent={{340,-160},{320,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=[t,thetaFCV711])
    annotation (Placement(transformation(extent={{481,-160},{461,-140}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=[t,thetaFCV721])
    annotation (Placement(transformation(extent={{640,-160},{620,-140}})));
  Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table=[t,TT_723])
    "Temperature in Celsius degrees"
    annotation (Placement(transformation(extent={{730,-70},{750,-50}})));
  Modelica.Blocks.Sources.TimeTable PR01_omega(table=[0,2*3.141592654*50*0.903;
        100,2*3.141592654*50*0.903])
    annotation (Placement(transformation(extent={{664,-218},{684,-198}})));
  Modelica.Blocks.Sources.TimeTable EX701_p(table=[t,PT_702[1:end - 1]])
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP0(use_in_p0=true,
      use_in_T0=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP1(use_in_p0=true,
      use_in_T0=true)
    annotation (Placement(transformation(extent={{370,-30},{390,-10}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP2(use_in_p0=true,
      use_in_T0=true)
    annotation (Placement(transformation(extent={{530,-30},{550,-10}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceP3(use_in_p0=true,
      use_in_T0=true)
    annotation (Placement(transformation(extent={{232,-30},{252,-10}})));
  Modelica.Blocks.Sources.TimeTable EX701_T(table=[t,TT_702])
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  inner DistrictHeatingNetwork.System system
    annotation (Placement(transformation(extent={{664,100},{684,120}})));
  Modelica.Blocks.Sources.TimeTable EX711_p(table=[t,PT_712[1:end - 1]])
    annotation (Placement(transformation(extent={{340,0},{360,20}})));
  Modelica.Blocks.Sources.TimeTable EX711_T(table=[t,TT_712])
    annotation (Placement(transformation(extent={{340,30},{360,50}})));
  Modelica.Blocks.Sources.TimeTable EX721_p(table=[t,PT_722[1:end - 1]])
    annotation (Placement(transformation(extent={{500,0},{520,20}})));
  Modelica.Blocks.Sources.TimeTable EX721_T(table=[t,TT_722])
    annotation (Placement(transformation(extent={{500,30},{520,50}})));
  Modelica.Blocks.Sources.TimeTable EX731_p(table=[t,PT_732[1:end - 1]])
    annotation (Placement(transformation(extent={{200,0},{220,20}})));
  Modelica.Blocks.Sources.TimeTable EX731_T(table=[t,TT_732])
    annotation (Placement(transformation(extent={{200,30},{220,50}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow(table=[t,FT_731])
    annotation (Placement(transformation(extent={{340,0},{320,20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP3(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{308,-30},{328,-10}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow(table=[t,FT_711])
    annotation (Placement(transformation(extent={{480,0},{460,20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP1(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{448,-30},{468,-10}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow(table=[t,FT_721])
    annotation (Placement(transformation(extent={{640,0},{620,20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP2(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{608,-30},{628,-10}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow(table=[t,FT_701])
    annotation (Placement(transformation(extent={{180,0},{160,20}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP0(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=323.15)
    annotation (Placement(transformation(extent={{148,-30},{168,-10}})));
equation
  connect(TCV701_theta.y, TCV701.opening)
    annotation (Line(points={{75,-320},{90,-320}}, color={0,0,127}));
  connect(TCV731_theta.y, TCV731.opening)
    annotation (Line(points={{229,-320},{250,-320}}, color={0,0,127}));
  connect(TCV721_theta.y, TCV721.opening)
    annotation (Line(points={{530,-320},{549.1,-320}}, color={0,0,127}));
  connect(TCV711_theta.y, TCV711.opening)
    annotation (Line(points={{370,-320},{390,-320}}, color={0,0,127}));
  connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{779,-330},{766,
          -330},{766,-352}}, color={0,0,127}));
  connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (Line(points={{751,-60},{767.5,
          -60},{767.5,-97.2}}, color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{619,-150},{606,-150}}, color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{460,-150},{446,-150}}, color={0,0,127}));
  connect(FCV731_theta.y, FCV731.opening)
    annotation (Line(points={{319,-150},{306,-150}}, color={0,0,127}));
  connect(FCV701.opening, FCV701_theta.y)
    annotation (Line(points={{146,-150},{160,-150}}, color={0,0,127}));
  connect(PR01_omega.y, PR01.in_omega) annotation (Line(points={{685,-208},{692.25,
          -208},{692.25,-207.8},{697.5,-207.8}}, color={0,0,127}));
  connect(sourceP0.outlet, PL701_rackL2L3_TT702.inlet) annotation (Line(
      points={{90,-20},{98,-20},{98,-48}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP3.outlet, PL731_rackL6L7_TT732.inlet) annotation (Line(
      points={{252,-20},{258,-20},{258,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP1.outlet, PL711_rackL3L4_TT712.inlet) annotation (Line(
      points={{390,-20},{398,-20},{398,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceP2.outlet, PL721_rackL4L5_TT722.inlet) annotation (Line(
      points={{550,-20},{558,-20},{558,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_p.y, sourceP0.in_p0)
    annotation (Line(points={{61,10},{76,10},{76,-11.6}}, color={0,0,127}));
  connect(EX701_T.y, sourceP0.in_T0)
    annotation (Line(points={{61,40},{84,40},{84,-11.6}}, color={0,0,127}));
  connect(EX711_p.y, sourceP1.in_p0)
    annotation (Line(points={{361,10},{376,10},{376,-11.6}}, color={0,0,127}));
  connect(EX711_T.y, sourceP1.in_T0)
    annotation (Line(points={{361,40},{384,40},{384,-11.6}}, color={0,0,127}));
  connect(EX721_p.y, sourceP2.in_p0)
    annotation (Line(points={{521,10},{536,10},{536,-11.6}}, color={0,0,127}));
  connect(EX721_T.y, sourceP2.in_T0)
    annotation (Line(points={{521,40},{544,40},{544,-11.6}}, color={0,0,127}));
  connect(EX731_p.y, sourceP3.in_p0)
    annotation (Line(points={{221,10},{238,10},{238,-11.6}}, color={0,0,127}));
  connect(EX731_T.y, sourceP3.in_T0)
    annotation (Line(points={{221,40},{246,40},{246,-11.6}}, color={0,0,127}));
  connect(sinkMassFlowP3.inlet, PL731_FT731_rackL6L7.outlet) annotation (Line(
      points={{308,-20},{298,-20},{298,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731_mflow.y, sinkMassFlowP3.in_m_flow)
    annotation (Line(points={{319,10},{312,10},{312,-15}}, color={0,0,127}));
  connect(EX711_mflow.y, sinkMassFlowP1.in_m_flow)
    annotation (Line(points={{459,10},{452,10},{452,-15}}, color={0,0,127}));
  connect(PL711_FT711_rackL3L4.outlet, sinkMassFlowP1.inlet) annotation (Line(
      points={{438,-46},{438,-20},{448,-20}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721_mflow.y, sinkMassFlowP2.in_m_flow)
    annotation (Line(points={{619,10},{612,10},{612,-15}}, color={0,0,127}));
  connect(sinkMassFlowP2.inlet, PL721_FT721_rackL4L5.outlet) annotation (Line(
      points={{608,-20},{598,-20},{598,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_mflow.y, sinkMassFlowP0.in_m_flow)
    annotation (Line(points={{159,10},{152,10},{152,-15}}, color={0,0,127}));
  connect(sinkMassFlowP0.inlet, PL701_FT701_rackL2L3.outlet) annotation (Line(
      points={{148,-20},{138,-20},{138,-48}},
      color={140,56,54},
      thickness=0.5));
  annotation (experiment(StopTime=2800, __Dymola_Algorithm="Dassl"));
end ParallelConfiguration4Loads;
