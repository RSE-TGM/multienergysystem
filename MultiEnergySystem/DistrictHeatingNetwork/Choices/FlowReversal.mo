within MultiEnergySystem.DistrictHeatingNetwork.Choices;
package FlowReversal "Options for flow reversal support"
  type Options = enumeration(
      fullFlowReversal "Full flow reversal support",
      smallFlowReversal "Small flow reversal allowed (approx. model)",
      noFlowReversal "Flow reversal is not allowed")
    "Type, constants and menu choices to select the flow reversal support options";
end FlowReversal;
