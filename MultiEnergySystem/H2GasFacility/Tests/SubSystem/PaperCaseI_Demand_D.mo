within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand_D
  extends PaperCaseI_Demand_A(sourceP1(use_in_X0=true), X_start = H2GasFacility.Data.MassMolFractionData.NG_Cheli.X,
    sourceP18(use_in_X0=true));
  Modelica.Blocks.Sources.Ramp ramp[nX](
    height={-0.035,0,0,0,0,0,0.035},
                    each duration=0, offset=X_start,
    each startTime=30000)                    annotation (Placement(transformation(extent={{20,82},{0,102}})));
  Modelica.Blocks.Sources.Ramp ramp1
                                   [nX](
    height={0.015,0,0,0,0,0,-0.015},
    each duration=0,
    offset=X_start,
    each startTime=38000)                    annotation (Placement(transformation(extent={{-92,20},{-112,40}})));
equation
  connect(ramp.y, sourceP1.in_X0) annotation (Line(points={{-1,92},{-11.6,92}},                 color={0,0,127}));
  connect(ramp1.y, sourceP18.in_X0) annotation (Line(points={{-113,30},{-128,30},{-128,8.4}}, color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_Demand_D;
