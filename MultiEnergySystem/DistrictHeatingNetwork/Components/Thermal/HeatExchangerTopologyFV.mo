within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal;
model HeatExchangerTopologyFV
  "Connects two DHTVolumes ports according to a selected heat exchanger topology"
  extends DistrictHeatingNetwork.Icons.Generic.HeatFlow;
  parameter Integer Nw = 2 "Number of volumes, minimum 2";
  replaceable model HeatExchangerTopology =
      HeatExchangerTopologies.CoCurrentFlow constrainedby
    MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.BaseClasses.HeatExchangerTopologyData
    annotation(choicesAllMatching=true);

  HeatExchangerTopology HET(final Nw = Nw);

  DistrictHeatingNetwork.Interfaces.MultiHeatPort side1(final n=Nw) annotation (Placement(transformation(extent={{-40,20},
            {40,40}}, rotation=0)));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort side2(final n=Nw) annotation (Placement(transformation(extent={{-40,-42},
            {40,-20}}, rotation=0)));

equation
  for j in 1:Nw loop
    side2.T[HET.correspondingVolumes[j]] = side1.T[j];
    side2.Q_flow[HET.correspondingVolumes[j]] + side1.Q_flow[j] = 0;
  end for;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics={Polygon(
          points={{-72,0},{-72,-16},{-50,-8},{-72,0}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid), Polygon(
          points={{72,0},{52,8},{72,16},{72,0}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
end HeatExchangerTopologyFV;
