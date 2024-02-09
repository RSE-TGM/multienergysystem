within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model CoolingSingleLoad

  parameter Integer n = 5 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquid;

  // EX701
  parameter Real EX701_q_m3h_hot = 2.5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
  parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=65 + 273.15;

  parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=
      EX701_q_m3h_cold*1000/3600;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;

  parameter Real FCV701theta[:,:] = [0, 1; 100, 1];

  parameter Real EX701q_m3h_cold[:,:] = [0, 5; 100, 5];
  parameter Real EX701_TinCold[:,:] = [0, 15+273.15; 100, 15+273.15];

  // Lengths of pipelines COLD SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;

  parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
  parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;

  parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;

  // Lengths of pipelines HOT SIDE
  parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=2.9;
  parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=2.5;
  parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
  parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool=16 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool=7 + 273.15;

  Real m_flow_cool_SP(nominal = 10);

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV701(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV701.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV701.dp_nom,
    Tin_start(displayUnit="K") = EX701_Tout_hot,
    pin_start=EX701_pout_hot,
    q_m3h_start=EX701_q_m3h_hot)  annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={20,18})));
  DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger EX701(
    redeclare model Medium = Medium,
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
    n=n,
    nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_cold,
    nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E701.nPipes_hot,
    nPlates=DistrictHeatingNetwork.Data.BPHEData.E701.nPlates,
    pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_cold,
    pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pin_start_hot,
    pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_cold,
    pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E701.pout_start_hot,
    rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_cold + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_cold)
        /2,
    rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E701.rhoin_nom_hot + DistrictHeatingNetwork.Data.BPHEData.E701.rhoout_nom_hot)
        /2,
    rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_cold,
    u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E701.u_nom_hot) annotation (
      Placement(transformation(
        extent={{17.5,29},{-17.5,-29}},
        rotation=-90,
        origin={1,-47.5})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FCV701_FT701(
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
        origin={20,46})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_SourceOut_FCV701(
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
        origin={20,-14})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT701(T_start=EX701_Tout_hot, p_start=
        FCV701_pout)
    "Flow sensor at the outlet outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,64})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT701(T_start=EX701_Tout_hot,
      p_start=FCV701_pout)
    "Temperature sensor at the outlet of EX701 - hot side" annotation (
      Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,80})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT701
    "Pressure sensor at the outlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,5},{5,-5}},
        rotation=90,
        origin={22,94})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_TT702_SourceIn(
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
        origin={-20,18})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(T_start=EX701_Tin_hot,
      p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,48})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT702
    "Pressure sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,88})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT704(T_start=Tin_start_Cool, p_start(
        displayUnit="Pa") = 2e5)
    "Temperature sensor at the outlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-22,-83})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT703(T_start=Tout_start_Cool, p_start(
        displayUnit="Pa") = 2e5)
    "Temperature sensor at the inlet of EX701 - cold side" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={18,-78})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_FT701_rackL2L3(
    L=L_FT701_rackL2L3,
    h=h_FT701_rackL2L3,
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
        origin={20,118})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL701_rackL2L3_TT702(
    L=L_rackL2L3_TT702,
    h=h_rackL2L3_TT702,
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
        origin={-20,118})));
  DistrictHeatingNetwork.Sources.SourcePressure VER3(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={43,-131})));
  DistrictHeatingNetwork.Sources.SinkMassFlow
                       FT703(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{-36,-122},{-56,-142}})));
  Modelica.Blocks.Interfaces.RealInput Pt_SP
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}}),  iconTransformation(extent={{-70,-10},
            {-50,10}})));
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(extent={{-70,20},{-50,40}}),  iconTransformation(extent={{-70,20},
            {-50,40}})));
  Modelica.Blocks.Interfaces.RealInput Tin_cool_SP
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}}),  iconTransformation(extent={{-70,-40},
            {-50,-20}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,150},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,78},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,150},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,78},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression mflowcoolSP(y=m_flow_cool_SP)
    annotation (Placement(transformation(extent={{-80,-156},{-60,-136}})));
  Modelica.Blocks.Interfaces.RealOutput Pt
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,-104}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,0})));
equation
  m_flow_cool_SP = Pt_SP/(TT704.fluid.h-TT703.fluid.h);
  Pt = EX701.Pt;

  connect(PL701_FCV701_FT701.inlet,FCV701. outlet) annotation (Line(
      points={{20,36},{20,28}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.inlet,PL701_SourceOut_FCV701. outlet) annotation (Line(
      points={{20,8},{20,-4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_SourceOut_FCV701.inlet,EX701. outhot) annotation (Line(
      points={{20,-24},{20,-38.75},{21.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FT701.inlet,PL701_FCV701_FT701. outlet) annotation (Line(
      points={{20,61},{20,56}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.inlet,TT702. inlet) annotation (Line(
      points={{-20,28},{-20,48}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-20,48},{-20,88}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{-20,8},{-19.3,8},{-19.3,-38.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet,TT701. inlet) annotation (Line(
      points={{20,94},{20,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT701.inlet,FT701. outlet) annotation (Line(
      points={{20,80},{20,67}},
      color={140,56,54},
      thickness=0.5));
  connect(EX701.outcold,TT704. inlet) annotation (Line(
      points={{-19.3,-56.25},{-19.6,-56.25},{-19.6,-83}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,EX701. incold) annotation (Line(
      points={{20.4,-78},{20.4,-58.125},{21.3,-58.125},{21.3,-56.25}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.inlet,PT701. inlet)
    annotation (Line(
      points={{20,108},{20,94}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.outlet,PT702. inlet)
    annotation (Line(
      points={{-20,108},{-20,88}},
      color={140,56,54},
      thickness=0.5));
  connect(TT703.inlet,VER3. outlet) annotation (Line(
      points={{20.4,-78},{20,-78},{20,-131},{33,-131}},
      color={140,56,54},
      thickness=0.5));
  connect(FT703.inlet,TT704. inlet) annotation (Line(
      points={{-36,-132},{-19.6,-132},{-19.6,-83}},
      color={140,56,54},
      thickness=0.5));
  connect(Tin_cool_SP, VER3.in_T0)
    annotation (Line(points={{-60,-30},{-54,-30},{-54,-106},{39,-106},{39,-122.6}},
                                                               color={0,0,127}));
  connect(theta, FCV701.opening) annotation (Line(points={{-60,30},{64,30},{64,18},{28,18}},
                                                                            color={0,0,127}));
  connect(inlet, PL701_rackL2L3_TT702.inlet)
    annotation (Line(
      points={{-20,150},{-20,128}},
      color={140,56,54},
      thickness=0.5));
  connect(outlet, PL701_FT701_rackL2L3.outlet)
    annotation (Line(
      points={{20,150},{20,128}},
      color={140,56,54},
      thickness=0.5));

  connect(mflowcoolSP.y, FT703.in_m_flow) annotation (Line(points={{-59,-146},{-52,-146},{-52,-148},
          {-40,-148},{-40,-137}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-160},{100,160}})), Icon(graphics={              Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern=
              FillPattern.Solid,                                                                                                                                                                         lineThickness = 0.5, extent={{-60,80},
              {60,-82}},                                                                                                                                                                                                        radius=0),                                                                                                                                     Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-40,44},
              {40,-36}}),
        Line(
          points={{-28,26},{-28,-22},{-18,-22},{-18,36},{-6,36},{-6,-24},{6,-24},{2,36},{14,36},{14,
              -24},{22,-24},{24,-24},{24,32}},
          color={140,56,54},
          thickness=1,
          smooth=Smooth.Bezier,
          arrow={Arrow.None,Arrow.Filled})}));
end CoolingSingleLoad;
