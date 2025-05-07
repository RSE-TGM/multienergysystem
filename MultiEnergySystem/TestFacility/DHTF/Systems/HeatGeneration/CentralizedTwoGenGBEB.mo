within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedTwoGenGBEB
  extends CentralizedOneGenGB;
  // System S400

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S400 = 1.695e5 annotation (
    Dialog(group = "S400"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S400 = 1.6e5 annotation (
    Dialog(group = "S400"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S400 = 72 + 273.15 annotation (
    Dialog(group = "S400"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S400 = 80 + 273.15 annotation (
    Dialog(group = "S400"));
  parameter Real q_m3h_start_S400(unit = "m3/h") = 5 annotation (
    Dialog(group = "S400"));

  final parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
  final parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
  final parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;

  final parameter Real nR = 5 "Total number of resistors";
  final parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";
  final parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_FCV401 = TestFacility.Data.ValveData.FCV401.openingChar "opening characteristic";
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_start_S400 = q_m3h_start_S400*985/3600;
  final parameter Real Kv_FCV401(unit = "m3/h") = TestFacility.Data.ValveData.FCV401.Kv "Metri Flow Coefficient";




  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
    set_m_flow_start=true,
    m_flow_start=m_flow_start_S400,
    redeclare model Medium = WaterHot,
    L=L_S4_rCD_hot,
    t=t_S4,
    pin_start=pout_start_S400,
    Tin_start=Tout_start_S400,
    Tout_start=Tout_start_S400,
    Di=Di_S4,
    q_m3h_start=q_m3h_start_S400,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-18,74})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
    set_m_flow_start=true,
    m_flow_start=m_flow_start_S400,
    redeclare model Medium = WaterHot,
    L=L_S4_rCD_cold,
    t=t_S4,
    pin_start=pin_start_S400,
    Tin_start=Tin_start_S400,
    Tout_start=Tin_start_S400,
    Di=Di_S4,
    q_m3h_start=q_m3h_start_S400,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-54,74})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
    redeclare model Medium = WaterHot,
    Kv=TestFacility.Data.ValveData.FCV401.Kv,
    Tin_start=Tin_start_S400,
    pin_start=pin_start_S400,
    q_m3h_start=q_m3h_start_S400)                                                                                                                                                                                                         "On-Off valve connecting inlet S400 & S900 " annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin={-54,108})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
    redeclare model Medium = WaterHot,
    Kv=TestFacility.Data.ValveData.FCV401.Kv,
    Tin_start=Tout_start_S400,
    pin_start=pout_start_S400,
    q_m3h_start=q_m3h_start_S400)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-18,108})));
  replaceable Subsystems.HeatGeneration.ElectricBoiler      S400(
    redeclare model Medium = WaterHot,
    pin_start=pin_start_S400,
    pout_start=pout_start_S400,
    Tin_start=Tin_start_S400,
    Tout_start=Tout_start_S400,
    n=n,
    hctype=hctype,
    Di_S4=Di_S4,
    t_S4=t_S4,
    cf=cf,
    q_m3h_S4=q_m3h_start_S400,
    Kv=Kv_FCV401,
    openingChar=openingChar_FCV401,
    nR=nR,
    Pmaxres=Pmaxres) annotation (Placement(transformation(extent={{-82,-50},{8,40}})));
  Modelica.Blocks.Sources.BooleanExpression FV401_Status(y=true) annotation (Placement(transformation(extent={{-92,98},{-72,118}})));
  Modelica.Blocks.Sources.BooleanExpression FV402_Status(y=true) annotation (Placement(transformation(extent={{14,98},{-6,118}})));
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(extent={{20,-290},{40,-270}}),   iconTransformation(origin={-46,150},extent={{-64,-160},{-44,-140}})));
equation
  connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (
    Line(points={{-54,84},{-54,98}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (
    Line(points={{-18,84},{-18,98}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_cold.outlet,S400. inlet) annotation (Line(
      points={{-54,64},{-54,56.3},{-54.55,56.3},{-54.55,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.inlet,S400. outlet) annotation (Line(
      points={{-18,64},{-18,57.3},{-18.55,57.3},{-18.55,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401.inlet, returncold) annotation (Line(
      points={{-54,118},{-54,228},{-16,228},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402.outlet, senthot) annotation (Line(
      points={{-18,118},{-18,220},{36,220},{36,282}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401_Status.y, FV401.u) annotation (Line(points={{-71,108},{-57.2,108}}, color={255,0,255}));
  connect(FV402_Status.y, FV402.u) annotation (Line(points={{-7,108},{-14.8,108}}, color={255,0,255}));
  connect(electricPortInlet, S400.inletPower) annotation (Line(
      points={{30,-280},{32,-280},{32,-264},{-94,-264},{-94,-27.5},{-86.5,-27.5}},
      color={56,93,138},
      thickness=1));
  connect(controlSignalBus.statusEB401, S400.status) annotation (Line(
      points={{-290,-2},{-290,-80},{-100,-80},{-100,-0.5},{-86.5,-0.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEB401, S400.Toutset) annotation (Line(
      points={{-290,-2},{-288,-2},{-288,-78},{-102,-78},{-102,8.5},{-86.5,8.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.thetaFCV401, S400.theta) annotation (Line(
      points={{-290,-2},{-286,-2},{-286,-76},{-104,-76},{-104,17.5},{-86.5,17.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaP401, S400.pumpset) annotation (Line(
      points={{-290,-2},{-290,-74},{-106,-74},{-106,26.5},{-86.5,26.5}},
      color={255,204,51},
      thickness=0.5));
end CentralizedTwoGenGBEB;
