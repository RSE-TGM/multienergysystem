within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model CoolingSingleLoad

  parameter Integer n = 5 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquid;

  // EX70X
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

  // Lengths of pipelines Cold Side
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
        origin={-20,20})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT702(T_start=EX701_Tin_hot,
      p_start=EX701_pin_hot)
    "Temperature sensor at the inlet of EX701 - hot side" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,80})));
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
  DistrictHeatingNetwork.Sources.SourcePressure VER3(
    use_in_T0=true,
    p0=210000,
    T0(displayUnit="K") = 7 + 273.15,
    R=0) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={43,-97})));
  DistrictHeatingNetwork.Sources.SinkMassFlow
                       FT703(
    use_in_m_flow=true,
    pin_start=200000,
    p0=200000,
    T0=288.15) annotation (Placement(transformation(extent={{-36,-88},{-56,-108}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,150},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-25,80},     extent={{-5,-5},
            {5,5}},                                                                                                                                                                       rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,150},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={25,80},     extent={{-5,-5},
            {5,5}},                                                                                                                                                                    rotation = 0)));
  Modelica.Blocks.Sources.RealExpression mflowcoolSP(y=m_flow_cool_SP)
    annotation (Placement(transformation(extent={{-80,-122},{-60,-102}})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-20,120})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={20,120})));
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
      points={{-20,30},{-20,80}},
      color={140,56,54},
      thickness=0.5));
  connect(TT702.inlet,PT702. inlet) annotation (Line(
      points={{-20,80},{-20,88}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_TT702_SourceIn.outlet,EX701. inhot) annotation (Line(
      points={{-20,10},{-19.3,10},{-19.3,-38.75}},
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
  connect(TT703.inlet,VER3. outlet) annotation (Line(
      points={{20.4,-78},{20,-78},{20,-97},{33,-97}},
      color={140,56,54},
      thickness=0.5));
  connect(FT703.inlet,TT704. inlet) annotation (Line(
      points={{-36,-98},{-19.6,-98},{-19.6,-83}},
      color={140,56,54},
      thickness=0.5));

  connect(mflowcoolSP.y, FT703.in_m_flow) annotation (Line(points={{-59,-112},{-52,-112},{-52,-114},
          {-40,-114},{-40,-103}}, color={0,0,127}));
  connect(PT702.inlet, suddenAreaChange.outlet)
    annotation (Line(
      points={{-20,88},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange.inlet, inlet)
    annotation (Line(
      points={{-20,130},{-20,150}},
      color={140,56,54},
      thickness=0.5));
  connect(PT701.inlet, suddenAreaChange1.outlet)
    annotation (Line(
      points={{20,94},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(suddenAreaChange1.inlet, outlet)
    annotation (Line(
      points={{20,130},{20,150}},
      color={140,56,54},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-100,-160},{100,160}})), Icon(coordinateSystem(grid=
           {1,1}),                                                            graphics={              Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern=
              FillPattern.Solid,                                                                                                                                                                         lineThickness = 0.5, extent={{-60,80},
              {60,-82}},                                                                                                                                                                                                        radius=15),                                                                                                                                    Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-40,44},
              {40,-36}}),
        Text(
          extent={{-100,-80},{100,-120}},
          textColor={140,56,54},
          textString="%name"),
        Bitmap(
          extent={{-70,-55},{70,60}},
          imageSource=
              "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61R20a6sRiAA/IUZWABUw7AkNydZvxph++67b66++uo0N1flYkOAUs2ZMycHH3xwnn766WpF3p7koCQvVysQAMzAAqBoe6byy05VmlcTJ07MjTfeqHkFdBi77LJL5s2blyFDhlQrclSS/0rSu1qBAKCBBUCRDkhl59U6RQc1NjbmvPPOy4UXXpjOnTsXHQfQrmyyySa59957M3r06GpF7pzkriT9qhUIQMdmBhYARTk8yZVJmooO6tatW6655pqMH1+Viw0B2qUuXbrkM5/5TJ5++unMnz+/GpF9koxNMjPJ89UIBKDj0sACoAjHJflxqvA607t378yaNSt777130VEA7V6nTp2y//77p7GxMXfccUc1IpuT/EMqu22XViMQgI5JAwuAtnZSku+nCheFDBgwILNnz872229fdBRATdljjz2y6aab5qabbsqqVauKjls7lSbWrUmqNkkegI7FLYQAtKUvJzm7GkE77rhjZs6cmQ033LAacQA1adasWTnkkEOybNmyasQ9l2SfJL+uRhgAHYsGFgBt5WtJvl2NoFGjRuX666/POusUPhseoOa1tLRk9OjR+dOf/lSNuBeSfCLJvGqEAdBxuIUQgLZweqrUvDrwwANz0003aV4BvEvDhg3LXXfdlf79+1cjrjnJfybZrRphAHQcGlgAfFDfTHJGNYLGjx+f6667Ll26dKlGHEDdGDRoUO65554MHDiwGnE9U7mZcEQ1wgDoGDSwAPggTk1yZjWCJk2alJ/85CdpbHT/CMD7semmm+buu++u1sUXvZLckmTHaoQBUP80sAB4v76Y5F+rEfTNb34z5513XhoajG4E+CD69u2bO+64I7vssks14nqlcpxwaDXCAKhvfhMA4P04Mcl5qcLryLe//e187WtfKzoGoEN5+eWXM2bMmNx9993ViFuaZFSSB6sRBkB90sAC4L36QpIfpQqvIWeffXa+/OUvFx0D0CG98sor2X///TN79uxqxD2T5KNJHq1GGAD1RwMLgPfi0CRTkhQ6iKqhoSHf+973MmnSpCJjADq85cuX5+CDD86sWbOqEfdEKk2sJdUIA6C+aGAB8G7tm2RGkqYiQxoaGnL++efn2GOPLTIGgDVef/31fOpTn8rNN99cjbiHkuyRyrFCAHjXNLAAeDdGJLktSfciQxoaGnLeeeflxBNPLDIGgLd44403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"
               +
              "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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADdADc1AAACQklEQVQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB0Tf8P6x9qocOJeMwAAAAASUVORK5CYII=",
          fileName=
              "modelica://MultiEnergySystem/../../../Lavoro/6. Rapporti RdS/Figure/Heat_exchanger_with_cross..png")}));
end CoolingSingleLoad;
