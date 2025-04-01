within MultiEnergySystem.TestFacility.DHTF.Subsystems.Tests;
model ControlTempTest
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient;

  parameter Real Kp = -0.2743;
  parameter Real Ti = 0.7859;

  Load.CoolingSingleLoadTempControl load(Kp_TT7X1=Kp, Ti_TT7X1=Ti)
                                         annotation (Placement(transformation(extent={{-28,-26},{24,26}})));
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
  Modelica.Blocks.Sources.RealExpression theta_SP(y=1) annotation (Placement(transformation(extent={{-66,8},{-46,28}})));
  Modelica.Blocks.Sources.RealExpression Tout_SP(y=if time < 100 then 65 + 273.15 else 70 + 273.15) annotation (Placement(transformation(extent={{-66,-26},{-46,-6}})));
equation
  connect(sinkCold_p.inlet, load.outcold) annotation (Line(
      points={{-16.5,-51},{-16.5,-39.45},{-15,-39.45},{-15,-29.9}},
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
  connect(sourceCold_p.outlet, load.incold) annotation (Line(
      points={{12,-50},{12,-39.95},{10.74,-39.95},{10.74,-29.9}},
      color={140,56,54},
      thickness=0.5));
  connect(Tout_SP.y, load.TT7X1_SP) annotation (Line(points={{-45,-16},{-37.8,-16},{-37.8,-15.6},{-30.6,-15.6}}, color={0,0,127}));
  connect(theta_SP.y, load.theta_FCV7X1) annotation (Line(points={{-45,18},{-45,15.6},{-30.6,15.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1500,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ControlTempTest;
