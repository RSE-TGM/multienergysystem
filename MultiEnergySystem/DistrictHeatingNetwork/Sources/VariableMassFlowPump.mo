within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model VariableMassFlowPump "Controllable mass flow pump, flow from inlet to outlet"
  extends DistrictHeatingNetwork.Sources.BaseClass.PartialIdealPump;
  Modelica.Blocks.Interfaces.RealInput m_flow annotation (Placement(
      visible=true,
      transformation(
        origin={-78,58},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-78,60},
        extent={{-20,-20},{20,20}},
        rotation=-90)));

equation
  inlet.m_flow = m_flow;
end VariableMassFlowPump;
