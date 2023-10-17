within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;

model pipePF "Model of 1D fluid transport in a circular rigid pipe. Plug Flow (PF) representation inspired by building plug flow model/ Trnsys 31-Type model."
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import Modelica.Units.SI;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  // Flow initial parameters
  parameter SI.MassFlowRate m_flow_nominal = 1 "Nominal mass flow";
  parameter SI.MassFlowRate m_flow_start = 1 "Starting mass flow";
  parameter SI.MassFlowRate m_flow_small = 0.01 "Minimum mass flow rate for regularization";
  parameter SI.PerUnit cf = 0.004 "Constant Fanning factor";
  // Parameter
  parameter SI.Length L "Length";
  parameter SI.Length D "Internal diameter";
  parameter SI.Length H = 0 "Hight, positive if outlet is higher than inlet. = 0 ports at same hight";
  parameter SI.Length tIns = 0.15 "Insulation thickness";
  parameter SI.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material";
  // Metal Parameter
  parameter Boolean thermalInertia = true "= true account for metal thermal inertia";
  parameter SI.Length t = 0.003 "Metal tube thickness";
  //parameter Real rhomcm(unit = "J/(m3.K)") "Metal heat capacity per unit volume [J/m^3.K]; steel = 3.12e6";
  parameter SI.Density rhom = 7850 "Metal density [kg/m^3], for steel = 7850";
  parameter SI.ThermalConductivity lambdam = 45 "Thermal conductivity; steel = 45";
  parameter SI.Temperature T_ext = 298.15 "External temperature";
  parameter SI.Temperature T_start = 273.15 + 70 "Temperature start value";
  parameter SI.Temperature T_start_m = 273.15 + 70 "Metal temperature start value";
  // Final
  final parameter Modelica.Units.SI.Area A = Modelica.Constants.pi*D^2/4;
  final parameter SI.Velocity u_nom = m_flow_nominal/(rho0*A);
  parameter SI.SpecificHeatCapacity cpm;
  final parameter SI.Volume V_equivalent = Modelica.Constants.pi*((D/2 + t)^2 - (D/2)^2)*L*cpm*rhom/(cp*rho0) "Volume of water equivalent to the metal";
  final parameter SI.Length h_equivalent = V_equivalent/(Modelica.Constants.pi*1) "Consider a diameter of 2, compute hight";
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow outletHeatLosses(Di = D, L = L, T_ext = T_ext, T_start = T_start, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_nominal = m_flow_nominal, rhom = rhom) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  //rhomcm=rhomcm)
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(Di = D, L = L, T_ext = T_ext, T_start = T_start, cf = cf, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_small = m_flow_small, rhom = rhom, u_nom = u_nom) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //rhomcm=rhomcm,
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow inletHeatLosses(Di = D, L = L, T_ext = T_ext, T_start = T_start, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_nominal = m_flow_nominal, rhom = rhom) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  //rhomcm=rhomcm
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor massFlowSensor annotation(
    Placement(visible = true, transformation(origin = {-38, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.TimeDelayPlugFlow timeDelayPlugFlow(D = D, L = L, m_flow_nominal = m_flow_nominal, m_flow_start = m_flow_start) annotation(
    Placement(visible = true, transformation(origin = {-14, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.ThermalInertiaPlugFlow metalInertiaEquivalent(D = 2, T_ext = T_ext, T_start = T_start_m, H = h_equivalent) annotation(
    Placement(visible = true, transformation(origin = {68, -10}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
equation
  connect(plugFlowCore.outlet, outletHeatLosses.inlet) annotation(
    Line(points = {{0, 0}, {30, 0}}, color = {168, 168, 168}));
  connect(massFlowSensor.outlet, plugFlowCore.inlet) annotation(
    Line(points = {{-32, 0}, {-20, 0}}, color = {168, 168, 168}));
  connect(inletHeatLosses.inlet, massFlowSensor.inlet) annotation(
    Line(points = {{-60, 0}, {-44, 0}}, color = {168, 168, 168}));
  connect(inletHeatLosses.outlet, inlet) annotation(
    Line(points = {{-80, 0}, {-100, 0}}, color = {168, 168, 168}));
  connect(massFlowSensor.m_flow, timeDelayPlugFlow.m_flow) annotation(
    Line(points = {{-31, 10}, {-31, 30.4}, {-22.2, 30.4}}, color = {0, 0, 127}));
  connect(timeDelayPlugFlow.tau_rev, inletHeatLosses.tau) annotation(
    Line(points = {{-4.5, 22.5}, {5.5, 22.5}, {5.5, 12.5}, {-62, 12.5}, {-62, 6}}, color = {0, 0, 127}));
  connect(outletHeatLosses.outlet, metalInertiaEquivalent.inlet) annotation(
    Line(points = {{50, 0}, {54.5, 0}, {54.5, -2}, {63, -2}}, color = {168, 168, 168}));
  connect(metalInertiaEquivalent.outlet, outlet) annotation(
    Line(points = {{73, -2}, {73, 2.28571}, {100, 2.28571}, {100, 0}}, color = {168, 168, 168}));
  connect(timeDelayPlugFlow.tau, outletHeatLosses.tau) annotation(
    Line(points = {{-4, 30}, {32, 30}, {32, 6}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, 40}, {100, -20}})),
    Icon(graphics = {Rectangle(lineColor = {102, 102, 102}, fillColor = {173, 173, 173}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 44}, {100, -44}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end pipePF;
