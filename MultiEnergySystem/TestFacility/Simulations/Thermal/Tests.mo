within MultiEnergySystem.TestFacility.Simulations.Thermal;
package Tests
  extends Modelica.Icons.ExamplesPackage;
  package Systems
    extends DistrictHeatingNetwork.Icons.Generic.Systems;

    package S100 "Set of validation tests of  gas boiler system"
      extends Modelica.Icons.ExamplesPackage;
      model TestBase
        extends Modelica.Icons.Example;
        replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
        parameter Integer n = 3;
        parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
        parameter Real pumpcorrectionfactor = 1;
        parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";

        // Temperatures and pressures
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = PTi[1, 1];
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = PTo[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = TTi[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = TTo[1, 1];

        // Pipe Data
        //parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
        //parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
        //parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
        parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
        //parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
        parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0; //0.7 + 0.95;
        parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 2;
        parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 2*0;

      //   parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 0.66+0.25+0.54+0.5+1.3+1+3+4+0.5+0.2+0.3 "12.25";
      //   parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
      //   parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 1 + 3 + 3.2 + 1.1 + 1.2 + 0.5 + 0.25 + 0.6;
      //   parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6;

        parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;

        parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient";

        parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;

        parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
        parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixPTi = "PT101" "Matrix name in file";
        parameter String matrixPTo = "PT102" "Matrix name in file";
        parameter String matrixTTi = "TT101" "Matrix name in file";
        parameter String matrixTTo = "TT102" "Matrix name in file";
        parameter String matrixtheta = "theta_FCV101" "Matrix name in file";
        parameter String matrixfreq = "f_P101";
        parameter String matrixFT = "FT101" "Matrix name in file";
        parameter String timenoscale = "time" "Matrix name in file";
        parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";

        Plants.Thermal.Systems.GasBoiler gasBoiler(
          pumpcorrectionfactor=pumpcorrectionfactor,
                                                   hctype=hctype,
          pin_start_S1=pin_start_S1,
          pout_start_S1=pout_start_S1,
          Tin_start_S1=Tin_start_S1,
          Tout_start_S1=Tout_start_S1,
          cf=cf,
          h_FT101_GB101=h_FT101_GB101,
          h_GB101_P101=h_GB101_P101,
          L_P101_FCV101=L_P101_FCV101,
          h_P101_FCV101=h_P101_FCV101,
          Kv=Kv,
          openingChar=openingChar)                                annotation (Placement(transformation(extent={{-30,-28},{26,28}})));
        DistrictHeatingNetwork.Sources.SourcePressure
                               source(
          use_in_p0=true,
          use_in_T0=true,
          p0=pin_start_S1,
          T0=Tin_start_S1,
          R=1e-3)
          annotation (Placement(transformation(extent={{-10,10},{10,-10}},
              rotation=-90,
              origin={-14,60})));
        DistrictHeatingNetwork.Sources.SinkPressure
                             sink(
          use_in_p0=true,
          p0=pout_start_S1,
          T0=Tout_start_S1,
          R=1e-3)           annotation (Placement(transformation(extent={{-10,10},{10,-10}},
              rotation=90,
              origin={64,88})));
        Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=[0,80 + 273.15; 100,80 + 273.15])
          annotation (Placement(transformation(extent={{-68,-12},{-56,0}})));
        Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e6}, startValue=true)
          "Input to decide whether or nor the gas boiler is working"
          annotation (Placement(transformation(extent={{-68,-30},{-56,-18}})));
        Modelica.Blocks.Sources.TimeTable TT101_profile(table=[ts,TTi])
          annotation (Placement(transformation(extent={{-46,48},{-34,60}})));
        Modelica.Blocks.Sources.TimeTable PT101_profile(table=[ts,PTi])
          annotation (Placement(transformation(extent={{-46,66},{-34,78}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table=[ts,thetav])
          annotation (Placement(transformation(extent={{-88,8},{-76,20}})));
        Modelica.Blocks.Sources.TimeTable P101_omega(table=[ts,omega])
          annotation (Placement(transformation(extent={{-88,26},{-76,38}})));
        Modelica.Blocks.Sources.TimeTable PT102_profile(table=[ts,PTo])
          annotation (Placement(transformation(extent={{92,78},{80,90}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref(table=[ts,m_flow_approx]) annotation (Placement(transformation(extent={{44,50},{56,62}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_m_flow annotation (Placement(transformation(extent={{66,26},{78,38}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex
                              valT annotation (Placement(transformation(extent={{66,12},{78,0}})));
        Modelica.Blocks.Sources.TimeTable Tout_ref(table=[ts,TTo]) annotation (Placement(transformation(extent={{42,-18},{54,-6}})));
        inner DistrictHeatingNetwork.System system annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        Modelica.Blocks.Continuous.FirstOrder lowPassomega(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=omega[1, 1])                             annotation (Placement(transformation(extent={{-68,26},{-56,38}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasstheta(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=thetav[1, 1])                            annotation (Placement(transformation(extent={{-68,8},{-56,20}})));


        DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
          redeclare model Medium = Medium,
          use_in_m_flow=true,
          pin_start=pout_start_S1,
          p0=pout_start_S1,
          T0=Tout_start_S1,
          m_flow0=m_flow_approx[1, 1],
          G=1e-8)                      annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={10,62})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (Placement(transformation(extent={{74,52},{86,64}})));
      protected
        final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
        final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
        final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
        final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
        final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
        final parameter Real TTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo, dim[1], dim[2]);
        final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
        final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
        final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
        final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
        final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
        final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1,1];
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1,1];
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1,1];
      equation
        connect(source.outlet, gasBoiler.inlet) annotation (Line(
            points={{-14,50},{-12.92,50},{-12.92,32.2}},
            color={140,56,54},
            thickness=0.5));
        connect(PT102_profile.y, sink.in_p0) annotation (Line(points={{79.4,84},{72.4,84}}, color={0,0,127}));
        connect(TT101_profile.y, source.in_T0) annotation (Line(points={{-33.4,54},{-30,54},{-30,56},{-22.4,56}}, color={0,0,127}));
        connect(PT101_profile.y, source.in_p0) annotation (Line(points={{-33.4,72},{-30,72},{-30,64},{-22.4,64}}, color={0,0,127}));
        connect(GB101_ToutSP.y, gasBoiler.Toutset) annotation (Line(points={{-55.4,-6},{-48,-6},{-48,8.4},{-32.8,8.4}}, color={0,0,127}));
        connect(GB101_Status.y, gasBoiler.status) annotation (Line(points={{-55.4,-24},{-44,-24},{-44,2.8},{-32.8,2.8}}, color={255,0,255}));
        connect(gasBoiler.m_flow_, val_m_flow.u_sim) annotation (Line(points={{28.8,19.6},{52,19.6},{52,29},{64.8,29}}, color={0,0,127}));
        connect(m_flow_ref.y, val_m_flow.u_meas) annotation (Line(points={{56.6,56},{60,56},{60,35},{64.8,35}}, color={0,0,127}));
        connect(Tout_ref.y, valT.u_meas) annotation (Line(points={{54.6,-12},{60,-12},{60,3},{64.8,3}}, color={0,0,127}));
        connect(gasBoiler.TTout, valT.u_sim) annotation (Line(points={{28.8,8.4},{52,8.4},{52,9},{64.8,9}}, color={0,0,127}));
        connect(P101_omega.y, lowPassomega.u) annotation (Line(points={{-75.4,32},{-69.2,32}}, color={0,0,127}));
        connect(lowPassomega.y, gasBoiler.omega) annotation (Line(points={{-55.4,32},{-48,32},{-48,19.6},{-32.8,19.6}}, color={0,0,127}));
        connect(FCV101_theta.y, lowPasstheta.u) annotation (Line(points={{-75.4,14},{-69.2,14}}, color={0,0,127}));
        connect(lowPasstheta.y, gasBoiler.theta) annotation (Line(points={{-55.4,14},{-32.8,14}}, color={0,0,127}));
        connect(sinkMassFlow.in_m_flow, val_m_flow.u_meas) annotation (Line(points={{15,56},{30,56},{30,40},{60,40},{60,35},{64.8,35}}, color={0,0,127}));
        connect(val_pout.u_meas, sink.in_p0) annotation (Line(points={{72.8,61},{68,61},{68,72},{78,72},{78,82},{76,84},{72.4,84}}, color={0,0,127}));
        connect(gasBoiler.PTout, val_pout.u_sim) annotation (Line(points={{28.8,-2.8},{38,-2.8},{38,44},{68,44},{68,55},{72.8,55}}, color={0,0,127}));
        connect(gasBoiler.outlet, sink.inlet) annotation (Line(
            points={{9.48,32.2},{9.48,44},{26,44},{26,70},{64,70},{64,78}},
            color={140,56,54},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
      end TestBase;

      model S100_Seq_0412Test2
        extends TestBase(Kv= 33, MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat"),
            gasBoiler(Pmaxnom=147.6e3*0.75, GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)));
        annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_0412Test2;

      model S100_Seq_0412Test3
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat"));
        annotation (experiment(StopTime=7200, __Dymola_Algorithm="Dassl"));
      end S100_Seq_0412Test3;

      model S100_Seq_2601Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2601_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=4500, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2601Test1;

      model S100_Seq_2901Test1
        extends TestBase(Kv = 33, MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2901_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2901Test1;

      model S100_Seq_3001Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1500, __Dymola_Algorithm="Dassl"));
      end S100_Seq_3001Test1;

      model S100_Seq_3001Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Temperatures.mat"));
        annotation (experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_3001Test2;

      model S100_Seq_3101Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3101_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=15000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_3101Test1;

      model S100_Seq_2703Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2703_Test1/Temperatures.mat"),
          GB101_Status(startValue=false));
        annotation (experiment(StopTime=1300, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2703Test1;

      model S100_Seq_2903Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2903_Test1/Temperatures.mat"),
            GB101_Status(startValue=false));
        annotation (experiment(StopTime=5200, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2903Test1;

      model S100_Seq_0304Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0304_Test1/Temperatures.mat"));
        annotation (experiment(
            StartTime=20,
            StopTime=3700,
            __Dymola_Algorithm="Dassl"));
      end S100_Seq_0304Test1;

      model S100_Seq_0804Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0804_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1750, __Dymola_Algorithm="Dassl"));
      end S100_Seq_0804Test1;

      model S100_Seq_1004Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/1004_Test1/Temperatures.mat"),
            GB101_Status(table={900,4.05e3,4.6e3}, startValue=false),
          gasBoiler(Pmaxnom=147.6e3*0.92, GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState), Tout_start_S1 = TTo[1,1]));
        annotation (experiment(StopTime=9000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1004Test1;

      model S100_Seq_1704Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/1704_Test1/Temperatures.mat"),
            gasBoiler(GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState)));
        annotation (experiment(StopTime=3500, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1704Test1;
    end S100;

    package S200
      extends Modelica.Icons.ExamplesPackage;
      model TestBase
        extends Modelica.Icons.Example;
        Plants.Thermal.Systems.TES tES annotation (Placement(transformation(extent={{-30,-32},{32,30}})));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end TestBase;
    end S200;

    package S400 "Set of validation tests of electric boiler system"
      extends Modelica.Icons.ExamplesPackage;
      model TestBase
        extends Modelica.Icons.Example;

        replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

        constant Real pi = Modelica.Constants.pi;
        parameter Integer n = 3 "Number of volumes in each pipe";
        parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
            DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
        parameter Real pumpcorrectionfactor = 1;
        parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";

        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = PTi[1,1];
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = PTo[1,1];
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = TTi[1,1];
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = TTo[1,1];

        parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
        parameter DistrictHeatingNetwork.Types.Length L_PT401_EB401 = 0.5+0.4+0.2;
        parameter DistrictHeatingNetwork.Types.Length h_PT401_EB401 = -0.1*0;
        parameter DistrictHeatingNetwork.Types.Length L_EB401_P401 = 0.3+1+1+0.4;
        parameter DistrictHeatingNetwork.Types.Length h_EB401_P401 = -0.8;
        parameter DistrictHeatingNetwork.Types.Length L_P401_FCV401 = 0.2+0.4+0.6;
        parameter DistrictHeatingNetwork.Types.Length h_P401_FCV401 = 0.2*0;

        parameter Real q_m3h_S4 = FT[1,1];
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;
        parameter Real P401omega[:,:] = [0, 2*3.141592654*30; 100, 2*3.141592654*30];
        parameter Real FCV401theta[:,:] = [0, 1];

        parameter Integer nR = 5 "Total number of resistors";
        parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";

        parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
        parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixPTi = "PT401" "Matrix name in file";
        parameter String matrixPTo = "PT402" "Matrix name in file";
        parameter String matrixTTi = "TT401" "Matrix name in file";
        parameter String matrixTTo = "TT402" "Matrix name in file";
        parameter String matrixtheta = "theta_FCV401" "Matrix name in file";
        parameter String matrixfreq = "f_P401";
        parameter String matrixFT = "FT401" "Matrix name in file";
        parameter String timenoscale = "time" "Matrix name in file";
        parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";

        Plants.Thermal.Systems.ElectricBoiler electricBoiler(redeclare model Medium = Medium,
          n=n,
          hctype=hctype,
          pumpcorrectionfactor=pumpcorrectionfactor,
          pin_start_S4=pin_start_S4,
          pout_start_S4=pout_start_S4,
          Tin_start_S4=Tin_start_S4,
          Tout_start_S4=Tout_start_S4,
          Di_S4=Di_S4,
          t_S4=t_S4,
          L_PT401_EB401=L_PT401_EB401,
          h_PT401_EB401=h_PT401_EB401,
          L_EB401_P401=L_EB401_P401,
          h_EB401_P401=h_EB401_P401,
          L_P401_FCV401=L_P401_FCV401,
          h_P401_FCV401=h_P401_FCV401,
          q_m3h_S4=q_m3h_S4,
          Kv=Kv,
          openingChar=openingChar,
          nR=nR,
          Pmaxres=Pmaxres)                                                                    annotation (Placement(transformation(extent={{-28,-32},{30,26}})));

        Modelica.Blocks.Sources.TimeTable FCV401_theta(table=[ts,thetav]) annotation (Placement(transformation(extent={{-90,4},{-78,16}})));
        Modelica.Blocks.Sources.TimeTable P401_omega(table=[ts,omega]) annotation (Placement(transformation(extent={{-90,22},{-78,34}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasstheta(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=thetav[1, 1])                            annotation (Placement(transformation(extent={{-68,4},{-56,16}})));
        Modelica.Blocks.Continuous.FirstOrder lowPassomega(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=omega[1, 1])                             annotation (Placement(transformation(extent={{-68,22},{-56,34}})));
        Modelica.Blocks.Sources.TimeTable PT402_profile(table=[ts,PTo]) annotation (Placement(transformation(extent={{94,70},{82,82}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex
                              valT annotation (Placement(transformation(extent={{64,10},{76,-2}})));
        Modelica.Blocks.Sources.TimeTable Tout_ref(table=[ts,TTo]) annotation (Placement(transformation(extent={{44,-20},{54,-10}})));
        Modelica.Blocks.Sources.TimeTable TT401_profile(table=[ts,TTi]) annotation (Placement(transformation(extent={{-60,44},{-48,56}})));
        Modelica.Blocks.Sources.TimeTable PT401_profile(table=[ts,PTi]) annotation (Placement(transformation(extent={{-60,62},{-48,74}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref(table=[ts,m_flow_approx]) annotation (Placement(transformation(extent={{28,34},{40,46}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_mflow annotation (Placement(transformation(extent={{64,18},{76,30}})));
        DistrictHeatingNetwork.Sources.SourcePressure
                               source(
          use_in_p0=true,
          use_in_T0=true,
          redeclare model Medium = Medium,
          p0=pin_start_S4,
          T0=Tin_start_S4,
          R=1e-3)
          annotation (Placement(transformation(extent={{-10,10},{10,-10}},
              rotation=-90,
              origin={-12,62})));
        DistrictHeatingNetwork.Sources.SinkPressure
                             sinkP(
          use_in_p0=true,
          redeclare model Medium = Medium,
          p0=pout_start_S4,
          T0=Tout_start_S4,
          R=1e-3)
               annotation (Placement(transformation(extent={{-10,10},{10,-10}},
              rotation=90,
              origin={64,78})));
        Modelica.Blocks.Sources.BooleanTable EB401_Status1(table={1e6}, startValue=true)
                                                                                        "Input to decide whether or nor the electric boiler is working"
          annotation (Placement(transformation(extent={{-70,-40},{-58,-28}})));
        Modelica.Blocks.Sources.TimeTable EB401_ToutSP1(table=[0,80 + 273.15; 100,80 + 273.15])
          annotation (Placement(transformation(extent={{-68,-18},{-56,-6}})));
        inner DistrictHeatingNetwork.System system annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
          redeclare model Medium = Medium,
          use_in_m_flow=true,
          pin_start=pout_start_S4,
          p0=pout_start_S4,
          T0=Tout_start_S4,
          m_flow0=m_flow_approx[1, 1],
          G=1e-8)                      annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={16,84})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (Placement(transformation(extent={{70,44},{82,56}})));
      protected
        final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
        final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
        final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
        final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
        final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
        final parameter Real TTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo, dim[1], dim[2]);
        final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
        final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
        final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
        final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
        final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
        final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1,1];
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1,1];
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1,1];
      equation
        connect(PT402_profile.y, sinkP.in_p0) annotation (Line(points={{81.4,76},{81.4,74},{72.4,74}},                  color={0,0,127}));
        connect(source.outlet, electricBoiler.inlet) annotation (Line(
            points={{-12,52},{-12,38},{-10.31,38},{-10.31,30.35}},
            color={140,56,54},
            thickness=0.5));
        connect(TT401_profile.y, source.in_T0) annotation (Line(points={{-47.4,50},{-32,50},{-32,58},{-20.4,58}}, color={0,0,127}));
        connect(PT401_profile.y, source.in_p0) annotation (Line(points={{-47.4,68},{-32,68},{-32,66},{-20.4,66}}, color={0,0,127}));
        connect(P401_omega.y, lowPassomega.u) annotation (Line(points={{-77.4,28},{-69.2,28}}, color={0,0,127}));
        connect(FCV401_theta.y, lowPasstheta.u) annotation (Line(points={{-77.4,10},{-69.2,10}}, color={0,0,127}));
        connect(lowPassomega.y, electricBoiler.omega) annotation (Line(points={{-55.4,28},{-44,28},{-44,18},{-30.9,18},{-30.9,17.3}}, color={0,0,127}));
        connect(lowPasstheta.y, electricBoiler.theta) annotation (Line(points={{-55.4,10},{-44,10},{-44,11.5},{-30.9,11.5}}, color={0,0,127}));
        connect(electricBoiler.m_flow_, val_mflow.u_sim) annotation (Line(points={{32.9,17.3},{62.8,17.3},{62.8,21}}, color={0,0,127}));
        connect(m_flow_ref.y, val_mflow.u_meas) annotation (Line(points={{40.6,40},{54,40},{54,27},{62.8,27}}, color={0,0,127}));
        connect(electricBoiler.TTout, valT.u_sim) annotation (Line(points={{32.9,5.7},{50,5.7},{50,7},{62.8,7}}, color={0,0,127}));
        connect(Tout_ref.y, valT.u_meas) annotation (Line(points={{54.5,-15},{58,-15},{58,1},{62.8,1}}, color={0,0,127}));
        connect(EB401_ToutSP1.y, electricBoiler.Toutset) annotation (Line(points={{-55.4,-12},{-48,-12},{-48,5.7},{-30.9,5.7}}, color={0,0,127}));
        connect(EB401_Status1.y, electricBoiler.status) annotation (Line(points={{-57.4,-34},{-44,-34},{-44,-0.1},{-30.9,-0.1}}, color={255,0,255}));
        connect(electricBoiler.PTout, val_pout.u_sim) annotation (Line(points={{32.9,-5.9},{48,-5.9},{48,47},{68.8,47}}, color={0,0,127}));
        connect(val_pout.u_meas, sinkP.in_p0) annotation (Line(points={{68.8,53},{62,53},{62,60},{78,60},{78,74},{72.4,74}}, color={0,0,127}));
        connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (Line(points={{40.6,40},{44,40},{44,78},{21,78}}, color={0,0,127}));
        connect(electricBoiler.outlet, sinkP.inlet)
          annotation (Line(
            points={{12.89,30.35},{12.89,54},{12,54},{12,62},{64,62},{64,68}},
            color={140,56,54},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end TestBase;

      model S400_Seq_0412Test2
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat"));
        annotation (experiment(StopTime=9500, __Dymola_Algorithm="Dassl"));
      end S400_Seq_0412Test2;

      model S400_Seq_0412Test3
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat"));
        annotation (experiment(StopTime=9000, __Dymola_Algorithm="Dassl"));
      end S400_Seq_0412Test3;

      model S400_Seq_2601Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2601_Test1/Temperatures.mat"),
            electricBoiler(FCV401(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear)));
        annotation (experiment(
            StopTime=7000,
            Interval=0.166889,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S400_Seq_2601Test1;

      model S400_Seq_3001Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1500, __Dymola_Algorithm="Dassl"));
      end S400_Seq_3001Test1;

      model S400_Seq_3001Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Temperatures.mat"));
        annotation (experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
      end S400_Seq_3001Test2;

      model S400_Seq_2703Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2703_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1300, __Dymola_Algorithm="Dassl"));
      end S400_Seq_2703Test1;

      model S400_Seq_2903Test1
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2903_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=5150, __Dymola_Algorithm="Dassl"));
      end S400_Seq_2903Test1;

      model S400_Seq_0304Test1
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0304_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=4900, __Dymola_Algorithm="Dassl"));
      end S400_Seq_0304Test1;

      model S400_Seq_0804Test1
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0804_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1700, __Dymola_Algorithm="Dassl"));
      end S400_Seq_0804Test1;

      model S400_Seq_1004Test1
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/1004_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=18400, __Dymola_Algorithm="Dassl"));
      end S400_Seq_1004Test1;

      model S400_Seq_1704Test1
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/1704_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=3500, __Dymola_Algorithm="Dassl"));
      end S400_Seq_1704Test1;
    end S400;

    package S900 "Validation tests of pumping system"
      extends Modelica.Icons.ExamplesPackage;

      model TestBase
        extends Modelica.Icons.Example;

        // Medium
        replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
          constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
        parameter Real pumpcorrectionfactor = 1.1;
        parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005;
        parameter Real b[3] = {24.122662, 0.669933, -0.039537} "Head Characteristic coefficients";

        parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length L_v = 1;
        parameter DistrictHeatingNetwork.Types.Length L_RL2L3 = 4.53;
        parameter DistrictHeatingNetwork.Types.Length L_RL3L4 = 3.02;
        parameter DistrictHeatingNetwork.Types.Length L_RL4L5 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length L_RL5L6 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length L_RL6L7 = 3;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9 = 4.04;

        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = pin_start;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = 3.2e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9 = Tin_start;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9 = 80 + 273.15;

        parameter DistrictHeatingNetwork.Types.Length Di_rCD = 72e-3;
        parameter DistrictHeatingNetwork.Types.Length t_rCD = 2e-3;
        parameter DistrictHeatingNetwork.Types.Length L_rCD = 6;
        parameter DistrictHeatingNetwork.Types.Length h_rCD = 0;

        parameter DistrictHeatingNetwork.Types.Length L_S400_rCD = 2+0.5+0.5+0.7+1.5+1.5+0.5+0.2+0.2+0.6;
        parameter DistrictHeatingNetwork.Types.Length h_S400_rCD = 0.1; //0.7-1.5+0.2+0.6;
        parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;

        parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
        parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixPTi = "PT402" "Matrix name in file";
        parameter String matrixPTo = "PT902" "Matrix name in file";
        parameter String matrixTTi = "TT402" "Matrix name in file";
        parameter String matrixtheta = "theta_FCV901" "Matrix name in file";
        parameter String matrixfreq = "f_P901";
        parameter String matrixFT = "FT901" "Matrix name in file";
        parameter String timenoscale = "time" "Matrix name in file";
        parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";
        parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot "opening characteristic";

        Plants.Thermal.Systems.CirculationPump circulationPump(n=3,
          pumpcorrectionfactor=pumpcorrectionfactor,
          Kv=Kv,
          openingChar=openingChar,
          cf=cf,
          b=b)                                                 annotation (Placement(transformation(extent={{-28,-22},{32,38}})));
        Modelica.Blocks.Sources.TimeTable TT402_profile(table=[ts,TTi]) annotation (Placement(transformation(extent={{48,-78},{36,-66}})));
        Modelica.Blocks.Sources.TimeTable PT402_profile(table=[ts,PTi]) annotation (Placement(transformation(extent={{64,-98},{52,-86}})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackCD(
          m_flow_start=m_flow_start,
          redeclare model Medium = Medium,
          L=L_rCD,
          h=h_rCD,
          t=t_rCD,
          pin_start=pin_start_S9,
          Tin_start=Tout_start_S9,
          Tout_start=Tout_start_S9,
          Di=Di_rCD,
          nPipes=1,
          n=5) "Pipe connecting the outlet of S900 and the pressure transmiter PT401"
          annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={14,-40})));
        DistrictHeatingNetwork.Sources.SourcePressure
                               sourceP(
          use_in_p0=true,
          use_in_T0=true,
          redeclare model Medium = Medium,
          p0=pin_start_S9,
          T0=Tin_start_S9,
          R=1e-3)                                                                                         annotation (Placement(
              transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={14,-92})));
        DistrictHeatingNetwork.Sources.SinkMassFlow
                             sink_(redeclare model Medium = Medium) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-10,-90})));
        Modelica.Blocks.Sources.TimeTable P901_omega(table=[ts,omega]) annotation (Placement(transformation(extent={{-80,32},{-68,44}})));
        Modelica.Blocks.Sources.TimeTable FCV901_theta(table=[ts,thetav]) annotation (Placement(transformation(extent={{-80,12},{-68,24}})));
        Modelica.Blocks.Sources.TimeTable PT902_profile(table=[ts,PTo]) annotation (Placement(transformation(extent={{58,44},{46,56}})));
        DistrictHeatingNetwork.Sources.SinkPressure
                             sinkP(
          use_in_p0=true,
          redeclare model Medium = Medium,
          p0=pout_start_S9,
          T0=Tout_start_S9,
          R=1e-3)
               annotation (Placement(transformation(extent={{32,74},{44,62}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref(table=[ts,m_flow_approx]) annotation (Placement(transformation(extent={{48,86},{60,98}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex m_flow_index annotation (Placement(transformation(extent={{74,84},{86,96}})));

        inner DistrictHeatingNetwork.System system annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        Modelica.Blocks.Continuous.FirstOrder lowPassomega(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=omega[1, 1])                             annotation (Placement(transformation(extent={{-56,32},{-44,44}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasstheta(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=thetav[1, 1])                            annotation (Placement(transformation(extent={{-56,12},{-44,24}})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=Di_S4, D_o=Di_rCD)
          annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={14,-56})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD(
          m_flow_start=m_flow_start,
          redeclare model Medium = Medium,
          L=L_S400_rCD,
          h=h_S400_rCD,
          t=t_S4,
          pin_start=pin_start_S9,
          Tin_start=Tout_start_S9,
          Tout_start=Tout_start_S9,
          Di=Di_S4,
          nPipes=1,
          n=5) "Pipe connecting rackCD and the pressure transmiter PT402" annotation (Placement(transformation(
              extent={{-6,6},{6,-6}},
              rotation=90,
              origin={14,-72})));
        Modelica.Blocks.Continuous.FirstOrder lowPasspout(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=PTo[1, 1]) annotation (Placement(transformation(extent={{40,44},{28,56}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasspin(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=PTi[1, 1]) annotation (Placement(transformation(extent={{44,-98},{32,-86}})));
      protected
        final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
        final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
        final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
        final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
        final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
        final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
        final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
        final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
        final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
        final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
        final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1,1];
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1,1];
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1,1];
      equation
        connect(sinkP.inlet, circulationPump.outlethot) annotation (Line(
            points={{32,68},{13.7,68},{13.7,42.5}},
            color={140,56,54},
            thickness=0.5));
        connect(sink_.inlet, circulationPump.outletcold) annotation (Line(
            points={{-10,-80},{-10,-55.25},{-9.7,-55.25},{-9.7,-26.5}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402_profile.y, sourceP.in_T0) annotation (Line(points={{35.4,-72},{28,-72},{28,-89.6},{19.04,-89.6}}, color={0,0,127}));
        connect(m_flow_ref.y, m_flow_index.u_meas) annotation (Line(points={{60.6,92},{72.8,92},{72.8,93}},                 color={0,0,127}));
        connect(circulationPump.m_flow_, m_flow_index.u_sim) annotation (Line(points={{35,29},{66,29},{66,87},{72.8,87}}, color={0,0,127}));
        connect(P901_omega.y, lowPassomega.u) annotation (Line(points={{-67.4,38},{-57.2,38}}, color={0,0,127}));
        connect(lowPassomega.y, circulationPump.omega) annotation (Line(points={{-43.4,38},{-38,38},{-38,29},{-31,29}}, color={0,0,127}));
        connect(FCV901_theta.y, lowPasstheta.u) annotation (Line(points={{-67.4,18},{-57.2,18}},
                                                                                               color={0,0,127}));
        connect(lowPasstheta.y, circulationPump.theta) annotation (Line(points={{-43.4,18},{-38,18},{-38,23},{-31,23}},
                                                                                                                      color={0,0,127}));
        connect(suddenAreaChange.outlet, PL_S400_rCD.outlet) annotation (Line(
            points={{14,-60},{14,-66}},
            color={140,56,54},
            thickness=0.5));
        connect(sourceP.outlet, PL_S400_rCD.inlet) annotation (Line(
            points={{14,-86},{14,-78}},
            color={140,56,54},
            thickness=0.5));
        connect(rackCD.inlet, suddenAreaChange.inlet) annotation (Line(
            points={{14,-46},{14,-52}},
            color={140,56,54},
            thickness=0.5));
        connect(rackCD.outlet, circulationPump.inlethot) annotation (Line(
            points={{14,-34},{14,-29.25},{13.7,-29.25},{13.7,-26.5}},
            color={140,56,54},
            thickness=0.5));
        connect(lowPasspout.y, sinkP.in_p0) annotation (Line(points={{27.4,50},{22,50},{22,60},{35.6,60},{35.6,62.96}}, color={0,0,127}));
        connect(lowPasspout.u, PT902_profile.y) annotation (Line(points={{41.2,50},{45.4,50}}, color={0,0,127}));
        connect(PT402_profile.y, lowPasspin.u) annotation (Line(points={{51.4,-92},{45.2,-92}}, color={0,0,127}));
        connect(lowPasspin.y, sourceP.in_p0) annotation (Line(points={{31.4,-92},{28,-92},{28,-94.4},{19.04,-94.4}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
          experiment(
            StartTime=3500,
            StopTime=9500,
            __Dymola_Algorithm="Dassl"));
      end TestBase;

      model S900_Seq_0412Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test2/Temperatures.mat"));
        annotation (experiment(
            StopTime=2600,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0412Test2;

      model S900_Seq_0412Test3
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat"));
        annotation (experiment(
            StopTime=7200,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0412Test3;

      model S900_Seq_1701Test1
        extends TestBase(    MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test1/Temperatures.mat"));
      end S900_Seq_1701Test1;

      model S900_Seq_2601Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2601_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=7000, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2601Test1;

      model S900_Seq_2901Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2901_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=6800, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2901Test1;

      model S900_Seq_2703Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2703_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1300, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2703Test1;

      model S900_Seq_2903Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Marzo 2024/2903_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=5100, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2903Test1;

      model S900_Seq_3001Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1500, __Dymola_Algorithm="Dassl"));
      end S900_Seq_3001Test1;

      model S900_Seq_3001Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/3001_Test2/Temperatures.mat"));
        annotation (experiment(StopTime=3900, __Dymola_Algorithm="Dassl"));
      end S900_Seq_3001Test2;

      model S900_Seq_0304Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0304_Test1/Temperatures.mat"));
        annotation (experiment(
            StartTime=100,
            StopTime=4800,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0304Test1;

      model S900_Seq_0804Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/0804_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=1700, __Dymola_Algorithm="Dassl"));
      end S900_Seq_0804Test1;

      model S900_Seq_1004Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Aprile 2024/1004_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=15000, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1004Test1;
    end S900;
  end Systems;

  package Loads "Package to run test in the load side of the plant using real data"
    extends DistrictHeatingNetwork.Icons.Generic.ThermalLoads;
    model ParallelConfiguration4Loads
      extends MultiEnergySystem.TestFacility.Loads.Thermal.Configurations.BaseClass.LoadPlantBase(VER901(p0 = 219000), Kvalve = 90, PL701_rackL2L3_TT702(L = 0.001, h = 0), PL731_rackL6L7_TT732(L = 0.001, h = 0), PL711_rackL3L4_TT712(L = 0.001, h = 0), PL721_rackL4L5_TT722(L = 0.001, h = 0), RR01(pin_cold_start = 120000, dp_cold_start = dpRR), RR00_PL_TTR02_VER901(h = h1), RR00_PL_VER901_FCVR01(h = h2), RR00_PL_FCVR01_FTR03(h = h3), RR00_PL_FTR03_PTR01(h = h4), FCVR01(openingChar = MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot, q_m3h_nom = 14.5), PL_RR_UsersIn(h = 0.2));
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h1 = 0;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h2 = 0;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h3 = 3;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h4 = 5;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure dpRR = 1e5;
      parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test2/Temperatures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test2/Pressures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test2/Flow.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/1701_Test2/Actuators.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
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
      final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures, matrixTT701) "Dimension of matrix";
      final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, timenoscale, dim[1], dim[2]) "Matrix data";
      final parameter Real TT_701[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT701, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_711[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT711, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_721[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT721, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_731[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT731, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_702[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT702, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_712[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT712, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_722[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT722, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_732[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT732, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]) "Matrix data";
      final parameter Real TT_703[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT703, dim[1], dim[2]) "Matrix data";
      final parameter Real TT_713[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT713, dim[1], dim[2]) "Matrix data";
      final parameter Real TT_723[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT723, dim[1], dim[2]) "Matrix data";
      final parameter Real TT_733[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT733, dim[1], dim[2]) "Matrix data";
      final parameter Real PT_701[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT701, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_711[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT711, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_721[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT721, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_731[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT731, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_702[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT702, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_712[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT712, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_722[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT722, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real PT_732[:, :] = Modelica.Utilities.Streams.readRealMatrix(Pressures, matrixPT732, dim[1] + 1, dim[2])*1e5 "Matrix data";
      final parameter Real FT_701[:, :] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT701, dim[1], dim[2])*1000/3600 "Matrix data";
      final parameter Real FT_711[:, :] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT711, dim[1], dim[2])*1000/3600 "Matrix data";
      final parameter Real FT_721[:, :] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT721, dim[1], dim[2])*1000/3600 "Matrix data";
      final parameter Real FT_731[:, :] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT731, dim[1], dim[2])*1000/3600 "Matrix data";
      final parameter Real thetaFCV701[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV701, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaFCV711[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV711, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaFCV721[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV721, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaFCV731[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV731, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaTCV701[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaTCV701, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaTCV711[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaTCV711, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaTCV721[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaTCV721, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaTCV731[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaTCV731, dim[1], dim[2]) "Matrix data";
      final parameter Real thetaFCVR01[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCVR01, dim[1], dim[2]) "Matrix data";
      final parameter Real fPR01[:, :] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixfPR01, dim[1], dim[2])*2*Modelica.Constants.pi*5/3 "Matrix data";
      final parameter Real TT_R02[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTTR02, dim[1], dim[2]) "Matrix data";
      Modelica.Blocks.Sources.TimeTable TCV701_theta(table = [t, thetaTCV701]) annotation (
        Placement(transformation(extent = {{54, -330}, {74, -310}})));
      Modelica.Blocks.Sources.TimeTable TCV731_theta(table = [t, thetaTCV731]) annotation (
        Placement(transformation(extent = {{208, -330}, {228, -310}})));
      Modelica.Blocks.Sources.TimeTable TCV711_theta(table = [t, thetaTCV711]) annotation (
        Placement(transformation(extent = {{349, -330}, {369, -310}})));
      Modelica.Blocks.Sources.TimeTable TCV721_theta(table = [t, thetaTCV721]) annotation (
        Placement(transformation(extent = {{509, -330}, {529, -310}})));
      Modelica.Blocks.Sources.TimeTable FCVR01_theta(table = [t, thetaFCVR01]) annotation (
        Placement(transformation(extent = {{800, -340}, {780, -320}})));
      Modelica.Blocks.Sources.TimeTable FCV701_theta(table = [t, thetaFCV701]) annotation (
        Placement(transformation(extent = {{181, -160}, {161, -140}})));
      Modelica.Blocks.Sources.TimeTable FCV731_theta(table = [t, thetaFCV731]) annotation (
        Placement(transformation(extent = {{340, -160}, {320, -140}})));
      Modelica.Blocks.Sources.TimeTable FCV711_theta(table = [t, thetaFCV711]) annotation (
        Placement(transformation(extent = {{481, -160}, {461, -140}})));
      Modelica.Blocks.Sources.TimeTable FCV721_theta(table = [t, thetaFCV721]) annotation (
        Placement(transformation(extent = {{640, -160}, {620, -140}})));
      Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table = [t, TT_723]) "Temperature in Celsius degrees" annotation (
        Placement(transformation(extent = {{730, -70}, {750, -50}})));
      Modelica.Blocks.Sources.TimeTable PR01_omega(table = [0, 2*3.141592654*50*0.903; 100, 2*3.141592654*50*0.903]) annotation (
        Placement(transformation(extent = {{664, -218}, {684, -198}})));
      Modelica.Blocks.Sources.TimeTable EX701_p(table = [t, PT_702[1:end - 1]]) annotation (
        Placement(transformation(extent = {{40, 0}, {60, 20}})));
      DistrictHeatingNetwork.Sources.SourcePressure sourceP0(use_in_p0 = true, use_in_T0 = true) annotation (
        Placement(transformation(extent = {{70, -30}, {90, -10}})));
      DistrictHeatingNetwork.Sources.SourcePressure sourceP1(use_in_p0 = true, use_in_T0 = true) annotation (
        Placement(transformation(extent = {{370, -30}, {390, -10}})));
      DistrictHeatingNetwork.Sources.SourcePressure sourceP2(use_in_p0 = true, use_in_T0 = true) annotation (
        Placement(transformation(extent = {{530, -30}, {550, -10}})));
      DistrictHeatingNetwork.Sources.SourcePressure sourceP3(use_in_p0 = true, use_in_T0 = true) annotation (
        Placement(transformation(extent = {{232, -30}, {252, -10}})));
      Modelica.Blocks.Sources.TimeTable EX701_T(table = [t, TT_702]) annotation (
        Placement(transformation(extent = {{40, 30}, {60, 50}})));
      inner DistrictHeatingNetwork.System system annotation (
        Placement(transformation(extent = {{664, 100}, {684, 120}})));
      Modelica.Blocks.Sources.TimeTable EX711_p(table = [t, PT_712[1:end - 1]]) annotation (
        Placement(transformation(extent = {{340, 0}, {360, 20}})));
      Modelica.Blocks.Sources.TimeTable EX711_T(table = [t, TT_712]) annotation (
        Placement(transformation(extent = {{340, 30}, {360, 50}})));
      Modelica.Blocks.Sources.TimeTable EX721_p(table = [t, PT_722[1:end - 1]]) annotation (
        Placement(transformation(extent = {{500, 0}, {520, 20}})));
      Modelica.Blocks.Sources.TimeTable EX721_T(table = [t, TT_722]) annotation (
        Placement(transformation(extent = {{500, 30}, {520, 50}})));
      Modelica.Blocks.Sources.TimeTable EX731_p(table = [t, PT_732[1:end - 1]]) annotation (
        Placement(transformation(extent = {{200, 0}, {220, 20}})));
      Modelica.Blocks.Sources.TimeTable EX731_T(table = [t, TT_732]) annotation (
        Placement(transformation(extent = {{200, 30}, {220, 50}})));
      Modelica.Blocks.Sources.TimeTable EX731_mflow(table = [t, FT_731]) annotation (
        Placement(transformation(extent = {{340, 0}, {320, 20}})));
      DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP3(use_in_m_flow = true, pin_start = 200000, p0 = 200000, T0 = 323.15) annotation (
        Placement(transformation(extent = {{308, -30}, {328, -10}})));
      Modelica.Blocks.Sources.TimeTable EX711_mflow(table = [t, FT_711]) annotation (
        Placement(transformation(extent = {{480, 0}, {460, 20}})));
      DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP1(use_in_m_flow = true, pin_start = 200000, p0 = 200000, T0 = 323.15) annotation (
        Placement(transformation(extent = {{448, -30}, {468, -10}})));
      Modelica.Blocks.Sources.TimeTable EX721_mflow(table = [t, FT_721]) annotation (
        Placement(transformation(extent = {{640, 0}, {620, 20}})));
      DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP2(use_in_m_flow = true, pin_start = 200000, p0 = 200000, T0 = 323.15) annotation (
        Placement(transformation(extent = {{608, -30}, {628, -10}})));
      Modelica.Blocks.Sources.TimeTable EX701_mflow(table = [t, FT_701]) annotation (
        Placement(transformation(extent = {{180, 0}, {160, 20}})));
      DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlowP0(use_in_m_flow = true, pin_start = 200000, p0 = 200000, T0 = 323.15) annotation (
        Placement(transformation(extent = {{148, -30}, {168, -10}})));
    equation
      connect(TCV701_theta.y, TCV701.opening) annotation (
        Line(points = {{75, -320}, {90, -320}}, color = {0, 0, 127}));
      connect(TCV731_theta.y, TCV731.opening) annotation (
        Line(points = {{229, -320}, {250, -320}}, color = {0, 0, 127}));
      connect(TCV721_theta.y, TCV721.opening) annotation (
        Line(points = {{530, -320}, {549.1, -320}}, color = {0, 0, 127}));
      connect(TCV711_theta.y, TCV711.opening) annotation (
        Line(points = {{370, -320}, {390, -320}}, color = {0, 0, 127}));
      connect(FCVR01_theta.y, FCVR01.opening) annotation (
        Line(points = {{779, -330}, {766, -330}, {766, -352}}, color = {0, 0, 127}));
      connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (
        Line(points = {{751, -60}, {767.5, -60}, {767.5, -97.2}}, color = {0, 0, 127}));
      connect(FCV721_theta.y, FCV721.opening) annotation (
        Line(points = {{619, -150}, {606, -150}}, color = {0, 0, 127}));
      connect(FCV711_theta.y, FCV711.opening) annotation (
        Line(points = {{460, -150}, {446, -150}}, color = {0, 0, 127}));
      connect(FCV731_theta.y, FCV731.opening) annotation (
        Line(points = {{319, -150}, {306, -150}}, color = {0, 0, 127}));
      connect(FCV701.opening, FCV701_theta.y) annotation (
        Line(points = {{146, -150}, {160, -150}}, color = {0, 0, 127}));
      connect(PR01_omega.y, PR01.in_omega) annotation (
        Line(points = {{685, -208}, {692.25, -208}, {692.25, -207.8}, {697.5, -207.8}}, color = {0, 0, 127}));
      connect(sourceP0.outlet, PL701_rackL2L3_TT702.inlet) annotation (
        Line(points = {{90, -20}, {98, -20}, {98, -48}}, color = {140, 56, 54}, thickness = 0.5));
      connect(sourceP3.outlet, PL731_rackL6L7_TT732.inlet) annotation (
        Line(points = {{252, -20}, {258, -20}, {258, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(sourceP1.outlet, PL711_rackL3L4_TT712.inlet) annotation (
        Line(points = {{390, -20}, {398, -20}, {398, -46}}, color = {140, 56, 54}, thickness = 0.5));
      connect(sourceP2.outlet, PL721_rackL4L5_TT722.inlet) annotation (
        Line(points = {{550, -20}, {558, -20}, {558, -46}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EX701_p.y, sourceP0.in_p0) annotation (
        Line(points = {{61, 10}, {76, 10}, {76, -11.6}}, color = {0, 0, 127}));
      connect(EX701_T.y, sourceP0.in_T0) annotation (
        Line(points = {{61, 40}, {84, 40}, {84, -11.6}}, color = {0, 0, 127}));
      connect(EX711_p.y, sourceP1.in_p0) annotation (
        Line(points = {{361, 10}, {376, 10}, {376, -11.6}}, color = {0, 0, 127}));
      connect(EX711_T.y, sourceP1.in_T0) annotation (
        Line(points = {{361, 40}, {384, 40}, {384, -11.6}}, color = {0, 0, 127}));
      connect(EX721_p.y, sourceP2.in_p0) annotation (
        Line(points = {{521, 10}, {536, 10}, {536, -11.6}}, color = {0, 0, 127}));
      connect(EX721_T.y, sourceP2.in_T0) annotation (
        Line(points = {{521, 40}, {544, 40}, {544, -11.6}}, color = {0, 0, 127}));
      connect(EX731_p.y, sourceP3.in_p0) annotation (
        Line(points = {{221, 10}, {238, 10}, {238, -11.6}}, color = {0, 0, 127}));
      connect(EX731_T.y, sourceP3.in_T0) annotation (
        Line(points = {{221, 40}, {246, 40}, {246, -11.6}}, color = {0, 0, 127}));
      connect(sinkMassFlowP3.inlet, PL731_FT731_rackL6L7.outlet) annotation (
        Line(points = {{308, -20}, {298, -20}, {298, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EX731_mflow.y, sinkMassFlowP3.in_m_flow) annotation (
        Line(points = {{319, 10}, {312, 10}, {312, -15}}, color = {0, 0, 127}));
      connect(EX711_mflow.y, sinkMassFlowP1.in_m_flow) annotation (
        Line(points = {{459, 10}, {452, 10}, {452, -15}}, color = {0, 0, 127}));
      connect(PL711_FT711_rackL3L4.outlet, sinkMassFlowP1.inlet) annotation (
        Line(points = {{438, -46}, {438, -20}, {448, -20}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EX721_mflow.y, sinkMassFlowP2.in_m_flow) annotation (
        Line(points = {{619, 10}, {612, 10}, {612, -15}}, color = {0, 0, 127}));
      connect(sinkMassFlowP2.inlet, PL721_FT721_rackL4L5.outlet) annotation (
        Line(points = {{608, -20}, {598, -20}, {598, -46}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EX701_mflow.y, sinkMassFlowP0.in_m_flow) annotation (
        Line(points = {{159, 10}, {152, 10}, {152, -15}}, color = {0, 0, 127}));
      connect(sinkMassFlowP0.inlet, PL701_FT701_rackL2L3.outlet) annotation (
        Line(points = {{148, -20}, {138, -20}, {138, -48}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        experiment(StopTime = 2800, __Dymola_Algorithm = "Dassl"));
    end ParallelConfiguration4Loads;

    model E7X1Test "Subsystem of a single HX70X test with real data"
      extends Modelica.Icons.Example;
      replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
      replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

      parameter Real CorrectFactorHot = 1;
      parameter Real CorrectFactorCold = 1;
      parameter DistrictHeatingNetwork.Types.Density rhohotref=985;
      parameter DistrictHeatingNetwork.Types.Density rhocoldref=999;
      parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Pressures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Flow.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Actuators.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String matrixTT701 = "TT701" "Matrix name in file";
      parameter String matrixTT702 = "TT702" "Matrix name in file";
      parameter String matrixTT703 = "TT703" "Matrix name in file";
      parameter String matrixTT704 = "TT704" "Matrix name in file";
      parameter String matrixFT701 = "FT701" "Matrix name in file";
      parameter String matrixFT703 = "FT703" "Matrix name in file";
      parameter String matrixPT701 = "PT701" "Matrix name in file";
      parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
      parameter String timenoscale = "time" "Matrix name in file";
      parameter Real EX701_q_m3h_hot = 2.5;
      parameter Real deltaThotmax = 30;
      parameter Real deltaTcoldmax = 20;

      // Variables
      //   DistrictHeatingNetwork.Types.Temperature Tout_cold_ref;
      //   DistrictHeatingNetwork.Types.Temperature Tout_hot_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaToutcold;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTouthot;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot;
      //   Real deviationCold, deviationHot;
      //   DistrictHeatingNetwork.Types.TemperatureDifference LMTD_ref;
      //   DistrictHeatingNetwork.Types.CoefficientOfHeatTransfer gamma_ref;
      //   DistrictHeatingNetwork.Types.Power Ptcold_ref;
      //   DistrictHeatingNetwork.Types.Power Pthot_ref;
      //  final parameter Real PT701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
      //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
      //  *1000/3600 "Matrix data";
      inner DistrictHeatingNetwork.System system annotation (Placement(visible=true, transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      DistrictHeatingNetwork.Sources.SourceMassFlow sourceHot_mflow(
        redeclare model Medium = Medium,
        use_in_m_flow=true,
        use_in_T=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
        m_flow0=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot) annotation (Placement(transformation(extent={{61,41},{41,21}})));
      DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold_mflow(
        redeclare model Medium = Medium,
        use_in_m_flow=true,
        use_in_T=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
        m_flow0=0.32) annotation (Placement(transformation(extent={{-60,-42},{-40,-22}})));
      DistrictHeatingNetwork.Sources.SinkPressure sinkHot_p(
        redeclare model Medium = Medium,
        use_in_p0=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot) annotation (Placement(transformation(extent={{44,-43},{64,-23}})));
      DistrictHeatingNetwork.Sources.SinkPressure sinkCold_p(
        redeclare model Medium = Medium,
        use_in_p0=false,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold) annotation (Placement(transformation(extent={{-43,21},{-62,40}})));
      Modelica.Blocks.Sources.TimeTable inhot_T(table = [t, TT702]) annotation (
        Placement(transformation(extent={{69,-5},{59,5}})));
      Modelica.Blocks.Sources.TimeTable incold_T(table = [t, TT703]) annotation (
        Placement(transformation(extent={{-68,0},{-58,10}})));
      Modelica.Blocks.Sources.TimeTable outhot_p(table = [0, 2e5; 100, 2e5]) annotation (
        Placement(transformation(extent={{65,-20},{55,-10}})));
      Modelica.Blocks.Sources.TimeTable hot_m_flow(table = [t, m_flow701]) annotation (
        Placement(transformation(extent={{69,10},{59,20}})));
      Modelica.Blocks.Sources.TimeTable cold_m_flow(table = [t, m_flow703]) annotation (
        Placement(transformation(extent={{-68,-15},{-58,-5}})));
      DistrictHeatingNetwork.Sources.SinkPressure sinkCold_ref(
        redeclare model Medium = Medium,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
        use_in_p0=false,
        use_in_T0=true,
        R=1) annotation (Placement(transformation(origin={40,42}, extent={{-50,18},{-70,38}})));
      Modelica.Blocks.Sources.TimeTable outcold_Tref(table = [t, TT704]) annotation (
        Placement(transformation(origin = {50, 10}, extent = {{-100, 70}, {-80, 90}}, rotation = -0)));
      DistrictHeatingNetwork.Sources.SinkPressure sinkHot_ref(
        redeclare model Medium = Medium,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
        use_in_p0=false,
        use_in_T0=true,
        R=1) annotation (Placement(transformation(origin={-58,110}, extent={{68,-50},{88,-30}})));
      Modelica.Blocks.Sources.TimeTable outhot_Tref(table = [t, TT701]) annotation (
        Placement(transformation(origin = {-50, 10}, extent = {{100, 70}, {80, 90}}, rotation = -0)));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X1(
        redeclare model Medium = Medium,
        T_start=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
        p_start=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot)
        annotation (Placement(transformation(extent={{31,-36},{41,-26}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X4(
        redeclare model Medium = Medium,
        T_start=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
        p_start=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold)
        annotation (Placement(transformation(extent={{-42,28},{-32,38}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X3(
        redeclare model Medium = Medium,
        T_start=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
        p_start=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold)
        annotation (Placement(transformation(extent={{-40,-35},{-30,-25}})));
      MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT7X2(
        redeclare model Medium = Medium,
        T_start=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
        p_start=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot)
        annotation (Placement(transformation(extent={{27,28},{37,38}})));
      Modelica.Blocks.Math.Add dT_cold_sim(k1=-1) annotation (Placement(transformation(extent={{-70,40},{-80,50}})));
      Modelica.Blocks.Math.Add dT_hot_sim(k1=+1, k2=-1) annotation (Placement(transformation(extent={{70,40},{80,50}})));
      Modelica.Blocks.Math.Add dT_cold_meas(k1=-1) annotation (Placement(transformation(extent={{-70,60},{-80,70}})));
      Modelica.Blocks.Math.Add dT_hot_meas(k1=-1) annotation (Placement(transformation(extent={{70,60},{80,70}})));
      DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_cold_indexes "ASHRAE indexes for delta T cold" annotation (Placement(transformation(extent={{-90,50},{-100,60}})));
      DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_hot_indexes "ASHRAE indexes for delta T hot" annotation (Placement(transformation(extent={{90,50},{100,60}})));
      MultiEnergySystem.TestFacility.Loads.Thermal.Systems.CoolingSingleLoad EX7X1 annotation (Placement(transformation(extent={{-16,-2},{15,29}})));
      Modelica.Blocks.Sources.TimeTable theta(table=[t,thetaValve])
                                                               annotation (Placement(transformation(extent={{-32,43},{-22,53}})));
    protected
      final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures, matrixTT701) "dimension of matrix";
      final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, timenoscale, dim[1], dim[2]) "Matrix data";
      final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]);
      final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT702, dim[1], dim[2]);
      final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT703, dim[1], dim[2]);
      final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT704, dim[1], dim[2]);
      final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT701, dim[1], dim[2]);
      final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT703, dim[1], dim[2]);
      final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
      final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
      final parameter Real thetaValve[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV701, dim[1], dim[2]);
    equation
      // Variables
      //   Tout_hot_ref = sinkHot_ref.fluid.T;
      //   Tout_cold_ref = sinkCold_ref.fluid.T;
      //   deltaTouthot = E7X1.Tout_hot  - Tout_hot_ref;
      //   deltaToutcold = E7X1.Tout_cold  - Tout_cold_ref;
      //   deltaThot_ref = E7X1.Tin_hot  - Tout_hot_ref;
      //   deltaTcold_ref = Tout_cold_ref -E7X1.Tin_cold;
      //   deltaThot =E7X1.Tin_hot  -E7X1.Tout_hot;
      //   deltaTcold =E7X1.Tout_cold  -E7X1.Tin_cold;
      //   //deviationHot = abs((deltaThot - deltaThot_ref)./deltaThot_ref)*100;
      //   //deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcold_ref)*100;
      //   deviationHot = abs((deltaThot - deltaThot_ref)/deltaThotmax)*100;
      //   deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcoldmax)*100;
      //   LMTD_ref = ((E7X1.Tin_hot - Tout_cold_ref) - (Tout_hot_ref -E7X1.Tin_cold)) /log(abs((E7X1.Tin_hot - Tout_cold_ref)/(Tout_hot_ref -E7X1.Tin_cold)));
      //   gamma_ref = Pthot_ref/(E7X1.hotside.Stot*LMTD_ref);
      //   Ptcold_ref =E7X1.incold.m_flow *abs((sourceCold_mflow.fluid.h - sinkCold_ref.fluid.h));
      //   Pthot_ref =E7X1.inhot.m_flow *abs((sourceHot_mflow.fluid.h - sinkHot_ref.fluid.h));
      // Connections
      connect(outhot_p.y, sinkHot_p.in_p0) annotation (
        Line(points={{54.5,-15},{50,-15},{50,-24.6}},      color = {0, 0, 127}));
      connect(incold_T.y, sourceCold_mflow.in_T) annotation (
        Line(points={{-57.5,5},{-50,5},{-50,-27}},        color = {0, 0, 127}));
      connect(outcold_Tref.y, sinkCold_ref.in_T0) annotation (
        Line(points={{-29,90},{-20,90},{-20,79.6}},      color = {0, 0, 127}));
      connect(outhot_Tref.y, sinkHot_ref.in_T0) annotation (
        Line(points={{29,90},{20,90},{20,79.6}},      color = {0, 0, 127}));
      connect(cold_m_flow.y, sourceCold_mflow.in_m_flow)
        annotation (Line(points={{-57.5,-10},{-56,-10},{-56,-27}}, color={0,0,127}));
      connect(hot_m_flow.y, sourceHot_mflow.in_m_flow)
        annotation (Line(points={{58.5,15},{57,15},{57,26}}, color={0,0,127}));
      connect(inhot_T.y, sourceHot_mflow.in_T)
        annotation (Line(points={{58.5,0},{51,0},{51,26}}, color={0,0,127}));
      connect(sinkHot_p.inlet, TT7X1.inlet)
        annotation (Line(
          points={{44,-33},{36,-33}},
          color={140,56,54},
          thickness=0.5));
      connect(sinkCold_p.inlet, TT7X4.inlet) annotation (Line(
          points={{-43,30.5},{-40.5,30.5},{-40.5,31},{-37,31}},
          color={140,56,54},
          thickness=0.5));
      connect(sourceCold_mflow.outlet, TT7X3.inlet) annotation (Line(
          points={{-40,-32},{-35,-32}},
          color={140,56,54},
          thickness=0.5));
      connect(TT7X4.T, dT_cold_sim.u2) annotation (Line(points={{-37,39.5},{-37,42},{-69,42}}, color={0,0,127}));
      connect(TT7X3.T, dT_cold_sim.u1) annotation (Line(points={{-35,-23.5},{-35,17},{-66,17},{-66,48},{-69,48}}, color={0,0,127}));
      connect(TT7X1.T, dT_hot_sim.u2) annotation (Line(points={{36,-24.5},{36,42},{69,42}}, color={0,0,127}));
      connect(TT7X2.T, dT_hot_sim.u1) annotation (Line(points={{32,39.5},{32,48},{69,48}}, color={0,0,127}));
      connect(incold_T.y, dT_cold_meas.u1) annotation (Line(points={{-57.5,5},{-50,5},{-50,68},{-69,68}}, color={0,0,127}));
      connect(outcold_Tref.y, dT_cold_meas.u2) annotation (Line(points={{-29,90},{-28,90},{-28,62},{-69,62}}, color={0,0,127}));
      connect(dT_hot_meas.u1, sinkHot_ref.in_T0) annotation (Line(points={{69,68},{27,68},{27,90},{20,90},{20,79.6}}, color={0,0,127}));
      connect(dT_hot_meas.u2, sourceHot_mflow.in_T) annotation (Line(points={{69,62},{55,62},{55,0},{51,0},{51,26}}, color={0,0,127}));
      connect(dT_cold_sim.y, dT_cold_indexes.u_sim) annotation (Line(points={{-80.5,45},{-85,45},{-85,52.5},{-89,52.5}}, color={0,0,127}));
      connect(dT_cold_meas.y, dT_cold_indexes.u_meas) annotation (Line(points={{-80.5,65},{-85,65},{-85,57.5},{-89,57.5}}, color={0,0,127}));
      connect(dT_hot_meas.y, dT_hot_indexes.u_meas) annotation (Line(points={{80.5,65},{85,65},{85,57.5},{89,57.5}}, color={0,0,127}));
      connect(dT_hot_sim.y, dT_hot_indexes.u_sim) annotation (Line(points={{80.5,45},{85,45},{85,52.5},{89,52.5}}, color={0,0,127}));
      connect(EX7X1.outcold, TT7X4.inlet) annotation (Line(
          points={{-8.095,-4.325},{-8.095,-11},{-28,-11},{-28,31},{-37,31}},
          color={140,56,54},
          thickness=0.5));
      connect(EX7X1.incold, TT7X3.inlet) annotation (Line(
          points={{7.095,-4.325},{7.095,-32},{-35,-32}},
          color={140,56,54},
          thickness=0.5));
      connect(EX7X1.outhot, TT7X1.inlet) annotation (Line(
          points={{7.405,31.325},{7.405,38},{25,38},{25,-33},{36,-33}},
          color={140,56,54},
          thickness=0.5));
      connect(sourceHot_mflow.outlet, TT7X2.inlet) annotation (Line(
          points={{41,31},{32,31}},
          color={140,56,54},
          thickness=0.5));
      connect(EX7X1.inhot, TT7X2.inlet) annotation (Line(
          points={{-7.94,31.325},{-7.94,43},{28,43},{28,31},{32,31}},
          color={140,56,54},
          thickness=0.5));
      connect(theta.y, EX7X1.theta) annotation (Line(points={{-21.5,48},{-17,48},{-17,33},{-23,33},{-23,24.35},{-17.55,24.35}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}},
            grid={1,1})),
        Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
        experiment(StopTime = 3600, Interval = 1, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
        Icon(coordinateSystem(grid={1,1})));
    end E7X1Test;

    model EX7X1Test "Subsystem of a single HX70X test with real data"
      extends Modelica.Icons.Example;
      replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
      replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

      parameter Real CorrectFactorHot = 1;
      parameter Real CorrectFactorCold = 1;
      parameter DistrictHeatingNetwork.Types.Density rhohotref=985;
      parameter DistrictHeatingNetwork.Types.Density rhocoldref=999;
      parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Pressures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Flow.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Actuators.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String matrixTT701 = "TT701" "Matrix name in file";
      parameter String matrixTT702 = "TT702" "Matrix name in file";
      parameter String matrixTT703 = "TT703" "Matrix name in file";
      parameter String matrixTT704 = "TT704" "Matrix name in file";
      parameter String matrixFT701 = "FT701" "Matrix name in file";
      parameter String matrixFT703 = "FT703" "Matrix name in file";
      parameter String matrixPT701 = "PT701" "Matrix name in file";
      parameter String matrixPT702 = "PT702" "Matrix name in file";
      parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
      parameter String timenoscale = "time" "Matrix name in file";
      parameter Real EX701_q_m3h_hot = 2.5;
      parameter Real deltaThotmax = 30;
      parameter Real deltaTcoldmax = 20;

      // Variables
      //   DistrictHeatingNetwork.Types.Temperature Tout_cold_ref;
      //   DistrictHeatingNetwork.Types.Temperature Tout_hot_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaToutcold;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTouthot;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot_ref;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaTcold;
      //   DistrictHeatingNetwork.Types.TemperatureDifference deltaThot;
      //   Real deviationCold, deviationHot;
      //   DistrictHeatingNetwork.Types.TemperatureDifference LMTD_ref;
      //   DistrictHeatingNetwork.Types.CoefficientOfHeatTransfer gamma_ref;
      //   DistrictHeatingNetwork.Types.Power Ptcold_ref;
      //   DistrictHeatingNetwork.Types.Power Pthot_ref;
      //  final parameter Real PT701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
      //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
      //  *1000/3600 "Matrix data";
      inner DistrictHeatingNetwork.System system annotation (Placement(visible=true, transformation(
            origin={-90,90},
            extent={{-10,-10},{10,10}},
            rotation=0)));
      DistrictHeatingNetwork.Sources.SourceMassFlow sourceHot_mflow(
        redeclare model Medium = Medium,
        use_in_m_flow=true,
        use_in_T=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,
        m_flow0=DistrictHeatingNetwork.Data.BPHEData.E701.m_flow_start_hot,
        G=1e-8)                                                             annotation (Placement(transformation(extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-14,60})));
      DistrictHeatingNetwork.Sources.SourceMassFlow sourceCold_mflow(
        redeclare model Medium = Medium,
        use_in_m_flow=true,
        use_in_T=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_cold,
        m_flow0=0.32,
        G=1e-8)       annotation (Placement(transformation(extent={{-10,10},{10,-10}},
            rotation=90,
            origin={9,-48})));
      DistrictHeatingNetwork.Sources.SinkPressure sinkHot_p(
        redeclare model Medium = Medium,
        use_in_p0=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_hot,
        R=1e-3)                                                      annotation (Placement(transformation(extent={{14,50},{34,70}})));
      DistrictHeatingNetwork.Sources.SinkPressure sinkCold_p(
        redeclare model Medium = Medium,
        use_in_p0=false,
        use_in_T0=false,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tout_start_cold,
        R=1e-3)                                                       annotation (Placement(transformation(extent={{9.5,-9.5},{-9.5,9.5}},
            rotation=90,
            origin={-14.5,-48.5})));
      Modelica.Blocks.Sources.TimeTable inhot_T(table=[ts,TT702])   annotation (
        Placement(transformation(extent={{-40,55},{-30,65}})));
      Modelica.Blocks.Sources.TimeTable incold_T(table=[ts,TT703])   annotation (
        Placement(transformation(extent={{40,-49},{30,-39}})));
      Modelica.Blocks.Sources.TimeTable outhot_p(table=[ts,PT701])           annotation (
        Placement(transformation(extent={{35,73},{25,83}})));
      Modelica.Blocks.Sources.TimeTable hot_m_flow(table=[ts,m_flow701])   annotation (
        Placement(transformation(extent={{-40,70},{-30,80}})));
      Modelica.Blocks.Sources.TimeTable cold_m_flow(table=[ts,m_flow703])   annotation (
        Placement(transformation(extent={{40,-64},{30,-54}})));
      Modelica.Blocks.Sources.TimeTable outcold_Tref(table=[ts,TT704])   annotation (
        Placement(transformation(origin={78,-53},   extent={{-50,35},{-40,45}},       rotation = -0)));
      Modelica.Blocks.Sources.TimeTable outhot_Tref(table=[ts,TT701])   annotation (
        Placement(transformation(origin={90,0},      extent={{-50,35},{-40,45}},     rotation = -0)));
      Modelica.Blocks.Math.Add dT_cold_sim(k1=-1) annotation (Placement(transformation(extent={{60,-35},{70,-25}})));
      Modelica.Blocks.Math.Add dT_hot_sim(k1=+1, k2=-1) annotation (Placement(transformation(extent={{60,20},{70,10}})));
      Modelica.Blocks.Math.Add dT_cold_meas(k1=-1) annotation (Placement(transformation(extent={{60,-15},{70,-5}})));
      Modelica.Blocks.Math.Add dT_hot_meas(k1=-1) annotation (Placement(transformation(extent={{60,30},{70,40}})));
      DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_cold_indexes "ASHRAE indexes for delta T cold" annotation (Placement(transformation(extent={{80,-25},{90,-15}})));
      DistrictHeatingNetwork.Utilities.ASHRAEIndex dT_hot_indexes "ASHRAE indexes for delta T hot" annotation (Placement(transformation(extent={{80,20},{90,30}})));
      MultiEnergySystem.TestFacility.Loads.Thermal.Systems.CoolingSingleLoad EX7X1 annotation (Placement(transformation(extent={{-26,-20},{21,27}})));
      Modelica.Blocks.Sources.TimeTable theta(table=[ts,thetaValve])
                                                               annotation (Placement(transformation(extent={{-48,15},{-38,25}})));
      DistrictHeatingNetwork.Sources.SourcePressure sourceHot_P(redeclare model Medium = Medium,
        use_in_p0=true,
        p0=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
        T0=DistrictHeatingNetwork.Data.BPHEData.E701.Tin_start_hot,                              R=1E-3) annotation (Placement(transformation(extent={{-66,33},{-46,53}})));
      Modelica.Blocks.Sources.TimeTable PT7X2_profile(table=[ts,PT702])
        annotation (Placement(transformation(extent={{-76,54},{-64,66}})));
    protected
      final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures, matrixTT701) "dimension of matrix";
      final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, timenoscale, dim[1], dim[2]) "Matrix data";
      final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]);
      final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT702, dim[1], dim[2]);
      final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT703, dim[1], dim[2]);
      final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixTT704, dim[1], dim[2]);
      final parameter Real PT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixPT701, dim[1], dim[2]);
      final parameter Real PT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures, matrixPT702, dim[1], dim[2]);
      final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT701, dim[1], dim[2]);
      final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Flows, matrixFT703, dim[1], dim[2]);
      final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
      final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
      final parameter Real thetaValve[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Actuators, matrixthetaFCV701, dim[1], dim[2]);
    equation
      // Variables
      //   Tout_hot_ref = sinkHot_ref.fluid.T;
      //   Tout_cold_ref = sinkCold_ref.fluid.T;
      //   deltaTouthot = E7X1.Tout_hot  - Tout_hot_ref;
      //   deltaToutcold = E7X1.Tout_cold  - Tout_cold_ref;
      //   deltaThot_ref = E7X1.Tin_hot  - Tout_hot_ref;
      //   deltaTcold_ref = Tout_cold_ref -E7X1.Tin_cold;
      //   deltaThot =E7X1.Tin_hot  -E7X1.Tout_hot;
      //   deltaTcold =E7X1.Tout_cold  -E7X1.Tin_cold;
      //   //deviationHot = abs((deltaThot - deltaThot_ref)./deltaThot_ref)*100;
      //   //deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcold_ref)*100;
      //   deviationHot = abs((deltaThot - deltaThot_ref)/deltaThotmax)*100;
      //   deviationCold = abs((deltaTcold - deltaTcold_ref)./deltaTcoldmax)*100;
      //   LMTD_ref = ((E7X1.Tin_hot - Tout_cold_ref) - (Tout_hot_ref -E7X1.Tin_cold)) /log(abs((E7X1.Tin_hot - Tout_cold_ref)/(Tout_hot_ref -E7X1.Tin_cold)));
      //   gamma_ref = Pthot_ref/(E7X1.hotside.Stot*LMTD_ref);
      //   Ptcold_ref =E7X1.incold.m_flow *abs((sourceCold_mflow.fluid.h - sinkCold_ref.fluid.h));
      //   Pthot_ref =E7X1.inhot.m_flow *abs((sourceHot_mflow.fluid.h - sinkHot_ref.fluid.h));
      // Connections
      connect(outhot_p.y, sinkHot_p.in_p0) annotation (
        Line(points={{24.5,78},{20,78},{20,68.4}},         color = {0, 0, 127}));
      connect(dT_hot_meas.y, dT_hot_indexes.u_meas) annotation (Line(points={{70.5,35},{75,35},{75,27.5},{79,27.5}}, color={0,0,127}));
      connect(EX7X1.TT7X2_TT, dT_hot_sim.u1) annotation (Line(points={{23.35,15.25},{55,15.25},{55,12},{59,12}},                                 color={0,0,127}));
      connect(dT_hot_sim.y, dT_hot_indexes.u_sim) annotation (Line(points={{70.5,15},{75,15},{75,22.5},{79,22.5}}, color={0,0,127}));
      connect(sourceCold_mflow.outlet, EX7X1.incold) annotation (Line(
          points={{9,-38},{9,-23.525},{9.015,-23.525}},
          color={140,56,54},
          thickness=0.5));
      connect(sinkCold_p.inlet, EX7X1.outcold)
        annotation (Line(
          points={{-14.5,-39},{-14.5,-30},{-14,-30},{-14,-23.525},{-14.015,-23.525}},
          color={140,56,54},
          thickness=0.5));
      connect(dT_cold_sim.y, dT_cold_indexes.u_sim) annotation (Line(points={{70.5,-30},{75,-30},{75,-22.5},{79,-22.5}}, color={0,0,127}));
      connect(dT_cold_meas.y, dT_cold_indexes.u_meas) annotation (Line(points={{70.5,-10},{75,-10},{75,-17.5},{79,-17.5}}, color={0,0,127}));
      connect(cold_m_flow.y, sourceCold_mflow.in_m_flow) annotation (Line(points={{29.5,-59},{24,-59},{24,-54},{14,-54}}, color={0,0,127}));
      connect(incold_T.y, sourceCold_mflow.in_T) annotation (Line(points={{29.5,-44},{24,-44},{24,-48},{14,-48}}, color={0,0,127}));
      connect(outcold_Tref.y, dT_cold_meas.u2) annotation (Line(points={{38.5,-13},{59,-13}}, color={0,0,127}));
      connect(dT_cold_meas.u1, sourceCold_mflow.in_T) annotation (Line(points={{59,-7},{41,-7},{41,-36},{24,-36},{24,-48},{14,-48}},                     color={0,0,127}));
      connect(EX7X1.TT7X3_TT, dT_cold_sim.u1) annotation (Line(points={{23.35,10.55},{52,10.55},{52,-27},{59,-27}}, color={0,0,127}));
      connect(EX7X1.TT7X4_TT, dT_cold_sim.u2) annotation (Line(points={{23.35,5.85},{46,5.85},{46,-33},{59,-33}}, color={0,0,127}));
      connect(sourceHot_mflow.outlet, EX7X1.inhot) annotation (Line(
          points={{-14,50},{-14,30.525},{-13.78,30.525}},
          color={140,56,54},
          thickness=0.5));
      connect(theta.y, EX7X1.theta) annotation (Line(points={{-37.5,20},{-32.925,20},{-32.925,19.95},{-28.35,19.95}}, color={0,0,127}));
      connect(inhot_T.y, sourceHot_mflow.in_T) annotation (Line(points={{-29.5,60},{-19,60}}, color={0,0,127}));
      connect(hot_m_flow.y, sourceHot_mflow.in_m_flow) annotation (Line(points={{-29.5,75},{-25,75},{-25,66},{-19,66}}, color={0,0,127}));
      connect(EX7X1.TT7X1_TT, dT_hot_sim.u2) annotation (Line(points={{23.35,19.95},{55,19.95},{55,18},{59,18}}, color={0,0,127}));
      connect(outhot_Tref.y, dT_hot_meas.u1) annotation (Line(points={{50.5,40},{55,40},{55,38},{59,38}}, color={0,0,127}));
      connect(dT_hot_meas.u2, dT_hot_sim.u1) annotation (Line(points={{59,32},{50,32},{50,16},{49,16},{49,15.25},{55,15.25},{55,12},{59,12}}, color={0,0,127}));
      connect(sinkHot_p.inlet, EX7X1.outhot) annotation (Line(
          points={{14,60},{9.485,60},{9.485,30.525}},
          color={140,56,54},
          thickness=0.5));
      connect(PT7X2_profile.y, sourceHot_P.in_p0) annotation (Line(points={{-63.4,60},{-60,60},{-60,51.4}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}},
            grid={1,1})),
        Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
        experiment(StopTime = 3600, Interval = 1, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
        Icon(coordinateSystem(grid={1,1})));
    end EX7X1Test;
  end Loads;

  package Networks
    extends DistrictHeatingNetwork.Icons.Generic.Networks;
    package Centralised
      extends DistrictHeatingNetwork.Icons.Generic.Centralised;
      model CentralisedSystemI_A "Sequence using Gas Boiler as heat source only"
        extends
          MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemI(      FV933_state = false, FCVC01theta = [0, 0; 100, 0], FCVC02theta = [0, 1; 100, 1], FCV901theta = [0, 1; 100, 1], P901omega = [0, 2*3.141592654*30; 100, 2*3.141592654*30], FCV101theta = [0, 1; 100, 1], q_m3h_S9 = 10, P101qm3h = [0, 10; 100, 10], q_m3h_S1 = 10, FCV701theta = [0, 1; 100, 1], FCV711theta = [0, 1; 100, 1], FCV721theta = [0, 1; 100, 1], FCV731theta = [0, 1; 100, 1], TCV701theta = [0, 1; 100, 1], TCV711theta = [0, 1; 100, 1], TCV721theta = [0, 1; 100, 1], TCV731theta = [0, 1; 100, 1], FCVR01theta = [0, 0.2; 100, 0.2], PR01omega = [0, 2*Modelica.Constants.pi*50; 100, 2*Modelica.Constants.pi*50], ToutcoolSP = [0, 15; 100, 15]);
        Modelica.Blocks.Sources.TimeTable FCV901_theta(table = FCV901theta) annotation (
          Placement(transformation(extent = {{-714, 93}, {-734, 113}})));
        DistrictHeatingNetwork.Sources.PumpInput P901_input(useOmega = true, omega = P901omega, q_m3h = P901qm3h) annotation (
          Placement(transformation(extent = {{-714, 54}, {-734, 75}})));
        Modelica.Blocks.Sources.TimeTable FCVC01_theta(table = FCVC01theta) annotation (
          Placement(transformation(extent = {{300, 289}, {280, 309}})));
        Modelica.Blocks.Sources.TimeTable FCVC02_theta(table = FCVC02theta) annotation (
          Placement(transformation(extent = {{740, 289}, {720, 309}})));
        Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k = FV933_state) annotation (
          Placement(transformation(extent = {{-189, 15}, {-209, 35}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table = FCV101theta) annotation (
          Placement(transformation(extent = {{-200, -150}, {-220, -130}})));
        DistrictHeatingNetwork.Sources.PumpInput P101_input(useOmega = false, omega = P101omega, q_m3h = P101qm3h) annotation (
          Placement(transformation(extent = {{-200, -191}, {-220, -170}})));
        Modelica.Blocks.Sources.TimeTable FCV701_theta(table = FCV701theta) annotation (
          Placement(transformation(extent = {{179, -160}, {159, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV711_theta(table = FCV711theta) annotation (
          Placement(transformation(extent = {{479, -160}, {459, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV731_theta(table = FCV731theta) annotation (
          Placement(transformation(extent = {{340, -160}, {320, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV721_theta(table = FCV721theta) annotation (
          Placement(transformation(extent = {{639, -160}, {619, -140}})));
        Modelica.Blocks.Sources.TimeTable TCV701_theta(table = TCV701theta) annotation (
          Placement(transformation(extent = {{60, -330}, {80, -310}})));
        Modelica.Blocks.Sources.TimeTable TCV731_theta(table = TCV731theta) annotation (
          Placement(transformation(extent = {{220, -330}, {240, -310}})));
        Modelica.Blocks.Sources.TimeTable TCV711_theta(table = TCV711theta) annotation (
          Placement(transformation(extent = {{359, -330}, {379, -310}})));
        Modelica.Blocks.Sources.TimeTable TCV721_theta(table = TCV721theta) annotation (
          Placement(transformation(extent = {{519, -330}, {539, -310}})));
        Modelica.Blocks.Sources.TimeTable FCVR01_theta(table = FCVR01theta) annotation (
          Placement(transformation(extent = {{799, -340}, {779, -320}})));
        Modelica.Blocks.Sources.TimeTable PR01_omega(table = PR01omega) annotation (
          Placement(transformation(extent = {{660, -218}, {680, -198}})));
        Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table = ToutcoolSP) "Temperature in Celsius degrees" annotation (
          Placement(transformation(extent = {{728, -70}, {748, -50}})));
        Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table = GB101_ToutSP) annotation (
          Placement(transformation(extent = {{-318, -310}, {-298, -290}})));
      equation
        connect(FCV901_theta.y, FCV901.opening) annotation (
          Line(points = {{-735, 103}, {-742, 103}, {-742, 115}, {-749, 115}}, color = {0, 0, 127}));
        connect(P901_input.y, P901.in_omega) annotation (
          Line(points = {{-735, 64.5}, {-743.5, 64.5}, {-743.5, 66.3}, {-747.25, 66.3}}, color = {0, 0, 127}));
        connect(FCVC01_theta.y, FCVC01.opening) annotation (
          Line(points = {{279, 299}, {268, 299}, {268, 235}, {258, 235}}, color = {0, 0, 127}));
        connect(FCVC02_theta.y, FCVC02.opening) annotation (
          Line(points = {{719, 299}, {710, 299}, {710, 234}, {698, 234}, {698, 235}}, color = {0, 0, 127}));
        connect(FV933_OnOff.y, FV933.u) annotation (
          Line(points = {{-210, 25}, {-214, 25}, {-214, 46.6}, {-218, 46.6}}, color = {255, 0, 255}));
        connect(FCV101_theta.y, FCV101.opening) annotation (
          Line(points = {{-221, -140}, {-232, -140}}, color = {0, 0, 127}));
        connect(P101_input.y, P101.in_m_flow) annotation (
          Line(points = {{-221, -180.5}, {-234.48, -180.5}, {-234.48, -179.8}}, color = {0, 0, 127}));
        connect(FCV701_theta.y, FCV701.opening) annotation (
          Line(points = {{158, -150}, {146, -150}}, color = {0, 0, 127}));
        connect(FCV711_theta.y, FCV711.opening) annotation (
          Line(points = {{458, -150}, {446, -150}}, color = {0, 0, 127}));
        connect(FCV731_theta.y, FCV731.opening) annotation (
          Line(points = {{319, -150}, {306, -150}}, color = {0, 0, 127}));
        connect(FCV721_theta.y, FCV721.opening) annotation (
          Line(points = {{618, -150}, {606, -150}}, color = {0, 0, 127}));
        connect(TCV701_theta.y, TCV701.opening) annotation (
          Line(points = {{81, -320}, {90, -320}}, color = {0, 0, 127}));
        connect(TCV731_theta.y, TCV731.opening) annotation (
          Line(points = {{241, -320}, {250, -320}}, color = {0, 0, 127}));
        connect(TCV711_theta.y, TCV711.opening) annotation (
          Line(points = {{380, -320}, {390, -320}}, color = {0, 0, 127}));
        connect(TCV721_theta.y, TCV721.opening) annotation (
          Line(points = {{540, -320}, {549.1, -320}}, color = {0, 0, 127}));
        connect(FCVR01_theta.y, FCVR01.opening) annotation (
          Line(points = {{778, -330}, {766, -330}, {766, -352}}, color = {0, 0, 127}));
        connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (
          Line(points = {{749, -60}, {767.5, -60}, {767.5, -97.2}}, color = {0, 0, 127}));
        connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (
          Line(points={{-297,-300},{-297,-301},{-281.5,-301}},      color = {0, 0, 127}));
        connect(PR01_omega.y, PR01.in_omega) annotation (
          Line(points = {{681, -208}, {689.25, -208}, {689.25, -207.8}, {697.5, -207.8}}, color = {0, 0, 127}));
      end CentralisedSystemI_A;

      model CentralisedSystemI_B
        extends CentralisedSystemI_A(VER901(T0 = 15 + 273.15), FV933_state = false, P901omega = [0, 2*3.141592654*40; 500, 2*3.141592654*40], pin_start_rCD_cold = 2.2e5, VE901(p0(displayUnit = "Pa") = 220000), P101qm3h = [0, 14; 100, 14], Tin_start_S1 = 70 + 273.15, Tout_start_S1 = 80 + 273.15, FCV101theta = [0, 1; 100, 1], FCVC01theta = [0, 0; 100, 0], FCVC02theta = [0, 0; 100, 0], FCV701theta = [0, 1; 100, 1], FCV711theta = [0, 1; 100, 1], FCV721theta = [0, 1; 100, 1], FCV731theta = [0, 1; 100, 1], FCVR01theta = [0, 0.2; 8000, 0.2; 8000, 0.5; 10000, 0.5], GB101(Pmaxnom = 147.6e3*0.79), ToutcoolSP = [0, 25.5; 500, 25.5; 500, 12; 1000, 12]);
        // System 400
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
        parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
        parameter Real q_m3h_S4 = 5;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
        parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
        parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
        parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
        parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
        parameter Boolean FV401_state = true;
        parameter Boolean FV402_state = true;
        parameter Boolean FV401_startValue = true;
        parameter Boolean FV402_startValue = true;
        parameter Real FV401_s[:] = {1e6};
        parameter Real FV402_s[:] = {1e6};
        DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
          Placement(visible = true, transformation(origin = {-342, -302}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-322, -175})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -140})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -236})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -238})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -112})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-320, -74})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
          Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-320, -86})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -118})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -106})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
          Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-365, -195})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -166})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -54})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-362, -20})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -20})));
        Modelica.Blocks.Sources.TimeTable FCV401_theta(table = FCV401theta) annotation (
          Placement(transformation(extent = {{-288, -150}, {-308, -130}})));
        DistrictHeatingNetwork.Sources.PumpInput P401_input(useOmega = false, omega = P401omega, q_m3h = P401qm3h) annotation (
          Placement(transformation(extent = {{-288, -191}, {-308, -170}})));
        Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table = EB401_ToutSP) annotation (
          Placement(transformation(extent = {{-408, -310}, {-388, -290}})));
        Modelica.Blocks.Sources.BooleanTable FV401_Status(table = FV401_s, startValue = FV401_startValue) "Input for the status (open/close) of valve FV401" annotation (
          Placement(transformation(extent = {{-394, -30}, {-374, -10}})));
        Modelica.Blocks.Sources.BooleanTable FV402_Status(table = FV402_s, startValue = FV402_startValue) "Input for the status (open/close) of valve FV402" annotation (
          Placement(transformation(extent = {{-290, -30}, {-310, -10}})));
      equation
        connect(P401.inlet, PL3_S401.outlet) annotation (
          Line(points = {{-322, -184.6}, {-322, -226}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV401.inlet, P401.outlet) annotation (
          Line(points = {{-322, -150}, {-322, -165.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT402.inlet, PT402.inlet) annotation (
          Line(points = {{-322.4, -74}, {-322.4, -86}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL4_S401.inlet, FCV401.outlet) annotation (
          Line(points = {{-322, -122}, {-322, -130}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT402.inlet, PL4_S401.outlet) annotation (
          Line(points = {{-322.4, -86}, {-322.4, -95}, {-322, -95}, {-322, -102}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT401.outlet, PL2_S401.inlet) annotation (
          Line(points = {{-362.2, -199.2}, {-362.2, -207.6}, {-362, -207.6}, {-362, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL1_S401.outlet, FT401.inlet) annotation (
          Line(points = {{-362, -176}, {-362, -183.4}, {-362.2, -183.4}, {-362.2, -190.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL1_S401.inlet, PT401.inlet) annotation (
          Line(points = {{-362, -156}, {-362, -118}, {-361.6, -118}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT401.inlet, TT401.inlet) annotation (
          Line(points = {{-361.6, -118}, {-361.6, -106}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL2_S401.outlet, EB401.inlet) annotation (
          Line(points = {{-362, -248}, {-362, -258}, {-352.2, -258}, {-352.2, -274.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(EB401.outlet, PL3_S401.inlet) annotation (
          Line(points = {{-331.8, -274.8}, {-331.8, -258}, {-322, -258}, {-322, -246}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
          Line(points = {{-322.4, -74}, {-322, -74}, {-322, -62}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
          Line(points = {{-361.6, -106}, {-362, -106}, {-362, -64}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
          Line(points = {{-362, -44}, {-362, -30}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
          Line(points = {{-322, -42}, {-322, -30}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
          Line(points = {{-362, -10}, {-362, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
          Line(points = {{-322, -10}, {-322, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV401_theta.y, FCV401.opening) annotation (
          Line(points = {{-309, -140}, {-314, -140}}, color = {0, 0, 127}));
        connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (
          Line(points={{-387,-300},{-387,-302},{-365.8,-302}},        color = {0, 0, 127}));
        connect(FV401_Status.y, FV401.u) annotation (
          Line(points = {{-373, -20}, {-365.2, -20}}, color = {255, 0, 255}));
        connect(FV402_Status.y, FV402.u) annotation (
          Line(points = {{-311, -20}, {-318.8, -20}}, color = {255, 0, 255}));
        connect(P401_input.y, P401.in_m_flow) annotation (
          Line(points = {{-309, -180.5}, {-316.48, -180.5}, {-316.48, -179.8}}, color = {0, 0, 127}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 12000, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemI_B;

      model CentralisedSystemI_C "Gas Boiler & Heat Storage Systems included in the model"
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
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 2.5e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 6;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
        parameter Real P201omega[:, :] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
        parameter Real P201qm3h[:, :] = [0, 14.5; 100, 14.5];
        parameter Real FCV201theta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H = 4, n = 4, D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
          Placement(transformation(extent = {{-758, -476}, {-814, -364}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(pout_start(displayUnit = "Pa") = 3e5, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P201.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P201.a, b = DistrictHeatingNetwork.Data.PumpData.P201.b, m_flow_start = m_flow_S2, dpnom = DistrictHeatingNetwork.Data.PumpData.P201.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P201.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P201.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P201.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P201.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P201.omeganom, pin_start(displayUnit = "Pa") = 1.8400803e5, headnom = DistrictHeatingNetwork.Data.PumpData.P201.headnom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom, headmax = DistrictHeatingNetwork.Data.PumpData.P201.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P201.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin = {-790, -208})));
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H = 4, n = 4, D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
          Placement(transformation(extent = {{-696, -476}, {-640, -364}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start = Tin_start_S2, p_start = pin_start_S2) "Temperature sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-791.75, -66.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-792, -86.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-790, -108})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-850, -198})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(L = L_S2_PL3, t = L_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-850, -168})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(L = L_S2_PL2, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-790, -240})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(L = L_S2_PL4, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-850, -228})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start = Tout_start_S2, p_start = pout_start_S2) "Temperature sensor at the outlet of System 200" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-748, -68})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-748, -138})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(L = L_S2_PL9, t = t_S2, pin_start = pout_start_S2, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-750, -48})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-710, -412})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(L = L_S2_PL0, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-790, -48})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-744, -412})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-726, -440})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-726, -456})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(L = L_S2_PL6, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-818, -490})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(L = L_S2_D201_FT201, h = h_S2_D201_FT201, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-830, -440})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-790, -170})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-820, -128})));
        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k = FV202_state) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-820, -116})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-820, -110})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-790, -148})));
        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k = FV201_state) annotation (
          Placement(transformation(extent = {{-808, -154}, {-796, -142}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status annotation (
          Placement(transformation(extent = {{-798, -158}, {-818, -138}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {-770, -186})));
        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k = FV206_state) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 270, origin = {-770, -172})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-770, -166})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-790, -268})));
        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k = FV209_state) annotation (
          Placement(transformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = 0, origin = {-802.5, -268})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-808, -268})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin = {-770, -254})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(Kv = DistrictHeatingNetwork.Data.ValveData.FCV201.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {-750, -218})));
        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k = FV203_state) annotation (
          Placement(transformation(extent = {{-730, -224}, {-741, -212}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status annotation (
          Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 0, origin = {-728, -218})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start = Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{-7, 7}, {7, -7}}, rotation = 90, origin = {-747, -279})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k = FV207_state) annotation (
          Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {-770, -264})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
          Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = -90, origin = {-770, -268})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table = FCV201theta) annotation (
          Placement(transformation(extent = {{-884, -208}, {-864, -188}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(useOmega = false, omega = P201omega, q_m3h = P201qm3h) annotation (
          Placement(transformation(extent = {{-830, -214}, {-810, -194}})));
      equation
        connect(PT201.inlet, TT201.inlet) annotation (
          Line(points = {{-790, -86.5}, {-790, -77.625}, {-789.85, -77.625}, {-789.85, -66.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (
          Line(points = {{-790, -98}, {-790, -86.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (
          Line(points = {{-790, -217.6}, {-790, -230}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT202.inlet, PT202.inlet) annotation (
          Line(points = {{-750.4, -68}, {-750.4, -138}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (
          Line(points = {{-750, -58}, {-750, -68}, {-750.4, -68}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (
          Line(points = {{-790, -58}, {-790, -69.375}, {-789.85, -69.375}, {-789.85, -66.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(D201.outlet, PL_S200_D201_High.inlet) annotation (
          Line(points = {{-758, -385}, {-744, -385}, {-744, -402}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
          Line(points = {{-716, -440}, {-710, -440}, {-710, -422}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
          Line(points = {{-736, -440}, {-744, -440}, {-744, -422}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D202_High.inlet, D202.outlet) annotation (
          Line(points = {{-710, -402}, {-710, -385}, {-696, -385}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (
          Line(points = {{-736, -456}, {-752, -456}, {-752, -455}, {-758, -455}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (
          Line(points = {{-716, -456}, {-712, -456}, {-712, -455}, {-696, -455}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (
          Line(points = {{-808, -490}, {-744, -490}, {-744, -455}, {-758, -455}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (
          Line(points = {{-850, -218}, {-850, -208}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (
          Line(points = {{-850, -188}, {-850, -178}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (
          Line(points = {{-790, -180}, {-790, -198.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (
          Line(points = {{-850, -158}, {-850, -128}, {-826, -128}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (
          Line(points = {{-790, -118}, {-790, -142}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (
          Line(points = {{-790, -154}, {-790, -160}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV202.outlet, FV201.inlet) annotation (
          Line(points = {{-814, -128}, {-790, -128}, {-790, -142}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.outlet, P201.inlet) annotation (
          Line(points = {{-776, -186}, {-790, -186}, {-790, -198.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (
          Line(points = {{-790, -250}, {-790, -262}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.inlet, FV209.inlet) annotation (
          Line(points = {{-776, -254}, {-790, -254}, {-790, -262}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.outlet, FV203.inlet) annotation (
          Line(points = {{-764, -254}, {-750, -254}, {-750, -224}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.inlet, FV203.outlet) annotation (
          Line(points = {{-764, -186}, {-750, -186}, {-750, -212}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT202.inlet, FV203.outlet) annotation (
          Line(points = {{-750.4, -138}, {-750, -138}, {-750, -212}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT201.outlet, FV203.inlet) annotation (
          Line(points = {{-749.8, -274.8}, {-750, -254}, {-750, -224}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201_theta.y, FCV201.opening) annotation (
          Line(points = {{-863, -198}, {-858, -198}}, color = {0, 0, 127}));
        connect(FV207.u, FV207_Status.activePort) annotation (
          Line(points = {{-770, -255.92}, {-770, -258.8}}, color = {255, 0, 255}));
        connect(FV207_OnOff.y, FV207_Status.activePort) annotation (
          Line(points = {{-770, -259.6}, {-770, -258.8}}, color = {255, 0, 255}));
        connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-850, -238}, {-850, -490}, {-828, -490}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (
          Line(points = {{-790, -38}, {-790, -18}, {-702, -18}, {-702, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (
          Line(points = {{-750, -38}, {-750, -32}, {-688, -32}, {-688, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206_OnOff.y, FV206_Status.activePort) annotation (
          Line(points = {{-770, -178.6}, {-770, -177.5}}, color = {255, 0, 255}));
        connect(FV206_OnOff.y, FV206.u) annotation (
          Line(points = {{-770, -178.6}, {-770, -184.08}}, color = {255, 0, 255}));
        connect(FV203_OnOff.y, FV203.u) annotation (
          Line(points = {{-741.55, -218}, {-748.08, -218}}, color = {255, 0, 255}));
        connect(FV203_OnOff.y, FV203_Status.activePort) annotation (
          Line(points = {{-741.55, -218}, {-741.8, -218}}, color = {255, 0, 255}));
        connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (
          Line(points = {{-840, -440}, {-844, -440}, {-844, -350}, {-749.8, -350}, {-749.8, -283.2}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (
          Line(points = {{-820, -440}, {-744, -440}, {-744, -422}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-790, -274}, {-790, -330}, {-850, -330}, {-850, -490}, {-828, -490}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV201_OnOff.y, FV201.u) annotation (
          Line(points = {{-795.4, -148}, {-791.92, -148}}, color = {255, 0, 255}));
        connect(FV201_OnOff.y, FV201_Status.activePort) annotation (
          Line(points = {{-795.4, -148}, {-796.5, -148}}, color = {255, 0, 255}));
        connect(FV202_OnOff.y, FV202.u) annotation (
          Line(points = {{-820, -122.6}, {-820, -126.08}}, color = {255, 0, 255}));
        connect(FV202_OnOff.y, FV202_Status.activePort) annotation (
          Line(points = {{-820, -122.6}, {-820, -121.5}}, color = {255, 0, 255}));
        connect(FV209_OnOff.y, FV209.u) annotation (
          Line(points = {{-796.45, -268}, {-791.92, -268}}, color = {255, 0, 255}));
        connect(FV209_OnOff.y, FV209_Status.activePort) annotation (
          Line(points = {{-796.45, -268}, {-796.5, -268}}, color = {255, 0, 255}));
        connect(P201_input.y, P201.in_m_flow) annotation (
          Line(points = {{-809, -204}, {-802.26, -204}, {-802.26, -203.2}, {-795.52, -203.2}}, color = {0, 0, 127}));
        annotation (
          experiment(StopTime = 50, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemI_C;

      model CentralisedSystemI_D "Gas Boiler, Electric Boiler & Water Tanks"
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
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 2.5e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 60 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 6;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
        parameter Real P201omega[:, :] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
        parameter Real P201qm3h[:, :] = [0, 14.5; 100, 14.5];
        parameter Real FCV201theta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H = 4, n = 4, D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
          Placement(transformation(extent = {{-762, -480}, {-818, -368}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(pout_start(displayUnit = "Pa") = 3e5, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P201.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P201.a, b = DistrictHeatingNetwork.Data.PumpData.P201.b, m_flow_start = m_flow_S2, dpnom = DistrictHeatingNetwork.Data.PumpData.P201.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P201.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P201.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P201.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P201.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P201.omeganom, pin_start(displayUnit = "Pa") = 1.8400803e5, headnom = DistrictHeatingNetwork.Data.PumpData.P201.headnom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom, headmax = DistrictHeatingNetwork.Data.PumpData.P201.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P201.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin = {-794, -212})));
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H = 4, n = 4, D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
          Placement(transformation(extent = {{-700, -480}, {-644, -368}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start = Tin_start_S2, p_start = pin_start_S2) "Temperature sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-795.75, -70.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-796, -90.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -112})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-854, -202})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(L = L_S2_PL3, t = L_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-854, -172})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(L = L_S2_PL2, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -244})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(L = L_S2_PL4, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-854, -232})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start = Tout_start_S2, p_start = pout_start_S2) "Temperature sensor at the outlet of System 200" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-752, -72})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-752, -142})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(L = L_S2_PL9, t = t_S2, pin_start = pout_start_S2, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-754, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-714, -416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(L = L_S2_PL0, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-748, -416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-730, -444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-730, -460})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(L = L_S2_PL6, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-822, -494})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(L = L_S2_D201_FT201, h = h_S2_D201_FT201, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-834, -444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -174})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-824, -132})));
        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k = FV202_state) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-824, -120})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-824, -114})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-794, -152})));
        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k = FV201_state) annotation (
          Placement(transformation(extent = {{-812, -158}, {-800, -146}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status annotation (
          Placement(transformation(extent = {{-802, -162}, {-822, -142}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {-774, -190})));
        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k = FV206_state) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 270, origin = {-774, -176})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-774, -170})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-794, -272})));
        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k = FV209_state) annotation (
          Placement(transformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = 0, origin = {-806.5, -272})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-812, -272})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin = {-774, -258})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(Kv = DistrictHeatingNetwork.Data.ValveData.FCV201.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {-754, -222})));
        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k = FV203_state) annotation (
          Placement(transformation(extent = {{-734, -228}, {-745, -216}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status annotation (
          Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 0, origin = {-732, -222})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start = Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{-7, 7}, {7, -7}}, rotation = 90, origin = {-751, -283})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k = FV207_state) annotation (
          Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {-774, -268})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
          Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = -90, origin = {-774, -272})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table = FCV201theta) annotation (
          Placement(transformation(extent = {{-888, -212}, {-868, -192}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(useOmega = false, omega = P201omega, q_m3h = P201qm3h) annotation (
          Placement(transformation(extent = {{-834, -218}, {-814, -198}})));
      equation
        connect(PT201.inlet, TT201.inlet) annotation (
          Line(points = {{-794, -90.5}, {-794, -81.625}, {-793.85, -81.625}, {-793.85, -70.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (
          Line(points = {{-794, -102}, {-794, -90.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (
          Line(points = {{-794, -221.6}, {-794, -234}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT202.inlet, PT202.inlet) annotation (
          Line(points = {{-754.4, -72}, {-754.4, -142}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (
          Line(points = {{-754, -62}, {-754, -72}, {-754.4, -72}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (
          Line(points = {{-794, -62}, {-794, -73.375}, {-793.85, -73.375}, {-793.85, -70.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(D201.outlet, PL_S200_D201_High.inlet) annotation (
          Line(points = {{-762, -389}, {-748, -389}, {-748, -406}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
          Line(points = {{-720, -444}, {-714, -444}, {-714, -426}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
          Line(points = {{-740, -444}, {-748, -444}, {-748, -426}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D202_High.inlet, D202.outlet) annotation (
          Line(points = {{-714, -406}, {-714, -389}, {-700, -389}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (
          Line(points = {{-740, -460}, {-756, -460}, {-756, -459}, {-762, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (
          Line(points = {{-720, -460}, {-716, -460}, {-716, -459}, {-700, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (
          Line(points = {{-812, -494}, {-748, -494}, {-748, -459}, {-762, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (
          Line(points = {{-854, -222}, {-854, -212}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (
          Line(points = {{-854, -192}, {-854, -182}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (
          Line(points = {{-794, -184}, {-794, -202.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (
          Line(points = {{-854, -162}, {-854, -132}, {-830, -132}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (
          Line(points = {{-794, -122}, {-794, -146}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (
          Line(points = {{-794, -158}, {-794, -164}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV202.outlet, FV201.inlet) annotation (
          Line(points = {{-818, -132}, {-794, -132}, {-794, -146}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.outlet, P201.inlet) annotation (
          Line(points = {{-780, -190}, {-794, -190}, {-794, -202.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (
          Line(points = {{-794, -254}, {-794, -266}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.inlet, FV209.inlet) annotation (
          Line(points = {{-780, -258}, {-794, -258}, {-794, -266}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.outlet, FV203.inlet) annotation (
          Line(points = {{-768, -258}, {-754, -258}, {-754, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.inlet, FV203.outlet) annotation (
          Line(points = {{-768, -190}, {-754, -190}, {-754, -216}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT202.inlet, FV203.outlet) annotation (
          Line(points = {{-754.4, -142}, {-754, -142}, {-754, -216}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT201.outlet, FV203.inlet) annotation (
          Line(points = {{-753.8, -278.8}, {-754, -258}, {-754, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201_theta.y, FCV201.opening) annotation (
          Line(points = {{-867, -202}, {-862, -202}}, color = {0, 0, 127}));
        connect(FV207.u, FV207_Status.activePort) annotation (
          Line(points = {{-774, -259.92}, {-774, -262.8}}, color = {255, 0, 255}));
        connect(FV207_OnOff.y, FV207_Status.activePort) annotation (
          Line(points = {{-774, -263.6}, {-774, -262.8}}, color = {255, 0, 255}));
        connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-854, -242}, {-854, -494}, {-832, -494}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206_OnOff.y, FV206_Status.activePort) annotation (
          Line(points = {{-774, -182.6}, {-774, -181.5}}, color = {255, 0, 255}));
        connect(FV206_OnOff.y, FV206.u) annotation (
          Line(points = {{-774, -182.6}, {-774, -188.08}}, color = {255, 0, 255}));
        connect(FV203_OnOff.y, FV203.u) annotation (
          Line(points = {{-745.55, -222}, {-752.08, -222}}, color = {255, 0, 255}));
        connect(FV203_OnOff.y, FV203_Status.activePort) annotation (
          Line(points = {{-745.55, -222}, {-745.8, -222}}, color = {255, 0, 255}));
        connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (
          Line(points = {{-844, -444}, {-848, -444}, {-848, -354}, {-753.8, -354}, {-753.8, -287.2}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (
          Line(points = {{-824, -444}, {-748, -444}, {-748, -426}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-794, -278}, {-794, -334}, {-854, -334}, {-854, -494}, {-832, -494}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV201_OnOff.y, FV201.u) annotation (
          Line(points = {{-799.4, -152}, {-795.92, -152}}, color = {255, 0, 255}));
        connect(FV201_OnOff.y, FV201_Status.activePort) annotation (
          Line(points = {{-799.4, -152}, {-800.5, -152}}, color = {255, 0, 255}));
        connect(FV202_OnOff.y, FV202.u) annotation (
          Line(points = {{-824, -126.6}, {-824, -130.08}}, color = {255, 0, 255}));
        connect(FV202_OnOff.y, FV202_Status.activePort) annotation (
          Line(points = {{-824, -126.6}, {-824, -125.5}}, color = {255, 0, 255}));
        connect(FV209_OnOff.y, FV209.u) annotation (
          Line(points = {{-800.45, -272}, {-795.92, -272}}, color = {255, 0, 255}));
        connect(FV209_OnOff.y, FV209_Status.activePort) annotation (
          Line(points = {{-800.45, -272}, {-800.5, -272}}, color = {255, 0, 255}));
        connect(P201_input.y, P201.in_m_flow) annotation (
          Line(points = {{-813, -208}, {-806.26, -208}, {-806.26, -207.2}, {-799.52, -207.2}}, color = {0, 0, 127}));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (
          Line(points = {{-794, -42}, {-796, -42}, {-796, -8}, {-708, -8}, {-708, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (
          Line(points = {{-754, -42}, {-754, -14}, {-700, -14}, {-700, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
        annotation (
          experiment(StopTime = 86400, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemI_D;

      model CentralisedSystemI_E "Gas & Electric Boiler, Water Tanks & CHP"
        extends CentralisedSystemI_D;
        // S500
        // General Pipeline Data
        parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
        parameter Real q_m3h_S5_Source = 4;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
        parameter Real q_m3h_S5_User = 6;
        parameter Real P501omega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real P501qm3h[:, :] = [0, 2; 100, 2];
        parameter Real Pchpomega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real Pchpqm3h[:, :] = [0, 1; 100, 1];
        parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15;
        parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];
        parameter Real FCVchptheta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
        DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(Di_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold, Di_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot, L_cold = DistrictHeatingNetwork.Data.BPHEData.E501.L_cold, L_hot = DistrictHeatingNetwork.Data.BPHEData.E501.L_hot, MWall = DistrictHeatingNetwork.Data.BPHEData.E501.MWall, Stot_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold, Stot_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot, Tin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold, Tin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot, Tout_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold, Tout_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot, cpm_cold = DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold, cpm_hot = DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot, t_cold = DistrictHeatingNetwork.Data.BPHEData.E501.t_cold, t_hot = DistrictHeatingNetwork.Data.BPHEData.E501.t_hot, gamma_nom_cold = DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold, gamma_nom_hot = DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot, h_cold = DistrictHeatingNetwork.Data.BPHEData.E501.h_cold, h_hot = DistrictHeatingNetwork.Data.BPHEData.E501.h_hot, hctype_cold = hctype, hctype_hot = hctype, hin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold, hin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot, k_cold = DistrictHeatingNetwork.Data.BPHEData.E501.k_cold, k_hot = DistrictHeatingNetwork.Data.BPHEData.E501.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold, lambdam_hot = DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot, m_flow_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold, m_flow_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot, n = 5, nPipes_cold = DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold, nPipes_hot = DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot, nPlates = DistrictHeatingNetwork.Data.BPHEData.E501.nPlates, pin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold, pin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot, pout_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold, pout_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot, rho_nom_cold = (DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2, rho_nom_hot = (DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold, rhom_hot(displayUnit = "g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot, thermalInertia = false, u_nom_cold = DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold, u_nom_hot = DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
          Placement(visible = true, transformation(origin = {-632, -195}, extent = {{-17, -28.0002}, {17, 28.0001}}, rotation = -90)));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(Tin_start(displayUnit = "K") = Tout_User_start_S5, Tout_start(displayUnit = "K") = Tout_User_start_S5, a = DistrictHeatingNetwork.Data.PumpData.P501.a, b = DistrictHeatingNetwork.Data.PumpData.P501.b, m_flow_start = m_flow_User_S5, dpnom = DistrictHeatingNetwork.Data.PumpData.P501.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P501.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P501.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P501.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P501.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P501.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P501.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P501.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P501.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-612, -145})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_Source, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-652, -243})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.04e5, Tin_start = Tout_User_start_S5, Tout_start = Tout_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_Source, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-612, -243})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90, origin = {-654.5, -219.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = -90, origin = {-609, -219})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.04e5, Tin_start = Tout_User_start_S5, Tout_start = Tout_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-612, -67})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i = 51e-3, D_o = Di_S5) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-612, -36})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-652, -67})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i = 51e-3, D_o = Di_S5) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-652, -36})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
          Placement(transformation(extent = {{-5.5, 5.5}, {5.5, -5.5}}, rotation = 90, origin = {-609.5, -85.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start = Tout_User_start_S5) annotation (
          Placement(transformation(extent = {{-5.5, 5.5}, {5.5, -5.5}}, rotation = 90, origin = {-609.5, -116.5})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-655, -155})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
          Placement(transformation(extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 90, origin = {-654.5, -86.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 90, origin = {-654.5, -105.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-652, -127})));
        DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP annotation (
          Placement(transformation(extent = {{-652, -334}, {-610, -292}})));
        Modelica.Blocks.Sources.TimeTable Pe_CHP(table = PeCHP) annotation (
          Placement(transformation(extent = {{-690, -306}, {-670, -286}})));
        DistrictHeatingNetwork.Sources.PumpInput P501_input(useOmega = false, omega = P501omega, q_m3h = P501qm3h) annotation (
          Placement(transformation(extent = {{-576, -161}, {-596, -140}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P1(Tin_start(displayUnit = "K") = Tout_User_start_S5, Tout_start(displayUnit = "K") = Tout_User_start_S5, a = DistrictHeatingNetwork.Data.PumpData.P501.a, b = DistrictHeatingNetwork.Data.PumpData.P501.b, m_flow_start = m_flow_User_S5, dpnom = DistrictHeatingNetwork.Data.PumpData.P501.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P501.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P501.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P501.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P501.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P501.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P501.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P501.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P501.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-582, -297})));
        DistrictHeatingNetwork.Sources.PumpInput PCHP_input(useOmega = false, omega = Pchpomega, q_m3h = Pchpqm3h) annotation (
          Placement(transformation(extent = {{-548, -311}, {-568, -290}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV1(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-582, -270})));
        Modelica.Blocks.Sources.TimeTable FCVchp_theta(table = FCVchptheta) annotation (
          Placement(transformation(extent = {{-548, -280}, {-568, -260}})));
        DistrictHeatingNetwork.Sources.SinkPressure sinkCHP(T0(displayUnit = "K") = 15 + 273.15, p0 = 210000, R = 0) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-685, -269})));
      equation
        connect(S5_PL_CHP_EX501_cold.inlet, E501.outhot) annotation (
          Line(points = {{-652, -233}, {-652, -203.5}, {-651.6, -203.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold.inlet, TT503.inlet) annotation (
          Line(points = {{-652, -233}, {-652, -225.25}, {-651.5, -225.25}, {-651.5, -219.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot.outlet, TT504.inlet) annotation (
          Line(points = {{-612, -233}, {-612, -225.25}, {-611.8, -225.25}, {-611.8, -219}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT504.inlet, E501.inhot) annotation (
          Line(points = {{-611.8, -219}, {-611.8, -218.25}, {-612.4, -218.25}, {-612.4, -203.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot1.outlet, suddenAreaChange.outlet) annotation (
          Line(points = {{-612, -57}, {-612, -46}}, color = {140, 56, 54}, thickness = 0.5));
        connect(suddenAreaChange1.outlet, S5_PL_CHP_EX501_cold1.inlet) annotation (
          Line(points = {{-652, -46}, {-652, -57}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot1.inlet, PT502.inlet) annotation (
          Line(points = {{-612, -77}, {-612, -82.25}, {-611.7, -82.25}, {-611.7, -85.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT502.inlet, TT502.inlet) annotation (
          Line(points = {{-611.7, -85.5}, {-611.7, -116.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT502.inlet, P501.outlet) annotation (
          Line(points = {{-611.7, -116.5}, {-611.7, -100.95}, {-612, -100.95}, {-612, -135.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT501.outlet, E501.incold) annotation (
          Line(points = {{-652.2, -159.2}, {-652.2, -172.85}, {-651.6, -172.85}, {-651.6, -186.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold1.outlet, PT501.inlet) annotation (
          Line(points = {{-652, -77}, {-652, -81.75}, {-652.3, -81.75}, {-652.3, -86.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT501.inlet, TT501.inlet) annotation (
          Line(points = {{-652.3, -86.5}, {-652.3, -105.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT501.inlet, S5_PL_CHP_EX501_cold2.outlet) annotation (
          Line(points = {{-652.2, -150.8}, {-652.2, -143.9}, {-652, -143.9}, {-652, -137}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT501.inlet, S5_PL_CHP_EX501_cold2.inlet) annotation (
          Line(points = {{-652.3, -105.5}, {-652.3, -111.25}, {-652, -111.25}, {-652, -117}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P501.inlet, E501.outcold) annotation (
          Line(points = {{-612, -154.6}, {-612, -165.55}, {-612.4, -165.55}, {-612.4, -186.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (
          Line(points = {{-652, -253}, {-652, -284}, {-660, -284}, {-660, -313}, {-652, -313}}, color = {140, 56, 54}, thickness = 0.5));
        connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
          Line(points = {{-652, -26}, {-652, -10}, {-492, -10}, {-492, 5.25}, {-470, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (
          Line(points = {{-612, -26}, {-612, -18}, {-482, -18}, {-482, 45}, {-500, 45}}, color = {140, 56, 54}, thickness = 0.5));
        connect(Pe_CHP.y, CHP.PelectricRef) annotation (
          Line(points = {{-669, -296}, {-660.5, -296}, {-660.5, -296.2}, {-652, -296.2}}, color = {0, 0, 127}));
        connect(P501_input.y, P501.in_m_flow) annotation (
          Line(points = {{-597, -150.5}, {-606.48, -150.5}, {-606.48, -149.8}}, color = {0, 0, 127}));
        connect(P1.in_m_flow, PCHP_input.y) annotation (
          Line(points = {{-576.48, -301.8}, {-574.74, -301.8}, {-574.74, -300.5}, {-569, -300.5}}, color = {0, 0, 127}));
        connect(P1.outlet, FCV1.inlet) annotation (
          Line(points = {{-582, -287.4}, {-582, -280}}, color = {140, 56, 54}, thickness = 0.5));
        connect(CHP.outlet, P1.inlet) annotation (
          Line(points = {{-610, -313}, {-596, -313}, {-596, -314}, {-582, -314}, {-582, -306.6}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV1.outlet, S5_PL_CHP_EX501_hot.inlet) annotation (
          Line(points = {{-582, -260}, {-582, -258}, {-612, -258}, {-612, -253}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV1.opening, FCVchp_theta.y) annotation (
          Line(points = {{-574, -270}, {-569, -270}}, color = {0, 0, 127}));
        connect(sinkCHP.inlet, CHP.inlet) annotation (
          Line(points = {{-675, -269}, {-652, -269}, {-652, -284}, {-660, -284}, {-660, -313}, {-652, -313}}, color = {140, 56, 54}, thickness = 0.5));
      end CentralisedSystemI_E;

      model CentralisedSystemI_F
        extends CentralisedSystemI_B;
        // S500
        // General Pipeline Data
        parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
        parameter Real q_m3h_S5_Source = 4;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
        parameter Real q_m3h_S5_User = 6;
        parameter Real P501omega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real P501qm3h[:, :] = [0, 8; 100, 8];
        parameter Real Pchpomega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
        parameter Real Pchpqm3h[:, :] = [0, 3.94; 100, 3.94];
        parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15;
        parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];
        parameter Real FCVchptheta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
        DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(Di_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold, Di_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot, L_cold = DistrictHeatingNetwork.Data.BPHEData.E501.L_cold, L_hot = DistrictHeatingNetwork.Data.BPHEData.E501.L_hot, MWall = DistrictHeatingNetwork.Data.BPHEData.E501.MWall, Stot_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold, Stot_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot, Tin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold, Tin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot, Tout_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold, Tout_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot, cpm_cold = DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold, cpm_hot = DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot, t_cold = DistrictHeatingNetwork.Data.BPHEData.E501.t_cold, t_hot = DistrictHeatingNetwork.Data.BPHEData.E501.t_hot, gamma_nom_cold = DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold, gamma_nom_hot = DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot, h_cold = DistrictHeatingNetwork.Data.BPHEData.E501.h_cold, h_hot = DistrictHeatingNetwork.Data.BPHEData.E501.h_hot, hctype_cold = hctype, hctype_hot = hctype, hin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold, hin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot, k_cold = DistrictHeatingNetwork.Data.BPHEData.E501.k_cold, k_hot = DistrictHeatingNetwork.Data.BPHEData.E501.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold, lambdam_hot = DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot, m_flow_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold, m_flow_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot, n = 5, nPipes_cold = DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold, nPipes_hot = DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot, nPlates = DistrictHeatingNetwork.Data.BPHEData.E501.nPlates, pin_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold, pin_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot, pout_start_cold = DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold, pout_start_hot = DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot, rho_nom_cold = (DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2, rho_nom_hot = (DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold, rhom_hot(displayUnit = "g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot, thermalInertia = false, u_nom_cold = DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold, u_nom_hot = DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
          Placement(visible = true, transformation(origin = {-636, -189}, extent = {{-17, -28.0002}, {17, 28.0001}}, rotation = -90)));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(Tin_start(displayUnit = "K") = Tout_User_start_S5, Tout_start(displayUnit = "K") = Tout_User_start_S5, a = DistrictHeatingNetwork.Data.PumpData.P501.a, b = DistrictHeatingNetwork.Data.PumpData.P501.b, m_flow_start = m_flow_User_S5, dpnom = DistrictHeatingNetwork.Data.PumpData.P501.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P501.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P501.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P501.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P501.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P501.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P501.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P501.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P501.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-14, 14}, {14, -14}}, rotation = 90, origin = {-616, -142})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_Source, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-656, -237})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.04e5, Tin_start = Tout_User_start_S5, Tout_start = Tout_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_Source, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-616, -237})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-7.5, -7.5}, {7.5, 7.5}}, rotation = 90, origin = {-658.5, -213.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = -90, origin = {-613, -213})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.04e5, Tin_start = Tout_User_start_S5, Tout_start = Tout_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-616, -61})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i = 51e-3, D_o = Di_S5) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-616, -30})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-656, -61})));
        DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i = 51e-3, D_o = Di_S5) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-656, -30})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
          Placement(transformation(extent = {{-5.5, 5.5}, {5.5, -5.5}}, rotation = 90, origin = {-613.5, -79.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start = Tout_User_start_S5) annotation (
          Placement(transformation(extent = {{-5.5, 5.5}, {5.5, -5.5}}, rotation = 90, origin = {-613.5, -110.5})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-659, -149})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
          Placement(transformation(extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 90, origin = {-658.5, -80.5})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start = Tin_User_start_S5, p_start = pin_User_start_S5) annotation (
          Placement(transformation(extent = {{-5.5, -5.5}, {5.5, 5.5}}, rotation = 90, origin = {-658.5, -99.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(L = 5, t = t_S5, pin_start = pin_User_start_S5 - 0.02e5, Tin_start = Tin_User_start_S5, Tout_start = Tin_User_start_S5, Di = Di_S5, q_m3h_start = q_m3h_S5_User, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-656, -121})));
        Modelica.Blocks.Sources.TimeTable Pe_CHP(table = PeCHP) annotation (
          Placement(transformation(extent = {{-700, -370}, {-680, -350}})));
        DistrictHeatingNetwork.Sources.PumpInput P501_input(useOmega = false, omega = P501omega, q_m3h = P501qm3h) annotation (
          Placement(transformation(extent = {{-580, -159}, {-600, -138}})));
        DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P1(Tin_start(displayUnit = "K") = Tout_User_start_S5, Tout_start(displayUnit = "K") = Tout_User_start_S5, a = DistrictHeatingNetwork.Data.PumpData.P501.a, b = DistrictHeatingNetwork.Data.PumpData.P501.b, m_flow_start = m_flow_User_S5, dpnom = DistrictHeatingNetwork.Data.PumpData.P501.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P501.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P501.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P501.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P501.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P501.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P501.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P501.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P501.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h) annotation (
          Placement(transformation(extent = {{-12.5, 12}, {12.5, -12}}, rotation = 90, origin = {-616, -291.5})));
        DistrictHeatingNetwork.Sources.PumpInput PCHP_input(useOmega = false, omega = Pchpomega, q_m3h = Pchpqm3h) annotation (
          Placement(transformation(extent = {{-580, -307}, {-600, -286}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV1(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-616, -264})));
        Modelica.Blocks.Sources.TimeTable FCVchp_theta(table = FCVchptheta) annotation (
          Placement(transformation(extent = {{-580, -274}, {-600, -254}})));
        DistrictHeatingNetwork.Sources.SinkPressure sinkCHP(T0(displayUnit = "K") = 15 + 273.15, p0 = 210000, R = 0) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-679, -281})));
        DistrictHeatingNetwork.Components.ThermalMachines.ControlledCHP CHP "Cogenerator" annotation (
          Placement(transformation(extent = {{-670, -394}, {-602, -326}})));
        Modelica.Blocks.Sources.BooleanTable CHP_Status(table = {1000}, startValue = true) "Input to decide whether or nor the CHP is working" annotation (
          Placement(transformation(extent = {{-572, -370}, {-592, -350}})));
      equation
        connect(S5_PL_CHP_EX501_cold.inlet, E501.outhot) annotation (
          Line(points = {{-656, -227}, {-656, -197.5}, {-655.6, -197.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold.inlet, TT503.inlet) annotation (
          Line(points = {{-656, -227}, {-656, -219.25}, {-655.5, -219.25}, {-655.5, -213.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot.outlet, TT504.inlet) annotation (
          Line(points = {{-616, -227}, {-616, -219.25}, {-615.8, -219.25}, {-615.8, -213}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT504.inlet, E501.inhot) annotation (
          Line(points = {{-615.8, -213}, {-615.8, -212.25}, {-616.4, -212.25}, {-616.4, -197.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot1.outlet, suddenAreaChange.outlet) annotation (
          Line(points = {{-616, -51}, {-616, -40}}, color = {140, 56, 54}, thickness = 0.5));
        connect(suddenAreaChange1.outlet, S5_PL_CHP_EX501_cold1.inlet) annotation (
          Line(points = {{-656, -40}, {-656, -51}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_hot1.inlet, PT502.inlet) annotation (
          Line(points = {{-616, -71}, {-616, -76.25}, {-615.7, -76.25}, {-615.7, -79.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT502.inlet, TT502.inlet) annotation (
          Line(points = {{-615.7, -79.5}, {-615.7, -110.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT502.inlet, P501.outlet) annotation (
          Line(points = {{-615.7, -110.5}, {-615.7, -94.95}, {-616, -94.95}, {-616, -130.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT501.outlet, E501.incold) annotation (
          Line(points = {{-656.2, -153.2}, {-656.2, -166.85}, {-655.6, -166.85}, {-655.6, -180.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold1.outlet, PT501.inlet) annotation (
          Line(points = {{-656, -71}, {-656, -75.75}, {-656.3, -75.75}, {-656.3, -80.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT501.inlet, TT501.inlet) annotation (
          Line(points = {{-656.3, -80.5}, {-656.3, -99.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT501.inlet, S5_PL_CHP_EX501_cold2.outlet) annotation (
          Line(points = {{-656.2, -144.8}, {-656.2, -137.9}, {-656, -137.9}, {-656, -131}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT501.inlet, S5_PL_CHP_EX501_cold2.inlet) annotation (
          Line(points = {{-656.3, -99.5}, {-656.3, -105.25}, {-656, -105.25}, {-656, -111}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P501.inlet, E501.outcold) annotation (
          Line(points = {{-616, -153.2}, {-616, -159.55}, {-616.4, -159.55}, {-616.4, -180.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P501_input.y, P501.in_m_flow) annotation (
          Line(points = {{-601, -148.5}, {-609.56, -148.5}, {-609.56, -147.6}}, color = {0, 0, 127}));
        connect(P1.in_m_flow, PCHP_input.y) annotation (
          Line(points = {{-610.48, -296.5}, {-601, -296.5}}, color = {0, 0, 127}));
        connect(P1.outlet, FCV1.inlet) annotation (
          Line(points = {{-616, -281.5}, {-616, -274}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV1.outlet, S5_PL_CHP_EX501_hot.inlet) annotation (
          Line(points = {{-616, -254}, {-616, -247}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV1.opening, FCVchp_theta.y) annotation (
          Line(points = {{-608, -264}, {-601, -264}}, color = {0, 0, 127}));
        connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
          Line(points = {{-656, -20}, {-658, -20}, {-658, -10}, {-492, -10}, {-492, 5.25}, {-470, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (
          Line(points = {{-616, -20}, {-616, -14}, {-484, -14}, {-484, 45}, {-500, 45}}, color = {140, 56, 54}, thickness = 0.5));
        connect(CHP.outlet, P1.inlet) annotation (
          Line(points = {{-625.8, -332.8}, {-625.8, -314}, {-616, -314}, {-616, -301.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (
          Line(points = {{-656, -247}, {-656, -314}, {-646.2, -314}, {-646.2, -332.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(Pe_CHP.y, CHP.Pelectric_in) annotation (
          Line(points = {{-679, -360}, {-663.2, -360}}, color = {0, 0, 127}));
        connect(sinkCHP.inlet, CHP.inlet) annotation (
          Line(points = {{-669, -281}, {-656, -281}, {-656, -314}, {-646.2, -314}, {-646.2, -332.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(CHP_Status.y, CHP.heat_on) annotation (
          Line(points = {{-593, -360}, {-628, -360}, {-628, -380.4}, {-663.2, -380.4}}, color = {255, 0, 255}));
        annotation (
          experiment(StopTime = 4000, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemI_F;

      model CentralisedSystemLoadSimplifiedI_A "Sequence using Gas Boiler as heat source only"
        extends
          MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemLoadSimplifiedI(FV933_state = false, FCVC01theta = [0, 0; 100, 0], FCVC02theta = [0, 1; 100, 1], FCV901theta = [0, 1; 100, 1], P901omega = [0, 2*pi*30; 100, 2*pi*30], P101omega = [0, 2*pi*30; 100, 2*pi*30; 100, 2*pi*30; 200, 2*pi*30], FCV101theta = [0, 1; 100, 1], q_m3h_S9 = 10, P101qm3h = [0, 10; 100, 10], q_m3h_S1 = 10, FCV701theta = [0, 1; 100, 1], FCV711theta = [0, 1; 100, 1], FCV721theta = [0, 1; 100, 1], FCV731theta = [0, 1; 100, 1], TCV701theta = [0, 1; 100, 1], TCV711theta = [0, 1; 100, 1], TCV721theta = [0, 1; 100, 1], TCV731theta = [0, 1; 100, 1], FCVR01theta = [0, 0.2; 100, 0.2], PR01omega = [0, 2*Modelica.Constants.pi*50; 100, 2*Modelica.Constants.pi*50], ToutcoolSP = [0, 15; 100, 15], GB101(h = 1.2*0.93, Pmaxnom = 147.6e3*0.8));
        Modelica.Blocks.Sources.TimeTable FCV901_theta(table = FCV901theta) annotation (
          Placement(transformation(extent={{-682,103},{-702,123}})));
        DistrictHeatingNetwork.Sources.PumpInput P901_input(useOmega = true, omega = P901omega, q_m3h = P901qm3h) annotation (
          Placement(transformation(extent = {{-714, 54}, {-734, 75}})));
        Modelica.Blocks.Sources.TimeTable FCVC01_theta(table = FCVC01theta) annotation (
          Placement(transformation(extent={{332,290},{312,310}})));
        Modelica.Blocks.Sources.TimeTable FCVC02_theta(table = FCVC02theta) annotation (
          Placement(transformation(extent={{782,290},{762,310}})));
        Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k = FV933_state) annotation (
          Placement(transformation(extent = {{-185, 55}, {-205, 75}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table = FCV101theta) annotation (
          Placement(transformation(extent = {{-178, -120}, {-198, -100}})));
        DistrictHeatingNetwork.Sources.PumpInput P101_input(omega = P101omega, q_m3h = P101qm3h) annotation (
          Placement(transformation(extent = {{-200, -191}, {-220, -170}})));
        Modelica.Blocks.Sources.TimeTable FCV701_theta(table = FCV701theta) annotation (
          Placement(transformation(extent = {{179, -160}, {159, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV711_theta(table = FCV711theta) annotation (
          Placement(transformation(extent = {{499, -160}, {479, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV731_theta(table = FCV731theta) annotation (
          Placement(transformation(extent = {{340, -160}, {320, -140}})));
        Modelica.Blocks.Sources.TimeTable FCV721_theta(table = FCV721theta) annotation (
          Placement(transformation(extent = {{661, -160}, {641, -140}})));
        Modelica.Blocks.Sources.TimeTable GB101_Tout_SP(table = GB101_ToutSP) annotation (
          Placement(transformation(extent = {{-318, -310}, {-298, -290}})));
        Modelica.Blocks.Sources.TimeTable FT723_mflow(table = EX721q_m3h_cold*1000/3600) annotation (
          Placement(transformation(extent = {{530, -340}, {550, -320}})));
        Modelica.Blocks.Sources.TimeTable FT713_mflow(table = EX711q_m3h_cold*1000/3600) annotation (
          Placement(transformation(extent = {{370, -340}, {390, -320}})));
        Modelica.Blocks.Sources.TimeTable FT733_mflow(table = EX731q_m3h_cold*1000/3600) annotation (
          Placement(transformation(extent = {{210, -340}, {230, -320}})));
        Modelica.Blocks.Sources.TimeTable FT703_mflow(table = EX701q_m3h_cold*1000/3600) annotation (
          Placement(transformation(extent = {{50, -340}, {70, -320}})));
        Modelica.Blocks.Sources.TimeTable TT703_SP(table = EX701_TinCold) annotation (
          Placement(transformation(extent = {{192, -280}, {172, -260}})));
        Modelica.Blocks.Sources.TimeTable TT733_SP(table = EX731_TinCold) annotation (
          Placement(transformation(extent = {{348, -280}, {328, -260}})));
        Modelica.Blocks.Sources.TimeTable TT723_SP(table = EX721_TinCold) annotation (
          Placement(transformation(extent = {{672, -280}, {652, -260}})));
        Modelica.Blocks.Sources.TimeTable TT713_SP(table = EX711_TinCold) annotation (
          Placement(transformation(extent = {{512, -280}, {492, -260}})));
        Modelica.Blocks.Sources.BooleanTable GB101_Status(table = {1e8}, startValue = true) "Input to decide whether or nor the gas boiler is working" annotation (
          Placement(transformation(extent = {{-318, -344}, {-298, -324}})));
        Modelica.Blocks.Sources.RealExpression TT703_SPP annotation (
          Placement(transformation(origin = {180, -240}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
        Modelica.Blocks.Sources.RealExpression TT733_SPP annotation (
          Placement(transformation(origin = {334, -240}, extent = {{10, -10}, {-10, 10}})));
        Modelica.Blocks.Sources.RealExpression tt733_spp annotation (
          Placement(transformation(origin = {516, -242}, extent = {{10, -10}, {-10, 10}})));
        Modelica.Blocks.Sources.RealExpression tt733_spp1 annotation (
          Placement(transformation(origin = {664, -240}, extent = {{10, -10}, {-10, 10}})));
        Modelica.Blocks.Continuous.FirstOrder FCV101_firstOrder(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (
          Placement(transformation(extent = {{-206, -120}, {-226, -100}})));
        Modelica.Blocks.Continuous.FirstOrder FCV901_firstOrder(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-716,104},{-736,124}})));
        Modelica.Blocks.Continuous.FirstOrder FCVC01_firstOrder(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{300,290},{280,310}})));
        Modelica.Blocks.Continuous.FirstOrder FCVC02_firstOrder(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{750,290},{730,310}})));
      equation
        connect(P901_input.y, P901.in_omega) annotation (
          Line(points = {{-735, 64.5}, {-743.5, 64.5}, {-743.5, 66.3}, {-747.25, 66.3}}, color = {0, 0, 127}));
        connect(FV933_OnOff.y, FV933.u) annotation (
          Line(points = {{-206, 65}, {-218, 65}, {-218, 46.6}}, color = {255, 0, 255}));
        connect(FCV701_theta.y, FCV701.opening) annotation (
          Line(points = {{158, -150}, {148, -150}}, color = {0, 0, 127}));
        connect(FCV711_theta.y, FCV711.opening) annotation (
          Line(points = {{478, -150}, {468, -150}}, color = {0, 0, 127}));
        connect(FCV731_theta.y, FCV731.opening) annotation (
          Line(points = {{319, -150}, {308, -150}}, color = {0, 0, 127}));
        connect(FCV721_theta.y, FCV721.opening) annotation (
          Line(points = {{640, -150}, {628, -150}}, color = {0, 0, 127}));
        connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (
          Line(points={{-297,-300},{-297,-301},{-281.5,-301}},      color = {0, 0, 127}));
        connect(FT723_mflow.y, FT723.in_m_flow) annotation (
          Line(points = {{551, -330}, {566, -330}, {566, -305}}, color = {0, 0, 127}));
        connect(FT713_mflow.y, FT713.in_m_flow) annotation (
          Line(points = {{391, -330}, {400, -330}, {400, -305}}, color = {0, 0, 127}));
        connect(FT733_mflow.y, FT733.in_m_flow) annotation (
          Line(points = {{231, -330}, {238, -330}, {238, -305}}, color = {0, 0, 127}));
        connect(FT703_mflow.y, FT703.in_m_flow) annotation (
          Line(points = {{71, -330}, {80, -330}, {80, -305}}, color = {0, 0, 127}));
        connect(P101_input.y, P101.in_omega) annotation (
          Line(points = {{-221, -180.5}, {-234, -180.5}, {-234, -179.8}}, color = {0, 0, 127}));
        connect(GB101_Status.y, GB101.heat_on) annotation (
          Line(points={{-297,-334},{-294,-334},{-294,-318.5},{-281.5,-318.5}},    color = {255, 0, 255}));
        connect(
          FCV101_theta.y, FCV101_firstOrder.u) annotation (
          Line(points = {{-199, -110}, {-204, -110}}, color = {0, 0, 127}));
        connect(
          FCV101_firstOrder.y, FCV101.opening) annotation (
          Line(points = {{-227, -110}, {-232, -110}}, color = {0, 0, 127}));
        connect(FCV901_firstOrder.y, FCV901.opening) annotation (Line(points={{-737,114},{-744,114},{-744,140.5},{-749.9,140.5}},
                                                                                                                            color={0,0,127}));
        connect(FCV901_theta.y, FCV901_firstOrder.u) annotation (Line(points={{-703,113},{-708.5,113},{-708.5,114},{-714,114}}, color={0,0,127}));
        connect(FCVC01_firstOrder.u, FCVC01_theta.y) annotation (Line(points={{302,300},{311,300}}, color={0,0,127}));
        connect(FCVC01_firstOrder.y, FCVC01.opening) annotation (Line(points={{279,300},{270,300},{270,235},{258,235}}, color={0,0,127}));
        connect(FCVC02_theta.y, FCVC02_firstOrder.u) annotation (Line(points={{761,300},{752,300}}, color={0,0,127}));
        connect(FCVC02_firstOrder.y, FCVC02.opening) annotation (Line(points={{729,300},{720,300},{720,235},{698,235}}, color={0,0,127}));
      annotation (
          Diagram(coordinateSystem(extent = {{-900, -500}, {900, 500}})));
      end CentralisedSystemLoadSimplifiedI_A;

      model CentralisedSystemLoadSimplifiedI_B
        extends CentralisedSystemLoadSimplifiedI_A(
          coldSourcePEX721(T0=15 + 273.15),
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
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 72 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
        parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
        parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;
        parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
        parameter Real q_m3h_S4 = 5;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
        parameter Real P401omega[:, :] = [0, 2*3.141592654*30; 100, 2*3.141592654*30; 100, 2*3.141592654*30; 200, 2*3.141592654*30];
        parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
        parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
        parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
        parameter Boolean FV401_state = true;
        parameter Boolean FV402_state = true;
        parameter Boolean FV401_startValue = true;
        parameter Boolean FV402_startValue = true;
        parameter Real FV401_s[:] = {5e6};
        parameter Real FV402_s[:] = {5e6};
        DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
          Placement(visible = true, transformation(origin = {-342, -302}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
        DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h, use_in_omega = true) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-322, -175})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-322,-110})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -236})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -238})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-322,-142})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-320, -74})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
          Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-320, -86})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -118})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -106})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
          Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-365, -195})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -166})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(L = L_S4_rCD_hot, h = h_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(L = L_S4_rCD_cold, h = h_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
          Placement(transformation(origin = {-362, -54}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-362, -20})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -20})));
        Modelica.Blocks.Sources.TimeTable FCV401_theta(table = FCV401theta) annotation (
          Placement(transformation(extent={{-178,-152},{-198,-132}})));
        DistrictHeatingNetwork.Sources.PumpInput P401_input(omega = P401omega, q_m3h = P401qm3h) annotation (
          Placement(transformation(extent = {{-288, -191}, {-308, -170}})));
        Modelica.Blocks.Sources.TimeTable EB401_Tout_SP(table = EB401_ToutSP) annotation (
          Placement(transformation(extent = {{-408, -310}, {-388, -290}})));
        Modelica.Blocks.Sources.BooleanTable FV401_Status(table = FV401_s, startValue = FV401_startValue) "Input for the status (open/close) of valve FV401" annotation (
          Placement(transformation(extent = {{-394, -30}, {-374, -10}})));
        Modelica.Blocks.Sources.BooleanTable FV402_Status(table = FV402_s, startValue = FV402_startValue) "Input for the status (open/close) of valve FV402" annotation (
          Placement(transformation(extent = {{-290, -30}, {-310, -10}})));
        Modelica.Blocks.Sources.BooleanTable EB401_Status(table = {1e8}, startValue = true) "Input to decide whether or nor the electric boiler is working" annotation (
          Placement(transformation(extent = {{-408, -342}, {-388, -322}})));
        Modelica.Blocks.Continuous.FirstOrder FCV401_firstOrder(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-206,-152},{-226,-132}})));
      equation
        connect(P401.inlet, PL3_S401.outlet) annotation (
          Line(points = {{-322, -184.6}, {-322, -226}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT402.inlet, PT402.inlet) annotation (
          Line(points = {{-322.4, -74}, {-322.4, -86}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FT401.outlet, PL2_S401.inlet) annotation (
          Line(points = {{-362.2, -199.2}, {-362.2, -207.6}, {-362, -207.6}, {-362, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL1_S401.outlet, FT401.inlet) annotation (
          Line(points = {{-362, -176}, {-362, -183.4}, {-362.2, -183.4}, {-362.2, -190.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL1_S401.inlet, PT401.inlet) annotation (
          Line(points = {{-362, -156}, {-362, -118}, {-361.6, -118}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT401.inlet, TT401.inlet) annotation (
          Line(points = {{-361.6, -118}, {-361.6, -106}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL2_S401.outlet, EB401.inlet) annotation (
          Line(points = {{-362, -248}, {-362, -258}, {-352.2, -258}, {-352.2, -274.8}}, color = {140, 56, 54}, thickness = 0.5));
        connect(EB401.outlet, PL3_S401.inlet) annotation (
          Line(points = {{-331.8, -274.8}, {-331.8, -258}, {-322, -258}, {-322, -246}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
          Line(points = {{-322.4, -74}, {-322, -74}, {-322, -62}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
          Line(points = {{-361.6, -106}, {-362, -106}, {-362, -64}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
          Line(points = {{-362, -44}, {-362, -30}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
          Line(points = {{-322, -42}, {-322, -30}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
          Line(points = {{-362, -10}, {-362, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
          Line(points = {{-322, -10}, {-322, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
        connect(EB401_Tout_SP.y, EB401.Tout_ref) annotation (
          Line(points={{-387,-300},{-387,-302},{-365.8,-302}},        color = {0, 0, 127}));
        connect(FV401_Status.y, FV401.u) annotation (
          Line(points = {{-373, -20}, {-365.2, -20}}, color = {255, 0, 255}));
        connect(FV402_Status.y, FV402.u) annotation (
          Line(points = {{-311, -20}, {-318.8, -20}}, color = {255, 0, 255}));
        connect(P401_input.y, P401.in_omega) annotation (
          Line(points = {{-309, -180.5}, {-312.5, -180.5}, {-312.5, -179.8}, {-316, -179.8}}, color = {0, 0, 127}));
        connect(EB401_Status.y, EB401.heat_on) annotation (
          Line(points={{-387,-332},{-380,-332},{-380,-319},{-365.8,-319}},              color = {255, 0, 255}));
        connect(FCV401_firstOrder.u, FCV401_theta.y) annotation (Line(points={{-204,-142},{-199,-142}}, color={0,0,127}));
        connect(FCV401_firstOrder.y, FCV401.opening) annotation (Line(points={{-227,-142},{-227,-136},{-160,-136},{-160,-200},{-256,-200},{-256,-110},{-314,-110}},
                                                                                                                                                        color={0,0,127}));
        connect(PL4_S401.inlet, P401.outlet) annotation (Line(
            points={{-322,-152},{-322,-165.4}},
            color={140,56,54},
            thickness=0.5));
        connect(PL4_S401.outlet, FCV401.inlet) annotation (Line(
            points={{-322,-132},{-322,-120}},
            color={140,56,54},
            thickness=0.5));
        connect(FCV401.outlet, PT402.inlet) annotation (Line(
            points={{-322,-100},{-322,-93},{-322.4,-93},{-322.4,-86}},
            color={140,56,54},
            thickness=0.5));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 12000, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemLoadSimplifiedI_B;

      model CentralisedSystemLoadSimplifiedI_D "Gas Boiler, Electric Boiler & Water Tanks"
        extends CentralisedSystemLoadSimplifiedI_B(
          P901omega = [0, 2*pi*30; 500, 2*pi*30],
          P101omega = [0, 2*pi*40; 500, 2*pi*40],
          P401omega = [0, 2*pi*35; 500, 2*pi*35],
          p_VE901 = 2e5,
          q_m3h_S9 = 15,
          EB401_ToutSP = [0, 80 + 273.15; 4000, 80 + 273.15; 4000, 90 + 273.15; 1e6, 90 + 273.15],
          GB101_ToutSP = [0, 80 + 273.15; 4000, 80 + 273.15; 4000, 90 + 273.15; 1e6, 90 + 273.15],
          EX701q_m3h_cold = [0, 2.2; 100, 2.2],
          EX711q_m3h_cold = [0, 2.2; 100, 2.2],
          EX721q_m3h_cold = [0, 2.2; 100, 2.2],
          EX731q_m3h_cold = [0, 2.2; 100, 2.2],
          EX701_TinCold = [0, 20 + 273.15; 100, 20 + 273.15],
          EX711_TinCold = [0, 20 + 273.15; 100, 20 + 273.15],
          EX721_TinCold = [0, 20 + 273.15; 100, 20 + 273.15],
          EX731_TinCold = [0, 20 + 273.15; 100, 20 + 273.15],
          EX701_Tin_cold = 20 + 273.15,
          EX711_Tin_cold = 20 + 273.15,
          EX721_Tin_cold = 20 + 273.15,
          EX731_Tin_cold = 20 + 273.15,
          EX701_Tout_cold = 35 + 273.15,
          EX711_Tout_cold = 35 + 273.15,
          EX721_Tout_cold = 35 + 273.15,
          EX731_Tout_cold = 35 + 273.15,
          FCVC01theta = [0, 0; 1e6, 0],
          FCVC02theta = [0, 1; 1e6, 1],
          T_start_hot = 80 + 273.15,
          EX701_Tin_hot = T_start_hot,
          EX711_Tin_hot = T_start_hot,
          EX721_Tin_hot = T_start_hot,
          EX731_Tin_hot = T_start_hot,
          EX701_Tout_hot = T_start_hot-20,
          EX711_Tout_hot = T_start_hot-20,
          EX721_Tout_hot = T_start_hot-20,
          EX731_Tout_hot = T_start_hot-20,
          VE901(p0 = p_VE901, R=1e-3));
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
        parameter Boolean Load = false;
        final parameter Boolean Unload = not Load;
        parameter Real Load2Unload = 4e5;
        parameter Real Unload2Load = 5e5;
        parameter Integer nTank = 4 "Number of volumes in stratified tank";
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 1.8e5;
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
        final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 75 + 273.15;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 76 + 273.15;
        parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
        parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
        parameter Real q_m3h_S2(unit = "m3/h") = 4;
        final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
        parameter Real P201omega[:, :] = [0, 2*pi*30; 4.2e5, 2*pi*30; 1e6, 2*pi*30];
        parameter Real P201qm3h[:, :] = [0, 14.5; 100, 14.5];
        parameter Real FCV201theta[:, :] = [0, 1; 4.1e5, 1; 4.1e5, 0.5; 1e6, 0.5];
        // Pipe length
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
        parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
        parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
        parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
        parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
        parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
        parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H = 4, Tin_start = Tin_start_S2, Tout_start = Tout_start_S2, n = nTank, D = 1.7, T_start(displayUnit = "K") = 70 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) "Stratified tank 1" annotation (
          Placement(transformation(extent = {{-762, -480}, {-818, -368}})));
        DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P201(pout_start(displayUnit = "Pa") = 3e5, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P201.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P201.a, b = DistrictHeatingNetwork.Data.PumpData.P201.b, m_flow_start = m_flow_S2, dpnom = DistrictHeatingNetwork.Data.PumpData.P201.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P201.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P201.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P201.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P201.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P201.omeganom, pin_start(displayUnit = "Pa") = 1.8400803e5, headnom = DistrictHeatingNetwork.Data.PumpData.P201.headnom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom, headmax = DistrictHeatingNetwork.Data.PumpData.P201.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P201.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h, use_in_omega = true) annotation (
          Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin = {-794, -212})));
        DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H = 4, Tin_start = Tin_start_S2, Tout_start = Tout_start_S2, n = nTank, D = 1.7, T_start(displayUnit = "K") = 70 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) "Stratified tank 2" annotation (
          Placement(transformation(extent = {{-700, -480}, {-644, -368}})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start = Tin_start_S2, p_start = pin_start_S2) "Temperature sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-795.75, -70.75})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
          Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-796, -90.5})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -112})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-854, -202})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(L = L_S2_PL3, t = L_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-854, -172})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(L = L_S2_PL2, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -244})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(L = L_S2_PL4, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-854, -232})));
        DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start = Tout_start_S2, p_start = pout_start_S2) "Temperature sensor at the outlet of System 200" annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-752, -72})));
        DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-752, -142})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(L = L_S2_PL9, t = t_S2, pin_start = pout_start_S2, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-754, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_tank, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-714, -416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(L = L_S2_PL0, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -52})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_tank, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-748, -416})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-730, -444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-730, -460})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(L = L_S2_PL6, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-822, -494})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(L = L_S2_D201_FT201, h = h_S2_D201_FT201, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 0, origin = {-832, -444})));
        DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-794, -174})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-824, -132})));
        Modelica.Blocks.Sources.BooleanConstant FV202_OnOff(k = FV202_state) annotation (
          Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-824, -96})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV202_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-824, -106})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-794, -152})));
        Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k = FV201_state) annotation (
          Placement(transformation(extent = {{-838, -158}, {-826, -146}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status annotation (
          Placement(transformation(extent = {{-810, -162}, {-830, -142}})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {-774, -190})));
        Modelica.Blocks.Sources.BooleanConstant FV206_OnOff(k = FV206_state) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 270, origin = {-774, -146})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV206_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {-774, -160})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-794, -272})));
        Modelica.Blocks.Sources.BooleanConstant FV209_OnOff(k = FV209_state) annotation (
          Placement(transformation(extent = {{-5.5, -6}, {5.5, 6}}, rotation = 0, origin = {-834.5, -272})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV209_Status annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-820, -272})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin = {-774, -258})));
        DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(Kv = DistrictHeatingNetwork.Data.ValveData.FCV201.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2) annotation (
          Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {-754, -222})));
        Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k = FV203_state) annotation (
          Placement(transformation(extent = {{-708, -228}, {-719, -216}})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-734, -222})));
        DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start = Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
          Placement(transformation(extent = {{7, 7}, {-7, -7}}, rotation = 90, origin = {-751, -283})));
        Modelica.Blocks.Sources.BooleanConstant FV207_OnOff(k = FV207_state) annotation (
          Placement(transformation(extent = {{6, -6}, {-6, 6}}, rotation = -90, origin = {-774, -294})));
        Modelica.Blocks.Interaction.Show.BooleanValue FV207_Status annotation (
          Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin = {-774, -280})));
        Modelica.Blocks.Sources.TimeTable FCV201_theta(table = FCV201theta) annotation (
          Placement(transformation(extent = {{-888, -212}, {-868, -192}})));
        DistrictHeatingNetwork.Sources.PumpInput P201_input(useOmega = true, omega = P201omega, q_m3h = P201qm3h) annotation (
          Placement(transformation(extent = {{-828, -218}, {-808, -198}})));
        Modelica.Blocks.Sources.BooleanTable Loading(table = {Load2Unload, Unload2Load}, startValue = Load) "Input to decide whether or nor the gas boiler is working" annotation (
          Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-606, -150})));
        Modelica.Blocks.Logical.Not not3 annotation (
          Placement(transformation(extent = {{-638, -190}, {-658, -170}})));
      equation
        connect(PT201.inlet, TT201.inlet) annotation (
          Line(points = {{-794, -90.5}, {-794, -81.625}, {-793.85, -81.625}, {-793.85, -70.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (
          Line(points = {{-794, -102}, {-794, -90.5}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (
          Line(points = {{-794, -221.6}, {-794, -234}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT202.inlet, PT202.inlet) annotation (
          Line(points = {{-754.4, -72}, {-754.4, -142}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (
          Line(points = {{-754, -62}, {-754, -72}, {-754.4, -72}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (
          Line(points = {{-794, -62}, {-794, -73.375}, {-793.85, -73.375}, {-793.85, -70.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(D201.outlet, PL_S200_D201_High.inlet) annotation (
          Line(points = {{-762, -389}, {-748, -389}, {-748, -406}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
          Line(points = {{-720, -444}, {-714, -444}, {-714, -426}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
          Line(points = {{-740, -444}, {-748, -444}, {-748, -426}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D202_High.inlet, D202.outlet) annotation (
          Line(points = {{-714, -406}, {-714, -389}, {-700, -389}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (
          Line(points = {{-740, -460}, {-756, -460}, {-756, -459}, {-762, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (
          Line(points = {{-720, -460}, {-716, -460}, {-716, -459}, {-700, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (
          Line(points = {{-812, -494}, {-748, -494}, {-748, -459}, {-762, -459}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (
          Line(points = {{-854, -222}, {-854, -212}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (
          Line(points = {{-854, -192}, {-854, -182}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (
          Line(points = {{-794, -184}, {-794, -202.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (
          Line(points = {{-854, -162}, {-854, -132}, {-830, -132}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (
          Line(points = {{-794, -122}, {-794, -146}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (
          Line(points = {{-794, -158}, {-794, -164}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV202.outlet, FV201.inlet) annotation (
          Line(points = {{-818, -132}, {-794, -132}, {-794, -146}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.outlet, P201.inlet) annotation (
          Line(points = {{-780, -190}, {-794, -190}, {-794, -202.4}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (
          Line(points = {{-794, -254}, {-794, -266}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.inlet, FV209.inlet) annotation (
          Line(points = {{-780, -258}, {-794, -258}, {-794, -266}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV207.outlet, FV203.inlet) annotation (
          Line(points = {{-768, -258}, {-754, -258}, {-754, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV206.inlet, FV203.outlet) annotation (
          Line(points = {{-768, -190}, {-754, -190}, {-754, -216}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PT202.inlet, FV203.outlet) annotation (
          Line(points = {{-754.4, -142}, {-754, -142}, {-754, -216}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FCV201_theta.y, FCV201.opening) annotation (
          Line(points = {{-867, -202}, {-862, -202}}, color = {0, 0, 127}));
        connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-854, -242}, {-854, -494}, {-832, -494}}, color = {140, 56, 54}, thickness = 0.5));
        connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (
          Line(points = {{-794, -278}, {-794, -334}, {-854, -334}, {-854, -494}, {-832, -494}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (
          Line(points = {{-794, -42}, {-796, -42}, {-796, -8}, {-708, -8}, {-708, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (
          Line(points = {{-754, -42}, {-754, -14}, {-700, -14}, {-700, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
        connect(P201_input.y, P201.in_omega) annotation (
          Line(points = {{-807, -208}, {-806.5, -208}, {-806.5, -207.2}, {-800, -207.2}}, color = {0, 0, 127}));
        connect(FT201.inlet, FV203.inlet) annotation (
          Line(points = {{-753.8, -278.8}, {-754, -258}, {-754, -228}}, color = {140, 56, 54}, thickness = 0.5));
        connect(Loading.y, not3.u) annotation (
          Line(points = {{-617, -150}, {-630, -150}, {-630, -180}, {-636, -180}}, color = {255, 0, 255}));
        connect(Loading.y, FV206.u) annotation (
          Line(points = {{-617, -150}, {-724, -150}, {-724, -180}, {-774, -180}, {-774, -188.08}}, color = {255, 0, 255}));
        connect(Loading.y, FV207.u) annotation (
          Line(points = {{-617, -150}, {-724, -150}, {-724, -264}, {-774, -264}, {-774, -259.92}}, color = {255, 0, 255}));
        connect(FV206_Status.activePort, FV206.u) annotation (
          Line(points = {{-774, -171.5}, {-774, -188.08}}, color = {255, 0, 255}));
        connect(FV207_Status.activePort, FV207.u) annotation (
          Line(points = {{-774, -268.5}, {-774, -259.92}}, color = {255, 0, 255}));
        connect(not3.y, FV201.u) annotation (
          Line(points = {{-659, -180}, {-676, -180}, {-676, -160}, {-802, -160}, {-802, -152}, {-795.92, -152}}, color = {255, 0, 255}));
        connect(not3.y, FV203.u) annotation (
          Line(points = {{-659, -180}, {-676, -180}, {-676, -200}, {-748, -200}, {-748, -222}, {-752.08, -222}}, color = {255, 0, 255}));
        connect(FV203_Status.activePort, FV203.u) annotation (
          Line(points = {{-745.5, -222}, {-752.08, -222}}, color = {255, 0, 255}));
        connect(FV201_Status.activePort, FV201.u) annotation (
          Line(points = {{-808.5, -152}, {-795.92, -152}}, color = {255, 0, 255}));
        connect(not3.y, FV209.u) annotation (
          Line(points = {{-659, -180}, {-676, -180}, {-676, -284}, {-802, -284}, {-802, -272}, {-795.92, -272}}, color = {255, 0, 255}));
        connect(FV209_Status.activePort, FV209.u) annotation (
          Line(points = {{-808.5, -272}, {-795.92, -272}}, color = {255, 0, 255}));
        connect(FV202_Status.activePort, FV202.u) annotation (
          Line(points = {{-824, -117.5}, {-824, -130.08}}, color = {255, 0, 255}));
        connect(Loading.y, FV202.u) annotation (
          Line(points = {{-617, -150}, {-630, -150}, {-630, -124}, {-824, -124}, {-824, -130.08}}, color = {255, 0, 255}));
        connect(PL_S200_D201_High.outlet, PL_S200_D201_FT201.inlet) annotation (
          Line(points = {{-748, -426}, {-748, -444}, {-822, -444}}, color = {140, 56, 54}, thickness = 0.5));
        connect(PL_S200_D201_FT201.outlet, FT201.outlet) annotation (
          Line(points = {{-842, -444}, {-846, -444}, {-846, -344}, {-753.8, -344}, {-753.8, -287.2}}, color = {140, 56, 54}, thickness = 0.5));
        connect(TT703_SP.y, coldSourcePEX701.in_T0) annotation (Line(points={{171,-270},{164,-270},{164,-272},{159,-272},{159,-290.6}}, color={0,0,127}));
        connect(TT733_SP.y, coldSourcePEX731.in_T0) annotation (Line(points={{327,-270},{324,-270},{324,-278},{319,-278},{319,-290.6}}, color={0,0,127}));
        connect(TT713_SP.y, coldSourcePEX711.in_T0) annotation (Line(points={{491,-270},{482,-270},{482,-274},{479,-274},{479,-290.6}}, color={0,0,127}));
        connect(TT723_SP.y, coldSourcePEX721.in_T0) annotation (Line(points={{651,-270},{641,-270},{641,-288.6}}, color={0,0,127}));
        annotation (
          experiment(
            StopTime=900000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"),                                                  Diagram(
              coordinateSystem(extent={{-900,-500},{900,500}})));
      end CentralisedSystemLoadSimplifiedI_D;

      model CentralisedSystemSimplifiedLoadSimplifiedI_A "Sequence using Gas Boiler as heat source only"
        extends MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemSimplifiedLoadSimplifiedI(
          p_VE901 = 1.69e5,
          FV933_state = false,
          FCVC01theta = [0, 0; 100, 0],
          FCVC02theta = [0, 0.2; 100, 0.2],
          FCV901theta = [0, 1; 100, 1],
          P901omega = [0, 2*pi*30; 100, 2*pi*30],
          FCV101theta = [0, 1; 100, 1],
          P101omega = [0, 2*pi*40; 100, 2*pi*40],
          q_m3h_S9 = 12, P101qm3h = [0, 10; 100, 10], q_m3h_S1 = 10, FCV901(Kv = 20), FCVC01(Kv = 25), FCVC02(Kv = 25),                                                                                       EX701(Tin_start_Cool = 298.15, Tout_start_Cool = 305.15));
        parameter DistrictHeatingNetwork.Types.Power EX701PtSP[:, :] = [0, 20e3; 1e6, 20e3];
        parameter DistrictHeatingNetwork.Types.Power EX711PtSP[:, :] = [0, 20e3; 1e6, 20e3];
        parameter DistrictHeatingNetwork.Types.Power EX721PtSP[:, :] = [0, 20e3; 1e6, 20e3];
        parameter DistrictHeatingNetwork.Types.Power EX731PtSP[:, :] = [0, 20e3; 1e6, 20e3];
        parameter Real FCV701theta[:, :] = [0, 1; 100, 1];
        parameter Real FCV711theta[:, :] = [0, 1; 100, 1];
        parameter Real FCV721theta[:, :] = [0, 1; 100, 1];
        parameter Real FCV731theta[:, :] = [0, 1; 100, 1];
        parameter Real EX701_TinCold[:, :] = [0, 25 + 273.15; 100, 25 + 273.15];
        parameter Real EX711_TinCold[:, :] = [0, 25 + 273.15; 100, 25 + 273.15];
        parameter Real EX721_TinCold[:, :] = [0, 25 + 273.15; 100, 25 + 273.15];
        parameter Real EX731_TinCold[:, :] = [0, 25 + 273.15; 100, 25 + 273.15];
        parameter DistrictHeatingNetwork.Types.MassFlowRate GB101_mflowSP[:, :] = [0, 12*980/3600; 100, 12*980/3600];
        annotation (
          experiment(StopTime = 500, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
      end CentralisedSystemSimplifiedLoadSimplifiedI_A;
    end Centralised;
  end Networks;

  package Control
    extends Modelica.Icons.Package;
    model ThermalPlantController
      parameter Real dTout_GB101[:,:] = [0, (80-100)/(100+273.15); 1e6, (80-100)/(100+273.15)];
      parameter Real dTout_EB401[:,:] = [0, (80-100)/(100+273.15); 1e6, (80-100)/(100+273.15)];
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, 0; 2e3, 0; 2.5e3, -0.9; 4e4, -0.9];
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dmflowcool_EX701[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX711[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX721[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX731[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dEX701Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX711Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX721Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX731Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real ddPT100[:, :] = [0, 0; 0, 0];
      parameter Real ddPTA2[:, :] = [0, 0; 0, 0];
      parameter Real dTT704[:, :] = [0, (37 - 20)/(20 + 273.15); 1e3, (37 - 20)/(20 + 273.15)];
      parameter Real dTT714[:, :] = [0, (37 - 20)/(20 + 273.15); 1e3, (37 - 20)/(20 + 273.15)];
      parameter Real dTT724[:, :] = [0, (37 - 20)/(20 + 273.15); 1e3, (37 - 20)/(20 + 273.15)];
      parameter Real dTT734[:, :] = [0, (37 - 20)/(20 + 273.15); 1e3, (37 - 20)/(20 + 273.15)];
      parameter Real dFT701[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT711[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT721[:, :] = [0, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 1000, (0.8 - 1.3)/1.3];
      parameter Real dTT731[:, :] = [0, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 1000, (55 - 65)/(65 + 273.15)];
      parameter Real dFT901[:, :] = [0, (3 - 8.8)/8.8; 500, (3 - 8.8)/8.8; 500, (3 - 8.8)/8.8; 1000, (3 - 8.8)/8.8];
      parameter Real dFT101[:, :] = [0, (2 - 5.7166667)/5.7166667; 500, (2 - 5.7166667)/5.7166667];
      parameter Real dFT401[:, :] = [0, (1.5 - 3.2666667)/3.2666667; 500, (1.5 - 3.2666667)/3.2666667];
      Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
        Placement(transformation(extent = {{-80, 90}, {-70, 100}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
        Placement(transformation(extent = {{-80, 75}, {-70, 85}})));
      Modelica.Blocks.Sources.TimeTable domegaP101(table = domega_P101) annotation (
        Placement(transformation(extent = {{-80, 60}, {-70, 70}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV101(table = dtheta_FCV101) annotation (
        Placement(transformation(extent = {{-80, 45}, {-70, 55}})));
      Modelica.Blocks.Sources.TimeTable domegaP401(table = domega_P401) annotation (
        Placement(transformation(extent = {{-80, 30}, {-70, 40}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV401(table = dtheta_FCV401) annotation (
        Placement(transformation(extent = {{-80, 15}, {-70, 25}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table = dtheta_FCVC02) annotation (
        Placement(transformation(extent = {{-80, 0}, {-70, 10}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV701(table = dtheta_FCV701) annotation (
        Placement(transformation(extent = {{-80, -15}, {-70, -5}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV711(table = dtheta_FCV711) annotation (
        Placement(transformation(extent = {{-80, -30}, {-70, -20}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV721(table = dtheta_FCV721) annotation (
        Placement(transformation(extent = {{-80, -45}, {-70, -35}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX701(table = dmflowcool_EX701) annotation (
        Placement(transformation(extent = {{-80, -75}, {-70, -65}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX711(table = dmflowcool_EX711) annotation (
        Placement(transformation(extent = {{-80, -90}, {-70, -80}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX721(table = dmflowcool_EX721) annotation (
        Placement(transformation(extent = {{-80, -105}, {-70, -95}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX731(table = dmflowcool_EX731) annotation (
        Placement(transformation(extent = {{-80, -120}, {-70, -110}})));
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
        Placement(visible = true, transformation(origin = {110, -5}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = dtheta_FCV731) annotation (
        Placement(transformation(extent = {{-80, -60}, {-70, -50}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT704(
        Kp=0.13801,
        Ti=0.1,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,25},{50,35}})));
      Modelica.Blocks.Sources.TimeTable dTT704SP(table=dTT704)   annotation (
        Placement(transformation(extent={{20,30},{30,40}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin = {-102, 0}, extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT714(
        Kp=0.02135,
        Ti=0.0125,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,10},{50,20}})));
      Modelica.Blocks.Sources.TimeTable dTT714SP(table=dTT714)   annotation (
        Placement(transformation(extent={{20,12},{30,22}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT724(
        Kp=0.018753,
        Ti=0.01,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-40},{50,-30}})));
      Modelica.Blocks.Sources.TimeTable dTT724SP(table=dTT724)   annotation (
        Placement(transformation(extent={{20,-35},{30,-25}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT734(
        Kp=0.014619,
        Ti=0.01,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-60},{50,-50}})));
      Modelica.Blocks.Sources.TimeTable dTT734SP(table=dTT734)   annotation (
        Placement(transformation(extent={{20,-55},{30,-45}})));
      Modelica.Blocks.Sources.TimeTable dFT101SP(table = dFT101) annotation (
        Placement(transformation(extent={{20,87},{30,97}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
        Kp=0.064422,
        Ti=0.32626,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,70},{50,80}})));
      Modelica.Blocks.Sources.TimeTable dFT401SP(table = dFT401) annotation (
        Placement(transformation(extent={{20,72},{30,82}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-80,105},{-70,115}})));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-80,122},{-70,132}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPTA2(
        Kp=0.14484,
        Ti=0.92999,
        Umax=0,
        Umin=-0.4,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-80},{50,-70}})));
      Modelica.Blocks.Sources.TimeTable ddPTA2SP(table=ddPTA2) annotation (Placement(transformation(extent={{20,-75},{30,-65}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC1(table=dtheta_FCVC01)    annotation (
        Placement(transformation(extent={{-80,-137},{-70,-127}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPT100(
        Kp=0.00024658,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,55},{50,65}})));
      Modelica.Blocks.Sources.TimeTable ddPT100SP(table=ddPT100)
                                                               annotation (Placement(transformation(extent={{20,57},{30,67}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(
        Kp=0.064422,
        Ti=0.32626,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,85},{50,95}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(
        Kp=2.2431,
        Ti=1.1516,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-140},{50,-130}})));
      Modelica.Blocks.Sources.TimeTable dEX721PtSP(table=dEX721Pt) annotation (Placement(transformation(extent={{14,-138},{24,-128}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(
        Kp=1.5095,
        Ti=0.87195,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-100},{50,-90}})));
      Modelica.Blocks.Sources.TimeTable dEX701PtSP(table=dEX701Pt) annotation (Placement(transformation(extent={{20,-95},{30,-85}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(
        Kp=1.8772,
        Ti=1.0201,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-120},{50,-110}})));
      Modelica.Blocks.Sources.TimeTable dEX711PtSP(table=dEX711Pt) annotation (Placement(transformation(extent={{20,-115},{30,-105}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(
        Kp=2.2431,
        Ti=1.1516,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{40,-160},{50,-150}})));
      Modelica.Blocks.Sources.TimeTable dEX731PtSP1(table=dEX731Pt)
                                                                   annotation (Placement(transformation(extent={{14,-155},{24,-145}})));
    equation
      connect(dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
        Line(points = {{-69.5, 5}, {6, 5}, {6, -5}, {110, -5}}, color = {0, 0, 127}),
        Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
      connect(dTT704SP.y, PI_TT704.REF) annotation (Line(points={{30.5,35},{37,35},{37,32},{41,32}},
                                                                                     color={0,0,127}));
      connect(PI_TT704.controlAction, controlSignalBus.dthetaFCV701) annotation (Line(points={{49,30},{62,30},{62,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT714SP.y, PI_TT714.REF) annotation (Line(points={{30.5,17},{41,17}}, color={0,0,127}));
      connect(PI_TT714.controlAction, controlSignalBus.dthetaFCV711) annotation (Line(points={{49,15},{58,15},{58,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT724.controlAction, controlSignalBus.dthetaFCV721) annotation (Line(points={{49,-35},{59,-35},{59,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT734.controlAction, controlSignalBus.dthetaFCV731) annotation (Line(points={{49,-55},{57,-55},{57,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT734SP.y, PI_TT734.REF) annotation (Line(points={{30.5,-50},{36,-50},{36,-53},{41,-53}}, color={0,0,127}));
      connect(dFT401SP.y, PI_FT401.REF) annotation (Line(points={{30.5,77},{41,77}},                 color={0,0,127}));
      connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (Line(
          points={{-102,0},{11,0},{11,72},{36,72},{36,73},{41,73}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_FT401.controlAction, controlSignalBus.dthetaFCV401) annotation (Line(points={{49,75},{63,75},{63,-5},{110,-5}}, color={0,0,127}));
      connect(domegaP401.y, controlSignalBus.domegaP401) annotation (
        Line(points={{-69.5,35},{-5,35},{-5,-8},{110,-8},{110,-5}},          color = {0, 0, 127}));
      connect(
          dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
        Line(points={{-69.5,80},{-32,80},{-32,-5},{110,-5}},        color = {0, 0, 127}));
      connect(dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-69.5,110},{89,110},{89,-10},{110,-10},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-69.5,127},{89,127},{89,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dTT704, PI_TT704.FeedBack) annotation (Line(
          points={{-102,0},{13,0},{13,12},{12,12},{12,28},{41,28}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dTT714, PI_TT714.FeedBack) annotation (Line(
          points={{-102,0},{36,0},{36,13},{41,13}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dTT724, PI_TT724.FeedBack) annotation (Line(
          points={{-102,0},{8,0},{8,-37},{41,-37}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dTT734, PI_TT734.FeedBack) annotation (Line(
          points={{-102,0},{17,0},{17,-57},{41,-57}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(dTT724SP.y, PI_TT724.REF) annotation (Line(points={{30.5,-30},{34,-30},{34,-33},{41,-33}}, color={0,0,127}));
      connect(processVariableBus.dPTA2, PI_dPTA2.FeedBack) annotation (Line(
          points={{-102,0},{-3,0},{-3,-77},{41,-77}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(ddPTA2SP.y, PI_dPTA2.REF) annotation (Line(points={{30.5,-70},{35,-70},{35,-73},{41,-73}}, color={0,0,127}));
      connect(PI_dPTA2.controlAction, controlSignalBus.domegaP901) annotation (Line(points={{49,-75},{80,-75},{80,-5},{110,-5}},                   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCVC1.y, controlSignalBus.dthetaFCVC01) annotation (Line(points={{-69.5,-132},{-7,-132},{-7,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(ddPT100SP.y, PI_dPT100.REF) annotation (Line(points={{30.5,62},{41,62}}, color={0,0,127}));
      connect(processVariableBus.dPT102, PI_dPT100.FeedBack) annotation (Line(
          points={{-102,0},{-50,0},{-50,5},{7,5},{7,57},{37,57},{37,58},{41,58}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dPT100.controlAction, controlSignalBus.domegaP101) annotation (Line(points={{49,60},{68,60},{68,-7},{110,-7},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT101SP.y, PI_FT101.REF) annotation (Line(points={{30.5,92},{41,92}}, color={0,0,127}));
      connect(PI_FT101.controlAction, controlSignalBus.dthetaFCV101) annotation (Line(points={{49,90},{62,90},{62,88},{76,88},{76,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT101.FeedBack, processVariableBus.dFT101) annotation (Line(points={{41,88},{5,88},{5,2},{-102,2},{-102,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dEX721PtSP.y, PI_dEX721Pt.REF) annotation (Line(points={{24.5,-133},{41,-133}},                 color={0,0,127}));
      connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (Line(
          points={{-102,0},{-51,0},{-51,-44},{7,-44},{7,-141},{36,-141},{36,-137},{41,-137}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX721Pt.controlAction, controlSignalBus.dmflowcoolEX721) annotation (Line(points={{49,-135},{86,-135},{86,-5},{110,-5}},
                                                                                                                                         color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX701PtSP.y, PI_dEX701Pt.REF) annotation (Line(points={{30.5,-90},{34,-90},{34,-93},{41,-93}}, color={0,0,127}));
      connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack) annotation (Line(
          points={{-102,0},{14,0},{14,-101},{35,-101},{35,-97},{41,-97}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX701Pt.controlAction, controlSignalBus.dmflowcoolEX701) annotation (Line(points={{49,-95},{83,-95},{83,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX711PtSP.y, PI_dEX711Pt.REF) annotation (Line(points={{30.5,-110},{33,-110},{33,-111},{35,-111},{35,-113},{41,-113}}, color={0,0,127}));
      connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack) annotation (Line(
          points={{-102,0},{-46,0},{-46,-1},{11,-1},{11,-119},{36,-119},{36,-117},{41,-117}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX711Pt.controlAction, controlSignalBus.dmflowcoolEX711) annotation (Line(points={{49,-115},{88,-115},{88,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX731PtSP1.y, PI_dEX731Pt.REF) annotation (Line(points={{24.5,-150},{30,-150},{30,-153},{41,-153}}, color={0,0,127}));
      connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack) annotation (Line(
          points={{-102,0},{-50,0},{-50,-2},{5,-2},{5,-157},{41,-157}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX731Pt.controlAction, controlSignalBus.dmflowcoolEX731) annotation (Line(points={{49,-155},{71,-155},{71,-149},{90,-149},{90,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent = {{-60, 32}, {60, -28}}, textColor = {0, 0, 0}, textStyle = {TextStyle.Bold}, textString = "PI
Control")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1})));
    end ThermalPlantController;

    model TestActuator
      extends Modelica.Icons.Example;
      replaceable ThermalPlantController thermalPlantController  annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CentralisedSystemI_B_InitForward centralisedSystemI_B_InitForward(
        m_flowcool_nom = 0.35,
        TT704Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15),
        TT714Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15),
        TT724Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15),
        TT734Offset(fixOffset = true, y_Offset_fixed = 20 + 273.15),
        FT101Offset(fixOffset = true, y_Offset_fixed = 5.7166667),
        FT401Offset(fixOffset = true, y_Offset_fixed = 3.2666667),
        PT102Offset(fixOffset = true, y_Offset_fixed = 0.0e5),
        dPTA2Offset(fixOffset = true, y_Offset_fixed = 0.015e5),
        EX701PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX711PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX721PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX731PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        thetaFCVC01Offset(fixInput=false, fixOffset=true),
        thetaFCVC02Offset(fixInput=false, fixOffset=true),
        thetaFCV101Offset(fixInput=false, fixOffset=true),
        thetaFCV401Offset(fixInput=false, fixOffset=true))   annotation (
        Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
    equation
      connect(centralisedSystemI_B_InitForward.processVariableBus, thermalPlantController.processVariableBus) annotation (
        Line(points={{51.36,0},{66,0},{66,-48},{-66,-48},{-66,-0.38},{-48.02,-0.38}},color = {255, 204, 51}, thickness = 0.5));
      connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
        Line(points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
                                          color = {255, 204, 51}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(
          StopTime=4000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end TestActuator;

    model TestActuator_IdealWater
      extends TestActuator(centralisedSystemI_B_InitForward(
        redeclare model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidIdeal,
        redeclare model WaterCold = DistrictHeatingNetwork.Media.WaterLiquidIdeal));
      annotation (experiment(
          StopTime=6000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end TestActuator_IdealWater;
    annotation (Icon(graphics={Bitmap(
            extent={{-80,-80},{82,80}},
            imageSource=
                "iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAAAXNSR0IArs4c6QAAH0FJREFUeF7tXWmAHFW1/k53NgIEeOBjVwRkF56AgGxJVwXZVEBZBERmqkJAFBdQwAWJqA9EERUUCVM1YUcCLsBjTVUnbA8QkIeyKIuyI4bFhCXJMH0eNZPpul3VPX2ruqq6JnX730yfe+4537lf17117z2HoD4KAYVASwRIYaMQUAi0RkARRI0OhcAoCCiCqOGhEFAEUWNAIRAPAfUEiYebalUQBBRBChJo5WY8BBRB4uGmWhUEAUWQggRauRkPATmCmM4CgGqwtEq8blQrhcDYRECSIC4PuWdpcvJjEwtltUIghIDcgDcVQdTYKSYCiiDFjLvyWhIBRRBJoJRYMRFQBClm3JXXkggogkgCpcSKiYAiSDHjrryWREARRBIoJVZMBBRBihl35bUkAoogkkApsWIioAhSzLgrryURUASRBEqJFRMBRZBixl15LYmAIogkUEqsmAgoghQz7sprSQQUQSSBUmLFREARpJhxV15LIqAIIgmUEismAoogxYy78loSAUUQSaCUWDERUAQpZtyV15IIKIJIAqXEiomAIkgx4668lkRAEUQSKCVWTAQUQYoZd+W1JAKKIJJAKbFiIqAIUsy4K68lEVAEkQRKiRUTAUWQYsZdeS2JgCKIJFBKrJgIKIIUM+7Ka0kEFEEkgVJixURAEaSYcVdeSyKgCCIJlBIrJgKKIMWMu/JaEgFFEEmglFgxEVAEKWbcldeSCCiCSAKlxIqJgCJIMeOuvJZEQBFEEiglVkwEFEGKGXfltSQCiiCSQCmxYiKgCFLMuCuvJRFQBJEESokVEwFFkGLGXXkticDYJEjvvK1QKh0NYBswP4ZS6Rr0Ve6R9FmJKQSkERh7BDGrXwH4ZyEPmWbBrnxP2nMlqBCQQGBsEcRwZoHo9FH8MmFptoTfSkQhIIXA2CFIz/w9UK7dPqpXzMvA4zZF/9TnpLxXQgqBNgiMHYIYzlMg2rjuD/MTAH0dhDkA1vD/j9mwtWNV5BUCSSAwNghiVE8H8SzB4TdRHrcZZu/5EkxnT4AWNIBB5Y3RN/XvSQCkdBQbgfwTpKc6CWV+MfCUOAm29tN66Az3QhBmCk+Xc2DrXy92aJX3SSCQf4IYzldBdK4whXoOtvb+BuePdjbBOHpSIMgLsPUNkgBI6Sg2AvkmyCFXl7Hqms+CaD0hTCfC0nzCjHxhOlcDdEhdroZp6Ncap17FjrXyPgYC+SaIWT0Q4N8JT4/FqNF/Yk5lSchXs7oPwDcJ/78QlnZcDExUE4VAHYGcE8S9FsCnBYKcB1v7ctP4zbx/PAb//QZAk5d//zo2rKyFWVRT8VYIxEUgvwSZedtqGCz/C8B4gc47ok97oKWzZoBQ4Kmw9NH3TuIip9oVAoH8EsRwjgPRBcLT43HY2pajRsVwekDUL8icDks7oxCRVE6mgkCOCeI6IGgCQU6Grf14dILcuR5o2Qt+G67C1n0dqUColK7ICOSTIMadqwJLXwdRuQ7+IK2LOZWX2wbDcJ8FYcMhOcYSLF64CuYeOti2nRJQCDRBIJ8E6XUOR4muEOx9CJb2EakIGs6VIPpsXVa97pWCTQk1RyCfBDGcK0B0uDBV+h5sXTxq0jqehnMCiH7ht1XH4NXgj49A/ggyi0t41vWmV1N8t8rbw5r6Jyk3Z7g7gHG/IHszLG1fqbZKSCEQQCB/BDGqu4P4DuHpEf3YiOG8CaKVh9ch/Apsfe0xGfled28QbwZgALXSfMypPD4m/RjDRueQIO4ZIJwmYBp9R9x07wSwW10H1dZB3/R/jpk4zXD3A/O5AHnk8D8MF6gdA3v602PGlzFuaP4IYrr/C2AXYVQcCkufGwnn4Olewv7o026MpKNbwoZzzHtnz2aP3j0fA0vv65aJReo3XwSZef9kvLvoTRB8u8qDq2P2Xv+OFBTT+RJA59Xb1Og76K/8MJKObgi3um8fsoVrAH0cluZ0w8wi9ZkvggQPJwLyr3fFqPW6U1HCfOEpNBeWfmiuA9vs4tfwGuomgP4C4AQQJtV9YF6EQWyPi/Wncu3XGDcuZwRxfwngeGEQxLv4dMQda2ClgdeE2DwJS/tQrmNluA+BsJ1A6tdAXEHf9IeH/jdj3rZguh2g1Xx88H+wtf/KtV9j3Lh8EcRwHwdhc4Eg+8HWxSPs8nAb7ksgrFNvsGjSZMzd9R15BRlKhs+QAYO0Zeit1Yx5e4FLtzZYVuMj0K9fmaG1heoqPwQJ/+oDywZWwaV7vxUrIoZ7GwjT622ptl391ziWwhQbme4TADYVfhh+BFs/tWmPhnsOCCcK3z0CS9smResKrTo/BDGcfUHkv2li/jNsfdvY0TGd8wD6kjBlif42LHbnERqazk4A3SuQ4y0sXXk9XL7LouYEGTqn9nzDRirTHrAr3qtt9UkYgfwQxHS9rIjfFebXF8HW/EQMUR0P3mUHnwZL/0FUNanLG+75IHxR6OcCWJq/DmtmgOGcBaJThK+ugKUdmbqtBewgRwRxbgVor3oMamygXxfvdkQLT2/1Eyjx9cIT5DJY+lHRlKQsPa06Dhvzv0BYXbCz/SWvGQu2BA8+Kjx1lmHcaqtg9o4DKVtcOPX5IYjhLgJh1XoEqLwV+qY+FjsiPdUtUGahPd8HS985tr40GhrzKqCSKwx0+WMxhvMwiD4sPHEPgK1dl4aZRdaZD4Ic426NGrx3/cMfxuL38l4JhxVjhGgoI8paA/VNR2/fwNb9V6QxVCbeJJwQ71xYmrgAb92l6fwAoG8LT54+WPoxidtYcIX5IIhRNUHsH51g3AJb26fj2JjOMwD5ObTydibLcFwQVfxpJfZBv3aLlN898z+Kcu0+4enzImx9fam2SkgagZwQxO0DwfSDndAdDiNwbXewtCfmTPNPCkvDlILg8BPOO1Yj7I5PmAJ798XSvQWnpeCNYOnPSLdXgm0RyAdBTNebXm0d65d0NBcNdzYI/rSDuRe27iW77v7HdL3TxuKr2adgaf5eiIyFhnM9iD7h40ZHob9ymUxTJSOHQPcJ4t0/p2WN7/yXTF6t5T6AnF/DUoZzKojOTPzJFMWGVrKmezKAHwlTpKtg6/4tSpk+DPcbIJzt60Bnr8Zl+iyYTPcJEjo+wY/B0rdKJA5G9UgQ+7+ojH7YmpGI7k6VGO5vQPAPUDJ9HXblnEhqjfkfA9XuFgiizmZFArC9cPcJYrrfBPDfgqk2LM1fj7T3obVEsOgO5ygNULDeSY119Ov+K18Zv4ezSS4BqDQszjU8VZqI+ZV3ZZormfYI5IEgVwE4TDD1i7C0X7U3XUKip7oRyuzXCWF+Gra+iUTLdEWOvGcKJr3deMcl7rQytH7jHdCvP5iuA8XR3n2CGO5jIGwhQL47LO2uREIQ3AsB3oWl+alME+kkhhLT1QHME1pGX6CPNDbdywEcIehSdRpjhKRVk+4SxDtqsUltqT9FAJD0sXTD8Q72+fsDA7wBLtH97IsJgimtyqyeAvBZwtrhatia+BSVVoXgYh+Q32yU76Wwkt0liFHdEcR/9AdKClMgw7kbRB+r91Hj3dCv+wvbboQ+WMuE0T6tais7TXd/ADcIX98IS/P+pz4JINBtgjTuoIN/D0s/KAG/fBXBt0V5uGCUxAJ9xMOeBR9CefBviUzXEgV+xVDWZYK4vwDhBOEJIp9BURZ/0/nxUDXckQ/zN2Hr/vRGVk9Sckku0D2bhhPtLavnMWYexPu1CaouSjIB6y5BTLcKYJo//cGB6Nf+kIxry7UEU5GCz4el+6RMtDMJZcEFulfO2tYb819JqGkQCb7oqNW2Rv90/zh8VH2dyg/nVp4KYEMw/xG1spObIz4RfesuQQwvxahwF4JrmySeFM1wDgLRb/0nCK6FrR0cEafkxMOL6t/A0vxk23F6Mtwb4OX+8p38FCxduAsTR2mMNob7LRC+AKBZAdUn37s5uS+sil9sNUYXWTfpHkGOuuP9mDAgHKzjt2Hpw+lCk/z0OruiROJr43tgaf6iPcm+ZHQluUAf6c8MZIOp4Svo1/wE3jJ2dSpjOL8FUbv14+vg0v6wp3nJAcfEp3sEMZ1PAuRf8GG+G7bupwtNCj5j3sagkpA7ip+BpW+UlPrIepJcoI90HjyTlfWr3uA6b1RQ+G0MljaRqvUSGdzkG3SPIMOPYzHb4a9gaeLd7GS87alOQpn9dD9eUR1bWykZ5RG19FRXR5lfb2gVJ3NksNve6sEosZ+elTOcRvZWP4cSX9pgEuMfIHwf7PlKB4Lw+YDJnU8rRYVeRv8a7QKqLUUND2L8+Jcwe8+XIkanqXj3CBKua34s+rU2OWljumw6XvVb4TbhpDVh7SomloupOGKzNBbongnB/STgAVjajhGtiyduui8CWLfe2CPH0snbNZzG7nVnooQLGzrwLor1VYTslzG69zLhgC6sVxQTVTDuBdP5nR7/7x5BgkniwDvD0v0bcjHwatkk2Fe33vKEj7hfCVsXj4nE83pmdS0MslcRePiTVckHo/pFEJ/fYPRgaSfMmeZv/o58GczewmhflHU0NAxnFohOlwDsYlhaj4Rc3p4gLjdONaasjNk7vh3XkVHbGe58ELzXjssHEO0FuyKehUql25DSNBbo/gB8p+F2oqXJ/fh14nkweyXzHNh6b1OVM6obgPm5xu/oIFiV30c2wahOB/Ft0u0Y82BrfsYc6YYQsqiP1shcPpiTAj2YpAH4Oyxt4wh2RxM13cYTw7Uu3bwLLtCTmGbUCeI8BSIfw2XjP4BL93g2GlARpMN1JAEqb4y+qf7p6aA607kIoBn+v/lSWHpwfdLeCMP5G4gacy0z/gfgJ0C0B4AdQkqYvwZb/1l75QEKSzWISpCe6joo17ybbh8HSKK6k/cwSfMHL239EijmwAQJK+VFQv7IOOjFWJg4MAMUMe5NuwnobeoFA1wCqHHi0s5hOeuiEiT4i93OiiHQ5Expq6qpgAyA8TRLtwq6GGdwjNpZ2hgGOo/bXdx29e6jKAjKjjIOWsRDblRGJ4iXmWOVlvEMGhPFZ+kROYpg1v0lYXM7HSGfUv5RiE3wgKGx9bQDJOb3AXvSIsjoz7FuEyT1J1az4GTMyiwHXid9RYElaj+hp3azicroQl0iSMozqnY/HlGBbqdP6vsoI0FKYRuhFPvrGL+4tsVo17SJtx7xxmCz4d/YIHuCxPAxieGywusIPZVjLIClQEoigDF0xCVljK5EGLIliPeaOJQwjf8ES99eKjadCI2so0Z0dFKcJ6odve7OKOEeYZ35HGzNT4kaVV8z+WPmbYZa6a9CH51txLWyKXy/JvpmZ6+zPUr0gGDrGxg3Zf1R98FC1Y8jXC02nXsB2qktzDU6BP2Va7pLkFAeXo6eMK2tp00EDPfZhiMJ7/KmmRXA7HW+gBL5mVoY18HWDojjRss2XoXgwUV+Na4kEoA36yy4l8M4DLZ2dWRfwlW1Wu9ThIu7evOjD8Oq+AnPRzPAuHM90NJvgvH5hsJDw23+DsZteJfPaJarIPsniOGeDcI3/F+PhPLwtouQ4dwHoo8K/WZXlSmUAjUln4NnzpJ+SvbO2wql0iMNUHPEfMIjjQ3nOBBdIOh6Hpa2YSiMvbe/DzTw0Hu149cTvvsDLO3AdiFv+r23RzeO1wdoPEqrPtzu9Eb2BDGd6wD6pGD8kbC0K2I5G6VRqF/OriSb6d7fsLvLSKeWh+E8AiI/K2Wptjkumi7eV4+CWFg2fAL7ZljavrGUeleFn3MfA8i/TRk8qjKc9eauxukRLwWVNkVf5flY/UZslD1BQtdDM0p0Zrq/BnCsjw+fAEtvPGgXETxp8eD6hyesD3t37xRssh/DvQXknV5Y/qlhGvq1BYl1Yrh/BME/JVxDZyewm02dmH+H2rhTUKrtCWKvkGkwoffpsLQzEvOpjaJsCbJhpdyQYMAzLulpQCuHDfcMEE4Tvj4Tlvat1IE23O1AeKjeD+MN2NoaqfRrul7m+qN93dQDq3JxIn0FDxsyGEvGr4kr9mi83xK1M8O5C0S7SjXzDh0uXrgP5h46KCWfgFC2BGFsAcLj/mDh7Iq+hBfK2SSyDtZAZ9wKW9s7gdg1mQKFjoCfAUuTORLe3pzQXXq+A5a+Z/uGbSRmzFsbtdICEDYfXZJvx+SlH8d5+y3tuM8ICrIlCODVsvCTnGWZTDqYvAGIP3+OADAM9+cgfFn4UWhdAz2K3maywWz24OQKlwbXUTU+Hv26uMiOb72XCmniWzc3JPhr1PYAFk3aA3N39W+Gxu8tUstsCcL8hcCbiwthacdFsjiucHAvAngIlvaRuOqk25nO7cDQEezhT9zXojIdhm8W3gVL212m6agywSTgnvBAbS1cMv3VjnWLCgzHO/19JMCfAagG4DowXYX+ipg5MtEu2ynLmiDngOgkYbB8G7Ymlj5oZ2/878NZVF6Dpa8ZX6FkS9N5C6DJdenB8maYM/UJydbRxELFiPifsPR1oilpIh1OVZTN07djwztXkC1BAC8/1acFs7N5xet1GM70DixaOC7VBV8oLWhKqY0af4UXgsgn/iCthDmVJR0NlfBr6qNha5d0pHOMNM6WIMwPgsg/VsKlXTPNkWQ4LzRsOKX5a+4NgBnVw8Ds3WZc/uHbYen+1d80BknoSEaEHedm9oSnVwNYNrAGLt3b37VPw4+c6MyWIID3StB/xVket15S6Vmk8DTce0DY2R+vNQ32dC/9aTofwzkLRKcIBPk5LP2r6XS2XKvhXtyQZqfJ+aJI/QfrsWeZUiiSoekIZ00QYay8l2TZ1sel41YLrYZ7DQifEYz4PCy9MadTkgYFN+4Y6U9NwuuFzl71Bp+6jINha9cmCVOedWVHkPC9lL/C1sTKUunjZDjngsj/BWek+5IgmHt4sLwt5kz9c6qOBouiejvTti6u++S7n1GdBu9VfH2GyK9i8atrp7puk7cuE8nsCBJ2J/s3IUb1JBD/RDDlAlja8akgHU5zMwCrMjFy1oCoxs28bTUMlt8Qmj0JS2vMACKr03BtEIQ0PvwTWLp/0FRWzxiW6x5BmH8NW/cygWf3MdxDQfiNMMW6Hpb+qVQMCOYeBt8HS/fXP6l0ulyp6Xr5p/wM6+UpEzB7x4FIXZ5w40S8NfFVEA0nFPeOlnD5A+ifGshtFUnrmBPOjiDhm12nwNK81EDZfUKZ3lO8rGW6333v0sL3BOey2xQNnlxule1wNOTDR2RiJ1/LLsDJ95QdQYKJEtLcUW6FU++CDVEaFJKpcXqbhabrZQz0L0V1evI1SuxN1yOmR9DhD9OXYFd+GUUFTOdBgPyTBgVbnI9glR1Bgk+QOL9qkSLcQth0vamG//YsiY20Zl2ZzjMA+ddqs/S31z0AJQgpPXkuLP1QafhMZ6f3it3c6xOseIvz7AkSjE6Z3ofZlYXSQUtK0HS9Ckeb1NVRbTv0TX84KfVDeo64Yw2sNNCYPT6ptK0yhgaTWSPikZPgsfm03/bJ+NQlmeyeIA0O8lJY+qSu+Gy4t4Ew3e87ZgLl0YwPljkAPwxL3y5Tfw3ngYZTC4O0JeZU/KsGrYwZIveylwCauFzkTSwbWKcoO+dBWLpEEDwCS9sm0wEz0pnhevUkZgp9nwhLOzdRW4IVnxjZ3D0RnTDcH4LgXwjzTlLbunercvRP+GLZ2bA04TRAOwUr1vfZECScl/YG2Lp4Lz07VA3nVBCd6XeYQtXbUG7iDK/3jjjW605FCWKBmvb7TsP3Ml70X+3yMrzL6yV+rD27aHfcUzYECZmZwqCUhSK4F+Klzbc17yJXcp9gev6sD2WOeGK6jTmSl0xeraHyU9BjwzkTRN498JFPdq+mk0M/UU3ZECT8BPkmbP2sRD2RVdYz/6Mo1/xKVsyPwta3lm3eVi5YExFcw2Bp5Y6PnLftuImA6VwC0FHCN62vF5jOB8Dw6m5MGJYfW8U248Aj0yYbgoT2QOhzsCuXyxiYuEyoXBnega35F5o67TB8filZAkaxz6juDuI76k1Gq7RkOgsAEu+YfwuWJkxFo3S84shmRJAAYEmno4kaD8N9GwS/0u0Ab9Asq15UtUPyhnsiCOf4bRO8Fx7HINP5a0PuqWZvs0zXq5Po/2AxP42nS5tjfuXdOF2uSG26QxCubQJ7+tNdAzL4CrTGOvp1NxF7DPcyEI70f7Xjlf5KxBZPiel+DcBPhafIAtjatPrfw/fYvRO7fj2XJPFIzJHuKOoOQbLcNGuGa3gQy70ClYmR6TwK0JZ10cHSnpgzzZ/myOhIUuaQu1fCqu94tfvWF55qPwfxmRgsHQDin9bfWnkCjNmwNSHBXpLGjD1d6RMkvEB/BbYuUbcwRTAN9zQQhOx8nMxNv+Orq2Ape2+O/E9aR1miwNNbPRglntu2iXcl+unSzmpq5SOVPUGyLHLfakSYziEAiRnJ2+8RtB1d3vrD2RdENwrTq+4t0IP2Go4Lr6puyw+/hvL4bTK9Ai2DaZdlukAQ/j0s/aCu+t2z4MMoD4rnr5IpQ2063wfoO8J8/yLYmrhr3z23e6qro8TXg9AkTxb/CTTuM6OWcO6e5V3tOX2CBN1jnAdb8zMNdsv9YELpJNZFoV9pTvfOexzsvHsqzPsA2BbAfSDcCEsXb1nG0brCtkmfIOHSWdlflGoWvuCp3o7vizPBqHqvj/1DmFkW6Vlhh2h3HcuAIIGCnTU+Av36ld11e2i/4gYQ9heWY4fDqgg5rCJaGEz7yfwqbH2tiFqUeM4QSJ8gwV30br/2HAlAMGcVc2dJpc3qVwD+mbD+uBa2dnDO4q3MiYhA+gQJ3SSkD2JO5R8R7Uxe3Kx+FmD/Sca4Bbbmzc3jfUznaoAOERonf4w+nmWqVQcIpE8Q0TgvM8biheNzkVepp7oFyvyYb16H99MN9xUQ3ifo2xmW7h+K7CBIqmn3EEiZIIHHB+Nl2Nq63XO3ga0Es+oVYxlf/+8grYs5lZcj22cu+Agw+KAwvVqCxQtXycUPQWRnVAMRgXQJEt5FfxC2vkNuQhBO9LwvrMrNke0zq6cA7B/fT7OKVGTjVINOEMiaIDfB1vfrxOBE2xrOBSASCvjQqbAqP4rcR3iXWq0/IoOYzwZZE2QObF1IZdllUMzqsQCL97R/C0sTkltL2HfIIxOw6stvg6hcl6byVuibKqxvJPQokVwikDVBOnuVmjSEwbUDsBCWJiy0JTqc4e4H79qu/3kelrahREslMgYQyJYgQM6mHkO73281XJ6KWlQnVKRTHRcfA+Ne2sSsCZJdyTVZCEznVoD28t9AcS9s3as3Lvcx3MdA8Ms4MH8atv47ucZKKu8IpEuQ4C46MB2W5uQKFKN6Oohn+QSBBVubIWVjsDwZ8yDGrTYFs3d8W6q9Eso9AukSJJTRvcN6eWnAGcqCCPk1RLA8WVa119PAQelsikC2BFk2cW1cutsruYrFUJqemlequVS3q1bbGv3TH21rZ7A8WY2OQn/lsrbtlMCYQSBdggRhSOLORRrQGu4dDReJGCfD1n48alc98/dAuXa7MDVbgpWXrI7z9vN259VnBUEgPYKEplcMWLpcf1mDGyx8yWjM/NHMnmCOX+YrYete+hz1WYEQkBuwI7fvZJ8Awdt6HmAeYWxNrr+sATbczUFozHxeHlwds/f6d0tTTNcrb+CXtPbulvRp/n30rH1Q/aWCgNyAXdEJ4kFruk8A2FRA2YSl2U1R73VnooQLhe9eh6X9RyoRUkq7ikB6BAmXfc7vE8QLgeHMAtHpfjRGKboZzH0F/gEs/bSuRlJ1ngoC6REkvAcCyE7RUnG1jdKe6joo115oeJuFJq+lgzmmmJdhXGn9rlTL6gZOBeszPYKE90AAqyLXX7eCYDjXg8gvhcC4HLb2uQZzQqUN1NGSboUri37lBmysNUi47nOunyBD0yz3UyD8oQH4Gu+Gfv3uof8Z7tkgfKP+PeMdlGofRN/0f2YRLNVH9ggoggQxDya29k74AgeCaRcQN+aPYu5enZPsx0ohe0yPIE0eILl/ggy9zQqUQG41LFSJgEIQJj2ChIrm5HgfJPQUcc8B4cSWI4D5LVBpF1iVvxRilBTYyRQJ0gTVPL/FCpNkPghTm44N5v1g6zcVeNwUxvUUCTIGF+li2L26GlOWHAfGl0HYaOgr5mswMOEkXLrHs4UZIQV3NEWCjPEniGi+Wd0GiyY+hbm7vlPw8VI49xVBChdy5XAUBNIhiOEymmkeS2uQKCgq2RUWgXQI0uw0rwehIsgKO5BWVMfSIYh6gqyo46VwfimCFC7kyuEoCGRDkJEqU2qKFSU2SjYHCKREEIdBTVQrguQg5MqEKAikQ5DgIn1kz1ARJEpslGwOEEiHIKFF+nKGKILkIOTKhCgIZEMQ9QSJEhMlmyME0iGI2gfJUYiVKZ0gkA5BjMAiXb3F6iRGqm0XEUiHIOoJ0sWQqq6TRCAaQWR7bpbyR64n2R6UnEKgUwTmw9Iq7ZTIDVvTrQKY1k5Z/fuRKdXIPzzCeDcMm+2NSCtVggqBBBFgzIOt+XVhWqiWI0hUu0z3KgCHDecbXd4F81Ww9cOjqlLyCoFuIpAOQYaSsPE5YOwF4hqYbkGpdrJKj9PNUKu+4yCQDkHiWKLaKARyiIAiSA6DokzKDwKKIPmJhbIkhwgoguQwKMqk/CCgCJKfWChLcoiAIkgOg6JMyg8CiiD5iYWyJIcI/D/DXaM9FpgVAgAAAABJRU5ErkJggg==",
            fileName=
                "modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/controlvar.png")}));

  end Control;
end Tests;
