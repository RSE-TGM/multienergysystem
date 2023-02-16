within MultiEnergySystem.DistrictHeatingNetwork.Components.Machines;
model ElectricBoiler
  "Model of an electric boiler, controlled through a On Off controller "
  extends DHN4Control.Interfaces.PartialTwoPort;

 // Parameters

  parameter Modelica.Units.SI.Temperature T_start = 338.16 "Tank water temperature";
  parameter Modelica.Units.SI.Temperature T_ext = 298.16 "Ambient temperature";

  parameter Modelica.Units.SI.Time trise = 20 "rising time  for triggered trapezoid";

  parameter Real Pmax = 160e3 "Boiler maximum power output";
  parameter Real Pmin = 0 "Boiler minimum power output";

  parameter Real deltaT = 6 "Bandwith of ON/OFF Controller";

  parameter Modelica.Units.SI.Length h = 0.8 "Boiler inner tank hight";
  parameter Modelica.Units.SI.Length D = 0.5 "Boiler inner tank diameter";
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";

  Modelica.Blocks.Logical.OnOffController onOffController(bandwidth = deltaT) annotation (
    Placement(visible = true, transformation(origin = {-66, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid(amplitude = Pmax, rising = trise) annotation (
    Placement(visible = true, transformation(origin = {-30, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer powerTransfer
    annotation (Placement(visible=true, transformation(
        origin={-12,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Storage.LumpedStorage gasBoilerInnerVolume(D = D, T_ext = T_ext, T_start = T_start, dIns = dIns, h = h, lambdaIns = lambdaIns) annotation (
    Placement(visible = true, transformation(origin={40,2},     extent={{10,-10},
            {-10,10}},                                                                           rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput referenceT annotation (
    Placement(visible = true, transformation(origin = {-112, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-34, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  connect(triggeredTrapezoid.y, powerTransfer.Ptransfer)
    annotation (Line(points={{-19,34},{-14,34},{-14,8}}, color={0,0,127}));
  connect(onOffController.y, triggeredTrapezoid.u) annotation (
    Line(points={{-55,34},{-42,34}},      color = {255, 0, 255}));
  connect(referenceT, onOffController.reference) annotation (
    Line(points = {{-112, 40}, {-78, 40}}, color = {0, 0, 127}));

  connect(gasBoilerInnerVolume.outlet, outlet) annotation (Line(points={{40,12},
          {40,24},{100,24},{100,0}},color={168,168,168}));
  connect(powerTransfer.outlet, gasBoilerInnerVolume.inlet) annotation (Line(
        points={{-2,0},{12,0},{12,-16},{40,-16},{40,-8}},  color={168,168,168}));
  connect(inlet, powerTransfer.inlet)
    annotation (Line(points={{-100,0},{-22,0}}, color={168,168,168}));
  connect(gasBoilerInnerVolume.temperatureMixVolume, onOffController.u)
    annotation (Line(points={{31.7,8.1},{10,8.1},{10,16},{-86,16},{-86,28},{-78,
          28}}, color={0,0,127}));
annotation (
    Diagram(coordinateSystem(extent = {{-120, 60}, {100, -20}})),
    Icon(graphics={  Rectangle(fillColor = {173, 173, 173}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(origin = {0, -54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Text(origin = {1, 29}, extent = {{-55, 27}, {55, -27}}, textString = "OnOff
Boiler"), Polygon(origin = {2, -56}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ElectricBoiler;
