within MultiEnergySystem.TestFacility.Export.Tests;
model Test_CaseCentralisedII_Polimi_I
  extends Modelica.Icons.Example;
  FMU.CaseCentralisedII_Polimi_I facility annotation (Placement(transformation(extent={{12,-42},{82,28}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC01SP(y=0) annotation (Placement(transformation(extent={{-90,78},{-70,98}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVC02SP(y=0.3) annotation (Placement(transformation(extent={{-90,64},{-70,84}})));
  Modelica.Blocks.Sources.BooleanExpression thetaFV933SP annotation (Placement(transformation(extent={{-90,48},{-70,68}})));
  Modelica.Blocks.Sources.BooleanExpression GB101statusSP(y=true) annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  Modelica.Blocks.Sources.RealExpression thetaFCVX01SP(y=1) annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
  Modelica.Blocks.Sources.RealExpression deltapP901SP(y=1e5) annotation (Placement(transformation(extent={{-90,16},{-70,36}})));
  Modelica.Blocks.Sources.RealExpression ToutGB101SP(y=80 + 273.15) annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  Modelica.Blocks.Sources.BooleanExpression EB401statusSP(y=true) annotation (Placement(transformation(extent={{-90,-72},{-70,-52}})));
  Modelica.Blocks.Sources.RealExpression ToutEB401SP(y=80 + 273.15) annotation (Placement(transformation(extent={{-90,-44},{-70,-24}})));
  Modelica.Blocks.Sources.RealExpression omegaP101SP(y=2*3.14159*30) annotation (Placement(transformation(extent={{-90,-16},{-70,4}})));
  Modelica.Blocks.Sources.RealExpression m_flow_P101SP(y=0.9) annotation (Placement(transformation(extent={{-90,-58},{-70,-38}})));
  Modelica.Blocks.Sources.RealExpression TT7X1SP(y=60 + 273.15) annotation (Placement(transformation(extent={{-90,-86},{-70,-66}})));
  Modelica.Blocks.Sources.RealExpression EX7X1SP(y=if time < 2e3 then 30e3 else 28e3)
                                                         annotation (Placement(transformation(extent={{-90,-100},{-70,-80}})));
equation
  connect(thetaFCVC01SP.y, facility.FCVC01theta) annotation (Line(points={{-69,88},{-2,88},{-2,26.25},{10.25,26.25}}, color={0,0,127}));
  connect(thetaFCVC02SP.y, facility.FCVC02theta) annotation (Line(points={{-69,74},{-4,74},{-4,22.75},{10.25,22.75}}, color={0,0,127}));
  connect(thetaFV933SP.y, facility.FV933status) annotation (Line(points={{-69,58},{-6,58},{-6,19.25},{10.25,19.25}}, color={255,0,255}));
  connect(thetaFCVX01SP.y, facility.FCV901theta) annotation (Line(points={{-69,42},{-8,42},{-8,3.5},{10.25,3.5}}, color={0,0,127}));
  connect(thetaFCVX01SP.y, facility.FCV101theta) annotation (Line(points={{-69,42},{-8,42},{-8,-12.25},{10.25,-12.25}}, color={0,0,127}));
  connect(thetaFCVX01SP.y, facility.FCV401theta) annotation (Line(points={{-69,42},{-8,42},{-8,-26.25},{10.25,-26.25}}, color={0,0,127}));
  connect(deltapP901SP.y, facility.P901input) annotation (Line(points={{-69,26},{-16,26},{-16,0.175},{10.25,0.175}}, color={0,0,127}));
  connect(EB401statusSP.y, facility.EB401_status) annotation (Line(points={{-69,-62},{6,-62},{6,-29.75},{10.25,-29.75}}, color={255,0,255}));
  connect(GB101statusSP.y, facility.GB101status) annotation (Line(points={{-69,-20},{-4,-20},{-4,-15.75},{10.25,-15.75}}, color={255,0,255}));
  connect(ToutGB101SP.y, facility.GB101Tout_SP) annotation (Line(points={{-69,10},{-18,10},{-18,-5.25},{10.25,-5.25}}, color={0,0,127}));
  connect(omegaP101SP.y, facility.P101input) annotation (Line(points={{-69,-6},{-22,-6},{-22,-8.75},{10.25,-8.75}}, color={0,0,127}));
  connect(ToutEB401SP.y, facility.EB401Tout_SP) annotation (Line(points={{-69,-34},{0,-34},{0,-19.25},{10.25,-19.25}}, color={0,0,127}));
  connect(m_flow_P101SP.y, facility.P401input) annotation (Line(points={{-69,-48},{4,-48},{4,-22.75},{10.25,-22.75}}, color={0,0,127}));
  connect(facility.RR01Tout_SP, facility.FCVC01theta) annotation (Line(points={{10.25,15.75},{4,15.75},{4,26.25},{10.25,26.25}}, color={0,0,127}));
  connect(facility.FCVR01theta, facility.FCVC01theta) annotation (Line(points={{10.25,12.25},{4,12.25},{4,26.25},{10.25,26.25}}, color={0,0,127}));
  connect(facility.PR01omega, facility.FCVC01theta) annotation (Line(points={{10.25,8.75},{4,8.75},{4,26.25},{10.25,26.25}}, color={0,0,127}));
  connect(TT7X1SP.y, facility.TT701_SP) annotation (Line(points={{-69,-76},{15.5,-76},{15.5,-43.75}}, color={0,0,127}));
  connect(facility.TT711_SP, facility.TT701_SP) annotation (Line(points={{19,-43.75},{19,-50},{15.5,-50},{15.5,-43.75}}, color={0,0,127}));
  connect(facility.TT721_SP, facility.TT701_SP) annotation (Line(points={{22.5,-43.75},{22.5,-50},{15.5,-50},{15.5,-43.75}}, color={0,0,127}));
  connect(facility.TT731_SP, facility.TT701_SP) annotation (Line(points={{26,-43.75},{26,-50},{15.5,-50},{15.5,-43.75}}, color={0,0,127}));
  connect(EX7X1SP.y, facility.EX701Pt_SP) annotation (Line(points={{-69,-90},{50.5,-90},{50.5,-43.75}}, color={0,0,127}));
  connect(facility.EX711Pt_SP, facility.EX701Pt_SP) annotation (Line(points={{54,-43.75},{54,-50},{50.5,-50},{50.5,-43.75}}, color={0,0,127}));
  connect(facility.EX721Pt_SP, facility.EX701Pt_SP) annotation (Line(points={{57.5,-43.75},{57.5,-50},{50.5,-50},{50.5,-43.75}}, color={0,0,127}));
  connect(facility.EX731Pt_SP, facility.EX701Pt_SP) annotation (Line(points={{61,-43.75},{61,-50},{50.5,-50},{50.5,-43.75}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=4000, __Dymola_Algorithm="Dassl"));
end Test_CaseCentralisedII_Polimi_I;
