within MultiEnergySystem.TestFacility.Facilities.MultiEnergy;
partial model BaseCaseI
  replaceable Interfaces.ThermalFacility thermalFacility annotation (Placement(transformation(extent={{-26,-24},{22,24}})));
  replaceable Interfaces.GasFacility gasFacility annotation (Placement(transformation(extent={{38,-24},{86,24}})));
equation
  connect(thermalFacility.inletGas, gasFacility.outletGas) annotation (Line(
      points={{24.4,0},{35.6,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseCaseI;
