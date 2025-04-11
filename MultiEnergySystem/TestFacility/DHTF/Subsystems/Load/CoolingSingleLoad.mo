within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
model CoolingSingleLoad "S7X0 - Cooling Single Load (HX)"
  extends BaseCoolingSingleLoad;
//   extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
//   replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
//   replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient  constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
//   parameter Integer np = 5 "Number of volumes in each pipe";
//   parameter Integer nHX = 9 "Number of volumes in heat exchanger";
//   parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
//       DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";

  // Flow Control Valve parameters
//   parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.Kv "Metri Flow Coefficient" annotation (
//     Dialog(tab = "Valve", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic" annotation (
//     Dialog(tab = "Valve", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Types.Pressure dp_nom_valve = TestFacility.Data.ValveData.FCV701.dp_nom "Pressure drop between supply and return, as imposed by the differential pump" annotation (
//     Dialog(tab = "Valve", group = "Characteristics"));
//   parameter DistrictHeatingNetwork.Types.Density rho_nom_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Nominal fluid density at supply" annotation (
//     Dialog(tab = "Valve", group = "Characteristics"));
//   parameter Real q_m3h_nom_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Nominal volumetric flowrate in m3/h";
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_valve = 20 + 273.15 annotation (
//     Dialog(tab = "Valve", group = "Initialisation"));
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_valve = 2e5 annotation (
//     Dialog(tab = "Valve", group = "Initialisation"));
//   parameter DistrictHeatingNetwork.Types.Density rho_start_valve = TestFacility.Data.ValveData.FCV701.rho_nom "Start value fluid density at the inlet" annotation (
//     Dialog(tab = "Valve", group = "Initialisation"));
//   parameter Real q_m3h_start_valve(unit = "m3/h") = TestFacility.Data.ValveData.FCV701.q_nom_m3h "Start value volumetric flowrate in m3/h" annotation (
//     Dialog(tab = "Valve", group = "Initialisation"));

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

  Modelica.Blocks.Interfaces.RealInput theta_FCV7X1 "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{60,27},{40,47}}),
      iconTransformation(origin={-110,70}, extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Interfaces.RealInput theta_TCV7X1 "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{-63,-93},{-43,-113}}),
      iconTransformation(origin={-110,50}, extent={{-10,-10},{10,10}})));
equation

  connect(FCV7X1.opening, theta_FCV7X1) annotation (Line(points={{28,37.5},{28,37},{50,37}}, color={0,0,127}));
  connect(TCV7X1.opening, theta_TCV7X1) annotation (Line(points={{-28,-103.5},{-31.5,-103.5},{-31.5,-103},{-53,-103}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={1,1})));
end CoolingSingleLoad;
