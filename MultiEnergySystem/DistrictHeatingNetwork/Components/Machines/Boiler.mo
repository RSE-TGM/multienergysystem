within MultiEnergySystem.DistrictHeatingNetwork.Components.Machines;
model Boiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  // User Parameter
  // Control
  parameter Real Kp = 1e3 "Boiler Proportional gain";
  parameter Real Ti = 25  "Boiler integral time constant";
  parameter Real Pmax = 160e3 "Boiler maximum power output";
  parameter Real Pmin = 0 "Boiler minimum power output";
  // Structural
  parameter Modelica.Units.SI.Length H = 0.8 "Boiler inner tank hight";
  parameter Modelica.Units.SI.Length D = 0.5 "Boiler inner tank diameter";

  parameter Modelica.Units.SI.Temperature T_start = 338.16 "Tank water temperature";
  parameter Modelica.Units.SI.Temperature T_ext = 298.16 "Ambient temperature";

  parameter Modelica.Units.SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter Modelica.Units.SI.Length dIns = 0.15 "Insulation thickness";

  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer heatHX
    annotation (Placement(visible=true, transformation(extent={{-10,-10},{10,10}},
          rotation=0)));
  Modelica.Blocks.Interfaces.RealInput T_Ref annotation (
    Placement(visible = true, transformation(origin = {-102, 30}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin={0,100},      extent = {{-20, -20}, {20, 20}}, rotation=-90)));
  MultiEnergySystem.DistrictHeatingNetwork.Controllers.AWPIContinuous gasBoilerPI(Kp = Kp, Ti = Ti, Umax = Pmax, Umin = Pmin)  annotation (
    Placement(visible = true, transformation(origin = {-16, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorageConstantMass gasBoilerInnerVolume(
    D=D,
    T_ext=T_ext,
    T_start=T_start,
    dIns=dIns,
    H=H,
    lambdaIns=lambdaIns) annotation (Placement(visible=true, transformation(
        origin={40,10},
        extent={{-9.99999,-14},{10,14}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor boilerFeedback annotation (
      Placement(visible=true, transformation(
        origin={73,3},
        extent={{-7,-7},{7,7}},
        rotation=0)));
equation
  connect(gasBoilerPI.REF, T_Ref) annotation (
    Line(points={{-24,30},{-102,30}},      color = {0, 0, 127}));
  connect(gasBoilerPI.controlAction, heatHX.Ptransfer) annotation (Line(points={{-5,26},{0,26},{0,8}},
                                                          color={0,0,127}));
  connect(heatHX.inlet, inlet) annotation (Line(
      points={{-10,0},{-100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(boilerFeedback.outlet, outlet) annotation (Line(
      points={{77.2,0.2},{90,0.2},{90,0},{100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(heatHX.outlet, gasBoilerInnerVolume.inlet) annotation (Line(
      points={{10,0},{30,0}},
      color={140,56,54},
      thickness=0.5));
  connect(gasBoilerInnerVolume.outlet, boilerFeedback.inlet) annotation (Line(
      points={{30,20},{30,28},{60,28},{60,0.2},{68.8,0.2}},
      color={140,56,54},
      thickness=0.5));
  connect(gasBoilerInnerVolume.temperatureMixVolume, gasBoilerPI.FeedBack)
    annotation (Line(points={{50,18},{56,18},{56,14},{-34,14},{-34,22},{-24,22}},
        color={0,0,127}));
  annotation (
    Icon(graphics={  Rectangle(fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, extent={{-100,
              100},{100,-100}}),                                                                                                 Text(origin={-1,46},    extent = {{-61, 34}, {61, -34}}, textString = "Gas
Boiler"), Ellipse(origin = {0, -48}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, -45}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}})}),
    Diagram(coordinateSystem(extent = {{-120, 40}, {100, -20}})));
end Boiler;
