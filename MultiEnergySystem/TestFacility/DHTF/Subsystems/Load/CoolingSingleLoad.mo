within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
model CoolingSingleLoad "S7X0 - Cooling Single Load (HX)"
  extends CoolingSingleLoadBase;

  Modelica.Blocks.Interfaces.RealInput theta_FCV7X1 "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{60,27},{40,47}}),
      iconTransformation(origin={-110,70}, extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Interfaces.RealInput theta_TCV7X1 "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{-63,-93},{-43,-113}}),
      iconTransformation(origin={-110,50}, extent={{-10,-10},{10,10}})));
equation

  connect(FCV7X1.opening, theta_FCV7X1) annotation (Line(points={{28,37.5},{28,37},{50,37}}, color={0,0,127}));
  connect(TCV7X1.opening, theta_TCV7X1) annotation (Line(points={{-28,-103.5},{-31.5,-103.5},{-31.5,-103},{-53,-103}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={1,1})));
end CoolingSingleLoad;
