within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model CentralisedSystemI_B_FMU
  extends TestFacility.Networks.Configurations.Centralised.CentralizedSystemI_B;
  Modelica.Blocks.Interfaces.RealInput EB401_Tout
    annotation (Placement(transformation(extent={{-418,-320},{-378,-280}})));
  Modelica.Blocks.Interfaces.RealInput GB101_Tout
    annotation (Placement(transformation(extent={{-334,-320},{-294,-280}})));
  Modelica.Blocks.Interfaces.RealInput q_P101
    annotation (Placement(transformation(extent={{-178,-200},{-218,-160}})));
  Modelica.Blocks.Interfaces.RealInput q_P401
    annotation (Placement(transformation(extent={{-266,-196},{-306,-156}})));
  Modelica.Blocks.Interfaces.RealInput FVC_901
    annotation (Placement(transformation(extent={{-692,94},{-732,134}})));
  Modelica.Blocks.Interfaces.RealInput q_P901
    annotation (Placement(transformation(extent={{-690,46},{-730,86}})));
  Modelica.Blocks.Interfaces.RealInput q_PR01
    annotation (Placement(transformation(extent={{646,-228},{686,-188}})));
  Modelica.Blocks.Interfaces.RealInput FCV_R01
    annotation (Placement(transformation(extent={{716,-350},{756,-310}})));
  Modelica.Blocks.Interfaces.RealInput RR01_Tout
    annotation (Placement(transformation(extent={{718,-78},{758,-38}})));
  Modelica.Blocks.Interfaces.RealInput FCV_701
    annotation (Placement(transformation(extent={{196,-170},{156,-130}})));
  Modelica.Blocks.Interfaces.RealInput FCV_731
    annotation (Placement(transformation(extent={{354,-170},{314,-130}})));
  Modelica.Blocks.Interfaces.RealInput FCV_711
    annotation (Placement(transformation(extent={{496,-170},{456,-130}})));
  Modelica.Blocks.Interfaces.RealInput FCV_721
    annotation (Placement(transformation(extent={{652,-170},{612,-130}})));
  Modelica.Blocks.Interfaces.RealInput TCV_701
    annotation (Placement(transformation(extent={{30,-340},{70,-300}})));
  Modelica.Blocks.Interfaces.RealInput TCV_731
    annotation (Placement(transformation(extent={{192,-340},{232,-300}})));
  Modelica.Blocks.Interfaces.RealInput TCV_711
    annotation (Placement(transformation(extent={{338,-340},{378,-300}})));
  Modelica.Blocks.Interfaces.RealInput TCV_721
    annotation (Placement(transformation(extent={{494,-340},{534,-300}})));
  Modelica.Blocks.Interfaces.RealInput FCV_C01
    annotation (Placement(transformation(extent={{314,214},{274,254}})));
  Modelica.Blocks.Interfaces.RealInput FCV_C02
    annotation (Placement(transformation(extent={{754,214},{714,254}})));
  Modelica.Blocks.Interfaces.RealInput FCV_101
    annotation (Placement(transformation(extent={{-178,-160},{-218,-120}})));
  Modelica.Blocks.Interfaces.RealInput FCV_401
    annotation (Placement(transformation(extent={{-266,-156},{-306,-116}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false)
    annotation (Placement(transformation(extent={{-187,15},{-207,35}})));
  Modelica.Blocks.Sources.BooleanConstant FV402_OnOff(k=true)
    annotation (Placement(transformation(extent={{-284,-26},{-304,-6}})));
  Modelica.Blocks.Sources.BooleanConstant FV401_OnOff(k=FV401_state)
    annotation (Placement(transformation(extent={{-394,-26},{-374,-6}})));
  Modelica.Blocks.Interfaces.RealOutput TT_902
    annotation (Placement(transformation(extent={{-740,186},{-720,206}})));
  Modelica.Blocks.Interfaces.RealOutput FT_901
    annotation (Placement(transformation(extent={{-740,156},{-720,176}})));
  Modelica.Blocks.Interfaces.RealOutput PT_902
    annotation (Placement(transformation(extent={{-740,172},{-720,192}})));
  Modelica.Blocks.Interfaces.RealOutput TT_702
    annotation (Placement(transformation(extent={{80,-130},{60,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_732
    annotation (Placement(transformation(extent={{240,-130},{220,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_712
    annotation (Placement(transformation(extent={{380,-130},{360,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TT_722
    annotation (Placement(transformation(extent={{540,-130},{520,-110}})));
equation
  connect(P901.in_omega, q_P901) annotation (Line(points={{-747.25,66.3},{-728.625,
          66.3},{-728.625,66},{-710,66}}, color={0,0,127}));
  connect(FCV901.opening, FVC_901) annotation (Line(points={{-749,115},{-730.5,115},
          {-730.5,114},{-712,114}}, color={0,0,127}));
  connect(FCVC01.opening, FCV_C01) annotation (Line(points={{258,235},{276,235},
          {276,234},{294,234}}, color={0,0,127}));
  connect(FCV_C02, FCVC02.opening)
    annotation (Line(points={{734,234},{698,234},{698,235}}, color={0,0,127}));
  connect(EB401.Tout_ref, EB401_Tout) annotation (Line(points={{-365,-301},{-374.5,
          -301},{-374.5,-300},{-398,-300}}, color={0,0,127}));
  connect(GB101.Tout_ref, GB101_Tout) annotation (Line(points={{-285,-301},{-285,
          -300},{-314,-300}}, color={0,0,127}));
  connect(P101.in_q_m3hr, q_P101) annotation (Line(points={{-234.48,-179.8},{-216.24,
          -179.8},{-216.24,-180},{-198,-180}}, color={0,0,127}));
  connect(P401.in_q_m3hr, q_P401) annotation (Line(points={{-312.48,-175.8},{-299.24,
          -175.8},{-299.24,-176},{-286,-176}}, color={0,0,127}));
  connect(FCV_101, FCV101.opening)
    annotation (Line(points={{-198,-140},{-232,-140}}, color={0,0,127}));
  connect(FCV401.opening, FCV_401)
    annotation (Line(points={{-310,-136},{-286,-136}}, color={0,0,127}));
  connect(TCV701.opening, TCV_701)
    annotation (Line(points={{90,-320},{50,-320}}, color={0,0,127}));
  connect(TCV731.opening, TCV_731)
    annotation (Line(points={{250,-320},{212,-320}}, color={0,0,127}));
  connect(TCV711.opening, TCV_711)
    annotation (Line(points={{390,-320},{358,-320}}, color={0,0,127}));
  connect(TCV721.opening, TCV_721)
    annotation (Line(points={{549.1,-320},{514,-320}}, color={0,0,127}));
  connect(FCV_R01, FCVR01.opening) annotation (Line(points={{736,-330},{750,-330},
          {750,-328},{766,-328},{766,-352}}, color={0,0,127}));
  connect(q_PR01, PR01.in_q_m3hr) annotation (Line(points={{666,-208},{682.01,-208},
          {682.01,-207.8},{698.02,-207.8}}, color={0,0,127}));
  connect(RR01_Tout, RR01.Tout_SP) annotation (Line(points={{738,-58},{767.5,-58},
          {767.5,-97.2}}, color={0,0,127}));
  connect(FCV_701, FCV701.opening)
    annotation (Line(points={{176,-150},{146,-150}}, color={0,0,127}));
  connect(FCV731.opening, FCV_731)
    annotation (Line(points={{306,-150},{334,-150}}, color={0,0,127}));
  connect(FCV_711, FCV711.opening)
    annotation (Line(points={{476,-150},{446,-150}}, color={0,0,127}));
  connect(FCV_721, FCV721.opening)
    annotation (Line(points={{632,-150},{606,-150}}, color={0,0,127}));
  connect(FV933_OnOff.y, FV933.u)
    annotation (Line(points={{-208,25},{-216.4,25}}, color={255,0,255}));
  connect(FV402_OnOff.y, FV402.u)
    annotation (Line(points={{-305,-16},{-314.8,-16}}, color={255,0,255}));
  connect(FV401_OnOff.y, FV401.u)
    annotation (Line(points={{-373,-16},{-361.2,-16}}, color={255,0,255}));
  connect(TT902.T, TT_902) annotation (Line(points={{-748.575,196.25},{-739.288,
          196.25},{-739.288,196},{-730,196}}, color={0,0,127}));
  connect(FT901.q_m3hr, FT_901)
    annotation (Line(points={{-748.5,166},{-730,166}}, color={0,0,127}));
  connect(PT902.p, PT_902) annotation (Line(points={{-748.5,181.5},{-739.25,
          181.5},{-739.25,182},{-730,182}}, color={0,0,127}));
  connect(TT722.T, TT_722)
    annotation (Line(points={{549.5,-120},{530,-120}}, color={0,0,127}));
  connect(TT712.T, TT_712)
    annotation (Line(points={{389.5,-120},{370,-120}}, color={0,0,127}));
  connect(TT732.T, TT_732)
    annotation (Line(points={{249.5,-120},{230,-120}}, color={0,0,127}));
  connect(TT702.T, TT_702)
    annotation (Line(points={{89.5,-120},{70,-120}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CentralisedSystemI_B_FMU;
