within MultiEnergySystem.H2GasFacility.Interfaces;
partial model PartialHorizontalTwoPort "Partial component with two ports"
  parameter Boolean allowFlowReversal = true "= false prohibits flow reversal, simplify the equations";
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet(m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
end PartialHorizontalTwoPort;
