within MultiEnergySystem.DistrictHeatingNetwork;
package Icons
  extends Modelica.Icons.IconsPackage;

  package Water
    partial model SourceP

      annotation (Icon(graphics={
            Ellipse(fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}),
            Text(textColor = {255, 255, 255}, extent = {{-20, 34}, {28, -26}}, textString = "P"),
            Text(origin = {0, 31}, textColor = {140, 56, 54}, extent = {{-100, -111}, {100, -151}}, textString="%name")}));
    end SourceP;

    partial model SourceW

      annotation (Icon(graphics={
            Rectangle(fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {80, -40}}),
            Polygon(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-12, -20}, {66, 0}, {-12, 20}, {34, 0}, {-12, -20}}),
            Text(origin = {0, 14}, textColor = {140, 56, 54}, extent = {{-100, -74}, {100, -114}}, textString="%name")}));

    end SourceW;

    model WaterPump
    equation

    annotation(
        Icon(graphics = {Text(origin = {0, 39}, textColor = {140, 56, 54}, extent = {{-100, -99}, {100, -139}}, textString = "%name"), Ellipse(origin = {0, -20}, lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-60, 80}, {60, -40}}), Polygon(origin = {0, -20}, lineColor = {192, 80, 77}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, points = {{-30, 52}, {-30, -8}, {48, 20}, {-30, 52}})}));
end WaterPump;

    model Valve
    equation

    annotation(
        Icon(graphics = {Polygon(lineColor = {255, 255, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-100, 0}, {100, 0}, {100, 0}, {0, 0}, {-100, 0}, {-100, 0}}), Polygon(points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(visible = false, points = {{-20, 25}, {-20, 63}, {0, 41}, {20, 63}, {20, 25}}, thickness = 0.5), Line(points = {{0, 52}, {0, 0}}), Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, 52}}), Ellipse(visible = false, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 94}, {40, 14}}), Polygon(lineColor = {140, 56, 54},fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.75, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}})}));
end Valve;
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
