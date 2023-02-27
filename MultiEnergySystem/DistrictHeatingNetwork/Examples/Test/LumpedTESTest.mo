within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;

model LumpedTESTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(Tnom = 348.15, mflownom = 1) annotation(
    Placement(visible = true, transformation(origin = {-86, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank(T = 353.15) annotation(
    Placement(visible = true, transformation(origin = {-58, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorageConstantMass tes(D = 1.7, T_start = 338.15, h = 5) annotation(
    Placement(visible = true, transformation(origin = {-14, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(Tnom = 338.15, mflownom = 10) annotation(
    Placement(visible = true, transformation(origin = {-45, -23}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation(
    Placement(visible = true, transformation(origin = {-32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorageConstantMass lumpedStorage(D = 1.7, T_ext = 298.15, T_start = 338.15, h = 5) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource flowSource(Tnom (displayUnit = "K")= 338.15, mflownom = 1) annotation(
    Placement(visible = true, transformation(origin = {2, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorage tank(D = 1.7, h = 4)  annotation(
    Placement(visible = true, transformation(origin = {36, 2}, extent = {{-10, -14}, {10, 14}}, rotation = 0)));
  Sources.SinkPressure sink(T = 65 + 273.15, p0 = 2.5e5, use_T = true, use_in_p0 = false)  annotation(
    Placement(visible = true, transformation(origin = {34, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(lumpedStorage.outlet, expansionTank.inlet) annotation(
    Line(points = {{-70, 4.28571}, {-70, 17.2857}, {-58, 17.2857}, {-58, 32.2857}}, color = {168, 168, 168}));
  connect(idealMassFlowSource.outlet, lumpedStorage.inlet) annotation(
    Line(points = {{-75.8, -24}, {-70, -24}, {-70, -4}}, color = {168, 168, 168}));
  connect(flowSource.outlet, tank.inlet) annotation(
    Line(points = {{12, -26}, {20, -26}, {20, -4}, {26, -4}}, color = {168, 168, 168}));
  connect(sink.inlet, tank.outlet) annotation(
    Line(points = {{24, 38}, {18, 38}, {18, 8}, {26, 8}}, color = {168, 168, 168}));
  connect(tes.outlet, expansionTank1.inlet) annotation(
    Line(points = {{-24, 6}, {-32, 6}, {-32, 30}}, color = {168, 168, 168}));
  connect(idealMassFlowSource1.outlet, tes.inlet) annotation(
    Line(points = {{-38, -22}, {-30, -22}, {-30, -2}, {-24, -2}}, color = {168, 168, 168}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -80}, {100, 80}})));
end LumpedTESTest;
