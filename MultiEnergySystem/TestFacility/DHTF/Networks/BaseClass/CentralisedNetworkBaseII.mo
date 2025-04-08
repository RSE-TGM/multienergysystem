within MultiEnergySystem.TestFacility.DHTF.Networks.BaseClass;
partial model CentralisedNetworkBaseII
  extends DHTF.Systems.Distribution.CentralPlantBaseII(redeclare model MediumCP = WaterHot, cf = cfp, n = np);
  extends DHTF.Systems.Load.LoadPlantBaseII(redeclare model MediumLPHot = WaterHot, redeclare model MediumLPCold = WaterCold, cf = cfp, n = np);
  replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  parameter DistrictHeatingNetwork.Types.PerUnit cfp = 5e-3;
  parameter Integer np = 3 "Number of volumes in each pipe";
equation
  connect(rackL3L4.outletComp, PL711_rackL3L4_TT712.inlet) annotation (Line(
      points={{86.5,171.7},{86.5,100},{400,100},{400,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, rackL3L4.inletComp) annotation (Line(
      points={{440,-46},{440,112},{132,112},{132,160},{131.95,160},{131.95,172.15}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_rackL2L3_TT702.inlet, S900_rackL3L4_hot.outlet) annotation (Line(
      points={{80,-48},{80,72},{-24,72},{-24,205},{-40,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, S900_rackL2L3_cold.inlet) annotation (Line(
      points={{120,-48},{120,82},{-4,82},{-4,241},{-60,241}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL4L5.outletComp, PL721_rackL4L5_TT722.inlet) annotation (Line(
      points={{324.5,171.7},{324.5,134},{560,134},{560,-46}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, rackL4L5.inletComp) annotation (Line(
      points={{600,-46},{600,156},{369.95,156},{369.95,172.15}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, rackL6L7.outletComp) annotation (Line(
      points={{240,-50},{240,60},{528.5,60},{528.5,171.7}},
      color={140,56,54},
      thickness=0.5));
  connect(rackL6L7.inletComp, PL731_FT731_rackL6L7.outlet) annotation (Line(
      points={{573.95,172.15},{573.95,92},{574,92},{574,20},{280,20},{280,-50}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false), graphics={
        Line(
          points={{840,-304},{840,-276}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{686,-274},{686,-302}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{802,-188},{802,-170},{734,-170},{734,-188}},
          color={28,108,200},
          thickness=1,
          arrow={Arrow.None,Arrow.Filled},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-14},{0,14}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1,
          origin={584,-394},
          rotation=-90)}));
end CentralisedNetworkBaseII;
