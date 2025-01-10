within MultiEnergySystem.H2GasFacility.Interfaces;
partial model PartialTwoPort "Partial component with two ports"
  parameter Boolean allowFlowReversal = true "= false prohibits flow reversal, simplify the equations";
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation (Documentation(info="<html>
<p>The variable in the model is:</p>
<ul>
<li><span style=\"font-family: Courier New;\">allowFlowReversal: </span>a boolean variable that permits to enable and disable the flow reversal of the port.</li>
</ul>
</html>"));
end PartialTwoPort;
