within MultiEnergySystem.TestFacility.Simulations.Thermal;
package Tests
  package Loads "Package to run test in the load side of the plant using real data"
    model ParallelConfiguration4Loads
      extends MultiEnergySystem.TestFacility.Loads.Thermal.Configurations.BaseClass.LoadPlantBase(
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
  end Loads;

  package Networks
    package Centralised

      model CentralisedSystemI_A
        "Sequence using Gas Boiler as heat source only"
        extends
          MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemI(
          FV933_state=false,
          FCVC01theta=[0,0; 100,0],
          FCVC02theta=[0,1; 100,1],
          FCV901theta=[0,1; 100,1],
          P901omega=[0,2*3.141592654*30; 100,2*3.141592654*30],
          FCV101theta=[0,1; 100,1],
          q_m3h_S9=10,
          P101qm3h=[0,10; 100,10],
          q_m3h_S1=10,
          FCV701theta=[0,1; 100,1],
          FCV711theta=[0,1; 100,1],
          FCV721theta=[0,1; 100,1],
          FCV731theta=[0,1; 100,1],
          TCV701theta=[0,1; 100,1],
          TCV711theta=[0,1; 100,1],
          TCV721theta=[0,1; 100,1],
          TCV731theta=[0,1; 100,1],
          FCVR01theta=[0,0.2; 100,0.2],
          PR01omega=[0,2*Modelica.Constants.pi*50; 100,2*Modelica.Constants.pi*50],
          ToutcoolSP=[0,15; 100,15]);

        Modelica.Blocks.Sources.TimeTable FCV901_theta(table=FCV901theta)
          annotation (Placement(transformation(extent={{-714,93},{-734,113}})));
        DistrictHeatingNetwork.Sources.PumpInput P901_input(
          useOmega=true,
          omega=P901omega,
          q_m3h=P901qm3h)
          annotation (Placement(transformation(extent={{-714,54},{-734,75}})));
        Modelica.Blocks.Sources.TimeTable FCVC01_theta(table=FCVC01theta)
          annotation (Placement(transformation(extent={{300,289},{280,309}})));
        Modelica.Blocks.Sources.TimeTable FCVC02_theta(table=FCVC02theta)
          annotation (Placement(transformation(extent={{740,289},{720,309}})));
        Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=FV933_state)
          annotation (Placement(transformation(extent={{-189,15},{-209,35}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
          annotation (Placement(transformation(extent={{-200,-150},{-220,-130}})));
        DistrictHeatingNetwork.Sources.PumpInput P101_input(
          useOmega=false,
          omega=P101omega,
          q_m3h=P101qm3h)
          annotation (Placement(transformation(extent={{-200,-191},{-220,-170}})));
        Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
          annotation (Placement(transformation(extent={{179,-160},{159,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
          annotation (Placement(transformation(extent={{479,-160},{459,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
          annotation (Placement(transformation(extent={{340,-160},{320,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
          annotation (Placement(transformation(extent={{639,-160},{619,-140}})));
        Modelica.Blocks.Sources.TimeTable TCV701_theta(table=TCV701theta)
          annotation (Placement(transformation(extent={{60,-330},{80,-310}})));
        Modelica.Blocks.Sources.TimeTable TCV731_theta(table=TCV731theta)
          annotation (Placement(transformation(extent={{220,-330},{240,-310}})));
        Modelica.Blocks.Sources.TimeTable TCV711_theta(table=TCV711theta)
          annotation (Placement(transformation(extent={{359,-330},{379,-310}})));
        Modelica.Blocks.Sources.TimeTable TCV721_theta(table=TCV721theta)
          annotation (Placement(transformation(extent={{519,-330},{539,-310}})));
        Modelica.Blocks.Sources.TimeTable FCVR01_theta(table=FCVR01theta)
          annotation (Placement(transformation(extent={{799,-340},{779,-320}})));
        Modelica.Blocks.Sources.TimeTable PR01_omega(table=PR01omega)
          annotation (Placement(transformation(extent={{660,-218},{680,-198}})));
        Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table=ToutcoolSP)
          "Temperature in Celsius degrees"
          annotation (Placement(transformation(extent={{728,-70},{748,-50}})));
        Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table=GB101_ToutSP)
          annotation (Placement(transformation(extent={{-318,-310},{-298,-290}})));
      equation
        connect(FCV901_theta.y, FCV901.opening)
          annotation (Line(points={{-735,103},{-742,103},{-742,115},{-749,115}},
                                                           color={0,0,127}));
        connect(P901_input.y, P901.in_omega) annotation (Line(points={{-735,64.5},{-743.5,
                64.5},{-743.5,66.3},{-747.25,66.3}},
                                              color={0,0,127}));
        connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{279,299},{268,
                299},{268,235},{258,235}}, color={0,0,127}));
        connect(FCVC02_theta.y, FCVC02.opening) annotation (Line(points={{719,299},{710,
                299},{710,234},{698,234},{698,235}}, color={0,0,127}));
        connect(FV933_OnOff.y, FV933.u)
          annotation (Line(points={{-210,25},{-216.4,25}}, color={255,0,255}));
        connect(FCV101_theta.y, FCV101.opening)
          annotation (Line(points={{-221,-140},{-232,-140}}, color={0,0,127}));
        connect(P101_input.y,P101.in_m_flow)  annotation (Line(points={{-221,-180.5},{
                -234.48,-180.5},{-234.48,-179.8}}, color={0,0,127}));
        connect(FCV701_theta.y, FCV701.opening)
          annotation (Line(points={{158,-150},{146,-150}}, color={0,0,127}));
        connect(FCV711_theta.y, FCV711.opening)
          annotation (Line(points={{458,-150},{446,-150}}, color={0,0,127}));
        connect(FCV731_theta.y, FCV731.opening)
          annotation (Line(points={{319,-150},{306,-150}}, color={0,0,127}));
        connect(FCV721_theta.y, FCV721.opening)
          annotation (Line(points={{618,-150},{606,-150}}, color={0,0,127}));
        connect(TCV701_theta.y, TCV701.opening)
          annotation (Line(points={{81,-320},{90,-320}}, color={0,0,127}));
        connect(TCV731_theta.y, TCV731.opening)
          annotation (Line(points={{241,-320},{250,-320}}, color={0,0,127}));
        connect(TCV711_theta.y, TCV711.opening)
          annotation (Line(points={{380,-320},{390,-320}}, color={0,0,127}));
        connect(TCV721_theta.y, TCV721.opening)
          annotation (Line(points={{540,-320},{549.1,-320}}, color={0,0,127}));
        connect(FCVR01_theta.y, FCVR01.opening) annotation (Line(points={{778,-330},{766,
                -330},{766,-352}}, color={0,0,127}));
        connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (Line(points={{749,-60},{767.5,
                -60},{767.5,-97.2}}, color={0,0,127}));
        connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (Line(points={{-297,-300},
                {-297,-301},{-285,-301}}, color={0,0,127}));
        connect(PR01_omega.y, PR01.in_omega) annotation (Line(points={{681,-208},{
                689.25,-208},{689.25,-207.8},{697.5,-207.8}}, color={0,0,127}));
      end CentralisedSystemI_A;

      model CentralisedSystemI_B
        extends CentralisedSystemI_A(
          VER901(T0=15 + 273.15),
          FV933_state=false,
          P901omega=[0,2*3.141592654*40; 500,2*3.141592654*40],
          pin_start_rCD_cold=2.2e5,
          VE901(p0(displayUnit="Pa") = 220000),
          P101qm3h=[0,14; 100,14],
          Tin_start_S1=70 + 273.15,
          Tout_start_S1=80 + 273.15,
          FCV101theta=[0,1; 100,1],
          FCVC01theta=[0,0; 100,0],
          FCVC02theta=[0,0; 100,0],
          FCV701theta=[0,1; 100,1],
          FCV711theta=[0,1; 100,1],
          FCV721theta=[0,1; 100,1],
          FCV731theta=[0,1; 100,1],
          FCVR01theta=[0,0.2; 8000,0.2; 8000,0.5; 10000,0.5],
          GB101(Pmaxnom=147.6e3*0.79),
          ToutcoolSP=[0,25.5; 500,25.5; 500,12; 1000,12]);

        // System 400
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=80 + 273.15;

        parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;

        parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

        parameter Real q_m3h_S4 = 5;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/
            3600;

        parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
        parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
        parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
        parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
        parameter Boolean FV401_state = true;
        parameter Boolean FV402_state = true;
        parameter Boolean FV401_startValue = true;
        parameter Boolean FV402_startValue = true;
        parameter Real FV401_s[:] = {1e6};
        parameter Real FV402_s[:] = {1e6};

        DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
          Tout_start=Tout_start_S4,
          D=0.4,
          Pmaxnom=50e3,
          Pnimnom=10e3,
          Pnom=50e3,
          Tin_start=Tin_start_S4,
          etanom=0.98,
          h=1.25,
          m_flow_nom=m_flow_S4,
          pin_start=pin_start_S4,
          pout_start=160000,
          nR=5) annotation (Placement(visible=true, transformation(
              origin={-342,-302},
              extent={{-34,-34},{34,34}},
              rotation=0)));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(
          Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start,
          Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start,
          a=DistrictHeatingNetwork.Data.PumpData.P401.a,
          b=DistrictHeatingNetwork.Data.PumpData.P401.b,
          m_flow_start=m_flow_S4,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P401.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P401.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P401.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P401.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P401.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P401.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=90,
              origin={-322,-175})));

        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
          rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
          q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
          Tin_start(displayUnit="K") = Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-140})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
          L=L_S4_PL3,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-236})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
          L=L_S4_PL2,
          t=t_S4,
          m_flow_start=m_flow_S4,
          pin_start=pin_start_S4,
          pout_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-238})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
          L=L_S4_PL3,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-112})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
              Tout_start_S4, p_start=pout_start_S4)
          "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-320,-74})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
          "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
              transformation(
              extent={{6,6},{-6,-6}},
              rotation=90,
              origin={-320,-86})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
          "Pressure sensor at the inlet of gas boiler" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=90,
              origin={-364,-118})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
              Tin_start_S4, p_start=pin_start_S4)
          "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=90,
              origin={-364,-106})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
            p_start=pin_start_S4) annotation (Placement(transformation(
              extent={{7,-7},{-7,7}},
              rotation=90,
              origin={-365,-195})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
          L=L_S4_PL1,
          t=t_S4,
          pin_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-166})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
          L=L_S4_rCD_hot,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
          L=L_S4_rCD_cold,
          t=t_S4,
          pin_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-54})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          Tin_start=Tin_start_S4,
          pin_start=pin_start_S4,
          q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=-90,
              origin={-362,-20})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          Tin_start=Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-20})));
        Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta)
          annotation (Placement(transformation(extent={{-288,-150},{-308,-130}})));
        DistrictHeatingNetwork.Sources.PumpInput P401_input(
          useOmega=false,
          omega=P401omega,
          q_m3h=P401qm3h)
          annotation (Placement(transformation(extent={{-288,-191},{-308,-170}})));
        Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table=EB401_ToutSP)
          annotation (Placement(transformation(extent={{-408,-310},{-388,-290}})));
        Modelica.Blocks.Sources.BooleanTable FV401_Status(table=FV401_s,
                                                                       startValue=
              FV401_startValue) "Input for the status (open/close) of valve FV401"
          annotation (Placement(transformation(extent={{-394,-30},{-374,-10}})));
        Modelica.Blocks.Sources.BooleanTable FV402_Status(table=FV402_s,
                                                                       startValue=
              FV402_startValue) "Input for the status (open/close) of valve FV402"
          annotation (Placement(transformation(extent={{-290,-30},{-310,-10}})));
      equation
        connect(P401.inlet,PL3_S401. outlet) annotation (Line(
            points={{-322,-184.6},{-322,-226}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV401.inlet,P401. outlet) annotation (Line(
            points={{-322,-150},{-322,-165.4}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402.inlet,PT402. inlet) annotation (Line(
            points={{-322.4,-74},{-322.4,-86}},
            color={140,56,54},
            thickness=0.5));
        connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
            points={{-322,-122},{-322,-130}},
            color={140,56,54},
            thickness=0.5));
        connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
            points={{-322.4,-86},{-322.4,-95},{-322,-95},{-322,-102}},
            color={140,56,54},
            thickness=0.5));
        connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
            points={{-362.2,-199.2},{-362.2,-207.6},{-362,-207.6},{-362,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
            points={{-362,-176},{-362,-183.4},{-362.2,-183.4},{-362.2,-190.8}},
            color={140,56,54},
            thickness=0.5));
        connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
            points={{-362,-156},{-362,-118},{-361.6,-118}},
            color={140,56,54},
            thickness=0.5));
        connect(PT401.inlet,TT401. inlet) annotation (Line(
            points={{-361.6,-118},{-361.6,-106}},
            color={140,56,54},
            thickness=0.5));
        connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
            points={{-362,-248},{-362,-258},{-352.2,-258},{-352.2,-274.8}},
            color={140,56,54},
            thickness=0.5));
        connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
            points={{-331.8,-274.8},{-331.8,-258},{-322,-258},{-322,-246}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
            points={{-322.4,-74},{-322,-74},{-322,-62}},
            color={140,56,54},
            thickness=0.5));
        connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
            points={{-361.6,-106},{-362,-106},{-362,-64}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
            points={{-362,-44},{-362,-30}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
            points={{-322,-42},{-322,-30}},
            color={140,56,54},
            thickness=0.5));
        connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
            points={{-362,-10},{-362,5.25},{-408.5,5.25}},
            color={140,56,54},
            thickness=0.5));
        connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
            points={{-322,-10},{-322,45},{-338,45}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV401_theta.y, FCV401.opening)
          annotation (Line(points={{-309,-140},{-314,-140}}, color={0,0,127}));
        connect(P401_input.y,P401.in_m_flow)  annotation (Line(points={{-309,-180.5},{
                -316.48,-180.5},{-316.48,-179.8}}, color={0,0,127}));
        connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (Line(points={{-387,-300},
                {-387,-302},{-369.2,-302}}, color={0,0,127}));
        connect(FV401_Status.y, FV401.u)
          annotation (Line(points={{-373,-20},{-365.2,-20}}, color={255,0,255}));
        connect(FV402_Status.y, FV402.u)
          annotation (Line(points={{-311,-20},{-318.8,-20}}, color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemI_B;

      model CentralisedSystemI_C
        "Gas Boiler & Heat Storage Systems included in the model"
        extends CentralisedSystemI_A;

        // System S200

        parameter Boolean FV201_state = true;
        parameter Boolean FV202_state = true;
        parameter Boolean FV203_state = true;
        parameter Boolean FV204_state = true;
        parameter Boolean FV205_state = true;
        parameter Boolean FV206_state = false;
        parameter Boolean FV207_state = false;
        parameter Boolean FV208_state = true;
        parameter Boolean FV209_state = true;

        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2=2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2=2.5e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump=1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump=3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank=
            pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank=
            pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2=60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2=60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2=10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2=51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2=1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 6;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q=q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2=q*985;
        parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
        parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

        parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0=24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1=1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2=1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3=2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4=1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7=2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8=3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9=21.5;

        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High=-2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201=1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201=2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201=0;

        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
          H=4,
          n=3,
          D=1.7,
          T_start(displayUnit="K") = 60 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2)
          annotation (Placement(transformation(extent={{-758,-476},{-814,-364}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(
          pout_start(displayUnit="Pa") = 3e5,
          Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start,
          Tout_start=DistrictHeatingNetwork.Data.PumpData.P201.Tout_start,
          a=DistrictHeatingNetwork.Data.PumpData.P201.a,
          b=DistrictHeatingNetwork.Data.PumpData.P201.b,
          m_flow_start=m_flow_S2,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P201.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P201.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P201.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P201.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P201.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P201.omeganom,
          pin_start(displayUnit="Pa") = 1.8400803e5,
          headnom=DistrictHeatingNetwork.Data.PumpData.P201.headnom,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P201.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P201.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=-90,
              origin={-790,-208})));

                    DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
          H=4,
          n=3,
          D=1.7,
          T_start(displayUnit="K") = 60 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2)
          annotation (Placement(transformation(extent={{-696,-476},{-640,-364}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start=
              Tin_start_S2, p_start=pin_start_S2)
          "Temperature sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-4.75,-4.75},{4.75,4.75}},
              rotation=90,
              origin={-791.75,-66.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
          "Pressure sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-5,-5},{5,5}},
              rotation=90,
              origin={-792,-86.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-790,-108})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-850,-198})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
          L=L_S2_PL3,
          t=L_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-850,-168})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
          L=L_S2_PL2,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-790,-240})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
          L=L_S2_PL4,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-850,-228})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start=
              Tout_start_S2, p_start=pout_start_S2)
          "Temperature sensor at the outlet of System 200" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-748,-68})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202
          "Pressure sensor at the outlet of system S200" annotation (Placement(
              transformation(
              extent={{6,6},{-6,-6}},
              rotation=90,
              origin={-748,-138})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
          L=L_S2_PL9,
          t=t_S2,
          pin_start=pout_start_S2,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-750,-48})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-710,-412})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
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
              rotation=90,
              origin={-790,-48})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,10},{-10,-10}},
              rotation=90,
              origin={-744,-412})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-726,-440})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-726,-456})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
          L=L_S2_PL6,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-818,-490})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
          L=L_S2_D201_FT201,
          h=h_S2_D201_FT201,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-830,-440})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-790,-170})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-820,-128})));

        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-820,-116})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-820,-110})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-790,-148})));

        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
          annotation (Placement(transformation(extent={{-808,-154},{-796,-142}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
          annotation (Placement(transformation(extent={{-798,-158},{-818,-138}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=180,
              origin={-770,-186})));

        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
          annotation (Placement(transformation(extent={{-6,6},{6,-6}},
              rotation=270,
              origin={-770,-172})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-770,-166})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-790,-268})));

        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
          annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
              rotation=0,
              origin={-802.5,-268})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-808,-268})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=0,
              origin={-770,-254})));

        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={-750,-218})));

        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
          annotation (Placement(transformation(extent={{-730,-224},{-741,-212}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
          annotation (Placement(transformation(extent={{-12,-12},{12,12}},
              rotation=0,
              origin={-728,-218})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
              Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
            Placement(transformation(
              extent={{-7,7},{7,-7}},
              rotation=90,
              origin={-747,-279})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
          annotation (Placement(transformation(extent={{4,-4},{-4,4}},
              rotation=-90,
              origin={-770,-264})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
            Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=-90,
              origin={-770,-268})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
          annotation (Placement(transformation(extent={{-884,-208},{-864,-188}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(
          useOmega=false,
          omega=P201omega,
          q_m3h=P201qm3h)
          annotation (Placement(transformation(extent={{-830,-214},{-810,-194}})));
      equation
        connect(PT201.inlet,TT201. inlet) annotation (Line(
            points={{-790,-86.5},{-790,-77.625},{-789.85,-77.625},{-789.85,-66.75}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
            points={{-790,-98},{-790,-86.5}},
            color={140,56,54},
            thickness=0.5));
        connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
            points={{-790,-217.6},{-790,-230}},
            color={140,56,54},
            thickness=0.5));
        connect(TT202.inlet,PT202. inlet) annotation (Line(
            points={{-750.4,-68},{-750.4,-138}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
            points={{-750,-58},{-750,-68},{-750.4,-68}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
            points={{-790,-58},{-790,-69.375},{-789.85,-69.375},{-789.85,-66.75}},
            color={140,56,54},
            thickness=0.5));
        connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
            points={{-758,-385},{-744,-385},{-744,-402}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
            Line(
            points={{-716,-440},{-710,-440},{-710,-422}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
            Line(
            points={{-736,-440},{-744,-440},{-744,-422}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
            points={{-710,-402},{-710,-385},{-696,-385}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
            points={{-736,-456},{-752,-456},{-752,-455},{-758,-455}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
            points={{-716,-456},{-712,-456},{-712,-455},{-696,-455}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
            points={{-808,-490},{-744,-490},{-744,-455},{-758,-455}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
            points={{-850,-218},{-850,-208}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
            points={{-850,-188},{-850,-178}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
            points={{-790,-180},{-790,-198.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
            points={{-850,-158},{-850,-128},{-826,-128}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
            points={{-790,-118},{-790,-142}},
            color={140,56,54},
            thickness=0.5));
        connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
            points={{-790,-154},{-790,-160}},
            color={140,56,54},
            thickness=0.5));
        connect(FV202.outlet,FV201. inlet) annotation (Line(
            points={{-814,-128},{-790,-128},{-790,-142}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.outlet,P201. inlet) annotation (Line(
            points={{-776,-186},{-790,-186},{-790,-198.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
            points={{-790,-250},{-790,-262}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.inlet,FV209. inlet) annotation (Line(
            points={{-776,-254},{-790,-254},{-790,-262}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.outlet,FV203. inlet) annotation (Line(
            points={{-764,-254},{-750,-254},{-750,-224}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.inlet,FV203. outlet) annotation (Line(
            points={{-764,-186},{-750,-186},{-750,-212}},
            color={140,56,54},
            thickness=0.5));
        connect(PT202.inlet,FV203. outlet) annotation (Line(
            points={{-750.4,-138},{-750,-138},{-750,-212}},
            color={140,56,54},
            thickness=0.5));
        connect(FT201.outlet,FV203. inlet) annotation (Line(
            points={{-749.8,-274.8},{-750,-254},{-750,-224}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-863,-198},{
                -858,-198}},                                 color={0,0,127}));
        connect(FV207.u,FV207_Status. activePort)
          annotation (Line(points={{-770,-255.92},{-770,-258.8}},
                                                              color={255,0,255}));
        connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-770,
                -259.6},{-770,-258.8}},                          color={255,0,255}));
        connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
            Line(
            points={{-850,-238},{-850,-490},{-828,-490}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
            points={{-790,-38},{-790,-18},{-702,-18},{-702,5.25},{-668,5.25}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
            points={{-750,-38},{-750,-32},{-688,-32},{-688,44.75},{-727,44.75}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206_OnOff.y,FV206_Status. activePort)
          annotation (Line(points={{-770,-178.6},{-770,-177.5}}, color={255,0,255}));
        connect(FV206_OnOff.y,FV206. u) annotation (Line(points={{-770,-178.6},{-770,-184.08}},
                           color={255,0,255}));
        connect(FV203_OnOff.y,FV203. u) annotation (Line(points={{-741.55,-218},{-748.08,
                -218}},         color={255,0,255}));
        connect(FV203_OnOff.y,FV203_Status. activePort) annotation (Line(points={{-741.55,
                -218},{-741.8,-218}},         color={255,0,255}));
        connect(PL_S200_D201_FT201.inlet,FT201. inlet) annotation (Line(
            points={{-840,-440},{-844,-440},{-844,-350},{-749.8,-350},{-749.8,-283.2}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
            points={{-820,-440},{-744,-440},{-744,-422}},
            color={140,56,54},
            thickness=0.5));
        connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
            points={{-790,-274},{-790,-330},{-850,-330},{-850,-490},{-828,-490}},
            color={140,56,54},
            thickness=0.5));
        connect(FV201_OnOff.y,FV201. u) annotation (Line(points={{-795.4,-148},{-791.92,
                -148}},         color={255,0,255}));
        connect(FV201_OnOff.y,FV201_Status. activePort)
          annotation (Line(points={{-795.4,-148},{-796.5,-148}}, color={255,0,255}));
        connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-820,-122.6},{-820,-126.08}},
                           color={255,0,255}));
        connect(FV202_OnOff.y,FV202_Status. activePort)
          annotation (Line(points={{-820,-122.6},{-820,-121.5}}, color={255,0,255}));
        connect(FV209_OnOff.y,FV209. u) annotation (Line(points={{-796.45,-268},{-791.92,
                -268}},         color={255,0,255}));
        connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-796.45,
                -268},{-796.5,-268}},         color={255,0,255}));
        connect(P201_input.y,P201.in_m_flow)  annotation (Line(points={{-809,-204},{-802.26,
                -204},{-802.26,-203.2},{-795.52,-203.2}}, color={0,0,127}));
        annotation (experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemI_C;

      model CentralisedSystemI_D
        "Gas Boiler, Electric Boiler & Water Tanks"
        extends CentralisedSystemI_B;
        // System S200

        parameter Boolean FV201_state = true;
        parameter Boolean FV202_state = true;
        parameter Boolean FV203_state = true;
        parameter Boolean FV204_state = true;
        parameter Boolean FV205_state = true;
        parameter Boolean FV206_state = false;
        parameter Boolean FV207_state = false;
        parameter Boolean FV208_state = true;
        parameter Boolean FV209_state = true;

        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2=2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2=2.5e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump=1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump=3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank=
            pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank=
            pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2=60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2=60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2=10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2=51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2=1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 6;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q=q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2=q*985;
        parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
        parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

        parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0=24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1=1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2=1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3=2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4=1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7=2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8=3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9=21.5;

        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High=-2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201=1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201=2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201=0;

        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
          H=4,
          n=3,
          D=1.7,
          T_start(displayUnit="K") = 60 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2)
          annotation (Placement(transformation(extent={{-762,-480},{-818,-368}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(
          pout_start(displayUnit="Pa") = 3e5,
          Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start,
          Tout_start=DistrictHeatingNetwork.Data.PumpData.P201.Tout_start,
          a=DistrictHeatingNetwork.Data.PumpData.P201.a,
          b=DistrictHeatingNetwork.Data.PumpData.P201.b,
          m_flow_start=m_flow_S2,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P201.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P201.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P201.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P201.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P201.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P201.omeganom,
          pin_start(displayUnit="Pa") = 1.8400803e5,
          headnom=DistrictHeatingNetwork.Data.PumpData.P201.headnom,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P201.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P201.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=-90,
              origin={-794,-212})));

                    DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
          H=4,
          n=3,
          D=1.7,
          T_start(displayUnit="K") = 60 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2)
          annotation (Placement(transformation(extent={{-700,-480},{-644,-368}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start=
              Tin_start_S2, p_start=pin_start_S2)
          "Temperature sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-4.75,-4.75},{4.75,4.75}},
              rotation=90,
              origin={-795.75,-70.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
          "Pressure sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-5,-5},{5,5}},
              rotation=90,
              origin={-796,-90.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-112})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-854,-202})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
          L=L_S2_PL3,
          t=L_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-854,-172})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
          L=L_S2_PL2,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-244})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
          L=L_S2_PL4,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-854,-232})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start=
              Tout_start_S2, p_start=pout_start_S2)
          "Temperature sensor at the outlet of System 200" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-752,-72})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202
          "Pressure sensor at the outlet of system S200" annotation (Placement(
              transformation(
              extent={{6,6},{-6,-6}},
              rotation=90,
              origin={-752,-142})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
          L=L_S2_PL9,
          t=t_S2,
          pin_start=pout_start_S2,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-754,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-714,-416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
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
              rotation=90,
              origin={-794,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,10},{-10,-10}},
              rotation=90,
              origin={-748,-416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-730,-444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-730,-460})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
          L=L_S2_PL6,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-822,-494})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
          L=L_S2_D201_FT201,
          h=h_S2_D201_FT201,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-834,-444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-174})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-824,-132})));

        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-824,-120})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-824,-114})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-794,-152})));

        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
          annotation (Placement(transformation(extent={{-812,-158},{-800,-146}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
          annotation (Placement(transformation(extent={{-802,-162},{-822,-142}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=180,
              origin={-774,-190})));

        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
          annotation (Placement(transformation(extent={{-6,6},{6,-6}},
              rotation=270,
              origin={-774,-176})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-774,-170})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-794,-272})));

        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
          annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
              rotation=0,
              origin={-806.5,-272})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-812,-272})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=0,
              origin={-774,-258})));

        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={-754,-222})));

        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
          annotation (Placement(transformation(extent={{-734,-228},{-745,-216}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
          annotation (Placement(transformation(extent={{-12,-12},{12,12}},
              rotation=0,
              origin={-732,-222})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
              Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
            Placement(transformation(
              extent={{-7,7},{7,-7}},
              rotation=90,
              origin={-751,-283})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
          annotation (Placement(transformation(extent={{4,-4},{-4,4}},
              rotation=-90,
              origin={-774,-268})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
            Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=-90,
              origin={-774,-272})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
          annotation (Placement(transformation(extent={{-888,-212},{-868,-192}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(
          useOmega=false,
          omega=P201omega,
          q_m3h=P201qm3h)
          annotation (Placement(transformation(extent={{-834,-218},{-814,-198}})));
      equation
        connect(PT201.inlet,TT201. inlet) annotation (Line(
            points={{-794,-90.5},{-794,-81.625},{-793.85,-81.625},{-793.85,-70.75}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
            points={{-794,-102},{-794,-90.5}},
            color={140,56,54},
            thickness=0.5));
        connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
            points={{-794,-221.6},{-794,-234}},
            color={140,56,54},
            thickness=0.5));
        connect(TT202.inlet,PT202. inlet) annotation (Line(
            points={{-754.4,-72},{-754.4,-142}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
            points={{-754,-62},{-754,-72},{-754.4,-72}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
            points={{-794,-62},{-794,-73.375},{-793.85,-73.375},{-793.85,-70.75}},
            color={140,56,54},
            thickness=0.5));
        connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
            points={{-762,-389},{-748,-389},{-748,-406}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
            Line(
            points={{-720,-444},{-714,-444},{-714,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
            Line(
            points={{-740,-444},{-748,-444},{-748,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
            points={{-714,-406},{-714,-389},{-700,-389}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
            points={{-740,-460},{-756,-460},{-756,-459},{-762,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
            points={{-720,-460},{-716,-460},{-716,-459},{-700,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
            points={{-812,-494},{-748,-494},{-748,-459},{-762,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
            points={{-854,-222},{-854,-212}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
            points={{-854,-192},{-854,-182}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
            points={{-794,-184},{-794,-202.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
            points={{-854,-162},{-854,-132},{-830,-132}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
            points={{-794,-122},{-794,-146}},
            color={140,56,54},
            thickness=0.5));
        connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
            points={{-794,-158},{-794,-164}},
            color={140,56,54},
            thickness=0.5));
        connect(FV202.outlet,FV201. inlet) annotation (Line(
            points={{-818,-132},{-794,-132},{-794,-146}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.outlet,P201. inlet) annotation (Line(
            points={{-780,-190},{-794,-190},{-794,-202.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
            points={{-794,-254},{-794,-266}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.inlet,FV209. inlet) annotation (Line(
            points={{-780,-258},{-794,-258},{-794,-266}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.outlet,FV203. inlet) annotation (Line(
            points={{-768,-258},{-754,-258},{-754,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.inlet,FV203. outlet) annotation (Line(
            points={{-768,-190},{-754,-190},{-754,-216}},
            color={140,56,54},
            thickness=0.5));
        connect(PT202.inlet,FV203. outlet) annotation (Line(
            points={{-754.4,-142},{-754,-142},{-754,-216}},
            color={140,56,54},
            thickness=0.5));
        connect(FT201.outlet,FV203. inlet) annotation (Line(
            points={{-753.8,-278.8},{-754,-258},{-754,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-867,-202},
                {-862,-202}},                                color={0,0,127}));
        connect(FV207.u,FV207_Status. activePort)
          annotation (Line(points={{-774,-259.92},{-774,-262.8}},
                                                              color={255,0,255}));
        connect(FV207_OnOff.y,FV207_Status. activePort) annotation (Line(points={{-774,
                -263.6},{-774,-262.8}},                          color={255,0,255}));
        connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
            Line(
            points={{-854,-242},{-854,-494},{-832,-494}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206_OnOff.y,FV206_Status. activePort)
          annotation (Line(points={{-774,-182.6},{-774,-181.5}}, color={255,0,255}));
        connect(FV206_OnOff.y,FV206. u) annotation (Line(points={{-774,-182.6},{-774,
                -188.08}}, color={255,0,255}));
        connect(FV203_OnOff.y,FV203. u) annotation (Line(points={{-745.55,-222},{
                -752.08,-222}}, color={255,0,255}));
        connect(FV203_OnOff.y,FV203_Status. activePort) annotation (Line(points={{-745.55,
                -222},{-745.8,-222}},         color={255,0,255}));
        connect(PL_S200_D201_FT201.inlet,FT201. inlet) annotation (Line(
            points={{-844,-444},{-848,-444},{-848,-354},{-753.8,-354},{-753.8,-287.2}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
            points={{-824,-444},{-748,-444},{-748,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
            points={{-794,-278},{-794,-334},{-854,-334},{-854,-494},{-832,-494}},
            color={140,56,54},
            thickness=0.5));
        connect(FV201_OnOff.y,FV201. u) annotation (Line(points={{-799.4,-152},{
                -795.92,-152}}, color={255,0,255}));
        connect(FV201_OnOff.y,FV201_Status. activePort)
          annotation (Line(points={{-799.4,-152},{-800.5,-152}}, color={255,0,255}));
        connect(FV202_OnOff.y,FV202. u) annotation (Line(points={{-824,-126.6},{-824,
                -130.08}}, color={255,0,255}));
        connect(FV202_OnOff.y,FV202_Status. activePort)
          annotation (Line(points={{-824,-126.6},{-824,-125.5}}, color={255,0,255}));
        connect(FV209_OnOff.y,FV209. u) annotation (Line(points={{-800.45,-272},{
                -795.92,-272}}, color={255,0,255}));
        connect(FV209_OnOff.y,FV209_Status. activePort) annotation (Line(points={{-800.45,
                -272},{-800.5,-272}},         color={255,0,255}));
        connect(P201_input.y,P201.in_m_flow)  annotation (Line(points={{-813,-208},{
                -806.26,-208},{-806.26,-207.2},{-799.52,-207.2}},
                                                          color={0,0,127}));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
            points={{-794,-42},{-796,-42},{-796,-8},{-708,-8},{-708,5.25},{-668,5.25}},
            color={140,56,54},
            thickness=0.5));

        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
            points={{-754,-42},{-754,-14},{-700,-14},{-700,44.75},{-727,44.75}},
            color={140,56,54},
            thickness=0.5));
        annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemI_D;

      model CentralisedSystemI_E
        "Gas & Electric Boiler, Water Tanks & CHP"
        extends CentralisedSystemI_D;

        // S500

        // General Pipeline Data
        parameter DistrictHeatingNetwork.Types.Length Di_S5=39e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S5=1.5e-3;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5=
            q_m3h_S5_Source*990/3600;
        parameter Real q_m3h_S5_Source = 4;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5=
            q_m3h_S5_User*990/3600;
        parameter Real q_m3h_S5_User = 6;

        parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real P501qm3h[:,:] = [0, 2; 100, 2];

        parameter Real Pchpomega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real Pchpqm3h[:,:] = [0, 1; 100, 1];

        parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5=2e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5=1.9e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5=80 +
            273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5=70 +
            273.15;

        parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5=1.69e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5=2.5e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5=70 +
            273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5=75 +
            273.15;

        parameter DistrictHeatingNetwork.Types.Power PeCHP[:,:]=[0,30e3; 100,30e3];
        parameter Real FCVchptheta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

        DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
          Di_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold,
          Di_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot,
          L_cold=DistrictHeatingNetwork.Data.BPHEData.E501.L_cold,
          L_hot=DistrictHeatingNetwork.Data.BPHEData.E501.L_hot,
          MWall=DistrictHeatingNetwork.Data.BPHEData.E501.MWall,
          Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold,
          Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot,
          Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold,
          Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot,
          Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold,
          Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot,
          cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold,
          cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot,
          t_cold=DistrictHeatingNetwork.Data.BPHEData.E501.t_cold,
          t_hot=DistrictHeatingNetwork.Data.BPHEData.E501.t_hot,
          gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold,
          gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot,
          h_cold=DistrictHeatingNetwork.Data.BPHEData.E501.h_cold,
          h_hot=DistrictHeatingNetwork.Data.BPHEData.E501.h_hot,
          hctype_cold=hctype,
          hctype_hot=hctype,
          hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold,
          hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot,
          k_cold=DistrictHeatingNetwork.Data.BPHEData.E501.k_cold,
          k_hot=DistrictHeatingNetwork.Data.BPHEData.E501.k_hot,
          kc_cold=1,
          kc_hot=1,
          lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold,
          lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot,
          m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold,
          m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot,
          n=5,
          nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold,
          nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot,
          nPlates=DistrictHeatingNetwork.Data.BPHEData.E501.nPlates,
          pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold,
          pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot,
          pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold,
          pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot,
          rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold +
              DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2,
          rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot +
              DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2,
          rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold,
          rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot,
          thermalInertia=false,
          u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold,
          u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
            Placement(visible=true, transformation(
              origin={-632,-195},
              extent={{-17,-28.0002},{17,28.0001}},
              rotation=-90)));

        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(
          Tin_start(displayUnit="K") = Tout_User_start_S5,
          Tout_start(displayUnit="K") = Tout_User_start_S5,
          a=DistrictHeatingNetwork.Data.PumpData.P501.a,
          b=DistrictHeatingNetwork.Data.PumpData.P501.b,
          m_flow_start=m_flow_User_S5,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=90,
              origin={-612,-145})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_Source,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-652,-243})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.04e5,
          Tin_start=Tout_User_start_S5,
          Tout_start=Tout_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_Source,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-612,-243})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-7.5,-7.5},{7.5,7.5}},
              rotation=90,
              origin={-654.5,-219.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-7,-7},{7,7}},
              rotation=-90,
              origin={-609,-219})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.04e5,
          Tin_start=Tout_User_start_S5,
          Tout_start=Tout_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-612,-67})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=51e-3,
            D_o=Di_S5) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-612,-36})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-652,-67})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=51e-3,
            D_o=Di_S5) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-652,-36})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
            Placement(transformation(
              extent={{-5.5,5.5},{5.5,-5.5}},
              rotation=90,
              origin={-609.5,-85.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start=
              Tout_User_start_S5) annotation (Placement(transformation(
              extent={{-5.5,5.5},{5.5,-5.5}},
              rotation=90,
              origin={-609.5,-116.5})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{7,-7},{-7,7}},
              rotation=90,
              origin={-655,-155})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
            Placement(transformation(
              extent={{-5.5,-5.5},{5.5,5.5}},
              rotation=90,
              origin={-654.5,-86.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-5.5,-5.5},{5.5,5.5}},
              rotation=90,
              origin={-654.5,-105.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-652,-127})));
        DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP
          annotation (Placement(transformation(extent={{-652,-334},{-610,-292}})));
        Modelica.Blocks.Sources.TimeTable Pe_CHP(table=PeCHP)
          annotation (Placement(transformation(extent={{-690,-306},{-670,-286}})));
        DistrictHeatingNetwork.Sources.PumpInput P501_input(
          useOmega=false,
          omega=P501omega,
          q_m3h=P501qm3h)
          annotation (Placement(transformation(extent={{-576,-161},{-596,-140}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P1(
          Tin_start(displayUnit="K") = Tout_User_start_S5,
          Tout_start(displayUnit="K") = Tout_User_start_S5,
          a=DistrictHeatingNetwork.Data.PumpData.P501.a,
          b=DistrictHeatingNetwork.Data.PumpData.P501.b,
          m_flow_start=m_flow_User_S5,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=90,
              origin={-582,-297})));

        DistrictHeatingNetwork.Sources.PumpInput PCHP_input(
          useOmega=false,
          omega=Pchpomega,
          q_m3h=Pchpqm3h)
          annotation (Placement(transformation(extent={{-548,-311},{-568,-290}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV1(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
          rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
          q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
          Tin_start(displayUnit="K") = Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-582,-270})));

        Modelica.Blocks.Sources.TimeTable FCVchp_theta(table=FCVchptheta)
          annotation (Placement(transformation(extent={{-548,-280},{-568,-260}})));
        DistrictHeatingNetwork.Sources.SinkPressure sinkCHP(
          T0(displayUnit="K") = 15 + 273.15,
          p0=210000,
          R=0) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-685,-269})));
      equation
        connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
            points={{-652,-233},{-652,-203.5},{-651.6,-203.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
            points={{-652,-233},{-652,-225.25},{-651.5,-225.25},{-651.5,-219.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
            points={{-612,-233},{-612,-225.25},{-611.8,-225.25},{-611.8,-219}},
            color={140,56,54},
            thickness=0.5));
        connect(TT504.inlet,E501. inhot) annotation (Line(
            points={{-611.8,-219},{-611.8,-218.25},{-612.4,-218.25},{-612.4,-203.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
            Line(
            points={{-612,-57},{-612,-46}},
            color={140,56,54},
            thickness=0.5));
        connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
            Line(
            points={{-652,-46},{-652,-57}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
            points={{-612,-77},{-612,-82.25},{-611.7,-82.25},{-611.7,-85.5}},
            color={140,56,54},
            thickness=0.5));
        connect(PT502.inlet,TT502. inlet) annotation (Line(
            points={{-611.7,-85.5},{-611.7,-116.5}},
            color={140,56,54},
            thickness=0.5));
        connect(TT502.inlet,P501. outlet) annotation (Line(
            points={{-611.7,-116.5},{-611.7,-100.95},{-612,-100.95},{-612,-135.4}},
            color={140,56,54},
            thickness=0.5));
        connect(FT501.outlet,E501. incold) annotation (Line(
            points={{-652.2,-159.2},{-652.2,-172.85},{-651.6,-172.85},{-651.6,-186.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
            points={{-652,-77},{-652,-81.75},{-652.3,-81.75},{-652.3,-86.5}},
            color={140,56,54},
            thickness=0.5));
        connect(PT501.inlet,TT501. inlet) annotation (Line(
            points={{-652.3,-86.5},{-652.3,-105.5}},
            color={140,56,54},
            thickness=0.5));
        connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
            points={{-652.2,-150.8},{-652.2,-143.9},{-652,-143.9},{-652,-137}},
            color={140,56,54},
            thickness=0.5));
        connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
            points={{-652.3,-105.5},{-652.3,-111.25},{-652,-111.25},{-652,-117}},
            color={140,56,54},
            thickness=0.5));
        connect(P501.inlet,E501. outcold) annotation (Line(
            points={{-612,-154.6},{-612,-165.55},{-612.4,-165.55},{-612.4,-186.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold.outlet,CHP. inlet) annotation (Line(
            points={{-652,-253},{-652,-284},{-660,-284},{-660,-313},{-652,-313}},
            color={140,56,54},
            thickness=0.5));
        connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
            Line(
            points={{-652,-26},{-652,-10},{-492,-10},{-492,5.25},{-470,5.25}},
            color={140,56,54},
            thickness=0.5));
        connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
            points={{-612,-26},{-612,-18},{-482,-18},{-482,45},{-500,45}},
            color={140,56,54},
            thickness=0.5));
        connect(Pe_CHP.y, CHP.PelectricRef) annotation (Line(points={{-669,-296},{-660.5,
                -296},{-660.5,-296.2},{-652,-296.2}}, color={0,0,127}));
        connect(P501_input.y,P501.in_m_flow)  annotation (Line(points={{-597,-150.5},{
                -606.48,-150.5},{-606.48,-149.8}}, color={0,0,127}));
        connect(P1.in_m_flow, PCHP_input.y) annotation (Line(points={{-576.48,-301.8},
                {-574.74,-301.8},{-574.74,-300.5},{-569,-300.5}}, color={0,0,127}));
        connect(P1.outlet, FCV1.inlet) annotation (Line(
            points={{-582,-287.4},{-582,-280}},
            color={140,56,54},
            thickness=0.5));
        connect(CHP.outlet, P1.inlet) annotation (Line(
            points={{-610,-313},{-596,-313},{-596,-314},{-582,-314},{-582,-306.6}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV1.outlet, S5_PL_CHP_EX501_hot.inlet) annotation (Line(
            points={{-582,-260},{-582,-258},{-612,-258},{-612,-253}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV1.opening, FCVchp_theta.y)
          annotation (Line(points={{-574,-270},{-569,-270}}, color={0,0,127}));
        connect(sinkCHP.inlet, CHP.inlet) annotation (Line(
            points={{-675,-269},{-652,-269},{-652,-284},{-660,-284},{-660,-313},{-652,
                -313}},
            color={140,56,54},
            thickness=0.5));
      end CentralisedSystemI_E;

      model CentralisedSystemI_F
        extends CentralisedSystemI_B;

        // S500

        // General Pipeline Data
        parameter DistrictHeatingNetwork.Types.Length Di_S5=39e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S5=1.5e-3;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5=
            q_m3h_S5_Source*990/3600;
        parameter Real q_m3h_S5_Source = 4;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5=
            q_m3h_S5_User*990/3600;
        parameter Real q_m3h_S5_User = 6;

        parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real P501qm3h[:,:] = [0, 8; 100, 8];

        parameter Real Pchpomega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real Pchpqm3h[:,:] = [0, 3.94; 100, 3.94];

        parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5=2e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5=1.9e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5=80 +
            273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5=70 +
            273.15;

        parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5=1.69e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5=2.5e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5=70 +
            273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5=75 +
            273.15;

        parameter DistrictHeatingNetwork.Types.Power PeCHP[:,:]=[0,30e3; 100,30e3];
        parameter Real FCVchptheta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

        DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
          Di_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold,
          Di_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot,
          L_cold=DistrictHeatingNetwork.Data.BPHEData.E501.L_cold,
          L_hot=DistrictHeatingNetwork.Data.BPHEData.E501.L_hot,
          MWall=DistrictHeatingNetwork.Data.BPHEData.E501.MWall,
          Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold,
          Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot,
          Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold,
          Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot,
          Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold,
          Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot,
          cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold,
          cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot,
          t_cold=DistrictHeatingNetwork.Data.BPHEData.E501.t_cold,
          t_hot=DistrictHeatingNetwork.Data.BPHEData.E501.t_hot,
          gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold,
          gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot,
          h_cold=DistrictHeatingNetwork.Data.BPHEData.E501.h_cold,
          h_hot=DistrictHeatingNetwork.Data.BPHEData.E501.h_hot,
          hctype_cold=hctype,
          hctype_hot=hctype,
          hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold,
          hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot,
          k_cold=DistrictHeatingNetwork.Data.BPHEData.E501.k_cold,
          k_hot=DistrictHeatingNetwork.Data.BPHEData.E501.k_hot,
          kc_cold=1,
          kc_hot=1,
          lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold,
          lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot,
          m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold,
          m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot,
          n=5,
          nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold,
          nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot,
          nPlates=DistrictHeatingNetwork.Data.BPHEData.E501.nPlates,
          pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold,
          pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot,
          pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold,
          pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot,
          rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold +
              DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2,
          rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot +
              DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2,
          rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold,
          rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot,
          thermalInertia=false,
          u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold,
          u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
            Placement(visible=true, transformation(
              origin={-636,-189},
              extent={{-17,-28.0002},{17,28.0001}},
              rotation=-90)));

        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(
          Tin_start(displayUnit="K") = Tout_User_start_S5,
          Tout_start(displayUnit="K") = Tout_User_start_S5,
          a=DistrictHeatingNetwork.Data.PumpData.P501.a,
          b=DistrictHeatingNetwork.Data.PumpData.P501.b,
          m_flow_start=m_flow_User_S5,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-14,14},{14,-14}},
              rotation=90,
              origin={-616,-142})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_Source,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-656,-237})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.04e5,
          Tin_start=Tout_User_start_S5,
          Tout_start=Tout_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_Source,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-616,-237})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-7.5,-7.5},{7.5,7.5}},
              rotation=90,
              origin={-658.5,-213.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-7,-7},{7,7}},
              rotation=-90,
              origin={-613,-213})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.04e5,
          Tin_start=Tout_User_start_S5,
          Tout_start=Tout_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-616,-61})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=51e-3,
            D_o=Di_S5) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-616,-30})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-656,-61})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=51e-3,
            D_o=Di_S5) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-656,-30})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
            Placement(transformation(
              extent={{-5.5,5.5},{5.5,-5.5}},
              rotation=90,
              origin={-613.5,-79.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start=
              Tout_User_start_S5) annotation (Placement(transformation(
              extent={{-5.5,5.5},{5.5,-5.5}},
              rotation=90,
              origin={-613.5,-110.5})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{7,-7},{-7,7}},
              rotation=90,
              origin={-659,-149})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
            Placement(transformation(
              extent={{-5.5,-5.5},{5.5,5.5}},
              rotation=90,
              origin={-658.5,-80.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start=
              Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
              transformation(
              extent={{-5.5,-5.5},{5.5,5.5}},
              rotation=90,
              origin={-658.5,-99.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(
          L=5,
          t=t_S5,
          pin_start=pin_User_start_S5 - 0.02e5,
          Tin_start=Tin_User_start_S5,
          Tout_start=Tin_User_start_S5,
          Di=Di_S5,
          q_m3h_start=q_m3h_S5_User,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-656,-121})));
        Modelica.Blocks.Sources.TimeTable Pe_CHP(table=PeCHP)
          annotation (Placement(transformation(extent={{-700,-370},{-680,-350}})));
        DistrictHeatingNetwork.Sources.PumpInput P501_input(
          useOmega=false,
          omega=P501omega,
          q_m3h=P501qm3h)
          annotation (Placement(transformation(extent={{-580,-159},{-600,-138}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P1(
          Tin_start(displayUnit="K") = Tout_User_start_S5,
          Tout_start(displayUnit="K") = Tout_User_start_S5,
          a=DistrictHeatingNetwork.Data.PumpData.P501.a,
          b=DistrictHeatingNetwork.Data.PumpData.P501.b,
          m_flow_start=m_flow_User_S5,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
          use_q_m3hr=true) annotation (Placement(transformation(
              extent={{-12.5,12},{12.5,-12}},
              rotation=90,
              origin={-616,-291.5})));

        DistrictHeatingNetwork.Sources.PumpInput PCHP_input(
          useOmega=false,
          omega=Pchpomega,
          q_m3h=Pchpqm3h)
          annotation (Placement(transformation(extent={{-580,-307},{-600,-286}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV1(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
          rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
          q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
          Tin_start(displayUnit="K") = Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-616,-264})));

        Modelica.Blocks.Sources.TimeTable FCVchp_theta(table=FCVchptheta)
          annotation (Placement(transformation(extent={{-580,-274},{-600,-254}})));
        DistrictHeatingNetwork.Sources.SinkPressure sinkCHP(
          T0(displayUnit="K") = 15 + 273.15,
          p0=210000,
          R=0) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-679,-281})));
        DistrictHeatingNetwork.Components.ThermalMachines.ControlledCHP CHP
          "Cogenerator"
          annotation (Placement(transformation(extent={{-670,-394},{-602,-326}})));
        Modelica.Blocks.Sources.BooleanTable CHP_Status(table={1000}, startValue=true)
          "Input to decide whether or nor the CHP is working"
          annotation (Placement(transformation(extent={{-572,-370},{-592,-350}})));
      equation
        connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
            points={{-656,-227},{-656,-197.5},{-655.6,-197.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
            points={{-656,-227},{-656,-219.25},{-655.5,-219.25},{-655.5,-213.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
            points={{-616,-227},{-616,-219.25},{-615.8,-219.25},{-615.8,-213}},
            color={140,56,54},
            thickness=0.5));
        connect(TT504.inlet,E501. inhot) annotation (Line(
            points={{-615.8,-213},{-615.8,-212.25},{-616.4,-212.25},{-616.4,-197.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
            Line(
            points={{-616,-51},{-616,-40}},
            color={140,56,54},
            thickness=0.5));
        connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
            Line(
            points={{-656,-40},{-656,-51}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
            points={{-616,-71},{-616,-76.25},{-615.7,-76.25},{-615.7,-79.5}},
            color={140,56,54},
            thickness=0.5));
        connect(PT502.inlet,TT502. inlet) annotation (Line(
            points={{-615.7,-79.5},{-615.7,-110.5}},
            color={140,56,54},
            thickness=0.5));
        connect(TT502.inlet,P501. outlet) annotation (Line(
            points={{-615.7,-110.5},{-615.7,-94.95},{-616,-94.95},{-616,-130.8}},
            color={140,56,54},
            thickness=0.5));
        connect(FT501.outlet,E501. incold) annotation (Line(
            points={{-656.2,-153.2},{-656.2,-166.85},{-655.6,-166.85},{-655.6,-180.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
            points={{-656,-71},{-656,-75.75},{-656.3,-75.75},{-656.3,-80.5}},
            color={140,56,54},
            thickness=0.5));
        connect(PT501.inlet,TT501. inlet) annotation (Line(
            points={{-656.3,-80.5},{-656.3,-99.5}},
            color={140,56,54},
            thickness=0.5));
        connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
            points={{-656.2,-144.8},{-656.2,-137.9},{-656,-137.9},{-656,-131}},
            color={140,56,54},
            thickness=0.5));
        connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
            points={{-656.3,-99.5},{-656.3,-105.25},{-656,-105.25},{-656,-111}},
            color={140,56,54},
            thickness=0.5));
        connect(P501.inlet,E501. outcold) annotation (Line(
            points={{-616,-153.2},{-616,-159.55},{-616.4,-159.55},{-616.4,-180.5}},
            color={140,56,54},
            thickness=0.5));
        connect(P501_input.y,P501.in_m_flow)  annotation (Line(points={{-601,-148.5},{
                -609.56,-148.5},{-609.56,-147.6}}, color={0,0,127}));
        connect(P1.in_m_flow,PCHP_input. y) annotation (Line(points={{-610.48,-296.5},
                {-601,-296.5}},                                   color={0,0,127}));
        connect(P1.outlet,FCV1. inlet) annotation (Line(
            points={{-616,-281.5},{-616,-274}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV1.outlet,S5_PL_CHP_EX501_hot. inlet) annotation (Line(
            points={{-616,-254},{-616,-247}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV1.opening,FCVchp_theta. y)
          annotation (Line(points={{-608,-264},{-601,-264}}, color={0,0,127}));
        connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
            Line(
            points={{-656,-20},{-658,-20},{-658,-10},{-492,-10},{-492,5.25},{-470,5.25}},
            color={140,56,54},
            thickness=0.5));

        connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
            points={{-616,-20},{-616,-14},{-484,-14},{-484,45},{-500,45}},
            color={140,56,54},
            thickness=0.5));
        connect(CHP.outlet, P1.inlet) annotation (Line(
            points={{-625.8,-332.8},{-625.8,-314},{-616,-314},{-616,-301.5}},
            color={140,56,54},
            thickness=0.5));
        connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (Line(
            points={{-656,-247},{-656,-314},{-646.2,-314},{-646.2,-332.8}},
            color={140,56,54},
            thickness=0.5));
        connect(Pe_CHP.y, CHP.Pelectric_in)
          annotation (Line(points={{-679,-360},{-663.2,-360}}, color={0,0,127}));
        connect(sinkCHP.inlet, CHP.inlet) annotation (Line(
            points={{-669,-281},{-656,-281},{-656,-314},{-646.2,-314},{-646.2,-332.8}},
            color={140,56,54},
            thickness=0.5));

        connect(CHP_Status.y, CHP.heat_on)
          annotation (Line(points={{-593,-360},{-608.8,-360}}, color={255,0,255}));
        annotation (experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemI_F;

      model CentralisedSystemLoadSimplifiedI_A "Sequence using Gas Boiler as heat source only"
        extends
          MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemLoadSimplifiedI(
          FV933_state=false,
          FCVC01theta=[0,0; 100,0],
          FCVC02theta=[0,1; 100,1],
          FCV901theta=[0,1; 100,1],
          P901omega = [0,2*pi*30; 100,2*pi*30],
          P101omega = [0, 2*pi*30; 100, 2*pi*30; 100, 2*pi*30; 200, 2*pi*30],
          FCV101theta=[0,1; 100,1],
          q_m3h_S9=10,
          P101qm3h=[0,10; 100,10],
          q_m3h_S1=10,
          FCV701theta=[0,1; 100,1],
          FCV711theta=[0,1; 100,1],
          FCV721theta=[0,1; 100,1],
          FCV731theta=[0,1; 100,1],
          TCV701theta=[0,1; 100,1],
          TCV711theta=[0,1; 100,1],
          TCV721theta=[0,1; 100,1],
          TCV731theta=[0,1; 100,1],
          FCVR01theta=[0,0.2; 100,0.2],
          PR01omega=[0,2*Modelica.Constants.pi*50; 100,2*Modelica.Constants.pi*50],
          ToutcoolSP=[0,15; 100,15],
          GB101(h=1.2*0.93, Pmaxnom=147.6e3*0.8));

        Modelica.Blocks.Sources.TimeTable FCV901_theta(table=FCV901theta)
          annotation (Placement(transformation(extent={{-714,93},{-734,113}})));
        DistrictHeatingNetwork.Sources.PumpInput P901_input(
          useOmega=true,
          omega=P901omega,
          q_m3h=P901qm3h)
          annotation (Placement(transformation(extent={{-714,54},{-734,75}})));
        Modelica.Blocks.Sources.TimeTable FCVC01_theta(table=FCVC01theta)
          annotation (Placement(transformation(extent={{300,289},{280,309}})));
        Modelica.Blocks.Sources.TimeTable FCVC02_theta(table=FCVC02theta)
          annotation (Placement(transformation(extent={{740,289},{720,309}})));
        Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=FV933_state)
          annotation (Placement(transformation(extent={{-185,55},{-205,75}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table=FCV101theta)
          annotation (Placement(transformation(extent={{-200,-140},{-220,-120}})));
        DistrictHeatingNetwork.Sources.PumpInput P101_input(
          omega=P101omega,
          q_m3h=P101qm3h)
          annotation (Placement(transformation(extent={{-200,-191},{-220,-170}})));
        Modelica.Blocks.Sources.TimeTable FCV701_theta(table=FCV701theta)
          annotation (Placement(transformation(extent={{179,-160},{159,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV711_theta(table=FCV711theta)
          annotation (Placement(transformation(extent={{499,-160},{479,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV731_theta(table=FCV731theta)
          annotation (Placement(transformation(extent={{340,-160},{320,-140}})));
        Modelica.Blocks.Sources.TimeTable FCV721_theta(table=FCV721theta)
          annotation (Placement(transformation(extent={{661,-160},{641,-140}})));
        Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table=GB101_ToutSP)
          annotation (Placement(transformation(extent={{-318,-310},{-298,-290}})));
        Modelica.Blocks.Sources.TimeTable FT723_mflow(table=EX721q_m3h_cold*1000/3600)
          annotation (Placement(transformation(extent={{530,-340},{550,-320}})));
        Modelica.Blocks.Sources.TimeTable FT713_mflow(table=EX711q_m3h_cold*1000/3600)
          annotation (Placement(transformation(extent={{370,-340},{390,-320}})));
        Modelica.Blocks.Sources.TimeTable FT733_mflow(table=EX731q_m3h_cold*1000/3600)
          annotation (Placement(transformation(extent={{210,-340},{230,-320}})));
        Modelica.Blocks.Sources.TimeTable FT703_mflow(table=EX701q_m3h_cold*1000/3600)
          annotation (Placement(transformation(extent={{50,-340},{70,-320}})));
        Modelica.Blocks.Sources.TimeTable TT703_SP(table=EX701_TinCold)
          annotation (Placement(transformation(extent={{192,-280},{172,-260}})));
        Modelica.Blocks.Sources.TimeTable TT733_SP(table=EX731_TinCold)
          annotation (Placement(transformation(extent={{348,-280},{328,-260}})));
        Modelica.Blocks.Sources.TimeTable TT723_SP(table=EX721_TinCold)
          annotation (Placement(transformation(extent={{672,-280},{652,-260}})));
        Modelica.Blocks.Sources.TimeTable TT713_SP(table=EX711_TinCold)
          annotation (Placement(transformation(extent={{512,-280},{492,-260}})));
        Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e8}, startValue=true)
          "Input to decide whether or nor the gas boiler is working"
          annotation (Placement(transformation(extent={{-318,-344},{-298,-324}})));
      equation
        connect(FCV901_theta.y, FCV901.opening)
          annotation (Line(points={{-735,103},{-742,103},{-742,115},{-749,115}},
                                                           color={0,0,127}));
        connect(P901_input.y, P901.in_omega) annotation (Line(points={{-735,64.5},{-743.5,
                64.5},{-743.5,66.3},{-747.25,66.3}},
                                              color={0,0,127}));
        connect(FCVC01_theta.y, FCVC01.opening) annotation (Line(points={{279,299},{268,
                299},{268,235},{258,235}}, color={0,0,127}));
        connect(FCVC02_theta.y, FCVC02.opening) annotation (Line(points={{719,299},{710,
                299},{710,234},{698,234},{698,235}}, color={0,0,127}));
        connect(FV933_OnOff.y, FV933.u)
          annotation (Line(points={{-206,65},{-218,65},{-218,46.6}},
                                                           color={255,0,255}));
        connect(FCV101_theta.y, FCV101.opening)
          annotation (Line(points={{-221,-130},{-226,-130},{-226,-110},{-232,-110}},
                                                             color={0,0,127}));
        connect(FCV701_theta.y, FCV701.opening)
          annotation (Line(points={{158,-150},{148,-150}}, color={0,0,127}));
        connect(FCV711_theta.y, FCV711.opening)
          annotation (Line(points={{478,-150},{468,-150}}, color={0,0,127}));
        connect(FCV731_theta.y, FCV731.opening)
          annotation (Line(points={{319,-150},{308,-150}}, color={0,0,127}));
        connect(FCV721_theta.y, FCV721.opening)
          annotation (Line(points={{640,-150},{628,-150}}, color={0,0,127}));
        connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (Line(points={{-297,-300},
                {-297,-301},{-285,-301}}, color={0,0,127}));
        connect(FT723_mflow.y, FT723.in_m_flow)
          annotation (Line(points={{551,-330},{566,-330},{566,-305}}, color={0,0,127}));
        connect(FT713_mflow.y, FT713.in_m_flow)
          annotation (Line(points={{391,-330},{400,-330},{400,-305}}, color={0,0,127}));
        connect(FT733_mflow.y, FT733.in_m_flow)
          annotation (Line(points={{231,-330},{238,-330},{238,-305}}, color={0,0,127}));
        connect(FT703_mflow.y, FT703.in_m_flow)
          annotation (Line(points={{71,-330},{80,-330},{80,-305}}, color={0,0,127}));
        connect(TT703_SP.y, VER3.in_T0)
          annotation (Line(points={{171,-270},{159,-270},{159,-290.6}}, color={0,0,127}));
        connect(TT733_SP.y, VER2.in_T0)
          annotation (Line(points={{327,-270},{319,-270},{319,-290.6}}, color={0,0,127}));
        connect(TT723_SP.y, VER901.in_T0)
          annotation (Line(points={{651,-270},{641,-270},{641,-288.6}}, color={0,0,127}));
        connect(TT713_SP.y, VER1.in_T0)
          annotation (Line(points={{491,-270},{479,-270},{479,-290.6}}, color={0,0,127}));
        connect(P101_input.y, P101.in_omega)
          annotation (Line(points={{-221,-180.5},{-234,-180.5},{-234,-179.8}}, color={0,0,127}));
        connect(GB101_Status.y, GB101.heat_on)
          annotation (Line(points={{-297,-334},{-294,-334},{-294,-322},{-285,-322}}, color={255,0,255}));
      end CentralisedSystemLoadSimplifiedI_A;

      model CentralisedSystemLoadSimplifiedI_B
        extends CentralisedSystemLoadSimplifiedI_A(
          VER901(T0=15 + 273.15),
          FV933_state=false,
          P901omega=[0,2*pi*30; 500,2*pi*30],
          P101omega=[0,2*pi*30; 1000,2*pi*30],
          pin_start_rCD_cold=1.66e5,
          VE901(p0(displayUnit="Pa") = 166000),
          P101qm3h=[0,14; 100,14],
          T_start_cold=72 + 273.15,
          T_start_hot=80 + 273.15,
          Tin_start_S1=72 + 273.15,
          Tout_start_S1=80 + 273.15,
          FCV101theta=[0,1; 100,1],
          FCVC01theta=[0,0; 100,0],
          FCVC02theta=[0,0; 100,0],
          FCV701theta=[0,1; 100,1],
          FCV711theta=[0,1; 100,1],
          FCV721theta=[0,1; 100,1],
          FCV731theta=[0,1; 100,1],
          FCVR01theta=[0,0.2; 8000,0.2; 8000,0.5; 10000,0.5],
          EX701_TinCold=[0,22 + 273.15; 100,22 + 273.15],
          EX711_TinCold=[0,22 + 273.15; 100,22 + 273.15],
          EX721_TinCold=[0,22 + 273.15; 100,22 + 273.15],
          EX731_TinCold=[0,22 + 273.15; 100,22 + 273.15],
          EX701q_m3h_cold=[0,4.2; 100,4.2],
          EX711q_m3h_cold=[0,4.2; 100,4.2],
          EX721q_m3h_cold=[0,4.2; 100,4.2],
          EX731q_m3h_cold=[0,4.2; 100,4.2],
          GB101(Pmaxnom=147.6e3*0.8),
          ToutcoolSP=[0,25.5; 500,25.5; 500,12; 1000,12],
          EX701(Tin_start_hot=T_start_hot),
          EX731(Tin_start_hot=T_start_hot),
          FCV901(Kv=20));

        // System 400
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=72 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=80 + 273.15;

        parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;

        parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

        parameter Real q_m3h_S4 = 5;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

        parameter Real P401omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30; 100, 2*3.141592654*30; 200, 2*3.141592654*30];
        parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
        parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
        parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
        parameter Boolean FV401_state = true;
        parameter Boolean FV402_state = true;
        parameter Boolean FV401_startValue = true;
        parameter Boolean FV402_startValue = true;
        parameter Real FV401_s[:] = {5e6};
        parameter Real FV402_s[:] = {5e6};

        DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
          Tout_start=Tout_start_S4,
          D=0.4,
          Pmaxnom=50e3,
          Pnimnom=10e3,
          Pnom=50e3,
          Tin_start=Tin_start_S4,
          etanom=0.98,
          h=1.25,
          m_flow_nom=m_flow_S4,
          pin_start=pin_start_S4,
          pout_start=160000,
          nR=5) annotation (Placement(visible=true, transformation(
              origin={-342,-302},
              extent={{-34,-34},{34,34}},
              rotation=0)));
        DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(
          Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start,
          Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start,
          a=DistrictHeatingNetwork.Data.PumpData.P401.a,
          b=DistrictHeatingNetwork.Data.PumpData.P401.b,
          m_flow_start=m_flow_S4,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P401.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P401.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P401.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P401.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P401.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P401.omeganom,
          pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start,
          pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
          headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
          use_in_omega=true)                                                      annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=90,
              origin={-322,-175})));

        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
          rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
          q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
          Tin_start(displayUnit="K") = Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-140})));

        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
          L=L_S4_PL3,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-236})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
          L=L_S4_PL2,
          t=t_S4,
          m_flow_start=m_flow_S4,
          pin_start=pin_start_S4,
          pout_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-238})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
          L=L_S4_PL3,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-112})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
              Tout_start_S4, p_start=pout_start_S4)
          "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-320,-74})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
          "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
              transformation(
              extent={{6,6},{-6,-6}},
              rotation=90,
              origin={-320,-86})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
          "Pressure sensor at the inlet of gas boiler" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=90,
              origin={-364,-118})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
              Tin_start_S4, p_start=pin_start_S4)
          "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=90,
              origin={-364,-106})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
            p_start=pin_start_S4) annotation (Placement(transformation(
              extent={{7,-7},{-7,7}},
              rotation=90,
              origin={-365,-195})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
          L=L_S4_PL1,
          t=t_S4,
          pin_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-166})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
          L=L_S4_rCD_hot,
          t=t_S4,
          pin_start=pout_start_S4,
          Tin_start=Tout_start_S4,
          Tout_start=Tout_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
          L=L_S4_rCD_cold,
          t=t_S4,
          pin_start=pin_start_S4,
          Tin_start=Tin_start_S4,
          Tout_start=Tin_start_S4,
          Di=Di_S4,
          q_m3h_start=q_m3h_S4,
          hctype=hctype,
          n=n) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-362,-54})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          Tin_start=Tin_start_S4,
          pin_start=pin_start_S4,
          q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=-90,
              origin={-362,-20})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
          Tin_start=Tout_start_S4,
          pin_start=pout_start_S4,
          q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-322,-20})));
        Modelica.Blocks.Sources.TimeTable FCV401_theta(table=FCV401theta)
          annotation (Placement(transformation(extent={{-288,-150},{-308,-130}})));
        DistrictHeatingNetwork.Sources.PumpInput P401_input(
          omega=P401omega,
          q_m3h=P401qm3h)
          annotation (Placement(transformation(extent={{-288,-191},{-308,-170}})));
        Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table=EB401_ToutSP)
          annotation (Placement(transformation(extent={{-408,-310},{-388,-290}})));
        Modelica.Blocks.Sources.BooleanTable FV401_Status(table=FV401_s,
                                                                       startValue=
              FV401_startValue) "Input for the status (open/close) of valve FV401"
          annotation (Placement(transformation(extent={{-394,-30},{-374,-10}})));
        Modelica.Blocks.Sources.BooleanTable FV402_Status(table=FV402_s,
                                                                       startValue=
              FV402_startValue) "Input for the status (open/close) of valve FV402"
          annotation (Placement(transformation(extent={{-290,-30},{-310,-10}})));
        Modelica.Blocks.Sources.BooleanTable EB401_Status(table={1e8}, startValue=true)
          "Input to decide whether or nor the electric boiler is working"
          annotation (Placement(transformation(extent={{-408,-342},{-388,-322}})));
      equation
        connect(P401.inlet,PL3_S401. outlet) annotation (Line(
            points={{-322,-184.6},{-322,-226}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV401.inlet,P401. outlet) annotation (Line(
            points={{-322,-150},{-322,-165.4}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402.inlet,PT402. inlet) annotation (Line(
            points={{-322.4,-74},{-322.4,-86}},
            color={140,56,54},
            thickness=0.5));
        connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
            points={{-322,-122},{-322,-130}},
            color={140,56,54},
            thickness=0.5));
        connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
            points={{-322.4,-86},{-322.4,-95},{-322,-95},{-322,-102}},
            color={140,56,54},
            thickness=0.5));
        connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
            points={{-362.2,-199.2},{-362.2,-207.6},{-362,-207.6},{-362,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
            points={{-362,-176},{-362,-183.4},{-362.2,-183.4},{-362.2,-190.8}},
            color={140,56,54},
            thickness=0.5));
        connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
            points={{-362,-156},{-362,-118},{-361.6,-118}},
            color={140,56,54},
            thickness=0.5));
        connect(PT401.inlet,TT401. inlet) annotation (Line(
            points={{-361.6,-118},{-361.6,-106}},
            color={140,56,54},
            thickness=0.5));
        connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
            points={{-362,-248},{-362,-258},{-352.2,-258},{-352.2,-274.8}},
            color={140,56,54},
            thickness=0.5));
        connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
            points={{-331.8,-274.8},{-331.8,-258},{-322,-258},{-322,-246}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
            points={{-322.4,-74},{-322,-74},{-322,-62}},
            color={140,56,54},
            thickness=0.5));
        connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
            points={{-361.6,-106},{-362,-106},{-362,-64}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
            points={{-362,-44},{-362,-30}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
            points={{-322,-42},{-322,-30}},
            color={140,56,54},
            thickness=0.5));
        connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
            points={{-362,-10},{-362,5.25},{-408.5,5.25}},
            color={140,56,54},
            thickness=0.5));
        connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
            points={{-322,-10},{-322,45},{-338,45}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV401_theta.y, FCV401.opening)
          annotation (Line(points={{-309,-140},{-314,-140}}, color={0,0,127}));
        connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (Line(points={{-387,-300},
                {-387,-302},{-369.2,-302}}, color={0,0,127}));
        connect(FV401_Status.y, FV401.u)
          annotation (Line(points={{-373,-20},{-365.2,-20}}, color={255,0,255}));
        connect(FV402_Status.y, FV402.u)
          annotation (Line(points={{-311,-20},{-318.8,-20}}, color={255,0,255}));
        connect(P401_input.y, P401.in_omega) annotation (Line(points={{-309,-180.5},{-312.5,-180.5},{-312.5,
                -179.8},{-316,-179.8}}, color={0,0,127}));
        connect(EB401_Status.y, EB401.heat_on) annotation (Line(points={{-387,-332},{-380,-332},{-380,
                -322.4},{-369.2,-322.4}}, color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemLoadSimplifiedI_B;

      model CentralisedSystemLoadSimplifiedI_D "Gas Boiler, Electric Boiler & Water Tanks"
        extends CentralisedSystemLoadSimplifiedI_B(
          P901omega=[0,2*pi*30; 500,2*pi*30],
          P101omega=[0,2*pi*40; 500,2*pi*40],
          P401omega=[0,2*pi*35; 500,2*pi*35],
          q_m3h_S9 = 15,
          EB401_ToutSP = [0, 80+273.15; 4000, 80+273.15; 4000, 90+273.15; 1e6, 90+273.15],
          GB101_ToutSP = [0, 80+273.15; 4000, 80+273.15; 4000, 90+273.15; 1e6, 90+273.15]);
        // System S200
        // Unloading
      //   parameter Boolean FV201_state = true;
      //   parameter Boolean FV202_state = true;
      //   parameter Boolean FV203_state = true;
      //   parameter Boolean FV204_state = true;
      //   parameter Boolean FV205_state = true;
      //   parameter Boolean FV206_state = false;
      //   parameter Boolean FV207_state = false;
      //   parameter Boolean FV208_state = true;
      //   parameter Boolean FV209_state = true;

        // Loading
        parameter Boolean FV201_state = false;
        parameter Boolean FV202_state = true;
        parameter Boolean FV203_state = false;
        parameter Boolean FV204_state = true;
        parameter Boolean FV205_state = true;
        parameter Boolean FV206_state = true;
        parameter Boolean FV207_state = true;
        parameter Boolean FV208_state = true;
        parameter Boolean FV209_state = false;

        parameter Boolean Load = true;
        final parameter Boolean Unload = not Load;
        parameter Real Load2Unload = 4e5;

        parameter Integer nTank = 9 "Number of volumes in stratified tank";
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2=2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2=1.8e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump=1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump=3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank=
            pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank=
            pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2=80 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2=70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2=10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2=51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2=1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 4;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q=q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2=q*985;
        parameter Real P201omega[:,:] = [0, 2*pi*30; 4.2e5, 2*pi*30; 4.2e5, 2*pi*45; 1e6, 2*pi*45];
        parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

        parameter Real FCV201theta[:,:] = [0, 1; 4.1e5, 1; 4.1e5, 0.5; 1e6, 0.5];

        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0=24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1=1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2=1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3=2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4=1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6=2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7=2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8=3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9=21.5;

        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High=2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High=-2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201=1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201=0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201=2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201=0;

        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
          H=4,
          Tin_start=Tin_start_S2,
          Tout_start=Tout_start_S2,
          n=nTank,
          D=1.7,
          T_start(displayUnit="K") = 70 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2) "Stratified tank 1" annotation (Placement(transformation(extent={{-762,-480},{-818,-368}})));
        DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P201(
          pout_start(displayUnit="Pa") = 3e5,
          Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start,
          Tout_start=DistrictHeatingNetwork.Data.PumpData.P201.Tout_start,
          a=DistrictHeatingNetwork.Data.PumpData.P201.a,
          b=DistrictHeatingNetwork.Data.PumpData.P201.b,
          m_flow_start=m_flow_S2,
          dpnom=DistrictHeatingNetwork.Data.PumpData.P201.dpnom,
          etaelec=DistrictHeatingNetwork.Data.PumpData.P201.etaelec,
          etamech=DistrictHeatingNetwork.Data.PumpData.P201.etamech,
          etanom=DistrictHeatingNetwork.Data.PumpData.P201.etanom,
          hin_start=DistrictHeatingNetwork.Data.PumpData.P201.hin_start,
          m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom,
          omeganom=DistrictHeatingNetwork.Data.PumpData.P201.omeganom,
          pin_start(displayUnit="Pa") = 1.8400803e5,
          headnom=DistrictHeatingNetwork.Data.PumpData.P201.headnom,
          qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h,
          rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom,
          headmax=DistrictHeatingNetwork.Data.PumpData.P201.headnommax,
          headmin=DistrictHeatingNetwork.Data.PumpData.P201.headnommin,
          qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h,
          qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h,
          use_in_omega=true) annotation (Placement(transformation(
              extent={{-12,12},{12,-12}},
              rotation=-90,
              origin={-794,-212})));

        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
          H=4,
          Tin_start=Tin_start_S2,
          Tout_start=Tout_start_S2,
          n=nTank,
          D=1.7,
          T_start(displayUnit="K") = 70 + 273.15,
          pin_start=pin_start_S2_tank,
          m_flow_start=m_flow_S2/2) "Stratified tank 2" annotation (Placement(transformation(extent={{-700,-480},{-644,-368}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start=
              Tin_start_S2, p_start=pin_start_S2)
          "Temperature sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-4.75,-4.75},{4.75,4.75}},
              rotation=90,
              origin={-795.75,-70.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
          "Pressure sensor at the inlet of pump 201" annotation (Placement(
              transformation(
              extent={{-5,-5},{5,5}},
              rotation=90,
              origin={-796,-90.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-112})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-854,-202})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
          L=L_S2_PL3,
          t=L_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={-854,-172})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
          L=L_S2_PL2,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-244})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
          L=L_S2_PL4,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-854,-232})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start=
              Tout_start_S2, p_start=pout_start_S2)
          "Temperature sensor at the outlet of System 200" annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-752,-72})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202
          "Pressure sensor at the outlet of system S200" annotation (Placement(
              transformation(
              extent={{6,6},{-6,-6}},
              rotation=90,
              origin={-752,-142})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
          L=L_S2_PL9,
          t=t_S2,
          pin_start=pout_start_S2,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-754,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-714,-416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
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
              rotation=90,
              origin={-794,-52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
          L=L_S2_Tanks_High,
          h=h_S2_Tanks_High,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,10},{-10,-10}},
              rotation=90,
              origin={-748,-416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2/2) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-730,-444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
          L=L_S2_S201_S202,
          h=h_S2_S201_S202,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-730,-460})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
          L=L_S2_PL6,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-822,-494})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
          L=L_S2_D201_FT201,
          h=h_S2_D201_FT201,
          t=t_S2,
          pin_start=pout_start_S2_pump,
          Tin_start=Tout_start_S2,
          Tout_start=Tout_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=0,
              origin={-834,-444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
          L=L_S2_PL1,
          t=t_S2,
          pin_start=pin_start_S2,
          Tin_start=Tin_start_S2,
          Tout_start=Tin_start_S2,
          Di=Di_S2,
          q_m3h_start=q_m3h_S2,
          n=n,
          hctype=hctype) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={-794,-174})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=0,
              origin={-824,-132})));

        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k=FV202_state)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
              rotation=-90,
              origin={-824,-96})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-824,-106})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-794,-152})));

        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
          annotation (Placement(transformation(extent={{-838,-158},{-826,-146}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
          annotation (Placement(transformation(extent={{-810,-162},{-830,-142}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=180,
              origin={-774,-190})));

        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k=FV206_state)
          annotation (Placement(transformation(extent={{-6,6},{6,-6}},
              rotation=270,
              origin={-774,-146})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=-90,
              origin={-774,-160})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=-90,
              origin={-794,-272})));

        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k=FV209_state)
          annotation (Placement(transformation(extent={{-5.5,-6},{5.5,6}},
              rotation=0,
              origin={-834.5,-272})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-820,-272})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=0,
              origin={-774,-258})));

        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
          Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
          dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
          Tin_start(displayUnit="K") = Tout_start_S2,
          pin_start=pout_start_S2,
          q_m3h_start=q_m3h_S2) annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={-754,-222})));

        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
          annotation (Placement(transformation(extent={{-708,-228},{-719,-216}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-734,-222})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
              Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
            Placement(transformation(
              extent={{7,7},{-7,-7}},
              rotation=90,
              origin={-751,-283})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k=FV207_state)
          annotation (Placement(transformation(extent={{6,-6},{-6,6}},
              rotation=-90,
              origin={-774,-294})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-774,-280})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table=FCV201theta)
          annotation (Placement(transformation(extent={{-888,-212},{-868,-192}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(
          useOmega=true,
          omega=P201omega,
          q_m3h=P201qm3h)
          annotation (Placement(transformation(extent={{-828,-218},{-808,-198}})));
        Modelica.Blocks.Sources.BooleanTable Loading(table={Load2Unload},
                                                                  startValue=Load)
          "Input to decide whether or nor the gas boiler is working" annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-606,-150})));
        Modelica.Blocks.Logical.Not not3
          annotation (Placement(transformation(extent={{-638,-190},{-658,-170}})));
      equation
        connect(PT201.inlet,TT201. inlet) annotation (Line(
            points={{-794,-90.5},{-794,-81.625},{-793.85,-81.625},{-793.85,-70.75}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
            points={{-794,-102},{-794,-90.5}},
            color={140,56,54},
            thickness=0.5));
        connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
            points={{-794,-221.6},{-794,-234}},
            color={140,56,54},
            thickness=0.5));
        connect(TT202.inlet,PT202. inlet) annotation (Line(
            points={{-754.4,-72},{-754.4,-142}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
            points={{-754,-62},{-754,-72},{-754.4,-72}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
            points={{-794,-62},{-794,-73.375},{-793.85,-73.375},{-793.85,-70.75}},
            color={140,56,54},
            thickness=0.5));
        connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
            points={{-762,-389},{-748,-389},{-748,-406}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
            Line(
            points={{-720,-444},{-714,-444},{-714,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
            Line(
            points={{-740,-444},{-748,-444},{-748,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
            points={{-714,-406},{-714,-389},{-700,-389}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
            points={{-740,-460},{-756,-460},{-756,-459},{-762,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
            points={{-720,-460},{-716,-460},{-716,-459},{-700,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
            points={{-812,-494},{-748,-494},{-748,-459},{-762,-459}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
            points={{-854,-222},{-854,-212}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
            points={{-854,-192},{-854,-182}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
            points={{-794,-184},{-794,-202.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
            points={{-854,-162},{-854,-132},{-830,-132}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
            points={{-794,-122},{-794,-146}},
            color={140,56,54},
            thickness=0.5));
        connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
            points={{-794,-158},{-794,-164}},
            color={140,56,54},
            thickness=0.5));
        connect(FV202.outlet,FV201. inlet) annotation (Line(
            points={{-818,-132},{-794,-132},{-794,-146}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.outlet,P201. inlet) annotation (Line(
            points={{-780,-190},{-794,-190},{-794,-202.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
            points={{-794,-254},{-794,-266}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.inlet,FV209. inlet) annotation (Line(
            points={{-780,-258},{-794,-258},{-794,-266}},
            color={140,56,54},
            thickness=0.5));
        connect(FV207.outlet,FV203. inlet) annotation (Line(
            points={{-768,-258},{-754,-258},{-754,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(FV206.inlet,FV203. outlet) annotation (Line(
            points={{-768,-190},{-754,-190},{-754,-216}},
            color={140,56,54},
            thickness=0.5));
        connect(PT202.inlet,FV203. outlet) annotation (Line(
            points={{-754.4,-142},{-754,-142},{-754,-216}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV201_theta.y,FCV201. opening) annotation (Line(points={{-867,-202},
                {-862,-202}},                                color={0,0,127}));
        connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
            Line(
            points={{-854,-242},{-854,-494},{-832,-494}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
            points={{-824,-444},{-748,-444},{-748,-426}},
            color={140,56,54},
            thickness=0.5));
        connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
            points={{-794,-278},{-794,-334},{-854,-334},{-854,-494},{-832,-494}},
            color={140,56,54},
            thickness=0.5));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
            points={{-794,-42},{-796,-42},{-796,-8},{-708,-8},{-708,5.25},{-668,5.25}},
            color={140,56,54},
            thickness=0.5));

        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
            points={{-754,-42},{-754,-14},{-700,-14},{-700,44.75},{-727,44.75}},
            color={140,56,54},
            thickness=0.5));
        connect(P201_input.y, P201.in_omega) annotation (Line(points={{-807,-208},{-806.5,-208},{-806.5,-207.2},
                {-800,-207.2}}, color={0,0,127}));
        connect(PL_S200_D201_FT201.inlet, FT201.outlet) annotation (Line(
            points={{-844,-444},{-848,-444},{-848,-344},{-753.8,-344},{-753.8,-287.2}},
            color={140,56,54},
            thickness=0.5));
        connect(FT201.inlet, FV203.inlet) annotation (Line(
            points={{-753.8,-278.8},{-754,-258},{-754,-228}},
            color={140,56,54},
            thickness=0.5));
        connect(Loading.y, not3.u)
          annotation (Line(points={{-617,-150},{-630,-150},{-630,-180},{-636,-180}}, color={255,0,255}));
        connect(Loading.y, FV206.u) annotation (Line(points={{-617,-150},{-724,-150},{-724,-180},{-774,-180},
                {-774,-188.08}}, color={255,0,255}));
        connect(Loading.y, FV207.u) annotation (Line(points={{-617,-150},{-724,-150},{-724,-264},{-774,-264},
                {-774,-259.92}}, color={255,0,255}));
        connect(FV206_Status.activePort, FV206.u)
          annotation (Line(points={{-774,-171.5},{-774,-188.08}}, color={255,0,255}));
        connect(FV207_Status.activePort, FV207.u)
          annotation (Line(points={{-774,-268.5},{-774,-259.92}}, color={255,0,255}));
        connect(not3.y, FV201.u) annotation (Line(points={{-659,-180},{-676,-180},{-676,-160},{-802,-160},
                {-802,-152},{-795.92,-152}}, color={255,0,255}));
        connect(not3.y, FV203.u) annotation (Line(points={{-659,-180},{-676,-180},{-676,-200},{-748,-200},
                {-748,-222},{-752.08,-222}}, color={255,0,255}));
        connect(FV203_Status.activePort, FV203.u)
          annotation (Line(points={{-745.5,-222},{-752.08,-222}}, color={255,0,255}));
        connect(FV201_Status.activePort, FV201.u)
          annotation (Line(points={{-808.5,-152},{-795.92,-152}}, color={255,0,255}));
        connect(not3.y, FV209.u) annotation (Line(points={{-659,-180},{-676,-180},{-676,-284},{-802,-284},
                {-802,-272},{-795.92,-272}}, color={255,0,255}));
        connect(FV209_Status.activePort, FV209.u)
          annotation (Line(points={{-808.5,-272},{-795.92,-272}}, color={255,0,255}));
        connect(not3.y, FV202.u) annotation (Line(points={{-659,-180},{-676,-180},{-676,-126},{-824,-126},
                {-824,-130.08}}, color={255,0,255}));
        connect(FV202_Status.activePort, FV202.u)
          annotation (Line(points={{-824,-117.5},{-824,-130.08}}, color={255,0,255}));
        annotation (experiment(StopTime=800000, __Dymola_Algorithm="Dassl"));
      end CentralisedSystemLoadSimplifiedI_D;
    end Centralised;
  end Networks;
end Tests;
