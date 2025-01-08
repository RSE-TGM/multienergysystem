within MultiEnergySystem.TestFacility.Interfaces;
partial model SystemInterfaceBaseII
  Modelica.Blocks.Interfaces.RealInput theta "Valve opening" annotation (Placement(transformation(extent={{-120,40},{-100,60}}), iconTransformation(extent={{-120,40},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput omega "Input for pump frequency"
    annotation (Placement(transformation(extent={{-120,60},{-100,80}}), iconTransformation(extent={{-120,60},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput TTin "Inlet temperature" annotation (Placement(transformation(extent={{100,40},{120,60}}), iconTransformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealOutput TTout "Outlet temperature"
    annotation (Placement(transformation(extent={{100,20},{120,40}}), iconTransformation(extent={{100,20},{120,40}})));
  Modelica.Blocks.Interfaces.RealOutput PTin "Inlet pressure" annotation (Placement(transformation(extent={{100,0},{120,20}}), iconTransformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Interfaces.RealOutput PTout "Outlet pressure" annotation (Placement(transformation(extent={{100,-20},{120,0}}), iconTransformation(extent={{100,-20},{120,0}})));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort "Thermal connector"
                                                                   annotation (Placement(transformation(extent={{-120,-80},{-100,-60}}), iconTransformation(extent={{-120,-80},{-100,
            -60}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletcold "Inlet connector for fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={-20,110},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-39,115},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlethot "Outlet connector for fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={20,110},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={39,115},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput m_flow_ "Mass flow rate" annotation (Placement(transformation(extent={{100,60},{120,80}}), iconTransformation(extent={{100,60},{120,80}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlethot "Inlet connector for fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={24,-100},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={39,-115},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletcold "Outlet connector for fluid" annotation (Placement(
      visible=true,
      transformation(
        origin={-22,-102},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-39,-115},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  annotation (                                                   Diagram(coordinateSystem(preserveAspectRatio=false)));
end SystemInterfaceBaseII;
