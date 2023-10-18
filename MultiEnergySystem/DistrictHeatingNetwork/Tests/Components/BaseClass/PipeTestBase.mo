within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.BaseClass;

model PipeTestBase
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipePF pipePF annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV pipeFV annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.round1DFV round1DFV annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore annotation(
    Placement(visible = true, transformation(origin = {-1.77636e-15, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

end PipeTestBase;
