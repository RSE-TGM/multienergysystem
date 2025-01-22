within MultiEnergySystem.H2GasFacility.Components.Manifold;
model Junction
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  // Mediums
  parameter Integer nXi = 1;
  replaceable model Medium = MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;

  Interfaces.FluidPortInlet fluidPortInlet(nXi = nXi) annotation (Placement(transformation(
          extent={{-20,-120},{20,-80}}), iconTransformation(extent={{-20,-120},{
            20,-80}})));
  Interfaces.FluidPortOutlet fluidPortOutlet(nXi = nXi) annotation (Placement(
        transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
           {{-120,-20},{-80,20}})));
  Interfaces.FluidPortOutlet fluidPortOutlet1(nXi = nXi) annotation (Placement(
        transformation(extent={{80,-20},{120,20}}), iconTransformation(extent={{
            80,-20},{120,20}})));
equation
  connect(fluidPortOutlet, fluidPortOutlet1) annotation (Line(
      points={{-100,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(fluidPortInlet, fluidPortOutlet1) annotation (Line(
      points={{0,-100},{0,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(                                             graphics={
          Rectangle(
          extent={{28,-100},{-26,-14}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{-100,28},{100,-26}},
          lineColor={247,150,70},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid)}));
end Junction;
