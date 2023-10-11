within MultiEnergySystem.DistrictHeatingNetwork.Interfaces;
partial model PartialHorizontalTwoPort "Partial component with two ports"

  parameter Boolean allowFlowReversal = false "if true allows flow reversal in the component";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));

end PartialHorizontalTwoPort;
