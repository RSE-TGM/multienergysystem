within MultiEnergySystem.DistrictHeatingNetwork;
package Icons
  extends Modelica.Icons.IconsPackage;

  package Water
    partial model SourceP

      annotation (Icon(graphics={
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-20,34},{28,-26}},
              lineColor={255,255,255},
              textString="P"),
            Text(extent={{-100,-78},{100,-106}}, textString="%name")}));
    end SourceP;

    partial model SourceW

      annotation (Icon(graphics={
            Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-12,-20},{66,0},{-12,20},{34,0},{-12,-20}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(extent={{-100,-52},{100,-80}}, textString="%name")}));

    end SourceW;
  end Water;

  package Generic
    partial model MetalWall
      annotation (
        Icon(graphics={  Rectangle(extent = {{-80, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {128, 128, 128},
                fillPattern =                                                                                                         FillPattern.Solid)}));
    end MetalWall;

    partial model HeatFlow
      annotation (
        Icon(graphics={  Rectangle(extent = {{-80, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                         FillPattern.Forward)}));
    end HeatFlow;
  end Generic;
end Icons;
