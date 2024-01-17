within MultiEnergySystem.TestFacility.FMUExport.Interfaces;
model SignalBusConnector
  AllamCycle.Connectors.ControlSignalBus controlSignalBus annotation (
    Placement(visible = true, transformation(origin={-897,-3},    extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-87, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  AllamCycle.Connectors.ControlSignalBus processVariableBus annotation (
    Placement(visible = true, transformation(origin={896,-3},    extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {88, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-900,-500},{900,
            320}})));
end SignalBusConnector;
