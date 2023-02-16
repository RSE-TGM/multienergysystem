within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model FixedMassFlowPump
  "Ideal Mass flow pump with fixed parameter, flow from inlet to outlet"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sources.BaseClass.PartialIdealPump;

  parameter Modelica.Units.SI.MassFlowRate m_flow = 1 "Imposed mass flow";
equation
  inlet.m_flow = m_flow;
end FixedMassFlowPump;
