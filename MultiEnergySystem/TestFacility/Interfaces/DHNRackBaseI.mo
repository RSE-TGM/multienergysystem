within MultiEnergySystem.TestFacility.Interfaces;
model DHNRackBaseI
  parameter Integer nComp = 2;


  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletHot
    annotation (Placement(transformation(extent={{-128,-54},{-100,-26}}), iconTransformation(extent={{-128,-54},{-100,-26}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletCold
    annotation (Placement(transformation(extent={{-128,26},{-100,54}}), iconTransformation(extent={{-128,26},{-100,54}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletCold annotation (Placement(transformation(extent={{100,26},{128,54}}), iconTransformation(extent={{100,26},{128,54}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletHot annotation (Placement(transformation(extent={{100,-54},{128,-26}}), iconTransformation(extent={{100,-54},{128,-26}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletComp[nComp] "inlet connector to be used for the component"
    annotation (Placement(transformation(extent={{38,-126},{64,-100}}), iconTransformation(extent={{38,-126},{64,-100}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletComp[nComp] "Outlet connector to be used for the component"
    annotation (Placement(transformation(extent={{-64,-128},{-36,-100}}), iconTransformation(extent={{-64,-128},{-36,-100}})));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort annotation (Placement(transformation(extent={{-10,100},{10,120}}), iconTransformation(extent={{-10,100},{10,120}})));
  Modelica.Blocks.Interfaces.RealOutput m_flow_outletCold[nComp] annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,110})));
  Modelica.Blocks.Interfaces.RealOutput m_flow_outletHot[nComp] annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,110})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end DHNRackBaseI;
