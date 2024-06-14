within MultiEnergySystem.H2GasFacility.Components.Users;
model IdealUser
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

// Parameters
  parameter Boolean useEnergyDemand = false "True if the demand approach uses energy instead of mass flowrate";
  parameter Types.Pressure p0(nominal = 1e6) = 0.5e5 "Nominal pressure";
  parameter Types.MassFlowRate m_flow0(nominal = 0.01) = 0.04 "Nominal mass flowrate";
  parameter Types.Power E0 = 1e6 "Nominal energy demand";
  parameter Types.MassFraction X0[sink_demand.fluid.nX] = {1} "Nominal mass fraction";
  parameter Types.Temperature T0 = 15 + 273.15 "Nominal temperature";
  parameter Types.MassFlowRate massflowratedemand[:,2] = [0, m_flow0; 24*3600, m_flow0] "Table for demand";
  parameter Types.Power energydemand[:, 2] = [0, m_flow0; 24*3600, m_flow0] "Table for energy demand";

// Variables
  Types.MassFraction Xi[sink_demand.fluid.nXi] "Fluid mass flow rate";
  Types.SpecificEnthalpy h "Fluid specific enthalpy";
  Types.Pressure p "Fluid pressure outlet";
  Types.Power E "Power given to the user/node";
  Types.MassFlowRate m_flow_demand "Actual mass flowrate demand besides the chosen approach";


  Medium fluid(p_start = p0, T_start = T0, X_start = X0);
  H2GasFacility.Sources.SinkMassFlow sink_demand(G=1e-8, redeclare model Medium = Medium, T0 = T0, X0 = X0, m_flow0 = m_flow0, p0 = p0, pin_start = p0, use_in_m_flow0 = true) annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inlet(nXi = sink_demand.fluid.nXi) annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable mfrDemandProfile(table=massflowratedemand) annotation (Placement(visible=true, transformation(
        origin={-50,40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.TimeTable energyDemandProfile(table=energydemand) "Energy profile in W"             annotation (Placement(visible=true, transformation(
        origin={-50,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  Xi = inStream(inlet.Xi);
  h = inStream(inlet.h_out);
  p = inlet.p;
  fluid.p = p;
  fluid.h = h;
  fluid.Xi = Xi;
  E = inlet.m_flow*fluid.HHV_mix;
  sink_demand.in_m_flow0 =if useEnergyDemand then energyDemandProfile.y*fluid.rho0/fluid.HHV_SCM_mix else mfrDemandProfile.y "depends on the approach";
  m_flow_demand = sink_demand.in_m_flow0;

  connect(inlet, sink_demand.inlet) annotation (
    Line(points = {{-100, 0}, {-10, 0}}));
  annotation (
    Icon(graphics={  Ellipse(lineColor = {182, 109, 49}, fillColor = {247, 150, 70}, fillPattern = FillPattern.Sphere, lineThickness = 0.5, extent = {{-60, 60}, {60, -60}}), Text(
          extent={{-100,-80},{100,-140}},
          textColor={28,108,200},
          textString="%name")}));
end IdealUser;
