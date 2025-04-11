within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
model LoadPlantFourHXControlled
  extends LoadPlantFourHXBase;
//   extends DistrictHeatingNetwork.Icons.Water.Load;
//   constant Real pi = Modelica.Constants.pi;
//   parameter Integer n = 3 "Number of volumes in each pipe";
//   parameter Integer nHX = 5 "Number of volumes in each heat exchanger";
//   parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
//       DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
//   replaceable model MediumLPHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
//   replaceable model MediumLPCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
//   replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;
//   replaceable model Pipe = DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV;
//
//   // EX701
//   parameter Real EX701_q_m3h_hot(unit = "m3/h") = 2.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_hot=EX701_q_m3h_hot*985/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_hot=2.5e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_hot=2.4e5;
//   parameter DistrictHeatingNetwork.Types.Pressure FCV701_pout=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_hot=60 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_hot=45 + 273.15;
//
//   parameter Real EX701_q_m3h_cold(unit = "m3/h") = 1.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX701_cold=EX701_q_m3h_cold*995/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX701_pin_cold=2.2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX701_pout_cold=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_Tin_cold=7 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_Tout_cold=14 + 273.15;
//
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
//   parameter DistrictHeatingNetwork.Types.Temperature EX701_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";
//
//   // EX711
//   parameter Real EX711_q_m3h_hot(unit = "m3/h") = 2.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_hot=EX711_q_m3h_hot*1000/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_hot=2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_hot=1.99e5;
//   parameter DistrictHeatingNetwork.Types.Pressure FCV711_pout=1.98e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_hot=60 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_hot=45 + 273.15;
//
//   parameter Real EX711_q_m3h_cold(unit = "m3/h") = 1.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX711_cold=EX711_q_m3h_cold*1000/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX711_pin_cold=2.2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX711_pout_cold=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_Tin_cold=7 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_Tout_cold=14 + 273.15;
//
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
//   parameter DistrictHeatingNetwork.Types.Temperature EX711_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";
//
//   // EX721
//   parameter Real EX721_q_m3h_hot(unit = "m3/h") = 2.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_hot=EX721_q_m3h_hot*1000/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_hot=2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_hot=1.99e5;
//   parameter DistrictHeatingNetwork.Types.Pressure FCV721_pout=1.98e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_hot=60 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_hot=45 + 273.15;
//
//   parameter Real EX721_q_m3h_cold(unit = "m3/h") = 1.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX721_cold=EX721_q_m3h_cold*1000/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX721_pin_cold=2.2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX721_pout_cold=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_Tin_cold=7 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_Tout_cold=14 + 273.15;
//
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
//   parameter DistrictHeatingNetwork.Types.Temperature EX721_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";
//
//   // EX731
//   parameter Real EX731_q_m3h_hot(unit = "m3/h") = 2.5;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_hot=EX731_q_m3h_hot*985/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_hot=2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_hot=1.99e5;
//   parameter DistrictHeatingNetwork.Types.Pressure FCV731_pout=1.98e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_hot=60 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_hot=45 + 273.15;
//
//   parameter Real EX731_q_m3h_cold(unit = "m3/h") = 1;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_EX731_cold=EX731_q_m3h_cold*1000/3600;
//   parameter DistrictHeatingNetwork.Types.Pressure EX731_pin_cold=2.2e5;
//   parameter DistrictHeatingNetwork.Types.Pressure EX731_pout_cold=2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_Tin_cold=7 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_Tout_cold=14 + 273.15;
//
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_T1_wall_start = 70 + 273.15 "Temperature start value at the inlet of the wall";
//   parameter DistrictHeatingNetwork.Types.Temperature EX731_TN_wall_start = 50 + 273.15 "Temperature start value at the outlet of the wall";
//
//   parameter DistrictHeatingNetwork.Types.Length Di_S700=51e-3;
//   parameter DistrictHeatingNetwork.Types.Length t_S700=1.5e-3;
//
//
//   //1. Cooling System
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_Cool = 0.92e5;
//   parameter DistrictHeatingNetwork.Types.Pressure pout_start_Cool = 0.92e5;
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_PR01 = pout_start_Cool;
//   parameter DistrictHeatingNetwork.Types.Pressure pout_start_PR01 = 2e5;
//   parameter DistrictHeatingNetwork.Types.Temperature Tin_start_Cool = 20 + 273.15;
//   parameter DistrictHeatingNetwork.Types.Temperature Tout_start_Cool = 15 + 273.15;
//   parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Cool = 8.88;
//   parameter Real q_Cool(unit = "m3/h") = 32;
//   parameter DistrictHeatingNetwork.Types.Length t_RR = 1.5e-3;
//   parameter DistrictHeatingNetwork.Types.Length Di_RR = 85e-3;
//   parameter Real Kvalve(unit = "m3/h") = TestFacility.Data.ValveData.FCVR01.Kv; //90;
//   parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.004;
//   parameter DistrictHeatingNetwork.Types.Pressure dp_RR01 = 0.5e5;
//
//   //FCVR01 Valve
//   parameter Real q_FCVR01_start(unit = "m3/h") = q_Cool - q_Users_total;
//   final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_FCVR01_start = q_FCVR01_start*1000/3600;
//
//   //2. Users System
//   parameter DistrictHeatingNetwork.Types.Pressure pin_start_Users = 3e5;
//   parameter DistrictHeatingNetwork.Types.Pressure pout_start_Users = 2.5e5;
//   parameter DistrictHeatingNetwork.Types.Temperature T_start_UserIn = 7 + 273.15;
//   parameter Real q_Users_total(unit = "m3/h") = 20;
//   parameter Real q_Users(unit = "m3/h") = q_Users_total/4;
//   parameter DistrictHeatingNetwork.Types.Length t_Users = 1.5e-3;
//   parameter DistrictHeatingNetwork.Types.Length Di_Users = 32e-3;
//   parameter DistrictHeatingNetwork.Types.Length t_Rack = 1.5e-3;
//   parameter DistrictHeatingNetwork.Types.Length Di_Rack = 51e-3;
//
//   // Lengths of pipelines COLD SIDE
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_SourceOut_FCV701=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX711_SourceOut_FCV711=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX721_SourceOut_FCV721=0.6;
//   parameter DistrictHeatingNetwork.Types.Length L_HX731_SourceOut_FCV731=0.6;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_SourceOut_FCV701=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX711_SourceOut_FCV711=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX721_SourceOut_FCV721=0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX731_SourceOut_FCV731=0;
//
//   parameter DistrictHeatingNetwork.Types.Length L_FCV701_FT701=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV701_FT701=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV711_FT711=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV711_FT711=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV721_FT721=2.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV721_FT721=0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCV731_FT731=2.25;
//   parameter DistrictHeatingNetwork.Types.Length h_FCV731_FT731=0;
//
//   parameter DistrictHeatingNetwork.Types.Length L_FT701_rackL2L3=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_FT701_rackL2L3=-0.7; //-1;
//   parameter DistrictHeatingNetwork.Types.Length L_FT711_rackL3L4=1 + 0.7 + 5 + 9.2 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_FT711_rackL3L4=-1.4; //-1;
//   parameter DistrictHeatingNetwork.Types.Length L_FT721_rackL4L5=1 + 2 + 5 + 9 + 1 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_FT721_rackL4L5=-1.6; //-1;
//   parameter DistrictHeatingNetwork.Types.Length L_FT731_rackL6L7=1.2 + 4 + 0.25 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
//   parameter DistrictHeatingNetwork.Types.Length h_FT731_rackL6L7=-2.4; //-0.25 - 0.5;
//
//   // Lengths of pipelines HOT SIDE
//   parameter DistrictHeatingNetwork.Types.Length L_HX701_TT702_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX711_TT712_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX721_TT722_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length L_HX731_TT732_SourceIn=1.5 + 1.0 + 0.4;
//   parameter DistrictHeatingNetwork.Types.Length h_HX701_TT702_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX711_TT712_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX721_TT722_SourceIn=1.5 + 1.0;
//   parameter DistrictHeatingNetwork.Types.Length h_HX731_TT732_SourceIn=1.5 + 1.0;
//
//   parameter DistrictHeatingNetwork.Types.Length L_rackL2L3_TT702=5.2 + 5 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL2L3_TT702=-1;
//   parameter DistrictHeatingNetwork.Types.Length L_rackL3L4_TT712=1 + 0.7 + 5 + 9.2 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL3L4_TT712=-1;
//   parameter DistrictHeatingNetwork.Types.Length L_rackL4L5_TT722=1 + 2 + 5 + 9 + 1 + 1;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL4L5_TT722=-1;
//   parameter DistrictHeatingNetwork.Types.Length L_rackL6L7_TT732=1.2 + 4 + 0.25 + 0.3 + 3 + 0.4 + 0.5;
//   parameter DistrictHeatingNetwork.Types.Length h_rackL6L7_TT732=-0.25 - 0.5;
//
//   // Internal diameters & thickness
//   parameter DistrictHeatingNetwork.Types.Length t_Source=1.5e-3;
//   parameter DistrictHeatingNetwork.Types.Length Di_Source=32e-3;
//
//   // Lengths of pipelines source side
//   parameter DistrictHeatingNetwork.Types.Length L_VER901_FCVR01=1;
//   parameter DistrictHeatingNetwork.Types.Length h_VER901_FCVR01=-0.8*0;
//   parameter DistrictHeatingNetwork.Types.Length L_FCVR01_FTR03=2.95;
//   parameter DistrictHeatingNetwork.Types.Length h_FCVR01_FTR03=2.35*0;
//   parameter DistrictHeatingNetwork.Types.Length L_FTR03_PTR01=1.05;
//   parameter DistrictHeatingNetwork.Types.Length h_FTR03_PTR01=0.25;
//   parameter DistrictHeatingNetwork.Types.Length L_PTR01_FTR01=1.90;
//   parameter DistrictHeatingNetwork.Types.Length h_PTR01_FTR01=-1.90;
//   parameter DistrictHeatingNetwork.Types.Length L_FTR01_RR01=1.97;
//   parameter DistrictHeatingNetwork.Types.Length h_FTR01_RR01=-0.72;
//   parameter DistrictHeatingNetwork.Types.Length L_RR01_PR01=1.275;
//   parameter DistrictHeatingNetwork.Types.Length h_RR01_PR01=0;
//   parameter DistrictHeatingNetwork.Types.Length L_PR01_PTR02=2.8;
//   parameter DistrictHeatingNetwork.Types.Length h_PR01_PTR02=1*0;
//   parameter DistrictHeatingNetwork.Types.Length L_TTR02_VER901=0.43;
//   parameter DistrictHeatingNetwork.Types.Length h_TTR02_VER901=0;
//
//   parameter DistrictHeatingNetwork.Types.Length L_UsersIn_EX721=0.75;
//   parameter DistrictHeatingNetwork.Types.Length h_UsersIn_EX721=0.50*1;
//   parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_cold=1.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_cold=0.50*1;
//   parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_cold=0.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_cold=0.50*1;
//   parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_cold=0.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_cold=0.50*1;
//
//   parameter DistrictHeatingNetwork.Types.Length L_UsersOut_EX721=0.75;
//   parameter DistrictHeatingNetwork.Types.Length h_UsersOut_EX721=0;
//   parameter DistrictHeatingNetwork.Types.Length L_EX721_EX711_hot=1.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX721_EX711_hot=0;
//   parameter DistrictHeatingNetwork.Types.Length L_EX711_EX701_hot=0.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX711_EX701_hot=0;
//   parameter DistrictHeatingNetwork.Types.Length L_EX701_EX731_hot=0.50;
//   parameter DistrictHeatingNetwork.Types.Length h_EX701_EX731_hot=0;
//
//   parameter DistrictHeatingNetwork.Types.Length L_TT704_TCV701=0.85;
//   parameter DistrictHeatingNetwork.Types.Length h_TT704_TCV701=0.30; //0.85; //0.65;
//   parameter DistrictHeatingNetwork.Types.Length L_TT714_TCV711=0.80;
//   parameter DistrictHeatingNetwork.Types.Length h_TT714_TCV711=0.80; //0.65;
//   parameter DistrictHeatingNetwork.Types.Length L_TT724_TCV721=1.25;//0.65;
//   parameter DistrictHeatingNetwork.Types.Length h_TT724_TCV721=1.25; //0.65;
//   parameter DistrictHeatingNetwork.Types.Length L_TT734_TCV731=0.65;
//   parameter DistrictHeatingNetwork.Types.Length h_TT734_TCV731=0.40; //0.65;
//
//   parameter DistrictHeatingNetwork.Types.Length L_TCV701_rUsersOut=1 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_TCV701_rUsersOut=1;
//   parameter DistrictHeatingNetwork.Types.Length L_TCV711_rUsersOut=1 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_TCV711_rUsersOut=1;
//   parameter DistrictHeatingNetwork.Types.Length L_TCV721_rUsersOut=1 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_TCV721_rUsersOut=1;
//   parameter DistrictHeatingNetwork.Types.Length L_TCV731_rUsersOut=1 + 0.66 + 0.66;
//   parameter DistrictHeatingNetwork.Types.Length h_TCV731_rUsersOut=1;
//
//   parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT703=1.65 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT703=-1.65*0.1;
//   parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT713=1.65 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT713=-1.65*0.1;
//   parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT723=1.65 + 0.45;
//   parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT723=-1.65*0.1;
//   parameter DistrictHeatingNetwork.Types.Length L_rUsersIn_TT733=1.65 + 0.66 + 0.66;
//   parameter DistrictHeatingNetwork.Types.Length h_rUsersIn_TT733=-1.65*0.1;
//
//   parameter DistrictHeatingNetwork.Types.Length L_RR_UsersIn=0.8 + 1.2 + 0.5 + 2;
//   parameter DistrictHeatingNetwork.Types.Length h_RR_UsersIn=0.8 + 0.6;
//
//   parameter DistrictHeatingNetwork.Types.Length L_RR_UsersOut=2;
//   parameter DistrictHeatingNetwork.Types.Length h_RR_UsersOut=0;


equation
  connect(controlSignalBus.PtEX701, S701.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,290},{-380,290},{-380,30},{-366,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX701, S701.TT7X1_SP) annotation (Line(
      points={{0,300},{-6,300},{-6,296},{-384,296},{-384,22},{-366,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX711, S711.EX7X1Pt_SP)
    annotation (Line(
      points={{0,300},{0,252},{-54,252},{-54,30},{-46,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX711, S711.TT7X1_SP)
    annotation (Line(
      points={{0,300},{-2,300},{-2,256},{-60,256},{-60,22},{-46,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX721, S721.EX7X1Pt_SP)
    annotation (Line(
      points={{0,300},{0,278},{106,278},{106,30},{114,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX721, S721.TT7X1_SP) annotation (Line(
      points={{0,300},{4,300},{4,266},{24,266},{24,274},{102,274},{102,22},{114,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX731, S731.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,274},{-206,274},{-206,276},{-216,276},{-216,30},{-206,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX731, S731.TT7X1_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,278},{-226,278},{-226,22},{-206,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
   annotation (                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-500,-300},{500,300}}), graphics={
        Line(
          points={{-292,108},{-292,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-32,96},{-32,68}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1)}));
end LoadPlantFourHXControlled;
