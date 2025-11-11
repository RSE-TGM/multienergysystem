within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_source1_GRM_Ycontrol
  "Immission is modeled as the REMI station, considering valve opening with respect to H2 mass composition fraction."
  extends RG2i_pipes_users(
    constantFrictionFactor=false,
    massFractionDynamicBalance=true,
    valveLinearOpening(m_flow_nom=0.4138, A_v=2*0.4138/(sqrt(40.17625*(60 -
          4.93)*1e5))),
    X_start={1,0},
    break connect(GRM_1.inlet, s21.outlet),
    GRM_1(massflowratedemand=[0,0.0443; 840,0.0443; 900,0.0441; 1740,0.0441;
          1800,0.0558; 2640,0.0558; 2700,0.0552; 3540,0.0552; 3600,0.0445; 4440,
          0.0445; 4500,0.0552; 5340,0.0552; 5400,0.056; 6240,0.056; 6300,0.0443;
          7140,0.0443; 7200,0.0441; 8040,0.0441; 8100,0.0447; 8940,0.0447; 9000,
          0.0441; 9840,0.0441; 9900,0.0556; 10740,0.0556; 10800,0.0449; 11640,
          0.0449; 11700,0.0328; 12540,0.0328; 12600,0.0443; 13440,0.0443; 13500,
          0.0449; 14340,0.0449; 14400,0.0441; 15240,0.0441; 15300,0.0445; 16140,
          0.0445; 16200,0.0447; 17040,0.0447; 17100,0.0441; 17940,0.0441; 18000,
          0.0447; 18840,0.0447; 18900,0.0443; 19740,0.0443; 19800,0.0554; 20640,
          0.0554; 20700,0.0554; 21540,0.0554; 21600,0.0556; 22440,0.0556; 22500,
          0.0552; 23340,0.0552; 23400,0.0665; 24240,0.0665; 24300,0.0771; 25140,
          0.0771; 25200,0.0663; 26040,0.0663; 26100,0.0882; 26940,0.0882; 27000,
          0.0775; 27840,0.0775; 27900,0.0771; 28740,0.0771; 28800,0.0882; 29640,
          0.0882; 29700,0.0771; 30540,0.0771; 30600,0.0773; 31440,0.0773; 31500,
          0.0882; 32340,0.0882; 32400,0.0775; 33240,0.0775; 33300,0.0775; 34140,
          0.0775; 34200,0.0663; 35040,0.0663; 35100,0.0667; 35940,0.0667; 36000,
          0.0663; 36840,0.0663; 36900,0.0558; 37740,0.0558; 37800,0.0554; 38640,
          0.0554; 38700,0.056; 39540,0.056; 39600,0.0441; 40440,0.0441; 40500,
          0.0562; 41340,0.0562; 41400,0.0334; 42240,0.0334; 42300,0.0332; 43140,
          0.0332; 43200,0.0449; 44040,0.0449; 44100,0.0336; 44940,0.0336; 45000,
          0.0332; 45840,0.0332; 45900,0.0449; 46740,0.0449; 46800,0.0223; 47640,
          0.0223; 47700,0.0332; 48540,0.0332; 48600,0.0447; 49440,0.0447; 49500,
          0.034; 50340,0.034; 50400,0.022; 51240,0.022; 51300,0.0334; 52140,
          0.0334; 52200,0.0453; 53040,0.0453; 53100,0.0222; 53940,0.0222; 54000,
          0.0334; 54840,0.0334; 54900,0.0336; 55740,0.0336; 55800,0.0338; 56640,
          0.0338; 56700,0.0332; 57540,0.0332; 57600,0.0336; 58440,0.0336; 58500,
          0.0338; 59340,0.0338; 59400,0.0334; 60240,0.0334; 60300,0.0334; 61140,
          0.0334; 61200,0.0338; 62040,0.0338; 62100,0.0441; 62940,0.0441; 63000,
          0.0336; 63840,0.0336; 63900,0.0445; 64740,0.0445; 64800,0.0332; 65640,
          0.0332; 65700,0.0447; 66540,0.0447; 66600,0.0443; 67440,0.0443; 67500,
          0.0443; 68340,0.0443; 68400,0.0445; 69240,0.0445; 69300,0.0554; 70140,
          0.0554; 70200,0.0447; 71040,0.0447; 71100,0.0548; 71940,0.0548; 72000,
          0.056; 72840,0.056; 72900,0.0439; 73740,0.0439; 73800,0.0556; 74640,
          0.0556; 74700,0.0554; 75540,0.0554; 75600,0.0445; 76440,0.0445; 76500,
          0.0556; 77340,0.0556; 77400,0.0548; 78240,0.0548; 78300,0.0445; 79140,
          0.0445; 79200,0.056; 80040,0.056; 80100,0.0439; 80940,0.0439; 81000,
          0.056; 81840,0.056; 81900,0.0443; 82740,0.0443; 82800,0.0441; 83640,
          0.0441; 83700,0.0449; 84540,0.0449; 84600,0.0441; 85440,0.0441; 85500,
          0.0443; 86340,0.0443; 86400,0.056; 87240,0.056; 90000,0.056]));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(
    n=nV,
    H=Data.PipelineData_2i.s3.h,
    cm=Data.PipelineData_2i.s3.cm,
    rhom=Data.PipelineData_2i.s3.rhom,
    lambdam=Data.PipelineData_2i.s3.lambdam,
    m_flow_start=Data.PipelineData_2i.s3.m_flow_start,
    pin_start=Data.PipelineData_2i.s3.pin_start,
    pout_start=Data.PipelineData_2i.s3.pout_start,
    kappa=Data.PipelineData_2i.s3.kappa,
    k=Data.PipelineData_2i.s3.k,
    redeclare model Gas = Medium,
    L=Data.PipelineData_2i.s3.L,
    X_start=X_start,
    Di=Data.PipelineData_2i.s3.Di,
    massFractionDynamicBalance=massFractionDynamicBalance,
    constantFrictionFactor=constantFrictionFactor,
    computeInertialTerm=computeInertialTerm,
    hctype=hctype,
    momentum=momentum,
    rho_nom=rho_nom) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-172,-44})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening vlave_immissione(
    m_flow_nom=0.4138,
    A_v=0.1*0.4138/(sqrt(40.17625*(60 - 4.93)*1e5)),
    redeclare model Medium = Medium,
    pin_start=6000000,
    Tin_start=288.15,
    Tout_start=288.15,
    X_start={0,1},
    PressureDropLinear=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-106,-44})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure Immissione(
    p0=6000000,
    redeclare model Medium = Medium,
    T0=288.15,
    X0={0,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-72,-44})));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.93*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-161,4},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Blocks.Sources.Ramp SG_ref(
    offset=0,
    height=0.1,
    duration=0,
    startTime=50)   annotation (Placement(visible=true, transformation(
        origin={-161,-70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Sensors.IdealYSensor idealYSensor(
    redeclare model Medium = Medium,
    pin_start=Data.PipelineData_2i.s21.pin_start,
    pout_start=Data.PipelineData_2i.s21.pin_start,
    Tin_start=Data.PipelineData_2i.s21.Tin_start,
    Tout_start=Data.PipelineData_2i.s21.Tin_start,
    X_start=X_start,
    p_start=Data.PipelineData_2i.s21.pin_start,
    element=2,
    m_flow_start=Data.PipelineData_2i.s21.m_flow_start)
    annotation (Placement(transformation(extent={{186,-52},{206,-32}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    k=1,
    Ti=0.7e3,
    Td=4e2,
    yMax=1,
    yMin=0)
    annotation (Placement(transformation(extent={{-132,-78},{-112,-58}})));
equation
  connect(s3.outlet, s2.outlet) annotation (Line(
      points={{-182,-44},{-198,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(Immissione.outlet, vlave_immissione.inlet) annotation (Line(
      points={{-82,-44},{-96,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(p_ref.y,aWPIDContinuous. REF) annotation (Line(points={{-150,4},{-114,
          4}},                   color={0,0,127}));
  connect(idealPressureSensor.p_meas,aWPIDContinuous. FeedBack) annotation (
      Line(points={{-135.8,18.6},{-135.8,-4},{-114,-4}},
                                 color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-95,0},{-90,0},{-90,2},{-88,2},{-88,18},{-102,18}},
        color={0,0,127}));
  connect(s3.inlet, vlave_immissione.outlet) annotation (Line(
      points={{-162,-44},{-116,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(GRM_1.inlet, idealYSensor.outlet) annotation (Line(
      points={{208,-82},{206,-82},{206,-42}},
      color={182,109,49},
      thickness=0.5));
  connect(s21.outlet, idealYSensor.inlet) annotation (Line(
      points={{182,-82},{186,-82},{186,-42}},
      color={182,109,49},
      thickness=0.5));
  connect(SG_ref.y, PID.u_s) annotation (Line(points={{-150,-70},{-142,-70},{
          -142,-68},{-134,-68}}, color={0,0,127}));
  connect(PID.y, vlave_immissione.opening) annotation (Line(points={{-111,-68},
          {-108,-68},{-108,-56},{-106,-56},{-106,-52}}, color={0,0,127}));
  connect(PID.u_m, idealYSensor.Y_meas) annotation (Line(points={{-122,-80},{
          -122,-88},{40,-88},{40,-18},{199.8,-18},{199.8,-34.6}}, color={0,0,
          127}));
  annotation (experiment(StopTime=86400, __Dymola_Algorithm="Dassl"));
end RG2i_source1_GRM_Ycontrol;
