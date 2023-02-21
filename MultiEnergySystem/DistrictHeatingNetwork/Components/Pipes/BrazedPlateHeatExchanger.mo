within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;

model BrazedPlateHeatExchanger "CounterCurrent Brazed Plate Heat Exchanger"


  // General
  
  parameter Integer n = 3 "Number of volumes in the heat exchanger";
  parameter Integer nPlates = 18 "Number of plates in the BPHE";

  // Hot side
  
  parameter Modelica.Units.SI.PerUnit cf = 0.004
    "Constant Fanning friction coefficient - Hot Side";
  parameter Modelica.Units.SI.Velocity u_nom = 1
    "Nominal fluid velocity";
  parameter Modelica.Units.SI.PerUnit kc
    "Corrective factor for heat tranfer";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = Choices.Pipe.HCtypes.Middle
    "Location of pressure state";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt
    "Initialisation option" annotation (
    Dialog(tab = "Initialisation"));
  parameter Real k(unit = "Pa/(kg/s)") = 500
    "Coefficient for the calculation of the pressure loss across the pipe";
  parameter Modelica.Units.SI.Density rho_nom = 997
    "Nominal density of the fluid";
  parameter Modelica.Units.SI.Temperature T_start[n + 1] = linspace(Tin_start, Tout_start, n + 1)
    "Temperature start value of the fluid" annotation (
    Dialog(group = "Initialisation"));  


  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot "Inlet of the hot fluid" annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{10, 50}, {50, 90}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot "Outlet of the hot fluid" annotation(
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{10, -90}, {50, -50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold "Outlet of the cold fluid" annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-48, 48}, {-8, 88}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold "Inlet of the cold fluid" annotation(
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-50, -90}, {-10, -50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.round1DFV hotside annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.round1DFV coldside annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV wall(M = 500, Nw = n, Tstart1 = 333.15, TstartN = 303.15, Tstartbar = 318.15, cm = 500) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologyFV topology(Nw = n) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -26}, {10, -6}}, rotation = -90)));
equation
  connect(wall.int, hotside.wall) annotation(
    Line(points = {{24, 0}, {64, 0}}, color = {255, 238, 44}));
  connect(topology.side1, wall.ext) annotation(
    Line(points = {{-12, 0}, {16, 0}}, color = {255, 238, 44}));
  connect(coldside.wall, topology.side2) annotation(
    Line(points = {{-64, 0}, {-20, 0}}, color = {255, 238, 44}));
  connect(coldside.outlet, outcold.outcold) annotation(
    Line(points = {{-70, 10}, {-70, 70}}, color = {168, 168, 168}));
  connect(coldside.inlet, incold.incold) annotation(
    Line(points = {{-70, -10}, {-70, -70}}, color = {168, 168, 168}));
  connect(hotside.inlet, inhot.inhot) annotation(
    Line(points = {{70, 10}, {70, 70}}, color = {168, 168, 168}));
  connect(hotside.outlet, outhot.outhot) annotation(
    Line(points = {{70, -10}, {70, -70}}, color = {168, 168, 168}));
  annotation(
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -100}, {60, 100}}), graphics = {Rectangle( fillColor = {215, 215, 215}, fillPattern = FillPattern.Backward,extent = {{-60, 100}, {60, -100}}, radius = 20)}));
end BrazedPlateHeatExchanger;
