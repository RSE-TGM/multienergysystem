within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model PumpingCirculationSystemTest "Test with real data"
  extends PumpingCirculationSystem/*(
    sourceP(use_in_p0=true, use_in_T0=true),
    FCV901_theta(table=[t,thetaFCV901]),
    sinkP(use_in_p0=true, R=0),
    FCV901(Kv=Kv))*/;

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

//  parameter String matrixFT901 = "FT901" "Matrix name in file";
//  parameter String matrixPT901 = "PT901" "Matrix name in file";
//  parameter String matrixPT902 = "PT902" "Matrix name in file";
//  parameter String matrixTT901 = "TT901" "Matrix name in file";
//  parameter String matrixTT902 = "TT902" "Matrix name in file";
//  parameter String matrixTT202 = "TT202" "Matrix name in file";
//  parameter String matrixPT202 = "PT202" "Matrix name in file";
//  parameter String matrixthetaFCV901 = "theta_FCV901" "Matrix name in file";
//  parameter String matrixf_P901 = "f_P901" "Matrix name in file";

//  parameter String timenoscale = "time" "Matrix name in file";

//  parameter Real Kv(unit = "m3/h") = 20 "Metri Flow Coefficient";

//  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT901) "Dimension of matrix";
//  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";
//  final parameter Real TT_901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT901,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
//  final parameter Real TT_902[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT902,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
//  final parameter Real FT_901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT901,dim[1],dim[2])*985/3600 "Matrix data";
//  final parameter Real q_901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT901,dim[1],dim[2]) "Matrix data";
//  final parameter Real PT_901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT901,dim[1],dim[2])*1e5 "Matrix data";
//  final parameter Real PT_902[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT902,dim[1],dim[2])*1e5 "Matrix data";
//  final parameter Real PT_202[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT202,dim[1],dim[2])*1e5 "Matrix data";
//  final parameter Real thetaFCV901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV901,dim[1],dim[2]) "Matrix data";
//  final parameter Real omegaP901[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixf_P901,dim[1],dim[2])*2*Modelica.Constants.pi "Matrix data";


  Modelica.Blocks.Sources.TimeTable TT902_profile(table=[0,0])
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Modelica.Blocks.Sources.TimeTable PT202_profile(table=[0,0])
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Blocks.Sources.TimeTable PT902_profile(table=[0,0])
    annotation (Placement(transformation(extent={{44,30},{24,50}})));
equation
  connect(TT902_profile.y, sourceP.in_T0) annotation (Line(points={{-39,-60},{-14,-60},{-14,-89.6},
          {-5.04,-89.6}},    color={0,0,127}));
  connect(PT202_profile.y, sourceP.in_p0) annotation (Line(points={{-39,-90},{-21.02,-90},{-21.02,
          -94.4},{-5.04,-94.4}},
                             color={0,0,127}));
  connect(PT902_profile.y, sinkP.in_p0)
    annotation (Line(points={{23,40},{18,40},{18,54.96},{17.6,54.96}},
                                                                color={0,0,127}));
  annotation (experiment(
      StopTime=8000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PumpingCirculationSystemTest;
