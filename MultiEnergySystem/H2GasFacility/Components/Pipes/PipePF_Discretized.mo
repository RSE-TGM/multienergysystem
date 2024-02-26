within MultiEnergySystem.H2GasFacility.Components.Pipes;
model PipePF_Discretized
  "Plug Flow Pipe Discretized"
  extends MultiEnergySystem.H2GasFacility.Interfaces.PartialTwoPort;

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay_ND
      constrainedby
    MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture                 "Medium model" annotation (
     choicesAllMatching = true);

  import Modelica.Units.SI;

  parameter Integer nSeg(min=1) = 1 "Number of axial segment";

  //parameter Modelica.Units.SI.Lenght dh "Hydraulic diamater";

  //ReC, roughness

  parameter Modelica.Units.SI.Length totLen=sum(segLen) "Total pipe length (used to compute segment length)";

  parameter Modelica.Units.SI.Length segLen[nSeg]=fill(totLen/nSeg, nSeg) "Pipe segment length";
  parameter Modelica.Units.SI.MassFlowRate m_flow_nominal "Nominal mass flow rate";
  parameter Modelica.Units.SI.Length dIns "Thickness of pipe insulation, used to compute";
  parameter Modelica.Units.SI.ThermalConductivity kIns "Heat conductivity of pipe insulation, used to compute R";
  parameter Modelica.Units.SI.Length thickness=0.0035 "Pipe wall thickness";
  parameter Modelica.Units.SI.SpecificHeatCapacity cPip=2300 "Specific heat of pipe wall material. 2300 for PE, 500 for steel";
  parameter Modelica.Units.SI.Density rhoPip(displayUnit="kg/m3") = 930 "Density of pipe wall material. 930 for PE, 8000 for steel";

  parameter Modelica.Units.SI.Temperature T_start_in[nSeg]=fill(Medium.T_default,nSeg) "Initialization temperature at pipe inlet";
  parameter Modelica.Units.SI.Temperature T_start_out[nSeg]=T_start_in "Initialization temperature at pipe outlet";

  parameter Boolean initDelay = false "Initialize delay for a constant mass flow rate if true, otherwise start from 0";
  parameter Modelica.Units.SI.MassFlowRate m_flow_start=0 "Initial value of mass flow rate through pipe";

  parameter Real fac=1 "Factor to take into account flow resistance of bends etc., fac=dp_nominal/dpStraightPipe_nominal";

  parameter Modelica.Units.SI.MassFlowRate m_flow_small=1E-4*abs(m_flow_nominal) "Small mass flow rate for regularization of zero flow";

  PipePF pipePF
    annotation (Placement(transformation(extent={{-30,-24},{30,24}})));

  Modelica.Units.SI.MassFlowRate m_flow=port_a.m_flow
    "Mass flow rate from port_a to port_b (m_flow > 0 is design flow direction)";
  final parameter Modelica.Units.SI.Velocity v_nominal=m_flow_nominal/(APip*
      rho_default) "Velocity at m_flow_nominal";
  Modelica.Units.SI.Velocity v=pipSeg[1].v "Flow velocity of medium in pipe";

protected
  parameter Modelica.Units.SI.Length rInt=dh/2 "Pipe interior radius";
  parameter Modelica.Units.SI.Area APip=Modelica.Constants.pi*rInt^2 "Pipe hydraulic cross-sectional area";
  parameter Modelica.Units.SI.Density rho_default=Medium.rho_start "Default density";


equation

  for i in 2:nSeg loop
    connect(pipSeg[i-1].port_b, pipSeg[i].port_a);
  end for;

  connect(inlet, pipePF.inlet) annotation (Line(
      points={{-100,0},{-30,0}},
      color={182,109,49},
      thickness=0.5));
  connect(pipePF.outlet, outlet) annotation (Line(
      points={{30,0},{100,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PipePF_Discretized;
