within MultiEnergySystem.TestFacility.DHTF.Interfaces;
partial model DHNConnectorBaseI
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletHot
    annotation (Placement(transformation(extent={{-115,-55},{-85,-25}}),  iconTransformation(extent={{-115,-55},{-85,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletCold
    annotation (Placement(transformation(extent={{-115,25},{-85,55}}),  iconTransformation(extent={{-115,25},{-85,55}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletCold annotation (Placement(transformation(extent={{85,25},{115,55}}),  iconTransformation(extent={{85,25},{115,55}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletHot annotation (Placement(transformation(extent={{85,-55},{115,-25}}),  iconTransformation(extent={{85,-55},{115,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletComp "inlet connector to be used for the component"
    annotation (Placement(transformation(extent={{35,-115},{65,-85}}),  iconTransformation(extent={{35,-115},{65,-85}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletComp "Outlet connector to be used for the component"
    annotation (Placement(transformation(extent={{-65,-115},{-35,-85}}),  iconTransformation(extent={{-65,-115},{-35,-85}})));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort annotation (Placement(transformation(extent={{-10,100},{10,120}}), iconTransformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Interfaces.RealOutput m_flow_outletCold annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,110})));
  Modelica.Blocks.Interfaces.RealOutput m_flow_outletHot annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,110})));
  annotation (Icon(coordinateSystem(grid={1,1})),                Diagram(coordinateSystem(preserveAspectRatio=false)));
end DHNConnectorBaseI;
