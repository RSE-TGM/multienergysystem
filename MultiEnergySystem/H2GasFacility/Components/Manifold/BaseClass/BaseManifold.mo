within MultiEnergySystem.H2GasFacility.Components.Manifold.BaseClass;
partial model BaseManifold
  // Mediums
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CH4H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.CH4H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CH4H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;

  // Parameters
  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean noInitialPressure = false "Remove initial equation on pressure" annotation(choices(checkBox=true));
  parameter Types.Volume V = 0.1 "Volume of the manifold";
  parameter Types.Pressure p_start = 1e4 "Start pressure value of the manifold";
  parameter Types.Temperature Tin_start1 = 15 + 273.15 "Start temperature value for inlet 1 fluid";
  parameter Types.Temperature Tin_start2 = 15 + 273.15 "Start temperature value for inlet 2 fluid";
  parameter Types.Temperature Tout_start = 15 + 273.15 "Start temperature value for outlet fluid";
  parameter Types.MassFraction Xin_start1[fluidIn1.nX] = {1, 0} "Start mass composition for inlet 1 fluid";
  parameter Types.MassFraction Xin_start2[fluidIn1.nX] = {0, 1} "Start mass composition for inlet 2 fluid";
  parameter Types.MassFraction Xout_start[fluidOut.nX] = {0.8, 0.2} "Start mass composition for outlet fluid";

  // Variables
  Types.MassFlowRate m_flow_in1 "Inlet mass flow rate 1";
  Types.MassFlowRate m_flow_in2 "Inlet mass flow rate 2";
  Types.MassFlowRate m_flow_out "Outlet mass flow rate";
  Types.Mass M "Total mass inside the manifold";
  Types.Density rho "Density at the outlet";
  Types.Temperature T(start = Tout_start, stateSelect = StateSelect.prefer) "Temperature at the outlet";
  Types.Pressure p(start = p_start, stateSelect = StateSelect.prefer) "Pressure at the outlet";
  Types.MassFraction Xi[fluidOut.nXi](start = Xout_start[1:fluidOut.nXi]) "Independent mass fraction at the outlet";
  Types.MassFraction X[fluidOut.nX](each stateSelect = StateSelect.prefer) "Mass fraction at the outlet";
  Types.SpecificEnthalpy h "Specific enthalpy at the outlet";
  Types.SpecificEnthalpy hin1 "Specific enthalpy at inlet 1";
  Types.SpecificEnthalpy hin2 "Specific enthalpy at inlet 2";
  Types.SpecificEnergy u "Specific energy at the outlet";
  Real dM_dt(unit = "kg/s") "Mass derivative";
  Real dv_dT(unit = "m3/(kg.K)") "Temperature derivative of specific volume at the outlet";
  Real dv_dp(unit = "m3/(kg.Pa)") "Pressure derivative of specific volume at the outlet";
  Real dv_dX[fluidOut.nX](each unit = "m3/kg") "Mass fraction derivative of specific volume at the outlet";
  Real dU_dt(unit = "J/s") "Energy derivative at the outlet";
  Real du_dT(unit = "J/(kg.K)") "Temperature derivative of specific energy at the outlet";
  Real du_dp(unit = "J/(kg.Pa)") "Pressure derivative of specific energy at the outlet";
  Real du_dX[fluidOut.nX](each unit = "J/kg") "Mass fraction derivative of specific energy at the outlet";

  // Definition of the fluids at the inlets and outlet
  MediumIn1 fluidIn1(T_start=Tin_start1, p_start=p_start, X_start=Xin_start1, computeEntropy=computeEntropy, computeTransport=computeTransport);
  MediumIn2 fluidIn2(T_start=Tin_start2, p_start=p_start, X_start=Xin_start2, computeEntropy=computeEntropy, computeTransport=computeTransport);
  MediumOut fluidOut(T_start=Tout_start, p_start=p_start, X_start=Xout_start, computeEntropy=computeEntropy, computeTransport=computeTransport);

  // Connectors
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = fluidOut.nXi) annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet1(nXi = fluidIn1.nXi) annotation (
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet2(nXi = fluidIn2.nXi) annotation (
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation

  // Variables
  m_flow_in1 = inlet1.m_flow;
  m_flow_in2 = inlet2.m_flow;
  m_flow_out = -outlet.m_flow;
  rho = fluidOut.rho;
  hin1 = inStream(inlet1.h_out);
  hin2 = inStream(inlet2.h_out);
  h = outlet.h_out;
  Xi = outlet.Xi;
  T = fluidOut.T;
  X = fluidOut.X;
  u = fluidOut.u;

  // Detivatives
  du_dT = fluidOut.du_dT;
  du_dp = fluidOut.du_dp;
  du_dX = fluidOut.du_dX;
  dv_dT = fluidOut.dv_dT;
  dv_dp = fluidOut.dv_dp;
  dv_dX = fluidOut.dv_dX;

  // Mass Balance
  M = rho*V;
  dM_dt = m_flow_in1 + m_flow_in2 - m_flow_out;
  dM_dt = -V*rho^2*(dv_dT*der(T) + dv_dp*der(p) + dv_dX*der(X));

  // Energy Balance
  dU_dt = m_flow_in1*hin1 + m_flow_in2*hin2 - m_flow_out*h;
  dU_dt = M*(du_dT*der(T) + du_dp*der(p) + du_dX*der(X)) + dM_dt*u;

  // Momentum Balance
  inlet1.p = p;
  inlet2.p = p;
  outlet.p = p;

  // Fluids
  fluidIn1.p = inlet1.p;
  fluidIn1.h = inStream(inlet1.h_out);
  fluidIn1.Xi = inStream(inlet1.Xi);

  fluidIn2.p = inlet2.p;
  fluidIn2.h = inStream(inlet2.h_out);
  fluidIn2.Xi = inStream(inlet2.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = h;
  fluidOut.Xi = Xi;

  // Flow reversal equations
  inlet1.h_out = inStream(outlet.h_out);
  inlet2.h_out = inStream(outlet.h_out);
  inlet1.Xi = zeros(fluidIn1.nXi);
  inlet2.Xi = zeros(fluidIn2.nXi);

initial equation
  //Always in Steady State
  der(T) = 0;
  der(Xi) = zeros(fluidOut.nXi);
  if not noInitialPressure then
    der(p) = 0;
  end if;

annotation (
    Icon(graphics={  Rectangle(rotation = 90, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 40}, {100, -40}}), Rectangle(origin = {60, 0}, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-60, -40}, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-60, 40}, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 20}, {20, -20}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
      Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">BaseManifold</span> model represents a gas manifold that combines two inlet streams and directs the mixed fluid to an outlet. This model is a partial model, meaning it is intended to be extended by more specific implementations. It includes mass, momentum, and energy balance equations, allowing for the tracking of fluid properties such as pressure, temperature, and composition.</p>
<h4>Equations and Assumptions:</h4>
<p>1. <b>Mass Balance:</b> The mass flow into the manifold equals the mass flow out (dM_dt = m_flow_in1 + m_flow_in2 - m_flow_out).</p>
<p>2. <b>Energy Balance:</b> Energy is conserved between inlets and the outlet (dU_dt = m_flow_in1 * hin1 + m_flow_in2 * hin2 - m_flow_out * h).</p>
<p>3. <b>Momentum Balance:</b> The pressure is assumed to be uniform across all ports (p = inlet1.p = inlet2.p = outlet.p).</p>
<p>4. <b>Fluid Properties:</b> Each fluid medium (inlets and outlet) is initialized with specific temperature, pressure, and composition.</p>
<p>5. <b>Flow Reversal Handling:</b> Ensures that composition and enthalpy remain consistent when flow direction changes.</p>
<p>6. <b>Initial Conditions:</b> The model assumes a steady-state condition by setting time derivatives of temperature and composition to zero (der(T) = 0, der(Xi) = 0).</p>
<h4>Fluid Ports: </h4>
<ul>
<li><span style=\"font-family: Courier New;\">inlet1</span>: First inlet for gas mixture.</li>
<li><span style=\"font-family: Courier New;\">inlet2</span>: Second inlet for gas mixture.</li>
<li><span style=\"font-family: Courier New;\">outlet</span>: Outlet for mixed gas.</li>
</ul>
<h4>Usage:</h4>
<p>This model is designed to be <b>extended</b> by more specific manifold models. It provides a <b>flexible</b> and <b>generalized</b> framework for gas mixing applications, particularly in hydrogen and methane distribution networks.</p>
</html>"));
end BaseManifold;
