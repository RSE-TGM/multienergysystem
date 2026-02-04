within MultiEnergySystem.ElectricNetwork.Components;
model PEMFuelCell "Simple dynamic model of a PEM-type fuel cell"
  // Based on: Czarnigowski et al. "Simple dynamic model of a PEM-type fuel cell" 2025
  import Modelica.Electrical.Analog.Interfaces;
  import Modelica.Blocks.Tables.CombiTable1Ds;

  // Electrical pins
  Interfaces.PositivePin pin_p "Positive electrical pin"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Interfaces.NegativePin pin_n "Negative electrical pin"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));

  // Parameters for dynamic model
  parameter Real kDyn = 0.541 "Fuel cell inertia coefficient";

  // Parameters for purging/cleaning model
  parameter Real deltaUmax = 3.00 "Maximum voltage increase over polarization curve [V]";
  parameter Real deltaUtot = 3.12 "Total possible voltage drop under polarization curve [V]";
  parameter Real kC = 10.03 "Cleaning decay coefficient";
  parameter Real purgeFrequency = 1.0 "Purge frequency [Hz]";
  parameter Real purgeDuration = 0.1 "Duration of purge event [s]";
  parameter Real shortCircuitResistance = 0.01 "Resistance during short circuit [Ohm]";

  // Polarization curve data (example data for Horizon 300W - should be replaced with actual measured data)
  // Format: [Current (A), Voltage (V)]
  parameter Real polarizationData[:,2] = [
    0.0, 54.0;
    0.5, 48.0;
    1.0, 44.0;
    2.0, 38.0;
    3.0, 34.0;
    4.0, 31.0;
    5.0, 30.0;
    6.0, 28.0;
    7.0, 26.0;
    8.0, 24.0;
    8.3, 23.5;
    9.0, 22.0;
    10.0, 20.0]
    "Polarization curve [I, U]";

  // Internal variables
  Real UFC(start=40.0) "Total fuel cell voltage [V]";
  Real UP(start=40.0) "Static polarization curve voltage [V]";
  Real UDyn(start=0.0) "Dynamic component of voltage [V]";
  Real UPurg(start=0.0) "Purging component of voltage [V]";
  Real I(start=0.0) "Fuel cell current [A]";
  Real ILoad(start=0.0) "Load current [A]";
  Real IShort "Short circuit current during purge [A]";
  Boolean purgeActive "Purge activation flag";
  Real timeSinceLastPurge(start=0.0) "Time since last purge event [s]";
  Real dU_dt "Voltage derivative [V/s]";

  // Internal table for polarization curve interpolation
protected
  Modelica.Blocks.Tables.CombiTable1Ds polarizationTable(
    table=polarizationData,
    smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    "Interpolation table for polarization curve";

equation
  // Electrical connections
  pin_p.i + pin_n.i = 0;
  UFC = pin_p.v - pin_n.v;
  I = pin_p.i;

  // Purge control logic
  purgeActive = mod(time, 1/purgeFrequency) < purgeDuration;

  // Time tracking for purge cycle
  der(timeSinceLastPurge) = if purgeActive then -timeSinceLastPurge/0.001 else 1.0;

  // Current selection based on purge state
  ILoad = if not purgeActive then I else 0;
  IShort = if purgeActive then UFC/shortCircuitResistance else 0;

  // Static polarization curve - UP = f(I)
  polarizationTable.u = if purgeActive then IShort else ILoad;
  UP = polarizationTable.y[1];

  // Dynamic component - inertia effect
  // UDyn = -kDyn * dU/dt
  dU_dt = der(UFC);
  UDyn = -kDyn * dU_dt;

  // Purging/cleaning component
  // UPurg = deltaUmax + deltaUtot * (1/(e^(kC*t)) - 1)
  UPurg = if timeSinceLastPurge > 0 then
            deltaUmax + deltaUtot * (1/exp(kC * timeSinceLastPurge) - 1)
          else
            deltaUmax;

  // Total fuel cell voltage
  // UFC = UP + UDyn + UPurg
  UFC = UP + UDyn + UPurg;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Rectangle(
        extent={{-100,100},{100,-100}},
        lineColor={0,0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
      Line(points={{-80,60},{-80,-60}}, color={0,0,255}),
      Line(points={{-60,60},{-60,-60}}, color={0,0,255}),
      Line(points={{60,60},{60,-60}}, color={255,0,0}),
      Line(points={{80,60},{80,-60}}, color={255,0,0}),
      Line(points={{-80,0},{-100,0}}, color={0,0,255}),
      Line(points={{80,0},{100,0}}, color={255,0,0}),
      Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        textColor={0,0,255}),
      Text(
        extent={{-100,-70},{100,-100}},
        textString="PEM Fuel Cell",
        textColor={0,0,0}),
      Polygon(
        points={{-20,60},{20,60},{0,80},{-20,60}},
        lineColor={0,0,0},
        fillColor={0,255,0},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{-20,-60},{20,-60},{0,-80},{-20,-60}},
        lineColor={0,0,0},
        fillColor={0,255,0},
        fillPattern=FillPattern.Solid),
      Text(
        extent={{-40,40},{40,20}},
        textString="H₂",
        textColor={0,0,0}),
      Text(
        extent={{-40,-20},{40,-40}},
        textString="O₂",
        textColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<h4>PEM Fuel Cell Model</h4>
<p>
This model implements a simple dynamic model of a PEM-type fuel cell as described in:
Czarnigowski J, Skiba K, Kida M, Jakliński P. Simple dynamic model of a PEM-type fuel cell. 
Combustion Engines. 2025;202(3):147-153.
</p>

<h4>Model Components</h4>
<p>The model consists of three main components:</p>
<ol>
<li><b>Static Polarization Curve (UP):</b> The voltage-current characteristic of the fuel cell 
under steady-state conditions. Implemented using table interpolation with continuous derivatives.</li>

<li><b>Dynamic Component (UDyn):</b> Accounts for the transient response during load changes 
due to mass transport inertia in the cell. Modeled as: UDyn = -kDyn * dU/dt</li>

<li><b>Purging Component (UPurg):</b> Models the periodic cleaning process that removes water 
accumulation from the anode side. Includes both the voltage boost after purging and the 
exponential decay back to the baseline.</li>
</ol>

<h4>Parameters</h4>
<ul>
<li><b>kDyn:</b> Inertia coefficient (default: 0.541)</li>
<li><b>deltaUmax:</b> Maximum voltage increase during purge (default: 3.00 V)</li>
<li><b>deltaUtot:</b> Total voltage drop capability (default: 3.12 V)</li>
<li><b>kC:</b> Cleaning decay coefficient (default: 10.03)</li>
<li><b>purgeFrequency:</b> How often purging occurs (default: 1 Hz)</li>
<li><b>purgeDuration:</b> Duration of each purge event (default: 0.1 s)</li>
<li><b>polarizationData:</b> Table of measured current-voltage data points</li>
</ul>

<h4>Usage Notes</h4>
<p>
The polarizationData parameter should be populated with actual measured data from your 
specific fuel cell. The example data provided is representative of a degraded Horizon 300W cell.
</p>

<p>
During purge events, the cell is temporarily short-circuited to evaporate water, followed by 
a hydrogen purge. This causes temporary current spikes and efficiency improvements.
</p>

<h4>Validation</h4>
<p>
This model achieved a correlation of R = 0.958 with experimental data from a Horizon 300W 
fuel cell under dynamic operating conditions.
</p>
</html>"));
end PEMFuelCell;
