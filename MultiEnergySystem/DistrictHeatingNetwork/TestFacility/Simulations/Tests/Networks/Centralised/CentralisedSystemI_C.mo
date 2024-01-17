within MultiEnergySystem.DistrictHeatingNetwork.TestFacility.Simulations.Tests.Networks.Centralised;
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

  parameter Types.Pressure pin_start_S2 = 2.1e5;
  parameter Types.Pressure pout_start_S2 = 2.5e5;
  parameter Types.Pressure pin_start_S2_pump = 1.79e5;
  parameter Types.Pressure pout_start_S2_pump = 3e5;
  final parameter Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
  final parameter Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
  parameter Types.Temperature Tin_start_S2 = 60 + 273.15;
  parameter Types.Temperature Tout_start_S2 = 60 + 273.15;
  parameter Types.Length L_S2 = 10;
  parameter Types.Length Di_S2 = 51e-3;
  parameter Types.Length t_S2 = 1.5e-3;
  parameter Real q_m3h_S2(unit = "m3/h") = 6;
  final parameter Types.VolumeFlowRate q = q_m3h_S2/3600;
  final parameter Types.MassFlowRate m_flow_S2 = q*985;
  parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
  parameter Real P201qm3h[:,:] = [0, 14.5; 100, 14.5];

  parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];


  // Pipe length
  parameter Types.Length L_S2_PL0 = 24.5;
  parameter Types.Length L_S2_PL1 = 1.7;
  parameter Types.Length L_S2_PL2 = 1.5;
  parameter Types.Length L_S2_PL3 = 2.5;
  parameter Types.Length L_S2_PL4 = 1.0;
  parameter Types.Length L_S2_PL5 = 2.8;
  parameter Types.Length L_S2_PL6 = 2.8;
  parameter Types.Length L_S2_PL7 = 2;
  parameter Types.Length L_S2_PL8 = 3;
  parameter Types.Length L_S2_PL9 = 21.5;

  parameter Types.Length L_S2_S201_S202 = 2.5;
  parameter Types.Length h_S2_S201_S202 = 0;
  parameter Types.Length L_S2_Tanks_High = 2.5;
  parameter Types.Length h_S2_Tanks_High = -2.5;
  parameter Types.Length L_S2_S201_FT201 = 1;
  parameter Types.Length h_S2_S201_FT201 = 0;
  parameter Types.Length L_S2_D201_FT201 = 2;
  parameter Types.Length h_S2_D201_FT201 = 0;

  Components.Storage.StratifiedStorage
    D201(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
    annotation (Placement(transformation(extent={{-758,-476},{-814,-364}})));
  Components.TurboMachines.ControlledPump
    P201(
    pout_start(displayUnit="Pa") = 3e5,
    Tin_start(displayUnit="K") = Pump.P201.Tin_start,
    Tout_start=Pump.P201.Tout_start,
    a=Pump.P201.a,
    b=Pump.P201.b,
    m_flow_start=m_flow_S2,
    dpnom=Pump.P201.dpnom,
    etaelec=Pump.P201.etaelec,
    etamech=Pump.P201.etamech,
    etanom=Pump.P201.etanom,
    hin_start=Pump.P201.hin_start,
    m_flow_nom=Pump.P201.m_flow_nom,
    omeganom=Pump.P201.omeganom,
    pin_start(displayUnit="Pa") = 1.8400803e5,
    headnom=Pump.P201.headnom,
    qnom_inm3h=Pump.P201.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = Pump.P201.rhonom,
    headmax=Pump.P201.headnommax,
    headmin=Pump.P201.headnommin,
    qnom_inm3h_min=Pump.P201.qnommin_inm3h,
    qnom_inm3h_max=Pump.P201.qnommax_inm3h,
    use_q_m3hr=true)                                              annotation (Placement(transformation(
        extent={{-12,12},{12,-12}},
        rotation=-90,
        origin={-790,-208})));
              Components.Storage.StratifiedStorage                                      D202(
    H=4,
    n=3,
    D=1.7,
    T_start(displayUnit="K") = 60 + 273.15,
    pin_start=pin_start_S2_tank,
    m_flow_start=m_flow_S2/2)
         annotation (Placement(transformation(extent={{-696,-476},{-640,-364}})));
  Sensors.IdealAbsoluteTemperatureSensor
    TT201(T_start=Tin_start_S2, p_start=pin_start_S2)
    "Temperature sensor at the inlet of pump 201" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-791.75,-66.75})));
  Sensors.IdealAbsolutePressureSensor                                          PT201
    "Pressure sensor at the inlet of pump 201"  annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-792,-86.5})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_TT201_FV201(
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
  Components.Valves.FlowCoefficientValve
    FCV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-850,-198})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FCV201_FV202(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_P201_FV209(
    L=L_S2_PL2,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tin_start_S2,
    Tout_start=Tin_start_S2,
    Di=Di_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-790,-240})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV209_FCV201(
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
  Sensors.IdealAbsoluteTemperatureSensor
    TT202(T_start=Tout_start_S2, p_start=pout_start_S2)
    "Temperature sensor at the outlet of System 200"         annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-748,-68})));
  Sensors.IdealAbsolutePressureSensor
    PT202 "Pressure sensor at the outlet of system S200"  annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={-748,-138})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_rCD_hot(
    L=L_S2_PL9,
    t=t_S2,
    pin_start=pout_start_S2,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2,
    n=n,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-750,-48})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D202_High(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_rCD_cold(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_High(
    L=L_S2_Tanks_High,
    h=h_S2_Tanks_High,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2,
    n=n,
    hctype=hctype)
         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-744,-412})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_D202_High(
    L=L_S2_S201_S202,
    h=h_S2_S201_S202,
    t=t_S2,
    pin_start=pout_start_S2_pump,
    Tin_start=Tout_start_S2,
    Tout_start=Tout_start_S2,
    Di=Di_S2,
    q_m3h_start=q_m3h_S2/2)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-726,-440})));
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_D202_Low(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV209_D201(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_D201_FT201(
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
  Components.Pipes.RoundPipe1DFV                                          PL_S200_FV201_P201(
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
  Components.Valves.FlowCoefficientOnOffValve
    FV202(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
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
  Components.Valves.FlowCoefficientOnOffValve
    FV201(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-790,-148})));
  Modelica.Blocks.Sources.BooleanConstant FV201_OnOff(k=FV201_state)
    annotation (Placement(transformation(extent={{-808,-154},{-796,-142}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV201_Status
    annotation (Placement(transformation(extent={{-798,-158},{-818,-138}})));
  Components.Valves.FlowCoefficientOnOffValve
    FV206(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
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
  Components.Valves.FlowCoefficientOnOffValve
    FV209(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
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
  Components.Valves.FlowCoefficientOnOffValve
    FV207(
    Kv=Valve.FCV101.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2/4)  annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=0,
        origin={-770,-254})));
  Components.Valves.FlowCoefficientOnOffValve
    FV203(
    Kv=Valve.FCV201.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV101.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S2,
    pin_start=pout_start_S2,
    q_m3h_start=q_m3h_S2)    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-750,-218})));
  Modelica.Blocks.Sources.BooleanConstant FV203_OnOff(k=FV203_state)
    annotation (Placement(transformation(extent={{-730,-224},{-741,-212}})));
  Modelica.Blocks.Interaction.Show.BooleanValue FV203_Status
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-728,-218})));
  Sensors.IdealMassFlowSensor                                          FT201(T_start=
        Tout_start_S2)
    "Flow sensor at the outlet of system S200"
    annotation (Placement(transformation(
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
  Sources.PumpInput P201_input(
    useOmega=false,            omega=P201omega, q_m3h=P201qm3h)
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
  connect(P201_input.y, P201.in_q_m3hr) annotation (Line(points={{-809,-204},{-802.26,
          -204},{-802.26,-203.2},{-795.52,-203.2}}, color={0,0,127}));
  annotation (experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end CentralisedSystemI_C;
