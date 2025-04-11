within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
model CoolingSingleLoadPowerControl "S900 - Load model including a thermal power control loop"
  extends CoolingSingleLoadBase;
  //extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
  //replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  //replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient  constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  //parameter Integer np = 5 "Number of volumes in each pipe";
  //parameter Integer nHX = 9 "Number of volumes in heat exchanger";
  //parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype= DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";

  // Flow Control Valve parameters
//   parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.Kv "Metri Flow Coefficient" annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic "opening characteristic" annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve = TestFacility.Data.ValveData.FCV701.dp_nom "Pressure drop between supply and return, as imposed by the differential pump" annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter DistrictHeatingNetwork.Types.Density rho_nom_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Nominal fluid density at supply" annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter Real q_m3h_nom_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h";
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve = 20 + 273.15 annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve = 2e5 annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter DistrictHeatingNetwork.Types.Density rho_start_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Start value fluid density at the inlet" annotation (
//     Dialog(tab = "Valve", group = "FCV"));
//   parameter Real q_m3h_start_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Start value volumetric flowrate in m3/h" annotation (
//     Dialog(tab = "Valve", group = "FCV"));

  // Sudden Area Change parameters
//   parameter DistrictHeatingNetwork.Types.Length D_i = 0.1 "Input diameter" annotation (
//     Dialog(tab = "Sudden Area Change", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Types.Length D_o = 0.05 "Output diameter" annotation (
//     Dialog(tab = "Sudden Area Change", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Types.PerUnit beta_restriction = 0.5 "Attrition coefficient for a diameter restriction" annotation (
//     Dialog(tab = "Sudden Area Change", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Types.PerUnit beta_increase = 1 "Attrition coefficient for a diameter increase" annotation (
//     Dialog(tab = "Sudden Area Change", group = "Characteristics"));

  // EX7X1
//   parameter Real EX7X1_q_m3h_hot(unit = "m3/h") = 2.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_hot = EX7X1_q_m3h_hot*980/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_hot=2.5e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_hot=2.4e5;
//   parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_hot=80 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_hot=65 + 273.15;
//
//   parameter Real EX7X1_q_m3h_cold(unit = "m3/h") = 1.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX7X1_cold = EX7X1_q_m3h_cold*995/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pin_cold=2.2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX7X1_pout_cold=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tin_cold=7 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX7X1_Tout_cold=14 + 273.15;
//
//   parameter DistrictHeatingNetwork.Types.Temperature T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall" annotation (
//     Dialog(group = "Wall"));
//   parameter DistrictHeatingNetwork.Types.Temperature TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall" annotation (
//     Dialog(group = "Wall"));
//
//   parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
//   parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;
//
//   parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 4314.9346 "nominal heat transfer coefficient";
//   parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 11200.497 "nominal heat transfer coefficient";
//   parameter DistrictHeatingNetwork.Types.PerUnit alpha_hot = 0 "Exponent in the flow-dependency law";
//   parameter DistrictHeatingNetwork.Types.PerUnit alpha_cold = 0 "Exponent in the flow-dependency law";

  // Lengths of pipelines Cold Side

//   parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-1;

  // Lengths of pipelines Hot side
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=2.9;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=2.5;
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
//   parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;

//   parameter DistrictHeatingNetwork.Types.Temperature Tout_start_cold = 16 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_cold = 7 + 273.15;
  // Length of pipelines Cooling side
//   parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT7X3=1.65 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT7X3=-1.65*0.1;
//   parameter DistrictHeatingNetwork.Types.Length L_TT7X4_TCV7X1=0.65;
//   parameter DistrictHeatingNetwork.Types.Length h_TT7X4_TCV7X1=0.65;
//   parameter DistrictHeatingNetwork.Types.Length t_Users=1.5e-3;
//   parameter DistrictHeatingNetwork.Types.Length Di_Users=32e-3;

  // Temperature Control Valve parameters
//   parameter Real Kv_TCV(unit = "m3/h") = TestFacility.Data.ValveData.TCV701.Kv "Metri Flow Coefficient" annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_TCV = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Quadratic "opening characteristic" annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve_TCV = TestFacility.Data.ValveData.TCV701.dp_nom "Pressure drop between supply and return, as imposed by the differential pump" annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter DistrictHeatingNetwork.Types.Density rho_nom_valve_TCV = TestFacility.Data.ValveData.TCV701.rho_nom "Nominal fluid density at supply" annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter Real q_m3h_nom_valve_TCV(unit = "m3/h") = TestFacility.Data.ValveData.TCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h";
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve_TCV = 20 + 273.15 annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve_TCV = 2e5 annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter DistrictHeatingNetwork.Types.Density rho_start_valve_TCV = TestFacility.Data.ValveData.TCV701.rho_nom "Start value fluid density at the inlet" annotation (
//     Dialog(tab = "Valve", group = "TCV"));
//   parameter Real q_m3h_start_valve_TCV(unit = "m3/h") = TestFacility.Data.ValveData.TCV701.q_nom_m3h "Start value volumetric flowrate in m3/h" annotation (
//     Dialog(tab = "Valve", group = "TCV"));

  // Controllers' parameters
  parameter Real Kp_TT7X1 = -0.001 "proportional gain for temperature controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ti_TT7X1 = 40 "integral time for temperature controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Kp_PtEX7X1 = 0.113 "proportional gain for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ti_PtEX7X1 = 0.268 "integral time for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ki_PtEX7X1 = 1 "integral gain for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real y_start_PI_TT(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Real y_start_PI_Pt(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Real y_start_I_m_flow(min = 0, max = 2) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Modelica.Blocks.Types.Init initType_PI = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(tab = "Controllers", group="Initialization"));
  parameter Modelica.Blocks.Types.Init initType_I = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(tab = "Controllers", group="Initialization"));

  Modelica.Blocks.Interfaces.RealInput EX7X1Pt_SP "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{93.5,28.5},{83.5,38.5}}),
      iconTransformation(origin={-110,70}, extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Interfaces.RealInput TT7X1_SP "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{-70,-104},{-60,-94}}),
      iconTransformation(origin={-110,50},  extent={{-10,-10},{10,10}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT7X1(
    Kp=Kp_TT7X1,
    Ti=Ti_TT7X1,
    Umax=1,
    Umin=0,
    y_start=y_start_PI_TT, initType = initType_PI)
    annotation (Placement(transformation(extent={{-57,-113.5},{-37,-93.5}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_EX7X1Pt(
    Kp=Kp_PtEX7X1,
    Ti=Ti_PtEX7X1,
    Umax=1,
    Umin=0,
    y_start=y_start_PI_Pt, initType = initType_PI)
    annotation (Placement(transformation(extent={{55,47.5},{35,27.5}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX7X1Pt(Ki=Ki_PtEX7X1, Umax=1.5, initType = initType_I, y_start = y_start_I_m_flow)
    annotation (Placement(transformation(extent={{81.5,48},{61.5,28}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=EX7X1.Pt)
    annotation (Placement(transformation(extent={{61,48},{81,68}})));
equation

  connect(TT7X1_SP, PI_TT7X1.REF) annotation (Line(points={{-65,-99},{-60,-99},{-60,-99.5},
          {-55,-99.5}}, color={0,0,127}));
  connect(I_EX7X1Pt.REF, EX7X1Pt_SP)  annotation (Line(points={{79.5,34},{84,34},{84,33.5},{88.5,33.5}},
                                                     color={0,0,127}));
  connect(realExpression.y, I_EX7X1Pt.FeedBack)
    annotation (Line(points={{82,58},{85,58},{85,42},{79.5,42}},   color={0,0,127}));
  connect(I_EX7X1Pt.controlAction, PI_EX7X1Pt.REF) annotation (Line(points={{60.5,38},{58,38},{58,33.5},{53,33.5}},   color={0,0,127}));
  connect(PI_TT7X1.controlAction, TCV7X1.opening) annotation (Line(points={{-36,-103.5},{-28,-103.5}}, color={0,0,127}));
  connect(PI_EX7X1Pt.FeedBack, FT7X1_FT) annotation (Line(points={{53,41.5},{56,41.5},{56,42.5},{58,42.5},{58,86.5},{33,86.5},{33,111},{91,111},{91,45},{110,45}}, color={0,0,127}));
  connect(PI_TT7X1.FeedBack, TT7X1_TT) annotation (Line(points={{-55,-107.5},{-98,-107.5},{-98,118},{31.5,118},{31.5,112.5},{92.5,112.5},{92.5,60},{110,60}}, color={0,0,127}));
  connect(PI_EX7X1Pt.controlAction, FCV7X1.opening) annotation (Line(points={{34,37.5},{28,37.5}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={0.5,0.5})));
end CoolingSingleLoadPowerControl;
