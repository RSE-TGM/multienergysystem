within MultiEnergySystem.TestFacility.DHTF.Subsystems.Tests;
model ControlPowerTest
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

  parameter Real Kp_TT7X1 = -0.0013715/2;
  parameter Real Ti_TT7X1 = 150/3;

  parameter Real Kp_Pt = 0.1128;
  parameter Real Ti_Pt = 0.26795;

  parameter Real Ki_PtEX7X1 = 0.5*2;

  Load.CoolingSingleLoadPowerControl load(
    nHX = 3,                               Kp_TT7X1=Kp_TT7X1, Ti_TT7X1=Ti_TT7X1,
    Kp_PtEX7X1=Kp_Pt,
    Ti_PtEX7X1=Ti_Pt,
    Ki_PtEX7X1=Ki_PtEX7X1,
    I_EX7X1Pt(Umax=1.5,
                      integrator(initType=Modelica.Blocks.Types.Init.SteadyState)),
    PI_EX7X1Pt(y_start=1),
    PI_TT7X1(y_start=1), np = 3)                 annotation (Placement(transformation(extent={{-28,-26},{24,26}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkHot_p(
    redeclare model Medium = Medium,
    use_in_p0=false,
    p0(displayUnit="Pa") = 2e5,
    T0(displayUnit="K") = 65 + 273.15,
    R=1e-3)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{22,58},{42,78}})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkCold_p(
    redeclare model Medium = Medium,
    use_in_p0=false,
    use_in_T0=false,
    p0=TestFacility.Data.BPHEData.E701.pout_start_cold,
    T0(displayUnit="K") = 25 + 273.15,
    R=1e-3)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent={{9.5,9.5},{-9.5,-9.5}},      rotation = 90, origin={-16.5,-60.5})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceHot_p(
    redeclare model Medium = Medium,
    p0(displayUnit="Pa") = 2.3e5,
    T0(displayUnit="K") = 80 + 273.15,
    R=1e-3)
    annotation (Placement(transformation(extent={{-40,58},{-20,78}})));
  DistrictHeatingNetwork.Sources.SourcePressure sourceCold_p(
    redeclare model Medium = Medium,
    p0=TestFacility.Data.BPHEData.E701.pin_start_cold,
    T0(displayUnit="K") = 15 + 273.15,
    R=1e-3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={12,-60})));
  inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.RealExpression Pt_SP(y=if time < 1000 then 20E3 else 40e3)
                                                       annotation (Placement(transformation(extent={{-66,8},{-46,28}})));
  Modelica.Blocks.Sources.RealExpression Tout_SP(y=if time < 100 then 68 + 273.15 else 58 + 273.15) annotation (Placement(transformation(extent={{-66,-26},{-46,-6}})));
equation
  connect(load.outcold, sinkCold_p.inlet) annotation (Line(
      points={{-15,-29.9},{-16.5,-29.9},{-16.5,-51}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceCold_p.outlet, load.incold) annotation (Line(
      points={{12,-50},{12,-36},{10.74,-36},{10.74,-29.9}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot_p.outlet, load.inhot) annotation (Line(
      points={{-20,68},{-14.48,68},{-14.48,29.9}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkHot_p.inlet, load.outhot) annotation (Line(
      points={{22,68},{11.26,68},{11.26,29.9}},
      color={140,56,54},
      thickness=0.5));
  connect(Tout_SP.y, load.TT7X1_SP) annotation (Line(points={{-45,-16},{-37.8,-16},{-37.8,13},{-30.6,13}},       color={0,0,127}));
  connect(Pt_SP.y, load.EX7X1Pt_SP) annotation (Line(points={{-45,18},{-45,18.2},{-30.6,18.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=6000, __Dymola_Algorithm="Dassl"));
end ControlPowerTest;
