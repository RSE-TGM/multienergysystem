within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model pipePF
  "Model of 1D fluid transport in a circular rigid pipe. Plug Flow (PF) representation inspired by building plug flow model/ Trnsys 31-Type model."
  extends DHN4Control.Interfaces.PartialTwoPort;
  import      Modelica.Units.SI;
  import DHN4Control.Media.{cp,rho0};
  // Flow initial parameters
  parameter SI.MassFlowRate m_flow_nominal = 1 "Nominal mass flow";
  parameter SI.MassFlowRate m_flow_start = 1 "Starting mass flow";
  parameter SI.MassFlowRate m_flow_small = 0.01 "Minimum mass flow rate for regularization";
  parameter SI.PerUnit cf = 0.004 "Constant Fanning factor";
  // Parameter
  parameter SI.Length L "Length";
  parameter SI.Length D "Internal diameter";
  parameter SI.Length h = 0 "Hight, positive if outlet is higher than inlet. = 0 ports at same hight";
  parameter SI.Length dIns = 0.15 "Insulation thickness";
  parameter SI.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material";
  // Metal Parameter
  parameter Boolean thermalInertia = true "= true account for metal thermal inertia";
  parameter SI.Length dWall = 0.003 "Metal tube thickness";
  parameter Real rhomcm(unit = "J/(m3.K)") = 3.12e6 "Metal heat capacity per unit volume [J/m^3.K]; steel = 3.12e6";
  parameter SI.Density rhom = 7850 "Metal density [kg/m^3], for steel = 7850";
  parameter SI.ThermalConductivity lambdaM = 45 "Thermal conductivity; steel = 45";
  parameter SI.Temperature T_ext = 298.15 "External temperature";
  parameter SI.Temperature T_start = 273.15 + 70 "Temperature start value";
  parameter SI.Temperature T_start_m = 273.15 + 70 "Metal temperature start value";
  // Final
  final parameter Modelica.Units.SI.Area A = Modelica.Constants.pi * D ^ 2 / 4;
  final parameter SI.Velocity u_nom = m_flow_nominal/(rho0*A);
  final parameter SI.SpecificHeatCapacity cm = rhomcm/rhom;
  final parameter SI.Volume V_equivalent = Modelica.Constants.pi*((D/2 + dWall)^2 - (D/2)^2) *L*cm*rhom/(cp*rho0) "Volume of water equivalent to the metal";
  final parameter SI.Length h_equivalent = V_equivalent/(Modelica.Constants.pi*1) "Consider a diameter of 2, compute hight";

  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow
    outletHeatLosses(
    D=D,
    L=L,
    T_ext=T_ext,
    T_start=T_start,
    dIns=dIns,
    dWall=dWall,
    h=h,
    lambdaIns=lambdaIns,
    lambdaM=lambdaM,
    m_flow_nominal=m_flow_nominal,
    rhom=rhom,
    rhomcm=rhomcm) annotation (Placement(visible=true, transformation(
        origin={34,-2},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PlugFlowCore
    plugFlowCore(
    D=D,
    L=L,
    T_ext=T_ext,
    T_start=T_start,
    cf=cf,
    dIns=dIns,
    dWall=dWall,
    h=h,
    lambdaIns=lambdaIns,
    lambdaM=lambdaM,
    m_flow_small=m_flow_small,
    rhom=rhom,
    rhomcm=rhomcm,
    u_nom=u_nom) annotation (Placement(visible=true, transformation(
        origin={-16,-2},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.DirectionalHeatLossPlugFlow
    inletHeatLosses(
    D=D,
    L=L,
    T_ext=T_ext,
    T_start=T_start,
    dIns=dIns,
    dWall=dWall,
    h=h,
    lambdaIns=lambdaIns,
    lambdaM=lambdaM,
    m_flow_nominal=m_flow_nominal,
    rhom=rhom,
    rhomcm=rhomcm) annotation (Placement(visible=true, transformation(
        origin={-76,-2},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  DHN4Control.Sensors.IdealMassFlowSensor massFlowSensor annotation (
    Placement(visible = true, transformation(origin = {-44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.TimeDelayPlugFlow
    timeDelayPlugFlow(
    D=D,
    L=L,
    m_flow_nominal=m_flow_nominal,
    m_flow_start=m_flow_start) annotation (Placement(visible=true,
        transformation(
        origin={-20,24},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  BaseClass.ThermalInertiaPlugFlow metalInertiaEquivalent(D = 2,T_ext = T_ext, T_start = T_start_m, h = h_equivalent)  annotation (
    Placement(visible = true, transformation(origin = {64, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(plugFlowCore.outlet, outletHeatLosses.inlet) annotation (
    Line(points = {{-6, -2}, {24, -2}}, color = {168, 168, 168}));
  connect(massFlowSensor.outlet, plugFlowCore.inlet) annotation (
    Line(points = {{-34, -2}, {-26, -2}}, color = {168, 168, 168}));
  connect(inletHeatLosses.inlet, massFlowSensor.inlet) annotation (
    Line(points = {{-66, -2}, {-54, -2}}, color = {168, 168, 168}));
  connect(inletHeatLosses.outlet, inlet) annotation (
    Line(points = {{-86, -2}, {-100, -2}}, color = {168, 168, 168}));
  connect(massFlowSensor.m_flow, timeDelayPlugFlow.m_flow)
    annotation (Line(points={{-44,7},{-44,27},{-28,27}}, color={0,0,127}));
  connect(timeDelayPlugFlow.tau, outletHeatLosses.tau) annotation (
    Line(points = {{-10.7, 28.3}, {11.3, 28.3}, {11.3, -15.7}, {25.3, -15.7}, {25.3, -7.7}}, color = {0, 0, 127}));
  connect(timeDelayPlugFlow.tau_rev, inletHeatLosses.tau) annotation (
    Line(points = {{-10.5, 20.5}, {-0.5, 20.5}, {-0.5, 10.5}, {-68.5, 10.5}, {-68.5, 4.5}}, color = {0, 0, 127}));
  connect(outletHeatLosses.outlet, metalInertiaEquivalent.inlet) annotation (
    Line(points = {{44, -2}, {54, -2}}, color = {168, 168, 168}));
  connect(metalInertiaEquivalent.outlet, outlet) annotation (
    Line(points = {{74, -2}, {92, -2}, {92, -6}}, color = {168, 168, 168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-120, 40}, {100, -20}})),
    Icon(graphics={  Rectangle(lineColor = {102, 102, 102}, fillColor = {173, 173, 173}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 44}, {100, -44}})}));
end pipePF;
