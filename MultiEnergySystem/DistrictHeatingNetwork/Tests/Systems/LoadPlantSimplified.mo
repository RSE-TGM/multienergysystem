within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems;
model LoadPlantSimplified
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity;

  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=44.84 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=32.6 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=
      EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=34.12 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=34.74 + 273.15;

  // EX711
  parameter Real EX711_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot= 50.43 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot= 39.12 + 273.15;

  parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=
      EX711_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=34.25 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=35.4 + 273.15;

  // EX721
  parameter Real EX721_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=51.2 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=43.28 + 273.15;

  parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=
      EX721_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=35.06 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=36.24 + 273.15;

  // EX731
  parameter Real EX731_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=46.8 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=40.98 + 273.15;

  parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=0.5*1000/
      3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=35.01 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=34.52 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real FCV731theta[:,:] = [0, 1; 100, 1];

  // Lengths of pipelines COLD SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_SourceOut_FCV711=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_SourceOut_FCV721=0.6;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_SourceOut_FCV731=0.6;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_SourceOut_FCV711=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_SourceOut_FCV721=0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_SourceOut_FCV731=0;

//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=2.50;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=2.25;

  parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=0;
  parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
  parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=0;

  parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2
       + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 +
      1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1;
  parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 +
      0.25 + 0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-0.25 - 0.5;

  // Lengths of pipelines HOT SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX711_TT712_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX721_TT722_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length L_HX731_TT732_SourceIn=1.5 + 1.0
       + 0.4;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX711_TT712_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX721_TT722_SourceIn=1.5 + 1.0;
  parameter DistrictHeatingNetwork.Types.Length h_HX731_TT732_SourceIn=1.5 + 1.0;

  parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL3L4_TT712=1 + 0.7 + 5 + 9.2
       + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL3L4_TT712=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL4L5_TT722=1 + 2 + 5 + 9 +
      1 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL4L5_TT722=-1;
  parameter DistrictHeatingNetwork.Types.Length L_rackL6L7_TT732=1.2 + 4 + 0.25 +
      0.3 + 3 + 0.4 + 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_rackL6L7_TT732=-0.25 - 0.5;

  // Internal diameters & thickness
  parameter DistrictHeatingNetwork.Types.Length t_Source=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Source=32e-3;

  //1. Cooling System

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Cool=0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Cool=0.92e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_PR01=
      pout_start_Cool;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_PR01=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool=16 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Cool=q_Cool*998/3600;
  parameter Real q_Cool(unit = "m3/h") = 32;
  parameter DistrictHeatingNetwork.Types.Length t_RR=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_RR=85e-3;
  parameter Real Kvalve = 90;
  parameter Real FCVR01theta[:,:] = [0, 0.5; 100, 0.5];
  //parameter Real PR01omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40; 300, 2*3.141592654*40; 400, 2*3.141592654*40];
  parameter Real PR01omega[:,:] = [0, 32.5; 100, 32.5];

  //2. Users System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users=3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users=2.5e5;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_UserIn=7 + 273.15;
  parameter Real q_Users_total(unit = "m3/h") = 20;
  parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
  parameter DistrictHeatingNetwork.Types.Length t_Users=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Users=32e-3;
  parameter DistrictHeatingNetwork.Types.Length t_Rack=1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_Rack=51e-3;
  parameter Real TCV701theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV711theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV721theta[:,:] = [0, 1; 100, 1];
  parameter Real TCV731theta[:,:] = [0, 1; 100, 1];

   // Lengths of pipelines source side
  parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
  parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8;
  parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
  parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35;
  parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
  parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
  parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
  parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
  parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
  parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
  parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
  parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
  parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
  parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1;
  parameter DistrictHeatingNetwork.Types.Length L_TTR02_VER901=0.43;
  parameter DistrictHeatingNetwork.Types.Length h_TTR02_VER901=0;

  parameter DistrictHeatingNetwork.Types.Length L_UsersIn_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersIn_EX721=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_cold=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_cold=0.50*1;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_cold=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_cold=0.50*1;

  parameter DistrictHeatingNetwork.Types.Length L_UsersOut_EX721=0.75;
  parameter DistrictHeatingNetwork.Types.Length h_UsersOut_EX721=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_hot=1.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_hot=0;
  parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_hot=0.50;
  parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_hot=0;

  parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=0.65;
  parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
  parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.65;

  parameter DistrictHeatingNetwork.Types.Length L_TCV701_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV701_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV711_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV711_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV721_rUsersOut=1 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_TCV721_rUsersOut=1;
  parameter DistrictHeatingNetwork.Types.Length L_TCV731_rUsersOut=1 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_TCV731_rUsersOut=1;

  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT703=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT703=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT713=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT713=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT723=1.65 + 0.45;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT723=-1.65*0.1;
  parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT733=1.65 + 0.66 + 0.66;
  parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT733=-1.65*0.1;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersIn=0.8 + 1.2 + 0.5 + 2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersIn=0.8 + 0.6;

  parameter DistrictHeatingNetwork.Types.Length L_RR_UsersOut=2;
  parameter DistrictHeatingNetwork.Types.Length h_RR_UsersOut=0;

  parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h1 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h2 = 0;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h3 = 3;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h4 = 5;
  parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure dpRR = 1e5;

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2301_Test2/Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

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

  parameter String matrixTT704 = "TT704" "Matrix name in file";
  parameter String matrixTT714 = "TT714" "Matrix name in file";
  parameter String matrixTT724 = "TT724" "Matrix name in file";
  parameter String matrixTT734 = "TT734" "Matrix name in file";

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

  parameter String matrixFTR01 = "FTR01" "Matrix name in file";
  parameter String matrixFTR03 = "FTR03" "Matrix name in file";

  parameter String matrixFT703 = "FT703" "Matrix name in file";
  parameter String matrixFT713 = "FT713" "Matrix name in file";
  parameter String matrixFT723 = "FT723" "Matrix name in file";
  parameter String matrixFT733 = "FT733" "Matrix name in file";

  parameter String timenoscale = "time" "Matrix name in file";

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT711,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT721,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT731,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT712,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT722,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT732,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT703,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT713,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT723,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT733,dim[1],dim[2]) "Matrix data";

  final parameter Real TT_704[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_714[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT714,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_724[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT724,dim[1],dim[2]) "Matrix data";
  final parameter Real TT_734[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT734,dim[1],dim[2]) "Matrix data";

  final parameter Real PT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT711,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT721,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT731,dim[1],dim[2]) "Matrix data";

  final parameter Real PT_702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT702,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_712[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT712,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_722[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT722,dim[1],dim[2]) "Matrix data";
  final parameter Real PT_732[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT732,dim[1],dim[2]) "Matrix data";

  final parameter Real FT_701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT701,dim[1],dim[2])*980.85/3600 "Matrix data";
  final parameter Real FT_711[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT711,dim[1],dim[2])*980.85/3600 "Matrix data";
  final parameter Real FT_721[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT721,dim[1],dim[2])*980.85/3600 "Matrix data";
  final parameter Real FT_731[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT731,dim[1],dim[2])*980.85/3600 "Matrix data";

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

  final parameter Real FT_R01[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFTR01,dim[1],dim[2])*995/3600 "Matrix data";
  final parameter Real FT_R03[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFTR03,dim[1],dim[2])*995/3600 "Matrix data";

//   final parameter Real FT_703[:,:] = (FT_701.*(TT_702 - TT_701)./(TT_704-TT_703));
//   final parameter Real FT_713[:,:] = (FT_711.*(TT_712 - TT_711)./(TT_714-TT_713));
//   final parameter Real FT_723[:,:] = (FT_721.*(TT_722 - TT_721)./(TT_724-TT_723));
//   final parameter Real FT_733[:,:] = (FT_731.*(TT_732 - TT_731)./(TT_734-TT_733));
  final parameter Real FT_703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT703,dim[1],dim[2])*993/3600 "Matrix data";
  final parameter Real FT_713[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT713,dim[1],dim[2])*993/3600 "Matrix data";
  final parameter Real FT_723[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT723,dim[1],dim[2])*993/3600 "Matrix data";
  final parameter Real FT_733[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT733,dim[1],dim[2])*993/3600 "Matrix data";

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV701(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV701.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-220,10})));

  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701(
    redeclare model Medium = Medium,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX701_Tin_cold,
    Tin_start_hot=EX701_Tin_hot,
    Tout_start_cold=EX701_Tout_cold,
    Tout_start_hot=EX701_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=true,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot,
    UA_ext=750,
    UA_int=750)                                                    annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-239,-55.5})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_FCV701_FT701(
    redeclare model Medium = Medium,
    L=L_FCV701_FT701,
    h=h_FCV701_FT701,
    t=t_S700,
    pin_start=FCV701_pout,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,38})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_SourceOut_FCV701(
    redeclare model Medium = Medium,
    L=L_HX701_SourceOut_FCV701,
    h=h_HX701_SourceOut_FCV701,
    t=t_S700,
    pin_start=EX701_pout_hot,
    Tin_start=EX701_Tout_hot,
    Tout_start=EX701_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,-22})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(
        redeclare model Medium = Medium,
        T_start= EX701_Tout_hot, p_start=FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-218,56})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT701(T_start=
        EX701_Tout_hot, p_start=FCV701_pout,redeclare model Medium = Medium)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-218,72})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-218,86})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL701_TT702_SourceIn(
    redeclare model Medium = Medium,
    L=L_HX701_TT702_SourceIn,
    h=h_HX701_TT702_SourceIn,
    t=t_S700,
    pin_start=EX701_pin_hot,
    Tin_start=EX701_Tin_hot,
    Tout_start=EX701_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX701_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-260,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(redeclare model Medium = Medium,
        T_start= EX701_Tin_hot, p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-262,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-262,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX711(
    redeclare model Medium = Medium,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX711_Tin_cold,
    Tin_start_hot=EX711_Tin_hot,
    Tout_start_cold=EX711_Tout_cold,
    Tout_start_hot=EX711_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=true,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot,
    UA_ext=750,
    UA_int=750)                                                    annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={81,-58.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV711(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV711.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV711.dp_nom,
    Tin_start(displayUnit="K") = EX711_Tout_hot,
    pin_start=EX711_pout_hot,
    q_m3h_start=EX711_q_m3h_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={100,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_FCV711_FT711(
    redeclare model Medium = Medium,
    L=L_FCV711_FT711,
    h=h_FCV711_FT711,
    t=t_S700,
    pin_start=FCV711_pout,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,40})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_SourceOut_FCV711(
    redeclare model Medium = Medium,
    L=L_HX711_SourceOut_FCV711,
    h=h_HX711_SourceOut_FCV711,
    t=t_S700,
    pin_start=EX711_pout_hot,
    Tin_start=EX711_Tout_hot,
    Tout_start=EX711_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT711(redeclare model Medium = Medium,T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Flow sensor at the outlet outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={102,58})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT711(redeclare model Medium = Medium,T_start=
        EX711_Tout_hot, p_start=FCV711_pout)
    "Temperature sensor at the outlet of EX711 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={102,74})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT711
    "Pressure sensor at the outlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={102,88})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL711_TT712_SourceIn(
    redeclare model Medium = Medium,
    L=L_HX711_TT712_SourceIn,
    h=h_HX711_TT712_SourceIn,
    t=t_S700,
    pin_start=EX711_pin_hot,
    Tin_start=EX711_Tin_hot,
    Tout_start=EX711_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX711_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={60,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT712(redeclare model Medium = Medium,T_start=
        EX711_Tin_hot, p_start=EX711_pin_hot)
    "Temperature sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT712
    "Pressure sensor at the inlet of EX711 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={58,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX721(
    redeclare model Medium = Medium,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX721_Tin_cold,
    Tin_start_hot=EX721_Tin_hot,
    Tout_start_cold=EX721_Tout_cold,
    Tout_start_hot=EX721_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=true,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot,
    UA_ext=750,
    UA_int=750)                                                    annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={239,-58.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV721(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV721.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV721.dp_nom,
    Tin_start(displayUnit="K") = EX721_Tout_hot,
    pin_start=EX721_pout_hot,
    q_m3h_start=EX721_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_FCV721_FT721(
    redeclare model Medium = Medium,
    L=L_FCV721_FT721,
    h=h_FCV721_FT721,
    t=t_S700,
    pin_start=FCV721_pout,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={260,38})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_SourceOut_FCV721(
    redeclare model Medium = Medium,
    L=L_HX721_SourceOut_FCV721,
    h=h_HX721_SourceOut_FCV721,
    t=t_S700,
    pin_start=EX721_pout_hot,
    Tin_start=EX721_Tout_hot,
    Tout_start=EX721_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={260,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT721(redeclare model Medium = Medium,T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Flow sensor at the outlet outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={262,58})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT721(redeclare model Medium = Medium,T_start=
        EX721_Tout_hot, p_start=FCV721_pout)
    "Temperature sensor at the outlet of EX721 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={262,74})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT721
    "Pressure sensor at the outlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={262,88})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL721_TT722_SourceIn(
    L=L_HX721_TT722_SourceIn,
    h=h_HX721_TT722_SourceIn,
    t=t_S700,
    pin_start=EX721_pin_hot,
    Tin_start=EX721_Tin_hot,
    Tout_start=EX721_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX721_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={220,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT722(redeclare model Medium = Medium,T_start=
        EX721_Tin_hot, p_start=EX721_pin_hot)
    "Temperature sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={218,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT722
    "Pressure sensor at the inlet of EX721 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={218,80})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX731(
    redeclare model Medium = Medium,
    initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
    hctype_hot=hctype,
    Di_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Di_cold,
    Di_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Di_hot,
    L_cold=DistrictHeatingNetwork.Data.BPHEData.E701.L_cold,
    L_hot=DistrictHeatingNetwork.Data.BPHEData.E701.L_hot,
    hctype_cold=hctype,
    MWall=DistrictHeatingNetwork.Data.BPHEData.E701.MWall,
    Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_cold,
    Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E701.Stot_hot,
    Tin_start_cold=EX731_Tin_cold,
    Tin_start_hot=EX731_Tin_hot,
    Tout_start_cold=EX731_Tout_cold,
    Tout_start_hot=EX731_Tout_hot,
    cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_cold,
    cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E701.cpm_hot,
    t_cold=DistrictHeatingNetwork.Data.BPHEData.E701.t_cold,
    t_hot=DistrictHeatingNetwork.Data.BPHEData.E701.t_hot,
    gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_cold,
    gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.gamma_nom_hot,
    h_cold=DistrictHeatingNetwork.Data.BPHEData.E701.h_cold,
    h_hot=DistrictHeatingNetwork.Data.BPHEData.E701.h_hot,
    hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_cold,
    hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.hin_start_hot,
    k_cold=DistrictHeatingNetwork.Data.BPHEData.E701.k_cold,
    k_hot=DistrictHeatingNetwork.Data.BPHEData.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_cold,
    lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E701.lambdam_hot,
    m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_cold,
    m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
    n=9,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot +
        DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=true,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot,
    UA_ext=750,
    UA_int=750)                                                    annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={-81,-57.5})));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV731(
    redeclare model Medium = Medium,
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV731.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV731.dp_nom,
    Tin_start(displayUnit="K") = EX731_Tout_hot,
    pin_start=EX731_pout_hot,
    q_m3h_start=EX731_q_m3h_cold) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-60,10})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_FCV731_FT731(
    redeclare model Medium = Medium,
    L=L_FCV731_FT731,
    h=h_FCV731_FT731,
    t=t_S700,
    pin_start=FCV731_pout,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-60,36})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_SourceOut_FCV731(
    redeclare model Medium = Medium,
    L=L_HX731_SourceOut_FCV731,
    h=h_HX731_SourceOut_FCV731,
    t=t_S700,
    pin_start=EX731_pout_hot,
    Tin_start=EX731_Tout_hot,
    Tout_start=EX731_Tout_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-60,-20})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT731(redeclare model Medium = Medium,T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Flow sensor at the outlet outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-58,54})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT731(redeclare model Medium = Medium,T_start=
        EX731_Tout_hot, p_start=FCV731_pout)
    "Temperature sensor at the outlet of EX731 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-58,70})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT731
    "Pressure sensor at the outlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={-58,84})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL731_TT732_SourceIn(
    redeclare model Medium = Medium,
    L=L_HX731_TT732_SourceIn,
    h=h_HX731_TT732_SourceIn,
    t=t_S700,
    pin_start=EX731_pin_hot,
    Tin_start=EX731_Tin_hot,
    Tout_start=EX731_Tin_hot,
    Di=Di_S700,
    q_m3h_start=EX731_q_m3h_hot,
    n=n,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-100,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT732(redeclare model Medium = Medium,T_start=
        EX731_Tin_hot, p_start=EX731_pin_hot)
    "Temperature sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-102,40})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT732
    "Pressure sensor at the inlet of EX731 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-102,80})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT734(redeclare model Medium = Medium,T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-5.5,-5.5},{5.5,5.5}},
        rotation=90,
        origin={-102.5,-91.5})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT723(redeclare model Medium = Medium,T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={257,-93})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT724(redeclare model Medium = Medium,T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX721 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={218,-94})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT713(redeclare model Medium = Medium,T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={97,-90})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT714(redeclare model Medium = Medium,T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX711 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={58,-90})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT704(redeclare model Medium = Medium,T_start=
        Tin_start_Cool, p_start=pout_start_Users)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-262,-91})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT703(redeclare model Medium = Medium,T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-222,-86})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT733(redeclare model Medium = Medium,T_start=
        Tout_start_Cool, p_start=pin_start_Users)
    "Temperature sensor at the inlet of EX731 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-63,-92})));
  Modelica.Blocks.Sources.TimeTable EX701_p(table=[t,PT_701])
    annotation (Placement(transformation(extent={{-180,90},{-200,110}})));
  Modelica.Blocks.Sources.TimeTable EX701_TT702(table=[t,TT_702])
    annotation (Placement(transformation(extent={{-300,90},{-280,110}})));
  inner System                        system(T_amb=278.15)
    annotation (Placement(transformation(extent={{320,258},{340,278}})));
  Modelica.Blocks.Sources.TimeTable EX711_p(table=[t,PT_711])
    annotation (Placement(transformation(extent={{140,90},{120,110}})));
  Modelica.Blocks.Sources.TimeTable EX711_TT712(table=[t,TT_712])
    annotation (Placement(transformation(extent={{20,90},{40,110}})));
  Modelica.Blocks.Sources.TimeTable EX721_p(table=[t,PT_721])
    annotation (Placement(transformation(extent={{300,90},{280,110}})));
  Modelica.Blocks.Sources.TimeTable EX721_TT722(table=[t,TT_722])
    annotation (Placement(transformation(extent={{180,90},{200,110}})));
  Modelica.Blocks.Sources.TimeTable EX731_p(table=[t,PT_731])
    annotation (Placement(transformation(extent={{-20,90},{-40,110}})));
  Modelica.Blocks.Sources.TimeTable EX731_TT732(table=[t,TT_732])
    annotation (Placement(transformation(extent={{-140,90},{-120,110}})));
  Modelica.Blocks.Sources.TimeTable EX731_mflow_hot(table=[t,FT_731])
    annotation (Placement(transformation(extent={{-140,130},{-120,150}})));
  Modelica.Blocks.Sources.TimeTable EX711_mflow_hot(table=[t,FT_711])
    annotation (Placement(transformation(extent={{20,130},{40,150}})));
  Modelica.Blocks.Sources.TimeTable EX721_mflow_hot(table=[t,FT_721])
    annotation (Placement(transformation(extent={{180,130},{200,150}})));
  Modelica.Blocks.Sources.TimeTable EX701_mflow_hot(table=[t,FT_701])
    annotation (Placement(transformation(extent={{-300,130},{-280,150}})));
  Modelica.Blocks.Sources.TimeTable FCV701_theta(table=[t,thetaFCV701])
    annotation (Placement(transformation(extent={{-181,0},{-201,20}})));
  Modelica.Blocks.Sources.TimeTable FCV731_theta(table=[t,thetaFCV731])
    annotation (Placement(transformation(extent={{-22,0},{-42,20}})));
  Modelica.Blocks.Sources.TimeTable FCV711_theta(table=[t,thetaFCV711])
    annotation (Placement(transformation(extent={{139,0},{119,20}})));
  Modelica.Blocks.Sources.TimeTable FCV721_theta(table=[t,thetaFCV721])
    annotation (Placement(transformation(extent={{300,0},{280,20}})));
  Modelica.Blocks.Sources.TimeTable FT723_(table=[t,FT_723])
    annotation (Placement(transformation(extent={{300,-150},{280,-130}})));
  Modelica.Blocks.Sources.TimeTable TT723_(table=[t,TT_723])
    annotation (Placement(transformation(extent={{300,-110},{280,-90}})));
  Modelica.Blocks.Sources.TimeTable FT713_(table=[t,FT_713])
    annotation (Placement(transformation(extent={{140,-150},{120,-130}})));
  Modelica.Blocks.Sources.TimeTable TT713_(table=[t,TT_713])
    annotation (Placement(transformation(extent={{140,-110},{120,-90}})));
  Modelica.Blocks.Sources.TimeTable TT733_(table=[t,TT_733])
    annotation (Placement(transformation(extent={{-20,-110},{-40,-90}})));
  Modelica.Blocks.Sources.TimeTable TT703_(table=[t,TT_703])
    annotation (Placement(transformation(extent={{-180,-110},{-200,-90}})));
  Modelica.Blocks.Sources.TimeTable FT733_(table=[t,FT_733])
    annotation (Placement(transformation(extent={{-20,-150},{-40,-130}})));
  Modelica.Blocks.Sources.TimeTable FT703_(table=[t,FT_703])
    annotation (Placement(transformation(extent={{-180,-150},{-200,-130}})));
  Sources.SinkPressure sinkColdEX701(redeclare model Medium = Medium,
    p0=200000,
    T0=EX701_Tout_cold)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-260,-120})));
  Sources.SinkPressure sinkColdEX711(redeclare model Medium = Medium,
    p0=200000,
    T0=EX711_Tout_cold)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-120})));
  Sources.SinkPressure sinkColdEX721(redeclare model Medium = Medium,
    p0=200000,
    T0=EX721_Tout_cold)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={220,-120})));
  Sources.SinkPressure sinkColdEX731(redeclare model Medium = Medium,
    p0=200000,
    T0=EX731_Tout_cold)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-100,-122})));
  Sources.SourceMassFlow sourceColdEX701(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX701_pin_cold,
    T0=EX701_Tin_cold,
    m_flow0=m_flow_EX701_cold) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-220,-118})));
  Sources.SourceMassFlow sourceColdEX711(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX711_pin_cold,
    T0=EX711_Tin_cold,
    m_flow0=m_flow_EX711_cold) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,-118})));
  Sources.SourceMassFlow sourceColdEX721(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX721_pin_cold,
    T0=EX721_Tin_cold,
    m_flow0=m_flow_EX721_cold) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={260,-118})));
  Sources.SourceMassFlow sourceColdEX731(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX731_pin_cold,
    T0=EX731_Tin_cold,
    m_flow0=m_flow_EX731_cold) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-60,-118})));
  Sources.SinkPressure sinkHotEX701(
    redeclare model Medium = Medium,
    use_in_p0=true,
    p0=EX701_pout_hot,
    T0=EX701_Tout_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-220,104})));
  Sources.SinkPressure sinkHotEX711(
    redeclare model Medium = Medium,
    use_in_p0=true,
    p0=EX711_pout_hot,
    T0=EX711_Tout_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={100,104})));
  Sources.SinkPressure sinkHotEX721(
    redeclare model Medium = Medium,
    use_in_p0=true,
    p0=EX721_pout_hot,
    T0=EX721_Tout_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={260,104})));
  Sources.SinkPressure sinkHotEX731(
    redeclare model Medium = Medium,
    use_in_p0=true,
    p0=EX731_pout_hot,
    T0=EX731_Tout_hot) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-60,104})));
  Sources.SourceMassFlow sourceHotEX701(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX701_pin_hot,
    T0=EX701_Tin_hot,
    m_flow0=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-260,108})));
  Sources.SourceMassFlow sourceHotEX711(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX711_pin_hot,
    T0=EX711_Tin_hot,
    m_flow0=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={60,108})));
  Sources.SourceMassFlow sourceHotEX721(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX721_pin_hot,
    T0=EX721_Tin_hot,
    m_flow0=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={220,108})));
  Sources.SourceMassFlow sourceHotEX731(
    redeclare model Medium = Medium,
    use_in_m_flow=true,
    use_in_T=true,
    p0=EX731_pin_hot,
    T0=EX731_Tin_hot,
    m_flow0=1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-100,108})));
equation
  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{-220,28},{-220,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{-220,0},{-220,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{-220,-32},{-220,-46.75},{-218.7,-46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{-220,53},{-220,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{-260,20},{-260,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-260,40},{-260,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{-260,3.55271e-15},{-259.3,3.55271e-15},{-259.3,-46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FCV711_FT711.inlet,FCV711. outlet) annotation (Line(
      points={{100,30},{100,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV711.inlet,PL711_SourceOut_FCV711. outlet) annotation (Line(
      points={{100,0},{100,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_SourceOut_FCV711.inlet,EX711. outhot) annotation (Line(
      points={{100,-30},{100,-33.375},{101.3,-33.375},{101.3,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.inlet,PL711_FCV711_FT711. outlet) annotation (Line(
      points={{100,55},{100,50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.inlet,TT712. inlet) annotation (Line(
      points={{60,20},{60,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT712.inlet,PT712. inlet) annotation (Line(
      points={{60,40},{60,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_TT712_SourceIn.outlet,EX711. inhot) annotation (Line(
      points={{60,0},{60.7,0},{60.7,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{-220,86},{-220,72}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{-220,72},{-220,59}},
      color={140,56,54},
      thickness=0.5));
  connect(PT711.inlet,TT711. inlet) annotation (Line(
      points={{100,88},{100,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FT711.outlet,TT711. inlet) annotation (Line(
      points={{100,61},{100,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FCV721_FT721.inlet,FCV721. outlet) annotation (Line(
      points={{260,28},{260,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV721.inlet,PL721_SourceOut_FCV721.outlet) annotation (Line(
      points={{260,0},{260,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_SourceOut_FCV721.inlet,EX721.outhot) annotation (Line(
      points={{260,-30},{260,-39.875},{259.3,-39.875},{259.3,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.inlet,PL721_FCV721_FT721. outlet) annotation (Line(
      points={{260,55},{260,48}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.inlet,TT722.inlet) annotation (Line(
      points={{220,20},{220,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT722.inlet,PT722.inlet) annotation (Line(
      points={{220,40},{220,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_TT722_SourceIn.outlet,EX721. inhot) annotation (Line(
      points={{220,0},{220,-50},{218,-50},{218,-49.75},{218.7,-49.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FCV731_FT731.inlet,FCV731. outlet) annotation (Line(
      points={{-60,26},{-60,20}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV731.inlet,PL731_SourceOut_FCV731. outlet) annotation (Line(
      points={{-60,0},{-60,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_SourceOut_FCV731.inlet,EX731. outhot) annotation (Line(
      points={{-60,-30},{-60,-37.875},{-60.7,-37.875},{-60.7,-48.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT731.inlet,PL731_FCV731_FT731. outlet) annotation (Line(
      points={{-60,51},{-60,46}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.inlet,TT732. inlet) annotation (Line(
      points={{-100,20},{-100,40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT732.inlet,PT732. inlet) annotation (Line(
      points={{-100,40},{-100,80}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_TT732_SourceIn.outlet,EX731. inhot) annotation (Line(
      points={{-100,0},{-100,-34},{-101.3,-34},{-101.3,-48.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT721.inlet,TT721. inlet) annotation (Line(
      points={{260,88},{260,74}},
      color={140,56,54},
      thickness=0.5));
  connect(FT721.outlet,TT721. inlet) annotation (Line(
      points={{260,61},{260,74}},
      color={140,56,54},
      thickness=0.5));
  connect(PT731.inlet,TT731. inlet) annotation (Line(
      points={{-60,84},{-60,70}},
      color={140,56,54},
      thickness=0.5));
  connect(TT731.inlet,FT731. outlet) annotation (Line(
      points={{-60,70},{-60,57}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.outcold,TT734. inlet) annotation (Line(
      points={{-101.3,-66.25},{-101.3,-69.875},{-100.3,-69.875},{-100.3,-91.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.incold,TT723. inlet) annotation (Line(
      points={{259.3,-67.25},{259.3,-83.125},{259.4,-83.125},{259.4,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721.outcold,TT724. inlet) annotation (Line(
      points={{218.7,-67.25},{220.4,-67.25},{220.4,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711.outcold,TT714. inlet) annotation (Line(
      points={{60.7,-67.25},{60.4,-67.25},{60.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(TT713.inlet,EX711. incold) annotation (Line(
      points={{99.4,-90},{99.4,-69.625},{101.3,-69.625},{101.3,-67.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{-259.3,-64.25},{-259.6,-64.25},{-259.6,-91}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{-219.6,-86},{-219.6,-66.125},{-218.7,-66.125},{-218.7,-64.25}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731.incold,TT733. inlet) annotation (Line(
      points={{-60.7,-66.25},{-60.7,-70.125},{-60.6,-70.125},{-60.6,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.opening,FCV701_theta. y)
    annotation (Line(points={{-212,10},{-202,10}},   color={0,0,127}));
  connect(FCV711_theta.y, FCV711.opening)
    annotation (Line(points={{118,10},{108,10}},     color={0,0,127}));
  connect(FCV721_theta.y, FCV721.opening)
    annotation (Line(points={{279,10},{268,10}},     color={0,0,127}));
  connect(FCV731.opening, FCV731_theta.y)
    annotation (Line(points={{-52,10},{-43,10}},   color={0,0,127}));
  connect(sourceColdEX701.outlet, TT703.inlet) annotation (Line(
      points={{-220,-108},{-220,-96},{-219.6,-96},{-219.6,-86}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703_.y, sourceColdEX701.in_T)
    annotation (Line(points={{-201,-100},{-208,-100},{-208,-118},{-215,-118}}, color={0,0,127}));
  connect(FT703_.y, sourceColdEX701.in_m_flow)
    annotation (Line(points={{-201,-140},{-208,-140},{-208,-124},{-215,-124}}, color={0,0,127}));
  connect(sinkColdEX701.inlet, TT704.inlet) annotation (Line(
      points={{-260,-110},{-260,-88},{-259.6,-88},{-259.6,-91}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceColdEX731.outlet, TT733.inlet) annotation (Line(
      points={{-60,-108},{-60,-100},{-60.6,-100},{-60.6,-92}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkColdEX731.inlet, TT734.inlet) annotation (Line(
      points={{-100,-112},{-100,-101.75},{-100.3,-101.75},{-100.3,-91.5}},
      color={140,56,54},
      thickness=0.5));
  connect(TT733_.y, sourceColdEX731.in_T)
    annotation (Line(points={{-41,-100},{-48,-100},{-48,-118},{-55,-118}}, color={0,0,127}));
  connect(FT733_.y, sourceColdEX731.in_m_flow)
    annotation (Line(points={{-41,-140},{-48,-140},{-48,-124},{-55,-124}}, color={0,0,127}));
  connect(sinkColdEX711.inlet, TT714.inlet) annotation (Line(
      points={{60,-110},{60,-100},{60.4,-100},{60.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceColdEX711.outlet, TT713.inlet) annotation (Line(
      points={{100,-108},{100,-99},{99.4,-99},{99.4,-90}},
      color={140,56,54},
      thickness=0.5));
  connect(FT713_.y, sourceColdEX711.in_m_flow)
    annotation (Line(points={{119,-140},{110,-140},{110,-124},{105,-124}}, color={0,0,127}));
  connect(TT713_.y, sourceColdEX711.in_T)
    annotation (Line(points={{119,-100},{110,-100},{110,-118},{105,-118}}, color={0,0,127}));
  connect(sinkColdEX721.inlet, TT724.inlet) annotation (Line(
      points={{220,-110},{220,-102},{220.4,-102},{220.4,-94}},
      color={140,56,54},
      thickness=0.5));
  connect(TT723_.y, sourceColdEX721.in_T)
    annotation (Line(points={{279,-100},{274,-100},{274,-118},{265,-118}}, color={0,0,127}));
  connect(FT723_.y, sourceColdEX721.in_m_flow)
    annotation (Line(points={{279,-140},{274,-140},{274,-124},{265,-124}}, color={0,0,127}));
  connect(sourceColdEX721.outlet, TT723.inlet) annotation (Line(
      points={{260,-108},{260,-100.5},{259.4,-100.5},{259.4,-93}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHotEX701.outlet, PT702.inlet)
    annotation (Line(
      points={{-260,98},{-260,80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_mflow_hot.y, sourceHotEX701.in_m_flow)
    annotation (Line(points={{-279,140},{-276,140},{-276,114},{-265,114}}, color={0,0,127}));
  connect(EX701_TT702.y, sourceHotEX701.in_T)
    annotation (Line(points={{-279,100},{-276,100},{-276,108},{-265,108}}, color={0,0,127}));
  connect(sinkHotEX701.inlet, PT701.inlet)
    annotation (Line(
      points={{-220,94},{-220,86}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701_p.y, sinkHotEX701.in_p0)
    annotation (Line(points={{-201,100},{-211.6,100}}, color={0,0,127}));
  connect(sourceHotEX711.outlet, PT712.inlet)
    annotation (Line(
      points={{60,98},{60,80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX711_mflow_hot.y, sourceHotEX711.in_m_flow)
    annotation (Line(points={{41,140},{48,140},{48,114},{55,114}}, color={0,0,127}));
  connect(EX711_TT712.y, sourceHotEX711.in_T)
    annotation (Line(points={{41,100},{48,100},{48,108},{55,108}}, color={0,0,127}));
  connect(EX711_p.y, sinkHotEX711.in_p0)
    annotation (Line(points={{119,100},{108.4,100}}, color={0,0,127}));
  connect(sourceHotEX721.outlet, PT722.inlet)
    annotation (Line(
      points={{220,98},{220,80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX721_TT722.y, sourceHotEX721.in_T)
    annotation (Line(points={{201,100},{208,100},{208,108},{215,108}}, color={0,0,127}));
  connect(EX721_mflow_hot.y, sourceHotEX721.in_m_flow)
    annotation (Line(points={{201,140},{208,140},{208,114},{215,114}}, color={0,0,127}));
  connect(EX721_p.y, sinkHotEX721.in_p0)
    annotation (Line(points={{279,100},{268.4,100}}, color={0,0,127}));
  connect(sinkHotEX731.inlet, PT731.inlet)
    annotation (Line(
      points={{-60,94},{-60,84}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731_p.y, sinkHotEX731.in_p0)
    annotation (Line(points={{-41,100},{-51.6,100}}, color={0,0,127}));
  connect(sourceHotEX731.outlet, PT732.inlet)
    annotation (Line(
      points={{-100,98},{-100,80}},
      color={140,56,54},
      thickness=0.5));
  connect(EX731_TT732.y, sourceHotEX731.in_T)
    annotation (Line(points={{-119,100},{-112,100},{-112,108},{-105,108}}, color={0,0,127}));
  connect(EX731_mflow_hot.y, sourceHotEX731.in_m_flow)
    annotation (Line(points={{-119,140},{-112,140},{-112,114},{-105,114}}, color={0,0,127}));
  connect(sinkHotEX711.inlet, PT711.inlet)
    annotation (Line(
      points={{100,94},{100,88}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHotEX721.inlet, PT721.inlet)
    annotation (Line(
      points={{260,94},{260,88}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-340,-280},{340,280}})),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-340,-280},{340,280}})),
    experiment(
      StopTime=9000,
      Interval=100,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadPlantSimplified;
