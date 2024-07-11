within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model Rete_Gas_2i_Simplified "Simplified version of Rete Gas 2i"
  extends Modelica.Icons.Example;
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s1(L=842.777, Di=
        2.091) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-178,188})));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure REMI annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-144,188})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s2(L=3273.422, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-204,170})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s3(L=100.058, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-182,156})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s4(L=1663.921, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-204,132})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s5_ViaCartabubbo(L
      =341.125, Di=1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-232,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s8(L=154.637, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-180,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s6(L=147.629, Di=
        1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-254,136})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s7(L=817.587, Di=
        1.079) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-276,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s9(L=1.635, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-148,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s10(L=13.807, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-130,100})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s11(L=503.188, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s12(L=238.385, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-76,118})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s13(L=10.754, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,102})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s14(L=589.227, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-22,56})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s15(L=57.126, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-4,36})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s16(L=19.065, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={14,56})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s17(L=60.53, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={38,36})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s18(L=880.651, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={64,56})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s19(
    L=540.807,
    cm=880,
    rhom=2000,
    lambdam=0.25,
    Di=1.472) "Polyester" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={142,28})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s20(L=14.682, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={142,-2})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s21(L=13.074, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={168,-20})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s22(L=95.937, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={142,-40})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s23(L=220.886, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={168,-62})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s24(L=92.59, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={142,-84})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s26(L=181.028, Di=
        1.325) "Viale Siena" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={186,-104})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s25(L=984.053, Di=
        1.603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={142,-126})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s27(L=14.527, Di=
        1.325) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={280,-104})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s28(L=84.565, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={244,-132})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s29(L=69.945, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={220,-152})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s30(L=138.527, Di=
        0.831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={244,-170})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s31(L=256.081, Di=
        0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={106,26})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s32(L=133.021, Di=
        0.1603) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={106,-20})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s36_Stadio(L=
        1224.898, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={78,2})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s33(L=75.784, Di=
        0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={106,-54})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s34_ViaSalerno(L=
        155.756, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={106,-94})));
  MultiEnergySystem.H2GasFacility.Components.Pipes.Round1DFV s35_ViaAndretta(L=
        226.029, Di=0.0831) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={78,-74})));
equation
  connect(s1.inlet, REMI.outlet) annotation (Line(
      points={{-168,188},{-154,188}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.inlet, s1.outlet) annotation (Line(
      points={{-204,180},{-204,188},{-188,188}},
      color={182,109,49},
      thickness=0.5));
  connect(s2.outlet, s3.inlet) annotation (Line(
      points={{-204,160},{-204,156},{-192,156}},
      color={182,109,49},
      thickness=0.5));
  connect(s4.inlet, s2.outlet) annotation (Line(
      points={{-204,142},{-204,160}},
      color={182,109,49},
      thickness=0.5));
  connect(s5_ViaCartabubbo.inlet, s4.outlet) annotation (Line(
      points={{-222,118},{-204,118},{-204,122}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.inlet, s4.outlet) annotation (Line(
      points={{-190,118},{-204,118},{-204,122}},
      color={182,109,49},
      thickness=0.5));
  connect(s7.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-266,118},{-242,118}},
      color={182,109,49},
      thickness=0.5));
  connect(s6.inlet, s5_ViaCartabubbo.outlet) annotation (Line(
      points={{-254,126},{-254,118},{-242,118}},
      color={182,109,49},
      thickness=0.5));
  connect(s8.outlet, s9.inlet) annotation (Line(
      points={{-170,118},{-158,118}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s10.inlet) annotation (Line(
      points={{-138,118},{-130,118},{-130,110}},
      color={182,109,49},
      thickness=0.5));
  connect(s9.outlet, s11.inlet) annotation (Line(
      points={{-138,118},{-120,118}},
      color={182,109,49},
      thickness=0.5));
  connect(s11.outlet, s12.inlet) annotation (Line(
      points={{-100,118},{-86,118}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s13.inlet) annotation (Line(
      points={{-66,118},{-54,118},{-54,112}},
      color={182,109,49},
      thickness=0.5));
  connect(s12.outlet, s14.inlet) annotation (Line(
      points={{-66,118},{-42,118},{-42,56},{-32,56}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s15.inlet) annotation (Line(
      points={{-12,56},{-4,56},{-4,46}},
      color={182,109,49},
      thickness=0.5));
  connect(s14.outlet, s16.inlet) annotation (Line(
      points={{-12,56},{4,56}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s17.inlet) annotation (Line(
      points={{24,56},{38,56},{38,46}},
      color={182,109,49},
      thickness=0.5));
  connect(s16.outlet, s18.inlet) annotation (Line(
      points={{24,56},{54,56}},
      color={182,109,49},
      thickness=0.5));
  connect(s18.outlet, s19.inlet) annotation (Line(
      points={{74,56},{142,56},{142,38}},
      color={182,109,49},
      thickness=0.5));
  connect(s19.outlet, s20.inlet) annotation (Line(
      points={{142,18},{142,8}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s21.inlet) annotation (Line(
      points={{142,-12},{142,-20},{158,-20}},
      color={182,109,49},
      thickness=0.5));
  connect(s20.outlet, s22.inlet) annotation (Line(
      points={{142,-12},{142,-30}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s23.inlet) annotation (Line(
      points={{142,-50},{142,-62},{158,-62}},
      color={182,109,49},
      thickness=0.5));
  connect(s22.outlet, s24.inlet) annotation (Line(
      points={{142,-50},{142,-74}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s26.inlet) annotation (Line(
      points={{142,-94},{142,-104},{176,-104}},
      color={182,109,49},
      thickness=0.5));
  connect(s24.outlet, s25.inlet) annotation (Line(
      points={{142,-94},{142,-116}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s27.inlet) annotation (Line(
      points={{196,-104},{270,-104}},
      color={182,109,49},
      thickness=0.5));
  connect(s26.outlet, s28.inlet) annotation (Line(
      points={{196,-104},{244,-104},{244,-122}},
      color={182,109,49},
      thickness=0.5));
  connect(s30.inlet, s28.outlet) annotation (Line(
      points={{244,-160},{244,-142}},
      color={182,109,49},
      thickness=0.5));
  connect(s28.outlet, s29.inlet) annotation (Line(
      points={{244,-142},{244,-152},{230,-152}},
      color={182,109,49},
      thickness=0.5));
  connect(s31.inlet, s19.inlet) annotation (Line(
      points={{106,36},{106,56},{142,56},{142,38}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.inlet, s31.outlet) annotation (Line(
      points={{106,-10},{106,16}},
      color={182,109,49},
      thickness=0.5));
  connect(s36_Stadio.inlet, s31.outlet) annotation (Line(
      points={{88,2},{106,2},{106,16}},
      color={182,109,49},
      thickness=0.5));
  connect(s32.outlet, s33.inlet) annotation (Line(
      points={{106,-30},{106,-44}},
      color={182,109,49},
      thickness=0.5));
  connect(s33.outlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{106,-64},{106,-84}},
      color={182,109,49},
      thickness=0.5));
  connect(s35_ViaAndretta.inlet, s34_ViaSalerno.inlet) annotation (Line(
      points={{88,-74},{106,-74},{106,-84}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},{300,
            300}}), graphics={
        Text(
          extent={{-142,226},{-102,212}},
          textColor={0,0,0},
          textString="REMI - Sciacca Presa 2 
Dati Taratura: 
Pressione = 4.93 bar 
Portata = 2088 Stm3/h
")}));
end Rete_Gas_2i_Simplified;
