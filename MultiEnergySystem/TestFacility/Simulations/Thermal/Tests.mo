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
        replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

        parameter Integer n = 3;
        parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
        parameter Real pumpcorrectionfactor = 1;
        parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";
        parameter DistrictHeatingNetwork.Types.Temperature Tout_SP[:,:] = [0, 76 + 273.15; 1e6, 76 + 273.15];

        // Gas composition
        parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};

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
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixPTi = "PT101" "Matrix name in file";
        parameter String matrixPTo = "PT102" "Matrix name in file";
        parameter String matrixTTi = "TT101" "Matrix name in file";
        parameter String matrixTTo = "TT102" "Matrix name in file";
        parameter String matrixtheta = "theta_FCV101" "Matrix name in file";
        parameter String matrixfreq = "f_P101";
        parameter String matrixFT = "FT101" "Matrix name in file";
        parameter String matrixmflowGas = "FT801" "Matrix name in file";
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
          openingChar=openingChar,
          Pmaxnom=147.6e3*0.78,
          GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState))
                                                                  annotation (Placement(transformation(extent={{-30,-28},{26,28}})));
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
        Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=Tout_SP)
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
        H2GasFacility.Sources.SourcePressure sourceGas(
          redeclare model Medium = Gas,
          X0=X_gas,
          R=1e-3,
          computeEnergyVariables=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-2,-60})));
        Modelica.Blocks.Sources.TimeTable m_flowgas_ref(table=[ts,m_flow_Gas]) annotation (Placement(transformation(extent={{40,-46},{52,-34}})));
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
        final parameter Real m_flow_Gas[dim[1], dim[2]]= Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixmflowGas, dim[1], dim[2])/3600;
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
        connect(gasBoiler.outlet, sinkMassFlow.inlet) annotation (Line(
            points={{9.48,32.2},{9.48,42.1},{10,42.1},{10,52}},
            color={140,56,54},
            thickness=0.5));
        connect(sourceGas.outlet, gasBoiler.inletFuel) annotation (Line(
            points={{-2,-50},{-2,-41.24},{-2,-41.24},{-2,-32.48}},
            color={182,109,49},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), experiment(
            StopTime=4000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end TestBase;

      model S100_Seq_0412Test1
        extends TestBase(Kv= 33, MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test1.mat"),
            gasBoiler(Pmaxnom=147.6e3*0.78));
        annotation (experiment(
            StopTime=3325,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S100_Seq_0412Test1;

      model S100_Seq_0412Test2
        extends TestBase(Kv= 33, MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"),
            gasBoiler(Pmaxnom=147.6e3*0.75),
          GB101_ToutSP(table=[0,76 + 273.15; 3400, 75 + 273.15; 1e6,75 + 273.15]));
        annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_0412Test2;

      model S100_Seq_0412Test3
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
        annotation (experiment(StopTime=7200, __Dymola_Algorithm="Dassl"));
      end S100_Seq_0412Test3;

      model S100_Seq_1701Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
        annotation (experiment(StopTime=2700, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1701Test1;

      model S100_Seq_1701Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test2.mat"), gasBoiler(GB(
                tdelay=20)));
        annotation (experiment(StopTime=5600, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1701Test2;

      model S100_Seq_1701Test3
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"), gasBoiler(Pmaxnom=147.6e3
                *0.75,                                                                                                                                                     GB(tdelay=20)));
        annotation (experiment(StopTime=7800, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1701Test3;

      model S100_Seq_2601Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2601_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=4500, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2601Test1;

      model S100_Seq_2901Test1
        extends TestBase(Kv = 33, MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Gennaio 2024/2901_Test1/Temperatures.mat"));
        annotation (experiment(StopTime=12000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2901Test1;

      model S100_Seq_3001Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test1.mat"));
        annotation (experiment(StopTime=1500, __Dymola_Algorithm="Dassl"));
      end S100_Seq_3001Test1;

      model S100_Seq_3001Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"),
        gasBoiler(Pmaxnom=147.6e3*0.78), GB101_ToutSP(table=[0, 76 + 273.15; 3400, 76 + 273.15; 1e6, 76 + 273.15]));
        annotation (experiment(StopTime=3900, __Dymola_Algorithm="Dassl"));
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
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1004_Test1.mat"),
            GB101_Status(table={900,4.05e3,4.6e3}, startValue=false),
          gasBoiler(Pmaxnom=147.6e3*0.92, GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState), Tout_start_S1 = TTo[1,1]));
        annotation (experiment(StopTime=9000, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1004Test1;

      model S100_Seq_1704Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1704_Test1.mat"),
        gasBoiler(Pmaxnom=147.6e3*0.85), GB101_ToutSP(table=[0, 77 + 273.15; 3400, 77 + 273.15; 1e6, 77 + 273.15]));
        annotation (experiment(StopTime=7900, __Dymola_Algorithm="Dassl"));
      end S100_Seq_1704Test1;

      model S100_Seq_2904Test1
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2904_Test1.mat"),
        gasBoiler(Pmaxnom=147.6e3*0.85), GB101_ToutSP(table=[0, 77 + 273.15; 3400, 77 + 273.15; 1e6, 77 + 273.15]),
          GB101_Status(table={970, 8600, 12845}, startValue=false));
        annotation (experiment(StopTime=14400, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2904Test1;

      model S100_Seq_2904Test2
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2904_Test2.mat"),
        gasBoiler(Pmaxnom=147.6e3*0.85, GB(tdelay=60)),
                                         GB101_ToutSP(table=[0, 76.8 + 273.15; 3400, 76.8 + 273.15; 1e6, 76.8 + 273.15]));
        annotation (experiment(StopTime=4140, __Dymola_Algorithm="Dassl"));
      end S100_Seq_2904Test2;
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

        parameter Real nR = 5 "Total number of resistors";
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
          Pmaxres=Pmaxres,
          EB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState))
                                                                                              annotation (Placement(transformation(extent={{-28,-32},{30,26}})));

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
        extends TestBase(MeasuredData= Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"),
            nR = 3.8, EB401_ToutSP1(table=[0,76 + 273.15; 1e6,76 + 273.15]),
          EB401_Status1(table={537,768,2271,2500}));
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

    package S500 "Test package for system S500"
      extends Modelica.Icons.ExamplesPackage;
      model TestBase
        extends Modelica.Icons.Example;
        replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
        replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

        parameter Integer n = 3;
        parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
        parameter Real pumpcorrectionfactor = 1;
        parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";
        parameter DistrictHeatingNetwork.Types.Temperature Tout_SP[:,:] = [0, 76 + 273.15; 1e6, 76 + 273.15];

        // Gas composition
        parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};

        // Temperatures and pressures
        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S5 = PTi[1, 1];
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S5 = PTo[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S5 = TTi[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S5 = TTo[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_CHP = TTi_CHP[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_CHP = TTo_CHP[1, 1];

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

        parameter DistrictHeatingNetwork.Types.Length Di_S5 = 42e-3;
        parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;

        parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient";

        parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;

        parameter DistrictHeatingNetwork.Types.Density rhohotref = 985 "Reference hot water density";
        parameter DistrictHeatingNetwork.Types.Density rhocoldref = 999 "Reference cold water density";
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2407_Test1.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_low_start = 1.4 "Starting mass flow rate rack side";
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_high_start = 1.70 "Starting mass flow rate CHP side";

        parameter String matrixPTi = "PT501" "Matrix name in file";
        parameter String matrixPTo = "PT502" "Matrix name in file";
        parameter String matrixTTi = "TT501" "Matrix name in file";
        parameter String matrixTTo = "TT502" "Matrix name in file";
        parameter String matrixTTo_CHP = "T2_CHP";
        parameter String matrixTTi_CHP = "T3_CHP";
        parameter String matrixtheta = "theta_FCV101";
        parameter String matrixfreq = "f_P501";
        parameter String matrixFT = "FT501";
        parameter String matrixFTCHP = "M1_CHP";
        //parameter String matrixmflowGas = "FT801";
        parameter String timenoscale = "time" "Matrix name in file";
        parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";

        DistrictHeatingNetwork.Sources.SourcePressure
                               source(
          use_in_p0=true,
          use_in_T0=true,
          p0=pin_start_S5,
          T0=Tin_start_S5,
          R=1e-3)
          annotation (Placement(transformation(extent={{-10,10},{10,-10}},
              rotation=-90,
              origin={-14,60})));
        Modelica.Blocks.Sources.TimeTable GB101_ToutSP(table=Tout_SP)
          annotation (Placement(transformation(extent={{-68,-12},{-56,0}})));
        Modelica.Blocks.Sources.BooleanTable GB501_Status(table={1e6}, startValue=true)
          "Input to decide whether or nor the gas boiler is working"
          annotation (Placement(transformation(extent={{-68,-30},{-56,-18}})));
        Modelica.Blocks.Sources.TimeTable TT501_profile(table=[ts,TTi])
          annotation (Placement(transformation(extent={{-46,48},{-34,60}})));
        Modelica.Blocks.Sources.TimeTable PT501_profile(table=[ts,PTi])
          annotation (Placement(transformation(extent={{-46,66},{-34,78}})));
        Modelica.Blocks.Sources.TimeTable FCV101_theta(table=[ts,thetav])
          annotation (Placement(transformation(extent={{-88,8},{-76,20}})));
        Modelica.Blocks.Sources.TimeTable P501_omega(table=[ts,omega])
          annotation (Placement(transformation(extent={{-88,26},{-76,38}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref(table=[ts,m_flow_approx]) annotation (Placement(transformation(extent={{46,48},
                  {34,60}})));
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
          pin_start=pout_start_S5,
          p0=pout_start_S5,
          T0=Tout_start_S5,
          m_flow0=m_flow_approx[1, 1],
          G=1e-8)                      annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={14,60})));
        H2GasFacility.Sources.SourcePressure sourceGas(
          redeclare model Medium = Gas,
          X0=X_gas,
          R=1e-3,
          computeEnergyVariables=true) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,-62})));
        Plants.Thermal.Systems.CHP combinedHeatPower(
          Tin_low_start=Tout_start_CHP,
          Tout_low_start=Tin_start_CHP,
          Tin_high_start=Tin_start_S5,
          Tout_high_start=Tout_start_S5,
          PL_S500_FT501_EX501(L=80),
          EX501(n=5),
          CHP(
            initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState,
            h=1,
              control_Pel=false))
          annotation (Placement(transformation(extent={{-26,-26},{26,26}})));
        Modelica.Blocks.Sources.Ramp PCHP_m_flow(
          height=0,
          duration=0,
          offset=m_flow_low_start)
                          annotation (Placement(transformation(extent={{-90.75,-46},{-78,-33}})));
        Modelica.Blocks.Sources.Ramp ToutSP(
          height=0,
          duration=0,
          offset=80 + 273.15) annotation (Placement(transformation(extent={{-88,-12},{-76,0}})));
        Modelica.Blocks.Sources.Ramp PelSP(
          height=5e3*0,
          duration=0,
          offset=35e3,
          startTime=1000)
                       annotation (Placement(transformation(extent={{-68,-46},{-56,-34}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref_CHP(table=[ts,m_flow_CHP_approx]) annotation (Placement(transformation(extent={{-68,-66},{-56,-54}})));
      protected
        final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
        final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
        final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
        final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
        final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
        final parameter Real TTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo, dim[1], dim[2]);
        final parameter Real TTi_CHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi_CHP, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]);
        final parameter Real TTo_CHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTo_CHP, dim[1], dim[2]) + 273.15*ones(dim[1], dim[2]);
        final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
        final parameter Real freq[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixfreq, dim[1], dim[2]);
        final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
        final parameter Real FTCHP[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFTCHP, dim[1], dim[2]);
        //final parameter Real m_flow_Gas[dim[1], dim[2]]= Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixmflowGas, dim[1], dim[2])/3600;
      public
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_TT502
          "Validation of outlet temperature TT502"
          annotation (Placement(transformation(extent={{60,2},{80,22}})));
        Modelica.Blocks.Sources.TimeTable TT502_ref(table=[ts,TTo])
          annotation (Placement(transformation(extent={{40,12},{50,22}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_TTin_CHP
          "Validation of outlet temperature TT502"
          annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
        Modelica.Blocks.Sources.TimeTable TTinCHP_ref(table=[ts,TTi_CHP])
          annotation (Placement(transformation(extent={{40,-20},{50,-10}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_TTout_CHP
          "Validation of outlet temperature TT502"
          annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
        Modelica.Blocks.Sources.TimeTable TToutCHP_ref(table=[ts,TTo_CHP])
          annotation (Placement(transformation(extent={{40,-50},{50,-40}})));
      protected
        final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
        final parameter Real m_flow_CHP_approx[dim[1], dim[2]] = FTCHP*(rhohotref/1000)/60;
        final parameter Real omega[dim[1], dim[2]] = 2*Modelica.Constants.pi*freq;
        final parameter DistrictHeatingNetwork.Types.Temperature Tin_start = TTi[1,1];
        final parameter DistrictHeatingNetwork.Types.Pressure pin_start = PTi[1,1];
        final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = m_flow_approx[1,1];
      equation
        connect(TT501_profile.y, source.in_T0) annotation (Line(points={{-33.4,54},{-30,54},{-30,56},{-22.4,56}}, color={0,0,127}));
        connect(PT501_profile.y, source.in_p0) annotation (Line(points={{-33.4,72},{-30,72},{-30,64},{-22.4,64}}, color={0,0,127}));
        connect(P501_omega.y, lowPassomega.u) annotation (Line(points={{-75.4,32},{-69.2,32}}, color={0,0,127}));
        connect(FCV101_theta.y, lowPasstheta.u) annotation (Line(points={{-75.4,14},{-69.2,14}}, color={0,0,127}));
        connect(sourceGas.outlet, combinedHeatPower.inletFuel) annotation (Line(
            points={{0,-52},{0,-30.16}},
            color={182,109,49},
            thickness=0.5));
        connect(source.outlet, combinedHeatPower.inlet) annotation (Line(
            points={{-14,50},{-14,38},{-10.14,38},{-10.14,29.9}},
            color={140,56,54},
            thickness=0.5));
        connect(sinkMassFlow.inlet, combinedHeatPower.outlet) annotation (Line(
            points={{14,50},{14,38},{10.66,38},{10.66,29.9}},
            color={140,56,54},
            thickness=0.5));
        connect(lowPassomega.y, combinedHeatPower.omega) annotation (Line(points={{-55.4,
                32},{-44,32},{-44,18.2},{-28.6,18.2}}, color={0,0,127}));
        connect(lowPasstheta.y, combinedHeatPower.theta)
          annotation (Line(points={{-55.4,14},{-54,13},{-28.6,13}}, color={0,0,127}));
        connect(GB501_Status.y, combinedHeatPower.status) annotation (Line(points={{-55.4,
                -24},{-42,-24},{-42,2.6},{-28.6,2.6}}, color={255,0,255}));
        connect(ToutSP.y, combinedHeatPower.Toutset) annotation (Line(points={{-75.4,-6},
                {-72,-6},{-72,4},{-44,4},{-44,7.8},{-28.6,7.8}}, color={0,0,127}));
        connect(PelSP.y, combinedHeatPower.Pelset) annotation (Line(points={{-55.4,-40},{
                -38,-40},{-38,-2.6},{-28.6,-2.6}}, color={0,0,127}));
        connect(m_flow_ref.y, sinkMassFlow.in_m_flow)
          annotation (Line(points={{33.4,54},{19,54}}, color={0,0,127}));
        connect(m_flow_ref_CHP.y, combinedHeatPower.m_flow_CHP) annotation (Line(points={{-55.4,-60},{-34,-60},{-34,-7.8},{-28.6,-7.8}}, color={0,0,127}));
        connect(combinedHeatPower.TTout, val_TT502.u_sim)
          annotation (Line(points={{28.6,7.8},{42,7.8},{42,7},{58,7}}, color={0,0,127}));
        connect(TT502_ref.y, val_TT502.u_meas)
          annotation (Line(points={{50.5,17},{58,17}}, color={0,0,127}));
        connect(TTinCHP_ref.y, val_TTin_CHP.u_meas)
          annotation (Line(points={{50.5,-15},{58,-15}}, color={0,0,127}));
        connect(combinedHeatPower.TTin_CHP, val_TTin_CHP.u_sim) annotation (Line(points={
                {28.665,-13.0325},{34,-13.0325},{34,-25},{58,-25}}, color={0,0,127}));
        connect(TToutCHP_ref.y, val_TTout_CHP.u_meas)
          annotation (Line(points={{50.5,-45},{58,-45}}, color={0,0,127}));
        connect(val_TTout_CHP.u_sim, combinedHeatPower.TTout_CHP) annotation (Line(points=
               {{58,-55},{48,-55},{48,-56},{32,-56},{32,-18.2325},{28.665,-18.2325}},
              color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), experiment(
            StopTime=8000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end TestBase;
    end S500;

    package S900 "Validation tests of pumping system"
      extends Modelica.Icons.ExamplesPackage;

      model TestBase "Test base for validation of system 900, using S400 as reference"
        extends Modelica.Icons.Example;

        // Medium
        replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
          constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
        parameter Real pumpcorrectionfactor = 1;
        parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005;
        //parameter Real b[3] = {24.122662, 0.669933, -0.039537} "Head Characteristic coefficients";
        //parameter Real b[3] = {24.122662, 0.60, -0.039537} "Head Characteristic coefficients";
        //parameter Real b[3] = {23.6, 0.61, -0.039537} "Head Characteristic coefficients";
        //parameter Real b[3] = {23.6, 0.63, -0.042} "Head Characteristic coefficients";
        parameter Real b[3] = {23.6, 0.62, -0.0435} "Head Characteristic coefficients";
        parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
        parameter DistrictHeatingNetwork.Types.Length L_v = 1;
        parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9 = 4.04;

        parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = pin_start;
        parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = PTo[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9 = TTi[1, 1];
        parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9 = TTi[1, 1];

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
        parameter String MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix" annotation (
          Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

        parameter String matrixPTi = "PT402" "Matrix name in file";
        parameter String matrixPTo = "PT902" "Matrix name in file";
        parameter String matrixTTi = "TT902" "Matrix name in file";
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
                             sink_(redeclare model Medium = Medium, G=1e-8)
                                                                    annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=-90,
              origin={-10,-90})));
        Modelica.Blocks.Sources.TimeTable P901_omega(table=[ts,omega]) annotation (Placement(transformation(extent={{-72,32},{-60,44}})));
        Modelica.Blocks.Sources.TimeTable FCV901_theta(table=[ts,thetav]) annotation (Placement(transformation(extent={{-72,12},{-60,24}})));
        Modelica.Blocks.Sources.TimeTable PT902_profile(table=[ts,PTo]) annotation (Placement(transformation(extent={{96,32},{84,44}})));
        DistrictHeatingNetwork.Sources.SinkPressure
                             sinkP(
          use_in_p0=true,
          redeclare model Medium = Medium,
          p0=pout_start_S9,
          T0=Tout_start_S9,
          R=1e-3)
               annotation (Placement(transformation(extent={{56,62},{68,50}})));
        Modelica.Blocks.Sources.TimeTable m_flow_ref(table=[ts,m_flow_approx]) annotation (Placement(transformation(extent={{48,86},{60,98}})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex m_flow_index annotation (Placement(transformation(extent={{74,84},{86,96}})));

        inner DistrictHeatingNetwork.System system annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        Modelica.Blocks.Continuous.FirstOrder lowPassomega(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=omega[1, 1])                             annotation (Placement(transformation(extent={{-54,32},{-42,44}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasstheta(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=thetav[1, 1])                            annotation (Placement(transformation(extent={{-54,12},{-42,24}})));
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
          y_start=PTo[1, 1]) annotation (Placement(transformation(extent={{74,32},{62,44}})));
        Modelica.Blocks.Continuous.FirstOrder lowPasspin(
          k=1,
          T=5,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=PTi[1, 1]) annotation (Placement(transformation(extent={{44,-98},{32,-86}})));
        DistrictHeatingNetwork.Sources.SinkMassFlow sinkMassFlow(
          redeclare model Medium = Medium,
          use_in_m_flow=true,
          pin_start=pout_start_S9,
          p0=pout_start_S9,
          T0=Tout_start_S9,
          m_flow0=m_flow_approx[1, 1],
          G=1e-8)                      annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={14,90})));
        DistrictHeatingNetwork.Utilities.ASHRAEIndex val_pout annotation (Placement(transformation(extent={{52,10},{64,22}})));
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
        connect(sink_.inlet, circulationPump.outletcold) annotation (Line(
            points={{-10,-80},{-10,-55.25},{-9.7,-55.25},{-9.7,-26.5}},
            color={140,56,54},
            thickness=0.5));
        connect(TT402_profile.y, sourceP.in_T0) annotation (Line(points={{35.4,-72},{28,-72},{28,-89.6},{19.04,-89.6}}, color={0,0,127}));
        connect(m_flow_ref.y, m_flow_index.u_meas) annotation (Line(points={{60.6,92},{72.8,92},{72.8,93}},                 color={0,0,127}));
        connect(circulationPump.m_flow_, m_flow_index.u_sim) annotation (Line(points={{35,29},{66,29},{66,87},{72.8,87}}, color={0,0,127}));
        connect(P901_omega.y, lowPassomega.u) annotation (Line(points={{-59.4,38},{-55.2,38}}, color={0,0,127}));
        connect(lowPassomega.y, circulationPump.omega) annotation (Line(points={{-41.4,38},{-38,38},{-38,29},{-31,29}}, color={0,0,127}));
        connect(FCV901_theta.y, lowPasstheta.u) annotation (Line(points={{-59.4,18},{-55.2,18}},
                                                                                               color={0,0,127}));
        connect(lowPasstheta.y, circulationPump.theta) annotation (Line(points={{-41.4,18},{-38,18},{-38,23},{-31,23}},
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
        connect(lowPasspout.y, sinkP.in_p0) annotation (Line(points={{61.4,38},{61.4,42},{59.6,42},{59.6,50.96}},       color={0,0,127}));
        connect(lowPasspout.u, PT902_profile.y) annotation (Line(points={{75.2,38},{83.4,38}}, color={0,0,127}));
        connect(PT402_profile.y, lowPasspin.u) annotation (Line(points={{51.4,-92},{45.2,-92}}, color={0,0,127}));
        connect(lowPasspin.y, sourceP.in_p0) annotation (Line(points={{31.4,-92},{28,-92},{28,-94.4},{19.04,-94.4}}, color={0,0,127}));
        connect(m_flow_ref.y, sinkMassFlow.in_m_flow) annotation (Line(points={{60.6,92},{64,92},{64,78},{28,78},{28,84},{19,84}}, color={0,0,127}));
        connect(val_pout.u_meas, sinkP.in_p0) annotation (Line(points={{50.8,19},{50.8,18},{44,18},{44,50.96},{59.6,50.96}},                              color={0,0,127}));
        connect(circulationPump.PTout, val_pout.u_sim) annotation (Line(points={{35,5},{44,5},{44,13},{50.8,13}}, color={0,0,127}));
        connect(sinkMassFlow.inlet, circulationPump.outlethot) annotation (Line(
            points={{14,80},{14,61.25},{13.7,61.25},{13.7,42.5}},
            color={140,56,54},
            thickness=0.5));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
          experiment(
            StartTime=3500,
            StopTime=9500,
            __Dymola_Algorithm="Dassl"));
      end TestBase;

      model S900_Seq_0412Test1 "Validation test using data from sequence 0412_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test1.mat"));
        annotation (experiment(
            StopTime=3900,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0412Test1;

      model S900_Seq_0412Test2 "Validation test using data from sequence 0412_Test2"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat"));
        annotation (experiment(
            StopTime=9500,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0412Test2;

      model S900_Seq_0412Test3 "Validation test using data from sequence 0412_Test3"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat"));
        annotation (experiment(
            StopTime=7200,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end S900_Seq_0412Test3;

      model S900_Seq_1701Test1 "Validation test using data from sequence 1701_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test1.mat"));
        annotation (experiment(StopTime=2700, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1701Test1;

      model S900_Seq_1701Test2 "Validation test using data from sequence 1701_Test2"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test2.mat"));
        annotation (experiment(StopTime=5600, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1701Test2;

      model S900_Seq_1701Test3 "Validation test using data from sequence 1701_Test3"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1701_Test3.mat"));
        annotation (experiment(StopTime=7800, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1701Test3;

      model S900_Seq_2601Test1 "Validation test using data from sequence 2601_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2601_Test1.mat"));
        annotation (experiment(StopTime=7000, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2601Test1;

      model S900_Seq_3001Test1 "Validation test using data from sequence 3001_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test1.mat"));
        annotation (experiment(StopTime=1500, __Dymola_Algorithm="Dassl"));
      end S900_Seq_3001Test1;

      model S900_Seq_3001Test2 "Validation test using data from sequence 3001_Test2"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/3001_Test2.mat"));
        annotation (experiment(StopTime=3900, __Dymola_Algorithm="Dassl"));
      end S900_Seq_3001Test2;

      model S900_Seq_2102Test1 "Validation test using data from sequence 2102_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2102_Test1.mat"));
        annotation (experiment(StopTime=2000, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2102Test1;

      model S900_Seq_1004Test1 "Validation test using data from sequence 1004_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1004_Test1.mat"));
        annotation (experiment(StopTime=18000, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1004Test1;

      model S900_Seq_1704Test1 "Validation test using data from sequence 1704_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/1704_Test1.mat"));
        annotation (experiment(StopTime=7900, __Dymola_Algorithm="Dassl"));
      end S900_Seq_1704Test1;

      model S900_Seq_2904Test1 "Validation test using data from sequence 2904_Test1"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2904_Test1.mat"));
        annotation (experiment(StopTime=14400, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2904Test1;

      model S900_Seq_2904Test2 "Validation test using data from sequence 2904_Test2"
        extends TestBase(MeasuredData = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/2904_Test1.mat"));
        annotation (experiment(StopTime=4140, __Dymola_Algorithm="Dassl"));
      end S900_Seq_2904Test2;
      annotation (Documentation(info="<html>
<p><span style=\"font-size: 12pt;\">This package includes all the tests used for validation of system S900 hot side. This includes the <b>pump</b> <b>P901</b>, valve <b>FCV901</b>, pipes connecting the inlet of pump P901 with the system S400 outlet pressure transmitter <b>PT402</b> and the pipe connecting the outlet of valve FCV901 and the pressure transmitter <b>PT902</b>.</span></p>
<p><span style=\"font-size: 12pt;\">The cold side is neglected in this test, then not real data in its boundary conditions.</span></p>
<p><span style=\"font-size: 12pt;\">The analysis takes into account the <b>outlet pressure of the hot side</b>, comparing the simulated outlet pressure with the measured outlet pressure in PT902. The mass flow rate through the hot side (FT902 values approximatly converted from m3/h to kg/s) and the inlet temperature in the hot side (TT902 considered as reference, assuming negligible temperature losses).</span></p>
</html>"));
    end S900;
  end Systems;

  package Loads "Package to run test in the load side of the plant using real data"
    extends DistrictHeatingNetwork.Icons.Generic.ThermalLoads;

    model E7X1Test "Subsystem of a single HX70X test with real data"
      extends Modelica.Icons.Example;
      replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
      replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

      parameter Real CorrectFactorHot = 1;
      parameter Real CorrectFactorCold = 1;
      parameter DistrictHeatingNetwork.Types.Density rhohotref=985;
      parameter DistrictHeatingNetwork.Types.Density rhocoldref=999;
      parameter String Data = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat") "File name of matrix" annotation (
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
      //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
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
      final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Data, matrixTT701) "dimension of matrix";
      final parameter Real t[:, :] = Modelica.Utilities.Streams.readRealMatrix(Data, timenoscale, dim[1], dim[2]) "Matrix data";
      final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT701,dim[1],dim[2]);
      final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT702, dim[1], dim[2]);
      final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT703, dim[1], dim[2]);
      final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT704, dim[1], dim[2]);
      final parameter Real PT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT701, dim[1], dim[2]);
      final parameter Real PT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT702, dim[1], dim[2]);
      final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT701, dim[1], dim[2]);
      final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT703, dim[1], dim[2]);
      final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
      final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
      final parameter Real thetaValve[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixthetaFCV701, dim[1], dim[2]);
    equation

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
      parameter String Data = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test3.mat") "File name of matrix" annotation (
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
      //  final parameter Real thetaFCV701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
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
      final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Data, matrixTT701) "dimension of matrix";
      final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(Data, timenoscale, dim[1], dim[2]) "Matrix data";
      final parameter Real TT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data,matrixTT701,dim[1],dim[2]);
      final parameter Real TT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT702, dim[1], dim[2]);
      final parameter Real TT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT703, dim[1], dim[2]);
      final parameter Real TT704[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixTT704, dim[1], dim[2]);
      final parameter Real PT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT701, dim[1], dim[2]);
      final parameter Real PT702[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixPT702, dim[1], dim[2]);
      final parameter Real FT701[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT701, dim[1], dim[2]);
      final parameter Real FT703[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixFT703, dim[1], dim[2]);
      final parameter Real m_flow701[dim[1], dim[2]] = FT701*rhohotref*CorrectFactorHot/3600;
      final parameter Real m_flow703[dim[1], dim[2]] = FT703*rhocoldref*CorrectFactorCold/3600;
      final parameter Real thetaValve[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Data, matrixthetaFCV701, dim[1], dim[2]);
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
        FCVR01(openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot, q_m3h_nom=14.5));
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h1 = 0;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h2 = 0;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h3 = 3;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Length h4 = 5;
      parameter MultiEnergySystem.DistrictHeatingNetwork.Types.Pressure dpRR = 1e5;
      parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test 2024/01_Test Gennaio 2024/1701_Test2/Temperatures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Pressures = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test 2024/Test Gennaio 2024/1701_Test2/Pressures.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Flows = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test 2024/Test Gennaio 2024/1701_Test2/Flow.mat") "File name of matrix" annotation (
        Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));
      parameter String Actuators = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test 2024/Test Gennaio 2024/1701_Test2/Actuators.mat") "File name of matrix" annotation (
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
  end Loads;

  package Networks
    extends DistrictHeatingNetwork.Icons.Generic.Networks;
    package Centralised
      extends DistrictHeatingNetwork.Icons.Generic.Centralised;
      model CentralisedSystemI_A "Sequence using Gas Boiler as heat source only"
        extends
          MultiEnergySystem.TestFacility.Networks.Thermal.Configurations.Centralised.CentralizedSystemI(FV933_state = false, FCVC01theta = [0, 0; 100, 0], FCVC02theta = [0, 1; 100, 1], FCV901theta = [0, 1; 100, 1], P901omega = [0, 2*3.141592654*30; 100, 2*3.141592654*30], FCV101theta = [0, 1; 100, 1], q_m3h_S9 = 10, P101qm3h = [0, 10; 100, 10], q_m3h_S1 = 10, FCV701theta = [0, 1; 100, 1], FCV711theta = [0, 1; 100, 1], FCV721theta = [0, 1; 100, 1], FCV731theta = [0, 1; 100, 1], TCV701theta = [0, 1; 100, 1], TCV711theta = [0, 1; 100, 1], TCV721theta = [0, 1; 100, 1], TCV731theta = [0, 1; 100, 1], FCVR01theta = [0, 0.2; 100, 0.2], PR01omega = [0, 2*Modelica.Constants.pi*50; 100, 2*Modelica.Constants.pi*50], ToutcoolSP = [0, 15; 100, 15]);
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
        Modelica.Blocks.Sources.BooleanTable RR101_Status(table={1e6}, startValue=true) "Input to decide whether or nor the chiller is working"
          annotation (Placement(transformation(extent={{683,-130},{703,-110}})));
        Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e8}, startValue=true)     "Input to decide whether or nor the gas boiler is working" annotation (
          Placement(transformation(extent={{-320,-340},{-300,-320}})));
      equation
        connect(FCV901_theta.y, FCV901.opening) annotation (
          Line(points={{-735,103},{-742,103},{-742,140.5},{-749.9,140.5}},    color = {0, 0, 127}));
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
        connect(GB101_Tout_SP.y, GB101.Tout_ref) annotation (
          Line(points={{-297,-300},{-297,-301},{-281.5,-301}},      color = {0, 0, 127}));
        connect(PR01_omega.y, PR01.in_omega) annotation (
          Line(points = {{681, -208}, {689.25, -208}, {689.25, -207.8}, {697.5, -207.8}}, color = {0, 0, 127}));
        connect(RR101_Status.y, RR01.cold_on) annotation (Line(points={{704,-120},{716.225,-120},{716.225,-118.5},{728.45,-118.5}}, color={255,0,255}));
        connect(Tout_cool_SP.y, RR01.in_Tout_cold_set) annotation (Line(points={{749,-60},{767.5,-60},{767.5,-93.65}}, color={0,0,127}));
        connect(GB101_Status.y, GB101.heat_on) annotation (Line(points={{-299,-330},{-290,-330},{-290,-318.5},{-281.5,-318.5}}, color={255,0,255}));
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
        Modelica.Blocks.Sources.BooleanTable EB401_Status(table={1e8}, startValue=true)     "Input to decide whether or nor the electric boiler is working" annotation (
          Placement(transformation(extent={{-408,-340},{-388,-320}})));
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
        connect(EB401_Status.y, EB401.heat_on) annotation (Line(points={{-387,-330},{-378,-330},{-378,-319},{-365.8,-319}}, color={255,0,255}));
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
    package OpenLoopActuators "Package containing models for open-loop analysis of the Test Facility Plant"
      partial model OpenLoopActuatorBase

        constant Real pi = Modelica.Constants.pi;
        parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
        parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
        parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";
        parameter Boolean useRealExpression = true "true if use RealExpression blocks as set-point variables";
        // Boolean Parameters


        // Rack CD
        parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
        parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];

        // S900
        parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];

        // S100
        parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
        parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];

        // S400
        parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
        parameter Real domega_P401[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];
        parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];

        // S500
        parameter Real dTout_CHP501[:,:] = [0, 0; 1e6, 0];
        parameter Real domega_P501[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];

        // S700
        parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
        parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
        parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
        parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];

        // Cooling System RR
        parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
        parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
        parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
        parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];


        // Boolean variables to decide whether use a TimeTable (parameter) or a RealExpression (variable) as setpoint
        Boolean booldthetaFCV901;
        Boolean booldomegaP901;
        Boolean booldthetaFCV101;
        Boolean booldomegaP101;
        Boolean booldToutGB101;
      //   Boolean booldthetaFCV401;
      //   Boolean booldomegaP401;
      //   Boolean booldToutEB401;
      //   Boolean booldomegaP501;
      //   Boolean booldToutCHP501;
        Boolean booldthetaFCV701;
        Boolean booldthetaFCV711;
        Boolean booldthetaFCV721;
        Boolean booldthetaFCV731;
        Boolean booldthetaFCVC01;
        Boolean booldthetaFCVC02;
        Boolean booldthetaTCV701;
        Boolean booldthetaTCV711;
        Boolean booldthetaTCV721;
        Boolean booldthetaTCV731;
        Boolean booldthetaFCVR01;
        Boolean booldToutRR01;


        // S900
        DistrictHeatingNetwork.Types.PerUnit theta_FCV901SP;
        Real dtheta_FCV901_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
        Real domega_P901_var(min = -1, max = 0);


        // S100
        DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
        Real dtheta_FCV101_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
        Real domega_P101_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
        Real dTout_GB101_var(min = -1, max = 0);


        // S400
      //   DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
      //   Real dtheta_FCV401_var(min = -1, max = 0);
      //   DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
      //   Real domega_P401_var(min = -1, max = 0);
      //   DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
      //   Real dTout_EB401_var(min = -1, max = 0);


        // S500
      //   DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
      //   Real domega_P501_var(min = -1, max = 0);
      //   DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
      //   Real dTout_CHP501_var(min = -1, max = 0);


        // S700
        DistrictHeatingNetwork.Types.PerUnit theta_FCV701SP;
        Real dtheta_FCV701_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
        Real dtheta_FCV711_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
        Real dtheta_FCV721_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
        Real dtheta_FCV731_var(min = -1, max = 0);


        // Rack
        DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
        Real dtheta_FCVC01_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
        Real dtheta_FCVC02_var(min = -1, max = 0);


        // Cooling
        DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
        Real dtheta_TCV701_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
        Real dtheta_TCV711_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
        Real dtheta_TCV721_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
        Real dtheta_TCV731_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
        Real dtheta_FCVR01_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
        Real dTout_RR01_var(min = -1, max = 0);


        Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
          Placement(transformation(extent={{-141,135},{-131,145}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
          Placement(transformation(extent={{-141,102},{-131,112}})));
        FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
          Placement(visible = true, transformation(origin={160,0},     extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
        Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-141,-41},{-131,-31}})));
        Modelica.Blocks.Sources.RealExpression domegaP901_var(y=domega_P901_var)           annotation (Placement(transformation(extent={{-141,155},{-131,165}})));
        Modelica.Blocks.Logical.Switch switch_domegaP901 annotation (Placement(transformation(extent={{-122,145},{-112,155}})));
        Modelica.Blocks.Sources.BooleanExpression bool_domegaP901(y=booldomegaP901)
                                                                          annotation (Placement(transformation(extent={{-141,145},{-131,155}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV901(y=booldthetaFCV901)
                                                                            annotation (Placement(transformation(extent={{-141,112},{-131,122}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV901_var(y=dtheta_FCV901_var) annotation (Placement(transformation(extent={{-141,121},{-131,131}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV901 annotation (Placement(transformation(extent={{-123,112},{-113,122}})));
        Modelica.Blocks.Interaction.Show.RealValue domega_P901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,140},{-85,160}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,107},{-85,127}})));
        Modelica.Blocks.Sources.TimeTable domegaP101(table=domega_P101) annotation (Placement(transformation(extent={{-141,25},{-131,35}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV101(table=dtheta_FCV101) annotation (Placement(transformation(extent={{-141,-8},{-131,2}})));
        Modelica.Blocks.Sources.RealExpression domegaP101_var(y=domega_P101_var) annotation (Placement(transformation(extent={{-141,45},{-131,55}})));
        Modelica.Blocks.Logical.Switch switch_domegaP101 annotation (Placement(transformation(extent={{-122,35},{-112,45}})));
        Modelica.Blocks.Sources.BooleanExpression bool_domegaP101(y=booldomegaP101) annotation (Placement(transformation(extent={{-141,35},{-131,45}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV101(y=booldthetaFCV101) annotation (Placement(transformation(extent={{-141,2},{-131,12}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV101_var(y=dtheta_FCV101_var) annotation (Placement(transformation(extent={{-141,11},{-131,21}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV101 annotation (Placement(transformation(extent={{-123,2},{-113,12}})));
        Modelica.Blocks.Interaction.Show.RealValue domega_P101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,30},{-85,50}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-3},{-85,17}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dToutGB101(y=booldToutGB101)   annotation (Placement(transformation(extent={{-141,-31},{-131,-21}})));
        Modelica.Blocks.Sources.RealExpression dToutGB101_var(y=dTout_GB101_var) annotation (Placement(transformation(extent={{-141,-22},{-131,-12}})));
        Modelica.Blocks.Logical.Switch switch_dToutGB101 annotation (Placement(transformation(extent={{-123,-31},{-113,-21}})));
        Modelica.Blocks.Interaction.Show.RealValue dTout_GB101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-36},{-85,-16}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV701(table=dtheta_FCV701) annotation (Placement(transformation(extent={{-50,140},{-40,150}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV701(y=booldthetaFCV701) annotation (Placement(transformation(extent={{-50,150},{-40,160}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV701_var(y=dtheta_FCV701_var) annotation (Placement(transformation(extent={{-50,159},{-40,169}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV701 annotation (Placement(transformation(extent={{-32,150},{-22,160}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,145},{6,165}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV711(table=dtheta_FCV711) annotation (Placement(transformation(extent={{-50,106},{-40,116}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV711(y=booldthetaFCV711) annotation (Placement(transformation(extent={{-50,116},{-40,126}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV711_var(y=dtheta_FCV711_var) annotation (Placement(transformation(extent={{-50,125},{-40,135}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV711 annotation (Placement(transformation(extent={{-32,116},{-22,126}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,111},{6,131}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV721(table=dtheta_FCV721) annotation (Placement(transformation(extent={{-50,73},{-40,83}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV721(y=booldthetaFCV721) annotation (Placement(transformation(extent={{-50,83},{-40,93}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV721_var(y=dtheta_FCV721_var) annotation (Placement(transformation(extent={{-50,92},{-40,102}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV721 annotation (Placement(transformation(extent={{-32,83},{-22,93}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,78},{6,98}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV731(table=dtheta_FCV731) annotation (Placement(transformation(extent={{-50,41},{-40,51}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV731(y=booldthetaFCV731) annotation (Placement(transformation(extent={{-50,51},{-40,61}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV731_var(y=dtheta_FCV731_var) annotation (Placement(transformation(extent={{-50,60},{-40,70}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV731 annotation (Placement(transformation(extent={{-32,51},{-22,61}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,46},{6,66}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-50,-21},{-40,-11}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y=booldthetaFCVC01) annotation (Placement(transformation(extent={{-50,-11},{-40,-1}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y=dtheta_FCVC01_var) annotation (Placement(transformation(extent={{-50,-2},{-40,8}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (Placement(transformation(extent={{-32,-11},{-22,-1}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-16},{6,4}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table=dtheta_FCVC02) annotation (Placement(transformation(extent={{-50,-55},{-40,-45}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y=booldthetaFCVC02) annotation (Placement(transformation(extent={{-50,-45},{-40,-35}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y=dtheta_FCVC02_var) annotation (Placement(transformation(extent={{-50,-36},{-40,-26}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (Placement(transformation(extent={{-32,-45},{-22,-35}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC02_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));
        Modelica.Blocks.Sources.TimeTable dthetaTCV701(table=dtheta_TCV701) annotation (Placement(transformation(extent={{39,140},{49,150}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV701(y=booldthetaTCV701) annotation (Placement(transformation(extent={{39,150},{49,160}})));
        Modelica.Blocks.Sources.RealExpression dthetaTCV701_var(y=dtheta_TCV701_var) annotation (Placement(transformation(extent={{39,159},{49,169}})));
        Modelica.Blocks.Logical.Switch switch_dthetaTCV701 annotation (Placement(transformation(extent={{57,150},{67,160}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,145},{95,165}})));
        Modelica.Blocks.Sources.TimeTable dthetaTCV711(table=dtheta_TCV711) annotation (Placement(transformation(extent={{39,106},{49,116}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV711(y=booldthetaTCV711) annotation (Placement(transformation(extent={{39,116},{49,126}})));
        Modelica.Blocks.Sources.RealExpression dthetaTCV711_var(y=dtheta_TCV711_var) annotation (Placement(transformation(extent={{39,125},{49,135}})));
        Modelica.Blocks.Logical.Switch switch_dthetaTCV711 annotation (Placement(transformation(extent={{57,116},{67,126}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,111},{95,131}})));
        Modelica.Blocks.Sources.TimeTable dthetaTCV721(table=dtheta_TCV721) annotation (Placement(transformation(extent={{39,73},{49,83}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV721(y=booldthetaTCV721) annotation (Placement(transformation(extent={{39,83},{49,93}})));
        Modelica.Blocks.Sources.RealExpression dthetaTCV721_var(y=dtheta_TCV721_var) annotation (Placement(transformation(extent={{39,92},{49,102}})));
        Modelica.Blocks.Logical.Switch switch_dthetaTCV721 annotation (Placement(transformation(extent={{57,83},{67,93}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,78},{95,98}})));
        Modelica.Blocks.Sources.TimeTable dthetaTCV731(table=dtheta_TCV731) annotation (Placement(transformation(extent={{39,41},{49,51}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV731(y=booldthetaTCV731) annotation (Placement(transformation(extent={{39,51},{49,61}})));
        Modelica.Blocks.Sources.RealExpression dthetaTCV731_var(y=dtheta_TCV731_var) annotation (Placement(transformation(extent={{39,60},{49,70}})));
        Modelica.Blocks.Logical.Switch switch_dthetaTCV731 annotation (Placement(transformation(extent={{57,51},{67,61}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,46},{95,66}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{39,8},{49,18}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVR01(y=booldthetaFCVR01) annotation (Placement(transformation(extent={{39,18},{49,28}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCVR01_var(y=dtheta_FCVR01_var) annotation (Placement(transformation(extent={{39,27},{49,37}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCVR01 annotation (Placement(transformation(extent={{57,18},{67,28}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act1(use_numberPort=true, significantDigits=2)                                                                                                         annotation (Placement(transformation(extent={{75,13},{95,33}})));
        Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{39,-25},{49,-15}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dToutRR01(y=booldToutRR01) annotation (Placement(transformation(extent={{39,-15},{49,-5}})));
        Modelica.Blocks.Sources.RealExpression dToutRR01_var(y=dTout_RR01_var) annotation (Placement(transformation(extent={{39,-6},{49,4}})));
        Modelica.Blocks.Logical.Switch switch_dToutRR01 annotation (Placement(transformation(extent={{57,-15},{67,-5}})));
        Modelica.Blocks.Interaction.Show.RealValue dTout_RR01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,-20},{95,0}})));
      equation

        connect(domegaP901_var.y, switch_domegaP901.u1) annotation (Line(points={{-130.5,160},{-127,160},{-127,154},{-123,154}}, color={0,0,127}));
        connect(bool_domegaP901.y, switch_domegaP901.u2) annotation (Line(points={{-130.5,150},{-123,150}}, color={255,0,255}));
        connect(domegaP901.y, switch_domegaP901.u3) annotation (Line(points={{-130.5,140},{-127,140},{-127,146},{-123,146}}, color={0,0,127}));
        connect(bool_dthetaFCV901.y, switch_dthetaFCV901.u2) annotation (Line(points={{-130.5,117},{-124,117}}, color={255,0,255}));
        connect(dthetaFCV901_var.y, switch_dthetaFCV901.u1) annotation (Line(points={{-130.5,126},{-127,126},{-127,121},{-124,121}}, color={0,0,127}));
        connect(dthetaFCV901.y, switch_dthetaFCV901.u3) annotation (Line(points={{-130.5,107},{-127,107},{-127,113},{-124,113}},
                                                                                                                               color={0,0,127}));
        connect(switch_domegaP901.y, domega_P901_act.numberPort) annotation (Line(points={{-111.5,150},{-106.5,150}}, color={0,0,127}));
        connect(dtheta_FCV901_act.numberPort, switch_dthetaFCV901.y) annotation (Line(points={{-106.5,117},{-112.5,117}}, color={0,0,127}));
        connect(domegaP101_var.y, switch_domegaP101.u1) annotation (Line(points={{-130.5,50},{-127,50},{-127,44},{-123,44}}, color={0,0,127}));
        connect(bool_domegaP101.y, switch_domegaP101.u2) annotation (Line(points={{-130.5,40},{-123,40}}, color={255,0,255}));
        connect(domegaP101.y, switch_domegaP101.u3) annotation (Line(points={{-130.5,30},{-127,30},{-127,36},{-123,36}}, color={0,0,127}));
        connect(bool_dthetaFCV101.y, switch_dthetaFCV101.u2) annotation (Line(points={{-130.5,7},{-124,7}},   color={255,0,255}));
        connect(dthetaFCV101_var.y, switch_dthetaFCV101.u1) annotation (Line(points={{-130.5,16},{-127,16},{-127,11},{-124,11}},
                                                                                                                             color={0,0,127}));
        connect(dthetaFCV101.y, switch_dthetaFCV101.u3) annotation (Line(points={{-130.5,-3},{-127,-3},{-127,3},{-124,3}},     color={0,0,127}));
        connect(switch_domegaP101.y, domega_P101_act.numberPort) annotation (Line(points={{-111.5,40},{-106.5,40}}, color={0,0,127}));
        connect(dtheta_FCV101_act.numberPort, switch_dthetaFCV101.y) annotation (Line(points={{-106.5,7},{-112.5,7}},   color={0,0,127}));
        connect(bool_dToutGB101.y,switch_dToutGB101. u2) annotation (Line(points={{-130.5,-26},{-124,-26}}, color={255,0,255}));
        connect(dToutGB101_var.y, switch_dToutGB101.u1) annotation (Line(points={{-130.5,-17},{-127,-17},{-127,-22},{-124,-22}}, color={0,0,127}));
        connect(dTout_GB101_act.numberPort, switch_dToutGB101.y) annotation (Line(points={{-106.5,-26},{-112.5,-26}}, color={0,0,127}));
        connect(dToutGB101.y, switch_dToutGB101.u3) annotation (Line(points={{-130.5,-36},{-127,-36},{-127,-30},{-124,-30}}, color={0,0,127}));
        connect(bool_dthetaFCV701.y, switch_dthetaFCV701.u2) annotation (Line(points={{-39.5,155},{-33,155}}, color={255,0,255}));
        connect(dthetaFCV701_var.y, switch_dthetaFCV701.u1) annotation (Line(points={{-39.5,164},{-36,164},{-36,159},{-33,159}}, color={0,0,127}));
        connect(dthetaFCV701.y, switch_dthetaFCV701.u3) annotation (Line(points={{-39.5,145},{-36,145},{-36,151},{-33,151}}, color={0,0,127}));
        connect(dtheta_FCV701_act.numberPort, switch_dthetaFCV701.y) annotation (Line(points={{-15.5,155},{-21.5,155}}, color={0,0,127}));
        connect(bool_dthetaFCV711.y, switch_dthetaFCV711.u2) annotation (Line(points={{-39.5,121},{-33,121}}, color={255,0,255}));
        connect(dthetaFCV711_var.y, switch_dthetaFCV711.u1) annotation (Line(points={{-39.5,130},{-36,130},{-36,125},{-33,125}}, color={0,0,127}));
        connect(dthetaFCV711.y, switch_dthetaFCV711.u3) annotation (Line(points={{-39.5,111},{-36,111},{-36,117},{-33,117}}, color={0,0,127}));
        connect(dtheta_FCV711_act.numberPort, switch_dthetaFCV711.y) annotation (Line(points={{-15.5,121},{-21.5,121}}, color={0,0,127}));
        connect(bool_dthetaFCV721.y, switch_dthetaFCV721.u2) annotation (Line(points={{-39.5,88},{-33,88}}, color={255,0,255}));
        connect(dthetaFCV721_var.y, switch_dthetaFCV721.u1) annotation (Line(points={{-39.5,97},{-36,97},{-36,92},{-33,92}}, color={0,0,127}));
        connect(dthetaFCV721.y, switch_dthetaFCV721.u3) annotation (Line(points={{-39.5,78},{-36,78},{-36,84},{-33,84}}, color={0,0,127}));
        connect(dtheta_FCV721_act.numberPort, switch_dthetaFCV721.y) annotation (Line(points={{-15.5,88},{-21.5,88}}, color={0,0,127}));
        connect(bool_dthetaFCV731.y, switch_dthetaFCV731.u2) annotation (Line(points={{-39.5,56},{-33,56}}, color={255,0,255}));
        connect(dthetaFCV731_var.y, switch_dthetaFCV731.u1) annotation (Line(points={{-39.5,65},{-36,65},{-36,60},{-33,60}}, color={0,0,127}));
        connect(dthetaFCV731.y, switch_dthetaFCV731.u3) annotation (Line(points={{-39.5,46},{-36,46},{-36,52},{-33,52}}, color={0,0,127}));
        connect(dtheta_FCV731_act.numberPort, switch_dthetaFCV731.y) annotation (Line(points={{-15.5,56},{-21.5,56}}, color={0,0,127}));
        connect(bool_dthetaFCVC01.y, switch_dthetaFCVC01.u2) annotation (Line(points={{-39.5,-6},{-33,-6}},   color={255,0,255}));
        connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (Line(points={{-39.5,3},{-36,3},{-36,-2},{-33,-2}},     color={0,0,127}));
        connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (Line(points={{-39.5,-16},{-36,-16},{-36,-10},{-33,-10}}, color={0,0,127}));
        connect(dtheta_FCVC01_act.numberPort, switch_dthetaFCVC01.y) annotation (Line(points={{-15.5,-6},{-21.5,-6}},   color={0,0,127}));
        connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (Line(points={{-39.5,-40},{-33,-40}}, color={255,0,255}));
        connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (Line(points={{-39.5,-31},{-36,-31},{-36,-36},{-33,-36}}, color={0,0,127}));
        connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (Line(points={{-39.5,-50},{-36,-50},{-36,-44},{-33,-44}}, color={0,0,127}));
        connect(dtheta_FCVC02_act.numberPort, switch_dthetaFCVC02.y) annotation (Line(points={{-15.5,-40},{-21.5,-40}}, color={0,0,127}));
        connect(bool_dthetaTCV701.y, switch_dthetaTCV701.u2) annotation (Line(points={{49.5,155},{56,155}}, color={255,0,255}));
        connect(dthetaTCV701_var.y, switch_dthetaTCV701.u1) annotation (Line(points={{49.5,164},{53,164},{53,159},{56,159}}, color={0,0,127}));
        connect(dthetaTCV701.y, switch_dthetaTCV701.u3) annotation (Line(points={{49.5,145},{53,145},{53,151},{56,151}}, color={0,0,127}));
        connect(dtheta_TCV701_act.numberPort, switch_dthetaTCV701.y) annotation (Line(points={{73.5,155},{67.5,155}}, color={0,0,127}));
        connect(bool_dthetaTCV711.y, switch_dthetaTCV711.u2) annotation (Line(points={{49.5,121},{56,121}}, color={255,0,255}));
        connect(dthetaTCV711_var.y, switch_dthetaTCV711.u1) annotation (Line(points={{49.5,130},{53,130},{53,125},{56,125}}, color={0,0,127}));
        connect(dthetaTCV711.y, switch_dthetaTCV711.u3) annotation (Line(points={{49.5,111},{53,111},{53,117},{56,117}}, color={0,0,127}));
        connect(dtheta_TCV711_act.numberPort, switch_dthetaTCV711.y) annotation (Line(points={{73.5,121},{67.5,121}}, color={0,0,127}));
        connect(bool_dthetaTCV721.y, switch_dthetaTCV721.u2) annotation (Line(points={{49.5,88},{56,88}}, color={255,0,255}));
        connect(dthetaTCV721_var.y, switch_dthetaTCV721.u1) annotation (Line(points={{49.5,97},{53,97},{53,92},{56,92}}, color={0,0,127}));
        connect(dthetaTCV721.y, switch_dthetaTCV721.u3) annotation (Line(points={{49.5,78},{53,78},{53,84},{56,84}}, color={0,0,127}));
        connect(dtheta_TCV721_act.numberPort, switch_dthetaTCV721.y) annotation (Line(points={{73.5,88},{67.5,88}}, color={0,0,127}));
        connect(bool_dthetaTCV731.y, switch_dthetaTCV731.u2) annotation (Line(points={{49.5,56},{56,56}}, color={255,0,255}));
        connect(dthetaTCV731_var.y, switch_dthetaTCV731.u1) annotation (Line(points={{49.5,65},{53,65},{53,60},{56,60}}, color={0,0,127}));
        connect(dthetaTCV731.y, switch_dthetaTCV731.u3) annotation (Line(points={{49.5,46},{53,46},{53,52},{56,52}}, color={0,0,127}));
        connect(dtheta_TCV731_act.numberPort, switch_dthetaTCV731.y) annotation (Line(points={{73.5,56},{67.5,56}}, color={0,0,127}));
        connect(bool_dthetaFCVR01.y, switch_dthetaFCVR01.u2) annotation (Line(points={{49.5,23},{56,23}}, color={255,0,255}));
        connect(dthetaFCVR01_var.y, switch_dthetaFCVR01.u1) annotation (Line(points={{49.5,32},{53,32},{53,27},{56,27}}, color={0,0,127}));
        connect(dthetaFCVR01.y, switch_dthetaFCVR01.u3) annotation (Line(points={{49.5,13},{53,13},{53,19},{56,19}}, color={0,0,127}));
        connect(dtheta_TCV731_act1.numberPort, switch_dthetaFCVR01.y) annotation (Line(points={{73.5,23},{67.5,23}}, color={0,0,127}));
        connect(bool_dToutRR01.y, switch_dToutRR01.u2) annotation (Line(points={{49.5,-10},{56,-10}}, color={255,0,255}));
        connect(dToutRR01_var.y, switch_dToutRR01.u1) annotation (Line(points={{49.5,-1},{53,-1},{53,-6},{56,-6}}, color={0,0,127}));
        connect(dTout_RR01_act.numberPort, switch_dToutRR01.y) annotation (Line(points={{73.5,-10},{67.5,-10}}, color={0,0,127}));
        connect(dToutRR01.y, switch_dToutRR01.u3) annotation (Line(points={{49.5,-20},{53,-20},{53,-14},{56,-14}}, color={0,0,127}));
        connect(switch_dthetaTCV701.y, controlSignalBus.dthetaTCV701)
          annotation (Line(points={{67.5,155},{70,155},{70,141},{140,141},{140,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaTCV711.y, controlSignalBus.dthetaTCV711)
          annotation (Line(points={{67.5,121},{70,121},{70,110},{139,110},{139,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaTCV721.y, controlSignalBus.dthetaTCV721)
          annotation (Line(points={{67.5,88},{69,88},{69,80},{138,80},{138,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaTCV731.y, controlSignalBus.dthetaTCV731)
          annotation (Line(points={{67.5,56},{70,56},{70,40},{137,40},{137,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
          annotation (Line(points={{67.5,23},{70,23},{70,10},{136,10},{136,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dToutRR01.y, controlSignalBus.dToutRR01)
          annotation (Line(points={{67.5,-10},{70,-10},{70,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV701.y, controlSignalBus.dthetaFCV701)
          annotation (Line(points={{-21.5,155},{-19,155},{-19,140},{20,140},{20,-40},{139,-40},{139,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV711.y, controlSignalBus.dthetaFCV711)
          annotation (Line(points={{-21.5,121},{-19,121},{-19,110},{19,110},{19,-42},{140,-42},{140,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV721.y, controlSignalBus.dthetaFCV721)
          annotation (Line(points={{-21.5,88},{-19,88},{-19,80},{18,80},{18,-43},{141,-43},{141,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV731.y, controlSignalBus.dthetaFCV731)
          annotation (Line(points={{-21.5,56},{-19,56},{-19,50},{17,50},{17,-44},{142,-44},{142,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
          annotation (Line(points={{-21.5,-6},{-19,-6},{-19,-12},{16,-12},{16,-45},{143,-45},{143,0},{160,0}},   color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02)
          annotation (Line(points={{-21.5,-40},{-19,-40},{-19,-34},{15,-34},{15,-46},{144,-46},{144,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_domegaP901.y, controlSignalBus.domegaP901)
          annotation (Line(points={{-111.5,150},{-110,150},{-110,160},{-77,160},{-77,197},{149,197},{149,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901)
          annotation (Line(points={{-112.5,117},{-111,117},{-111,140},{-76,140},{-76,196},{148,196},{148,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_domegaP101.y, controlSignalBus.domegaP101)
          annotation (Line(points={{-111.5,40},{-110,40},{-110,34},{25,34},{25,-35},{124,-35},{124,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101)
          annotation (Line(points={{-112.5,7},{-110,7},{-110,33},{24,33},{24,-36},{125,-36},{125,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-112.5,-26},{-110,-26},{-110,-10},{-77,-10},{-77,32},{23,32},{23,-37},{127,-37},{127,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                    {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                    TextStyle.Bold},
                textString="Open
Loop
Act")}),  Diagram(coordinateSystem(
              extent={{-160,-200},{160,200}}, grid={1,1}), graphics={Rectangle(
                extent={{-150,190},{-80,90}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-145,190},{-85,170}},
                textString="S900",
                textColor={0,0,0}),                                  Rectangle(
                extent={{-150,80},{-80,-50}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-145,80},{-85,60}},
                textColor={0,0,0},
                textString="S100"),                                  Rectangle(
                extent={{-60,190},{10,36}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-55,190},{5,170}},
                textColor={0,0,0},
                textString="S700"),                                  Rectangle(
                extent={{-60,30},{10,-60}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-56,28},{4,8}},
                textColor={0,0,0},
                textString="RACK"),                                  Rectangle(
                extent={{30,190},{100,-30}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{34,190},{94,170}},
                textColor={0,0,0},
                textString="RR00")}));
      end OpenLoopActuatorBase;

      model OLA_OneGen_CaseA "Step Actuator for test facility plant considering only one generator which in this case is the gas boiler"
        extends OpenLoopActuatorBase;
      equation
        // S900
        dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
        domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;

        // S100
        dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
        domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
        dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;

        // S700
        dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
        dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
        dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
        dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;

        // Rack
        dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
        dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;

        // RR00
        dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
        dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
        dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
        dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
        dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
        dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;


        theta_FCV101SP = 1;
        omega_P101SP = 2*pi*50;
        Tout_GB101SP = 80 + 273.15;
        theta_FCV701SP = 1;
        theta_FCV711SP = 1;
        theta_FCV721SP = 1;
        theta_FCV731SP = 1;
        theta_FCV901SP = 1;
        omega_P901SP = 2*pi*35;
        theta_FCVC01SP = 1;
        theta_FCVC02SP = 1;
        theta_TCV701SP = 1;
        theta_TCV711SP = 1;
        theta_TCV721SP = 1;
        theta_TCV731SP = 1;
        theta_FCVR01SP = 1;
        Tout_RR01SP = 40 + 273.15;


        if useRealExpression then
          // S100
          booldthetaFCV101 = true;
          booldomegaP101 = true;
          booldToutGB101 = true;
          // S700
          booldthetaFCV701 = true;
          booldthetaFCV711 = true;
          booldthetaFCV721 = true;
          booldthetaFCV731 = true;
          // S900
          booldthetaFCV901 = true;
          booldomegaP901 = true;
          // Rack CD
          booldthetaFCVC01 = true;
          booldthetaFCVC02 = true;
          // RR00
          booldthetaTCV701 = true;
          booldthetaTCV711 = true;
          booldthetaTCV721 = true;
          booldthetaTCV731 = true;
          booldthetaFCVR01 = true;
          booldToutRR01 = true;
        else
          // S100
          booldthetaFCV101 = false;
          booldomegaP101 = false;
          booldToutGB101 = false;
          // S700
          booldthetaFCV701 = false;
          booldthetaFCV711 = false;
          booldthetaFCV721 = false;
          booldthetaFCV731 = false;
          // S900
          booldthetaFCV901 = false;
          booldomegaP901 = false;
          // Rack CD
          booldthetaFCVC01 = false;
          booldthetaFCVC02 = false;
          // RR00
          booldthetaTCV701 = false;
          booldthetaTCV711 = false;
          booldthetaTCV721 = false;
          booldthetaTCV731 = false;
          booldthetaFCVR01 = false;
          booldToutRR01 = false;
        end if;


      end OLA_OneGen_CaseA;

      model OLA_TwoGen_CaseA "Considering two generators Gas Boiler and Electric Boiler"
        extends OLA_OneGen_CaseA;

        Boolean booldthetaFCV401;
        Boolean booldomegaP401;
        Boolean booldToutEB401;

        // S400
        DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
        Real dtheta_FCV401_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
        Real domega_P401_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
        Real dTout_EB401_var(min = -1, max = 0);

        Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-141,-181},{-131,-171}})));
        Modelica.Blocks.Sources.TimeTable domegaP401(table=domega_P401) annotation (Placement(transformation(extent={{-141,-115},{-131,-105}})));
        Modelica.Blocks.Sources.TimeTable dthetaFCV401(table=dtheta_FCV401) annotation (Placement(transformation(extent={{-141,-148},{-131,-138}})));
        Modelica.Blocks.Sources.RealExpression domegaP401_var(y=domega_P401_var) annotation (Placement(transformation(extent={{-141,-95},{-131,-85}})));
        Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (Placement(transformation(extent={{-122,-105},{-112,-95}})));
        Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y=booldomegaP401) annotation (Placement(transformation(extent={{-141,-105},{-131,-95}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y=booldthetaFCV401) annotation (Placement(transformation(extent={{-141,-138},{-131,-128}})));
        Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y=dtheta_FCV401_var) annotation (Placement(transformation(extent={{-141,-129},{-131,-119}})));
        Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (Placement(transformation(extent={{-123,-138},{-113,-128}})));
        Modelica.Blocks.Interaction.Show.RealValue domega_P401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-110},{-85,-90}})));
        Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-143},{-85,-123}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y=booldToutEB401) annotation (Placement(transformation(extent={{-141,-171},{-131,-161}})));
        Modelica.Blocks.Sources.RealExpression dToutEB401_var(y=dTout_EB401_var) annotation (Placement(transformation(extent={{-141,-162},{-131,-152}})));
        Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (Placement(transformation(extent={{-123,-171},{-113,-161}})));
        Modelica.Blocks.Interaction.Show.RealValue dTout_EB401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-176},{-85,-156}})));
      equation
        dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
        domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
        dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;

        theta_FCV401SP = 1;
        omega_P401SP = 2*pi*50;
        Tout_EB401SP = 80 + 273.15;

        if useRealExpression then
          // S400
          booldthetaFCV401 = true;
          booldomegaP401 = true;
          booldToutEB401 = true;
        else
          booldthetaFCV401 = false;
          booldomegaP401 = false;
          booldToutEB401 = false;
          //
        end if;
        connect(domegaP401_var.y,switch_domegaP401. u1) annotation (Line(points={{-130.5,-90},{-127,-90},{-127,-96},{-123,-96}},     color={0,0,127}));
        connect(bool_domegaP401.y,switch_domegaP401. u2) annotation (Line(points={{-130.5,-100},{-123,-100}}, color={255,0,255}));
        connect(domegaP401.y,switch_domegaP401. u3) annotation (Line(points={{-130.5,-110},{-127,-110},{-127,-104},{-123,-104}}, color={0,0,127}));
        connect(bool_dthetaFCV401.y,switch_dthetaFCV401. u2) annotation (Line(points={{-130.5,-133},{-124,-133}}, color={255,0,255}));
        connect(dthetaFCV401_var.y,switch_dthetaFCV401. u1) annotation (Line(points={{-130.5,-124},{-127,-124},{-127,-129},{-124,-129}}, color={0,0,127}));
        connect(dthetaFCV401.y,switch_dthetaFCV401. u3) annotation (Line(points={{-130.5,-143},{-127,-143},{-127,-137},{-124,-137}}, color={0,0,127}));
        connect(switch_domegaP401.y,domega_P401_act. numberPort) annotation (Line(points={{-111.5,-100},{-106.5,-100}}, color={0,0,127}));
        connect(dtheta_FCV401_act.numberPort,switch_dthetaFCV401. y) annotation (Line(points={{-106.5,-133},{-112.5,-133}}, color={0,0,127}));
        connect(bool_dToutEB401.y,switch_dToutEB401. u2) annotation (Line(points={{-130.5,-166},{-124,-166}}, color={255,0,255}));
        connect(dToutEB401_var.y,switch_dToutEB401. u1) annotation (Line(points={{-130.5,-157},{-127,-157},{-127,-162},{-124,-162}}, color={0,0,127}));
        connect(dTout_EB401_act.numberPort,switch_dToutEB401. y) annotation (Line(points={{-106.5,-166},{-112.5,-166}}, color={0,0,127}));
        connect(dToutEB401.y,switch_dToutEB401. u3) annotation (Line(points={{-130.5,-176},{-127,-176},{-127,-170},{-124,-170}}, color={0,0,127}));
        connect(switch_domegaP401.y, controlSignalBus.domegaP401) annotation (Line(points={{-111.5,-100},{-110,-100},{-110,-90},{-70,-90},{-70,-74},{20,-74},{20,-50},{130,-50},{130,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (Line(points={{-112.5,-133},{-111,-133},{-111,-132},{-110,-132},{-110,-120},{-69,-120},{-69,-75},{21,-75},{21,-51},{131,-51},{131,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-112.5,-166},{-111,-166},{-111,-150},{-68,-150},{-68,-76},{22,-76},{22,-52},{132,-52},{132,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        annotation (Diagram(graphics={                               Rectangle(
                extent={{-150,-60},{-80,-190}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-145,-60},{-85,-80}},
                textColor={0,0,0},
                textString="S400")}));
      end OLA_TwoGen_CaseA;

      model OLA_ThreeGen_CaseA "Open-Loop Actuator Considering three heat generators in the test facility"
        extends OLA_TwoGen_CaseA;
        Boolean booldomegaP501;
        Boolean booldToutCHP501;

        // S500
        DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
        Real domega_P501_var(min = -1, max = 0);
        DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
        Real dTout_CHP501_var(min = -1, max = 0);

        Modelica.Blocks.Sources.TimeTable dToutCHP501(table=dTout_CHP501) annotation (Placement(transformation(extent={{-51,-165},{-41,-155}})));
        Modelica.Blocks.Sources.TimeTable domegaP501(table=domega_P501) annotation (Placement(transformation(extent={{-51,-130},{-41,-120}})));
        Modelica.Blocks.Sources.RealExpression domegaP501_var(y=domega_P501_var) annotation (Placement(transformation(extent={{-51,-110},{-41,-100}})));
        Modelica.Blocks.Logical.Switch switch_domegaP501 annotation (Placement(transformation(extent={{-32,-120},{-22,-110}})));
        Modelica.Blocks.Sources.BooleanExpression bool_domegaP501(y=booldomegaP501) annotation (Placement(transformation(extent={{-51,-120},{-41,-110}})));
        Modelica.Blocks.Interaction.Show.RealValue domega_P501_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-15,-125},{5,-105}})));
        Modelica.Blocks.Sources.BooleanExpression bool_dToutCHP501(y=booldToutCHP501) annotation (Placement(transformation(extent={{-51,-155},{-41,-145}})));
        Modelica.Blocks.Sources.RealExpression dToutCHP501_var(y=dTout_CHP501_var)
                                                                                 annotation (Placement(transformation(extent={{-51,-146},{-41,-136}})));
        Modelica.Blocks.Logical.Switch switch_dToutCHP501 annotation (Placement(transformation(extent={{-33,-155},{-23,-145}})));
        Modelica.Blocks.Interaction.Show.RealValue dTout_CHP501_act(use_numberPort=true, significantDigits=2)
                                                                                                             annotation (Placement(transformation(extent={{-15,-160},{5,-140}})));
      equation
        domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
        dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;

        omega_P501SP = 2*pi*45;
        Tout_CHP501SP = 80 + 273.15;

        if useRealExpression then
          booldomegaP501 = true;
          booldToutCHP501 = true;
        else
          booldomegaP501 = false;
          booldToutCHP501 = false;
        end if;



        connect(domegaP501_var.y,switch_domegaP501. u1) annotation (Line(points={{-40.5,-105},{-37,-105},{-37,-111},{-33,-111}}, color={0,0,127}));
        connect(bool_domegaP501.y,switch_domegaP501. u2) annotation (Line(points={{-40.5,-115},{-33,-115}}, color={255,0,255}));
        connect(domegaP501.y,switch_domegaP501. u3) annotation (Line(points={{-40.5,-125},{-37,-125},{-37,-119},{-33,-119}}, color={0,0,127}));
        connect(switch_domegaP501.y,domega_P501_act. numberPort) annotation (Line(points={{-21.5,-115},{-16.5,-115}}, color={0,0,127}));
        connect(bool_dToutCHP501.y,switch_dToutCHP501. u2) annotation (Line(points={{-40.5,-150},{-34,-150}}, color={255,0,255}));
        connect(dToutCHP501_var.y,switch_dToutCHP501. u1) annotation (Line(points={{-40.5,-141},{-37,-141},{-37,-146},{-34,-146}}, color={0,0,127}));
        connect(dTout_CHP501_act.numberPort,switch_dToutCHP501. y) annotation (Line(points={{-16.5,-150},{-22.5,-150}}, color={0,0,127}));
        connect(dToutCHP501.y,switch_dToutCHP501. u3) annotation (Line(points={{-40.5,-160},{-37,-160},{-37,-154},{-34,-154}}, color={0,0,127}));
        connect(switch_domegaP501.y, controlSignalBus.domegaP501) annotation (Line(points={{-21.5,-115},{-20,-115},{-20,-103},{-19,-103},{-19,-100},{23,-100},{23,-53},{133,-53},{133,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501)
          annotation (Line(points={{-22.5,-150},{-21,-150},{-21,-140},{24,-140},{24,-54},{134,-54},{134,0},{160,0}}, color={0,0,127}), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}},
            horizontalAlignment=TextAlignment.Left));
        annotation (Diagram(graphics={                               Rectangle(
                extent={{-60,-80},{10,-170}},
                fillColor={255,200,160},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None), Text(
                extent={{-55,-79},{5,-99}},
                textColor={0,0,0},
                textString="S500")}));
      end OLA_ThreeGen_CaseA;
    end OpenLoopActuators;

    package StepResponse "Package to evaluate step responses in the system"

      model StepResponseBase
        extends Modelica.Icons.Example;
        replaceable OpenLoopActuators.OLA_OneGen_CaseA actuator annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
        replaceable FMUExport.Centralised.CentralisedSystemGB_InitForward plant annotation (Placement(transformation(origin={-1,0}, extent={{11,-38},{55,38}})));
      //     thetaFCV401Offset(fixInput=false, fixOffset=true),
          //omegaP401Offset(fixInput=false, fixOffset=true),    omegaP501Offset(fixInput=false, fixOffset=true)
      equation
        connect(actuator.controlSignalBus, plant.controlSignalBus) annotation (Line(
            points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
            color={255,204,51},
            thickness=0.5));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(
            StopTime=10000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end StepResponseBase;

      model SR_OneGen_CaseA "This test model considers the step response using as a base the generating plant with Gas Boiler, Electric Boiler & CHP as heat generators"
        extends StepResponseBase(
        actuator(
          useRealExpression = false,
          dtheta_FCVC01 = [0, -1; 1e6, -1],
          dtheta_FCVC02 = [0, -1; 1e6, -1],
          domega_P901 = [0, (f_P901-50)/50; 1e3, (f_P901-50)/50; 1e3, (f_P901-50+f_P901_delta)/50; 1e6, (f_P901-50+f_P901_delta)/50],
          dtheta_FCV901 = [0, 0; 1e6, 0],
          dTout_GB101 = [0, 0; 1e6, 0],
          domega_P101 = [0, (f_P101-50)/50; 1e3, (f_P101-50)/50; 1e3, (f_P101-50+f_P101_delta)/50; 1e6, (f_P101-50+f_P101_delta)/50],
          dtheta_FCV101 = [0, 0; 1e6, 0],
          dtheta_FCV701 = [0, (theta_FCV701-1)/1; 1e3, (theta_FCV701-1)/1; 1e3,(theta_FCV701-1+theta_FCV701_delta)/1;  1e6, (theta_FCV701-1+theta_FCV701_delta)/1],
          dtheta_FCV711 = [0, 0; 1e6, 0],
          dtheta_FCV721 = [0, 0; 1e6, 0],
          dtheta_FCV731 = [0, 0; 1e6, 0],
          dtheta_TCV701 = [0, 0; 1e6, 0],
          dtheta_TCV711 = [0, 0; 1e6, 0],
          dtheta_TCV721 = [0, 0; 1e6, 0],
          dtheta_TCV731 = [0, 0; 1e6, 0],
          dtheta_FCVR01 = [0, 0; 1e6, 0],
          dTout_RR01 = [0, (Tout_RR01-15)/(100+273.15); 1e6, (Tout_RR01-15)/(100+273.15)]),
        plant(
          thetaFCVC01Offset(fixInput=false, fixOffset=true),
          thetaFCVC02Offset(fixInput=false, fixOffset=true),
          thetaFCV901Offset(fixInput=false, fixOffset=true),
          thetaFCV101Offset(fixInput=false, fixOffset=true),
          omegaP901Offset(fixInput=false, fixOffset=true),
          omegaP101Offset(fixInput=false, fixOffset=true),
          ToutRR01Offset(fixInput=false, fixOffset=true),
          TTR02_nom = 100 + 273.15));
        parameter Real f_P101 = 40;
        parameter Real f_P101_delta = 0;
        parameter Real f_P901 = 30;
        parameter Real f_P901_delta = 0;
        parameter Real Tout_RR01 = 30;
        parameter Real theta_FCV701 = 1;
        parameter Real theta_FCV701_delta = 0;
          // Rack CD
          // S900
          // S100
        annotation (experiment(
            StopTime=5000,
            Tolerance=1e-06,
            __Dymola_Algorithm="Dassl"));
      end SR_OneGen_CaseA;

      model SR_ThreeGen_CaseA "This test model considers the step response using as a base the generating plant with Gas Boiler, Electric Boiler & CHP as heat generators"
        extends StepResponseBase;
      end SR_ThreeGen_CaseA;
    end StepResponse;

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
      parameter Real dTT704[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
      parameter Real dTT714[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
      parameter Real dTT724[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
      parameter Real dTT734[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
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
      connect(PI_TT704.controlAction, controlSignalBus.dthetaFCV701) annotation (Line(points={{50.5,30},
              {62,30},{62,-5},{110,-5}},                                                                                         color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT714SP.y, PI_TT714.REF) annotation (Line(points={{30.5,17},{41,17}}, color={0,0,127}));
      connect(PI_TT714.controlAction, controlSignalBus.dthetaFCV711) annotation (Line(points={{50.5,15},
              {58,15},{58,-5},{110,-5}},                                                                                         color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT724.controlAction, controlSignalBus.dthetaFCV721) annotation (Line(points={{50.5,
              -35},{59,-35},{59,-5},{110,-5}},                                                                                     color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT734.controlAction, controlSignalBus.dthetaFCV731) annotation (Line(points={{50.5,
              -55},{57,-55},{57,-5},{110,-5}},                                                                                     color={0,0,127}), Text(
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
      connect(PI_FT401.controlAction, controlSignalBus.dthetaFCV401) annotation (Line(points={{50.5,75},
              {63,75},{63,-5},{110,-5}},                                                                                         color={0,0,127}));
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
      connect(PI_dPTA2.controlAction, controlSignalBus.domegaP901) annotation (Line(points={{50.5,
              -75},{80,-75},{80,-5},{110,-5}},                                                                                                     color={0,0,127}), Text(
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
      connect(PI_dPT100.controlAction, controlSignalBus.domegaP101) annotation (Line(points={{50.5,60},
              {68,60},{68,-7},{110,-7},{110,-5}},                                                                                        color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT101SP.y, PI_FT101.REF) annotation (Line(points={{30.5,92},{41,92}}, color={0,0,127}));
      connect(PI_FT101.controlAction, controlSignalBus.dthetaFCV101) annotation (Line(points={{50.5,90},
              {62,90},{62,88},{76,88},{76,-5},{110,-5}},                                                                                         color={0,0,127}), Text(
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
      connect(PI_dEX721Pt.controlAction, controlSignalBus.dmflowcoolEX721) annotation (Line(points={{50.5,
              -135},{86,-135},{86,-5},{110,-5}},                                                                                         color={0,0,127}), Text(
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
      connect(PI_dEX701Pt.controlAction, controlSignalBus.dmflowcoolEX701) annotation (Line(points={{50.5,
              -95},{83,-95},{83,-5},{110,-5}},                                                                                           color={0,0,127}), Text(
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
      connect(PI_dEX711Pt.controlAction, controlSignalBus.dmflowcoolEX711) annotation (Line(points={{50.5,
              -115},{88,-115},{88,-5},{110,-5}},                                                                                           color={0,0,127}), Text(
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
      connect(PI_dEX731Pt.controlAction, controlSignalBus.dmflowcoolEX731) annotation (Line(points={{50.5,
              -155},{71,-155},{71,-149},{90,-149},{90,-5},{110,-5}},                                                                                           color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1})));
    end ThermalPlantController;

    model CoolingPlantController
      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, 0; 1e6, 0];
      parameter Real dmflowhot_EX701[:, :] = [0, 0; 1e6, 0];
      parameter Real dmflowhot_EX711[:, :] = [0, 0; 1e6, 0];
      parameter Real dmflowhot_EX721[:, :] = [0, 0; 1e6, 0];
      parameter Real dmflowhot_EX731[:, :] = [0, 0; 1e6, 0];

      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dEX701Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX711Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX721Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dEX731Pt[:, :] = [0, (32.306e3 - 50e3)/50e3; 1e3, (32.306e3 - 50e3)/50e3];
      parameter Real dTT704[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT714[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT724[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT734[:, :] = [0, 0; 1e3, 0];
    //   parameter Real dTT704[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
    //   parameter Real dTT714[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
    //   parameter Real dTT724[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
    //   parameter Real dTT734[:, :] = [0, (35 - 20)/(20 + 273.15); 1e3, (35 - 20)/(20 + 273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];
      parameter Real ddFTR00[:, :] = [0, 0; 1000, 0];

      Real Ptotal(start = 200e3);
      Real m_flow_cool_total;
      Real dm_flow_cool_total;

      Modelica.Blocks.Sources.TimeTable dthetaTCV701(table = dtheta_TCV701) annotation (
        Placement(transformation(extent={{-74,65},{-64,75}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV711(table = dtheta_TCV711) annotation (
        Placement(transformation(extent={{-74,50},{-64,60}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV721(table = dtheta_TCV721) annotation (
        Placement(transformation(extent={{-74,35},{-64,45}})));
      Modelica.Blocks.Sources.TimeTable dmflowhotEX701(table = dmflowhot_EX701) annotation (
        Placement(transformation(extent={{-74,5},{-64,15}})));
      Modelica.Blocks.Sources.TimeTable dmflowhotEX711(table = dmflowhot_EX711) annotation (
        Placement(transformation(extent={{-74,-10},{-64,0}})));
      Modelica.Blocks.Sources.TimeTable dmflowhotEX721(table = dmflowhot_EX721) annotation (
        Placement(transformation(extent={{-74,-25},{-64,-15}})));
      Modelica.Blocks.Sources.TimeTable dmflowhotEX731(table = dmflowhot_EX731) annotation (
        Placement(transformation(extent={{-74,-40},{-64,-30}})));
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
        Placement(visible = true, transformation(origin = {110, -5}, extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dthetaTCV731(table = dtheta_TCV731) annotation (
        Placement(transformation(extent={{-74,20},{-64,30}})));
      Modelica.Blocks.Sources.TimeTable dTT704SP(table=dTT704)   annotation (
        Placement(transformation(extent={{-5,-4},{5,6}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin = {-102, 0}, extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dTT714SP(table=dTT714)   annotation (
        Placement(transformation(extent={{-5,-21},{5,-11}})));
      Modelica.Blocks.Sources.TimeTable dTT724SP(table=dTT724)   annotation (
        Placement(transformation(extent={{-5,-40},{5,-30}})));
      Modelica.Blocks.Sources.TimeTable dTT734SP(table=dTT734)   annotation (
        Placement(transformation(extent={{-5,-61},{5,-51}})));
      Modelica.Blocks.Sources.TimeTable dFTR01SP(table=dFTR01)   annotation (
        Placement(transformation(extent={{-5,115},{5,125}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{-74,-75},{-64,-65}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{-74,-57},{-64,-47}})));
      Modelica.Blocks.Sources.TimeTable dEX721PtSP(table=dEX721Pt) annotation (Placement(transformation(extent={{-5,31},{5,41}})));
      Modelica.Blocks.Sources.TimeTable dEX701PtSP(table=dEX701Pt) annotation (Placement(transformation(extent={{-5,65},{5,75}})));
      Modelica.Blocks.Sources.TimeTable dEX711PtSP(table=dEX711Pt) annotation (Placement(transformation(extent={{-5,48},{5,58}})));
      Modelica.Blocks.Sources.TimeTable dEX731PtSP1(table=dEX731Pt)
                                                                   annotation (Placement(transformation(extent={{-5,14},{5,24}})));
      Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
        k=-0.5529,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState)
                                                         annotation (Placement(transformation(extent={{46,85},{56,95}})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{23,83},{37,97}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT704(
        Kp=9.494,
        Ti=1.112,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{44,-3},{54,7}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT714(
        Kp=8.21,
        Ti=0.9683,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{44,-20},{54,-10}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(
        Kp=1.6237,
        Ti=0.53763,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{44,49},{54,59}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(
        Kp=1.7773,
        Ti=0.5592,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{44,66},{54,76}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(
        Kp=1.4378,
        Ti=0.31466,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{43,14},{53,24}})));
      Modelica.Blocks.Sources.RealExpression dFTR01SPvar(y=dm_flow_cool_total)
                                                                              annotation (Placement(transformation(extent={{-38,81},{-18,101}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(
        Kp=1.4734,
        Ti=0.49585,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{44,30},{54,40}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT1(
        Kp=12.02,
        Ti=1.272,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{45,-60},{55,-50}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dTT724(
        Kp=8.688,
        Ti=0.9461,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{44,-40},{54,-30}})));
      Modelica.Blocks.Sources.TimeTable ddFTR00SP(table=ddFTR00) annotation (
        Placement(transformation(extent={{-5,85},{5,95}})));
    equation
      //Ptotal = if time < 1000 then 120e3 else 160e3;
      Ptotal = 4*32.306e3;
      Ptotal = 4185*15*m_flow_cool_total;
      dm_flow_cool_total = (m_flow_cool_total - DistrictHeatingNetwork.Data.PumpData.PR01.qnommax_inm3h*980/3600)/DistrictHeatingNetwork.Data.PumpData.PR01.qnommax_inm3h*980/3600;
      connect(dToutRR01.y, controlSignalBus.dToutRR01) annotation (Line(points={{-63.5,-70},{-46,-70},{-46,-68},{-11,-68},{-11,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(limIntegrator.y, controlSignalBus.dthetaFCVR01) annotation (Line(points={{56.5,90},{74,90},{74,-5},{110,-5}},               color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(feedback.y, limIntegrator.u) annotation (Line(points={{36.3,90},{45,90}},           color={0,0,127}));
      connect(dTT704SP.y, PI_dTT704.REF) annotation (Line(points={{5.5,1},{22,1},{22,0},{38,0},{38,4},{45,4}}, color={0,0,127}));
      connect(processVariableBus.dTT704, PI_dTT704.FeedBack) annotation (Line(
          points={{-102,0},{-30,0},{-30,-2},{43,-2},{43,0},{45,0}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dTT704.controlAction, controlSignalBus.dmflowhotEX701)
        annotation (Line(points={{54.5,2},{81,2},{81,-5},{110,-5}},
                                                                  color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dTT714.controlAction, controlSignalBus.dmflowhotEX711) annotation (Line(points={{54.5,-15},{66,-15},{66,-14},{84,-14},{84,-5},{110,-5}},
                                                                                                                                                        color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT714SP.y, PI_dTT714.REF) annotation (Line(points={{5.5,-16},{19,-16},{19,-13},{45,-13}}, color={0,0,127}));
      connect(processVariableBus.dTT714, PI_dTT714.FeedBack) annotation (Line(
          points={{-102,0},{-17,0},{-17,-24},{21,-24},{21,-17},{45,-17}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack) annotation (Line(
          points={{-102,0},{-8,0},{-8,45},{40,45},{40,52},{45,52}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX711Pt.controlAction, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{54.5,54},{61,54},{61,-5},{110,-5}},
                                                                    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dEX701Pt.controlAction, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{54.5,71},{59,71},{59,-5},{110,-5}},
                                                                    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dEX711Pt.REF, dEX711PtSP.y) annotation (Line(points={{45,56},{8,56},{8,53},{5.5,53}}, color={0,0,127}));
      connect(PI_dEX701Pt.REF, dEX701PtSP.y) annotation (Line(points={{45,73},{8,73},{8,70},{5.5,70}}, color={0,0,127}));
      connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack) annotation (Line(
          points={{-102,0},{-27,0},{-27,64},{41,64},{41,69},{45,69}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dEX731PtSP1.y, PI_dEX731Pt.REF) annotation (Line(points={{5.5,19},{25,19},{25,21},{44,21}}, color={0,0,127}));
      connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack) annotation (Line(
          points={{-102,0},{-25,0},{-25,10},{40,10},{40,17},{44,17}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX731Pt.controlAction, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{53.5,19},{85,19},{85,-5},{110,-5}},
                                                                    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX721PtSP.y, PI_dEX721Pt.REF) annotation (Line(points={{5.5,36},{7,36},{7,37},{45,37}}, color={0,0,127}));
      connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (Line(
          points={{-102,0},{-24,0},{-24,28},{41,28},{41,33},{45,33}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dTT734SP.y, PI_dTT1.REF) annotation (Line(points={{5.5,-56},{19,-56},{19,-53},{46,-53}}, color={0,0,127}));
      connect(PI_dTT1.controlAction, controlSignalBus.dmflowhotEX731) annotation (Line(points={{55.5,-55},{64,-55},{64,-54},{85,-54},{85,-5},{110,-5}},
                                                                                                                                                      color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dTT734, PI_dTT1.FeedBack) annotation (Line(
          points={{-102,0},{-57,0},{-57,1},{-15,1},{-15,-62},{41,-62},{41,-57},{46,-57}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dTT724SP.y, PI_dTT724.REF) annotation (Line(points={{5.5,-35},{14,-35},{14,-36},{22,-36},{22,-33},{45,-33}}, color={0,0,127}));
      connect(processVariableBus.dTT724, PI_dTT724.FeedBack) annotation (Line(
          points={{-102,0},{-59,0},{-59,-1},{-16,-1},{-16,-46},{27,-46},{27,-37},{45,-37}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dTT724.controlAction, controlSignalBus.dmflowhotEX721) annotation (Line(points={{54.5,-35},{63,-35},{63,-33},{75,-33},{75,-5},{110,-5}},
                                                                                                                                                        color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dEX721Pt.controlAction, controlSignalBus.dthetaTCV721) annotation (Line(points={{54.5,35},{66,35},{66,36},{81,36},{81,-5},{110,-5}},
                                                                                                                                                    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.ddFTR00, feedback.u2)
        annotation (Line(
          points={{-102,0},{-31,0},{-31,80},{30,80},{30,84.4}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(dFTR01SPvar.y, feedback.u1) annotation (Line(points={{-17,91},{-14,91},{-14,90},{-12,90},{-12,105},{16,105},{16,90},{24.4,90}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false),   graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1})));
    end CoolingPlantController;

    model FullPlantController
      Real EX701PtSP(start = 40e3);
      Real EX711PtSP(start = 40e3);
      Real EX721PtSP(start = 40e3);
      Real EX731PtSP(start = 40e3);
      Real PtSP(nominal = 200e3);
      Real FT901SP(nominal = 10);
      Real FT101SP(nominal = 5);


      parameter Real Kp_TT701 = 2.7148; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_TT701 = 0.23764;
      parameter Real Kp_TT711 = 10.2519; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_TT711 = 0.97913;
      parameter Real Kp_TT721 = 16.66; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT721 = 1.4156;
      parameter Real Kp_TT731 = 21.1084; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT731 = 1.7782;

    //   parameter Real Kp_dTT701 = -0.00132;//-0.15335; // phi = 60°, omegac = 0.09 rad/s;
    //   parameter Real Ti_dTT701 = 0.01;//0.12925;
    //   parameter Real Kp_dTT711 = -6.7268e-05; //-0.076137; // phi = 60°, omega = 0.12 rad/s;
    //   parameter Real Ti_dTT711 = 0.01; //0.91554;
    //   parameter Real Kp_dTT721 = -6.9181e-05; //-0.10967; // phi = 60°, omega = 0.12 rad/s;
    //   parameter Real Ti_dTT721 = 0.01; //1.2869;
    //   parameter Real Kp_dTT731 = -0.0027899; //-0.0022188; // phi = 75°, omega = 0.05 rad/s;
    //   parameter Real Ti_dTT731 = 0.01; //0.0011111;

      parameter Real Kp_dTT701 = -0.02916; //-3.1401; //-0.15335; // phi = 75°, omegac = 0.12 rad/s;
      parameter Real Ti_dTT701 = 0.2142; //2.3537; //0.12925;
      parameter Real Kp_dTT711 = -0.12; //-6.7268e-05; //-0.076137; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT711 = 0.9852; //0.01; //0.91554;
      parameter Real Kp_dTT721 = -0.194; //-6.9181e-05; //-0.10967; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT721 = 1.352; //0.01; //1.2869;
      parameter Real Kp_dTT731 = -0.236; //-4.395; //-0.0022188; // phi = 75°, omega = 0.05 rad/s;
      parameter Real Ti_dTT731 = 1.712; //5.663; //0.0011111;

      parameter Real Kp_TT704 = 45.7901; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_TT704 = 0.48554;
      parameter Real Kp_TT714 = 48.4543; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_TT714 = 0.56124;
      parameter Real Kp_TT724 = 50.0852; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT724 = 0.5399;
      parameter Real Kp_TT734 = 77.0333; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT734 = 0.77589;

      parameter Real Kp_PtEX701 = 5.923; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_PtEX701 = 1.23;
      parameter Real Kp_PtEX711 = 5.662; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_PtEX711 = 1.145;
      parameter Real Kp_PtEX721 = 5.757; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX721 = 1.201;
      parameter Real Kp_PtEX731 = 9.406; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX731 = 1.464;

      parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
      parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dmflowcool_EX701[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX711[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX721[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX731[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dEX701Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX711Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX721Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX731Pt[:, :] = [0, (28e3 - 50e3)/50e3; 5.5e3, (28e3 - 50e3)/50e3; 5.5e3, (40e3 - 50e3)/50e3; 1e4, (40e3 - 50e3)/50e3];
      parameter Real ddPT100[:, :] = [0, 0; 1e3, 0];
      parameter Real ddPTA2[:, :] = [0, 0; 1e3, 0];

      parameter Real dTT701[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT711[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT721[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT731[:, :] = [0, 0; 6e3, 0];

      parameter Real ddTT701[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT711[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT721[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT731[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];

      parameter Real dTT704[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT714[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT724[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT734[:, :] = [0, 0; 1e3, 0];
      parameter Real dFT701[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT711[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT721[:, :] = [0, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 1000, (0.8 - 1.3)/1.3];
      //parameter Real dTT731[:, :] = [0, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 1000, (55 - 65)/(65 + 273.15)];
      parameter Real dFT901[:, :] = [0, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 1000, (1.8 - 7.6222)/7.6222];
      parameter Real dFT101[:, :] = [0, (1.3 - 5.7166667)/5.7166667; 500, (1.3 - 5.7166667)/5.7166667];
      parameter Real dFT401[:, :] = [0, (0.75 - 3.2666667)/3.2666667; 500, (0.75 - 3.2666667)/3.2666667];

      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];


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
        Kp=Kp_dTT701,
        Ti=Ti_dTT701,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,50},{50,60}})));
      Modelica.Blocks.Sources.TimeTable dTT704SP(table=dTT704)   annotation (
        Placement(transformation(extent={{20,52},{30,62}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin = {-102, 0}, extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT714(
        Kp=Kp_dTT711,
        Ti=Ti_dTT711,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,35},{50,45}})));
      Modelica.Blocks.Sources.TimeTable dTT714SP(table=dTT714)   annotation (
        Placement(transformation(extent={{20,37},{30,47}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT724(
        Kp=Kp_dTT721,
        Ti=Ti_dTT721,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{46,21},
                {56,31}})));
      Modelica.Blocks.Sources.TimeTable dTT724SP(table=dTT724)   annotation (
        Placement(transformation(extent={{20,22},{30,32}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT734(
        Kp=Kp_dTT731,
        Ti=Ti_dTT731,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,5},{
                55,15}})));
      Modelica.Blocks.Sources.TimeTable dTT734SP(table=dTT734)   annotation (
        Placement(transformation(extent={{20,7},{30,17}})));
      Modelica.Blocks.Sources.TimeTable dFT101SP(table = dFT101) annotation (
        Placement(transformation(extent={{20,83},{30,93}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
        Kp=0.00030402,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,66},{50,76}})));
      Modelica.Blocks.Sources.TimeTable dFT401SP(table = dFT401) annotation (
        Placement(transformation(extent={{20,68},{30,78}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-80,105},{-70,115}})));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-80,122},{-70,132}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPTA2(
        Kp=2.412,
        Ti=0.2679,
        Umax=0,
        Umin=-0.4,
        y_start=-0.4,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,-52},{50,-42}})));
      Modelica.Blocks.Sources.TimeTable ddPTA2SP(table=ddPTA2) annotation (Placement(transformation(extent={{20,-47},{30,-37}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-80,-137},{-70,-127}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPT100(
        Kp=0.00024658,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{39,-32},{49,-22}})));
      Modelica.Blocks.Sources.TimeTable ddPT100SP(table=ddPT100)
                                                               annotation (Placement(transformation(extent={{20,-30},{30,-20}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(
        Kp=0.00032462,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,81},{50,91}})));
      Modelica.Blocks.Continuous.LimIntegrator I_FTR01(
        k=1.2,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{52,189},{62,199}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(
        Kp=Kp_PtEX711,
        Ti=Ti_PtEX711,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,159},{64,169}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(
        Kp=Kp_PtEX701,
        Ti=Ti_PtEX701,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,174},{64,184}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(
        Kp=Kp_PtEX721,
        Ti=Ti_PtEX721,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,144},{64,154}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(
        Kp=Kp_PtEX731,
        Ti=Ti_PtEX731,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,129},{64,139}})));
      Modelica.Blocks.Math.Feedback fbFTR01 annotation (Placement(transformation(extent={{33,189},{43,199}})));
      Modelica.Blocks.Sources.TimeTable dFTR01SP(table=dFTR01)   annotation (
        Placement(transformation(extent={{19,189},{29,199}})));
      Modelica.Blocks.Sources.TimeTable dEX721PtSP(table=dEX721Pt) annotation (Placement(transformation(extent={{19,144},{29,154}})));
      Modelica.Blocks.Sources.TimeTable dEX701PtSP(table=dEX701Pt) annotation (Placement(transformation(extent={{19,174},{29,184}})));
      Modelica.Blocks.Sources.TimeTable dEX711PtSP(table=dEX711Pt) annotation (Placement(transformation(extent={{19,159},{29,169}})));
      Modelica.Blocks.Sources.TimeTable dEX731PtSP(table=dEX731Pt) annotation (Placement(transformation(extent={{19,129},{29,139}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{-80,-155},{-70,-145}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{-80,-175},{-70,-165}})));
      Modelica.Blocks.Continuous.LimIntegrator I_dPTA2(
        k=0.065,
        outMax=0,
        outMin=-0.4,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{58,-72},{68,-62}})));
      Modelica.Blocks.Math.Feedback fbdPTA2 annotation (Placement(transformation(extent={{38,-74},{52,-60}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX701Pt(
        k=1.3327,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,180},{90,190}})));
      Modelica.Blocks.Math.Feedback fbEX701Pt annotation (Placement(transformation(extent={{68,181},{76,189}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX711Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,160},{90,170}})));
      Modelica.Blocks.Math.Feedback fbEX711Pt annotation (Placement(transformation(extent={{68,161},{76,169}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX721Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,144},{90,154}})));
      Modelica.Blocks.Math.Feedback fbEX721Pt annotation (Placement(transformation(extent={{68,145},{76,153}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX731Pt(
        k=2.0703,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,129},{90,139}})));
      Modelica.Blocks.Math.Feedback fbEX731Pt annotation (Placement(transformation(extent={{68,130},{76,138}})));
      Modelica.Blocks.Sources.TimeTable dFT901SP(table=dFT901) annotation (Placement(transformation(extent={{20,99},{30,109}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT901(
        Kp=0.00021009,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{40,97},{50,107}})));
      Modelica.Blocks.Sources.RealExpression dEX701PtSP_var(y=(EX701PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{4,172},{14,182}})));
      Modelica.Blocks.Sources.RealExpression dEX711PtSP_var(y=(EX711PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,159},{13,169}})));
      Modelica.Blocks.Sources.RealExpression dEX721PtSP_var(y=(EX721PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,144},{13,154}})));
      Modelica.Blocks.Sources.RealExpression dEX731PtSP_var(y=(EX731PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,130},{13,140}})));
      Modelica.Blocks.Sources.RealExpression dFT901SP_var(y=(FT901SP - 7.6222)/7.6222) annotation (Placement(transformation(extent={{5,97},{15,107}})));
      Modelica.Blocks.Sources.TimeTable dTT701SP(table=ddTT701)
                                                               annotation (Placement(transformation(extent={{4,53},{14,63}})));
      Modelica.Blocks.Sources.TimeTable dTT711SP(table=ddTT711)
                                                               annotation (Placement(transformation(extent={{4,38},{14,48}})));
      Modelica.Blocks.Sources.TimeTable dTT721SP(table=ddTT721)
                                                               annotation (Placement(transformation(extent={{4,23},{14,33}})));
      Modelica.Blocks.Sources.TimeTable dTT731SP(table=ddTT731)
                                                               annotation (Placement(transformation(extent={{4,8},{14,18}})));
      Modelica.Blocks.Sources.RealExpression dFT101SP_var(y=(FT101SP - 5.7166667)/5.7166667)
        annotation (Placement(transformation(extent={{5,85},{15,95}})));
    equation
      EX701PtSP = if time < 4e3 then 28e3 elseif time < 5e3 then 35e3 else 45e3;
      EX711PtSP = if time < 4e3 then 28e3 elseif time < 5e3 then 30e3 else 40e3;
      EX721PtSP = if time < 4e3 then 28e3 elseif time < 5e3 then 32e3 else 40e3;
      EX731PtSP = if time < 4e3 then 28e3 elseif time < 5e3 then 35e3 else 40e3;
    //   PtSP = EX701PtSP + EX711PtSP + EX721PtSP + EX731PtSP;
    //   FT901SP = PtSP/(4185*15);
    //   FT101SP = FT901SP*0.8;
      PtSP = EX701PtSP + EX711PtSP + EX721PtSP + EX731PtSP;
      FT901SP = 1.5*PtSP/(4185*15);
      FT101SP = FT901SP*0.8;


      connect(dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
        Line(points={{-69.5,5},{6,5},{6,-5},{110,-5}},          color = {0, 0, 127}),
        Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
      connect(PI_TT704.controlAction, controlSignalBus.dthetaFCV701) annotation (Line(points={{50.5,55},{67,55},{67,-5},{110,-5}},
                                                                                                                                 color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT714.controlAction, controlSignalBus.dthetaFCV711) annotation (Line(points={{50.5,40},{63,40},{63,-5},{110,-5}},
                                                                                                                                 color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT724.controlAction, controlSignalBus.dthetaFCV721) annotation (Line(points={{56.5,26},
              {59,26},{59,-5},{110,-5}},                                                                                           color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT734.controlAction, controlSignalBus.dthetaFCV731) annotation (Line(points={{55.5,10},
              {62,10},{62,-5},{110,-5}},                                                                                           color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT401SP.y, PI_FT401.REF) annotation (Line(points={{30.5,73},{41,73}},                 color={0,0,127}));
      connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (Line(
          points={{-102,0},{36,0},{36,69},{41,69}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(
          dthetaFCV901.y, controlSignalBus.dthetaFCV901) annotation (
        Line(points={{-69.5,80},{-32,80},{-32,-5},{110,-5}},        color = {0, 0, 127}));
      connect(dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-69.5,110},{10,110},{10,112},{89,112},{89,-8},{110,-8},{110,-5}},
                                                                                                                                     color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-69.5,127},{9,127},{9,124},{87,124},{87,-5},{110,-5}},
                                                                                                                          color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.ddTT701, PI_TT704.FeedBack) annotation (Line(
          points={{-102,0},{37,0},{37,53},{41,53}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT711, PI_TT714.FeedBack) annotation (Line(
          points={{-102,0},{38,0},{38,38},{41,38}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT721, PI_TT724.FeedBack) annotation (Line(
          points={{-102,0},{-32,0},{-32,-1},{39,-1},{39,24},{47,24}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT731, PI_TT734.FeedBack) annotation (Line(
          points={{-102,0},{-56,0},{-56,-8},{42,-8},{42,2},{44,2},{44,8},{46,8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dPTA2, PI_dPTA2.FeedBack) annotation (Line(
          points={{-102,0},{37,0},{37,-49},{41,-49}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(ddPTA2SP.y, PI_dPTA2.REF) annotation (Line(points={{30.5,-42},{35,-42},{35,-45},{41,-45}}, color={0,0,127}));
      connect(dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
        annotation (Line(points={{-69.5,-132},{-7,-132},{-7,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(ddPT100SP.y, PI_dPT100.REF) annotation (Line(points={{30.5,-25},{40,-25}},
                                                                                       color={0,0,127}));
      connect(processVariableBus.dPT102, PI_dPT100.FeedBack) annotation (Line(
          points={{-102,0},{38,0},{38,-29},{40,-29}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbFTR01.y, I_FTR01.u) annotation (Line(points={{42.5,194},{51,194}}, color={0,0,127}));
      connect(dFTR01SP.y, fbFTR01.u1) annotation (Line(points={{29.5,194},{34,194}},   color={0,0,127}));
      connect(processVariableBus.dFTR01, fbFTR01.u2)
        annotation (Line(
          points={{-102,0},{-10,0},{-10,183},{38,183},{38,190}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack)
        annotation (Line(
          points={{-102,0},{-7,0},{-7,173},{49,173},{49,177},{55,177}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack)
        annotation (Line(
          points={{-102,0},{-4,0},{-4,158},{50,158},{50,162},{55,162}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (Line(
          points={{-102,0},{-51,0},{-51,-1},{-1,-1},{-1,143},{50,143},{50,147},{55,147}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack)
        annotation (Line(
          points={{-102,0},{-1,0},{-1,126},{49,126},{49,132},{55,132}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dToutRR01.y, controlSignalBus.dToutRR01) annotation (Line(points={{-69.5,-150},{-1,-150},{-1,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
        annotation (Line(points={{-69.5,-170},{83,-170},{83,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(fbdPTA2.y, I_dPTA2.u) annotation (Line(points={{51.3,-67},{57,-67}}, color={0,0,127}));
      connect(processVariableBus.dPTA2, fbdPTA2.u2) annotation (Line(
          points={{-102,0},{36,0},{36,-80},{45,-80},{45,-72.6}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbdPTA2.u1, PI_dPTA2.REF) annotation (Line(points={{39.4,-67},{37,-67},{37,-68},{35,-68},{35,-45},{41,-45}},
                                                                                                         color={0,0,127}));
      connect(fbEX701Pt.y, I_EX701Pt.u) annotation (Line(points={{75.6,185},{79,185}}, color={0,0,127}));
      connect(processVariableBus.dEX701Pt, fbEX701Pt.u2) annotation (Line(
          points={{-102,-0},{-7,-0},{-7,173},{41,173},{41,170},{72,170},{72,181.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX701Pt.u1, PI_dEX701Pt.REF) annotation (Line(points={{68.8,185},{42,185},{42,179},{49,179},{49,181},{55,181}}, color={0,0,127}));
      connect(fbEX711Pt.y, I_EX711Pt.u) annotation (Line(points={{75.6,165},{79,165}}, color={0,0,127}));
      connect(processVariableBus.dEX711Pt, fbEX711Pt.u2) annotation (Line(
          points={{-102,0},{-4.02439,0},{-4.02439,158.049},{50,158.049},{50,156},{72,156},{72,161.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX721Pt.y, I_EX721Pt.u) annotation (Line(points={{75.6,149},{79,149}}, color={0,0,127}));
      connect(fbEX721Pt.u1, PI_dEX721Pt.REF) annotation (Line(points={{68.8,149},{66,149},{66,155},{49,155},{49,151},{55,151}}, color={0,0,127}));
      connect(processVariableBus.dEX721Pt, fbEX721Pt.u2) annotation (Line(
          points={{-102,0},{-50.9756,0},{-50.9756,-0.97561},{-1.09756,-0.97561},{-1.09756,143.049},{50,143.049},{50,141},{72,141},{72,145.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX731Pt.y, I_EX731Pt.u) annotation (Line(points={{75.6,134},{79,134}}, color={0,0,127}));
      connect(fbEX731Pt.u1, PI_dEX731Pt.REF) annotation (Line(points={{68.8,134},{66,134},{66,140},{50,140},{50,136},{55,136}}, color={0,0,127}));
      connect(processVariableBus.dEX731Pt, fbEX731Pt.u2) annotation (Line(
          points={{-102,0},{-56,0},{-56,-1},{-18,-1},{-18,119},{72,119},{72,130.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX731Pt.controlAction, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{64.5,134},{66,134},{66,114},{103,114},{103,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCV101.y, controlSignalBus.dthetaFCV101)
        annotation (Line(points={{-69.5,50},{-52,50},{-52,51},{-39,51},{-39,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT101.controlAction, controlSignalBus.domegaP101)
        annotation (Line(points={{50.5,86},{82,86},{82,-5},{110,-5}},                 color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCV401.y, controlSignalBus.dthetaFCV401)
        annotation (Line(points={{-69.5,20},{-58,20},{-58,21},{-43,21},{-43,-5},{110,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dEX721Pt.controlAction, controlSignalBus.dthetaTCV721)
        annotation (Line(points={{64.5,149},{65,149},{65,145},{78,145},{78,105},{99,105},{99,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dFT101, PI_FT101.FeedBack)
        annotation (Line(
          points={{-102,0},{35,0},{35,84},{41,84}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dFT901, PI_FT901.FeedBack)
        annotation (Line(
          points={{-102,0},{34,0},{34,100},{41,100}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_dEX701Pt.controlAction, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{64.5,179},{69,179},{69,175},{96,175},{96,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_dEX711Pt.controlAction, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{64.5,164},{66,164},{66,160},{92,160},{92,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX701PtSP_var.y, PI_dEX701Pt.REF) annotation (Line(points={{14.5,177},{17,177},{17,176},{45,176},{45,181},{55,181}}, color={0,0,127}));
      connect(PI_FT901.controlAction, controlSignalBus.domegaP901)
        annotation (Line(points={{50.5,102},{91,102},{91,-5},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(domegaP401.y, controlSignalBus.domegaP401)
        annotation (Line(points={{-69.5,35},{-57,35},{-57,36},{-43,36},{-43,-4},{110,-4},{110,-5}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX711PtSP_var.y, PI_dEX711Pt.REF) annotation (Line(points={{13.5,164},{15,164},{15,163},{16,163},{16,162},{43,162},{43,166},{55,166}}, color={0,0,127}));
      connect(fbEX711Pt.u1, PI_dEX711Pt.REF) annotation (Line(points={{68.8,165},{66,165},{66,171},{50,171},{50,166},{55,166}}, color={0,0,127}));
      connect(dEX721PtSP_var.y, PI_dEX721Pt.REF) annotation (Line(points={{13.5,149},{17,149},{17,155},{43,155},{43,151},{55,151}}, color={0,0,127}));
      connect(dEX731PtSP_var.y, PI_dEX731Pt.REF) annotation (Line(points={{13.5,135},{15,135},{15,134},{17,134},{17,131},{44,131},{44,136},{55,136}}, color={0,0,127}));
      connect(dFT901SP_var.y, PI_FT901.REF) annotation (Line(points={{15.5,102},{19,102},{19,114},{36,114},{36,104},{41,104}}, color={0,0,127}));
      connect(dTT731SP.y, PI_TT734.REF) annotation (Line(points={{14.5,13},{14.5,4},{42,4},
              {42,12},{46,12}},                                                                                      color={0,0,127}));
      connect(dTT721SP.y, PI_TT724.REF) annotation (Line(points={{14.5,28},{23,28},{23,29},
              {32,29},{32,28},{47,28}},                                                                              color={0,0,127}));
      connect(dTT711SP.y, PI_TT714.REF) annotation (Line(points={{14.5,43},{16,43},{16,46},{32,46},{32,42},{41,42}}, color={0,0,127}));
      connect(dTT701SP.y, PI_TT704.REF) annotation (Line(points={{14.5,58},{16,58},{16,61},{32,61},{32,57},{41,57}}, color={0,0,127}));
      connect(dFT101SP_var.y, PI_FT101.REF) annotation (Line(points={{15.5,90},{18,90},{18,95},
              {37,95},{37,88},{41,88}}, color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(
            extent={{-100,-200},{100,200}},
            preserveAspectRatio=false,
            grid={1,1})));
    end FullPlantController;

    model FullPlantController_B
      Real EX701PtSP(start = 40e3);
      Real EX711PtSP(start = 40e3);
      Real EX721PtSP(start = 40e3);
      Real EX731PtSP(start = 40e3);
      Real PtSP(nominal = 200e3);
      Real FT901SP(nominal = 10);
      Real FT101SP(nominal = 5);

      parameter Real Kp_TT701 = 35.7682; //2.7148; // phi = 60°, omegac = 0.05 rad/s;
      parameter Real Ti_TT701 = 1.7239; //0.23764;
      parameter Real Kp_TT711 = 1.6754; // 1.1403; // phi = 60°, omega = 0.05 rad/s;
      parameter Real Ti_TT711 = 1.0102; // 1.4897;
      parameter Real Kp_TT721 = 2.6074; // 2.6074; 16.66; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT721 = 1.5278; //1.4156;
      parameter Real Kp_TT731 = 26.7534; //21.1084; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT731 = 0.653; //1.7782;

      parameter Real Kp_dTT701 = -3.1401; //-0.15335; // phi = 75°, omegac = 0.12 rad/s;
      parameter Real Ti_dTT701 = 2.3537; //0.12925;
      parameter Real Kp_dTT711 = -6.7268e-05; //-0.076137; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT711 = 0.01; //0.91554;
      parameter Real Kp_dTT721 = -6.9181e-05; //-0.10967; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT721 = 0.01; //1.2869;
      parameter Real Kp_dTT731 = -4.395; //-0.0022188; // phi = 75°, omega = 0.05 rad/s;
      parameter Real Ti_dTT731 = 5.663; //0.0011111;

      parameter Real Kp_TT704 = 45.7901; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_TT704 = 0.48554;
      parameter Real Kp_TT714 = 48.4543; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_TT714 = 0.56124;
      parameter Real Kp_TT724 = 50.0852; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT724 = 0.5399;
      parameter Real Kp_TT734 = 77.0333; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT734 = 0.77589;

      parameter Real Kp_PtEX701 = 1.3737; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_PtEX701 = 0.38217;
      parameter Real Kp_PtEX711 = 1.8703; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_PtEX711 = 0.53366;
      parameter Real Kp_PtEX721 = 1.8751; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX721 = 0.52629;
      parameter Real Kp_PtEX731 = 3.9812; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX731 = 0.77417;


      parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
      parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, (30-50)/50; 1e6, (30-50)/50];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dmflowcool_EX701[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX711[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX721[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX731[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dEX701Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX711Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX721Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX731Pt[:, :] = [0, (28e3 - 50e3)/50e3; 5.5e3, (28e3 - 50e3)/50e3; 5.5e3, (40e3 - 50e3)/50e3; 1e4, (40e3 - 50e3)/50e3];
      parameter Real ddPT100[:, :] = [0, 0; 1e3, 0];
      parameter Real ddPTA2[:, :] = [0, 0; 1e3, 0];

      parameter Real dTT701[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT711[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT721[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT731[:, :] = [0, 0; 6e3, 0];

      parameter Real ddTT701[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT711[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT721[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT731[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];

      parameter Real dTT704[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT714[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT724[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT734[:, :] = [0, 0; 1e3, 0];
      parameter Real dFT701[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT711[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT721[:, :] = [0, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 1000, (0.8 - 1.3)/1.3];
      //parameter Real dTT731[:, :] = [0, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 1000, (55 - 65)/(65 + 273.15)];
      parameter Real dFT901[:, :] = [0, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 1000, (1.8 - 7.6222)/7.6222];
      parameter Real dFT101[:, :] = [0, (1.3 - 5.7166667)/5.7166667; 500, (1.3 - 5.7166667)/5.7166667];
      parameter Real dFT401[:, :] = [0, (0.75 - 3.2666667)/3.2666667; 500, (0.75 - 3.2666667)/3.2666667];

      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];

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
        Placement(visible = true, transformation(origin={240,0},     extent={{-51,-40},{51,40}},      rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = dtheta_FCV731) annotation (
        Placement(transformation(extent = {{-80, -60}, {-70, -50}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT704(
        Kp=Kp_dTT701,
        Ti=Ti_dTT701,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,75},{55,85}})));
      Modelica.Blocks.Sources.TimeTable dTT704SP(table=dTT704)   annotation (
        Placement(transformation(extent={{17,85},{27,95}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin={-240,0},    extent={{50,40},{-50,-40}},      rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT714(
        Kp=Kp_dTT711,
        Ti=Ti_dTT711,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,55},{55,65}})));
      Modelica.Blocks.Sources.TimeTable dTT714SP(table=dTT714)   annotation (
        Placement(transformation(extent={{17,65},{27,75}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT724(
        Kp=Kp_dTT721,
        Ti=Ti_dTT721,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,35},{55,45}})));
      Modelica.Blocks.Sources.TimeTable dTT724SP(table=dTT724)   annotation (
        Placement(transformation(extent={{20,37},{30,47}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT734(
        Kp=Kp_dTT731,
        Ti=Ti_dTT731,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,5},{
                55,15}})));
      Modelica.Blocks.Sources.TimeTable dTT734SP(table=dTT734)   annotation (
        Placement(transformation(extent={{20,7},{30,17}})));
      Modelica.Blocks.Sources.TimeTable dFT101SP(table = dFT101) annotation (
        Placement(transformation(extent={{20,145},{30,155}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
        Kp=0.00030402,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,128},{50,138}})));
      Modelica.Blocks.Sources.TimeTable dFT401SP(table = dFT401) annotation (
        Placement(transformation(extent={{20,130},{30,140}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-80,105},{-70,115}})));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-80,122},{-70,132}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPTA2(
        Kp=2.412,
        Ti=0.2679,
        Umax=0,
        Umin=-0.4,
        y_start=-0.4,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,-52},{50,-42}})));
      Modelica.Blocks.Sources.TimeTable ddPTA2SP(table=ddPTA2) annotation (Placement(transformation(extent={{20,-47},{30,-37}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-80,-137},{-70,-127}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPT100(
        Kp=0.00024658,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{39,-32},{49,-22}})));
      Modelica.Blocks.Sources.TimeTable ddPT100SP(table=ddPT100)
                                                               annotation (Placement(transformation(extent={{20,-30},{30,-20}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(
        Kp=0.00032462,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,143},{50,153}})));
      Modelica.Blocks.Continuous.LimIntegrator I_FTR01(
        k=1.2,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{52,258},{62,268}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(
        Kp=Kp_PtEX711,
        Ti=Ti_PtEX711,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,228},{64,238}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(
        Kp=Kp_PtEX701,
        Ti=Ti_PtEX701,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,243},{64,253}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(
        Kp=Kp_PtEX721,
        Ti=Ti_PtEX721,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,213},{64,223}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(
        Kp=Kp_PtEX731,
        Ti=Ti_PtEX731,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,198},{64,208}})));
      Modelica.Blocks.Math.Feedback fbFTR01 annotation (Placement(transformation(extent={{33,258},{43,268}})));
      Modelica.Blocks.Sources.TimeTable dFTR01SP(table=dFTR01)   annotation (
        Placement(transformation(extent={{19,258},{29,268}})));
      Modelica.Blocks.Sources.TimeTable dEX721PtSP(table=dEX721Pt) annotation (Placement(transformation(extent={{19,213},{29,223}})));
      Modelica.Blocks.Sources.TimeTable dEX701PtSP(table=dEX701Pt) annotation (Placement(transformation(extent={{19,243},{29,253}})));
      Modelica.Blocks.Sources.TimeTable dEX711PtSP(table=dEX711Pt) annotation (Placement(transformation(extent={{19,228},{29,238}})));
      Modelica.Blocks.Sources.TimeTable dEX731PtSP(table=dEX731Pt) annotation (Placement(transformation(extent={{19,198},{29,208}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{-80,-155},{-70,-145}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{-80,-175},{-70,-165}})));
      Modelica.Blocks.Continuous.LimIntegrator I_dPTA2(
        k=0.065,
        outMax=0,
        outMin=-0.4,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{58,-72},{68,-62}})));
      Modelica.Blocks.Math.Feedback fbdPTA2 annotation (Placement(transformation(extent={{38,-74},{52,-60}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX701Pt(
        k=1.3327,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,249},{90,259}})));
      Modelica.Blocks.Math.Feedback fbEX701Pt annotation (Placement(transformation(extent={{68,250},{76,258}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX711Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,231},{98,241}})));
      Modelica.Blocks.Math.Feedback fbEX711Pt annotation (Placement(transformation(extent={{76,230},{84,238}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX721Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,214},{98,224}})));
      Modelica.Blocks.Math.Feedback fbEX721Pt annotation (Placement(transformation(extent={{76,214},{84,222}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX731Pt(
        k=2.0703,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,198},{98,208}})));
      Modelica.Blocks.Math.Feedback fbEX731Pt annotation (Placement(transformation(extent={{76,199},{84,207}})));
      Modelica.Blocks.Sources.TimeTable dFT901SP(table=dFT901) annotation (Placement(transformation(extent={{20,161},{30,171}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT901(
        Kp=0.00021009,
        Ti=0.0002,
        Umax=0,
        Umin=-2,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{40,159},{50,169}})));
      Modelica.Blocks.Sources.RealExpression dEX701PtSP_var(y=(EX701PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{4,241},{14,251}})));
      Modelica.Blocks.Sources.RealExpression dEX711PtSP_var(y=(EX711PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,228},{13,238}})));
      Modelica.Blocks.Sources.RealExpression dEX721PtSP_var(y=(EX721PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,213},{13,223}})));
      Modelica.Blocks.Sources.RealExpression dEX731PtSP_var(y=(EX731PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,199},{13,209}})));
      Modelica.Blocks.Sources.RealExpression dFT901SP_var(y=(FT901SP - 7.6222)/7.6222) annotation (Placement(transformation(extent={{5,159},{15,169}})));
      Modelica.Blocks.Sources.TimeTable dTT701SP(table=ddTT701)
                                                               annotation (Placement(transformation(extent={{5,77},{15,87}})));
      Modelica.Blocks.Sources.TimeTable dTT711SP(table=ddTT711)
                                                               annotation (Placement(transformation(extent={{4,58},{14,68}})));
      Modelica.Blocks.Sources.TimeTable dTT721SP(table=ddTT721)
                                                               annotation (Placement(transformation(extent={{4,38},{14,48}})));
      Modelica.Blocks.Sources.TimeTable dTT731SP(table=ddTT731)
                                                               annotation (Placement(transformation(extent={{4,8},{14,18}})));
      Modelica.Blocks.Sources.RealExpression dFT101SP_var(y=(FT101SP - 5.7166667)/5.7166667)
        annotation (Placement(transformation(extent={{5,147},{15,157}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV701 annotation (Placement(transformation(extent={{60,-180},{80,-200}})));
      Modelica.Blocks.Sources.TimeTable dTT70X_min(table=[0,(55 - 65)/(65 + 273.15); 1e6,(55 - 65)/(65 + 273.15)])
        annotation (Placement(transformation(extent={{-60,-200},{-40,-180}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT701 annotation (Placement(transformation(extent={{-10,-180},{10,-200}})));
      Modelica.Blocks.Sources.Constant const(k=(0.2 - 1)/1)
        annotation (Placement(transformation(extent={{20,-160},{40,-140}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV731 annotation (Placement(transformation(extent={{60,-300},{80,-320}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT731 annotation (Placement(transformation(extent={{-10,-300},{10,-320}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV711 annotation (Placement(transformation(extent={{60,-220},{80,-240}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT711 annotation (Placement(transformation(extent={{-10,-220},{10,-240}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV721 annotation (Placement(transformation(extent={{60,-260},{80,-280}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT721 annotation (Placement(transformation(extent={{-10,-260},{10,-280}})));
      Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{20,-200},{40,-180}})));
      Modelica.Blocks.Logical.Not not2 annotation (Placement(transformation(extent={{20,-240},{40,-220}})));
      Modelica.Blocks.Logical.Not not3 annotation (Placement(transformation(extent={{20,-280},{40,-260}})));
      Modelica.Blocks.Logical.Not not4 annotation (Placement(transformation(extent={{20,-320},{40,-300}})));
      DistrictHeatingNetwork.Actuators.SplitRange splitRange annotation (Placement(transformation(extent={{58,159},{68,169}})));
    equation
      EX701PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 40e3 else 40e3;
      EX711PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 35e3 else 35e3;
      EX721PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 40e3 else 40e3;
      EX731PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 35e3 else 35e3;
      PtSP = EX701PtSP + EX711PtSP + EX721PtSP + EX731PtSP;
      FT901SP = 1.5*PtSP/(4185*15);
      FT101SP = FT901SP*0.8;

      connect(dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
        Line(points={{-69.5,5},{-64,5},{-64,0},{240,0}},        color = {0, 0, 127}),
        Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
      connect(PI_TT714.controlAction, controlSignalBus.dthetaFCV711) annotation (Line(points={{55.5,60},{76,60},{76,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT724.controlAction, controlSignalBus.dthetaFCV721) annotation (Line(points={{55.5,40},{72,40},{72,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT734.controlAction, controlSignalBus.dthetaFCV731) annotation (Line(points={{55.5,10},{55.5,8},{68,8},{68,0},{240,0}},
                                                                                                                                   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT401SP.y, PI_FT401.REF) annotation (Line(points={{30.5,135},{41,135}},               color={0,0,127}));
      connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,131},{41,131}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-69.5,110},{-69.5,108},{-4,108},{-4,0},{240,0}},  color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-69.5,127},{-69.5,124},{-60,124},{-60,140},{-88,140},{-88,0},{240,0}},
                                                                                                                          color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.ddTT701, PI_TT704.FeedBack) annotation (Line(
          points={{-240,0},{38,0},{38,78},{46,78}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT711, PI_TT714.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,58},{46,58}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT721, PI_TT724.FeedBack) annotation (Line(
          points={{-240,0},{40,0},{40,38},{46,38}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT731, PI_TT734.FeedBack) annotation (Line(
          points={{-240,0},{38,0},{38,8},{46,8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dPTA2, PI_dPTA2.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,-49},{41,-49}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(ddPTA2SP.y, PI_dPTA2.REF) annotation (Line(points={{30.5,-42},{35,-42},{35,-45},{41,-45}}, color={0,0,127}));
      connect(dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
        annotation (Line(points={{-69.5,-132},{8,-132},{8,0},{240,0}},     color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(ddPT100SP.y, PI_dPT100.REF) annotation (Line(points={{30.5,-25},{40,-25}},
                                                                                       color={0,0,127}));
      connect(processVariableBus.dPT102, PI_dPT100.FeedBack) annotation (Line(
          points={{-240,0},{34,0},{34,-29},{40,-29}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbFTR01.y, I_FTR01.u) annotation (Line(points={{42.5,263},{51,263}}, color={0,0,127}));
      connect(dFTR01SP.y, fbFTR01.u1) annotation (Line(points={{29.5,263},{34,263}},   color={0,0,127}));
      connect(processVariableBus.dFTR01, fbFTR01.u2)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,239},{38,239},{38,259}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,241},{50,241},{50,246},{55,246}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,231},{55,231}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (Line(
          points={{-240,0},{0,0},{0,211},{50,211},{50,216},{55,216}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-18,0},{-18,187},{50,187},{50,201},{55,201}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dToutRR01.y, controlSignalBus.dToutRR01) annotation (Line(points={{-69.5,-150},{8,-150},{8,-136},{12,-136},{12,0},{240,0}},
                                                                                                                          color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
        annotation (Line(points={{-69.5,-170},{108,-170},{108,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(fbdPTA2.y, I_dPTA2.u) annotation (Line(points={{51.3,-67},{57,-67}}, color={0,0,127}));
      connect(processVariableBus.dPTA2, fbdPTA2.u2) annotation (Line(
          points={{-240,0},{36,0},{36,-78},{45,-78},{45,-72.6}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbdPTA2.u1, PI_dPTA2.REF) annotation (Line(points={{39.4,-67},{37,-67},{37,-68},{35,-68},{35,-45},{41,-45}},
                                                                                                         color={0,0,127}));
      connect(fbEX701Pt.y, I_EX701Pt.u) annotation (Line(points={{75.6,254},{79,254}}, color={0,0,127}));
      connect(processVariableBus.dEX701Pt, fbEX701Pt.u2) annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,241},{72,241},{72,250.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX701Pt.u1, PI_dEX701Pt.REF) annotation (Line(points={{68.8,254},{42,254},{42,248},{49,248},{49,250},{55,250}}, color={0,0,127}));
      connect(fbEX711Pt.y, I_EX711Pt.u) annotation (Line(points={{83.6,234},{85,234},{85,236},{87,236}},
                                                                                       color={0,0,127}));
      connect(processVariableBus.dEX711Pt, fbEX711Pt.u2) annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{80,225},{80,230.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX721Pt.y, I_EX721Pt.u) annotation (Line(points={{83.6,218},{85,218},{85,219},{87,219}},
                                                                                       color={0,0,127}));
      connect(fbEX721Pt.u1, PI_dEX721Pt.REF) annotation (Line(points={{76.8,218},{72,218},{72,224},{49,224},{49,220},{55,220}}, color={0,0,127}));
      connect(processVariableBus.dEX721Pt, fbEX721Pt.u2) annotation (Line(
          points={{-240,0},{2,0},{2,214},{41,214},{41,214.8},{80,214.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX731Pt.y, I_EX731Pt.u) annotation (Line(points={{83.6,203},{87,203}}, color={0,0,127}));
      connect(fbEX731Pt.u1, PI_dEX731Pt.REF) annotation (Line(points={{76.8,203},{72,203},{72,209},{50,209},{50,205},{55,205}}, color={0,0,127}));
      connect(processVariableBus.dEX731Pt, fbEX731Pt.u2) annotation (Line(
          points={{-240,0},{-56,0},{-56,71},{-18,71},{-18,189},{50,189},{50,195},{80,195},{80,199.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(dthetaFCV101.y, controlSignalBus.dthetaFCV101)
        annotation (Line(points={{-69.5,50},{-69.5,48},{-36,48},{-36,24},{-20,24},{-20,0},{240,0}},
                                                                                           color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT101.controlAction, controlSignalBus.domegaP101)
        annotation (Line(points={{50.5,148},{108,148},{108,0},{240,0}},               color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCV401.y, controlSignalBus.dthetaFCV401)
        annotation (Line(points={{-69.5,20},{-48,20},{-48,0},{240,0}},                              color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dFT101, PI_FT101.FeedBack)
        annotation (Line(
          points={{-240,0},{32,0},{32,146},{41,146}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dFT901, PI_FT901.FeedBack)
        annotation (Line(
          points={{-240,0},{34,0},{34,162},{41,162}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dEX701PtSP_var.y, PI_dEX701Pt.REF) annotation (Line(points={{14.5,246},{17,246},{17,245},{45,245},{45,250},{55,250}}, color={0,0,127}));
      connect(domegaP401.y, controlSignalBus.domegaP401)
        annotation (Line(points={{-69.5,35},{-69.5,32},{-40,32},{-40,0},{240,0}},                   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX711PtSP_var.y, PI_dEX711Pt.REF) annotation (Line(points={{13.5,233},{15,233},{15,232},{16,232},{16,231},{43,231},{43,235},{55,235}}, color={0,0,127}));
      connect(fbEX711Pt.u1, PI_dEX711Pt.REF) annotation (Line(points={{76.8,234},{72,234},{72,240},{50,240},{50,235},{55,235}}, color={0,0,127}));
      connect(dEX721PtSP_var.y, PI_dEX721Pt.REF) annotation (Line(points={{13.5,218},{17,218},{17,224},{43,224},{43,220},{55,220}}, color={0,0,127}));
      connect(dEX731PtSP_var.y, PI_dEX731Pt.REF) annotation (Line(points={{13.5,204},{15,204},{15,203},{17,203},{17,200},{44,200},{44,205},{55,205}}, color={0,0,127}));
      connect(dFT901SP_var.y, PI_FT901.REF) annotation (Line(points={{15.5,164},{19,164},{19,176},{36,176},{36,166},{41,166}}, color={0,0,127}));
      connect(dTT731SP.y, PI_TT734.REF) annotation (Line(points={{14.5,13},{14.5,4},{42,4},
              {42,12},{46,12}},                                                                                      color={0,0,127}));
      connect(dTT721SP.y, PI_TT724.REF) annotation (Line(points={{14.5,43},{23,43},{23,44},{32,44},{32,42},{46,42}}, color={0,0,127}));
      connect(dTT711SP.y, PI_TT714.REF) annotation (Line(points={{14.5,63},{30.25,63},{30.25,62},{46,62}},           color={0,0,127}));
      connect(dTT701SP.y, PI_TT704.REF) annotation (Line(points={{15.5,82},{46,82}},                                 color={0,0,127}));
      connect(dFT101SP_var.y, PI_FT101.REF) annotation (Line(points={{15.5,152},{18,152},{18,157},{37,157},{37,150},{41,150}},
                                        color={0,0,127}));
      connect(dTT70X_min.y, greaterEqual_TT701.u1) annotation (Line(points={{-39,-190},{-12,-190}}, color={0,0,127}));
      connect(processVariableBus.dTT701, greaterEqual_TT701.u2) annotation (Line(
          points={{-240,0},{-86,0},{-86,-176},{-24,-176},{-24,-182},{-12,-182}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(switch_thetaTCV701.y, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{81,-190},{128,-190},{128,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV701.u1, PI_dEX701Pt.controlAction) annotation (Line(points={{58,-198},{114,-198},{114,245},{76,245},{76,248},{64.5,248}},                     color={0,0,127}));
      connect(processVariableBus.dTT731, greaterEqual_TT731.u2) annotation (Line(
          points={{-240,0},{-98,0},{-98,-288},{-28,-288},{-28,-302},{-12,-302}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(const.y, switch_thetaTCV701.u3) annotation (Line(points={{41,-150},{48,-150},{48,-182},{58,-182},{58,-182}}, color={0,0,127}));
      connect(processVariableBus.dTT711, greaterEqual_TT711.u2) annotation (Line(
          points={{-240,0},{-90,0},{-90,-210},{-28,-210},{-28,-222},{-12,-222}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dTT721, greaterEqual_TT721.u2) annotation (Line(
          points={{-240,0},{-94,0},{-94,-252},{-28,-252},{-28,-262},{-12,-262}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(switch_thetaTCV711.y, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{81,-230},{136,-230},{136,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV711.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-222},{48,-222},{48,-182},{58,-182}}, color={0,0,127}));
      connect(switch_thetaTCV721.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-262},{48,-262},{48,-182},{58,-182}}, color={0,0,127}));
      connect(switch_thetaTCV731.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-302},{48,-302},{48,-182},{58,-182}}, color={0,0,127}));
      connect(greaterEqual_TT711.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-230},{-20,-230},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(greaterEqual_TT721.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-270},{-20,-270},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(greaterEqual_TT731.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-310},{-20,-310},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(PI_dEX711Pt.controlAction, switch_thetaTCV711.u1) annotation (Line(points={{64.5,233},{66,233},{66,227},{116,227},{116,-238},{58,-238}},                     color={0,0,127}));
      connect(PI_dEX721Pt.controlAction, switch_thetaTCV721.u1) annotation (Line(points={{64.5,218},{70,218},{70,211},{118,211},{118,-278},{58,-278}},                     color={0,0,127}));
      connect(PI_dEX731Pt.controlAction, switch_thetaTCV731.u1) annotation (Line(points={{64.5,203},{70,203},{70,192},{120,192},{120,-318},{58,-318}},                     color={0,0,127}));
      connect(switch_thetaTCV721.y, controlSignalBus.dthetaTCV721)
        annotation (Line(points={{81,-270},{140,-270},{140,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV731.y, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{81,-310},{188,-310},{188,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(greaterEqual_TT701.y, not1.u) annotation (Line(points={{11,-190},{18,-190}}, color={255,0,255}));
      connect(not1.y, switch_thetaTCV701.u2) annotation (Line(points={{41,-190},{58,-190}}, color={255,0,255}));
      connect(greaterEqual_TT711.y, not2.u) annotation (Line(points={{11,-230},{18,-230}}, color={255,0,255}));
      connect(not2.y, switch_thetaTCV711.u2) annotation (Line(points={{41,-230},{58,-230}}, color={255,0,255}));
      connect(greaterEqual_TT721.y, not3.u) annotation (Line(points={{11,-270},{18,-270}}, color={255,0,255}));
      connect(not3.y, switch_thetaTCV721.u2) annotation (Line(points={{41,-270},{58,-270}}, color={255,0,255}));
      connect(greaterEqual_TT731.y, not4.u) annotation (Line(points={{11,-310},{18,-310}}, color={255,0,255}));
      connect(not4.y, switch_thetaTCV731.u2) annotation (Line(points={{41,-310},{58,-310}}, color={255,0,255}));
      connect(splitRange.U, PI_FT901.controlAction) annotation (Line(points={{59,164},{50.5,164}}, color={0,0,127}));
      connect(splitRange.Yout1, controlSignalBus.domegaP901) annotation (Line(points={{67,166},{198,166},{198,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(splitRange.Yout2, controlSignalBus.dthetaFCV901)
        annotation (Line(points={{67,162},{195,162},{195,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_TT704.controlAction, controlSignalBus.dthetaFCV701)
        annotation (Line(points={{55.5,80},{89,80},{89,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(
            extent={{-240,-360},{240,360}},
            preserveAspectRatio=false,
            grid={1,1})));
    end FullPlantController_B;

    model FullPlantController_C
      Real EX701PtSP(start = 40e3);
      Real EX711PtSP(start = 40e3);
      Real EX721PtSP(start = 40e3);
      Real EX731PtSP(start = 40e3);
      Real PtSP(nominal = 200e3);
      Real FT901SP(nominal = 10);
      Real FT101SP(nominal = 5);

      parameter Real Kp_TT701 = 1.295; //35.7682; //2.7148; // phi = 60°, omegac = 0.05 rad/s;
      parameter Real Ti_TT701 = 0.4175; //1.7239; //0.23764;
      parameter Real Kp_TT711 = 2.574; //1.6754; // 1.1403; // phi = 60°, omega = 0.05 rad/s;
      parameter Real Ti_TT711 = 0.9386; //1.0102; // 1.4897;
      parameter Real Kp_TT721 = 4.445; //2.6074; // 2.6074; 16.66; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT721 = 1.375; //1.5278; //1.4156;
      parameter Real Kp_TT731 = 5.541; //26.7534; //21.1084; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT731 = 1.79; //0.653; //1.7782;

      parameter Real Kp_dTT701 = -0.02916; //-3.1401; //-0.15335; // phi = 75°, omegac = 0.12 rad/s;
      parameter Real Ti_dTT701 = 0.2142; //2.3537; //0.12925;
      parameter Real Kp_dTT711 = -0.12; //-6.7268e-05; //-0.076137; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT711 = 0.9852; //0.01; //0.91554;
      parameter Real Kp_dTT721 = -0.194; //-6.9181e-05; //-0.10967; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_dTT721 = 1.352; //0.01; //1.2869;
      parameter Real Kp_dTT731 = -0.236; //-4.395; //-0.0022188; // phi = 75°, omega = 0.05 rad/s;
      parameter Real Ti_dTT731 = 1.712; //5.663; //0.0011111;

      parameter Real Kp_TT704 = 45.7901; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_TT704 = 0.48554;
      parameter Real Kp_TT714 = 48.4543; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_TT714 = 0.56124;
      parameter Real Kp_TT724 = 50.0852; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT724 = 0.5399;
      parameter Real Kp_TT734 = 77.0333; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_TT734 = 0.77589;

      parameter Real Kp_PtEX701 = 1.3737; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_PtEX701 = 0.38217;
      parameter Real Kp_PtEX711 = 1.8703; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_PtEX711 = 0.53366;
      parameter Real Kp_PtEX721 = 1.8751; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX721 = 0.52629;
      parameter Real Kp_PtEX731 = 3.9812; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX731 = 0.77417;

      parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
      parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, (30-50)/50; 1e6, (30-50)/50];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dmflowcool_EX701[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX711[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX721[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dmflowcool_EX731[:, :] = [0, -0.8; 1e6, -0.8];
      parameter Real dEX701Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX711Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX721Pt[:, :] = [0, (28e3 - 50e3)/50e3; 1e3, (28e3 - 50e3)/50e3];
      parameter Real dEX731Pt[:, :] = [0, (28e3 - 50e3)/50e3; 5.5e3, (28e3 - 50e3)/50e3; 5.5e3, (40e3 - 50e3)/50e3; 1e4, (40e3 - 50e3)/50e3];
      parameter Real ddPT100[:, :] = [0, 0; 1e3, 0];
      parameter Real ddPTA2[:, :] = [0, 0; 1e3, 0];

      parameter Real dTT701[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT711[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT721[:, :] = [0, 0; 6e3, 0];
      parameter Real dTT731[:, :] = [0, 0; 6e3, 0];

      parameter Real ddTT701[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT711[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT721[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];
      parameter Real ddTT731[:, :] = [0, (15-20)/20; 6e3, (15-20)/20];

      parameter Real dTT704[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT714[:, :] = [0, 0; 6e3, 0; 6e3, (25-30)/(30 + 273.15); 10e3, (25-30)/(30 + 273.15)];
      parameter Real dTT724[:, :] = [0, 0; 1e3, 0];
      parameter Real dTT734[:, :] = [0, 0; 1e3, 0];
      parameter Real dFT701[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT711[:, :] = [0, (1 - 1.3)/1.3; 500, (1 - 1.3)/1.3; 500, (1.2 - 1.3)/1.3; 1000, (1.2 - 1.3)/1.3];
      parameter Real dFT721[:, :] = [0, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 500, (0.8 - 1.3)/1.3; 1000, (0.8 - 1.3)/1.3];
      //parameter Real dTT731[:, :] = [0, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 500, (55 - 65)/(65 + 273.15); 1000, (55 - 65)/(65 + 273.15)];
      parameter Real dFT901[:, :] = [0, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 500, (1.8 - 7.6222)/7.6222; 1000, (1.8 - 7.6222)/7.6222];
      parameter Real dFT101[:, :] = [0, (1.3 - 5.7166667)/5.7166667; 500, (1.3 - 5.7166667)/5.7166667];
      parameter Real dFT401[:, :] = [0, (0.75 - 3.2666667)/3.2666667; 500, (0.75 - 3.2666667)/3.2666667];

      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];

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
        Placement(transformation(extent={{-230,-51},{-220,-41}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV711(table = dtheta_FCV711) annotation (
        Placement(transformation(extent={{-230,-66},{-220,-56}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV721(table = dtheta_FCV721) annotation (
        Placement(transformation(extent={{-230,-81},{-220,-71}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX701(table = dmflowcool_EX701) annotation (
        Placement(transformation(extent={{-230,-111},{-220,-101}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX711(table = dmflowcool_EX711) annotation (
        Placement(transformation(extent={{-230,-126},{-220,-116}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX721(table = dmflowcool_EX721) annotation (
        Placement(transformation(extent={{-230,-141},{-220,-131}})));
      Modelica.Blocks.Sources.TimeTable dmflowcoolEX731(table = dmflowcool_EX731) annotation (
        Placement(transformation(extent={{-230,-156},{-220,-146}})));
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
        Placement(visible = true, transformation(origin={240,0},     extent={{-51,-40},{51,40}},      rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dthetaFCV731(table = dtheta_FCV731) annotation (
        Placement(transformation(extent={{-230,-96},{-220,-86}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT704(
        Kp=Kp_dTT701,
        Ti=Ti_dTT701,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,75},{55,85}})));
      Modelica.Blocks.Sources.TimeTable dTT704SP(table=dTT704)   annotation (
        Placement(transformation(extent={{17,85},{27,95}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin={-240,0},    extent={{50,40},{-50,-40}},      rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT714(
        Kp=Kp_dTT711,
        Ti=Ti_dTT711,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,55},{55,65}})));
      Modelica.Blocks.Sources.TimeTable dTT714SP(table=dTT714)   annotation (
        Placement(transformation(extent={{17,65},{27,75}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT724(
        Kp=Kp_dTT721,
        Ti=Ti_dTT721,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,35},{55,45}})));
      Modelica.Blocks.Sources.TimeTable dTT724SP(table=dTT724)   annotation (
        Placement(transformation(extent={{20,37},{30,47}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT734(
        Kp=Kp_dTT731,
        Ti=Ti_dTT731,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{45,5},{
                55,15}})));
      Modelica.Blocks.Sources.TimeTable dTT734SP(table=dTT734)   annotation (
        Placement(transformation(extent={{20,7},{30,17}})));
      Modelica.Blocks.Sources.TimeTable dFT101SP(table = dFT101) annotation (
        Placement(transformation(extent={{20,145},{30,155}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
        Kp=0.00030402,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,128},{50,138}})));
      Modelica.Blocks.Sources.TimeTable dFT401SP(table = dFT401) annotation (
        Placement(transformation(extent={{20,130},{30,140}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-80,105},{-70,115}})));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-80,122},{-70,132}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPTA2(
        Kp=2.412,
        Ti=0.2679,
        Umax=0,
        Umin=-0.4,
        y_start=-0.4,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,-52},{50,-42}})));
      Modelica.Blocks.Sources.TimeTable ddPTA2SP(table=ddPTA2) annotation (Placement(transformation(extent={{20,-47},{30,-37}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-121,-25},{-111,-15}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dPT100(
        Kp=0.00024658,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialOutput)) annotation (Placement(transformation(extent={{39,-32},{49,-22}})));
      Modelica.Blocks.Sources.TimeTable ddPT100SP(table=ddPT100)
                                                               annotation (Placement(transformation(extent={{20,-30},{30,-20}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(
        Kp=0.00032462,
        Ti=0.0002,
        Umax=0,
        Umin=-0.4,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{40,143},{50,153}})));
      Modelica.Blocks.Continuous.LimIntegrator I_FTR01(
        k=1.2,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{52,258},{62,268}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX711Pt(
        Kp=Kp_PtEX711,
        Ti=Ti_PtEX711,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,228},{64,238}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX701Pt(
        Kp=Kp_PtEX701,
        Ti=Ti_PtEX701,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,243},{64,253}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX721Pt(
        Kp=Kp_PtEX721,
        Ti=Ti_PtEX721,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,213},{64,223}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_dEX731Pt(
        Kp=Kp_PtEX731,
        Ti=Ti_PtEX731,
        Umax=0,
        Umin=-1,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{54,198},{64,208}})));
      Modelica.Blocks.Math.Feedback fbFTR01 annotation (Placement(transformation(extent={{33,258},{43,268}})));
      Modelica.Blocks.Sources.TimeTable dFTR01SP(table=dFTR01)   annotation (
        Placement(transformation(extent={{19,258},{29,268}})));
      Modelica.Blocks.Sources.TimeTable dEX721PtSP(table=dEX721Pt) annotation (Placement(transformation(extent={{19,213},{29,223}})));
      Modelica.Blocks.Sources.TimeTable dEX701PtSP(table=dEX701Pt) annotation (Placement(transformation(extent={{19,243},{29,253}})));
      Modelica.Blocks.Sources.TimeTable dEX711PtSP(table=dEX711Pt) annotation (Placement(transformation(extent={{19,228},{29,238}})));
      Modelica.Blocks.Sources.TimeTable dEX731PtSP(table=dEX731Pt) annotation (Placement(transformation(extent={{19,198},{29,208}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{-121,-43},{-111,-33}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{-121,-63},{-111,-53}})));
      Modelica.Blocks.Continuous.LimIntegrator I_dPTA2(
        k=0.065,
        outMax=0,
        outMin=-0.4,
        initType=Modelica.Blocks.Types.Init.InitialState) annotation (Placement(transformation(extent={{58,-72},{68,-62}})));
      Modelica.Blocks.Math.Feedback fbdPTA2 annotation (Placement(transformation(extent={{38,-74},{52,-60}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX701Pt(
        k=1.3327,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{80,249},{90,259}})));
      Modelica.Blocks.Math.Feedback fbEX701Pt annotation (Placement(transformation(extent={{68,250},{76,258}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX711Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,229},{98,239}})));
      Modelica.Blocks.Math.Feedback fbEX711Pt annotation (Placement(transformation(extent={{76,230},{84,238}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX721Pt(
        k=1.3604,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,213},{98,223}})));
      Modelica.Blocks.Math.Feedback fbEX721Pt annotation (Placement(transformation(extent={{76,214},{84,222}})));
      Modelica.Blocks.Continuous.LimIntegrator I_EX731Pt(
        k=2.0703,
        outMax=0,
        outMin=-1,
        initType=Modelica.Blocks.Types.Init.InitialState,
        y_start=1) annotation (Placement(transformation(extent={{88,198},{98,208}})));
      Modelica.Blocks.Math.Feedback fbEX731Pt annotation (Placement(transformation(extent={{76,199},{84,207}})));
      Modelica.Blocks.Sources.TimeTable dFT901SP(table=dFT901) annotation (Placement(transformation(extent={{20,161},{30,171}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT901(
        Kp=0.00021009,
        Ti=0.0002,
        Umax=0,
        Umin=-2,
        y_start=1,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{40,159},{50,169}})));
      Modelica.Blocks.Sources.RealExpression dEX701PtSP_var(y=(EX701PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{4,241},{14,251}})));
      Modelica.Blocks.Sources.RealExpression dEX711PtSP_var(y=(EX711PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,228},{13,238}})));
      Modelica.Blocks.Sources.RealExpression dEX721PtSP_var(y=(EX721PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,213},{13,223}})));
      Modelica.Blocks.Sources.RealExpression dEX731PtSP_var(y=(EX731PtSP - 50e3)/50e3) annotation (Placement(transformation(extent={{3,199},{13,209}})));
      Modelica.Blocks.Sources.RealExpression dFT901SP_var(y=(FT901SP - 7.6222)/7.6222) annotation (Placement(transformation(extent={{5,159},{15,169}})));
      Modelica.Blocks.Sources.TimeTable dTT701SP(table=ddTT701)
                                                               annotation (Placement(transformation(extent={{5,77},{15,87}})));
      Modelica.Blocks.Sources.TimeTable dTT711SP(table=ddTT711)
                                                               annotation (Placement(transformation(extent={{4,58},{14,68}})));
      Modelica.Blocks.Sources.TimeTable dTT721SP(table=ddTT721)
                                                               annotation (Placement(transformation(extent={{4,38},{14,48}})));
      Modelica.Blocks.Sources.TimeTable dTT731SP(table=ddTT731)
                                                               annotation (Placement(transformation(extent={{4,8},{14,18}})));
      Modelica.Blocks.Sources.RealExpression dFT101SP_var(y=(FT101SP - 5.7166667)/5.7166667)
        annotation (Placement(transformation(extent={{5,147},{15,157}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV701 annotation (Placement(transformation(extent={{60,-180},{80,-200}})));
      Modelica.Blocks.Sources.TimeTable dTT70X_min(table=[0,(75 - 80)/(80 + 273.15); 1e6,(75 - 80)/(80 + 273.15)])
        annotation (Placement(transformation(extent={{-60,-210},{-40,-190}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT701 annotation (Placement(transformation(extent={{-10,-180},{10,-200}})));
      Modelica.Blocks.Sources.Constant const(k=(0.2 - 1)/1)
        annotation (Placement(transformation(extent={{20,-160},{40,-140}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV731 annotation (Placement(transformation(extent={{60,-300},{80,-320}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT731 annotation (Placement(transformation(extent={{-10,-300},{10,-320}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV711 annotation (Placement(transformation(extent={{60,-220},{80,-240}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT711 annotation (Placement(transformation(extent={{-10,-220},{10,-240}})));
      Modelica.Blocks.Logical.Switch switch_thetaTCV721 annotation (Placement(transformation(extent={{60,-260},{80,-280}})));
      Modelica.Blocks.Logical.GreaterEqual greaterEqual_TT721 annotation (Placement(transformation(extent={{-10,-260},{10,-280}})));
      Modelica.Blocks.Logical.Not not1 annotation (Placement(transformation(extent={{20,-200},{40,-180}})));
      Modelica.Blocks.Logical.Not not2 annotation (Placement(transformation(extent={{20,-240},{40,-220}})));
      Modelica.Blocks.Logical.Not not3 annotation (Placement(transformation(extent={{20,-280},{40,-260}})));
      Modelica.Blocks.Logical.Not not4 annotation (Placement(transformation(extent={{20,-320},{40,-300}})));
      DistrictHeatingNetwork.Actuators.SplitRange splitRange annotation (Placement(transformation(extent={{58,159},{68,169}})));
      Modelica.Blocks.Logical.Switch switch_thetaFCV701 annotation (Placement(transformation(extent={{73,-137},{93,-157}})));
      Modelica.Blocks.Sources.Constant consthot(k=0) annotation (Placement(transformation(extent={{22,-129},{42,-109}})));
      Modelica.Blocks.MathBoolean.And and1(nu=4) annotation (Placement(transformation(extent={{-126,-243},{-114,-231}})));
      Modelica.Blocks.MathBoolean.RisingEdge rising1 annotation (Placement(transformation(extent={{-103,-241},{-95,-233}})));
      Modelica.Blocks.MathBoolean.FallingEdge falling1 annotation (Placement(transformation(extent={{-98,-257},{-90,-249}})));
      Modelica.Blocks.Logical.Not not5 annotation (Placement(transformation(extent={{-101,-287},{-81,-267}})));
      Modelica.Blocks.MathBoolean.Or or1(nu=4) annotation (Placement(transformation(extent={{-130,-325},{-118,-313}})));
      Modelica.Blocks.MathBoolean.RisingEdge rising2 annotation (Placement(transformation(extent={{-106,-323},{-98,-315}})));
      Modelica.Blocks.MathBoolean.FallingEdge falling2 annotation (Placement(transformation(extent={{-106,-342},{-98,-334}})));
      Modelica.Blocks.Logical.Not not6 annotation (Placement(transformation(extent={{-105,-363},{-85,-343}})));
      Modelica.Blocks.Logical.Switch switch_thetaFCV1   annotation (Placement(transformation(extent={{75,-101},{95,-121}})));
      Modelica.Blocks.Logical.Switch switch_thetaFCV721 annotation (Placement(transformation(extent={{155,-122},{175,-142}})));
      Modelica.Blocks.Logical.Switch switch_thetaFCV711 annotation (Placement(transformation(extent={{154,-159},{174,-179}})));
    equation
      EX701PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 40e3 else 40e3;
      EX711PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 35e3 else 35e3;
      EX721PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 40e3 else 40e3;
      EX731PtSP = if time < 4e3 then 30e3 elseif time < 5e3 then 35e3 else 35e3;
      PtSP = EX701PtSP + EX711PtSP + EX721PtSP + EX731PtSP;
      //FT901SP = if not5.y then 1.2*PtSP/(4185*15) else 1.5*PtSP/(4185*15);
      FT901SP = 1.5*PtSP/(4185*15);
      FT101SP = FT901SP*0.8;

      connect(dthetaFCVC02.y, controlSignalBus.dthetaFCVC02) annotation (
        Line(points={{-69.5,5},{-64,5},{-64,0},{240,0}},        color = {0, 0, 127}),
        Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}, horizontalAlignment = TextAlignment.Left));
      connect(dFT401SP.y, PI_FT401.REF) annotation (Line(points={{30.5,135},{41,135}},               color={0,0,127}));
      connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,131},{41,131}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-69.5,110},{-69.5,108},{-4,108},{-4,0},{240,0}},  color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-69.5,127},{-69.5,124},{-60,124},{-60,140},{-88,140},{-88,0},{240,0}},
                                                                                                                          color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.ddTT701, PI_TT704.FeedBack) annotation (Line(
          points={{-240,0},{38,0},{38,78},{46,78}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT711, PI_TT714.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,58},{46,58}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT721, PI_TT724.FeedBack) annotation (Line(
          points={{-240,0},{40,0},{40,38},{46,38}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.ddTT731, PI_TT734.FeedBack) annotation (Line(
          points={{-240,0},{38,0},{38,8},{46,8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dPTA2, PI_dPTA2.FeedBack) annotation (Line(
          points={{-240,0},{36,0},{36,-49},{41,-49}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(ddPTA2SP.y, PI_dPTA2.REF) annotation (Line(points={{30.5,-42},{35,-42},{35,-45},{41,-45}}, color={0,0,127}));
      connect(dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
        annotation (Line(points={{-110.5,-20},{8,-20},{8,0},{240,0}},      color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(ddPT100SP.y, PI_dPT100.REF) annotation (Line(points={{30.5,-25},{40,-25}},
                                                                                       color={0,0,127}));
      connect(processVariableBus.dPT102, PI_dPT100.FeedBack) annotation (Line(
          points={{-240,0},{34,0},{34,-29},{40,-29}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbFTR01.y, I_FTR01.u) annotation (Line(points={{42.5,263},{51,263}}, color={0,0,127}));
      connect(dFTR01SP.y, fbFTR01.u1) annotation (Line(points={{29.5,263},{34,263}},   color={0,0,127}));
      connect(processVariableBus.dFTR01, fbFTR01.u2)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,239},{38,239},{38,259}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX701Pt, PI_dEX701Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,241},{50,241},{50,246},{55,246}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX711Pt, PI_dEX711Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,231},{55,231}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX721Pt, PI_dEX721Pt.FeedBack) annotation (Line(
          points={{-240,0},{0,0},{0,211},{50,211},{50,216},{55,216}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dEX731Pt, PI_dEX731Pt.FeedBack)
        annotation (Line(
          points={{-240,0},{-18,0},{-18,187},{50,187},{50,201},{55,201}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dToutRR01.y, controlSignalBus.dToutRR01) annotation (Line(points={{-110.5,-38},{13,-38},{13,0},{240,0}},    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
        annotation (Line(points={{-110.5,-58},{18,-58},{18,0},{240,0}},    color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(fbdPTA2.y, I_dPTA2.u) annotation (Line(points={{51.3,-67},{57,-67}}, color={0,0,127}));
      connect(processVariableBus.dPTA2, fbdPTA2.u2) annotation (Line(
          points={{-240,0},{36,0},{36,-78},{45,-78},{45,-72.6}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbdPTA2.u1, PI_dPTA2.REF) annotation (Line(points={{39.4,-67},{37,-67},{37,-68},{35,-68},{35,-45},{41,-45}},
                                                                                                         color={0,0,127}));
      connect(fbEX701Pt.y, I_EX701Pt.u) annotation (Line(points={{75.6,254},{79,254}}, color={0,0,127}));
      connect(processVariableBus.dEX701Pt, fbEX701Pt.u2) annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{44,225},{44,241},{72,241},{72,250.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX701Pt.u1, PI_dEX701Pt.REF) annotation (Line(points={{68.8,254},{42,254},{42,248},{49,248},{49,250},{55,250}}, color={0,0,127}));
      connect(fbEX711Pt.y, I_EX711Pt.u) annotation (Line(points={{83.6,234},{87,234}}, color={0,0,127}));
      connect(processVariableBus.dEX711Pt, fbEX711Pt.u2) annotation (Line(
          points={{-240,0},{-2,0},{-2,225},{80,225},{80,230.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX721Pt.y, I_EX721Pt.u) annotation (Line(points={{83.6,218},{87,218}}, color={0,0,127}));
      connect(fbEX721Pt.u1, PI_dEX721Pt.REF) annotation (Line(points={{76.8,218},{72,218},{72,224},{49,224},{49,220},{55,220}}, color={0,0,127}));
      connect(processVariableBus.dEX721Pt, fbEX721Pt.u2) annotation (Line(
          points={{-240,0},{2,0},{2,214},{41,214},{41,214.8},{80,214.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(fbEX731Pt.y, I_EX731Pt.u) annotation (Line(points={{83.6,203},{87,203}}, color={0,0,127}));
      connect(fbEX731Pt.u1, PI_dEX731Pt.REF) annotation (Line(points={{76.8,203},{72,203},{72,209},{50,209},{50,205},{55,205}}, color={0,0,127}));
      connect(processVariableBus.dEX731Pt, fbEX731Pt.u2) annotation (Line(
          points={{-240,0},{-56,0},{-56,71},{-18,71},{-18,189},{50,189},{50,195},{80,195},{80,199.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-3,-6},{-3,-6}},
          horizontalAlignment=TextAlignment.Right));
      connect(dthetaFCV101.y, controlSignalBus.dthetaFCV101)
        annotation (Line(points={{-69.5,50},{-69.5,48},{-36,48},{-36,24},{-20,24},{-20,0},{240,0}},
                                                                                           color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT101.controlAction, controlSignalBus.domegaP101)
        annotation (Line(points={{50.5,148},{108,148},{108,0},{240,0}},               color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dthetaFCV401.y, controlSignalBus.dthetaFCV401)
        annotation (Line(points={{-69.5,20},{-48,20},{-48,0},{240,0}},                              color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dFT101, PI_FT101.FeedBack)
        annotation (Line(
          points={{-240,0},{32,0},{32,146},{41,146}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dFT901, PI_FT901.FeedBack)
        annotation (Line(
          points={{-240,0},{34,0},{34,162},{41,162}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dEX701PtSP_var.y, PI_dEX701Pt.REF) annotation (Line(points={{14.5,246},{17,246},{17,245},{45,245},{45,250},{55,250}}, color={0,0,127}));
      connect(domegaP401.y, controlSignalBus.domegaP401)
        annotation (Line(points={{-69.5,35},{-69.5,32},{-40,32},{-40,0},{240,0}},                   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dEX711PtSP_var.y, PI_dEX711Pt.REF) annotation (Line(points={{13.5,233},{15,233},{15,232},{16,232},{16,231},{43,231},{43,235},{55,235}}, color={0,0,127}));
      connect(fbEX711Pt.u1, PI_dEX711Pt.REF) annotation (Line(points={{76.8,234},{72,234},{72,240},{50,240},{50,235},{55,235}}, color={0,0,127}));
      connect(dEX721PtSP_var.y, PI_dEX721Pt.REF) annotation (Line(points={{13.5,218},{17,218},{17,224},{43,224},{43,220},{55,220}}, color={0,0,127}));
      connect(dEX731PtSP_var.y, PI_dEX731Pt.REF) annotation (Line(points={{13.5,204},{15,204},{15,203},{17,203},{17,200},{44,200},{44,205},{55,205}}, color={0,0,127}));
      connect(dFT901SP_var.y, PI_FT901.REF) annotation (Line(points={{15.5,164},{19,164},{19,176},{36,176},{36,166},{41,166}}, color={0,0,127}));
      connect(dTT731SP.y, PI_TT734.REF) annotation (Line(points={{14.5,13},{14.5,4},{42,4},
              {42,12},{46,12}},                                                                                      color={0,0,127}));
      connect(dTT721SP.y, PI_TT724.REF) annotation (Line(points={{14.5,43},{23,43},{23,44},{32,44},{32,42},{46,42}}, color={0,0,127}));
      connect(dTT711SP.y, PI_TT714.REF) annotation (Line(points={{14.5,63},{30.25,63},{30.25,62},{46,62}},           color={0,0,127}));
      connect(dTT701SP.y, PI_TT704.REF) annotation (Line(points={{15.5,82},{46,82}},                                 color={0,0,127}));
      connect(dFT101SP_var.y, PI_FT101.REF) annotation (Line(points={{15.5,152},{18,152},{18,157},{37,157},{37,150},{41,150}},
                                        color={0,0,127}));
      connect(dTT70X_min.y, greaterEqual_TT701.u1) annotation (Line(points={{-39,-200},{-30,-200},{-30,-190},{-12,-190}},
                                                                                                    color={0,0,127}));
      connect(processVariableBus.dTT702, greaterEqual_TT701.u2) annotation (Line(
          points={{-240,0},{-164,0},{-164,-176},{-102,-176},{-102,-182},{-12,-182}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(switch_thetaTCV701.y, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{81,-190},{128,-190},{128,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV701.u1, PI_dEX701Pt.controlAction) annotation (Line(points={{58,-198},{114,-198},{114,245},{76,245},{76,248},{64.5,248}},                     color={0,0,127}));
      connect(processVariableBus.dTT732, greaterEqual_TT731.u2) annotation (Line(
          points={{-240,0},{-176,0},{-176,-288},{-106,-288},{-106,-302},{-12,-302}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(const.y, switch_thetaTCV701.u3) annotation (Line(points={{41,-150},{48,-150},{48,-182},{58,-182},{58,-182}}, color={0,0,127}));
      connect(processVariableBus.dTT712, greaterEqual_TT711.u2) annotation (Line(
          points={{-240,0},{-168,0},{-168,-210},{-106,-210},{-106,-222},{-12,-222}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(processVariableBus.dTT722, greaterEqual_TT721.u2) annotation (Line(
          points={{-240,0},{-172,0},{-172,-252},{-106,-252},{-106,-262},{-12,-262}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(switch_thetaTCV711.y, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{81,-230},{136,-230},{136,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV711.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-222},{48,-222},{48,-182},{58,-182}}, color={0,0,127}));
      connect(switch_thetaTCV721.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-262},{48,-262},{48,-182},{58,-182}}, color={0,0,127}));
      connect(switch_thetaTCV731.u3, switch_thetaTCV701.u3) annotation (Line(points={{58,-302},{48,-302},{48,-182},{58,-182}}, color={0,0,127}));
      connect(greaterEqual_TT711.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-230},{-20,-230},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(greaterEqual_TT721.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-270},{-20,-270},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(greaterEqual_TT731.u1, greaterEqual_TT701.u1) annotation (Line(points={{-12,-310},{-20,-310},{-20,-190},{-12,-190}}, color={0,0,127}));
      connect(PI_dEX711Pt.controlAction, switch_thetaTCV711.u1) annotation (Line(points={{64.5,233},{66,233},{66,227},{116,227},{116,-238},{58,-238}},                     color={0,0,127}));
      connect(PI_dEX721Pt.controlAction, switch_thetaTCV721.u1) annotation (Line(points={{64.5,218},{70,218},{70,211},{118,211},{118,-278},{58,-278}},                     color={0,0,127}));
      connect(PI_dEX731Pt.controlAction, switch_thetaTCV731.u1) annotation (Line(points={{64.5,203},{70,203},{70,193},{120,193},{120,-318},{58,-318}},                     color={0,0,127}));
      connect(switch_thetaTCV721.y, controlSignalBus.dthetaTCV721)
        annotation (Line(points={{81,-270},{145,-270},{145,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV731.y, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{81,-310},{188,-310},{188,0},{240,0}},   color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(greaterEqual_TT701.y, not1.u) annotation (Line(points={{11,-190},{18,-190}}, color={255,0,255}));
      connect(greaterEqual_TT711.y, not2.u) annotation (Line(points={{11,-230},{18,-230}}, color={255,0,255}));
      connect(greaterEqual_TT721.y, not3.u) annotation (Line(points={{11,-270},{18,-270}}, color={255,0,255}));
      connect(greaterEqual_TT731.y, not4.u) annotation (Line(points={{11,-310},{18,-310}}, color={255,0,255}));
      connect(splitRange.U, PI_FT901.controlAction) annotation (Line(points={{59,164},{50.5,164}}, color={0,0,127}));
      connect(splitRange.Yout1, controlSignalBus.domegaP901) annotation (Line(points={{67,166},{198,166},{198,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(splitRange.Yout2, controlSignalBus.dthetaFCV901)
        annotation (Line(points={{67,162},{195,162},{195,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(consthot.y, switch_thetaFCV701.u3) annotation (Line(points={{43,-119},{51,-119},{51,-120},{58,-120},{58,-139},{71,-139}}, color={0,0,127}));
      connect(switch_thetaFCV701.u1, PI_TT704.controlAction) annotation (Line(points={{71,-155},{63,-155},{63,-82},{84,-82},{84,80},{55.5,80}}, color={0,0,127}));
      connect(switch_thetaFCV701.y, controlSignalBus.dthetaFCV701)
        annotation (Line(points={{94,-147},{98,-147},{98,9},{240,9},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(greaterEqual_TT701.y, and1.u[1]) annotation (Line(points={{11,-190},{14,-190},{14,-212},{-135,-212},{-135,-238.575},{-126,-238.575}}, color={255,0,255}));
      connect(greaterEqual_TT711.y, and1.u[2]) annotation (Line(points={{11,-230},{14,-230},{14,-245},{-136,-245},{-136,-237.525},{-126,-237.525}}, color={255,0,255}));
      connect(greaterEqual_TT721.y, and1.u[3]) annotation (Line(points={{11,-270},{14,-270},{14,-292},{-135,-292},{-135,-232},{-126,-232},{-126,-236.475}}, color={255,0,255}));
      connect(greaterEqual_TT731.y, and1.u[4]) annotation (Line(points={{11,-310},{14,-310},{14,-295},{-132,-295},{-132,-235.425},{-126,-235.425}}, color={255,0,255}));
      connect(rising1.u, and1.y) annotation (Line(points={{-104.6,-237},{-113.1,-237}}, color={255,0,255}));
      connect(falling1.u, and1.y) annotation (Line(points={{-99.6,-253},{-105,-253},{-105,-237},{-113.1,-237}}, color={255,0,255}));
      connect(not5.u, and1.y) annotation (Line(points={{-103,-277},{-107,-277},{-107,-276},{-110,-276},{-110,-237},{-113.1,-237}}, color={255,0,255}));
      connect(greaterEqual_TT701.y, or1.u[1]) annotation (Line(points={{11,-190},{11,-216},{-151,-216},{-151,-320.575},{-130,-320.575}}, color={255,0,255}));
      connect(greaterEqual_TT711.y, or1.u[2]) annotation (Line(points={{11,-230},{12,-230},{12,-258},{-146,-258},{-146,-319.525},{-130,-319.525}}, color={255,0,255}));
      connect(greaterEqual_TT721.y, or1.u[3]) annotation (Line(points={{11,-270},{12,-270},{12,-297},{-141,-297},{-141,-318.475},{-130,-318.475}}, color={255,0,255}));
      connect(greaterEqual_TT731.y, or1.u[4]) annotation (Line(points={{11,-310},{12,-310},{12,-330},{-139,-330},{-139,-317.425},{-130,-317.425}}, color={255,0,255}));
      connect(or1.y, rising2.u) annotation (Line(points={{-117.1,-319},{-107.6,-319}}, color={255,0,255}));
      connect(falling2.u, rising2.u) annotation (Line(points={{-107.6,-338},{-114,-338},{-114,-319},{-107.6,-319}}, color={255,0,255}));
      connect(not6.u, rising2.u) annotation (Line(points={{-107,-353},{-111,-353},{-111,-351},{-113,-351},{-113,-338},{-114,-338},{-114,-319},{-107.6,-319}}, color={255,0,255}));
      connect(not5.y, switch_thetaFCV701.u2) annotation (Line(points={{-80,-277},{-31,-277},{-31,-161},{13,-161},{13,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaTCV701.u2, switch_thetaFCV701.u2) annotation (Line(points={{58,-190},{50,-190},{50,-150},{53,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaFCV1.u3, switch_thetaFCV701.u3) annotation (Line(points={{73,-103},{57,-103},{57,-120},{58,-120},{58,-139},{71,-139}}, color={0,0,127}));
      connect(switch_thetaFCV1.u2, switch_thetaFCV701.u2) annotation (Line(points={{73,-111},{65,-111},{65,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaFCV1.u1, PI_TT734.controlAction) annotation (Line(points={{73,-119},{66,-119},{66,-88},{71,-88},{71,-5},{61,-5},{61,10},{55.5,10}}, color={0,0,127}));
      connect(switch_thetaFCV1.y, controlSignalBus.dthetaFCV731)
        annotation (Line(points={{96,-111},{129,-111},{129,-110},{162,-110},{162,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV731.u2, switch_thetaFCV701.u2) annotation (Line(points={{58,-310},{44,-310},{44,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaFCV721.u3, switch_thetaFCV701.u3) annotation (Line(points={{153,-124},{106,-124},{106,-127},{58,-127},{58,-139},{71,-139}}, color={0,0,127}));
      connect(switch_thetaFCV721.u2, switch_thetaFCV701.u2) annotation (Line(points={{153,-132},{65,-132},{65,-147},{71,-147}}, color={255,0,255}));
      connect(PI_TT724.controlAction, switch_thetaFCV721.u1) annotation (Line(points={{55.5,40},{133,40},{133,-140},{153,-140}}, color={0,0,127}));
      connect(switch_thetaFCV721.y, controlSignalBus.dthetaFCV721)
        annotation (Line(points={{176,-132},{180,-132},{180,-133},{182,-133},{182,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_thetaTCV721.u2, switch_thetaFCV701.u2) annotation (Line(points={{58,-270},{44,-270},{44,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaTCV711.u2, switch_thetaFCV701.u2) annotation (Line(points={{58,-230},{51,-230},{51,-227},{44,-227},{44,-147},{71,-147}}, color={255,0,255}));
      connect(switch_thetaFCV711.u3, switch_thetaFCV701.u3) annotation (Line(points={{152,-161},{144,-161},{144,-124},{106,-124},{106,-127},{58,-127},{58,-139},{71,-139}}, color={0,0,127}));
      connect(switch_thetaFCV711.u2, switch_thetaFCV701.u2) annotation (Line(points={{152,-169},{142,-169},{142,-171},{130,-171},{130,-132},{65,-132},{65,-147},{71,-147}}, color={255,0,255}));
      connect(PI_TT714.controlAction, switch_thetaFCV711.u1) annotation (Line(points={{55.5,60},{97,60},{97,61},{138,61},{138,-177},{152,-177}}, color={0,0,127}));
      connect(switch_thetaFCV711.y, controlSignalBus.dthetaFCV711)
        annotation (Line(points={{175,-169},{192,-169},{192,0},{240,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(
            extent={{-240,-360},{240,360}},
            preserveAspectRatio=false,
            grid={1,1})));
    end FullPlantController_C;

    model OpenLoopActuator

      constant Real pi = Modelica.Constants.pi;
      parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
      parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";

      // Rack CD
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];

      // S900
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];

      // S100
      parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];

      // S400
      parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];

      // S500
      parameter Real dTout_CHP501[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P501[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];

      // S700
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];

      // Cooling System RR
      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];


      // S900
      DistrictHeatingNetwork.Types.PerUnit theta_FCV901SP;
      Real dtheta_FCV901_var(min = -1, max = 0);
      Boolean booldthetaFCV901;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
      Real domega_P901_var(min = -1, max = 0);
      Boolean booldomegaP901;

      // S100
      DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
      Real dtheta_FCV101_var(min = -1, max = 0);
      Boolean booldthetaFCV101;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
      Real domega_P101_var(min = -1, max = 0);
      Boolean booldomegaP101;
      DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
      Real dTout_GB101_var(min = -1, max = 0);
      Boolean booldToutGB101;

      // S400
      DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
      Real dtheta_FCV401_var(min = -1, max = 0);
      Boolean booldthetaFCV401;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
      Real domega_P401_var(min = -1, max = 0);
      Boolean booldomegaP401;
      DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
      Real dTout_EB401_var(min = -1, max = 0);
      Boolean booldToutEB401;

      // S500
      DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
      Real domega_P501_var(min = -1, max = 0);
      Boolean booldomegaP501;
      DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
      Real dTout_CHP501_var(min = -1, max = 0);
      Boolean booldToutCHP501;

      // S700
      DistrictHeatingNetwork.Types.PerUnit theta_FCV701SP;
      Real dtheta_FCV701_var(min = -1, max = 0);
      Boolean booldthetaFCV701;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
      Real dtheta_FCV711_var(min = -1, max = 0);
      Boolean booldthetaFCV711;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
      Real dtheta_FCV721_var(min = -1, max = 0);
      Boolean booldthetaFCV721;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
      Real dtheta_FCV731_var(min = -1, max = 0);
      Boolean booldthetaFCV731;

      // Rack
      DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
      Real dtheta_FCVC01_var(min = -1, max = 0);
      Boolean booldthetaFCVC01;
      DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
      Real dtheta_FCVC02_var(min = -1, max = 0);
      Boolean booldthetaFCVC02;

      // Cooling
      DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
      Real dtheta_TCV701_var(min = -1, max = 0);
      Boolean booldthetaTCV701;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
      Real dtheta_TCV711_var(min = -1, max = 0);
      Boolean booldthetaTCV711;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
      Real dtheta_TCV721_var(min = -1, max = 0);
      Boolean booldthetaTCV721;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
      Real dtheta_TCV731_var(min = -1, max = 0);
      Boolean booldthetaTCV731;
      DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
      Real dtheta_FCVR01_var(min = -1, max = 0);
      Boolean booldthetaFCVR01;
      DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
      Real dTout_RR01_var(min = -1, max = 0);
      Boolean booldToutRR01;

      Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
        Placement(transformation(extent={{-141,135},{-131,145}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
        Placement(transformation(extent={{-141,102},{-131,112}})));
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
        Placement(visible = true, transformation(origin={160,0},     extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-141,-41},{-131,-31}})));
      Modelica.Blocks.Sources.RealExpression domegaP901_var(y=domega_P901_var)           annotation (Placement(transformation(extent={{-141,155},{-131,165}})));
      Modelica.Blocks.Logical.Switch switch_domegaP901 annotation (Placement(transformation(extent={{-122,145},{-112,155}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP901(y=booldomegaP901)
                                                                        annotation (Placement(transformation(extent={{-141,145},{-131,155}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV901(y=booldthetaFCV901)
                                                                          annotation (Placement(transformation(extent={{-141,112},{-131,122}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV901_var(y=dtheta_FCV901_var) annotation (Placement(transformation(extent={{-141,121},{-131,131}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV901 annotation (Placement(transformation(extent={{-123,112},{-113,122}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,140},{-85,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,107},{-85,127}})));
      Modelica.Blocks.Sources.TimeTable domegaP101(table=domega_P101) annotation (Placement(transformation(extent={{-141,25},{-131,35}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV101(table=dtheta_FCV101) annotation (Placement(transformation(extent={{-141,-8},{-131,2}})));
      Modelica.Blocks.Sources.RealExpression domegaP101_var(y=domega_P101_var) annotation (Placement(transformation(extent={{-141,45},{-131,55}})));
      Modelica.Blocks.Logical.Switch switch_domegaP101 annotation (Placement(transformation(extent={{-122,35},{-112,45}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP101(y=booldomegaP101) annotation (Placement(transformation(extent={{-141,35},{-131,45}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV101(y=booldthetaFCV101) annotation (Placement(transformation(extent={{-141,2},{-131,12}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV101_var(y=dtheta_FCV101_var) annotation (Placement(transformation(extent={{-141,11},{-131,21}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV101 annotation (Placement(transformation(extent={{-123,2},{-113,12}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,30},{-85,50}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-3},{-85,17}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutGB101(y=booldToutGB101)   annotation (Placement(transformation(extent={{-141,-31},{-131,-21}})));
      Modelica.Blocks.Sources.RealExpression dToutGB101_var(y=dTout_GB101_var) annotation (Placement(transformation(extent={{-141,-22},{-131,-12}})));
      Modelica.Blocks.Logical.Switch switch_dToutGB101 annotation (Placement(transformation(extent={{-123,-31},{-113,-21}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_GB101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-36},{-85,-16}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-141,-181},{-131,-171}})));
      Modelica.Blocks.Sources.TimeTable domegaP401(table=domega_P401) annotation (Placement(transformation(extent={{-141,-115},{-131,-105}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV401(table=dtheta_FCV401) annotation (Placement(transformation(extent={{-141,-148},{-131,-138}})));
      Modelica.Blocks.Sources.RealExpression domegaP401_var(y=domega_P401_var) annotation (Placement(transformation(extent={{-141,-95},{-131,-85}})));
      Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (Placement(transformation(extent={{-122,-105},{-112,-95}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y=booldomegaP401) annotation (Placement(transformation(extent={{-141,-105},{-131,-95}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y=booldthetaFCV401) annotation (Placement(transformation(extent={{-141,-138},{-131,-128}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y=dtheta_FCV401_var) annotation (Placement(transformation(extent={{-141,-129},{-131,-119}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (Placement(transformation(extent={{-123,-138},{-113,-128}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-110},{-85,-90}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-143},{-85,-123}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y=booldToutEB401) annotation (Placement(transformation(extent={{-141,-171},{-131,-161}})));
      Modelica.Blocks.Sources.RealExpression dToutEB401_var(y=dTout_EB401_var) annotation (Placement(transformation(extent={{-141,-162},{-131,-152}})));
      Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (Placement(transformation(extent={{-123,-171},{-113,-161}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_EB401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-176},{-85,-156}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV701(table=dtheta_FCV701) annotation (Placement(transformation(extent={{-50,140},{-40,150}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV701(y=booldthetaFCV701) annotation (Placement(transformation(extent={{-50,150},{-40,160}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV701_var(y=dtheta_FCV701_var) annotation (Placement(transformation(extent={{-50,159},{-40,169}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV701 annotation (Placement(transformation(extent={{-32,150},{-22,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,145},{6,165}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV711(table=dtheta_FCV711) annotation (Placement(transformation(extent={{-50,106},{-40,116}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV711(y=booldthetaFCV711) annotation (Placement(transformation(extent={{-50,116},{-40,126}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV711_var(y=dtheta_FCV711_var) annotation (Placement(transformation(extent={{-50,125},{-40,135}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV711 annotation (Placement(transformation(extent={{-32,116},{-22,126}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,111},{6,131}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV721(table=dtheta_FCV721) annotation (Placement(transformation(extent={{-50,73},{-40,83}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV721(y=booldthetaFCV721) annotation (Placement(transformation(extent={{-50,83},{-40,93}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV721_var(y=dtheta_FCV721_var) annotation (Placement(transformation(extent={{-50,92},{-40,102}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV721 annotation (Placement(transformation(extent={{-32,83},{-22,93}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,78},{6,98}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV731(table=dtheta_FCV731) annotation (Placement(transformation(extent={{-50,41},{-40,51}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV731(y=booldthetaFCV731) annotation (Placement(transformation(extent={{-50,51},{-40,61}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV731_var(y=dtheta_FCV731_var) annotation (Placement(transformation(extent={{-50,60},{-40,70}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV731 annotation (Placement(transformation(extent={{-32,51},{-22,61}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,46},{6,66}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-50,-31},{-40,-21}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y=booldthetaFCVC01) annotation (Placement(transformation(extent={{-50,-21},{-40,-11}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y=dtheta_FCVC01_var) annotation (Placement(transformation(extent={{-50,-12},{-40,-2}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (Placement(transformation(extent={{-32,-21},{-22,-11}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-26},{6,-6}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table=dtheta_FCVC02) annotation (Placement(transformation(extent={{-50,-65},{-40,-55}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y=booldthetaFCVC02) annotation (Placement(transformation(extent={{-50,-55},{-40,-45}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y=dtheta_FCVC02_var) annotation (Placement(transformation(extent={{-50,-46},{-40,-36}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (Placement(transformation(extent={{-32,-55},{-22,-45}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC02_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-60},{6,-40}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV701(table=dtheta_TCV701) annotation (Placement(transformation(extent={{39,140},{49,150}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV701(y=booldthetaTCV701) annotation (Placement(transformation(extent={{39,150},{49,160}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV701_var(y=dtheta_TCV701_var) annotation (Placement(transformation(extent={{39,159},{49,169}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV701 annotation (Placement(transformation(extent={{57,150},{67,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,145},{95,165}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV711(table=dtheta_TCV711) annotation (Placement(transformation(extent={{39,106},{49,116}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV711(y=booldthetaTCV711) annotation (Placement(transformation(extent={{39,116},{49,126}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV711_var(y=dtheta_TCV711_var) annotation (Placement(transformation(extent={{39,125},{49,135}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV711 annotation (Placement(transformation(extent={{57,116},{67,126}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,111},{95,131}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV721(table=dtheta_TCV721) annotation (Placement(transformation(extent={{39,73},{49,83}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV721(y=booldthetaTCV721) annotation (Placement(transformation(extent={{39,83},{49,93}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV721_var(y=dtheta_TCV721_var) annotation (Placement(transformation(extent={{39,92},{49,102}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV721 annotation (Placement(transformation(extent={{57,83},{67,93}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,78},{95,98}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV731(table=dtheta_TCV731) annotation (Placement(transformation(extent={{39,41},{49,51}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV731(y=booldthetaTCV731) annotation (Placement(transformation(extent={{39,51},{49,61}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV731_var(y=dtheta_TCV731_var) annotation (Placement(transformation(extent={{39,60},{49,70}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV731 annotation (Placement(transformation(extent={{57,51},{67,61}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,46},{95,66}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{39,8},{49,18}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVR01(y=booldthetaFCVR01) annotation (Placement(transformation(extent={{39,18},{49,28}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVR01_var(y=dtheta_FCVR01_var) annotation (Placement(transformation(extent={{39,27},{49,37}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVR01 annotation (Placement(transformation(extent={{57,18},{67,28}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act1(use_numberPort=true, significantDigits=2)                                                                                                         annotation (Placement(transformation(extent={{75,13},{95,33}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{39,-25},{49,-15}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutRR01(y=booldToutRR01) annotation (Placement(transformation(extent={{39,-15},{49,-5}})));
      Modelica.Blocks.Sources.RealExpression dToutRR01_var(y=dTout_RR01_var) annotation (Placement(transformation(extent={{39,-6},{49,4}})));
      Modelica.Blocks.Logical.Switch switch_dToutRR01 annotation (Placement(transformation(extent={{57,-15},{67,-5}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_RR01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,-20},{95,0}})));
      Modelica.Blocks.Sources.TimeTable dToutCHP501(table=dTout_CHP501) annotation (Placement(transformation(extent={{-51,-165},{-41,-155}})));
      Modelica.Blocks.Sources.TimeTable domegaP501(table=domega_P501) annotation (Placement(transformation(extent={{-51,-130},{-41,-120}})));
      Modelica.Blocks.Sources.RealExpression domegaP501_var(y=domega_P501_var) annotation (Placement(transformation(extent={{-51,-110},{-41,-100}})));
      Modelica.Blocks.Logical.Switch switch_domegaP501 annotation (Placement(transformation(extent={{-32,-120},{-22,-110}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP501(y=booldomegaP501) annotation (Placement(transformation(extent={{-51,-120},{-41,-110}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P501_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-15,-125},{5,-105}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutCHP501(y=booldToutCHP501) annotation (Placement(transformation(extent={{-51,-155},{-41,-145}})));
      Modelica.Blocks.Sources.RealExpression dToutCHP501_var(y=dTout_CHP501_var)
                                                                               annotation (Placement(transformation(extent={{-51,-146},{-41,-136}})));
      Modelica.Blocks.Logical.Switch switch_dToutCHP501 annotation (Placement(transformation(extent={{-33,-155},{-23,-145}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_CHP501_act(use_numberPort=true, significantDigits=2)
                                                                                                           annotation (Placement(transformation(extent={{-15,-160},{5,-140}})));
    equation
      // S900
      dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
      theta_FCV901SP = 1;
      booldthetaFCV901 = true;
      domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;
      omega_P901SP = 2*pi*35;
      booldomegaP901 = true;

      // S100
      dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
      theta_FCV101SP = 1;
      booldthetaFCV101 = true;
      domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
      omega_P101SP = 2*pi*50;
      booldomegaP101 = true;
      dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_GB101SP = 80 + 273.15;
      booldToutGB101 = true;

      // S400
      dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
      theta_FCV401SP = 1;
      booldthetaFCV401 = true;
      domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
      omega_P401SP = 2*pi*50;
      booldomegaP401 = true;
      dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_EB401SP = 80 + 273.15;
      booldToutEB401 = true;

      // S500
      domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
      omega_P501SP = 2*pi*45;
      booldomegaP501 = true;
      dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_CHP501SP = 80 + 273.15;
      booldToutCHP501 = true;

      // S700
      dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
      theta_FCV701SP = 1;
      booldthetaFCV701 = true;
      dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
      theta_FCV711SP = 1;
      booldthetaFCV711 = true;
      dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
      theta_FCV721SP = 1;
      booldthetaFCV721 = true;
      dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;
      theta_FCV731SP = 1;
      booldthetaFCV731 = true;

      // Rack
      dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
      theta_FCVC01SP = 1;
      booldthetaFCVC01 = true;
      dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;
      theta_FCVC02SP = 1;
      booldthetaFCVC02 = true;

      // RR00
      dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
      theta_TCV701SP = 1;
      booldthetaTCV701 = true;
      dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
      theta_TCV711SP = 1;
      booldthetaTCV711 = true;
      dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
      theta_TCV721SP = 1;
      booldthetaTCV721 = true;
      dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
      theta_TCV731SP = 1;
      booldthetaTCV731 = true;
      dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
      theta_FCVR01SP = 1;
      booldthetaFCVR01 = true;
      dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_RR01SP = 40 + 273.15;
      booldToutRR01 = true;

      connect(domegaP901_var.y, switch_domegaP901.u1) annotation (Line(points={{-130.5,160},{-127,160},{-127,154},{-123,154}}, color={0,0,127}));
      connect(bool_domegaP901.y, switch_domegaP901.u2) annotation (Line(points={{-130.5,150},{-123,150}}, color={255,0,255}));
      connect(domegaP901.y, switch_domegaP901.u3) annotation (Line(points={{-130.5,140},{-127,140},{-127,146},{-123,146}}, color={0,0,127}));
      connect(bool_dthetaFCV901.y, switch_dthetaFCV901.u2) annotation (Line(points={{-130.5,117},{-124,117}}, color={255,0,255}));
      connect(dthetaFCV901_var.y, switch_dthetaFCV901.u1) annotation (Line(points={{-130.5,126},{-127,126},{-127,121},{-124,121}}, color={0,0,127}));
      connect(dthetaFCV901.y, switch_dthetaFCV901.u3) annotation (Line(points={{-130.5,107},{-127,107},{-127,113},{-124,113}},
                                                                                                                             color={0,0,127}));
      connect(switch_domegaP901.y, domega_P901_act.numberPort) annotation (Line(points={{-111.5,150},{-106.5,150}}, color={0,0,127}));
      connect(dtheta_FCV901_act.numberPort, switch_dthetaFCV901.y) annotation (Line(points={{-106.5,117},{-112.5,117}}, color={0,0,127}));
      connect(domegaP101_var.y, switch_domegaP101.u1) annotation (Line(points={{-130.5,50},{-127,50},{-127,44},{-123,44}}, color={0,0,127}));
      connect(bool_domegaP101.y, switch_domegaP101.u2) annotation (Line(points={{-130.5,40},{-123,40}}, color={255,0,255}));
      connect(domegaP101.y, switch_domegaP101.u3) annotation (Line(points={{-130.5,30},{-127,30},{-127,36},{-123,36}}, color={0,0,127}));
      connect(bool_dthetaFCV101.y, switch_dthetaFCV101.u2) annotation (Line(points={{-130.5,7},{-124,7}},   color={255,0,255}));
      connect(dthetaFCV101_var.y, switch_dthetaFCV101.u1) annotation (Line(points={{-130.5,16},{-127,16},{-127,11},{-124,11}},
                                                                                                                           color={0,0,127}));
      connect(dthetaFCV101.y, switch_dthetaFCV101.u3) annotation (Line(points={{-130.5,-3},{-127,-3},{-127,3},{-124,3}},     color={0,0,127}));
      connect(switch_domegaP101.y, domega_P101_act.numberPort) annotation (Line(points={{-111.5,40},{-106.5,40}}, color={0,0,127}));
      connect(dtheta_FCV101_act.numberPort, switch_dthetaFCV101.y) annotation (Line(points={{-106.5,7},{-112.5,7}},   color={0,0,127}));
      connect(bool_dToutGB101.y,switch_dToutGB101. u2) annotation (Line(points={{-130.5,-26},{-124,-26}}, color={255,0,255}));
      connect(dToutGB101_var.y, switch_dToutGB101.u1) annotation (Line(points={{-130.5,-17},{-127,-17},{-127,-22},{-124,-22}}, color={0,0,127}));
      connect(dTout_GB101_act.numberPort, switch_dToutGB101.y) annotation (Line(points={{-106.5,-26},{-112.5,-26}}, color={0,0,127}));
      connect(dToutGB101.y, switch_dToutGB101.u3) annotation (Line(points={{-130.5,-36},{-127,-36},{-127,-30},{-124,-30}}, color={0,0,127}));
      connect(domegaP401_var.y, switch_domegaP401.u1) annotation (Line(points={{-130.5,-90},{-127,-90},{-127,-96},{-123,-96}},     color={0,0,127}));
      connect(bool_domegaP401.y, switch_domegaP401.u2) annotation (Line(points={{-130.5,-100},{-123,-100}}, color={255,0,255}));
      connect(domegaP401.y, switch_domegaP401.u3) annotation (Line(points={{-130.5,-110},{-127,-110},{-127,-104},{-123,-104}}, color={0,0,127}));
      connect(bool_dthetaFCV401.y, switch_dthetaFCV401.u2) annotation (Line(points={{-130.5,-133},{-124,-133}}, color={255,0,255}));
      connect(dthetaFCV401_var.y, switch_dthetaFCV401.u1) annotation (Line(points={{-130.5,-124},{-127,-124},{-127,-129},{-124,-129}}, color={0,0,127}));
      connect(dthetaFCV401.y, switch_dthetaFCV401.u3) annotation (Line(points={{-130.5,-143},{-127,-143},{-127,-137},{-124,-137}}, color={0,0,127}));
      connect(switch_domegaP401.y, domega_P401_act.numberPort) annotation (Line(points={{-111.5,-100},{-106.5,-100}}, color={0,0,127}));
      connect(dtheta_FCV401_act.numberPort, switch_dthetaFCV401.y) annotation (Line(points={{-106.5,-133},{-112.5,-133}}, color={0,0,127}));
      connect(bool_dToutEB401.y, switch_dToutEB401.u2) annotation (Line(points={{-130.5,-166},{-124,-166}}, color={255,0,255}));
      connect(dToutEB401_var.y, switch_dToutEB401.u1) annotation (Line(points={{-130.5,-157},{-127,-157},{-127,-162},{-124,-162}}, color={0,0,127}));
      connect(dTout_EB401_act.numberPort, switch_dToutEB401.y) annotation (Line(points={{-106.5,-166},{-112.5,-166}}, color={0,0,127}));
      connect(dToutEB401.y, switch_dToutEB401.u3) annotation (Line(points={{-130.5,-176},{-127,-176},{-127,-170},{-124,-170}}, color={0,0,127}));
      connect(bool_dthetaFCV701.y, switch_dthetaFCV701.u2) annotation (Line(points={{-39.5,155},{-33,155}}, color={255,0,255}));
      connect(dthetaFCV701_var.y, switch_dthetaFCV701.u1) annotation (Line(points={{-39.5,164},{-36,164},{-36,159},{-33,159}}, color={0,0,127}));
      connect(dthetaFCV701.y, switch_dthetaFCV701.u3) annotation (Line(points={{-39.5,145},{-36,145},{-36,151},{-33,151}}, color={0,0,127}));
      connect(dtheta_FCV701_act.numberPort, switch_dthetaFCV701.y) annotation (Line(points={{-15.5,155},{-21.5,155}}, color={0,0,127}));
      connect(bool_dthetaFCV711.y, switch_dthetaFCV711.u2) annotation (Line(points={{-39.5,121},{-33,121}}, color={255,0,255}));
      connect(dthetaFCV711_var.y, switch_dthetaFCV711.u1) annotation (Line(points={{-39.5,130},{-36,130},{-36,125},{-33,125}}, color={0,0,127}));
      connect(dthetaFCV711.y, switch_dthetaFCV711.u3) annotation (Line(points={{-39.5,111},{-36,111},{-36,117},{-33,117}}, color={0,0,127}));
      connect(dtheta_FCV711_act.numberPort, switch_dthetaFCV711.y) annotation (Line(points={{-15.5,121},{-21.5,121}}, color={0,0,127}));
      connect(bool_dthetaFCV721.y, switch_dthetaFCV721.u2) annotation (Line(points={{-39.5,88},{-33,88}}, color={255,0,255}));
      connect(dthetaFCV721_var.y, switch_dthetaFCV721.u1) annotation (Line(points={{-39.5,97},{-36,97},{-36,92},{-33,92}}, color={0,0,127}));
      connect(dthetaFCV721.y, switch_dthetaFCV721.u3) annotation (Line(points={{-39.5,78},{-36,78},{-36,84},{-33,84}}, color={0,0,127}));
      connect(dtheta_FCV721_act.numberPort, switch_dthetaFCV721.y) annotation (Line(points={{-15.5,88},{-21.5,88}}, color={0,0,127}));
      connect(bool_dthetaFCV731.y, switch_dthetaFCV731.u2) annotation (Line(points={{-39.5,56},{-33,56}}, color={255,0,255}));
      connect(dthetaFCV731_var.y, switch_dthetaFCV731.u1) annotation (Line(points={{-39.5,65},{-36,65},{-36,60},{-33,60}}, color={0,0,127}));
      connect(dthetaFCV731.y, switch_dthetaFCV731.u3) annotation (Line(points={{-39.5,46},{-36,46},{-36,52},{-33,52}}, color={0,0,127}));
      connect(dtheta_FCV731_act.numberPort, switch_dthetaFCV731.y) annotation (Line(points={{-15.5,56},{-21.5,56}}, color={0,0,127}));
      connect(bool_dthetaFCVC01.y, switch_dthetaFCVC01.u2) annotation (Line(points={{-39.5,-16},{-33,-16}}, color={255,0,255}));
      connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (Line(points={{-39.5,-7},{-36,-7},{-36,-12},{-33,-12}}, color={0,0,127}));
      connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (Line(points={{-39.5,-26},{-36,-26},{-36,-20},{-33,-20}}, color={0,0,127}));
      connect(dtheta_FCVC01_act.numberPort, switch_dthetaFCVC01.y) annotation (Line(points={{-15.5,-16},{-21.5,-16}}, color={0,0,127}));
      connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (Line(points={{-39.5,-50},{-33,-50}}, color={255,0,255}));
      connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (Line(points={{-39.5,-41},{-36,-41},{-36,-46},{-33,-46}}, color={0,0,127}));
      connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (Line(points={{-39.5,-60},{-36,-60},{-36,-54},{-33,-54}}, color={0,0,127}));
      connect(dtheta_FCVC02_act.numberPort, switch_dthetaFCVC02.y) annotation (Line(points={{-15.5,-50},{-21.5,-50}}, color={0,0,127}));
      connect(bool_dthetaTCV701.y, switch_dthetaTCV701.u2) annotation (Line(points={{49.5,155},{56,155}}, color={255,0,255}));
      connect(dthetaTCV701_var.y, switch_dthetaTCV701.u1) annotation (Line(points={{49.5,164},{53,164},{53,159},{56,159}}, color={0,0,127}));
      connect(dthetaTCV701.y, switch_dthetaTCV701.u3) annotation (Line(points={{49.5,145},{53,145},{53,151},{56,151}}, color={0,0,127}));
      connect(dtheta_TCV701_act.numberPort, switch_dthetaTCV701.y) annotation (Line(points={{73.5,155},{67.5,155}}, color={0,0,127}));
      connect(bool_dthetaTCV711.y, switch_dthetaTCV711.u2) annotation (Line(points={{49.5,121},{56,121}}, color={255,0,255}));
      connect(dthetaTCV711_var.y, switch_dthetaTCV711.u1) annotation (Line(points={{49.5,130},{53,130},{53,125},{56,125}}, color={0,0,127}));
      connect(dthetaTCV711.y, switch_dthetaTCV711.u3) annotation (Line(points={{49.5,111},{53,111},{53,117},{56,117}}, color={0,0,127}));
      connect(dtheta_TCV711_act.numberPort, switch_dthetaTCV711.y) annotation (Line(points={{73.5,121},{67.5,121}}, color={0,0,127}));
      connect(bool_dthetaTCV721.y, switch_dthetaTCV721.u2) annotation (Line(points={{49.5,88},{56,88}}, color={255,0,255}));
      connect(dthetaTCV721_var.y, switch_dthetaTCV721.u1) annotation (Line(points={{49.5,97},{53,97},{53,92},{56,92}}, color={0,0,127}));
      connect(dthetaTCV721.y, switch_dthetaTCV721.u3) annotation (Line(points={{49.5,78},{53,78},{53,84},{56,84}}, color={0,0,127}));
      connect(dtheta_TCV721_act.numberPort, switch_dthetaTCV721.y) annotation (Line(points={{73.5,88},{67.5,88}}, color={0,0,127}));
      connect(bool_dthetaTCV731.y, switch_dthetaTCV731.u2) annotation (Line(points={{49.5,56},{56,56}}, color={255,0,255}));
      connect(dthetaTCV731_var.y, switch_dthetaTCV731.u1) annotation (Line(points={{49.5,65},{53,65},{53,60},{56,60}}, color={0,0,127}));
      connect(dthetaTCV731.y, switch_dthetaTCV731.u3) annotation (Line(points={{49.5,46},{53,46},{53,52},{56,52}}, color={0,0,127}));
      connect(dtheta_TCV731_act.numberPort, switch_dthetaTCV731.y) annotation (Line(points={{73.5,56},{67.5,56}}, color={0,0,127}));
      connect(bool_dthetaFCVR01.y, switch_dthetaFCVR01.u2) annotation (Line(points={{49.5,23},{56,23}}, color={255,0,255}));
      connect(dthetaFCVR01_var.y, switch_dthetaFCVR01.u1) annotation (Line(points={{49.5,32},{53,32},{53,27},{56,27}}, color={0,0,127}));
      connect(dthetaFCVR01.y, switch_dthetaFCVR01.u3) annotation (Line(points={{49.5,13},{53,13},{53,19},{56,19}}, color={0,0,127}));
      connect(dtheta_TCV731_act1.numberPort, switch_dthetaFCVR01.y) annotation (Line(points={{73.5,23},{67.5,23}}, color={0,0,127}));
      connect(bool_dToutRR01.y, switch_dToutRR01.u2) annotation (Line(points={{49.5,-10},{56,-10}}, color={255,0,255}));
      connect(dToutRR01_var.y, switch_dToutRR01.u1) annotation (Line(points={{49.5,-1},{53,-1},{53,-6},{56,-6}}, color={0,0,127}));
      connect(dTout_RR01_act.numberPort, switch_dToutRR01.y) annotation (Line(points={{73.5,-10},{67.5,-10}}, color={0,0,127}));
      connect(dToutRR01.y, switch_dToutRR01.u3) annotation (Line(points={{49.5,-20},{53,-20},{53,-14},{56,-14}}, color={0,0,127}));
      connect(domegaP501_var.y, switch_domegaP501.u1) annotation (Line(points={{-40.5,-105},{-37,-105},{-37,-111},{-33,-111}}, color={0,0,127}));
      connect(bool_domegaP501.y, switch_domegaP501.u2) annotation (Line(points={{-40.5,-115},{-33,-115}}, color={255,0,255}));
      connect(domegaP501.y, switch_domegaP501.u3) annotation (Line(points={{-40.5,-125},{-37,-125},{-37,-119},{-33,-119}}, color={0,0,127}));
      connect(switch_domegaP501.y, domega_P501_act.numberPort) annotation (Line(points={{-21.5,-115},{-16.5,-115}}, color={0,0,127}));
      connect(bool_dToutCHP501.y, switch_dToutCHP501.u2) annotation (Line(points={{-40.5,-150},{-34,-150}}, color={255,0,255}));
      connect(dToutCHP501_var.y, switch_dToutCHP501.u1) annotation (Line(points={{-40.5,-141},{-37,-141},{-37,-146},{-34,-146}}, color={0,0,127}));
      connect(dTout_CHP501_act.numberPort, switch_dToutCHP501.y) annotation (Line(points={{-16.5,-150},{-22.5,-150}}, color={0,0,127}));
      connect(dToutCHP501.y, switch_dToutCHP501.u3) annotation (Line(points={{-40.5,-160},{-37,-160},{-37,-154},{-34,-154}}, color={0,0,127}));
      connect(switch_dthetaTCV701.y, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{67.5,155},{70,155},{70,141},{140,141},{140,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaTCV711.y, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{67.5,121},{70,121},{70,110},{139,110},{139,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaTCV721.y, controlSignalBus.dthetaTCV721)
        annotation (Line(points={{67.5,88},{69,88},{69,80},{138,80},{138,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaTCV731.y, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{67.5,56},{70,56},{70,40},{137,40},{137,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
        annotation (Line(points={{67.5,23},{70,23},{70,10},{136,10},{136,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutRR01.y, controlSignalBus.dToutRR01)
        annotation (Line(points={{67.5,-10},{70,-10},{70,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV701.y, controlSignalBus.dthetaFCV701)
        annotation (Line(points={{-21.5,155},{-19,155},{-19,140},{20,140},{20,-40},{139,-40},{139,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV711.y, controlSignalBus.dthetaFCV711)
        annotation (Line(points={{-21.5,121},{-19,121},{-19,110},{19,110},{19,-42},{140,-42},{140,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV721.y, controlSignalBus.dthetaFCV721)
        annotation (Line(points={{-21.5,88},{-19,88},{-19,80},{18,80},{18,-43},{141,-43},{141,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV731.y, controlSignalBus.dthetaFCV731)
        annotation (Line(points={{-21.5,56},{-19,56},{-19,50},{17,50},{17,-44},{142,-44},{142,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
        annotation (Line(points={{-21.5,-16},{-19,-16},{-19,-30},{16,-30},{16,-45},{143,-45},{143,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02)
        annotation (Line(points={{-21.5,-50},{-19,-50},{-19,-40},{15,-40},{15,-46},{144,-46},{144,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_domegaP901.y, controlSignalBus.domegaP901)
        annotation (Line(points={{-111.5,150},{-110,150},{-110,160},{-77,160},{-77,197},{149,197},{149,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901)
        annotation (Line(points={{-112.5,117},{-111,117},{-111,140},{-76,140},{-76,196},{148,196},{148,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_domegaP101.y, controlSignalBus.domegaP101)
        annotation (Line(points={{-111.5,40},{-110,40},{-110,27},{25,27},{25,-35},{124,-35},{124,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV101.y, controlSignalBus.dthetaFCV101)
        annotation (Line(points={{-112.5,7},{-110,7},{-110,26},{24,26},{24,-36},{125,-36},{125,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-112.5,-26},{-110,-26},{-110,-10},{-77,-10},{-77,25},{23,25},{23,-37},{127,-37},{127,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_domegaP401.y, controlSignalBus.domegaP401) annotation (Line(points={{-111.5,-100},{-110,-100},{-110,-90},{-70,-90},{-70,-74},{20,-74},{20,-50},{130,-50},{130,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV401.y, controlSignalBus.dthetaFCV401) annotation (Line(points={{-112.5,-133},{-111,-133},{-111,-132},{-110,-132},{-110,-120},{-69,-120},{-69,-75},{21,-75},{21,-51},{131,-51},{131,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-112.5,-166},{-111,-166},{-111,-150},{-68,-150},{-68,-76},{22,-76},{22,-52},{132,-52},{132,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_domegaP501.y, controlSignalBus.domegaP501) annotation (Line(points={{-21.5,-115},{-20,-115},{-20,-103},{-19,-103},{-19,-100},{23,-100},{23,-53},{133,-53},{133,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501)
        annotation (Line(points={{-22.5,-150},{-21,-150},{-21,-140},{24,-140},{24,-54},{134,-54},{134,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="Open
Loop
Act")}),Diagram(coordinateSystem(
            extent={{-160,-200},{160,200}}, grid={1,1}), graphics={Rectangle(
              extent={{-60,-80},{10,-170}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),                           Rectangle(
              extent={{-150,190},{-80,90}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,190},{-85,170}},
              textString="S900",
              textColor={0,0,0}),                                  Rectangle(
              extent={{-150,80},{-80,-50}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,80},{-85,60}},
              textColor={0,0,0},
              textString="S100"),                                  Rectangle(
              extent={{-150,-60},{-80,-190}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,-60},{-85,-80}},
              textColor={0,0,0},
              textString="S400"),                                  Rectangle(
              extent={{-60,190},{10,30}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-55,190},{5,170}},
              textColor={0,0,0},
              textString="S700"),                                  Rectangle(
              extent={{-60,20},{10,-70}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-56,18},{4,-2}},
              textColor={0,0,0},
              textString="RACK"),                                  Rectangle(
              extent={{30,190},{100,-30}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{34,190},{94,170}},
              textColor={0,0,0},
              textString="RR00"),        Text(
              extent={{-55,-79},{5,-99}},
              textColor={0,0,0},
              textString="S500")}));
    end OpenLoopActuator;

    model FullPlantController_D

      constant Real pi = Modelica.Constants.pi;
      parameter DistrictHeatingNetwork.Types.PerUnit theta_nom = 1;
      parameter DistrictHeatingNetwork.Types.AngularVelocity omega_nom = 2*pi*50;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_gen_nom = 100 + 273.15 "Outlet nominal temperature for generators";

      // Rack CD
      parameter Real dtheta_FCVC01[:, :] = [0, -1; 1e6, -1];
      parameter Real dtheta_FCVC02[:, :] = [0, -1; 2e3, -1];

      // S900
      parameter Real domega_P901[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV901[:, :] = [0, 0; 1e6, 0];

      // S100
      parameter Real dTout_GB101[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P101[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCV101[:, :] = [0, 0; 1e6, 0];

      // S400
      parameter Real dTout_EB401[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P401[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];
      parameter Real dtheta_FCV401[:, :] = [0, 0; 1e6, 0];

      // S500
      parameter Real dTout_CHP501[:,:] = [0, 0; 1e6, 0];
      parameter Real domega_P501[:, :] = [0, (35-50)/50; 1e6, (35-50)/50];
      parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_nom= DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h*980/3600;


      // S700
      parameter Real dtheta_FCV701[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV711[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV721[:, :] = [0, -0.2; 1e6, -0.2];
      parameter Real dtheta_FCV731[:, :] = [0, -0.2; 1e6, -0.2];

      // Cooling System RR
      parameter Real dtheta_TCV701[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV711[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV721[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_TCV731[:, :] = [0, 0; 1e6, 0];
      parameter Real dtheta_FCVR01[:, :] = [0, -0.5; 1e6, -0.5];
      parameter Real dTout_RR01[:,:] = [0, (15-30)/(30+273.15); 1e6, (15-30)/(30+273.15)];
      parameter Real dFTR01[:, :] = [0, 0; 1000, 0; 1000, -0.05; 1E5, -0.05];

      // S900
      DistrictHeatingNetwork.Types.PerUnit theta_FCV901SP;
      Real dtheta_FCV901_var(min = -1, max = 0);
      Boolean booldthetaFCV901;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P901SP;
      Real domega_P901_var(min = -1, max = 0);
      Boolean booldomegaP901;

      // S100
      DistrictHeatingNetwork.Types.PerUnit theta_FCV101SP;
      Real dtheta_FCV101_var(min = -1, max = 0);
      Boolean booldthetaFCV101;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P101SP;
      Real domega_P101_var(min = -1, max = 0);
      Boolean booldomegaP101;
      DistrictHeatingNetwork.Types.Temperature Tout_GB101SP(nominal = 100 + 273.15);
      Real dTout_GB101_var(min = -1, max = 0);
      Boolean booldToutGB101;

      // S400
      DistrictHeatingNetwork.Types.PerUnit theta_FCV401SP;
      Real dtheta_FCV401_var(min = -1, max = 0);
      Boolean booldthetaFCV401;
      DistrictHeatingNetwork.Types.AngularVelocity omega_P401SP;
      Real domega_P401_var(min = -1, max = 0);
      Boolean booldomegaP401;
      DistrictHeatingNetwork.Types.Temperature Tout_EB401SP(nominal = 100 + 273.15);
      Real dTout_EB401_var(min = -1, max = 0);
      Boolean booldToutEB401;

      // S500
      DistrictHeatingNetwork.Types.AngularVelocity omega_P501SP;
      Real domega_P501_var(min = -1, max = 0);
      Boolean booldomegaP501;
      DistrictHeatingNetwork.Types.Temperature Tout_CHP501SP(nominal = 100 + 273.15);
      Real dTout_CHP501_var(min = -1, max = 0);
      Boolean booldToutCHP501;

      // S700
      DistrictHeatingNetwork.Types.PerUnit theta_FCV701SP;
      Real dtheta_FCV701_var(min = -1, max = 0);
      Boolean booldthetaFCV701;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV711SP;
      Real dtheta_FCV711_var(min = -1, max = 0);
      Boolean booldthetaFCV711;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV721SP;
      Real dtheta_FCV721_var(min = -1, max = 0);
      Boolean booldthetaFCV721;
      DistrictHeatingNetwork.Types.PerUnit theta_FCV731SP;
      Real dtheta_FCV731_var(min = -1, max = 0);
      Boolean booldthetaFCV731;

      // Rack
      DistrictHeatingNetwork.Types.PerUnit theta_FCVC01SP;
      Real dtheta_FCVC01_var(min = -1, max = 0);
      Boolean booldthetaFCVC01;
      DistrictHeatingNetwork.Types.PerUnit theta_FCVC02SP;
      Real dtheta_FCVC02_var(min = -1, max = 0);
      Boolean booldthetaFCVC02;

      // Cooling
      DistrictHeatingNetwork.Types.PerUnit theta_TCV701SP;
      Real dtheta_TCV701_var(min = -1, max = 0);
      Boolean booldthetaTCV701;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV711SP;
      Real dtheta_TCV711_var(min = -1, max = 0);
      Boolean booldthetaTCV711;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV721SP;
      Real dtheta_TCV721_var(min = -1, max = 0);
      Boolean booldthetaTCV721;
      DistrictHeatingNetwork.Types.PerUnit theta_TCV731SP;
      Real dtheta_TCV731_var(min = -1, max = 0);
      Boolean booldthetaTCV731;
      DistrictHeatingNetwork.Types.PerUnit theta_FCVR01SP;
      Real dtheta_FCVR01_var(min = -1, max = 0);
      Boolean booldthetaFCVR01;
      DistrictHeatingNetwork.Types.Temperature Tout_RR01SP(nominal = 100 + 273.15);
      Real dTout_RR01_var(min = -1, max = 0);
      Boolean booldToutRR01;


      // Set-points
      Real FT101SP(nominal = 5.7166667);
      Real dFT101SP(min = -1, max = 0);
      Real FT401SP(nominal = 3.2666667);
      Real dFT401SP(min = -1, max = 0);
      Real FT501SP(nominal = FT501_nom);
      Real dFT501SP(min = -1, max = 0);
      Real FT701SP(nominal = 2);
      Real dFT701SP(min = -1, max = 0);
      Real FT711SP(nominal = 2);
      Real dFT711SP(min = -1, max = 0);
      Real FT721SP(nominal = 2);
      Real dFT721SP(min = -1, max = 0);
      Real TT701SP(nominal = Tout_gen_nom);
      Real dTT701SP(min = -1, max = 0);
      Real TT711SP(nominal = Tout_gen_nom);
      Real dTT711SP(min = -1, max = 0);
      Real TT721SP(nominal = Tout_gen_nom);
      Real dTT721SP(min = -1, max = 0);
      Real TT731SP(nominal = Tout_gen_nom);
      Real dTT731SP(min = -1, max = 0);

      Modelica.Blocks.Sources.TimeTable domegaP901(table = domega_P901) annotation (
        Placement(transformation(extent={{-141,135},{-131,145}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV901(table = dtheta_FCV901) annotation (
        Placement(transformation(extent={{-141,102},{-131,112}})));
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (
        Placement(visible = true, transformation(origin={160,0},     extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
      Modelica.Blocks.Sources.TimeTable dToutGB101(table=dTout_GB101) annotation (Placement(transformation(extent={{-141,-41},{-131,-31}})));
      Modelica.Blocks.Sources.RealExpression domegaP901_var(y=domega_P901_var)           annotation (Placement(transformation(extent={{-141,155},{-131,165}})));
      Modelica.Blocks.Logical.Switch switch_domegaP901 annotation (Placement(transformation(extent={{-122,145},{-112,155}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP901(y=booldomegaP901)
                                                                        annotation (Placement(transformation(extent={{-141,145},{-131,155}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV901(y=booldthetaFCV901)
                                                                          annotation (Placement(transformation(extent={{-141,112},{-131,122}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV901_var(y=dtheta_FCV901_var) annotation (Placement(transformation(extent={{-141,121},{-131,131}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV901 annotation (Placement(transformation(extent={{-123,112},{-113,122}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,140},{-85,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV901_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,107},{-85,127}})));
      Modelica.Blocks.Sources.TimeTable domegaP101(table=domega_P101) annotation (Placement(transformation(extent={{-141,25},{-131,35}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV101(table=dtheta_FCV101) annotation (Placement(transformation(extent={{-141,-8},{-131,2}})));
      Modelica.Blocks.Sources.RealExpression domegaP101_var(y=domega_P101_var) annotation (Placement(transformation(extent={{-141,45},{-131,55}})));
      Modelica.Blocks.Logical.Switch switch_domegaP101 annotation (Placement(transformation(extent={{-122,35},{-112,45}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP101(y=booldomegaP101) annotation (Placement(transformation(extent={{-141,35},{-131,45}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV101(y=booldthetaFCV101) annotation (Placement(transformation(extent={{-141,2},{-131,12}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV101_var(y=dtheta_FCV101_var) annotation (Placement(transformation(extent={{-141,11},{-131,21}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV101 annotation (Placement(transformation(extent={{-123,2},{-113,12}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,30},{-85,50}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-3},{-85,17}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutGB101(y=booldToutGB101)   annotation (Placement(transformation(extent={{-141,-31},{-131,-21}})));
      Modelica.Blocks.Sources.RealExpression dToutGB101_var(y=dTout_GB101_var) annotation (Placement(transformation(extent={{-141,-22},{-131,-12}})));
      Modelica.Blocks.Logical.Switch switch_dToutGB101 annotation (Placement(transformation(extent={{-123,-31},{-113,-21}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_GB101_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-36},{-85,-16}})));
      Modelica.Blocks.Sources.TimeTable dToutEB401(table=dTout_EB401) annotation (Placement(transformation(extent={{-141,-181},{-131,-171}})));
      Modelica.Blocks.Sources.TimeTable domegaP401(table=domega_P401) annotation (Placement(transformation(extent={{-141,-115},{-131,-105}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV401(table=dtheta_FCV401) annotation (Placement(transformation(extent={{-141,-148},{-131,-138}})));
      Modelica.Blocks.Sources.RealExpression domegaP401_var(y=domega_P401_var) annotation (Placement(transformation(extent={{-141,-95},{-131,-85}})));
      Modelica.Blocks.Logical.Switch switch_domegaP401 annotation (Placement(transformation(extent={{-122,-105},{-112,-95}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP401(y=booldomegaP401) annotation (Placement(transformation(extent={{-141,-105},{-131,-95}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV401(y=booldthetaFCV401) annotation (Placement(transformation(extent={{-141,-138},{-131,-128}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV401_var(y=dtheta_FCV401_var) annotation (Placement(transformation(extent={{-141,-129},{-131,-119}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV401 annotation (Placement(transformation(extent={{-123,-138},{-113,-128}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-110},{-85,-90}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-143},{-85,-123}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutEB401(y=booldToutEB401) annotation (Placement(transformation(extent={{-141,-171},{-131,-161}})));
      Modelica.Blocks.Sources.RealExpression dToutEB401_var(y=dTout_EB401_var) annotation (Placement(transformation(extent={{-141,-162},{-131,-152}})));
      Modelica.Blocks.Logical.Switch switch_dToutEB401 annotation (Placement(transformation(extent={{-123,-171},{-113,-161}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_EB401_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-105,-176},{-85,-156}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV701(table=dtheta_FCV701) annotation (Placement(transformation(extent={{-50,140},{-40,150}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV701(y=booldthetaFCV701) annotation (Placement(transformation(extent={{-50,150},{-40,160}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV701_var(y=dtheta_FCV701_var) annotation (Placement(transformation(extent={{-50,159},{-40,169}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV701 annotation (Placement(transformation(extent={{-32,150},{-22,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,145},{6,165}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV711(table=dtheta_FCV711) annotation (Placement(transformation(extent={{-50,106},{-40,116}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV711(y=booldthetaFCV711) annotation (Placement(transformation(extent={{-50,116},{-40,126}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV711_var(y=dtheta_FCV711_var) annotation (Placement(transformation(extent={{-50,125},{-40,135}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV711 annotation (Placement(transformation(extent={{-32,116},{-22,126}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,111},{6,131}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV721(table=dtheta_FCV721) annotation (Placement(transformation(extent={{-50,73},{-40,83}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV721(y=booldthetaFCV721) annotation (Placement(transformation(extent={{-50,83},{-40,93}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV721_var(y=dtheta_FCV721_var) annotation (Placement(transformation(extent={{-50,92},{-40,102}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV721 annotation (Placement(transformation(extent={{-32,83},{-22,93}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,78},{6,98}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCV731(table=dtheta_FCV731) annotation (Placement(transformation(extent={{-50,41},{-40,51}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCV731(y=booldthetaFCV731) annotation (Placement(transformation(extent={{-50,51},{-40,61}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCV731_var(y=dtheta_FCV731_var) annotation (Placement(transformation(extent={{-50,60},{-40,70}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCV731 annotation (Placement(transformation(extent={{-32,51},{-22,61}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,46},{6,66}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC01(table=dtheta_FCVC01) annotation (Placement(transformation(extent={{-50,-31},{-40,-21}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC01(y=booldthetaFCVC01) annotation (Placement(transformation(extent={{-50,-21},{-40,-11}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVC01_var(y=dtheta_FCVC01_var) annotation (Placement(transformation(extent={{-50,-12},{-40,-2}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVC01 annotation (Placement(transformation(extent={{-32,-21},{-22,-11}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-26},{6,-6}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVC02(table=dtheta_FCVC02) annotation (Placement(transformation(extent={{-50,-65},{-40,-55}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVC02(y=booldthetaFCVC02) annotation (Placement(transformation(extent={{-50,-55},{-40,-45}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVC02_var(y=dtheta_FCVC02_var) annotation (Placement(transformation(extent={{-50,-46},{-40,-36}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVC02 annotation (Placement(transformation(extent={{-32,-55},{-22,-45}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_FCVC02_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-14,-60},{6,-40}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV701(table=dtheta_TCV701) annotation (Placement(transformation(extent={{39,140},{49,150}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV701(y=booldthetaTCV701) annotation (Placement(transformation(extent={{39,150},{49,160}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV701_var(y=dtheta_TCV701_var) annotation (Placement(transformation(extent={{39,159},{49,169}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV701 annotation (Placement(transformation(extent={{57,150},{67,160}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV701_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,145},{95,165}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV711(table=dtheta_TCV711) annotation (Placement(transformation(extent={{39,106},{49,116}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV711(y=booldthetaTCV711) annotation (Placement(transformation(extent={{39,116},{49,126}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV711_var(y=dtheta_TCV711_var) annotation (Placement(transformation(extent={{39,125},{49,135}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV711 annotation (Placement(transformation(extent={{57,116},{67,126}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV711_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,111},{95,131}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV721(table=dtheta_TCV721) annotation (Placement(transformation(extent={{39,73},{49,83}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV721(y=booldthetaTCV721) annotation (Placement(transformation(extent={{39,83},{49,93}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV721_var(y=dtheta_TCV721_var) annotation (Placement(transformation(extent={{39,92},{49,102}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV721 annotation (Placement(transformation(extent={{57,83},{67,93}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV721_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,78},{95,98}})));
      Modelica.Blocks.Sources.TimeTable dthetaTCV731(table=dtheta_TCV731) annotation (Placement(transformation(extent={{39,41},{49,51}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaTCV731(y=booldthetaTCV731) annotation (Placement(transformation(extent={{39,51},{49,61}})));
      Modelica.Blocks.Sources.RealExpression dthetaTCV731_var(y=dtheta_TCV731_var) annotation (Placement(transformation(extent={{39,60},{49,70}})));
      Modelica.Blocks.Logical.Switch switch_dthetaTCV731 annotation (Placement(transformation(extent={{57,51},{67,61}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,46},{95,66}})));
      Modelica.Blocks.Sources.TimeTable dthetaFCVR01(table=dtheta_FCVR01) annotation (Placement(transformation(extent={{39,8},{49,18}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dthetaFCVR01(y=booldthetaFCVR01) annotation (Placement(transformation(extent={{39,18},{49,28}})));
      Modelica.Blocks.Sources.RealExpression dthetaFCVR01_var(y=dtheta_FCVR01_var) annotation (Placement(transformation(extent={{39,27},{49,37}})));
      Modelica.Blocks.Logical.Switch switch_dthetaFCVR01 annotation (Placement(transformation(extent={{57,18},{67,28}})));
      Modelica.Blocks.Interaction.Show.RealValue dtheta_TCV731_act1(use_numberPort=true, significantDigits=2)                                                                                                         annotation (Placement(transformation(extent={{75,13},{95,33}})));
      Modelica.Blocks.Sources.TimeTable dToutRR01(table=dTout_RR01) annotation (Placement(transformation(extent={{39,-25},{49,-15}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutRR01(y=booldToutRR01) annotation (Placement(transformation(extent={{39,-15},{49,-5}})));
      Modelica.Blocks.Sources.RealExpression dToutRR01_var(y=dTout_RR01_var) annotation (Placement(transformation(extent={{39,-6},{49,4}})));
      Modelica.Blocks.Logical.Switch switch_dToutRR01 annotation (Placement(transformation(extent={{57,-15},{67,-5}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_RR01_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{75,-20},{95,0}})));
      Modelica.Blocks.Sources.TimeTable dToutCHP501(table=dTout_CHP501) annotation (Placement(transformation(extent={{-51,-165},{-41,-155}})));
      Modelica.Blocks.Sources.TimeTable domegaP501(table=domega_P501) annotation (Placement(transformation(extent={{-51,-130},{-41,-120}})));
      Modelica.Blocks.Sources.RealExpression domegaP501_var(y=domega_P501_var) annotation (Placement(transformation(extent={{-51,-110},{-41,-100}})));
      Modelica.Blocks.Logical.Switch switch_domegaP501 annotation (Placement(transformation(extent={{-32,-120},{-22,-110}})));
      Modelica.Blocks.Sources.BooleanExpression bool_domegaP501(y=booldomegaP501) annotation (Placement(transformation(extent={{-51,-120},{-41,-110}})));
      Modelica.Blocks.Interaction.Show.RealValue domega_P501_act(use_numberPort=true, significantDigits=2) annotation (Placement(transformation(extent={{-15,-125},{5,-105}})));
      Modelica.Blocks.Sources.BooleanExpression bool_dToutCHP501(y=booldToutCHP501) annotation (Placement(transformation(extent={{-51,-155},{-41,-145}})));
      Modelica.Blocks.Sources.RealExpression dToutCHP501_var(y=dTout_CHP501_var)
                                                                               annotation (Placement(transformation(extent={{-51,-146},{-41,-136}})));
      Modelica.Blocks.Logical.Switch switch_dToutCHP501 annotation (Placement(transformation(extent={{-33,-155},{-23,-145}})));
      Modelica.Blocks.Interaction.Show.RealValue dTout_CHP501_act(use_numberPort=true, significantDigits=2)
                                                                                                           annotation (Placement(transformation(extent={{-15,-160},{5,-140}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT101(
        Kp=0.84502,
        Ti=0.26795,
        Umax=0,
        Umin=-2,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState))  annotation (Placement(transformation(extent={{50,-120},{60,-110}})));
      DistrictHeatingNetwork.Actuators.SplitRange sR_FT101 annotation (Placement(transformation(extent={{70,-125},{90,-105}})));
      FMUExport.Interfaces.ControlSignalBus processVariableBus annotation (
        Placement(visible = true, transformation(origin={-170,-2},   extent={{50,40},{-50,-40}},      rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
      Modelica.Blocks.Sources.RealExpression dFT101SP_var(y=dFT101SP)
                                                                     annotation (Placement(transformation(extent={{30,-115},{40,-105}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
        Kp=0.69355,
        Ti=0.26795,
        Umax=0,
        Umin=-2,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-155},{60,-145}})));
      DistrictHeatingNetwork.Actuators.SplitRange sR_FT401 annotation (Placement(transformation(extent={{70,-160},{90,-140}})));
      Modelica.Blocks.Sources.RealExpression dFT401SP_var(y=dFT401SP) annotation (Placement(transformation(extent={{30,-145},{40,-135}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT701(
        Kp=0.1128,
        Ti=0.26795,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-195},{60,-185}})));
      Modelica.Blocks.Sources.RealExpression dFT501SP_var(y=dFT501SP) annotation (Placement(transformation(extent={{30,-173},{40,-163}})));
      Modelica.Blocks.Sources.RealExpression dFT701SP_var(y=dFT701SP) annotation (Placement(transformation(extent={{30,-190},{40,-180}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT501(
        Kp=0.55085,
        Ti=0.26795,
        Umax=0,
        Umin=-0.4,
        y_start=-0.4,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-177},{60,-167}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT711(
        Kp=0.13279,
        Ti=0.26795,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-210},{60,-200}})));
      Modelica.Blocks.Sources.RealExpression dFT711SP_var(y=dFT711SP) annotation (Placement(transformation(extent={{30,-205},{40,-195}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT721(
        Kp=0.1456,
        Ti=0.26795,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-225},{60,-215}})));
      Modelica.Blocks.Sources.RealExpression dFT721SP_var(y=dFT721SP) annotation (Placement(transformation(extent={{30,-219},{40,-209}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT701(
        Kp=-0.2743,
        Ti=0.7859,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-256},{60,-246}})));
      Modelica.Blocks.Sources.RealExpression dTT701SP_var(y=dTT701SP) annotation (Placement(transformation(extent={{30,-251},{40,-241}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT711(
        Kp=-0.6127,
        Ti=0.7859,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-270},{60,-260}})));
      Modelica.Blocks.Sources.RealExpression dTT711SP_var(y=dTT711SP) annotation (Placement(transformation(extent={{30,-265},{40,-255}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT721(
        Kp=-0.6127,
        Ti=0.7859,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-285},{60,-275}})));
      Modelica.Blocks.Sources.RealExpression dTT721SP_var(y=dTT721SP) annotation (Placement(transformation(extent={{30,-280},{40,-270}})));
      DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT731(
        Kp=-0.8127,
        Ti=0.7859,
        Umax=0,
        Umin=-1,
        y_start=0,
        firstOrder(initType=Modelica.Blocks.Types.Init.InitialState)) annotation (Placement(transformation(extent={{50,-300},{60,-290}})));
      Modelica.Blocks.Sources.RealExpression dTT731SP_var(y=dTT731SP) annotation (Placement(transformation(extent={{30,-295},{40,-285}})));
    equation
      // S900
      dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
      theta_FCV901SP = 1;
      booldthetaFCV901 = true;
      domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;
      omega_P901SP = 2*pi*35;
      booldomegaP901 = true;

      // S100
      dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
      theta_FCV101SP = 1;
      booldthetaFCV101 = true;
      domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
      omega_P101SP = 2*pi*35;
      booldomegaP101 = true;
      dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_GB101SP = 80 + 273.15;
      booldToutGB101 = true;

      // S400
      dtheta_FCV401_var = (theta_FCV401SP - theta_nom)/theta_nom;
      theta_FCV401SP = 1;
      booldthetaFCV401 = true;
      domega_P401_var = (omega_P401SP - omega_nom)/omega_nom;
      omega_P401SP = 2*pi*35;
      booldomegaP401 = true;
      dTout_EB401_var = (Tout_EB401SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_EB401SP = 80 + 273.15;
      booldToutEB401 = true;

      // S500
      domega_P501_var = (omega_P501SP - omega_nom)/omega_nom;
      omega_P501SP = 2*pi*35;
      booldomegaP501 = true;
      dTout_CHP501_var = (Tout_CHP501SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_CHP501SP = 80 + 273.15;
      booldToutCHP501 = true;

      // S700
      dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
      theta_FCV701SP = 1;
      booldthetaFCV701 = true;
      dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
      theta_FCV711SP = 1;
      booldthetaFCV711 = true;
      dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
      theta_FCV721SP = 1;
      booldthetaFCV721 = true;
      dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;
      theta_FCV731SP = 1;
      booldthetaFCV731 = true;

      // Rack
      dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
      theta_FCVC01SP = 1;
      booldthetaFCVC01 = true;
      dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;
      theta_FCVC02SP = 1;
      booldthetaFCVC02 = true;

      // RR00
      dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
      theta_TCV701SP = 1;
      booldthetaTCV701 = true;
      dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
      theta_TCV711SP = 1;
      booldthetaTCV711 = true;
      dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
      theta_TCV721SP = 1;
      booldthetaTCV721 = true;
      dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
      theta_TCV731SP = 1;
      booldthetaTCV731 = true;
      dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
      theta_FCVR01SP = 1;
      booldthetaFCVR01 = true;
      dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
      Tout_RR01SP = 20 + 273.15;
      booldToutRR01 = true;

      //Set-points
      FT101SP = 1.7;
      dFT101SP = (FT101SP - 5.7166667)/5.7166667;
      FT401SP = 1.33;
      //FT401SP = if time < 1e3 then 1.3 elseif time < 2e3 then -0.00053*time + 1.9 else 0.8;
      dFT401SP = (FT401SP - 3.2666667)/3.2666667;
      FT501SP = 2.1;
      dFT501SP = (FT501SP - FT501_nom)/FT501_nom;
      FT701SP = 1.35;
      dFT701SP = (FT701SP - 2)/2;
      FT711SP = 1.30;
      dFT711SP = (FT711SP - 2)/2;
      FT721SP = 1.20;
      dFT721SP = (FT721SP - 2)/2;
      TT701SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
      dTT701SP = (TT701SP - (60 + 273.15))/(100 + 273.15);
      TT711SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
      dTT711SP = (TT711SP - (60 + 273.15))/(100 + 273.15);
      TT721SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
      dTT721SP = (TT721SP - (60 + 273.15))/(100 + 273.15);
      TT731SP = if time < 1e3 then 45 + 273.15 elseif time < 2e3 then time*0.02 + 25 + 273.15 else 65 + 273.15;
      dTT731SP = (TT731SP - (60 + 273.15))/(100 + 273.15);

      connect(domegaP901_var.y, switch_domegaP901.u1) annotation (Line(points={{-130.5,160},{-127,160},{-127,154},{-123,154}}, color={0,0,127}));
      connect(bool_domegaP901.y, switch_domegaP901.u2) annotation (Line(points={{-130.5,150},{-123,150}}, color={255,0,255}));
      connect(domegaP901.y, switch_domegaP901.u3) annotation (Line(points={{-130.5,140},{-127,140},{-127,146},{-123,146}}, color={0,0,127}));
      connect(bool_dthetaFCV901.y, switch_dthetaFCV901.u2) annotation (Line(points={{-130.5,117},{-124,117}}, color={255,0,255}));
      connect(dthetaFCV901_var.y, switch_dthetaFCV901.u1) annotation (Line(points={{-130.5,126},{-127,126},{-127,121},{-124,121}}, color={0,0,127}));
      connect(dthetaFCV901.y, switch_dthetaFCV901.u3) annotation (Line(points={{-130.5,107},{-127,107},{-127,113},{-124,113}},
                                                                                                                             color={0,0,127}));
      connect(switch_domegaP901.y, domega_P901_act.numberPort) annotation (Line(points={{-111.5,150},{-106.5,150}}, color={0,0,127}));
      connect(dtheta_FCV901_act.numberPort, switch_dthetaFCV901.y) annotation (Line(points={{-106.5,117},{-112.5,117}}, color={0,0,127}));
      connect(domegaP101_var.y, switch_domegaP101.u1) annotation (Line(points={{-130.5,50},{-127,50},{-127,44},{-123,44}}, color={0,0,127}));
      connect(bool_domegaP101.y, switch_domegaP101.u2) annotation (Line(points={{-130.5,40},{-123,40}}, color={255,0,255}));
      connect(domegaP101.y, switch_domegaP101.u3) annotation (Line(points={{-130.5,30},{-127,30},{-127,36},{-123,36}}, color={0,0,127}));
      connect(bool_dthetaFCV101.y, switch_dthetaFCV101.u2) annotation (Line(points={{-130.5,7},{-124,7}},   color={255,0,255}));
      connect(dthetaFCV101_var.y, switch_dthetaFCV101.u1) annotation (Line(points={{-130.5,16},{-127,16},{-127,11},{-124,11}},
                                                                                                                           color={0,0,127}));
      connect(dthetaFCV101.y, switch_dthetaFCV101.u3) annotation (Line(points={{-130.5,-3},{-127,-3},{-127,3},{-124,3}},     color={0,0,127}));
      connect(switch_domegaP101.y, domega_P101_act.numberPort) annotation (Line(points={{-111.5,40},{-106.5,40}}, color={0,0,127}));
      connect(dtheta_FCV101_act.numberPort, switch_dthetaFCV101.y) annotation (Line(points={{-106.5,7},{-112.5,7}},   color={0,0,127}));
      connect(bool_dToutGB101.y,switch_dToutGB101. u2) annotation (Line(points={{-130.5,-26},{-124,-26}}, color={255,0,255}));
      connect(dToutGB101_var.y, switch_dToutGB101.u1) annotation (Line(points={{-130.5,-17},{-127,-17},{-127,-22},{-124,-22}}, color={0,0,127}));
      connect(dTout_GB101_act.numberPort, switch_dToutGB101.y) annotation (Line(points={{-106.5,-26},{-112.5,-26}}, color={0,0,127}));
      connect(dToutGB101.y, switch_dToutGB101.u3) annotation (Line(points={{-130.5,-36},{-127,-36},{-127,-30},{-124,-30}}, color={0,0,127}));
      connect(domegaP401_var.y, switch_domegaP401.u1) annotation (Line(points={{-130.5,-90},{-127,-90},{-127,-96},{-123,-96}},     color={0,0,127}));
      connect(bool_domegaP401.y, switch_domegaP401.u2) annotation (Line(points={{-130.5,-100},{-123,-100}}, color={255,0,255}));
      connect(domegaP401.y, switch_domegaP401.u3) annotation (Line(points={{-130.5,-110},{-127,-110},{-127,-104},{-123,-104}}, color={0,0,127}));
      connect(bool_dthetaFCV401.y, switch_dthetaFCV401.u2) annotation (Line(points={{-130.5,-133},{-124,-133}}, color={255,0,255}));
      connect(dthetaFCV401_var.y, switch_dthetaFCV401.u1) annotation (Line(points={{-130.5,-124},{-127,-124},{-127,-129},{-124,-129}}, color={0,0,127}));
      connect(dthetaFCV401.y, switch_dthetaFCV401.u3) annotation (Line(points={{-130.5,-143},{-127,-143},{-127,-137},{-124,-137}}, color={0,0,127}));
      connect(switch_domegaP401.y, domega_P401_act.numberPort) annotation (Line(points={{-111.5,-100},{-106.5,-100}}, color={0,0,127}));
      connect(dtheta_FCV401_act.numberPort, switch_dthetaFCV401.y) annotation (Line(points={{-106.5,-133},{-112.5,-133}}, color={0,0,127}));
      connect(bool_dToutEB401.y, switch_dToutEB401.u2) annotation (Line(points={{-130.5,-166},{-124,-166}}, color={255,0,255}));
      connect(dToutEB401_var.y, switch_dToutEB401.u1) annotation (Line(points={{-130.5,-157},{-127,-157},{-127,-162},{-124,-162}}, color={0,0,127}));
      connect(dTout_EB401_act.numberPort, switch_dToutEB401.y) annotation (Line(points={{-106.5,-166},{-112.5,-166}}, color={0,0,127}));
      connect(dToutEB401.y, switch_dToutEB401.u3) annotation (Line(points={{-130.5,-176},{-127,-176},{-127,-170},{-124,-170}}, color={0,0,127}));
      connect(bool_dthetaFCV701.y, switch_dthetaFCV701.u2) annotation (Line(points={{-39.5,155},{-33,155}}, color={255,0,255}));
      connect(dthetaFCV701_var.y, switch_dthetaFCV701.u1) annotation (Line(points={{-39.5,164},{-36,164},{-36,159},{-33,159}}, color={0,0,127}));
      connect(dthetaFCV701.y, switch_dthetaFCV701.u3) annotation (Line(points={{-39.5,145},{-36,145},{-36,151},{-33,151}}, color={0,0,127}));
      connect(dtheta_FCV701_act.numberPort, switch_dthetaFCV701.y) annotation (Line(points={{-15.5,155},{-21.5,155}}, color={0,0,127}));
      connect(bool_dthetaFCV711.y, switch_dthetaFCV711.u2) annotation (Line(points={{-39.5,121},{-33,121}}, color={255,0,255}));
      connect(dthetaFCV711_var.y, switch_dthetaFCV711.u1) annotation (Line(points={{-39.5,130},{-36,130},{-36,125},{-33,125}}, color={0,0,127}));
      connect(dthetaFCV711.y, switch_dthetaFCV711.u3) annotation (Line(points={{-39.5,111},{-36,111},{-36,117},{-33,117}}, color={0,0,127}));
      connect(dtheta_FCV711_act.numberPort, switch_dthetaFCV711.y) annotation (Line(points={{-15.5,121},{-21.5,121}}, color={0,0,127}));
      connect(bool_dthetaFCV721.y, switch_dthetaFCV721.u2) annotation (Line(points={{-39.5,88},{-33,88}}, color={255,0,255}));
      connect(dthetaFCV721_var.y, switch_dthetaFCV721.u1) annotation (Line(points={{-39.5,97},{-36,97},{-36,92},{-33,92}}, color={0,0,127}));
      connect(dthetaFCV721.y, switch_dthetaFCV721.u3) annotation (Line(points={{-39.5,78},{-36,78},{-36,84},{-33,84}}, color={0,0,127}));
      connect(dtheta_FCV721_act.numberPort, switch_dthetaFCV721.y) annotation (Line(points={{-15.5,88},{-21.5,88}}, color={0,0,127}));
      connect(bool_dthetaFCV731.y, switch_dthetaFCV731.u2) annotation (Line(points={{-39.5,56},{-33,56}}, color={255,0,255}));
      connect(dthetaFCV731_var.y, switch_dthetaFCV731.u1) annotation (Line(points={{-39.5,65},{-36,65},{-36,60},{-33,60}}, color={0,0,127}));
      connect(dthetaFCV731.y, switch_dthetaFCV731.u3) annotation (Line(points={{-39.5,46},{-36,46},{-36,52},{-33,52}}, color={0,0,127}));
      connect(dtheta_FCV731_act.numberPort, switch_dthetaFCV731.y) annotation (Line(points={{-15.5,56},{-21.5,56}}, color={0,0,127}));
      connect(bool_dthetaFCVC01.y, switch_dthetaFCVC01.u2) annotation (Line(points={{-39.5,-16},{-33,-16}}, color={255,0,255}));
      connect(dthetaFCVC01_var.y, switch_dthetaFCVC01.u1) annotation (Line(points={{-39.5,-7},{-36,-7},{-36,-12},{-33,-12}}, color={0,0,127}));
      connect(dthetaFCVC01.y, switch_dthetaFCVC01.u3) annotation (Line(points={{-39.5,-26},{-36,-26},{-36,-20},{-33,-20}}, color={0,0,127}));
      connect(dtheta_FCVC01_act.numberPort, switch_dthetaFCVC01.y) annotation (Line(points={{-15.5,-16},{-21.5,-16}}, color={0,0,127}));
      connect(bool_dthetaFCVC02.y, switch_dthetaFCVC02.u2) annotation (Line(points={{-39.5,-50},{-33,-50}}, color={255,0,255}));
      connect(dthetaFCVC02_var.y, switch_dthetaFCVC02.u1) annotation (Line(points={{-39.5,-41},{-36,-41},{-36,-46},{-33,-46}}, color={0,0,127}));
      connect(dthetaFCVC02.y, switch_dthetaFCVC02.u3) annotation (Line(points={{-39.5,-60},{-36,-60},{-36,-54},{-33,-54}}, color={0,0,127}));
      connect(dtheta_FCVC02_act.numberPort, switch_dthetaFCVC02.y) annotation (Line(points={{-15.5,-50},{-21.5,-50}}, color={0,0,127}));
      connect(bool_dthetaTCV701.y, switch_dthetaTCV701.u2) annotation (Line(points={{49.5,155},{56,155}}, color={255,0,255}));
      connect(dthetaTCV701_var.y, switch_dthetaTCV701.u1) annotation (Line(points={{49.5,164},{53,164},{53,159},{56,159}}, color={0,0,127}));
      connect(dthetaTCV701.y, switch_dthetaTCV701.u3) annotation (Line(points={{49.5,145},{53,145},{53,151},{56,151}}, color={0,0,127}));
      connect(dtheta_TCV701_act.numberPort, switch_dthetaTCV701.y) annotation (Line(points={{73.5,155},{67.5,155}}, color={0,0,127}));
      connect(bool_dthetaTCV711.y, switch_dthetaTCV711.u2) annotation (Line(points={{49.5,121},{56,121}}, color={255,0,255}));
      connect(dthetaTCV711_var.y, switch_dthetaTCV711.u1) annotation (Line(points={{49.5,130},{53,130},{53,125},{56,125}}, color={0,0,127}));
      connect(dthetaTCV711.y, switch_dthetaTCV711.u3) annotation (Line(points={{49.5,111},{53,111},{53,117},{56,117}}, color={0,0,127}));
      connect(dtheta_TCV711_act.numberPort, switch_dthetaTCV711.y) annotation (Line(points={{73.5,121},{67.5,121}}, color={0,0,127}));
      connect(bool_dthetaTCV721.y, switch_dthetaTCV721.u2) annotation (Line(points={{49.5,88},{56,88}}, color={255,0,255}));
      connect(dthetaTCV721_var.y, switch_dthetaTCV721.u1) annotation (Line(points={{49.5,97},{53,97},{53,92},{56,92}}, color={0,0,127}));
      connect(dthetaTCV721.y, switch_dthetaTCV721.u3) annotation (Line(points={{49.5,78},{53,78},{53,84},{56,84}}, color={0,0,127}));
      connect(dtheta_TCV721_act.numberPort, switch_dthetaTCV721.y) annotation (Line(points={{73.5,88},{67.5,88}}, color={0,0,127}));
      connect(bool_dthetaTCV731.y, switch_dthetaTCV731.u2) annotation (Line(points={{49.5,56},{56,56}}, color={255,0,255}));
      connect(dthetaTCV731_var.y, switch_dthetaTCV731.u1) annotation (Line(points={{49.5,65},{53,65},{53,60},{56,60}}, color={0,0,127}));
      connect(dthetaTCV731.y, switch_dthetaTCV731.u3) annotation (Line(points={{49.5,46},{53,46},{53,52},{56,52}}, color={0,0,127}));
      connect(dtheta_TCV731_act.numberPort, switch_dthetaTCV731.y) annotation (Line(points={{73.5,56},{67.5,56}}, color={0,0,127}));
      connect(bool_dthetaFCVR01.y, switch_dthetaFCVR01.u2) annotation (Line(points={{49.5,23},{56,23}}, color={255,0,255}));
      connect(dthetaFCVR01_var.y, switch_dthetaFCVR01.u1) annotation (Line(points={{49.5,32},{53,32},{53,27},{56,27}}, color={0,0,127}));
      connect(dthetaFCVR01.y, switch_dthetaFCVR01.u3) annotation (Line(points={{49.5,13},{53,13},{53,19},{56,19}}, color={0,0,127}));
      connect(dtheta_TCV731_act1.numberPort, switch_dthetaFCVR01.y) annotation (Line(points={{73.5,23},{67.5,23}}, color={0,0,127}));
      connect(bool_dToutRR01.y, switch_dToutRR01.u2) annotation (Line(points={{49.5,-10},{56,-10}}, color={255,0,255}));
      connect(dToutRR01_var.y, switch_dToutRR01.u1) annotation (Line(points={{49.5,-1},{53,-1},{53,-6},{56,-6}}, color={0,0,127}));
      connect(dTout_RR01_act.numberPort, switch_dToutRR01.y) annotation (Line(points={{73.5,-10},{67.5,-10}}, color={0,0,127}));
      connect(dToutRR01.y, switch_dToutRR01.u3) annotation (Line(points={{49.5,-20},{53,-20},{53,-14},{56,-14}}, color={0,0,127}));
      connect(domegaP501_var.y, switch_domegaP501.u1) annotation (Line(points={{-40.5,-105},{-37,-105},{-37,-111},{-33,-111}}, color={0,0,127}));
      connect(bool_domegaP501.y, switch_domegaP501.u2) annotation (Line(points={{-40.5,-115},{-33,-115}}, color={255,0,255}));
      connect(domegaP501.y, switch_domegaP501.u3) annotation (Line(points={{-40.5,-125},{-37,-125},{-37,-119},{-33,-119}}, color={0,0,127}));
      connect(switch_domegaP501.y, domega_P501_act.numberPort) annotation (Line(points={{-21.5,-115},{-16.5,-115}}, color={0,0,127}));
      connect(bool_dToutCHP501.y, switch_dToutCHP501.u2) annotation (Line(points={{-40.5,-150},{-34,-150}}, color={255,0,255}));
      connect(dToutCHP501_var.y, switch_dToutCHP501.u1) annotation (Line(points={{-40.5,-141},{-37,-141},{-37,-146},{-34,-146}}, color={0,0,127}));
      connect(dTout_CHP501_act.numberPort, switch_dToutCHP501.y) annotation (Line(points={{-16.5,-150},{-22.5,-150}}, color={0,0,127}));
      connect(dToutCHP501.y, switch_dToutCHP501.u3) annotation (Line(points={{-40.5,-160},{-37,-160},{-37,-154},{-34,-154}}, color={0,0,127}));
      connect(switch_dthetaFCVR01.y, controlSignalBus.dthetaFCVR01)
        annotation (Line(points={{67.5,23},{70,23},{70,10},{136,10},{136,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutRR01.y, controlSignalBus.dToutRR01)
        annotation (Line(points={{67.5,-10},{70,-10},{70,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV731.y, controlSignalBus.dthetaFCV731)
        annotation (Line(points={{-21.5,56},{-19,56},{-19,50},{17,50},{17,-44},{142,-44},{142,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCVC01.y, controlSignalBus.dthetaFCVC01)
        annotation (Line(points={{-21.5,-16},{-19,-16},{-19,-30},{16,-30},{16,-45},{143,-45},{143,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCVC02.y, controlSignalBus.dthetaFCVC02)
        annotation (Line(points={{-21.5,-50},{-19,-50},{-19,-40},{15,-40},{15,-46},{144,-46},{144,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_domegaP901.y, controlSignalBus.domegaP901)
        annotation (Line(points={{-111.5,150},{-110,150},{-110,160},{-77,160},{-77,197},{149,197},{149,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dthetaFCV901.y, controlSignalBus.dthetaFCV901)
        annotation (Line(points={{-112.5,117},{-111,117},{-111,140},{-76,140},{-76,196},{148,196},{148,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutGB101.y, controlSignalBus.dToutGB101) annotation (Line(points={{-112.5,-26},{-110,-26},{-110,-10},{-77,-10},{-77,25},{23,25},{23,-37},{127,-37},{127,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutEB401.y, controlSignalBus.dToutEB401) annotation (Line(points={{-112.5,-166},{-111,-166},{-111,-150},{-68,-150},{-68,-76},{22,-76},{22,-52},{132,-52},{132,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(switch_dToutCHP501.y, controlSignalBus.dToutCHP501)
        annotation (Line(points={{-22.5,-150},{-21,-150},{-21,-140},{24,-140},{24,-54},{134,-54},{134,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT101.controlAction, sR_FT101.U) annotation (Line(points={{60.5,-115},{72,-115}}, color={0,0,127}));
      connect(dFT101SP_var.y, PI_FT101.REF) annotation (Line(points={{40.5,-110},{46,-110},{46,-113},{51,-113}},
                                                                                             color={0,0,127}));
      connect(processVariableBus.dFT101, PI_FT101.FeedBack) annotation (Line(
          points={{-170,-2},{-162,-2},{-162,1},{-155,1},{-155,-196},{19,-196},{19,-117},{51,-117}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(sR_FT101.Yout1, controlSignalBus.domegaP101) annotation (Line(points={{88,-111},{146,-111},{146,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(PI_FT401.controlAction, sR_FT401.U) annotation (Line(points={{60.5,-150},{72,-150}}, color={0,0,127}));
      connect(dFT401SP_var.y, PI_FT401.REF) annotation (Line(points={{40.5,-140},{45,-140},{45,-148},{51,-148}}, color={0,0,127}));
      connect(processVariableBus.dFT401, PI_FT401.FeedBack) annotation (Line(
          points={{-170,-2},{-162,-2},{-162,1},{-153,1},{-153,-197},{21,-197},{21,-152},{51,-152}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(sR_FT401.Yout1, controlSignalBus.domegaP401) annotation (Line(points={{88,-146},{148,-146},{148,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT701SP_var.y, PI_FT701.REF) annotation (Line(points={{40.5,-185},{44,-185},{44,-188},{51,-188}}, color={0,0,127}));
      connect(PI_FT701.controlAction, controlSignalBus.dthetaFCV701)
        annotation (Line(points={{60.5,-190},{153,-190},{153,0},{160,0}},             color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dFT701, PI_FT701.FeedBack) annotation (Line(
          points={{-170,-2},{-157,-2},{-157,-200},{25,-200},{25,-192},{51,-192}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dFT501SP_var.y, PI_FT501.REF) annotation (Line(points={{40.5,-168},{46,-168},{46,-170},{51,-170}}, color={0,0,127}));
      connect(processVariableBus.dFT501, PI_FT501.FeedBack) annotation (Line(
          points={{-170,-2},{-156,-2},{-156,-198},{22,-198},{22,-174},{51,-174}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_FT501.controlAction, controlSignalBus.domegaP501)
        annotation (Line(points={{60.5,-172},{150,-172},{150,-86},{160,-86},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT711SP_var.y, PI_FT711.REF) annotation (Line(points={{40.5,-200},{44,-200},{44,-203},{51,-203}}, color={0,0,127}));
      connect(processVariableBus.dFT711, PI_FT711.FeedBack)
        annotation (Line(
          points={{-170,-2},{-170,-207},{51,-207}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_FT711.controlAction, controlSignalBus.dthetaFCV711)
        annotation (Line(points={{60.5,-205},{160,-205},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dFT721SP_var.y, PI_FT721.REF) annotation (Line(points={{40.5,-214},{44,-214},{44,-218},{51,-218}}, color={0,0,127}));
      connect(PI_FT721.controlAction, controlSignalBus.dthetaFCV721)
        annotation (Line(points={{60.5,-220},{160,-220},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dFT721, PI_FT721.FeedBack) annotation (Line(
          points={{-170,-2},{-172,-2},{-172,-211},{24,-211},{24,-222},{51,-222}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dTT701SP_var.y, PI_TT701.REF) annotation (Line(points={{40.5,-246},{45,-246},{45,-249},{51,-249}}, color={0,0,127}));
      connect(processVariableBus.dTT701, PI_TT701.FeedBack)
        annotation (Line(
          points={{-170,-2},{-170,-253},{51,-253}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_TT701.controlAction, controlSignalBus.dthetaTCV701)
        annotation (Line(points={{60.5,-251},{160,-251},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT711SP_var.y, PI_TT711.REF) annotation (Line(points={{40.5,-260},{45,-260},{45,-263},{51,-263}}, color={0,0,127}));
      connect(PI_TT711.controlAction, controlSignalBus.dthetaTCV711)
        annotation (Line(points={{60.5,-265},{160,-265},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(processVariableBus.dTT711, PI_TT711.FeedBack)
        annotation (Line(
          points={{-170,-2},{-170,-267},{51,-267}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(dTT721SP_var.y, PI_TT721.REF) annotation (Line(points={{40.5,-275},{45,-275},{45,-278},{51,-278}}, color={0,0,127}));
      connect(processVariableBus.dTT721, PI_TT721.FeedBack)
        annotation (Line(
          points={{-170,-2},{-170,-282},{51,-282}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_TT721.controlAction, controlSignalBus.dthetaTCV721)
        annotation (Line(points={{60.5,-280},{160,-280},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(dTT731SP_var.y, PI_TT731.REF) annotation (Line(points={{40.5,-290},{45,-290},{45,-293},{51,-293}}, color={0,0,127}));
      connect(processVariableBus.dTT731, PI_TT731.FeedBack)
        annotation (Line(
          points={{-170,-2},{-170,-297},{51,-297}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(PI_TT731.controlAction, controlSignalBus.dthetaTCV731)
        annotation (Line(points={{60.5,-295},{160,-295},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(sR_FT101.Yout2, controlSignalBus.dthetaFCV101)
        annotation (Line(points={{88,-119},{147,-119},{147,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      connect(sR_FT401.Yout2, controlSignalBus.dthetaFCV401)
        annotation (Line(points={{88,-154},{149,-154},{149,0},{160,0}}, color={0,0,127}), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}},
          horizontalAlignment=TextAlignment.Left));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {175, 175, 175}, fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-100, 100}, {100, -100}}, radius = 25), Text(extent={{-70,100},
                  {70,-100}},                                                                                                                                                                                                        textColor={0,0,0},     textStyle={
                  TextStyle.Bold},
              textString="PID
Control
System")}),
        Diagram(coordinateSystem(
            extent={{-160,-200},{160,200}}, grid={1,1}), graphics={Rectangle(
              extent={{-60,-80},{10,-170}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),                           Rectangle(
              extent={{-150,190},{-80,90}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,190},{-85,170}},
              textString="S900",
              textColor={0,0,0}),                                  Rectangle(
              extent={{-150,80},{-80,-50}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,80},{-85,60}},
              textColor={0,0,0},
              textString="S100"),                                  Rectangle(
              extent={{-150,-60},{-80,-190}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-145,-60},{-85,-80}},
              textColor={0,0,0},
              textString="S400"),                                  Rectangle(
              extent={{-60,190},{10,30}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-55,190},{5,170}},
              textColor={0,0,0},
              textString="S700"),                                  Rectangle(
              extent={{-60,20},{10,-70}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-56,18},{4,-2}},
              textColor={0,0,0},
              textString="RACK"),                                  Rectangle(
              extent={{30,190},{100,-30}},
              fillColor={255,200,160},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{34,190},{94,170}},
              textColor={0,0,0},
              textString="RR00"),        Text(
              extent={{-55,-79},{5,-99}},
              textColor={0,0,0},
              textString="S500")}));
    end FullPlantController_D;

    model TestOpenLoopActuator
      extends Modelica.Icons.Example;
      replaceable OpenLoopActuator thermalPlantController  annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CentralisedSystemGBEBCHP_InitForward centralisedSystemI_B_InitForward(
        thetaFCVC01Offset(fixInput=false, fixOffset=true),
        thetaFCVC02Offset(fixInput=false, fixOffset=true),
        thetaFCV901Offset(fixInput=false, fixOffset=true),
        thetaFCV101Offset(fixInput=false, fixOffset=true),
        thetaFCV401Offset(fixInput=false, fixOffset=true),
        omegaP901Offset(fixInput=false, fixOffset=true),
        omegaP101Offset(fixInput=false, fixOffset=true),
        omegaP401Offset(fixInput=false, fixOffset=true),
        omegaP501Offset(fixInput=false, fixOffset=true))                      annotation (
        Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
    equation
      connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
        Line(points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
                                          color = {255, 204, 51}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(
          StopTime=10000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end TestOpenLoopActuator;

    model TestActuator
      extends Modelica.Icons.Example;
      replaceable ThermalPlantController thermalPlantController  annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CentralisedSystemCoolingSimplifiedI_B_InitForward centralisedSystemI_B_InitForward(
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

    model TestCoolingPlantController
      extends Modelica.Icons.Example;
      replaceable CoolingPlantController coolingPlantController annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CoolingSystemI_InitForward coolingSystem(
        TT704Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
        TT714Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
        TT724Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
        TT734Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
        EX701PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX711PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX721PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX731PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        dFTR01Offset(fixOffset = true, y_Offset_fixed = 5),
        mflowEX701Offset(u_start = 0.5),
        mflowEX711Offset(u_start = 0.5)) annotation (Placement(transformation(origin={-1,0}, extent={{11,-38},{55,38}})));
      inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(coolingSystem.processVariableBus, coolingPlantController.processVariableBus)
        annotation (Line(
          points={{51.36,0},{66,0},{66,-48},{-66,-48},{-66,-0.38},{-48.02,-0.38}},
          color={255,204,51},
          thickness=0.5));
      connect(coolingPlantController.controlSignalBus, coolingSystem.controlSignalBus) annotation (Line(
          points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
          color={255,204,51},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(
          StopTime=4000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end TestCoolingPlantController;

    model TestFullPlantController
      extends Modelica.Icons.Example;
      replaceable FullPlantController thermalPlantController                               annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CentralisedSystemGBEB_InitForward centralisedSystemI_B_InitForward(
        m_flowcool_nom = 0.35,
        dTT701Offset(fixOffset = true, y_Offset_fixed = 20),
        dTT711Offset(fixOffset = true, y_Offset_fixed = 20),
        dTT721Offset(fixOffset = true, y_Offset_fixed = 20),
        dTT731Offset(fixOffset = true, y_Offset_fixed = 20),
        FT901Offset(fixOffset = true, y_Offset_fixed = 7.6222224),
        FT101Offset(fixOffset = true, y_Offset_fixed = 5.7166667),
        EX701PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX711PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX721PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        EX731PtOffset(fixOffset = true, y_Offset_fixed = 50e3),
        thetaFCVC01Offset(fixInput=false, fixOffset=true),
        thetaFCVC02Offset(fixInput=false, fixOffset=true),
        thetaFCVR01Offset(fixInput=false, fixOffset=true),
        thetaFCV101Offset(fixInput=false, fixOffset=true),
        thetaFCV401Offset(fixInput=false, fixOffset=true),
        omegaP401Offset(fixInput=false, fixOffset=true))   annotation (
        Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
        //PT102Offset(fixOffset = true, y_Offset_fixed = 0.0e5),
        //dPTA2Offset(fixOffset = true, y_Offset_fixed = 1.5e5),
        //TT701Offset(fixOffset = true, y_Offset_fixed = 65 + 273.15),
    //     TT711Offset(fixOffset = true, y_Offset_fixed = 65 + 273.15),
    //     TT721Offset(fixOffset = true, y_Offset_fixed = 65 + 273.15),
        //TT731Offset(fixOffset = true, y_Offset_fixed = 65 + 273.15),
    //     TT704Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
    //     TT714Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
    //     TT724Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
    //     TT734Offset(fixOffset = true, y_Offset_fixed = 30 + 273.15),
        //FT401Offset(fixOffset = true, y_Offset_fixed = 3.2666667),

    equation
      connect(centralisedSystemI_B_InitForward.processVariableBus, thermalPlantController.processVariableBus) annotation (
        Line(points={{51.36,0},{66,0},{66,-48},{-66,-48},{-66,-0.38},{-48.02,-0.38}},color = {255, 204, 51}, thickness = 0.5));
      connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
        Line(points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
                                          color = {255, 204, 51}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
    end TestFullPlantController;

    model TestFullPlantController_B
      extends TestFullPlantController(redeclare FullPlantController_B
        thermalPlantController(
          const(k=(kappa - 1)/1),
          Kp_PtEX701=Kp_PtEX701,
          Ti_PtEX701=Ti_PtEX701,
          Kp_PtEX711=Kp_PtEX711,
          Ti_PtEX711=Ti_PtEX711,
          Kp_PtEX721=Kp_PtEX721,
          Ti_PtEX721=Ti_PtEX721,
          Kp_PtEX731=Kp_PtEX731,
          Ti_PtEX731=Ti_PtEX731),
        centralisedSystemI_B_InitForward(
          thetaTCV701Offset(u_start=kappa),
          thetaTCV711Offset(u_start=kappa),
          thetaTCV721Offset(u_start=kappa),
          thetaTCV731Offset(u_start=kappa),
          TT701Offset(fixOffset=true),
          TT711Offset(fixOffset=true),
          TT721Offset(fixOffset=true),
          TT731Offset(fixOffset=true),
          RR101_Status(table={1.5e3}, startValue=false)));
      parameter Real kappa = 0.3;
      parameter Real Kp_PtEX701 = 0.0002508; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_PtEX701 = 0.01;
      parameter Real Kp_PtEX711 = 0.001018; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_PtEX711 = 0.01;
      parameter Real Kp_PtEX721 = 0.00039312; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX721 = 0.01;
      parameter Real Kp_PtEX731 = 0.0001; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX731 = 0.01;
      annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
    end TestFullPlantController_B;

    model TestFullPlantController_C
      extends TestFullPlantController(redeclare FullPlantController_C
        thermalPlantController(
          const(k=(kappa - 1)/1),
          consthot(k=(kappa_hot-1)/1),
          Kp_PtEX701=Kp_PtEX701,
          Ti_PtEX701=Ti_PtEX701,
          Kp_PtEX711=Kp_PtEX711,
          Ti_PtEX711=Ti_PtEX711,
          Kp_PtEX721=Kp_PtEX721,
          Ti_PtEX721=Ti_PtEX721,
          Kp_PtEX731=Kp_PtEX731,
          Ti_PtEX731=Ti_PtEX731),
        centralisedSystemI_B_InitForward(
          thetaTCV701Offset(u_start=kappa),
          thetaTCV711Offset(u_start=kappa),
          thetaTCV721Offset(u_start=kappa),
          thetaTCV731Offset(u_start=kappa),
          TT702Offset(fixOffset=true),
          TT712Offset(fixOffset=true),
          TT722Offset(fixOffset=true),
          TT732Offset(fixOffset=true),
          thetaFCV701Offset(u_start=kappa_hot),
          thetaFCV711Offset(u_start=kappa_hot),
          thetaFCV731Offset(u_start=kappa_hot),
          thetaFCV721Offset(u_start=kappa_hot),
          RR101_Status(table={1.5e3}, startValue=false)));
      parameter Real kappa = 0.4;
      parameter Real kappa_hot = 1;
      parameter Real Kp_PtEX701 = 0.0002508; // phi = 60°, omegac = 0.12 rad/s;
      parameter Real Ti_PtEX701 = 0.01;
      parameter Real Kp_PtEX711 = 0.001018; // phi = 60°, omega = 0.11 rad/s;
      parameter Real Ti_PtEX711 = 0.01;
      parameter Real Kp_PtEX721 = 0.00039312; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX721 = 0.01;
      parameter Real Kp_PtEX731 = 0.0001; // phi = 60°, omega = 0.12 rad/s;
      parameter Real Ti_PtEX731 = 0.01;
      annotation (experiment(StopTime=10000, __Dymola_Algorithm="Dassl"));
    end TestFullPlantController_C;

    model TestFullPlantController_D
      extends Modelica.Icons.Example;
      replaceable FullPlantController_D thermalPlantController  annotation (Placement(transformation(origin={5,0}, extent={{-55,-38},{-11,38}})));
      replaceable FMUExport.Centralised.CentralisedSystemGBEBCHP_InitForward centralisedSystemI_B_InitForward(
        thetaFCVC01Offset(fixInput=false, fixOffset=true),
        thetaFCVC02Offset(fixInput=false, fixOffset=true),
        thetaFCV901Offset(fixInput=false, fixOffset=true),
        thetaFCV101Offset(fixInput=false, fixOffset=true),
        thetaFCV401Offset(fixInput=false, fixOffset=true),
        FT101Offset(fixOffset = true, y_Offset_fixed = 5.7166667),
        omegaP101Offset(fixInput=false, fixOffset=true),
        FT401Offset(fixOffset = true, y_Offset_fixed = 3.2666667),
        omegaP401Offset(fixInput=false, fixOffset=true),
        FT501Offset(fixOffset = true, y_Offset_fixed = FT501_nom, y_norm = FT501_nom),
        omegaP501Offset(fixInput=false, fixOffset=true),
        FT701Offset(fixOffset = true, y_Offset_fixed = 2, y_norm = 2),
        thetaFCV701Offset(fixInput=false, fixOffset=true),
        FT711Offset(fixOffset = true, y_Offset_fixed = 2, y_norm = 2),
        thetaFCV711Offset(fixInput=false, fixOffset=true),
        FT721Offset(fixOffset = true, y_Offset_fixed = 2, y_norm = 2),
        thetaFCV721Offset(fixInput=false, fixOffset=true),
        TT701Offset(fixOffset = true, y_Offset_fixed = 60 + 273.15, y_norm = 100 + 273.15),
        thetaTCV701Offset(fixInput=false, fixOffset=true),
        TT711Offset(fixOffset = true, y_Offset_fixed = 60 + 273.15, y_norm = 100 + 273.15),
        thetaTCV711Offset(fixInput=false, fixOffset=true),
        TT721Offset(fixOffset = true, y_Offset_fixed = 60 + 273.15, y_norm = 100 + 273.15),
        thetaTCV721Offset(fixInput=false, fixOffset=true),
        TT731Offset(fixOffset = true, y_Offset_fixed = 60 + 273.15, y_norm = 100 + 273.15),
        thetaTCV731Offset(fixInput=false, fixOffset=true),
        S500(EX501(wall(Tstart1=333.15, TstartN=343.15))))                                  annotation (
        Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));

      parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_nom= DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h*980/3600;

    equation
      connect(thermalPlantController.controlSignalBus, centralisedSystemI_B_InitForward.controlSignalBus) annotation (
        Line(points={{-7.32,0},{2,0},{2,-0.38},{12.86,-0.38}},
                                          color = {255, 204, 51}, thickness = 0.5));
      connect(centralisedSystemI_B_InitForward.processVariableBus, thermalPlantController.processVariableBus) annotation (Line(
          points={{51.36,0},{70,0},{70,-52},{-70,-52},{-70,-0.38},{-48.02,-0.38}},
          color={255,204,51},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(
          StopTime=10000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"));
    end TestFullPlantController_D;
    annotation (Icon(graphics={Bitmap(
            extent={{-80,-80},{82,80}},
            imageSource=
                "iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAAAXNSR0IArs4c6QAAH0FJREFUeF7tXWmAHFW1/k53NgIEeOBjVwRkF56AgGxJVwXZVEBZBERmqkJAFBdQwAWJqA9EERUUCVM1YUcCLsBjTVUnbA8QkIeyKIuyI4bFhCXJMH0eNZPpul3VPX2ruqq6JnX730yfe+4537lf17117z2HoD4KAYVASwRIYaMQUAi0RkARRI0OhcAoCCiCqOGhEFAEUWNAIRAPAfUEiYebalUQBBRBChJo5WY8BBRB4uGmWhUEAUWQggRauRkPATmCmM4CgGqwtEq8blQrhcDYRECSIC4PuWdpcvJjEwtltUIghIDcgDcVQdTYKSYCiiDFjLvyWhIBRRBJoJRYMRFQBClm3JXXkggogkgCpcSKiYAiSDHjrryWREARRBIoJVZMBBRBihl35bUkAoogkkApsWIioAhSzLgrryURUASRBEqJFRMBRZBixl15LYmAIogkUEqsmAgoghQz7sprSQQUQSSBUmLFREARpJhxV15LIqAIIgmUEismAoogxYy78loSAUUQSaCUWDERUAQpZtyV15IIKIJIAqXEiomAIkgx4668lkRAEUQSKCVWTAQUQYoZd+W1JAKKIJJAKbFiIqAIUsy4K68lEVAEkQRKiRUTAUWQYsZdeS2JgCKIJFBKrJgIKIIUM+7Ka0kEFEEkgVJixURAEaSYcVdeSyKgCCIJlBIrJgKKIMWMu/JaEgFFEEmglFgxEVAEKWbcldeSCCiCSAKlxIqJgCJIMeOuvJZEQBFEEiglVkwEFEGKGXfltSQCiiCSQCmxYiKgCFLMuCuvJRFQBJEESokVEwFFkGLGXXkticDYJEjvvK1QKh0NYBswP4ZS6Rr0Ve6R9FmJKQSkERh7BDGrXwH4ZyEPmWbBrnxP2nMlqBCQQGBsEcRwZoHo9FH8MmFptoTfSkQhIIXA2CFIz/w9UK7dPqpXzMvA4zZF/9TnpLxXQgqBNgiMHYIYzlMg2rjuD/MTAH0dhDkA1vD/j9mwtWNV5BUCSSAwNghiVE8H8SzB4TdRHrcZZu/5EkxnT4AWNIBB5Y3RN/XvSQCkdBQbgfwTpKc6CWV+MfCUOAm29tN66Az3QhBmCk+Xc2DrXy92aJX3SSCQf4IYzldBdK4whXoOtvb+BuePdjbBOHpSIMgLsPUNkgBI6Sg2AvkmyCFXl7Hqms+CaD0hTCfC0nzCjHxhOlcDdEhdroZp6Ncap17FjrXyPgYC+SaIWT0Q4N8JT4/FqNF/Yk5lSchXs7oPwDcJ/78QlnZcDExUE4VAHYGcE8S9FsCnBYKcB1v7ctP4zbx/PAb//QZAk5d//zo2rKyFWVRT8VYIxEUgvwSZedtqGCz/C8B4gc47ok97oKWzZoBQ4Kmw9NH3TuIip9oVAoH8EsRwjgPRBcLT43HY2pajRsVwekDUL8icDks7oxCRVE6mgkCOCeI6IGgCQU6Grf14dILcuR5o2Qt+G67C1n0dqUColK7ICOSTIMadqwJLXwdRuQ7+IK2LOZWX2wbDcJ8FYcMhOcYSLF64CuYeOti2nRJQCDRBIJ8E6XUOR4muEOx9CJb2EakIGs6VIPpsXVa97pWCTQk1RyCfBDGcK0B0uDBV+h5sXTxq0jqehnMCiH7ht1XH4NXgj49A/ggyi0t41vWmV1N8t8rbw5r6Jyk3Z7g7gHG/IHszLG1fqbZKSCEQQCB/BDGqu4P4DuHpEf3YiOG8CaKVh9ch/Apsfe0xGfled28QbwZgALXSfMypPD4m/RjDRueQIO4ZIJwmYBp9R9x07wSwW10H1dZB3/R/jpk4zXD3A/O5AHnk8D8MF6gdA3v602PGlzFuaP4IYrr/C2AXYVQcCkufGwnn4Olewv7o026MpKNbwoZzzHtnz2aP3j0fA0vv65aJReo3XwSZef9kvLvoTRB8u8qDq2P2Xv+OFBTT+RJA59Xb1Og76K/8MJKObgi3um8fsoVrAH0cluZ0w8wi9ZkvggQPJwLyr3fFqPW6U1HCfOEpNBeWfmiuA9vs4tfwGuomgP4C4AQQJtV9YF6EQWyPi/Wncu3XGDcuZwRxfwngeGEQxLv4dMQda2ClgdeE2DwJS/tQrmNluA+BsJ1A6tdAXEHf9IeH/jdj3rZguh2g1Xx88H+wtf/KtV9j3Lh8EcRwHwdhc4Eg+8HWxSPs8nAb7ksgrFNvsGjSZMzd9R15BRlKhs+QAYO0Zeit1Yx5e4FLtzZYVuMj0K9fmaG1heoqPwQJ/+oDywZWwaV7vxUrIoZ7GwjT622ptl391ziWwhQbme4TADYVfhh+BFs/tWmPhnsOCCcK3z0CS9smResKrTo/BDGcfUHkv2li/jNsfdvY0TGd8wD6kjBlif42LHbnERqazk4A3SuQ4y0sXXk9XL7LouYEGTqn9nzDRirTHrAr3qtt9UkYgfwQxHS9rIjfFebXF8HW/EQMUR0P3mUHnwZL/0FUNanLG+75IHxR6OcCWJq/DmtmgOGcBaJThK+ugKUdmbqtBewgRwRxbgVor3oMamygXxfvdkQLT2/1Eyjx9cIT5DJY+lHRlKQsPa06Dhvzv0BYXbCz/SWvGQu2BA8+Kjx1lmHcaqtg9o4DKVtcOPX5IYjhLgJh1XoEqLwV+qY+FjsiPdUtUGahPd8HS985tr40GhrzKqCSKwx0+WMxhvMwiD4sPHEPgK1dl4aZRdaZD4Ic426NGrx3/cMfxuL38l4JhxVjhGgoI8paA/VNR2/fwNb9V6QxVCbeJJwQ71xYmrgAb92l6fwAoG8LT54+WPoxidtYcIX5IIhRNUHsH51g3AJb26fj2JjOMwD5ObTydibLcFwQVfxpJfZBv3aLlN898z+Kcu0+4enzImx9fam2SkgagZwQxO0DwfSDndAdDiNwbXewtCfmTPNPCkvDlILg8BPOO1Yj7I5PmAJ798XSvQWnpeCNYOnPSLdXgm0RyAdBTNebXm0d65d0NBcNdzYI/rSDuRe27iW77v7HdL3TxuKr2adgaf5eiIyFhnM9iD7h40ZHob9ymUxTJSOHQPcJ4t0/p2WN7/yXTF6t5T6AnF/DUoZzKojOTPzJFMWGVrKmezKAHwlTpKtg6/4tSpk+DPcbIJzt60Bnr8Zl+iyYTPcJEjo+wY/B0rdKJA5G9UgQ+7+ojH7YmpGI7k6VGO5vQPAPUDJ9HXblnEhqjfkfA9XuFgiizmZFArC9cPcJYrrfBPDfgqk2LM1fj7T3obVEsOgO5ygNULDeSY119Ov+K18Zv4ezSS4BqDQszjU8VZqI+ZV3ZZormfYI5IEgVwE4TDD1i7C0X7U3XUKip7oRyuzXCWF+Gra+iUTLdEWOvGcKJr3deMcl7rQytH7jHdCvP5iuA8XR3n2CGO5jIGwhQL47LO2uREIQ3AsB3oWl+alME+kkhhLT1QHME1pGX6CPNDbdywEcIehSdRpjhKRVk+4SxDtqsUltqT9FAJD0sXTD8Q72+fsDA7wBLtH97IsJgimtyqyeAvBZwtrhatia+BSVVoXgYh+Q32yU76Wwkt0liFHdEcR/9AdKClMgw7kbRB+r91Hj3dCv+wvbboQ+WMuE0T6tais7TXd/ADcIX98IS/P+pz4JINBtgjTuoIN/D0s/KAG/fBXBt0V5uGCUxAJ9xMOeBR9CefBviUzXEgV+xVDWZYK4vwDhBOEJIp9BURZ/0/nxUDXckQ/zN2Hr/vRGVk9Sckku0D2bhhPtLavnMWYexPu1CaouSjIB6y5BTLcKYJo//cGB6Nf+kIxry7UEU5GCz4el+6RMtDMJZcEFulfO2tYb819JqGkQCb7oqNW2Rv90/zh8VH2dyg/nVp4KYEMw/xG1spObIz4RfesuQQwvxahwF4JrmySeFM1wDgLRb/0nCK6FrR0cEafkxMOL6t/A0vxk23F6Mtwb4OX+8p38FCxduAsTR2mMNob7LRC+AKBZAdUn37s5uS+sil9sNUYXWTfpHkGOuuP9mDAgHKzjt2Hpw+lCk/z0OruiROJr43tgaf6iPcm+ZHQluUAf6c8MZIOp4Svo1/wE3jJ2dSpjOL8FUbv14+vg0v6wp3nJAcfEp3sEMZ1PAuRf8GG+G7bupwtNCj5j3sagkpA7ip+BpW+UlPrIepJcoI90HjyTlfWr3uA6b1RQ+G0MljaRqvUSGdzkG3SPIMOPYzHb4a9gaeLd7GS87alOQpn9dD9eUR1bWykZ5RG19FRXR5lfb2gVJ3NksNve6sEosZ+elTOcRvZWP4cSX9pgEuMfIHwf7PlKB4Lw+YDJnU8rRYVeRv8a7QKqLUUND2L8+Jcwe8+XIkanqXj3CBKua34s+rU2OWljumw6XvVb4TbhpDVh7SomloupOGKzNBbongnB/STgAVjajhGtiyduui8CWLfe2CPH0snbNZzG7nVnooQLGzrwLor1VYTslzG69zLhgC6sVxQTVTDuBdP5nR7/7x5BgkniwDvD0v0bcjHwatkk2Fe33vKEj7hfCVsXj4nE83pmdS0MslcRePiTVckHo/pFEJ/fYPRgaSfMmeZv/o58GczewmhflHU0NAxnFohOlwDsYlhaj4Rc3p4gLjdONaasjNk7vh3XkVHbGe58ELzXjssHEO0FuyKehUql25DSNBbo/gB8p+F2oqXJ/fh14nkweyXzHNh6b1OVM6obgPm5xu/oIFiV30c2wahOB/Ft0u0Y82BrfsYc6YYQsqiP1shcPpiTAj2YpAH4Oyxt4wh2RxM13cYTw7Uu3bwLLtCTmGbUCeI8BSIfw2XjP4BL93g2GlARpMN1JAEqb4y+qf7p6aA607kIoBn+v/lSWHpwfdLeCMP5G4gacy0z/gfgJ0C0B4AdQkqYvwZb/1l75QEKSzWISpCe6joo17ybbh8HSKK6k/cwSfMHL239EijmwAQJK+VFQv7IOOjFWJg4MAMUMe5NuwnobeoFA1wCqHHi0s5hOeuiEiT4i93OiiHQ5Expq6qpgAyA8TRLtwq6GGdwjNpZ2hgGOo/bXdx29e6jKAjKjjIOWsRDblRGJ4iXmWOVlvEMGhPFZ+kROYpg1v0lYXM7HSGfUv5RiE3wgKGx9bQDJOb3AXvSIsjoz7FuEyT1J1az4GTMyiwHXid9RYElaj+hp3azicroQl0iSMozqnY/HlGBbqdP6vsoI0FKYRuhFPvrGL+4tsVo17SJtx7xxmCz4d/YIHuCxPAxieGywusIPZVjLIClQEoigDF0xCVljK5EGLIliPeaOJQwjf8ES99eKjadCI2so0Z0dFKcJ6odve7OKOEeYZ35HGzNT4kaVV8z+WPmbYZa6a9CH51txLWyKXy/JvpmZ6+zPUr0gGDrGxg3Zf1R98FC1Y8jXC02nXsB2qktzDU6BP2Va7pLkFAeXo6eMK2tp00EDPfZhiMJ7/KmmRXA7HW+gBL5mVoY18HWDojjRss2XoXgwUV+Na4kEoA36yy4l8M4DLZ2dWRfwlW1Wu9ThIu7evOjD8Oq+AnPRzPAuHM90NJvgvH5hsJDw23+DsZteJfPaJarIPsniOGeDcI3/F+PhPLwtouQ4dwHoo8K/WZXlSmUAjUln4NnzpJ+SvbO2wql0iMNUHPEfMIjjQ3nOBBdIOh6Hpa2YSiMvbe/DzTw0Hu149cTvvsDLO3AdiFv+r23RzeO1wdoPEqrPtzu9Eb2BDGd6wD6pGD8kbC0K2I5G6VRqF/OriSb6d7fsLvLSKeWh+E8AiI/K2Wptjkumi7eV4+CWFg2fAL7ZljavrGUeleFn3MfA8i/TRk8qjKc9eauxukRLwWVNkVf5flY/UZslD1BQtdDM0p0Zrq/BnCsjw+fAEtvPGgXETxp8eD6hyesD3t37xRssh/DvQXknV5Y/qlhGvq1BYl1Yrh/BME/JVxDZyewm02dmH+H2rhTUKrtCWKvkGkwoffpsLQzEvOpjaJsCbJhpdyQYMAzLulpQCuHDfcMEE4Tvj4Tlvat1IE23O1AeKjeD+MN2NoaqfRrul7m+qN93dQDq3JxIn0FDxsyGEvGr4kr9mi83xK1M8O5C0S7SjXzDh0uXrgP5h46KCWfgFC2BGFsAcLj/mDh7Iq+hBfK2SSyDtZAZ9wKW9s7gdg1mQKFjoCfAUuTORLe3pzQXXq+A5a+Z/uGbSRmzFsbtdICEDYfXZJvx+SlH8d5+y3tuM8ICrIlCODVsvCTnGWZTDqYvAGIP3+OADAM9+cgfFn4UWhdAz2K3maywWz24OQKlwbXUTU+Hv26uMiOb72XCmniWzc3JPhr1PYAFk3aA3N39W+Gxu8tUstsCcL8hcCbiwthacdFsjiucHAvAngIlvaRuOqk25nO7cDQEezhT9zXojIdhm8W3gVL212m6agywSTgnvBAbS1cMv3VjnWLCgzHO/19JMCfAagG4DowXYX+ipg5MtEu2ynLmiDngOgkYbB8G7Ymlj5oZ2/878NZVF6Dpa8ZX6FkS9N5C6DJdenB8maYM/UJydbRxELFiPifsPR1oilpIh1OVZTN07djwztXkC1BAC8/1acFs7N5xet1GM70DixaOC7VBV8oLWhKqY0af4UXgsgn/iCthDmVJR0NlfBr6qNha5d0pHOMNM6WIMwPgsg/VsKlXTPNkWQ4LzRsOKX5a+4NgBnVw8Ds3WZc/uHbYen+1d80BknoSEaEHedm9oSnVwNYNrAGLt3b37VPw4+c6MyWIID3StB/xVket15S6Vmk8DTce0DY2R+vNQ32dC/9aTofwzkLRKcIBPk5LP2r6XS2XKvhXtyQZqfJ+aJI/QfrsWeZUiiSoekIZ00QYay8l2TZ1sel41YLrYZ7DQifEYz4PCy9MadTkgYFN+4Y6U9NwuuFzl71Bp+6jINha9cmCVOedWVHkPC9lL/C1sTKUunjZDjngsj/BWek+5IgmHt4sLwt5kz9c6qOBouiejvTti6u++S7n1GdBu9VfH2GyK9i8atrp7puk7cuE8nsCBJ2J/s3IUb1JBD/RDDlAlja8akgHU5zMwCrMjFy1oCoxs28bTUMlt8Qmj0JS2vMACKr03BtEIQ0PvwTWLp/0FRWzxiW6x5BmH8NW/cygWf3MdxDQfiNMMW6Hpb+qVQMCOYeBt8HS/fXP6l0ulyp6Xr5p/wM6+UpEzB7x4FIXZ5w40S8NfFVEA0nFPeOlnD5A+ifGshtFUnrmBPOjiDhm12nwNK81EDZfUKZ3lO8rGW6333v0sL3BOey2xQNnlxule1wNOTDR2RiJ1/LLsDJ95QdQYKJEtLcUW6FU++CDVEaFJKpcXqbhabrZQz0L0V1evI1SuxN1yOmR9DhD9OXYFd+GUUFTOdBgPyTBgVbnI9glR1Bgk+QOL9qkSLcQth0vamG//YsiY20Zl2ZzjMA+ddqs/S31z0AJQgpPXkuLP1QafhMZ6f3it3c6xOseIvz7AkSjE6Z3ofZlYXSQUtK0HS9Ckeb1NVRbTv0TX84KfVDeo64Yw2sNNCYPT6ptK0yhgaTWSPikZPgsfm03/bJ+NQlmeyeIA0O8lJY+qSu+Gy4t4Ew3e87ZgLl0YwPljkAPwxL3y5Tfw3ngYZTC4O0JeZU/KsGrYwZIveylwCauFzkTSwbWKcoO+dBWLpEEDwCS9sm0wEz0pnhevUkZgp9nwhLOzdRW4IVnxjZ3D0RnTDcH4LgXwjzTlLbunercvRP+GLZ2bA04TRAOwUr1vfZECScl/YG2Lp4Lz07VA3nVBCd6XeYQtXbUG7iDK/3jjjW605FCWKBmvb7TsP3Ml70X+3yMrzL6yV+rD27aHfcUzYECZmZwqCUhSK4F+Klzbc17yJXcp9gev6sD2WOeGK6jTmSl0xeraHyU9BjwzkTRN498JFPdq+mk0M/UU3ZECT8BPkmbP2sRD2RVdYz/6Mo1/xKVsyPwta3lm3eVi5YExFcw2Bp5Y6PnLftuImA6VwC0FHCN62vF5jOB8Dw6m5MGJYfW8U248Aj0yYbgoT2QOhzsCuXyxiYuEyoXBnega35F5o67TB8filZAkaxz6juDuI76k1Gq7RkOgsAEu+YfwuWJkxFo3S84shmRJAAYEmno4kaD8N9GwS/0u0Ab9Asq15UtUPyhnsiCOf4bRO8Fx7HINP5a0PuqWZvs0zXq5Po/2AxP42nS5tjfuXdOF2uSG26QxCubQJ7+tNdAzL4CrTGOvp1NxF7DPcyEI70f7Xjlf5KxBZPiel+DcBPhafIAtjatPrfw/fYvRO7fj2XJPFIzJHuKOoOQbLcNGuGa3gQy70ClYmR6TwK0JZ10cHSnpgzzZ/myOhIUuaQu1fCqu94tfvWF55qPwfxmRgsHQDin9bfWnkCjNmwNSHBXpLGjD1d6RMkvEB/BbYuUbcwRTAN9zQQhOx8nMxNv+Orq2Ape2+O/E9aR1miwNNbPRglntu2iXcl+unSzmpq5SOVPUGyLHLfakSYziEAiRnJ2+8RtB1d3vrD2RdENwrTq+4t0IP2Go4Lr6puyw+/hvL4bTK9Ai2DaZdlukAQ/j0s/aCu+t2z4MMoD4rnr5IpQ2063wfoO8J8/yLYmrhr3z23e6qro8TXg9AkTxb/CTTuM6OWcO6e5V3tOX2CBN1jnAdb8zMNdsv9YELpJNZFoV9pTvfOexzsvHsqzPsA2BbAfSDcCEsXb1nG0brCtkmfIOHSWdlflGoWvuCp3o7vizPBqHqvj/1DmFkW6Vlhh2h3HcuAIIGCnTU+Av36ld11e2i/4gYQ9heWY4fDqgg5rCJaGEz7yfwqbH2tiFqUeM4QSJ8gwV30br/2HAlAMGcVc2dJpc3qVwD+mbD+uBa2dnDO4q3MiYhA+gQJ3SSkD2JO5R8R7Uxe3Kx+FmD/Sca4Bbbmzc3jfUznaoAOERonf4w+nmWqVQcIpE8Q0TgvM8biheNzkVepp7oFyvyYb16H99MN9xUQ3ifo2xmW7h+K7CBIqmn3EEiZIIHHB+Nl2Nq63XO3ga0Es+oVYxlf/+8grYs5lZcj22cu+Agw+KAwvVqCxQtXycUPQWRnVAMRgXQJEt5FfxC2vkNuQhBO9LwvrMrNke0zq6cA7B/fT7OKVGTjVINOEMiaIDfB1vfrxOBE2xrOBSASCvjQqbAqP4rcR3iXWq0/IoOYzwZZE2QObF1IZdllUMzqsQCL97R/C0sTkltL2HfIIxOw6stvg6hcl6byVuibKqxvJPQokVwikDVBOnuVmjSEwbUDsBCWJiy0JTqc4e4H79qu/3kelrahREslMgYQyJYgQM6mHkO73281XJ6KWlQnVKRTHRcfA+Ne2sSsCZJdyTVZCEznVoD28t9AcS9s3as3Lvcx3MdA8Ms4MH8atv47ucZKKu8IpEuQ4C46MB2W5uQKFKN6Oohn+QSBBVubIWVjsDwZ8yDGrTYFs3d8W6q9Eso9AukSJJTRvcN6eWnAGcqCCPk1RLA8WVa119PAQelsikC2BFk2cW1cutsruYrFUJqemlequVS3q1bbGv3TH21rZ7A8WY2OQn/lsrbtlMCYQSBdggRhSOLORRrQGu4dDReJGCfD1n48alc98/dAuXa7MDVbgpWXrI7z9vN259VnBUEgPYKEplcMWLpcf1mDGyx8yWjM/NHMnmCOX+YrYete+hz1WYEQkBuwI7fvZJ8Awdt6HmAeYWxNrr+sATbczUFozHxeHlwds/f6d0tTTNcrb+CXtPbulvRp/n30rH1Q/aWCgNyAXdEJ4kFruk8A2FRA2YSl2U1R73VnooQLhe9eh6X9RyoRUkq7ikB6BAmXfc7vE8QLgeHMAtHpfjRGKboZzH0F/gEs/bSuRlJ1ngoC6REkvAcCyE7RUnG1jdKe6joo115oeJuFJq+lgzmmmJdhXGn9rlTL6gZOBeszPYKE90AAqyLXX7eCYDjXg8gvhcC4HLb2uQZzQqUN1NGSboUri37lBmysNUi47nOunyBD0yz3UyD8oQH4Gu+Gfv3uof8Z7tkgfKP+PeMdlGofRN/0f2YRLNVH9ggoggQxDya29k74AgeCaRcQN+aPYu5enZPsx0ohe0yPIE0eILl/ggy9zQqUQG41LFSJgEIQJj2ChIrm5HgfJPQUcc8B4cSWI4D5LVBpF1iVvxRilBTYyRQJ0gTVPL/FCpNkPghTm44N5v1g6zcVeNwUxvUUCTIGF+li2L26GlOWHAfGl0HYaOgr5mswMOEkXLrHs4UZIQV3NEWCjPEniGi+Wd0GiyY+hbm7vlPw8VI49xVBChdy5XAUBNIhiOEymmkeS2uQKCgq2RUWgXQI0uw0rwehIsgKO5BWVMfSIYh6gqyo46VwfimCFC7kyuEoCGRDkJEqU2qKFSU2SjYHCKREEIdBTVQrguQg5MqEKAikQ5DgIn1kz1ARJEpslGwOEEiHIKFF+nKGKILkIOTKhCgIZEMQ9QSJEhMlmyME0iGI2gfJUYiVKZ0gkA5BjMAiXb3F6iRGqm0XEUiHIOoJ0sWQqq6TRCAaQWR7bpbyR64n2R6UnEKgUwTmw9Iq7ZTIDVvTrQKY1k5Z/fuRKdXIPzzCeDcMm+2NSCtVggqBBBFgzIOt+XVhWqiWI0hUu0z3KgCHDecbXd4F81Ww9cOjqlLyCoFuIpAOQYaSsPE5YOwF4hqYbkGpdrJKj9PNUKu+4yCQDkHiWKLaKARyiIAiSA6DokzKDwKKIPmJhbIkhwgoguQwKMqk/CCgCJKfWChLcoiAIkgOg6JMyg8CiiD5iYWyJIcI/D/DXaM9FpgVAgAAAABJRU5ErkJggg==",
            fileName=
                "modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/controlvar.png")}));

  end Control;
end Tests;
