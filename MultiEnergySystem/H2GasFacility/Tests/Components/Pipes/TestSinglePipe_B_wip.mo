within MultiEnergySystem.H2GasFacility.Tests.Components.Pipes;
model TestSinglePipe_B_wip
  extends TestSinglePipe_B(
  n = 15,
  redeclare model Medium = H2GasFacility.Media.IdealGases.NG6_H2,
  redeclare MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV_wip roundPipe(
      X_start=Xref,
      constantFrictionFactor=true,
      hctype=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle),
    sinkPressure(T0=15 + 273.15, R=0),
    p_out(
      height=0*0.003e5,
      duration=0,
      startTime=50),
    T_in(height=3, duration=0),
    sourceP(use_in_X0=true),
    p_in(
      height=0.001e5,
      duration=0,
      startTime=50));
  //redeclare model Medium = Media.Ideal

  Modelica.Blocks.Sources.RealExpression realExpression[7](y=if time < 200 then
        Xref else {1,0,0,0,0,0,0})
    annotation (Placement(transformation(extent={{-72,70},{-52,90}})));
equation
  connect(realExpression.y, sourceP.in_X0)
    annotation (Line(points={{-51,80},{-46,80},{-46,8.4}}, color={0,0,127}));
end TestSinglePipe_B_wip;
