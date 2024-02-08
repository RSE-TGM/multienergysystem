within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
model FlowCoefficientOnOffValve
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort(allowFlowReversal = true);
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Water.Valve;
  parameter Types.PerUnit nomOpening = 1 "Nominal valve opening" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Types.PerUnit minimumOpening = 0.001 "Minimum opening area, avoid no flow condition, default 3mm diameter" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Real Kv(unit = "m3/h") = 12 "Metri Flow Coefficient" annotation (
    Dialog(group = "Valve characteristics"));
  parameter Components.Types.valveOpeningChar openingChar = Components.Types.valveOpeningChar.Linear "opening characteristic" annotation (
    Dialog(group = "Valve characteristics"));

// Nominal Values
  parameter Modelica.Units.SI.PressureDifference dp_nom = 2e5 "Pressure drop between supply and return, as imposed by the differential pump";
  parameter Types.Density rho_nom = 1000 "Nominal fluid density at supply";
  parameter Real q_m3h_nom = 6 "Nominal volumetric flowrate in m3h";

// Start values
  parameter Types.Temperature Tin_start = 20 + 273.15 annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Pressure pin_start = 2e5 annotation (
    Dialog(group = "Initialisation"));
  parameter Types.Density rho_start = 985 "Start value fluid density at the inlet" annotation (
    Dialog(group = "Initialisation"));
  parameter Real q_m3h_start(unit = "m3/h") = 6 "Start value volumetric flowrate" annotation (
    Dialog(group = "Initialisation"));

  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve valve(
    allowFlowReversal=true,
    nomOpening=nomOpening,
    minimumOpening=minimumOpening,
    Kv=Kv,
    openingChar=openingChar,
    dp_nom=dp_nom,
    rho_nom=rho_nom,
    q_m3h_nom=q_m3h_nom,
    Tin_start=Tin_start,
    pin_start=pin_start,
    rho_start=rho_start,
    q_m3h_start=q_m3h_start)
    annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  Modelica.Blocks.Math.BooleanToReal Command(realTrue=1, realFalse=0)
    annotation (Placement(transformation(
        extent={{-10,-9.5},{10,9.5}},
        rotation=-90,
        origin={0.5,50})));
  Modelica.Blocks.Interfaces.BooleanInput u annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,32})));
equation

  connect(valve.inlet, inlet) annotation (Line(
      points={{-30,0},{-100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(valve.outlet, outlet) annotation (Line(
      points={{30,0},{100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(Command.y, valve.opening) annotation (Line(points={{0.5,39},{0.5,31.5},
          {0,31.5},{0,24}}, color={0,0,127}));
  connect(Command.u, u) annotation (Line(points={{0.5,62},{0.5,81},{0,81},{0,100}},
        color={255,0,255}));
annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end FlowCoefficientOnOffValve;
