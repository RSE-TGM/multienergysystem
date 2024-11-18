within MultiEnergySystem.TestFacility.Facilities.MultiEnergy;
partial model BaseCaseI
  replaceable Interfaces.ThermalFacility thermalFacility annotation (Placement(transformation(extent={{-22,-24},{26,24}})));
  replaceable Interfaces.GasFacility gasFacility annotation (Placement(transformation(extent={{42,-24},{90,24}})));
equation
  connect(thermalFacility.inletGas, gasFacility.outletGas) annotation (Line(
      points={{28.4,0},{39.6,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseCaseI;
