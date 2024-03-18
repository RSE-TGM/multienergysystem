within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_B_wip
  extends TestSinglePipe_B(
  n = 5,
  redeclare model Medium = H2GasFacility.Media.IdealGases.NG6_H2,
  redeclare MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip roundPipe(
      X_start=Xref,
      constantFrictionFactor=false,
      computeInertialTerm=false,
      hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle),
    sinkPressure(T0=15 + 273.15, R=0),
    p_out(
      height=0*0.003e5,
      duration=0,
      startTime=50),
    T_in(
      height=3,    duration=0,
      startTime=50),
    sourceP(use_in_X0=true),
    p_in(
      height=0,
      duration=0,
      startTime=50));
  //redeclare model Medium = Media.Ideal

  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 200 then
        Xref else {1,0,0,0,0,0,0})
    annotation (Placement(transformation(extent={{-72,70},{-52,90}})));
equation
  connect(realExpression.y, sourceP.in_X0)
    annotation (Line(points={{-51,80},{-46,80},{-46,8.4}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Test of Round 1DFV pipe. </p>
<p>This test works with Ideal Gases. The solver is not able to find a solution with ideal gases. </p>
<p>It is possible to have as input: mass flow, pressure, temperature and mass composition. </p>
</html>"));
end TestSinglePipe_B_wip;
