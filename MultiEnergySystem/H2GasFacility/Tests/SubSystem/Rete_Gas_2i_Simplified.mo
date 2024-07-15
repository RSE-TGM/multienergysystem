within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_Simplified "Simplified version of Rete Gas 2i"
  extends Modelica.Icons.Example;
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(L=842.777, Di=
        2.091) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-172,26})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure REMI annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-138,26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s2(L=3273.422, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-198,8})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(L=100.058, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-176,-6})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s4(L=1663.921, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-198,-30})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s5_ViaCartabubbo(L
      =341.125, Di=1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-226,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s8(L=154.637, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-174,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s6(L=147.629, Di=
        1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-248,-26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s7(L=817.587, Di=
        1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-270,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9(L=1.635, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-142,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s10(L=13.807, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-124,-62})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s11(L=503.188, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-104,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(L=238.385, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-44})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s13(L=10.754, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-48,-60})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14(L=589.227, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-14,-60})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s15(L=57.126, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={4,-80})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s16(L=19.065, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-60})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s17(L=60.53, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-80})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s18(L=880.651, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={72,-60})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
    L=540.807,
    cm=880,
    rhom=2000,
    lambdam=0.25,
    Di=1.472) "Polyester" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,-88})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(L=14.682, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,-118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(L=13.074, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={176,-136})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22(L=95.937, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,-156})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s23(L=220.886, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={176,-178})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s24(L=92.59, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,-200})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(L=181.028, Di=
        1.325) "Viale Siena" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={194,-220})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s25(L=984.053, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,-242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s27(L=14.527, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={288,-220})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28(L=84.565, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={252,-248})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s29(L=69.945, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={228,-268})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s30(L=138.527, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={252,-286})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(L=256.081, Di=
        0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={114,-90})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s32(L=133.021, Di=
        0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={114,-136})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(L=
        1224.898, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,-114})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s33(L=75.784, Di=
        0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={114,-170})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s34_ViaSalerno(L=
        155.756, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={114,-210})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s35_ViaAndretta(L=
        226.029, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={86,-190})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds1(L=2081.109,
      Di=0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-198,46})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds2(L=92.5, Di=
        0.1472) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-180,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds3(L=677.303, Di
      =0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-146,66})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds4(L=433.985, Di
      =0.1325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-124,82})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds5(L=303.305, Di
      =0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,100})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds6(L=8027.812,
      Di=0.1325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-114,144})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds7(L=2103.419,
      Di=0.1325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-6,130})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds8(L=13379.322,
      Di=0.1325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={74,174})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds9(L=193.484, Di
      =0.1325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-114,186})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds10(L=7.845, Di=
        0.1079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-146,200})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds11(L=357.121,
      Di=0.1079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-114,220})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds12(L=787.51, Di
      =0.1079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds13(L=190.14, Di
      =0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-44,242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds14(L=36.829, Di
      =0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={2,256})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds15(L=1015.74,
      Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,282})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds16(L=194.511,
      Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-148,242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds17(L=1077.595,
      Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-206,242})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV sds18(L=6.1, Di=
        0.0514) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-176,270})));
equation
  connect(s1.inlet, REMI.outlet) annotation (Line(
      points={{-162,26},{-148,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.inlet, s1.outlet) annotation (Line(
      points={{-198,18},{-198,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.outlet, s3.inlet) annotation (Line(
      points={{-198,-2},{-198,-6},{-186,-6}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, s2.outlet) annotation (Line(
      points={{-198,-20},{-198,-2}},
      color={182,109,49},
      thickness=0.5));
  connect(s5_ViaCartabubbo.inlet, s4.outlet) annotation (Line(
      points={{-216,-44},{-198,-44},{-198,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.inlet, s4.outlet) annotation (Line(
      points={{-184,-44},{-198,-44},{-198,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(s7.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-260,-44},{-236,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s6.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-248,-36},{-248,-44},{-236,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.outlet, s9.inlet) annotation (Line(
      points={{-164,-44},{-152,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s10.inlet) annotation (Line(
      points={{-132,-44},{-124,-44},{-124,-52}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s11.inlet) annotation (Line(
      points={{-132,-44},{-114,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s11.outlet, s12.inlet) annotation (Line(
      points={{-94,-44},{-80,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s13.inlet) annotation (Line(
      points={{-60,-44},{-48,-44},{-48,-50}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s14.inlet) annotation (Line(
      points={{-60,-44},{-48,-44},{-48,-40},{-32,-40},{-32,-60},{-24,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s15.inlet) annotation (Line(
      points={{-4,-60},{4,-60},{4,-70}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s16.inlet) annotation (Line(
      points={{-4,-60},{12,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s17.inlet) annotation (Line(
      points={{32,-60},{46,-60},{46,-70}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s18.inlet) annotation (Line(
      points={{32,-60},{62,-60}},
      color={182,109,49},
      thickness=0.5));
  connect(s18.outlet, s19.inlet) annotation (Line(
      points={{82,-60},{150,-60},{150,-78}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.outlet, s20.inlet) annotation (Line(
      points={{150,-98},{150,-108}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s21.inlet) annotation (Line(
      points={{150,-128},{150,-136},{166,-136}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s22.inlet) annotation (Line(
      points={{150,-128},{150,-146}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s23.inlet) annotation (Line(
      points={{150,-166},{150,-178},{166,-178}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s24.inlet) annotation (Line(
      points={{150,-166},{150,-190}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s26.inlet) annotation (Line(
      points={{150,-210},{150,-220},{184,-220}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s25.inlet) annotation (Line(
      points={{150,-210},{150,-232}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s27.inlet) annotation (Line(
      points={{204,-220},{278,-220}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s28.inlet) annotation (Line(
      points={{204,-220},{252,-220},{252,-238}},
      color={182,109,49},
      thickness=0.5));
  connect(s30.inlet, s28.outlet) annotation (Line(
      points={{252,-276},{252,-258}},
      color={182,109,49},
      thickness=0.5));
  connect(s28.outlet, s29.inlet) annotation (Line(
      points={{252,-258},{252,-268},{238,-268}},
      color={182,109,49},
      thickness=0.5));
  connect(s31.inlet, s19.inlet) annotation (Line(
      points={{114,-80},{114,-60},{150,-60},{150,-78}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.inlet, s31.outlet) annotation (Line(
      points={{114,-126},{114,-100}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.inlet, s31.outlet) annotation (Line(
      points={{96,-114},{114,-114},{114,-100}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.outlet, s33.inlet) annotation (Line(
      points={{114,-146},{114,-160}},
      color={182,109,49},
      thickness=0.5));
  connect(s33.outlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{114,-180},{114,-200}},
      color={182,109,49},
      thickness=0.5));
  connect(s35_ViaAndretta.inlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{96,-190},{114,-190},{114,-200}},
      color={182,109,49},
      thickness=0.5));
  connect(sds1.inlet, s1.outlet) annotation (Line(
      points={{-198,36},{-198,26},{-182,26}},
      color={182,109,49},
      thickness=0.5));
  connect(sds2.inlet, sds1.outlet) annotation (Line(
      points={{-190,66},{-198,66},{-198,56}},
      color={182,109,49},
      thickness=0.5));
  connect(sds2.outlet, sds3.inlet) annotation (Line(
      points={{-170,66},{-156,66}},
      color={182,109,49},
      thickness=0.5));
  connect(sds3.outlet, sds4.inlet) annotation (Line(
      points={{-136,66},{-136,72},{-124,72}},
      color={182,109,49},
      thickness=0.5));
  connect(sds4.outlet, sds5.inlet) annotation (Line(
      points={{-124,92},{-124,100},{-106,100}},
      color={182,109,49},
      thickness=0.5));
  connect(sds6.inlet, sds4.outlet) annotation (Line(
      points={{-114,134},{-116,134},{-116,100},{-124,100},{-124,92}},
      color={182,109,49},
      thickness=0.5));
  connect(sds6.outlet, sds7.inlet) annotation (Line(
      points={{-114,154},{-114,164},{-26,164},{-26,130},{-16,130}},
      color={182,109,49},
      thickness=0.5));
  connect(sds7.outlet, sds8.inlet) annotation (Line(
      points={{4,130},{74,130},{74,164}},
      color={182,109,49},
      thickness=0.5));
  connect(sds9.inlet, sds6.outlet) annotation (Line(
      points={{-114,176},{-114,154}},
      color={182,109,49},
      thickness=0.5));
  connect(sds10.inlet, sds9.outlet) annotation (Line(
      points={{-136,200},{-114,200},{-114,196}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.inlet, sds9.outlet) annotation (Line(
      points={{-114,210},{-114,196}},
      color={182,109,49},
      thickness=0.5));
  connect(sds11.outlet, sds12.inlet) annotation (Line(
      points={{-114,230},{-114,242},{-86,242}},
      color={182,109,49},
      thickness=0.5));
  connect(sds12.outlet, sds13.inlet) annotation (Line(
      points={{-66,242},{-54,242}},
      color={182,109,49},
      thickness=0.5));
  connect(sds13.outlet, sds14.inlet) annotation (Line(
      points={{-34,242},{-20,242},{-20,256},{-8,256}},
      color={182,109,49},
      thickness=0.5));
  connect(sds15.inlet, sds14.inlet) annotation (Line(
      points={{-20,272},{-20,256},{-8,256}},
      color={182,109,49},
      thickness=0.5));
  connect(sds16.inlet, sds11.outlet) annotation (Line(
      points={{-138,242},{-114,242},{-114,230}},
      color={182,109,49},
      thickness=0.5));
  connect(sds17.inlet, sds16.outlet) annotation (Line(
      points={{-196,242},{-158,242}},
      color={182,109,49},
      thickness=0.5));
  connect(sds18.inlet, sds16.outlet) annotation (Line(
      points={{-176,260},{-176,242},{-158,242}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}}), graphics={
        Text(
          extent={{-82,30},{-42,16}},
          textColor={0,0,0},
          textString="REMI - Sciacca Presa 2 
Dati Taratura: 
Pressione = 4.93 bar 
Portata = 2088 Stm3/h
")}));
end Rete_Gas_2i_Simplified;
