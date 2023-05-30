within MultiEnergySystem.H2GasFacility.Components.Manifold;

model GManifold2I1O
  extends Manifold.BaseClass.BaseManifold;
  replaceable model MediumIn1 = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumIn2 = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model MediumOut = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  
  parameter Types.Volume V = 0.1;
  parameter Types.Pressure p_start = 1e4;
  parameter Types.Temperature Tin_start1 = 15 + 273.15;
  parameter Types.Temperature Tin_start2 = 15 + 273.15;
  parameter Types.Temperature Tout_start = 15 + 273.15;
  parameter Types.MassFraction Xin_start1[fluidIn1.nX] = {1, 0};
  parameter Types.MassFraction Xin_start2[fluidIn1.nX] = {0, 1};
  parameter Types.MassFraction Xout_start[fluidOut.nX] = {0.8, 0.2};

  
  Types.MassFlowRate m_flow_in1;
  Types.MassFlowRate m_flow_in2;
  Types.MassFlowRate m_flow_out;
  Types.Mass M;
  Types.Density rho;
  Real dM_dt(unit = "kg/s");
  Real dv_dT(unit = "m3/(kg.K)");
  Real dv_dp(unit = "m3/(kg.Pa)");
  Real dv_dX[fluidOut.nX](each unit = "m3/kg");
  Types.SpecificEnthalpy h;
  Types.SpecificEnthalpy hin1;
  Types.SpecificEnthalpy hin2;
  Types.MassFraction Xi[fluidOut.nXi];
  Types.Temperature T(start = Tout_start, stateSelect = StateSelect.prefer);
  Types.Pressure p(start = p_start, stateSelect = StateSelect.prefer);
  Types.MassFraction X[fluidOut.nX](each stateSelect = StateSelect.prefer);
  Real dU_dt(unit = "J/s");
  Real du_dT(unit = "J/(kg.K)");
  Real du_dp(unit = "J/(kg.Pa)");
  Real du_dX[fluidOut.nX](each unit = "J/kg");
  Types.SpecificEnergy u;
  Types.MassFlowRate m_flow_in[2];
  
  
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortOutlet outlet(nXi = fluidOut.nXi) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet1(nXi = fluidIn1.nXi) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet2(nXi = fluidIn2.nXi) annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  MediumIn1 fluidIn1(T_start = Tin_start1, p_start = p_start, X_start = Xin_start1);
  MediumIn2 fluidIn2(T_start = Tin_start2, p_start = p_start, X_start = Xin_start2);
  MediumOut fluidOut(T_start = Tout_start, p_start = p_start, X_start = Xout_start);

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
  
  m_flow_in = {m_flow_in1, m_flow_in2};
  
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
  
  // Component Mass Balance
  M*der(Xi) + Xi*dM_dt = m_flow_in*{fluidIn1.Xi, fluidIn2.Xi} - m_flow_out*Xi;
  
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
  

annotation(
    Icon(graphics = {Rectangle(origin = {-60, 40}, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-60, -40}, lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-20, 20}, {20, -20}})}));
end GManifold2I1O;
