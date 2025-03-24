within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;
partial model PartialPressureDrop
  extends MultiEnergySystem.DistrictHeatingNetwork.Icons.Gas.PressureDrop;
  extends H2GasFacility.Components.Valves.BaseClass.BasePressureDrop;
  import Modelica.Fluid.Utilities.regRoot;

  parameter Types.PerUnit nomOpening = 1
    "Nominal valve opening";
  parameter Real Kv(unit = "m3/h") = 12
    "Metric Flow Coefficient ";
  parameter Types.PerUnit minimumOpening = 0.001
    "Minimum opening area, avoid no flow condition, default 3mm diameter";
  constant Types.PerUnit pr = 0.85
    "Pressure recovery coefficient";
  final parameter Types.MassFlowRate m_flow_nom = Kv*dp_nom*dp_nom*1
    "Peak mass flow rate at full opening";
  Types.Area A_v = 2.7778e-5*Kv
    "Opening area of the valve";


  Types.MassFlowRate m_flow(start = m_flow_nom)
    "Mass flow rate through the valve";

equation

// Mass balance
  inlet.m_flow + outlet.m_flow = 0;

// Energy balance: enthalpy entering and leaving the valve remains the same (ideal conditions)
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;

// Momentum balance
  m_flow = homotopy(A_v*sqrt(rhoin)*regRoot(inlet.p - outlet.p), m_flow_nom/dp_nom*(inlet.p - outlet.p));


// Definition of fluids
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = fluidIn.X_start[1:fluidIn.nXi];

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = fluidIn.Xi;

// Definition of complementary variables
  m_flow = inlet.m_flow;
  rhoin = fluidIn.rho;
  pin = inlet.p;
  pout = outlet.p;
  Tin = fluidIn.T;
  Tout = fluidOut.T;


  annotation (
    Icon, Documentation(info="<html>
<p>This model simulates the pressure drop across a valve, accounting for mass flow, momentum, and energy balances.</p>
<h4>Equations</h4>
<ul>
<li><b>Mass Balance</b>: Ensures mass conservation (<span style=\"font-family: Courier New;\">inlet.m_flow + outlet.m_flow = 0</span>).</li>
<li><b>Energy Balance</b>: Assumes enthalpy conservation across the valve (<span style=\"font-family: Courier New;\">inStream(inlet.h_out) = outlet.h_out</span>).</li>
<li><b>Momentum Balance</b>: Calculates the flow based on the pressure difference.</li>
</ul>
<h4>Use Case</h4>
<p>This model can be used in fluid networks where pressure drop and mass flow are critical parameters.</p>
</html>"));
end PartialPressureDrop;
