within MultiEnergySystem.TestFacility.FMUExport.Examples.OffSetBlocks;
model ControlSystemExample
  CentralizedDHN_A centralizedDHN_A(ForwardInit=true, FT401Offset(fixOffset = true))  annotation (Placement(transformation(extent={{-16,-14},{14,16}})));
  ControllerExample controllerExample(PI_FT401(Umax=1, Umin=-2))
                                      annotation (Placement(transformation(extent={{-62,-14},{-32,16}})));
equation
  connect(controllerExample.controlSignalBus, centralizedDHN_A.controlSignalBus) annotation (Line(
      points={{-32.9,1},{-32.9,0.85},{-14.05,0.85}},
      color={255,204,51},
      thickness=0.5));
  connect(controllerExample.processVariableBus, centralizedDHN_A.processVariableBus) annotation (Line(
      points={{-60.65,0.85},{-76,0.85},{-76,-20},{30,-20},{30,1},{12.2,1}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end ControlSystemExample;
