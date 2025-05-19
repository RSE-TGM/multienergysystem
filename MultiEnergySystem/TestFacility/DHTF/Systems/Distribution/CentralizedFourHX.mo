within MultiEnergySystem.TestFacility.DHTF.Systems.Distribution;
model CentralizedFourHX "Base Case considering rack CD and the pipelines connecting to the loads"
  extends DistrictHeatingNetwork.Icons.Water.Distribution;
  //Fluids
  replaceable model MediumCP = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  //Constants
  constant Real pi = Modelica.Constants.pi;
  //General parameters of pipesù
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "friction factor for pipes";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter DistrictHeatingNetwork.Types.Temperature T_start_cold = T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start_hot = T_start;
  parameter DistrictHeatingNetwork.Types.Temperature T_start = 15 + 273.15;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_total = 2.5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start_Users = m_flow_total/4;
//   parameter Real rL2L3cold_mflow_start(unit = "m3/h") = 1;
//   parameter Real rL3L4cold_mflow_start(unit = "m3/h") = 1;
//   parameter Real rL5L6cold_mflow_start(unit = "m3/h") = 1;
//   parameter Real rL6L7cold_mflow_start(unit = "m3/h") = 1;
  parameter Real Kv_FCV901(unit = "m3/h") = 12 "Metri Flow Coefficient ";
  parameter DistrictHeatingNetwork.Types.Pressure dp_nom_UsersValve = 50000;
  // Rack CD
  parameter DistrictHeatingNetwork.Types.Length t_rCD = 2e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rCD = 72e-3;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD = p_VE901;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD = 1.60e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_rCD_cold = 1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_rCD_cold = 1.60e5;
  // Cold Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C1 = 10.8;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_C1 = -0.3 + 1.3;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C2 = 2.85;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C3 = 0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C4 = 0.84;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C5 = 0.65;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C6 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C7 = 1.2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_C8 = 1.0;
  // Hot Side Rack CD
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H1 = 1;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H2 = 0.6;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H3 = 2;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H4 = 1.37;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H5 = 1.4;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H6 = 1.25;
  parameter DistrictHeatingNetwork.Types.Length L_rCD_H7 = 15;
  parameter DistrictHeatingNetwork.Types.Length h_rCD_H7 = 1.8 - 0.3 - 2.2;
  // Cold Side L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_C = 4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_C = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_C = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_C = 1.8;
  parameter DistrictHeatingNetwork.Types.Length t_rL_C = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_C = 51e-3;
  // Hot side Rack L2-L3-L4-L5-L6-L7
  parameter DistrictHeatingNetwork.Types.Length L_rL2L3_rL3L4_H = 4.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL3L4_FCVC01_H = 3;
  parameter DistrictHeatingNetwork.Types.Length h_rL3L4_FCVC01_H = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_FCVC01_rL4L5_H = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_rL4L5_rL5L6_H = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL5L6_rL6L7_H = 3;
  parameter DistrictHeatingNetwork.Types.Length L_rL6L7_FCVC02_H = 1.8;
  parameter DistrictHeatingNetwork.Types.Length h_rL6L7_FCVC02_H = 1.4;
  parameter DistrictHeatingNetwork.Types.Length t_rL_H = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di_rL_H = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length Di = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length L_v = 1;
  parameter DistrictHeatingNetwork.Types.Length L_RL2L3 = 4.53;
  parameter DistrictHeatingNetwork.Types.Length L_RL3L4 = 3.02;
  parameter DistrictHeatingNetwork.Types.Length L_RL4L5 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL5L6 = 2.5;
  parameter DistrictHeatingNetwork.Types.Length L_RL6L7 = 3;
  parameter Real q_m3h_rackCold(unit = "m3/h") = q_m3h_S9;
  parameter Real q_m3h_rackHot(unit = "m3/h") = q_m3h_S9;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start = 4.04;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 1.69e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start = 3e5;
  // System S900
  parameter DistrictHeatingNetwork.Types.Pressure p_VE901 = 2.2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S9 = p_VE901;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S9 = 2.7e5;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_P901 = 2.5e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_P901 = 3.5e5;
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S9 = 17 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S9 = 17 + 273.15;
  parameter DistrictHeatingNetwork.Types.Length L_S9 = 10;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL1 = 0.82;
  //parameter DistrictHeatingNetwork.Types.Length L_S9_PL2=2.3;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL2 = 0.5;
  parameter DistrictHeatingNetwork.Types.Length h_S9_PL2 = 0.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL3 = 1.5;
  parameter DistrictHeatingNetwork.Types.Length L_S9_PL4 = 0.65;
  parameter DistrictHeatingNetwork.Types.Length Di_S9 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S9 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S9 = q_m3h_S9*985/3600;
  parameter Real q_m3h_S9(unit = "m3/h") = 14;
  // Cooling System
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users = 3e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users = 2.5e5;
  parameter Real q_m3h(unit = "m3/h") = 7*3600/1000;
  // Valves Nominal Data
  parameter Real Kv_FCVC01(unit = "m3/h") = 30.55;
  parameter Real Kv_FCVC02(unit = "m3/h") = 30.55;
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.SquareRoot "opening characteristic";
  //Pumps
  parameter Real pumpcorrectionfactor = 1;
  parameter Real b[3] = {23.6, 0.62, -0.0435} "Head Characteristic coefficients";
  parameter Real Kv(unit = "m3/h") = 33 "Metri Flow Coefficient";

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(redeclare model Medium = MediumCP, Kv = TestFacility.Data.ValveData.FCVC02.Kv, openingChar=TestFacility.Data.ValveData.FCVC02.openingChar, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot,
    pin_start=350000)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{10,10},{-10,-10}},      rotation = -90, origin={412,3})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(redeclare model Medium = MediumCP, Kv = TestFacility.Data.ValveData.FCVC01.Kv, openingChar=TestFacility.Data.ValveData.FCVC01.openingChar, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot,
    pin_start=350000)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{9,9},{-9,-9}},          rotation = -90, origin={45,5})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL3L4_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9,                                                                 redeclare model Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pin_start_Users + 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
    Placement(transformation(extent={{-11,11},{11,-11}},      rotation = 0, origin={-219,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/2,                                                                 redeclare model Medium = MediumCP, L = L_rL3L4_FCVC01_H, t = t_rL_H, pin_start = pin_start_Users - 0.01e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H,
    q_m3h_start=q_m3h_rackHot/2,                                                                                                                                                                                                        n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin={-8,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/4,                                                                   redeclare model Medium = MediumCP, L = L_rL4L5_rL5L6_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H,
    q_m3h_start=q_m3h_rackHot,                                                                                                                                                                                                        n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin={212,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/4,                                                                 redeclare model Medium = MediumCP, L = L_rL6L7_FCVC02_H, h = h_rL6L7_FCVC02_H, t = t_rL_H, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_hot, Tout_start = T_start_hot, Di = Di_rL_H, q_m3h_start = q_m3h_rackHot, n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin={372,-13})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S900_rackL2L3_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9,                                                                  redeclare model Medium = MediumCP, L = L_S9, t = t_S9, pin_start = pout_start_Users - 0.03e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_S9, q_m3h_start = q_m3h_S9, n = n, hctype = hctype) annotation (
    Placement(transformation(extent={{11,-11},{-11,11}},      rotation = 0, origin={-219,23})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL3L4_FCVC01_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/2,                                                                  redeclare model Medium = MediumCP, L = L_rL3L4_FCVC01_C, t = t_rL_C, pin_start = pout_start_Users - 0.01e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C,
    q_m3h_start=q_m3h_rackHot/2,                                                                                                                                                                                                        n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={-8,23})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL4L5_rackL5L6_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/4,                                                                    redeclare model Medium = MediumCP, L = L_rL4L5_rL5L6_C, t = t_rL_C, pin_start = pout_start_Users, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C,
    q_m3h_start=q_m3h_rackCold,                                                                                                                                                                                                        n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={210,23})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV rackL6L7_FCVC02_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_S9/4,                                                                  redeclare model Medium = MediumCP, L = L_rL6L7_FCVC02_C, t = t_rL_C, pin_start = pin_start_Users - 0.02e5, Tin_start = T_start_cold, Tout_start = T_start_cold, Di = Di_rL_C,
    q_m3h_start=q_m3h_rackCold/4,                                                                                                                                                                                                        n = n, hctype = hctype) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin={378,23})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTA12(redeclare model Medium = MediumCP, T_start = T_start_hot) "Flow sensor at the inlet of valve FCVC02" annotation (
    Placement(transformation(extent={{388,-11},{396,-19}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA20 "Pressure sensor at the inlet of valve FCVC02" annotation (
    Placement(transformation(extent={{399,-11},{407,-19}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA19 "Pressure sensor at the outlet of valve FCVC02" annotation (
    Placement(transformation(extent={{402,27},{410,35}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA08 "Pressure sensor at the inlet of valve FCVC01" annotation (
    Placement(transformation(extent={{16,-11},{24,-19}})));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PTA07 "Pressure sensor at the outlet of valve FCVC01" annotation (
    Placement(transformation(extent={{26,19},{34,27}})));
  replaceable TestFacility.DHTF.Subsystems.Distribution.CirculationPump S900(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    pumpcorrectionfactor=pumpcorrectionfactor,
    Kv=Kv,
    openingChar=openingChar,
    cf=cf,
    q_m3h_S9=q_m3h_S9,
    b=b,
    P901(pin_start=pin_start_P901))
         "Pumping Circulation System"
    annotation (Placement(transformation(extent={{-48,-48},{48,48}},
        rotation=-90,
        origin={-314,4})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL3L4(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot*3/4,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_rL2L3_rL3L4_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_rL2L3_rL3L4_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{-134,-40},{-44,50}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junctionHotFCVC01 annotation (Placement(transformation(extent={{40,-8},{50,-18}})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junctionColdFCVC01 annotation (Placement(transformation(extent={{50,18},{40,28}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL4L5(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot/2,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_FCVC01_rL4L5_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_FCVC01_rL4L5_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{82,-40},{172,50}})));
  DHTF.Subsystems.Distribution.ConnectorTypeI rackL6L7(
    redeclare model Medium = MediumCP,
    hctype=hctype,
    n=n,
    q_m3h_line_start=q_m3h_rackHot/4,
    q_m3h_load_start=q_m3h_rackHot/4,
    T_start_hot=T_start_hot,
    T_start_cold=T_start_cold,
    pin_start_hot=pin_start_Users,
    pin_start_cold=pout_start_Users - 0.02e5,
    L_inhot=L_rL5L6_rL6L7_H,
    L_outhot=0.2,
    L_incold=0.2,
    L_outcold=L_rL5L6_rL6L7_C,
    h_inhot=0,
    h_outhot=0,
    h_incold=0,
    h_outcold=0,
    t=t,
    Di=Di) annotation (Placement(transformation(extent={{250,-40},{340,50}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,170},{20,210}}), iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet[4] fluidPortInlet annotation (Placement(transformation(extent={{76,-168},{96,-148}}),  iconTransformation(extent={{90,50},{110,70}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet[4] fluidPortOutlet annotation (Placement(transformation(extent={{-14,-168},{6,-148}}),
                                                                                                                                       iconTransformation(extent={{90,-70},{110,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet returncold annotation (Placement(transformation(extent={{-422,14},{-402,34}}), iconTransformation(extent={{-110,50},{-90,70}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet senthot annotation (Placement(transformation(extent={{-422,-28},{-402,-8}}), iconTransformation(extent={{-110,-70},{-90,-50}})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junctionReturn annotation (Placement(transformation(extent={{-164,16},{-178,30}})));
  DistrictHeatingNetwork.Components.Fittings.Junction junctionSent annotation (Placement(transformation(extent={{-198,-20},{-184,-6}})));
equation
  connect(rackL6L7_FCVC02_hot.outlet, FTA12.inlet) annotation (
    Line(points={{382,-13},{388,-13},{388,-13.4},{389.6,-13.4}},          color = {140, 56, 54}, thickness = 0.5));
  connect(FTA12.outlet, PTA20.inlet) annotation (
    Line(points={{394.4,-13.4},{403,-13.4}},      color = {140, 56, 54}, thickness = 0.5));
  connect(rackL3L4_FCVC01_hot.outlet, PTA08.inlet) annotation (
    Line(points={{2,-13},{8,-13},{8,-13.4},{20,-13.4}},                 color = {140, 56, 54}, thickness = 0.5));
  connect(rackL3L4_FCVC01_hot.inlet, rackL3L4.outletHot) annotation (Line(
      points={{-18,-13},{-44,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionHotFCVC01.inoutlet, FCVC01.inlet) annotation (Line(
      points={{45,-8},{45,-4}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionHotFCVC01.inlet, PTA08.inlet) annotation (Line(
      points={{40,-13},{31,-13},{31,-13.4},{20,-13.4}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionColdFCVC01.inoutlet, FCVC01.outlet) annotation (Line(
      points={{45,18},{45,14}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA07.inlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{30,21.4},{30,23},{2,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.inletHot, junctionHotFCVC01.outlet) annotation (Line(
      points={{82,-13},{50,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_hot.inlet, rackL4L5.outletHot) annotation (Line(
      points={{202,-13},{172,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.outletCold, junctionColdFCVC01.inlet) annotation (Line(
      points={{82,23},{50,23}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionColdFCVC01.outlet, rackL3L4_FCVC01_cold.inlet) annotation (Line(
      points={{40,23},{2,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.outlet, rackL4L5.inletCold) annotation (Line(
      points={{200,23},{172,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4_FCVC01_cold.outlet, rackL3L4.inletCold) annotation (Line(
      points={{-18,23},{-44,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_hot.outlet, rackL6L7.inletHot) annotation (Line(
      points={{222,-13},{250,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5_rackL5L6_cold.inlet, rackL6L7.outletCold) annotation (Line(
      points={{220,23},{250,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_hot.inlet, rackL6L7.outletHot) annotation (Line(
      points={{362,-13},{340,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.outlet, rackL6L7.inletCold) annotation (Line(
      points={{368,23},{340,23}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7_FCVC02_cold.inlet, FCVC02.outlet) annotation (Line(
      points={{388,23},{400,23},{400,24},{412,24},{412,13}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA20.inlet, FCVC02.inlet) annotation (Line(
      points={{403,-13.4},{412,-13.4},{412,-7}},
      color={140,56,54},
      thickness=0.5));
  connect(PTA19.inlet, FCVC02.outlet) annotation (Line(
      points={{406,29.4},{406,24},{412,24},{412,13}},
      color={140,56,54},
      thickness=0.5));
  connect(S900_rackL2L3_cold.outlet, S900.inletcold) annotation (Line(
      points={{-230,23},{-241.175,23},{-241.175,22.72},{-258.8,22.72}},
      color={140,56,54},
      thickness=0.5));
  connect(controlSignalBus.thetaFCV901, S900.theta) annotation (Line(
      points={{0,190},{-2,190},{-2,168},{-290,168},{-290,56.8}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaP901, S900.pumpset) annotation (Line(
      points={{0,190},{-2,190},{-2,162},{-280.4,162},{-280.4,56.8}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.thetaFCVC01, FCVC01.opening) annotation (Line(
      points={{0,190},{0,164},{24,164},{24,5},{37.8,5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.thetaFCVC02, FCVC02.opening) annotation (Line(
      points={{0,190},{0,168},{396,168},{396,3},{404,3}},
      color={255,204,51},
      thickness=0.5));
  connect(rackL6L7.inletComp, fluidPortInlet[4]) annotation (Line(
      points={{317.5,-40},{317.5,-86},{318,-86},{318,-144},{86,-144},{86,-154.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.inletComp, fluidPortInlet[3]) annotation (Line(
      points={{149.5,-40},{149.5,-84},{150,-84},{150,-122},{86,-122},{86,-156.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4.inletComp, fluidPortInlet[2]) annotation (Line(
      points={{-66.5,-40},{-66.5,-108},{84,-108},{84,-134},{86,-134},{86,-159.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL3L4.outletComp, fluidPortOutlet[2]) annotation (Line(
      points={{-111.5,-40},{-111.5,-80},{-112,-80},{-112,-112},{-4,-112},{-4,-159.25}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.outletComp, fluidPortOutlet[3]) annotation (Line(
      points={{104.5,-40},{104.5,-66},{104,-66},{104,-118},{-4,-118},{-4,-156.75}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7.outletComp, fluidPortOutlet[4]) annotation (Line(
      points={{272.5,-40},{272.5,-140},{-4,-140},{-4,-154.25}},
      color={140,56,54},
      thickness=0.5));
  connect(S900.outletcold, returncold) annotation (Line(
      points={{-369.2,22.72},{-369.2,20},{-392,20},{-392,24},{-412,24}},
      color={140,56,54},
      thickness=0.5));
  connect(S900.inlethot, senthot) annotation (Line(
      points={{-369.2,-14.72},{-390.825,-14.72},{-390.825,-18},{-412,-18}},
      color={140,56,54},
      thickness=0.5));
  connect(S900_rackL3L4_hot.inlet, S900.outlethot) annotation (Line(
      points={{-230,-13},{-258.8,-13},{-258.8,-14.72}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionReturn.outlet, S900_rackL2L3_cold.inlet) annotation (Line(
      points={{-178,23},{-208,23}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionReturn.inlet, rackL3L4.outletCold) annotation (Line(
      points={{-164,23},{-134,23}},
      color={140,56,54},
      thickness=0.5));
  connect(fluidPortInlet[1], junctionReturn.inoutlet) annotation (Line(
      points={{86,-161.75},{84,-161.75},{84,-130},{-171,-130},{-171,16}},
      color={140,56,54},
      thickness=0.5));
  connect(S900_rackL3L4_hot.outlet, junctionSent.inlet) annotation (Line(
      points={{-208,-13},{-198,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionSent.outlet, rackL3L4.inletHot) annotation (Line(
      points={{-184,-13},{-134,-13}},
      color={140,56,54},
      thickness=0.5));
  connect(junctionSent.inoutlet, fluidPortOutlet[1]) annotation (Line(
      points={{-191,-20},{-190,-20},{-190,-138},{-10,-138},{-10,-161.75},{-4,-161.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-420,-200},{420,200}})),
    Icon(coordinateSystem(grid={1,1})),
    experiment(StopTime = 500, __Dymola_Algorithm = "Dassl"));
end CentralizedFourHX;
