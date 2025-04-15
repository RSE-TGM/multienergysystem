within MultiEnergySystem.TestFacility.DHTF.Networks.BaseClass;
model CentralizedBase
  extends DistrictHeatingNetwork.Icons.Water.Network;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable Systems.HeatGeneration.CentralizedOneGenGB heatGeneration(redeclare model Gas = Gas) annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  Systems.Distribution.CentralizedFourHX distribution annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  replaceable Systems.Load.LoadPlantFourHX load annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-20,60},{20,100}}),  iconTransformation(extent={{-20,80},{20,120}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas(nXi=heatGeneration.S100.fuel.nXi)
                                                                      annotation (Placement(transformation(extent={{-10,-90},{10,-70}}),   iconTransformation(extent={{90,-10},{110,10}})));
equation
  connect(heatGeneration.senthot, distribution.senthot) annotation (Line(
      points={{-40,-12},{-30,-12},{-30,-12},{-20,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(heatGeneration.returncold, distribution.returncold) annotation (Line(
      points={{-40,12},{-30,12},{-30,12},{-20,12}},
      color={140,56,54},
      thickness=0.5));
  connect(distribution.fluidPortInlet, load.fluidPortOutlet) annotation (Line(
      points={{20,12},{40,12}},
      color={140,56,54},
      thickness=0.5));
  connect(distribution.fluidPortOutlet, load.fluidPortInlet) annotation (Line(
      points={{20,-12},{40,-12}},
      color={140,56,54},
      thickness=0.5));
  connect(heatGeneration.controlSignalBus, controlSignalBus) annotation (Line(
      points={{-60,20},{-60,70},{0,70},{0,80}},
      color={255,204,51},
      thickness=0.5));
  connect(distribution.controlSignalBus, controlSignalBus) annotation (Line(
      points={{0,20},{0,80}},
      color={255,204,51},
      thickness=0.5));
  connect(load.controlSignalBus, controlSignalBus) annotation (Line(
      points={{60,20},{60,70},{0,70},{0,80}},
      color={255,204,51},
      thickness=0.5));
  connect(inletGas, heatGeneration.inletGas) annotation (Line(
      points={{0,-80},{-60,-80},{-60,-20}},
      color={182,109,49},
      thickness=0.5));
end CentralizedBase;
