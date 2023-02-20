within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model pipeFV
  "Model of a 1D flow in a circular rigid pipe. Finite Volume (FV) representation"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BaseClass.PartialInsulatedTube;
  import Modelica.Fluid.Utilities.regSquare;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  // Flow parameter
  parameter Modelica.Units.SI.PerUnit cf = 0.004 "Costant Fanning friction coefficient";
  parameter Modelica.Units.SI.Velocity u_nom = 1 "Nominal fluid velocity";
  parameter Integer N = 2 "Number of finite volumes";
  final parameter Modelica.Units.SI.PressureDifference dp_nom = cf / 2 * rho0 * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter Modelica.Units.SI.MassFlowRate m_flow_nom = rho0 * A * u_nom "Nominal mass flow rate";

  // Variables
  Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate across the pipe";
  Modelica.Units.SI.Velocity u;
  Modelica.Units.SI.Temperature Ttilde[N](each start = T_start, each fixed = true, each stateSelect = StateSelect.prefer) "State variable temperatures";
  Modelica.Units.SI.Temperature Twall[N](each start = T_start, each fixed = true, each stateSelect = StateSelect.prefer) "Pipe wall temperature";
  Modelica.Units.SI.Power Q_int[N] "Heat dissipation out of each volume into the wall";
  Modelica.Units.SI.Temperature T[N + 1] "Volume boundary temperatures";
  Modelica.Units.SI.Power Q_ext[N] "Heat dissipation out of each wall cell to the ambient";
  Modelica.Blocks.Interfaces.RealVectorOutput section_T[N] annotation (
    Placement(visible = true, transformation(origin = {2, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {0, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Momentum balance
  m_flow = rho0 * A * u;
  inlet.p - outlet.p = rho0 * Modelica.Constants.g_n * h + homotopy(cf / 2 * rho0 * omega * L / A * regSquare(u, u_nom * 0.05), dp_nom / m_flow_nom * m_flow);

  // Energy balance
  if thermalInertia then
    for i in 1:N loop
      rho0 * V/N * cp * der(Ttilde[i]) = m_flow * cp * (T[i] - T[i + 1]) - Q_int[i] "Energy balance water volume";
      L / N * rhomcm * Am * der(Twall[i]) = Q_int[i] + Q_ext[i] "Energy balance wall";
      // Heat conduction through the internal half-thickness water to wall
      Q_int[i] = U_wm * L / N * (Ttilde[i] - Twall[i]);
      // Heat conduction through the external half-thickness wall to ambient
      Q_ext[i] = U_me * L / N * (T_ext - Twall[i]);
    end for;
  else
    for i in 1:N loop
      rho0 * V/N * cp * der(Ttilde[i]) = m_flow * cp * (T[i] - T[i + 1]) - Q_ext[i] "Energy balance water";
      Q_int[i] = 0;
      der(Twall[i]) = 0;
      // Heat exchange outwards
      Q_ext[i] = U_me * L / N * (T_ext - Ttilde[i]);
    end for;
  end if;

  if m_flow > 0 or not allowFlowReversal then
    T[1] = inStream(inlet.h_out) / cp;
    T[2:end] = Ttilde;
  else
    T[1:end - 1] = Ttilde;
    T[end] = inStream(outlet.h_out) / cp;
  end if;
// Boundary conditions
  m_flow = inlet.m_flow;
  inlet.h_out = Ttilde[1] * cp;
  outlet.h_out = Ttilde[N] * cp;
  for i in 1:N loop
     section_T[i] = Ttilde[i] - 273.15;
  end for;

end pipeFV;
