within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal;
package HeatExchangerTopologies
  model CoCurrentFlow "Co-current flow"
    extends BaseClasses.HeatExchangerTopologyData(
      final correspondingVolumes = 1:Nw);
  end CoCurrentFlow;

  model CounterCurrentFlow "Counter-current flow"
    extends BaseClasses.HeatExchangerTopologyData(
      final correspondingVolumes=  Nw:-1:1);
  end CounterCurrentFlow;
end HeatExchangerTopologies;
