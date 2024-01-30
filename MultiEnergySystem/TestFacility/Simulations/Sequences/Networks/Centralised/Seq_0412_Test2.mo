within MultiEnergySystem.TestFacility.Simulations.Sequences.Networks.Centralised;
model Seq_0412_Test2 "Sequence 2 done on 04/12/23"
  extends Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_B(
    TT723_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
    TT713_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
    TT733_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
    TT703_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
    FT723_mflow(table=[0,1.1627*998/3600; 1e6,1.1627*998/3600]),
    FT713_mflow(table=[0,1.5876*998/3600; 1e6,1.5876*998/3600]),
    FT733_mflow(table=[0,1.3021*998/3600; 1e6,1.3021*998/3600]),
    FT703_mflow(table=[0,1.2941*998/3600; 1e6,1.2941*998/3600]),
    FCV401theta = [0, 0.1; 1e6, 0.1],
    FCVC01theta = [0, 0; 1e6, 0],
    FCVC02theta = [0, 1; 1e6, 1],
    FCV101_theta(table=[t2,thetaFCV101]),
    VE901(p0=1.76e5));

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C://Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String timenoscale = "time" "Matrix name in file";

  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT713 = "TT713" "Matrix name in file";
  parameter String matrixTT723 = "TT723" "Matrix name in file";
  parameter String matrixTT733 = "TT733" "Matrix name in file";

  parameter String matrixFT703 = "FT703" "Matrix name in file";
  parameter String matrixFT713 = "FT713" "Matrix name in file";
  parameter String matrixFT723 = "FT723" "Matrix name in file";
  parameter String matrixFT733 = "FT733" "Matrix name in file";

  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String matrixthetaFCV711 = "theta_FCV711" "Matrix name in file";
  parameter String matrixthetaFCV721 = "theta_FCV721" "Matrix name in file";
  parameter String matrixthetaFCV731 = "theta_FCV731" "Matrix name in file";

  parameter String matrixthetaFCV101 = "theta_FCV101" "Matrix name in file";

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT703) "Dimension of matrix";
  final parameter Real t2[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT703,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT713,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT723,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT733,dim[1],dim[2]) "Matrix data";

  final parameter Real FT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT703,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT713,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT723,dim[1],dim[2])*990/3600 "Matrix data";
  final parameter Real FT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT733,dim[1],dim[2])*990/3600 "Matrix data";

  final parameter Real thetaFCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV711,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV721,dim[1],dim[2]) "Matrix data";
  final parameter Real thetaFCV731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV731,dim[1],dim[2]) "Matrix data";

  final parameter Real thetaFCV101[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV101,dim[1],dim[2]) "Matrix data";

  annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
end Seq_0412_Test2;
