within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model BrazedPlateHeatExchanger "CounterCurrent Brazed Plate Heat Exchanger"

  // General
  parameter Boolean thermalInertia = true "if true then account for metal thermal inertia";
  parameter Integer n = 3 "Number of volumes in the heat exchanger";
  parameter Integer nPlates = 18 "Number of plates in the BPHE";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option";

  outer System system "system object for global defaults";

  // Hot side
  parameter Modelica.Units.SI.Length L_hot "Length of the tube hot side" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length h_hot = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length t_hot = 0.003 "Thickness of the tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length Di_hot "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Area Stot_hot "Total surface of a single tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Integer nPipes_hot = 2 "Number of parallel pipes" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.PerUnit cf_hot = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Real k_hot(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));

  parameter Integer n_hot = n "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter Modelica.Units.SI.Velocity u_nom_hot = 1 "Nominal fluid velocity" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter Modelica.Units.SI.Density rho_nom_hot = 997 "Nominal density of the fluid" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype_hot = Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));

  parameter Modelica.Units.SI.PerUnit kc_hot "Corrective factor for heat tranfer" annotation (
    Dialog(tab = "Hot Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(tab = "Hot Side", group = "Heat Transfer Model"));

  parameter Modelica.Units.SI.Length tIns_hot = 0.15 "Insulation thickness" annotation (
    Dialog(tab = "Hot Side", group = "Insulation"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns_hot = 0.04 "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Hot Side", group = "Insulation"));

  parameter Modelica.Units.SI.SpecificHeatCapacity cpm_hot = 445 "Metal specific heat capacity" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.Density rhom_hot = 8000 "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.ThermalConductivity lambdam_hot = 45 "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));

  parameter Modelica.Units.SI.MassFlowRate m_flow_start_hot "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start_hot "Pressure start value of in going fluid hot side" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start_hot "Pressure start value of outgoing fluid hot side" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy hin_start_hot "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tin_start_hot "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start_hot "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));

// Cold side
  parameter Modelica.Units.SI.Length L_cold "Length of the tube hot side" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length h_cold = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length t_cold = 0.003 "Thickness of the tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length Di_cold "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Area Stot_cold "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Integer nPipes_cold = 2 "Number of parallel pipes" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.PerUnit cf_cold = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Real k_cold(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));

  parameter Integer n_cold = n "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter Modelica.Units.SI.Velocity u_nom_cold = 1 "Nominal fluid velocity" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter Modelica.Units.SI.Density rho_nom_cold = 997 "Nominal density of the fluid" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype_cold = Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));

  parameter Modelica.Units.SI.PerUnit kc_cold "Corrective factor for heat tranfer" annotation (
    Dialog(tab = "Cold Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(tab = "Cold Side", group = "Heat Transfer Model"));

  parameter Modelica.Units.SI.Length tIns_cold = 0.15 "Insulation thickness" annotation (
    Dialog(tab = "Cold Side", group = "Insulation"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns_cold = 0.04 "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Cold Side", group = "Insulation"));

  parameter Modelica.Units.SI.SpecificHeatCapacity cpm_cold = 445 "Metal specific heat capacity" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.Density rhom_cold = 8000 "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.ThermalConductivity lambdam_cold = 45 "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));

  parameter Modelica.Units.SI.MassFlowRate m_flow_start_cold "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start_cold "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start_cold "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.SpecificEnthalpy hin_start_cold "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tin_start_cold "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Temperature Tout_start_cold "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));

  parameter SI.Mass MWall "Total mass of the wall in heat exchanger";
  final parameter SI.SpecificHeatCapacity cpWall = cpm_hot "Specific heat capacity of the wall";


  SI.Temperature Tin_hot;
  SI.Temperature Tout_hot;
  SI.Temperature Tin_cold;
  SI.Temperature Tout_cold;
  SI.Pressure pin_hot;
  SI.Pressure pout_hot;
  SI.Pressure pin_cold;
  SI.Pressure pout_cold;
  SI.TemperatureDifference LMTD;


  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot "Inlet of the hot fluid" annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{10, 50}, {50, 90}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot "Outlet of the hot fluid" annotation (
    Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{10, -90}, {50, -50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold "Outlet of the cold fluid" annotation (
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 2}, extent = {{-48, 48}, {-8, 88}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold "Inlet of the cold fluid" annotation (
    Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-50, -90}, {-10, -50}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.Round1DFV hotside(Di = Di_hot, L = L_hot, Stot = Stot_hot, Tin_start = Tin_start_hot, Tout_start = Tout_start_hot, cf = cf_hot, cm = cpm_hot, tIns = tIns_hot, t = t_hot, gamma_nom = gamma_nom_hot, h = h_hot, hctype = hctype_hot, hin_start = hin_start_hot, k = k_hot, kc = kc_hot, lambdaIns = lambdaIns_hot, lambdam = lambdam_hot, m_flow_start = m_flow_start_hot, n = n, nPipes = nPipes_hot, pin_start = pin_start_hot, pout_start = pout_start_hot, rho_nom = rho_nom_hot, rhom = rhom_hot, thermalInertia = thermalInertia, u_nom = u_nom_hot)  annotation (
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.Round1DFV coldside(Di = Di_cold, L = L_cold, Stot = Stot_cold, Tin_start = Tin_start_cold, Tout_start = Tout_start_cold, cf = cf_cold, cm = cpm_cold, tIns = tIns_cold, t = t_cold, gamma_nom = gamma_nom_cold, h = h_cold, hctype = hctype_cold, hin_start = hin_start_cold, k = k_cold, kc = kc_cold, lambdaIns = lambdaIns_cold, lambdam = lambdam_cold, m_flow_start = m_flow_start_cold, n = n, nPipes = nPipes_cold, pin_start = pin_start_cold, pout_start = pout_start_cold, rho_nom = rho_nom_cold, rhom = rhom_cold, thermalInertia = thermalInertia, u_nom = u_nom_cold)  annotation (
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV wall(M = MWall, Nw = n, Tstart1 = 333.15, TstartN = 303.15, Tstartbar = 318.15, cm = cpWall) annotation (
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Thermal.HeatExchangerTopologyFV topology(redeclare model HeatExchangerTopology =
        DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologies.CounterCurrentFlow,
      Nw = n) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -26}, {10, -6}}, rotation = -90)));
equation
  Tin_hot = hotside.T[1];
  Tout_hot = hotside.T[hotside.n + 1];
  Tin_cold = coldside.T[1];
  Tout_cold = coldside.T[coldside.n + 1];
  pin_hot = hotside.inlet.p;
  pout_hot = hotside.outlet.p;
  pin_cold = coldside.inlet.p;
  pout_cold = coldside.outlet.p;
  LMTD = ((Tin_hot - Tout_cold) - (Tout_hot - Tin_cold))/log((Tin_hot - Tout_cold)/(Tout_hot - Tin_cold));
  connect(wall.int, hotside.wall) annotation (
    Line(points = {{23, 0}, {64.9, 0}}, color = {255, 238, 44}));
  connect(coldside.outlet, outcold) annotation (
    Line(points = {{-70, 10}, {-70, 70}}, color = {168, 168, 168}));
  connect(coldside.inlet, incold) annotation (
    Line(points = {{-70, -10}, {-70, -70}}, color = {168, 168, 168}));
  connect(hotside.inlet, inhot) annotation (
    Line(points = {{70, 10}, {70, 70}}, color = {168, 168, 168}));
  connect(hotside.outlet, outhot) annotation (
    Line(points = {{70, -10}, {70, -70}}, color = {168, 168, 168}));
  connect(coldside.wall, topology.side2) annotation (
    Line(points = {{-64.9, 0}, {-19.1, 0}}, color = {255, 238, 44}));
  connect(topology.side1, wall.ext) annotation (
    Line(points = {{-13, 0}, {16.9, 0}}, color = {255, 238, 44}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -100}, {60, 100}}), graphics={  Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Forward, lineThickness = 0.5, extent = {{-60, 100}, {60, -100}}, radius = 20), Text(textColor = {28, 108, 200}, extent = {{-60, -100}, {60, -140}}, textString = "%name"), Line(origin = {-66.58, -69.45}, points = {{8, 0}, {16, 0}}, color = {94, 82, 255}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-48.02, 140.54}, points = {{18, -190}, {18, -92}}, color = {76, 0, 227}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-58.73, 70.36}, points = {{8, 0}, {0, 0}}, color = {57, 0, 172}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {23.7, 143.09}, points = {{6, -94}, {6, -192}}, color = {238, 46, 47}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {43.2, -68.29}, points = {{8, 0}, {16, 0}}, color = {255, 49, 52}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {51.29, 69.9}, points = {{8, 0}, {0, 0}}, color = {213, 41, 44}, pattern = LinePattern.Dash, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6)}));
end BrazedPlateHeatExchanger;
