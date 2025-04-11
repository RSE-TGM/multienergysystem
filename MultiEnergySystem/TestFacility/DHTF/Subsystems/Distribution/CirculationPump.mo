within MultiEnergySystem.TestFacility.DHTF.Subsystems.Distribution;
model CirculationPump "S900 - Main pump"
 extends TestFacility.DHTF.Interfaces.SystemInterfaceBaseII(MultiPort(n=n));
  extends DistrictHeatingNetwork.Icons.Water.ThermalModel;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;

  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Real pumpcorrectionfactor = 1;
  parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV901.Kv "Metric Flow Coefficient";
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot "opening characteristic";
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.004 "Constant Fanning friction coefficient";

  parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length L_v = 1;
  parameter Real q_m3h_S9 = 10;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9=q_m3h_S9*990/3600;

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = 2.3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = 3.2e5;
  parameter DistrictHeatingNetwork.Types.Temperature T_hot_start = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature T_cold_start = 60 + 273.15;

  //parameter Real b[3] = {24.122662, 0.669933, -0.039537} "Head Characteristic coefficients";
  parameter Real b[3] = {23.6, 0.62, -0.0435} "Head Characteristic coefficients";

//   parameter DistrictHeatingNetwork.Types.Length L_S9_PL1 = 0.82;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL2 = 2.3;
  parameter DistrictHeatingNetwork.Types.Length h_S9_PL2 = 0.5;
//   parameter DistrictHeatingNetwork.Types.Length L_S9_PL3 = 1.5;
//   parameter DistrictHeatingNetwork.Types.Length h_S9_PL3 = 1;
//   parameter DistrictHeatingNetwork.Types.Length L_S9_PL4 = 0.65;
//   parameter DistrictHeatingNetwork.Types.Length L_rCD_H7 = 15;
  parameter DistrictHeatingNetwork.Types.Length Di_S9 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S9 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rCD = 72e-3;
  parameter DistrictHeatingNetwork.Types.Length t_rCD = 2e-3;

  parameter DistrictHeatingNetwork.Types.Length L_P901_FCV901 = 0.5 + 1.4;
  parameter DistrictHeatingNetwork.Types.Length h_P901_FCV901 = 1.4;
  parameter DistrictHeatingNetwork.Types.Length L_FCV901_PT902 = 0.6+0.3+1.3+0.1+1.1+0.2;
  parameter DistrictHeatingNetwork.Types.Length h_FCV901_PT902 = 0.9- 0.1- 0.2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_P901 = 0.3+0.25+2.3+3+0.5+7.5+1.7;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_P901 = -2.3-0.5+1.7;

  parameter DistrictHeatingNetwork.Types.Pressure p_VE901 = 2e5;
  parameter DistrictHeatingNetwork.Types.Temperature T_VE901 = T_cold_start;

  DistrictHeatingNetwork.Sources.SourcePressure VE901(redeclare model Medium = Medium, p0=p_VE901, T0(displayUnit="K") = T_VE901)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-61,-1})));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P901(
    redeclare model Medium = Medium,
    Tin_start=TestFacility.Data.PumpData.P901.Tin_start,
    Tout_start=TestFacility.Data.PumpData.P901.Tout_start,
    hin_start=TestFacility.Data.PumpData.P901.hin_start,
    pin_start=pin_start_S9,
    pout_start=pout_start_S9,
    a=TestFacility.Data.PumpData.P901.a,
    b=b,
    dpnom=TestFacility.Data.PumpData.P901.dpnom,
    etaelec=TestFacility.Data.PumpData.P901.etaelec,
    etamech=TestFacility.Data.PumpData.P901.etamech,
    etanom=TestFacility.Data.PumpData.P901.etanom,
    headnom=TestFacility.Data.PumpData.P901.headnom,
    headmax=TestFacility.Data.PumpData.P901.headnommax,
    headmin=TestFacility.Data.PumpData.P901.headnommin,
    m_flow_nom=TestFacility.Data.PumpData.P901.m_flow_nom,
    omeganom=TestFacility.Data.PumpData.P901.omeganom,
    qnom_inm3h=TestFacility.Data.PumpData.P901.qnom_inm3h,
    qnom_inm3h_min=TestFacility.Data.PumpData.P901.qnommin_inm3h,
    rhonom(displayUnit="kg/m3") = TestFacility.Data.PumpData.P901.rhonom,
    qnom_inm3h_max=TestFacility.Data.PumpData.P901.qnommax_inm3h,
    correctionfactor=pumpcorrectionfactor,
    use_in_omega=true)                                                   annotation (
    Placement(visible = true, transformation(                 extent={{-10,-10},{10,10}},      rotation=90,
        origin={20,-36})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT(
    redeclare model Medium = Medium,
    T_start=T_hot_start,
    p_start=pout_start_S9) annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={22,38})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT902 "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-3.75,4},{3.75,-4}},
        rotation=90,
        origin={22,76.25})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT902(redeclare model Medium = Medium,
    T_start=T_hot_start,                                          p_start=pout_start_S9)
    "Temperature sensor at the outlet of pump 901"       annotation (Placement(
        transformation(
        extent={{-4.25,3.75},{4.25,-3.75}},
        rotation=90,
        origin={22.25,87.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S900_P901_FCV901(
    h=h_P901_FCV901,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_P901_FCV901,
    t=t_S9,
    pin_start=pout_start_S9,
    Tin_start=T_hot_start,
    Tout_start=T_hot_start,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype,
    cf=cf)         "Pipeline connecting pump P901 and control valve FCV901"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT901(redeclare model Medium = Medium,
    T_start=T_cold_start,                                        p_start=pin_start_S9)
    "Temperature sensor at the inlet of pump 901" annotation (Placement(
        transformation(
        extent={{-4.75,-4.75},{4.75,4.75}},
        rotation=90,
        origin={-21.75,84.75})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT901
    "Pressure sensor at the outlet of pump 901" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-22,75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV  PL2_S901(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_S9_PL2,
    h=h_S9_PL2,
    t=t_S9,
    pin_start=pin_start_S9,
    Tin_start=T_cold_start,
    Tout_start=T_cold_start,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype,
    cf=cf)         annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-20,-25})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S900_rCD_P901(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_rCD_P901,
    h=h_rCD_P901,
    t=t_S9,
    pin_start=pin_start_S9,
    Tin_start=T_hot_start,
    Tout_start=T_hot_start,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    nPipes=1,
    n=n,
    hctype=hctype,
    cf=cf)         "Pipe connecting the outlet of rack CD - hot side with pump P901"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-60})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV901(
    redeclare model Medium = Medium,
    Kv=Kv,
    dp_nom(displayUnit="Pa") = TestFacility.Data.ValveData.FCV901.dp_nom,
    openingChar=openingChar,
    rho_nom=TestFacility.Data.ValveData.FCV901.rho_nom,
    q_m3h_nom=TestFacility.Data.ValveData.FCV901.q_nom_m3h,
    Tin_start(displayUnit="K") = T_hot_start,
    pin_start=pout_start_S9,
    q_m3h_start=q_m3h_S9)  annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={20,14})));

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S900_FCV901_PT902(
    h=h_FCV901_PT902,
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_FCV901_PT902,
    t=t_S9,
    pin_start=pout_start_S9,
    Tin_start=T_hot_start,
    Tout_start=T_hot_start,
    Di=Di_S9,
    q_m3h_start=q_m3h_S9,
    n=n,
    hctype=hctype,
    cf=cf)         "Pipeline connecting control valve FCV901 and pressure transmitter PT902"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,60})));
  DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange rCD_S900(D_i=Di_rCD,D_o=Di_S9)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={20,-80})));
  Modelica.Blocks.Interfaces.RealOutput Pe annotation (Placement(transformation(extent={{100,-40},{120,-20}}), iconTransformation(extent={{100,-40},{120,-20}})));
equation
  Pe = P901.W;
  connect(PT902.inlet,TT902. inlet) annotation (Line(
      points={{20.4,76.25},{20.4,86.875},{20.75,86.875},{20.75,87.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.inlet,PT901. inlet) annotation (Line(
      points={{-20,-15},{-20,75}},
      color={140,56,54},
      thickness=0.5));
  connect(PT901.inlet,TT901. inlet) annotation (Line(
      points={{-20,75},{-20,35.375},{-19.85,35.375},{-19.85,84.75}},
      color={140,56,54},
      thickness=0.5));
  connect(VE901.outlet,PT901. inlet) annotation (Line(
      points={{-51,-1},{-20,-1},{-20,75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S900_P901_FCV901.inlet, P901.outlet) annotation (Line(
      points={{20,-20},{20,-28}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV901.inlet, PL_S900_P901_FCV901.outlet) annotation (Line(
      points={{20,8},{20,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S901.outlet, outletcold) annotation (Line(
      points={{-20,-35},{-20,-88},{-22,-88},{-22,-102}},
      color={140,56,54},
      thickness=0.5));
  connect(TT902.inlet, outlethot) annotation (Line(
      points={{20.75,87.75},{20,87.75},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(TT901.inlet, inletcold) annotation (Line(
      points={{-19.85,84.75},{-20,84.75},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(P901.inlet, PL_S900_rCD_P901.outlet) annotation (Line(
      points={{20,-44},{20,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S900_FCV901_PT902.inlet, FT.outlet) annotation (Line(
      points={{20,50},{20,43.5},{20.4,43.5},{20.4,40.4}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.inlet, FCV901.outlet) annotation (Line(
      points={{20.4,35.6},{20.4,23.5},{20,23.5},{20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PT902.inlet, PL_S900_FCV901_PT902.outlet) annotation (Line(
      points={{20.4,76.25},{20.4,73.125},{20,73.125},{20,70}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S900_rCD_P901.inlet, rCD_S900.outlet) annotation (Line(
      points={{20,-70},{20,-74}},
      color={140,56,54},
      thickness=0.5));
  connect(rCD_S900.inlet, inlethot) annotation (Line(
      points={{20,-86},{20,-100},{24,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_, FT.m_flow) annotation (Line(points={{110,70},{98,70},{98,137},{32,137},{32,45},{24.4,45},{24.4,40.8}}, color={0,0,127}));
  connect(TTin, TT901.T) annotation (Line(points={{110,50},{96.5,50},{96.5,135.5},{-34.5,135.5},{-34.5,85},{-31,85},{-31,84.75},{-27.925,84.75}}, color={0,0,127}));
  connect(TTout, TT902.T) annotation (Line(points={{110,30},{95,30},{95,134},{33.5,134},{33.5,88},{30.5,88},{30.5,87.75},{27.125,87.75}}, color={0,0,127}));
  connect(PT901.p, PTin) annotation (Line(points={{-28.5,75},{-33,75},{-33,132.5},{93.5,132.5},{93.5,10},{110,10}}, color={0,0,127}));
  connect(PTout, PT902.p) annotation (Line(points={{110,-10},{101.5,-10},{101.5,-10.5},{92,-10.5},{92,131},{35,131},{35,76.25},{27.2,76.25}}, color={0,0,127}));
  connect(omega, P901.in_omega) annotation (Line(points={{-110,70},{-97,70},{-97,138.5},{7.5,138.5},{7.5,-40},{15,-40}}, color={0,0,127}));
  connect(theta, FCV901.opening) annotation (Line(points={{-110,50},{-95.5,50},{-95.5,137},{9,137},{9,14},{15.2,14}}, color={0,0,127}));
  connect(PL2_S901.wall, PL_S900_rCD_P901.wall) annotation (Line(
      points={{-15.9,-25},{0.5,-25},{0.5,-59.5},{15.9,-59.5},{15.9,-60}},
      color={255,101,98},
      thickness=0.5));
  connect(PL_S900_P901_FCV901.wall, PL_S900_rCD_P901.wall) annotation (Line(
      points={{15.9,-10},{0.5,-10},{0.5,-59.5},{15.9,-59.5},{15.9,-60}},
      color={255,101,98},
      thickness=0.5));
  connect(MultiPort, PL_S900_rCD_P901.wall) annotation (Line(
      points={{-110,-70},{1,-70},{1,-59},{0.5,-59},{0.5,-59.5},{15.9,-59.5},{15.9,-60}},
      color={255,101,98},
      thickness=0.5));
  annotation (Icon(coordinateSystem(grid={1,1}), graphics={
        Bitmap(
          extent={{-49.5,-61},{49.5,61}},
          origin={1.5,5},
          rotation=0,
          imageSource=
              "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",
          fileName=
              "modelica://MultiEnergySystem/../../../Lavoro/6. Rapporti RdS/Figure/pumpicon2.png")}),
                                                                 Diagram(coordinateSystem(extent={{-100,-120},{100,140}}, grid={0.5,0.5})));
end CirculationPump;
