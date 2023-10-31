within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model FixedMassFlowPump "Ideal Mass flow pump with fixed parameter, flow from inlet to outlet"
  extends DistrictHeatingNetwork.Sources.BaseClass.PartialIdealPump;

  // Parameters
  parameter Types.MassFlowRate m_flow = 1 "Fixed mass flow";

equation
  inlet.m_flow = m_flow;
end FixedMassFlowPump;
