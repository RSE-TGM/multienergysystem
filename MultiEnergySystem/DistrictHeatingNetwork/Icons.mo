within MultiEnergySystem.DistrictHeatingNetwork;
package Icons "Icon package for DHN components"
  extends Modelica.Icons.IconsPackage;

  package Water
    extends Modelica.Icons.IconsPackage;

    partial model SourceP
      annotation (
        Icon(graphics={  Ellipse(fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Text(textColor = {255, 255, 255}, extent = {{-20, 34}, {28, -26}}, textString = "P"), Text(origin = {0, 31}, textColor = {140, 56, 54}, extent = {{-100, -111}, {100, -151}}, textString = "%name")}));
    end SourceP;

    partial model SourceW
      annotation (
        Icon(graphics={  Rectangle(fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {80, -40}}), Polygon(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-12, -20}, {66, 0}, {-12, 20}, {34, 0}, {-12, -20}}), Text(origin = {0, 14}, textColor = {140, 56, 54}, extent = {{-100, -74}, {100, -114}}, textString = "%name")}));
    end SourceW;

    partial model WaterPump
    equation

      annotation (
        Icon(graphics={  Text(origin = {0, 39}, textColor = {140, 56, 54}, extent = {{-100, -99}, {100, -139}}, textString = "%name"), Ellipse(origin = {0, -20}, lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-60, 80}, {60, -40}}), Polygon(origin = {0, -20}, lineColor = {192, 80, 77}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, points = {{-30, 52}, {-30, -8}, {48, 20}, {-30, 52}})}));
    end WaterPump;

    partial model Valve
    equation

      annotation (
        Icon(graphics={  Polygon(lineColor = {255, 255, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-100, 0}, {100, 0}, {100, 0}, {0, 0}, {-100, 0}, {-100, 0}}), Polygon(points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(visible = false, points = {{-20, 25}, {-20, 63}, {0, 41}, {20, 63}, {20, 25}}, thickness = 0.5), Line(points = {{0, 52}, {0, 0}}), Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, 52}}), Ellipse(visible = false, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 94}, {40, 14}}), Polygon(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.75, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Text(origin = {0, 14}, textColor = {140, 56, 54}, extent = {{-100, -74}, {100, -114}}, textString = "%name")}));
    end Valve;

    partial model ThroughSensor
    equation

      annotation (
        Icon(graphics={  Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent = {{-40, -20}, {40, -60}}), Line(points = {{40, 60}, {60, 60}}, color = {140, 56, 54}), Ellipse(lineColor = {140, 56, 54}, extent = {{-40, 100}, {40, 20}}), Line(points = {{0, 20}, {0, -20}}, color = {140, 56, 54}), Text(origin={0,66},     textColor = {140, 56, 54}, extent={{-100,
                  -126},{100,-166}},                                                                                                                                                                                                        textString = "%name")}));
    end ThroughSensor;

    partial model OnePointSensor
    equation

      annotation (
        Icon(graphics={  Line(points = {{0, 20}, {0, -20}}, color = {140, 56, 54}), Line(points={{-10,0},
                  {10,0}},                                                                                              color = {140, 56, 54},
              origin={0,110},
              rotation=90),                                                                                                                     Ellipse(lineColor = {140, 56, 54}, extent = {{-40, 100}, {40, 20}}), Text(origin={0,66},   textColor = {140, 56, 54}, extent={{-100,
                  -126},{100,-166}},                                                                                                                                                                                                        textString = "%name")}));
    end OnePointSensor;

    partial model Pipe
      annotation (
        Icon(graphics={  Rectangle(fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, extent={{-100,32},
                  {100,-32}}),                                                                                                     Text(origin={0,34},    textColor = {140, 56, 54}, extent = {{-100, -74}, {100, -114}}, textString = "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end Pipe;
  end Water;

  package Generic
    extends Modelica.Icons.IconsPackage;

    partial model MetalWall
      annotation (
        Icon(graphics={  Rectangle(extent = {{-80, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid)}));
    end MetalWall;

    partial model HeatFlow
      annotation (
        Icon(graphics={  Rectangle(extent = {{-80, 20}, {80, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward)}));
    end HeatFlow;

    partial model Utilities "Icon for utility packages"
      annotation (
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(lineColor = {75, 138, 73}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Polygon(origin = {-0.617, -0.1418}, rotation = 45, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-15, 93.333}, {-15, 68.333}, {0, 58.333}, {15, 68.333}, {15, 93.333}, {20, 93.333}, {25, 83.333}, {25, 58.333}, {10, 43.333}, {10, -41.667}, {25, -56.667}, {25, -76.667}, {10, -91.667}, {0, -91.667}, {0, -81.667}, {5, -81.667}, {15, -71.667}, {15, -61.667}, {5, -51.667}, {-5, -51.667}, {-15, -61.667}, {-15, -71.667}, {-5, -81.667}, {0, -81.667}, {0, -91.667}, {-10, -91.667}, {-25, -76.667}, {-25, -56.667}, {-10, -41.667}, {-10, 43.333}, {-25, 58.333}, {-25, 83.333}, {-20, 93.333}, {-15, 93.333}}), Polygon(origin = {8.102, 9.218}, rotation = -45, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-15, 87.273}, {15, 87.273}, {20, 82.273}, {20, 27.273}, {10, 17.273}, {10, 7.273}, {20, 2.273}, {20, -2.727}, {5, -2.727}, {5, -77.727}, {10, -87.727}, {5, -112.727}, {-5, -112.727}, {-10, -87.727}, {-5, -77.727}, {-5, -2.727}, {-20, -2.727}, {-20, 2.273}, {-10, 7.273}, {-10, 17.273}, {-20, 27.273}, {-20, 82.273}, {-15, 87.273}})}),
        Documentation(info = "<html>
    <p>This icon indicates a package containing utility classes.</p>
    </html>"));
    end Utilities;
  end Generic;

  package ThermalMachines
    extends Modelica.Icons.IconsPackage;

    partial model Boiler
    equation

      annotation (
        Icon(graphics={  Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Forward, extent = {{-60, 80}, {60, -80}}), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(origin = {0, -6}, textColor = {140, 56, 54}, extent = {{-100, -74}, {100, -114}}, textString = "%name"), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}})}));
    end Boiler;

    partial model ElectricBoiler
      extends
        MultiEnergySystem.DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;
    equation

      annotation (
        Icon(graphics = {Polygon(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
    end ElectricBoiler;

    partial model HeatPump
    equation

      annotation (
        Icon(graphics={  Rectangle(origin = {47, -13}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, 19}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Ellipse(origin = {-40, 6}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-100, 60}, {100, -60}}), Rectangle(origin = {47, 35}, fillColor = {140, 56, 54}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Rectangle(origin = {47, -27}, fillColor = {140, 56, 54}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Ellipse(origin = {-44, 0}, lineColor = {140, 56, 54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Rectangle(origin = {47, 3}, fillColor = {140, 56, 54}, fillPattern = FillPattern.Solid, extent = {{-33, 3}, {33, -3}}), Polygon(origin = {-44, 0}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}}), Text(origin = {0, -100}, textColor = {140, 56, 54}, extent = {{-100, 20}, {100, -20}}, textString = "%name")}));
    end HeatPump;
  end ThermalMachines;

  package Gas
    partial model SourceP
      annotation (
        Icon(graphics={  Ellipse(lineColor = {182, 109, 49},fillColor = {247, 150, 70}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Text(textColor = {255, 255, 255}, extent = {{-20, 34}, {28, -26}}, textString = "P"), Text(origin = {0, 31}, textColor = {182, 109, 49}, extent = {{-100, -111}, {100, -151}}, textString = "%name")}));
    end SourceP;

    partial model SourceW
      annotation (
        Icon(graphics={  Rectangle(lineColor = {182, 109, 49},fillColor = {247, 150, 70}, fillPattern = FillPattern.Solid, extent = {{-80, 40}, {80, -40}}), Polygon(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-12, -20}, {66, 0}, {-12, 20}, {34, 0}, {-12, -20}}), Text(origin = {0, 14}, textColor = {182, 109, 49}, extent = {{-100, -74}, {100, -114}}, textString = "%name")}));
    end SourceW;

    partial model Valve
    equation

      annotation (
        Icon(graphics={  Polygon(lineColor = {255, 255, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-100, 0}, {100, 0}, {100, 0}, {0, 0}, {-100, 0}, {-100, 0}}), Polygon(points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(visible = false, points = {{-20, 25}, {-20, 63}, {0, 41}, {20, 63}, {20, 25}}, thickness = 0.5), Line(points = {{0, 52}, {0, 0}}), Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, 52}}), Ellipse(visible = false, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 94}, {40, 14}}), Polygon(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.Solid, lineThickness = 0.75, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Text(origin = {0, 14}, textColor = {182, 109, 49}, extent = {{-100, -74}, {100, -114}}, textString = "%name")}));
    end Valve;

    partial model PressureDrop
    equation

      annotation (
        Icon(graphics={  Polygon(lineColor = {255, 255, 255}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, points = {{-100, 0}, {100, 0}, {100, 0}, {0, 0}, {-100, 0}, {-100, 0}}), Polygon(points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(visible = false, points = {{-20, 25}, {-20, 63}, {0, 41}, {20, 63}, {20, 25}}, thickness = 0.5), Line(points = {{0, 52}, {0, 0}}, thickness = 0.35), Rectangle(fillPattern = FillPattern.Solid, extent = {{-20, 60}, {20, 52}}), Polygon(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.Solid, lineThickness = 0.75, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Text(origin = {0, 14}, textColor = {182, 109, 49}, extent = {{-100, -74}, {100, -114}}, textString = "%name"), Line(origin = {29.74, 49.81}, points = {{-29.7428, 10.186}, {-29.7428, 50.186}, {30.2572, 50.186}, {-29.7428, -49.814}}, thickness = 0.35)}));
    end PressureDrop;
    extends Modelica.Icons.IconsPackage;
  end Gas;
end Icons;
