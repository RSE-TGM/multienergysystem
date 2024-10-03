within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model pipePF "Model of 1D fluid transport in a circular rigid pipe. Plug Flow (PF) representation inspired by building plug flow model/ Trnsys 31-Type model."
  extends DistrictHeatingNetwork.Interfaces.PartialHorizontalTwoPort;
  extends DistrictHeatingNetwork.Icons.Water.Pipe;
  import Modelica.Units.SI;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  // Flow initial parameters
  parameter SI.MassFlowRate m_flow_nominal = 1 "Nominal mass flow";
  parameter SI.MassFlowRate m_flow_start = 1 "Starting mass flow";
  parameter SI.MassFlowRate m_flow_small = 0.01 "Minimum mass flow rate for regularization";
  parameter SI.PerUnit cf = 0.004 "Constant Fanning factor";
  // Pressure initial parameteers
  parameter SI.Pressure pin_start "Starting initial pressure";
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
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow outletHeatLosses(m_flow_start = m_flow_start, pin_start = pin_start, Di = D, L = L, T_ext = T_ext, T_start = T_start, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_nominal = m_flow_nominal, rhom = rhom) annotation (
    Placement(transformation(origin = {40, 0}, extent = {{-10, 10}, {10, -10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore plugFlowCore(m_flow_start = m_flow_start, pin_start = pin_start, Di = D, L = L, T_ext = T_ext, T_start = T_start, cf = cf, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_small = m_flow_small, rhom = rhom, u_nom = u_nom) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow inletHeatLosses(m_flow_start = m_flow_start, pout_start = pin_start, Di = D, L = L, T_ext = T_ext, T_start = T_start, tIns = tIns, t = t, h = H, lambdaIns = lambdaIns, lambdam = lambdam, m_flow_nominal = m_flow_nominal, rhom = rhom) annotation (
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealMassFlowSensor massFlowSensor annotation (
    Placement(transformation(origin = {-38, 4}, extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.TimeDelayPlugFlow timeDelayPlugFlow(D = D, L = L, m_flow_nominal = m_flow_nominal, m_flow_start = m_flow_start) annotation (
    Placement(transformation(origin = {-14, 26}, extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Storage.LumpedStorageConstantMass metalInertiaEquivalent(D = 2, T_ext = T_ext, T_start = T_start_m, H = h_equivalent) annotation (
    Placement(transformation(origin={68,-32},    extent={{-10,-14},{10,14}},  rotation = -90)));
equation
  connect(massFlowSensor.m_flow, timeDelayPlugFlow.m_flow) annotation (
    Line(points={{-31,10},{-28,10},{-28,30.4},{-22.2,30.4}},    color = {0, 0, 127}));
  connect(timeDelayPlugFlow.tau, outletHeatLosses.tau) annotation (
    Line(points={{-4.7,30.3},{32,30.3},{32,6}},  color = {0, 0, 127}));
  connect(timeDelayPlugFlow.tau_rev, inletHeatLosses.tau) annotation (
    Line(points={{-4.5,22.5},{10,22.5},{10,36},{-62,36},{-62,6}},      color = {0, 0, 127}));

  connect(inletHeatLosses.outlet, inlet) annotation (Line(
      points={{-80,7.21645e-16},{-90,7.21645e-16},{-90,0},{-100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(outletHeatLosses.outlet, metalInertiaEquivalent.inlet) annotation (Line(
      points={{50,0},{58,0},{58,-22}},
      color={140,56,54},
      thickness=0.5));
  connect(metalInertiaEquivalent.outlet, outlet) annotation (Line(
      points={{78,-22},{78,0},{100,0}},
      color={140,56,54},
      thickness=0.5));
  connect(outletHeatLosses.inlet, plugFlowCore.outlet) annotation (Line(
      points={{30,0},{10,0}},
      color={140,56,54},
      thickness=0.5));
  connect(plugFlowCore.inlet, massFlowSensor.outlet) annotation (Line(
      points={{-10,0},{-32,0}},
      color={140,56,54},
      thickness=0.5));
  connect(massFlowSensor.inlet, inletHeatLosses.inlet) annotation (Line(
      points={{-44,0},{-52,0},{-52,-1.72085e-15},{-60,-1.72085e-15}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end pipePF;
