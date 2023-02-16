within MultiEnergySystem.DistrictHeatingNetwork.Components.Loads;
model FixedReturnPowerLoad
  "Model a power controlled load with controllable fixed return temperature."
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.cp;

  parameter Modelica.Units.SI.Pressure dp_nominale "Pressure drop across the component";
  parameter Real Kv(unit = "m3/h") = 0 "Metri Flow Coefficient ";

  Modelica.Units.SI.Temperature Tin "Inlet temperature of the load";
  Modelica.Units.SI.Temperature Tout "Outlet temperature of the load";

  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientVale
    loadValve(
    Kv=Kv,
    dp_nom=dp_nominale,
    nomOpening=1,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear)
    annotation (Placement(visible=true, transformation(
        origin={-50,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer loadHX(
      allowFlowReversal=false) annotation (Placement(visible=true,
        transformation(
        origin={-8,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor loadReturnTemperatureSensor annotation (
    Placement(visible = true, transformation(origin={24,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Controllers.AWPIContinuous aWPIContinuous(
    Kp=1,
    Ti=1,
    Umax=1,
    Umin=0) annotation (Placement(visible=true, transformation(
        origin={-72,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput valveRef annotation (
    Placement(visible = true, transformation(origin = {-130, 24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput loadConsumptionRef annotation (
    Placement(visible = true, transformation(origin = {-10, 38}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));

equation

  Tin = inStream(inlet.h_out)/cp;
  Tout = loadReturnTemperatureSensor.T + 273.15;
  connect(inlet, loadValve.inlet) annotation (
    Line(points={{-100,0},{-60,0}},        color = {168, 168, 168}));
  connect(loadValve.outlet, loadHX.inlet) annotation (
    Line(points={{-40,0},{-18,0}},        color = {168, 168, 168}));
  connect(loadHX.outlet, loadReturnTemperatureSensor.inlet) annotation (
    Line(points={{2,0},{14,0}},        color = {168, 168, 168}));
  connect(loadReturnTemperatureSensor.outlet, outlet) annotation (
    Line(points={{34,0},{100,0}},                 color = {168, 168, 168}));
  connect(aWPIContinuous.controlAction, loadValve.opening) annotation (
    Line(points={{-63.4,20},{-50,20},{-50,8}},      color = {0, 0, 127}));
  connect(valveRef, aWPIContinuous.REF) annotation (
    Line(points={{-130,24},{-106,24},{-106,23.8},{-80.6,23.8}},
                                           color = {0, 0, 127}));
  connect(loadHX.Ptransfer, loadConsumptionRef)
    annotation (Line(points={{-8,8},{-8,24},{-10,24},{-10,38}},
                                                color={0,0,127}));
  connect(loadReturnTemperatureSensor.T, aWPIContinuous.FeedBack) annotation (
    Line(points={{24,9},{24,12},{-90,12},{-90,17},{-80.6,17}},          color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, 60}, {100, -20}})),
    Icon(graphics={  Rectangle(origin = {0, -20}, fillColor = {208, 208, 208}, fillPattern = FillPattern.Solid, extent = {{-100, 80}, {100, -80}}), Rectangle(origin = {-36, 20}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-18, 16}, {18, -16}}), Rectangle(origin = {38, 20}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-18, 16}, {18, -16}}), Rectangle(origin = {82, 76}, fillColor = {208, 208, 208}, fillPattern = FillPattern.Solid, extent = {{-18, 16}, {18, -16}}), Polygon(origin = {1, 80}, fillColor = {208, 208, 208}, fillPattern = FillPattern.Solid, points = {{99, -20}, {-99, -20}, {-1, 20}, {-1, 20}, {99, -20}}), Rectangle(origin = {-75, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin = {75, 0}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}})}));
end FixedReturnPowerLoad;
