within MultiEnergySystem.TestFacility.Facilities.Interfaces;
partial model ThermalFacility
  parameter Integer nXi_in1 = 6;
  parameter Integer nXi_in2 = 6;
  H2GasFacility.Interfaces.FluidPortInlet inletGas(nXi=nXi_in1) "Connector for one component of the thermal facility" annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  replaceable HeatGeneration heatGeneration annotation (Placement(transformation(extent={{-62,-24},{-14,24}})));
  replaceable HeatConsumption heatConsumption annotation (Placement(transformation(extent={{66,-24},{18,24}})));
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (Placement(transformation(extent={{-120,30},{-100,50}}), iconTransformation(extent={{-120,30},{-100,50}})));
  ElectricNetwork.Interfaces.ElectricPortOutlet electricPortOutlet annotation (Placement(transformation(extent={{-120,-50},{-100,-30}}), iconTransformation(extent={{-120,-50},{-100,-30}})));
equation
  connect(heatGeneration.supplyHot, heatConsumption.inletHot) annotation (Line(
      points={{-11.6,-9.6},{15.6,-9.6}},
      color={140,56,54},
      thickness=0.5));
  connect(heatConsumption.returnHot, heatGeneration.returnHot) annotation (Line(
      points={{15.6,9.6},{-11.6,9.6}},
      color={140,56,54},
      thickness=0.5));
  connect(heatGeneration.electricPortInlet, electricPortInlet) annotation (Line(
      points={{-64.4,9.6},{-80,9.6},{-80,40},{-110,40}},
      color={56,93,138},
      thickness=1));
  connect(heatGeneration.electricPortOutlet, electricPortOutlet) annotation (Line(
      points={{-64.4,-9.6},{-80,-9.6},{-80,-40},{-110,-40}},
      color={56,93,138},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                     Rectangle(lineColor = {140, 56, 54}, fillColor={242,220,219},   fillPattern=FillPattern.Solid,                lineThickness = 1, extent={{-100,100},{100,-100}},      radius=20)}));
end ThermalFacility;
