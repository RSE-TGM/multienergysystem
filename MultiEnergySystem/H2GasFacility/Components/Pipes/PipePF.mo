within MultiEnergySystem.H2GasFacility.Components.Pipes;
model PipePF
  extends Components.Pipes.BaseClass.PartialRoundTube;

  // Medium & Heat Transfer Model for the pipe
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);

  import Modelica.Units.SI;
  // Flow initial parameters
  parameter SI.MassFlowRate m_flow_nominal = 1 "Nominal mass flow";
  parameter SI.MassFlowRate m_flow_start "Starting mass flow";
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
  parameter SI.Density rhom = 8000 "Metal density [kg/m^3], for steel = 7850";
  parameter SI.ThermalConductivity lambdam = 45 "Thermal conductivity; steel = 45";
  parameter SI.Temperature T_ext = 15 + 273.15 "External temperature";
  parameter SI.Temperature T_start = 273.15 + 70 "Temperature start value";
  parameter SI.Temperature T_start_m = 273.15 + 70 "Metal temperature start value";

  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density";
  parameter H2GasFacility.Types.SpecificHeatCapacityAtConstantPressure cp = 2100;

  // Final
  final parameter Modelica.Units.SI.Area A = Modelica.Constants.pi*Di^2/4;
  final parameter SI.Velocity u_nom = m_flow_nominal/(rho_nom*A);
  parameter SI.SpecificHeatCapacity cpm;
  final parameter SI.Volume V_equivalent = Modelica.Constants.pi*((Di/2 + t)^2 - (Di/2)^2)*L*cpm*rhom/(cp*rho_nom) "Volume of water equivalent to the metal";
  final parameter SI.Length h_equivalent = V_equivalent/(Modelica.Constants.pi*1) "Consider a diameter of 2, compute hight";




  BaseClass.DirectionalHeatLossPlugFlow directionalHeatLossPlugFlow(
    L=L,
    H=H,
    t=t,
    pmax=pmax,
    tIns=tIns,
    lambdaIns=lambdaIns,
    thermalInertia=thermalInertia,
    cm=cm,
    rhom=rhom,
    lambdam=lambdam,
    T_ext=T_ext,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pout_start,
    hin_start=hin_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    X_start=X_start,
    Di=Di,
    m_flow_nominal=m_flow_nominal,
    T_start=T_start)
           annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,0})));
  BaseClass.PlugFlowCore plugFlowCore(
    L=L,
    H=H,
    t=t,
    pmax=pmax,
    tIns=tIns,
    lambdaIns=lambdaIns,
    cm=cm,
    rhom=rhom,
    lambdam=lambdam,
    T_ext=T_ext,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pout_start,
    hin_start=hin_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    X_start=X_start,
    Di=Di,
    cf=cf,
    rho_nom=rho_nom,
    u_nom=u_nom,
    m_flow_small=m_flow_small,
    T_start=T_start)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  BaseClass.DirectionalHeatLossPlugFlow directionalHeatLossPlugFlow1(
    L=L,
    H=H,
    t=t,
    pmax=pmax,
    tIns=tIns,
    lambdaIns=lambdaIns,
    cm=cm,
    rhom=rhom,
    lambdam=lambdam,
    T_ext=T_ext,
    m_flow_start=m_flow_start,
    pin_start=pin_start,
    pout_start=pout_start,
    hin_start=hin_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    X_start=X_start,
    Di=Di,
    m_flow_nominal=m_flow_nominal,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,0})));
  Storage.LumpedStorageConstantMass lumpedStorageConstantMass(
    rho_nom=rho_nom,
    allowFlowReversal=false,
    H=1,
    T_start=T_start,
    T_ext=T_ext,
    pin_start=pin_start,
    m_flow_start=m_flow_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    X_start=X_start,
    lambdaIns=lambdaIns)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
  Sensors.IdealMassFlowSensor idealMassFlowSensor(
    pin_start=pin_start,
    pout_start=pout_start,
    Tin_start=Tin_start,
    Tout_start=Tin_start,
    X_start=X_start,
    T_start=T_start,
    m_flow_start=m_flow_start,
    hin_start=hin_start)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  BaseClass.TimeDelayPlugFlow timeDelayPlugFlow(
    L=L,
    D=Di,
    rho_nom=rho_nom,
    m_flow_start=m_flow_start,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-8,42},{12,62}})));
equation

  fluidIn.p = inlet.p;
  fluidIn.h = inlet.h_out;
  fluidIn.Xi = inlet.Xi;

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;
  connect(lumpedStorageConstantMass.outlet, outlet) annotation (Line(
      points={{60,-20},{60,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(idealMassFlowSensor.outlet, plugFlowCore.inlet) annotation (Line(
      points={{-34,0},{-20,0}},
      color={182,109,49},
      thickness=0.5));
  connect(idealMassFlowSensor.m_flow, timeDelayPlugFlow.m_flow) annotation (
      Line(points={{-37,6},{-28,6},{-28,56.4},{-6.2,56.4}},   color={0,0,127}));
  connect(timeDelayPlugFlow.tau_rev, directionalHeatLossPlugFlow.tau)
    annotation (Line(points={{11.5,48.5},{18,48.5},{18,32},{-66,32},{-66,6}},
        color={0,0,127}));
  connect(timeDelayPlugFlow.tau, directionalHeatLossPlugFlow1.tau) annotation (
      Line(points={{11.3,56.3},{22,56.3},{22,6}},
                color={0,0,127}));
  connect(directionalHeatLossPlugFlow1.outlet, lumpedStorageConstantMass.inlet)
    annotation (Line(
      points={{40,0},{50,0},{50,-40},{60,-40}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow1.inlet, plugFlowCore.outlet) annotation (
      Line(
      points={{20,1.77636e-15},{16,1.77636e-15},{16,0},{0,0}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow.outlet, inlet) annotation (Line(
      points={{-84,7.77156e-16},{-91,7.77156e-16},{-91,0},{-100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(directionalHeatLossPlugFlow.inlet, idealMassFlowSensor.inlet)
    annotation (Line(
      points={{-64,-1.66533e-15},{-59,-1.66533e-15},{-59,0},{-54,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-18,14},{20,-12}},
          textColor={0,0,0},
          textString="PF")}),                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PipePF;
