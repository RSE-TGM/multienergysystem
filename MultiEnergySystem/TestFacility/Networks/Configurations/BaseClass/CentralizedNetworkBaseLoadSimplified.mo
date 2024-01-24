within MultiEnergySystem.TestFacility.Networks.Configurations.BaseClass;
partial model CentralizedNetworkBaseLoadSimplified
   extends Plants.Configurations.BaseClass.CentralPlantBase;
   extends Loads.Configurations.BaseClass.LoadPlantBaseSimplified;
  inner DistrictHeatingNetwork.System system annotation (Placement(visible=true,
        transformation(
        origin={889,309},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
      Line(
      points={{100,-40},{100,38},{14,38},{14,205},{60,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
    annotation (Line(
      points={{140,-40},{140,58},{42,58},{42,265},{90,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
      Line(
      points={{260,-40},{256,-40},{256,60},{618,60},{618,205},{640,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
     Line(
      points={{300,-40},{300,38},{636,38},{636,265},{650,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
      Line(
      points={{420,-40},{420,80},{152,80},{152,205},{180,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet)
    annotation (Line(
      points={{460,-40},{460,112},{170,112},{170,265},{110,265}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
      Line(
      points={{580,-40},{580,132},{330,132},{330,205},{400,205}},
      color={140,56,54},
      thickness=0.5));
  connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
      Line(
      points={{620,-40},{620,158},{358,158},{358,264},{354,264},{354,265},{330,265}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralizedNetworkBaseLoadSimplified;
