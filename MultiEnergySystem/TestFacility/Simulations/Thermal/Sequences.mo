within MultiEnergySystem.TestFacility.Simulations.Thermal;
package Sequences
  extends Modelica.Icons.ExamplesPackage;
  package Networks
    extends DistrictHeatingNetwork.Icons.Generic.Networks;
    package Centralised
      extends DistrictHeatingNetwork.Icons.Generic.Centralised;
      model Seq_2401_Test1 "Sequence 1 done on 24/01/24"
        extends Modelica.Icons.Example;
        extends Thermal.Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_A(
          P101omega = [0, 2*pi*30; 1e6, 2*pi*30],
          P901omega = [0, 2*pi*36.4; 1.6e3, 2*pi*36.4; 1.6e3, 2*pi*34.6; 3.52e3, 2*pi*34.6; 3.52e3, 2*pi*30; 11.68e3, 2*pi*30; 11.682e3, 2*pi*35; 1e6, 2*pi*35],
          FCV101theta = [0, 0.6; 3.52e3, 0.6; 3.52e3, 1; 1e6, 1],
          FCV901theta = [0, 1; 1e6, 1],
          FCVC01theta = [0, 0.2; 1.6e3, 0.2; 1.6e3, 0; 1e6, 0],
          FCVC02theta = [0, 0; 1.6e3, 0; 1.6e3, 0.25; 2.52e3, 0.25; 2.52e3, 0.5; 4.96e3, 0.5; 4.96e3, 0.25; 1e6, 0.25],
          FCV701theta = [0, 0.7361; 1e6, 0.7361],
          FCV711theta = [0, 0.8267; 1e6, 0.8267],
          FCV721theta = [0, 0.9241; 1e6, 0.9241],
          FCV731theta = [0, 0.9; 1e6, 0.9],
          EX701q_m3h_cold = [0, 1.2918; 1e6, 1.2918],
          EX711q_m3h_cold = [0, 1.5267; 1e6, 1.5267],
          EX721q_m3h_cold = [0, 1.0565; 1e6, 1.0565],
          EX731q_m3h_cold = [0, 1.1762; 1e6, 1.1762],
          EX701_Tin_hot = 60 + 273.15,
          EX711_Tin_hot = 60 + 273.15,
          EX721_Tin_hot = 60 + 273.15,
          EX731_Tin_hot = 60 + 273.15,
          EX701_Tin_cold = 25 + 273.15,
          EX711_Tin_cold = 25 + 273.15,
          EX721_Tin_cold = 25 + 273.15,
          EX731_Tin_cold = 25 + 273.15,
          EX701_TinCold = [0, 25+273.15; 1e6, 25+273.15],
          EX711_TinCold = [0, 25+273.15; 1e6, 25+273.15],
          EX721_TinCold = [0, 25+273.15; 1e6, 25+273.15],
          EX731_TinCold = [0, 25+273.15; 1e6, 25+273.15],
          FCV901(Kv=20, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot),
          Tout_start_S9 = 41.87 + 273.15,
          T_start_hot = 41.87 + 273.15,
          GB101(Tout_start=315.02, initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState),
          FCVC02(Kv=25),
          FCV101(Kv=20),
          FCVC01(Kv = 25),
          VE901(p0=180000));

      equation
        connect(TT703_SP.y, coldSourcePEX701.in_T0) annotation (Line(points={{171,-270},{159,-270},{159,-290.6}}, color={0,0,127}));
        connect(TT733_SP.y, coldSourcePEX731.in_T0) annotation (Line(points={{327,-270},{319,-270},{319,-290.6}}, color={0,0,127}));
        connect(TT713_SP.y, coldSourcePEX711.in_T0) annotation (Line(points={{491,-270},{479,-270},{479,-290.6}}, color={0,0,127}));
        connect(TT723_SP.y, coldSourcePEX721.in_T0) annotation (Line(points={{651,-270},{640,-270},{640,-288.6},{641,-288.6}}, color={0,0,127}));
        annotation (experiment(
            StopTime=13100,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-900,-500},{900,500}})));
      end Seq_2401_Test1;

      model Seq_0412_Test2 "Sequence 2 done on 04/12/23"
        extends Modelica.Icons.Example;
        extends Thermal.Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_B(
          coldSourcePEX721(T0=EX721_Tin_cold),
          coldSourcePEX711(T0=EX711_Tin_cold),
          coldSourcePEX731(T0=EX731_Tin_cold),
          coldSourcePEX701(T0=EX701_Tin_cold),
          TT713_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          TT723_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          TT733_SP(table=[0,16.5 + 273.15; 1e6,16.5 + 273.15]),
          FT703_mflow(table=kq*[0,1.32*998/3600; 1e6,1.32*998/3600]),
          FT713_mflow(table=kq*[0,1.6193*998/3600; 1e6,1.6193*998/3600]),
          FT723_mflow(table=kq*[0,1.1859*998/3600; 1e6,1.1859*998/3600]),
          FT733_mflow(table=kq*[0,1.3281*998/3600; 1e6,1.3281*998/3600]),
          GB101_ToutSP=[0,76 + 273.15; 1e6,273.15],
          EB401_ToutSP=[0,74 + 273.15; 1e6,273.15],
          EX701_Tin_hot=T_start_hot,
          EX711_Tin_hot=T_start_hot,
          EX721_Tin_hot=T_start_hot,
          EX731_Tin_hot=T_start_hot,
          EX701_Tout_hot=T_start_hot - 20,
          EX711_Tout_hot=T_start_hot - 20,
          EX721_Tout_hot=T_start_hot - 20,
          EX731_Tout_hot=T_start_hot - 20,
          EX701_q_m3h_hot=0.62,
          EX701_Tin_cold=16.5 + 273.15,
          EX711_Tin_cold=16.5 + 273.15,
          EX721_Tin_cold=16.5 + 273.15,
          EX731_Tin_cold=16.5 + 273.15,
          FCVC01theta=[0,0; 338,0; 338,0; 1e6,0],
          FCVC02theta=[0,1; 1e6,1],
          FCV101theta=[0,0.8; 0.27e4,0.8; 0.27e4,0.7; 0.28e4,0.7; 0.28e4,0.6; 0.305e4,0.6; 0.305e4,0.5; 0.7740e4,0.5; 0.7740e4,1; 0.7761e4,1; 0.7761e4,0.8; 0.807e4,0.8; 0.807e4,1;
              1e6,1],
          FCV401theta=[0,0.1; 1e6,0.1],
          FCV901theta=[0,0.4; 1e6,0.4],
          FCV701theta=[0,0.59; 334,0.59; 438,1; 480,1; 815,0.59; 3511,0.66; 4973,0.66; 6866,0.56; 8000,0.56; 10000,0.69; 1e6,0.69],
          FCV711theta=[0,0.73; 442,0.73; 442,1; 482,1; 890,0.68; 1018,0.68; 1724,0.78; 2665,0.78; 3390,0.66; 3689,0.66; 4013,0.78; 4372,0.78; 6272,0.65; 6400,0.65; 6875,0.77; 7024,
              0.77; 7264,0.74; 7798,0.74; 8517,0.8; 8658,0.8; 9071,0.65; 9138,0.65; 9452,0.78; 9689,0.78; 9689,0.79; 1e6,0.79],
          FCV721theta=[0,0.75; 442,0.75; 442,1; 890,1; 1848,0.79; 4505,0.79; 7250,0.96; 9538,0.78; 1e6,0.78],
          FCV731theta=[0,0.9; 0.041e4,0.9; 0.041e4,1; 0.3684e4,1; 0.5e4,0.92; 1e6,0.92],
          VE901(p0=1.76e5),
          Tout_start_S9=72 + 273.15,
          T_start_hot=72 + 273.15,
          FCV901(Kv=33,   openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot),
          GB101(
            Tout_start=346.15,
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
            Pmaxnom=GB101_Pmaxnom),
          EB401(
            Tout_start=342.15,
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
            h=0.5,
            nR=4),
          FCVC01(
            openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage,
            Tin_start=T_start_hot,
            Kv=25),
          FCV101(Kv= 33, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          EB401_Status(table={537,768,2271,2500}),
          rackL6L7_FCVC02_cold(h=-h_rL6L7_FCVC02_H*0.5),
          FCVC02(Kv=25, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          TT703_SPP(y=Tcoolsin),
          FCV701(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV721(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV731(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV711(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV401(Kv= 33),
          FV402(Kv= 33),
          PL4_S901(h = 1),
          P101(correctionfactor = 1.5),
          FV401(Kv = 33),
          P401(correctionfactor = 2),
          PL_S100_P101_FCV101(L = 2, h = 2),
          FT703(G = 1e-8),
          FT733(G = 1e-8),
          FT713(G = 1e-8),
          FT723(G = 1e-8));
        //FCV701theta = [0, 0.6269; 1e6, 0.6269],
        parameter Real kq = 0.7;
        parameter DistrictHeatingNetwork.Types.Power GB101_Pmaxnom = 147.6e3*0.8;
        parameter Real freq = 0.00384 "frequency of the  sinusoidal cooling temperature behaviour";
        Real Tcoolsin;
      equation
        Tcoolsin = 273.15 + 16.7 + 1.7*sin(2*3.1415*freq*(time + 200));
        connect(TT703_SPP.y, coldSourcePEX701.in_T0) annotation (Line(points={{169,-240},{159,-240},{159,-290.6}}, color={0,0,127}));
        connect(TT703_SPP.y, coldSourcePEX731.in_T0) annotation (Line(points={{169,-240},{164,-240},{164,-250},{242,-250},{242,-280},{319,-280},{319,-290.6}}, color={0,0,127}));
        connect(coldSourcePEX711.in_T0, coldSourcePEX731.in_T0) annotation (Line(points={{479,-290.6},{479,-278},{319,-278},{319,-290.6}}, color={0,0,127}));
        connect(coldSourcePEX721.in_T0, coldSourcePEX711.in_T0) annotation (Line(points={{641,-288.6},{640,-288.6},{640,-280},{479,-280},{479,-290.6}}, color={0,0,127}));
        annotation (
          experiment(StopTime = 10000, Tolerance = 1e-06, StartTime = 0, Interval = 20),
          Diagram(coordinateSystem(extent = {{-900, -500}, {900, 500}})));
      end Seq_0412_Test2;

      model Seq_0412_Test2_indexes
        extends Seq_0412_Test2;

        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixFT101 = "FT101" "Matrix name in file";
        parameter String matrixFT401 = "FT401" "Matrix name in file";
        parameter String matrixFT901 = "FT901" "Matrix name in file";
        parameter String matrixTT101 = "TT101" "Matrix name in file";
        parameter String matrixTT102 = "TT102" "Matrix name in file";
        parameter String matrixTT401 = "TT401" "Matrix name in file";
        parameter String matrixTT402 = "TT402" "Matrix name in file";
        parameter String matrixTT901 = "TT901" "Matrix name in file";
        parameter String matrixTT902 = "TT902" "Matrix name in file";
        parameter String timenoscale = "time" "Matrix name in file";

        DistrictHeatingNetwork.Utilities.ASHRAEIndex FT401Analysis annotation (Placement(transformation(extent={{-412,-220},{-432,-200}})));
        Modelica.Blocks.Sources.TimeTable FT401_meas(table=[ts,FT401real])
                                                     annotation (Placement(transformation(extent={{-380,-190},{-400,-170}})));

        DistrictHeatingNetwork.Utilities.ASHRAEIndex FT101Analysis annotation (Placement(transformation(extent={{-412,-256},{-432,-236}})));
        Modelica.Blocks.Sources.TimeTable FT101_meas(table=[ts,FT101real]) annotation (Placement(transformation(extent={{-380,-250},{-400,-230}})));
        Modelica.Blocks.Sources.TimeTable dTS400_meas(table=[ts,TT402real - TT401real])
                                                     annotation (Placement(transformation(extent={{-400,-100},{-420,-80}})));
        Modelica.Blocks.Math.Feedback substractdTS400 annotation (Placement(transformation(extent={{-398,-120},{-416,-102}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex dTS400Analysis
                                                                   annotation (Placement(transformation(extent={{-440,-116},{-460,-96}})));
        Modelica.Blocks.Sources.TimeTable dTS100_meas(table=[ts,TT102real - TT101real]) annotation (Placement(transformation(extent={{-220,-60},{-200,-40}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex dTS100Analysis annotation (Placement(transformation(extent={{-180,-80},{-160,-60}})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-220,-82},{-200,-62}})));
        Modelica.Blocks.Sources.TimeTable FT901_meas(table=[ts,FT901real]) annotation (Placement(transformation(extent={{-720,172},{-700,192}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex FT401Analysis1
                                                                   annotation (Placement(transformation(extent={{-680,160},{-660,180}})));
        Modelica.Blocks.Sources.TimeTable dTS900_meas(table=[ts,TT902real - TT901real]) annotation (Placement(transformation(extent={{-826,210},{-846,230}})));
        Modelica.Blocks.Math.Feedback substractdTS900 annotation (Placement(transformation(extent={{-832,194},{-848,178}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex dTS400Analysis1
                                                                   annotation (Placement(transformation(extent={{-856,180},{-876,200}})));
      protected
        final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixFT401) "dimension of matrix";
        final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
        final parameter Real FT101real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT101, dim[1], dim[2]);
        final parameter Real FT401real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT401, dim[1], dim[2]);
        final parameter Real FT901real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT901, dim[1], dim[2]);
        final parameter Real TT101real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT101, dim[1], dim[2]);
        final parameter Real TT102real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT102, dim[1], dim[2]);
        final parameter Real TT401real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT401, dim[1], dim[2]);
        final parameter Real TT402real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT402, dim[1], dim[2]);
        final parameter Real TT901real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT901, dim[1], dim[2]);
        final parameter Real TT902real[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTT902, dim[1], dim[2]);
      equation
        connect(FT401_meas.y, FT401Analysis.u_meas) annotation (Line(points={{-401,-180},{-406,-180},{-406,-205},{-410,-205}}, color={0,0,127}));
        connect(FT101_meas.y, FT101Analysis.u_meas) annotation (Line(points={{-401,-240},{-405.5,-240},{-405.5,-241},{-410,-241}}, color={0,0,127}));
        connect(FT101.q_m3hr, FT101Analysis.u_sim) annotation (Line(points={{-288.1,-195},{-304,-195},{-304,-266},{-404,-266},{-404,-251},{-410,-251}}, color={0,0,127}));
        connect(TT402.T, substractdTS400.u1) annotation (Line(points={{-312.2,-74},{-310,-74},{-310,-80},{-384,-80},{-384,-111},{-399.8,-111}}, color={0,0,127}));
        connect(TT401.T, substractdTS400.u2) annotation (Line(points={{-371.8,-106},{-380,-106},{-380,-124},{-407,-124},{-407,-118.2}}, color={0,0,127}));
        connect(substractdTS400.y, dTS400Analysis.u_sim) annotation (Line(points={{-415.1,-111},{-438,-111}}, color={0,0,127}));
        connect(dTS400_meas.y, dTS400Analysis.u_meas) annotation (Line(points={{-421,-90},{-426,-90},{-426,-101},{-438,-101}}, color={0,0,127}));
        connect(FT401.q_m3hr, FT401Analysis.u_sim) annotation (Line(points={{-374.1,-195},{-378,-195},{-378,-215},{-410,-215}}, color={0,0,127}));
        connect(TT102.T, feedback.u1) annotation (Line(points={{-230.2,-72},{-218,-72}}, color={0,0,127}));
        connect(TT101.T, feedback.u2) annotation (Line(points={{-285.8,-94},{-292,-94},{-292,-90},{-210,-90},{-210,-80}}, color={0,0,127}));
        connect(feedback.y, dTS100Analysis.u_sim) annotation (Line(points={{-201,-72},{-192,-72},{-192,-75},{-182,-75}}, color={0,0,127}));
        connect(dTS100_meas.y, dTS100Analysis.u_meas) annotation (Line(points={{-199,-50},{-192,-50},{-192,-65},{-182,-65}}, color={0,0,127}));
        connect(FT901_meas.y, FT401Analysis1.u_meas) annotation (Line(points={{-699,182},{-690,182},{-690,175},{-682,175}}, color={0,0,127}));
        connect(FT901.q_m3hr, FT401Analysis1.u_sim) annotation (Line(points={{-748.5,166},{-715.25,166},{-715.25,165},{-682,165}}, color={0,0,127}));
        connect(TT901.T, substractdTS900.u2) annotation (Line(points={{-815.925,200.25},{-840,200.25},{-840,192.4}}, color={0,0,127}));
        connect(TT902.T, substractdTS900.u1) annotation (Line(points={{-748.575,196.25},{-740,196.25},{-740,186},{-833.6,186}}, color={0,0,127}));
        connect(substractdTS900.y, dTS400Analysis1.u_sim) annotation (Line(points={{-847.2,186},{-850.6,186},{-850.6,185},{-854,185}}, color={0,0,127}));
        connect(dTS900_meas.y, dTS400Analysis1.u_meas) annotation (Line(points={{-847,220},{-850,220},{-850,195},{-854,195}}, color={0,0,127}));
        annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
      end Seq_0412_Test2_indexes;

      model Seq_2903_Test1 "Sequence 3 done on 29/03/24"
        extends Modelica.Icons.Example;
        extends Thermal.Tests.Networks.Centralised.CentralisedSystemLoadSimplifiedI_B(
          coldSourcePEX721(T0=EX721_Tin_cold),
          coldSourcePEX711(T0=EX711_Tin_cold),
          coldSourcePEX731(T0=EX731_Tin_cold),
          coldSourcePEX701(T0=EX701_Tin_cold),
          FT703_mflow(table=kq*[0, 0.01; 1e6, 0.01]),
          FT713_mflow(table=kq*[0, 0.01; 1e6, 0.01]),
          FT723_mflow(table=kq*[0, 0.01; 1e6, 0.01]),
          FT733_mflow(table=kq*[0, 0.01; 1e6, 0.01]),
          GB101_ToutSP=[0, 12 + 273.15; 1e6, 12 + 273.15],
          EB401_ToutSP=[0, 12 + 273.15; 1e6, 12 + 273.15],
          EX701_Tin_hot=T_start_hot,
          EX711_Tin_hot=T_start_hot,
          EX721_Tin_hot=T_start_hot,
          EX731_Tin_hot=T_start_hot,
          EX701_Tout_hot=T_start_hot,
          EX711_Tout_hot=T_start_hot,
          EX721_Tout_hot=T_start_hot,
          EX731_Tout_hot=T_start_hot,
          EX701_q_m3h_hot=0.62,
          EX701_Tin_cold=9.5 + 273.15,
          EX711_Tin_cold=9.5 + 273.15,
          EX721_Tin_cold=9.5 + 273.15,
          EX731_Tin_cold=9.5 + 273.15,
          FCVC01theta=[0,0; 1e6,0],
          FCVC02theta=[0,0; 1e6,0],
          FCV101theta=[0, 1; 3668, 1; 3670, 0.75; 4466, 0.75; 4468, 0.5; 4986, 0.5; 4988, 1; 6000, 1],
          FCV401theta=[0, 1; 6e3, 1],
          FCV901theta=[0, 1; 1322, 1; 1324, 0.5; 2288, 0.5; 2290, 0.25; 2686, 0.25; 2688, 1; 6e3, 1],
          FCV701theta=[0, 1; 6e3, 1],
          FCV711theta=[0, 1; 6e3, 1],
          FCV721theta=[0, 1; 6e3, 1],
          FCV731theta=[0, 1; 6e3, 1],
          VE901(p0=1.94e5),
          Tout_start_S9= 10 + 273.15,
          T_start_hot= 10 + 273.15,
          GB101(
            Tout_start= 10 + 273.15,
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
            Pmaxnom=GB101_Pmaxnom),
          EB401(
            Tout_start= 10 + 273.15,
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
            nR=4),
          FCVC01(Kv=33, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage, Tin_start=T_start_hot),
          FCVC02(Kv=33, openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV901(Kv=33, openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot),
          FCV101(Kv=33, openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV401(Kv=33, openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          GB101_Status(startValue = false),
          EB401_Status(table = {1e6}, startValue = false),
          rackL6L7_FCVC02_cold(h=-h_rL6L7_FCVC02_H*0.5),
          TT703_SPP(y=Tcoolsin),
          FCV701(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV721(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV731(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FCV711(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage),
          FV401(Kv=33),
          FV402(Kv=33),
          PL4_S901(h = 1),
          P101(correctionfactor = correctionfactorP101),
          P401(correctionfactor = correctionfactorP401),
          P901(correctionfactor = correctionfactorP901),
          P101omega = [0, 2*pi*30; 2828, 2*pi*30; 2830, 2*pi*35; 3012, 2*pi*35; 3014, 2*pi*40; 3344, 2*pi*40; 3346, 2*pi*45; 3512, 2*pi*45; 3514, 2*pi*50; 3632, 2*pi*50; 3634, 2*pi*30; 3820, 2*pi*30; 3822, 2*pi*35; 3922, 2*pi*35; 3924, 2*pi*40; 4142, 2*pi*40; 4144, 2*pi*45; 4262, 2*pi*45; 4264, 2*pi*50; 4442, 2*pi*50; 4444, 2*pi*30; 4584, 2*pi*30; 4586, 2*pi*35; 4636, 2*pi*35; 4638, 2*pi*40; 4758, 2*pi*40; 4760, 2*pi*45; 4880, 2*pi*45; 4882, 2*pi*50; 5e3, 2*pi*50],
          P401omega = [0, 2*pi*30; 5008, 2*pi*30; 5010, 2*pi*50; 6000, 2*pi*50],
          P901omega = [0, 2*pi*30; 156, 2*pi*30; 158, 2*pi*40; 224, 2*pi*40; 226, 2*pi*30; 474, 2*pi*30; 484, 2*pi*35; 764, 2*pi*35; 766, 2*pi*40; 994, 2*pi*40; 996, 2*pi*45; 1124, 2*pi*45; 1126, 2*pi*50; 1282, 2*pi*50; 1284, 2*pi*40; 1312, 2*pi*40; 1314, 2*pi*30; 1546, 2*pi*30; 1548, 2*pi*35; 1614, 2*pi*35; 1616, 2*pi*40; 2008, 2*pi*40; 2010, 2*pi*45; 2084, 2*pi*45; 2086, 2*pi*50; 2156, 2*pi*50; 2158, 2*pi*40; 2268, 2*pi*40; 2270, 2*pi*30; 2346, 2*pi*30; 2348, 2*pi*35; 2442, 2*pi*35; 2444, 2*pi*40; 2498, 2*pi*40; 2500, 2*pi*45; 2616, 2*pi*45; 2618, 2*pi*50; 1e6, 2*pi*50],
          PL_S100_P101_FCV101(L = 2, h = h_comp_S1),
          PL4_S401(h=h_comp_S4),
          FT703(G = 1e-8),
          FT733(G = 1e-8),
          FT713(G = 1e-8),
          FT723(G = 1e-8));
        //FCV701theta = [0, 0.6269; 1e6, 0.6269],
        parameter Real kq = 1;
        parameter DistrictHeatingNetwork.Types.Power GB101_Pmaxnom = 147.6e3*0.8;
        parameter Real freq = 0.00384 "frequency of the  sinusoidal cooling temperature behaviour";
        parameter Real pi = Modelica.Constants.pi;
        parameter DistrictHeatingNetwork.Types.Length h_comp_S1 = 0;
        parameter DistrictHeatingNetwork.Types.Length h_comp_S4 = 0;
        parameter Real correctionfactorP101 = 1;
        parameter Real correctionfactorP401 = 1;
        parameter Real correctionfactorP901 = 1;
        Real Tcoolsin;
      equation
        Tcoolsin = 273.15 + 9.5;
        connect(TT703_SPP.y, coldSourcePEX701.in_T0) annotation (Line(points={{169,-240},{159,-240},{159,-290.6}}, color={0,0,127}));
        connect(TT703_SPP.y, coldSourcePEX731.in_T0) annotation (Line(points={{169,-240},{164,-240},{164,-250},{242,-250},{242,-280},{319,-280},{319,-290.6}}, color={0,0,127}));
        connect(coldSourcePEX711.in_T0, coldSourcePEX731.in_T0) annotation (Line(points={{479,-290.6},{479,-278},{319,-278},{319,-290.6}}, color={0,0,127}));
        connect(coldSourcePEX721.in_T0, coldSourcePEX711.in_T0) annotation (Line(points={{641,-288.6},{640,-288.6},{640,-280},{479,-280},{479,-290.6}}, color={0,0,127}));
        annotation (
          experiment(
            StopTime=8000,
            Interval=20,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"),
          Diagram(coordinateSystem(extent = {{-900, -500}, {900, 500}})));
      end Seq_2903_Test1;

      model TestDynamics
        extends MultiEnergySystem.TestFacility.Simulations.Thermal.Sequences.Networks.Centralised.Seq_0412_Test2(
            GB101_ToutSP = [0, 80+273.15; 1e6, 80+273.15],
          EB401_ToutSP = [0, 80+273.15; 1e6, 80+273.15],
          EB401_Status(table = {1e6}),
          P101omega = [0, 2*3.141592654*30; 5E4, 2*3.141592654*30; 5E4, 2*3.141592654*40; 1E6, 2*3.141592654*40],
          FCV101theta = [0, 1; 6e4, 1; 6e4, 0.5; 1e6, 0.5],
          FT703(G = 1e-3), FT733(G = 1e-3), FT713(G = 1e-3), FT723(G = 1e-3));
      equation

      end TestDynamics;

    end Centralised;
  end Networks;
end Sequences;
