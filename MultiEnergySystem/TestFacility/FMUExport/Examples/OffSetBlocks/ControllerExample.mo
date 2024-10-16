within MultiEnergySystem.TestFacility.FMUExport.Examples.OffSetBlocks;
model ControllerExample
  Real FT401SP(nominal = 3.2666667);
  Real dFT401SP(min = -1, max = 0);
  Interfaces.ControlSignalBus           processVariableBus annotation (
    Placement(visible = true, transformation(origin={-102,-2},   extent={{50,40},{-50,-40}},      rotation = -90), iconTransformation(origin = {-91, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  Interfaces.ControlSignalBus           controlSignalBus annotation (
    Placement(visible = true, transformation(origin={102,-6},    extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {94, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_FT401(
    Kp=0.69355,
    Ti=0.26795,
    Umax=0,
    Umin=-1,
    y_start=-1)                                                   annotation (Placement(transformation(extent={{-6,-9},{4,1}})));
  Modelica.Blocks.Sources.RealExpression dFT401SP_var(y=dFT401SP) annotation (Placement(transformation(extent={{-38,6},{-24,19}})));

equation
  FT401SP = if time < 100 then 3.05 else 3;
  dFT401SP = (FT401SP - 3.2666667)/3.2666667;
  connect(PI_FT401.REF, dFT401SP_var.y) annotation (Line(points={{-5,-2},{-16,-2},{-16,12.5},{-23.3,12.5}}, color={0,0,127}));
  connect(PI_FT401.controlAction, controlSignalBus.din1) annotation (Line(points={{4.5,-4},{56,-4},{56,-6},{102,-6}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(processVariableBus.dout1, PI_FT401.FeedBack)
    annotation (Line(
      points={{-102,-2},{-18,-2},{-18,-6},{-5,-6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (                                                   Diagram(coordinateSystem(preserveAspectRatio=false)));
end ControllerExample;
