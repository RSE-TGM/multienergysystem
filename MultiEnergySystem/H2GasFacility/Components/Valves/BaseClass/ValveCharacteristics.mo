within MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass;
package ValveCharacteristics
  extends Modelica.Icons.FunctionsPackage;

  partial function baseFunction
    "Partial function that takes the position and returns the corresponding actual displacement"
    extends Modelica.Icons.Function;
    input Real pos(min=0, max=1)
        "Opening position (0: closed, 1: fully open)";
    output Real rp "Actual displacement (per unit)";
    annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">baseFunction</span> is a partial function that calculates the actual displacement of a valve element based on its normalized opening position.</p>
<h4>Use Case</h4>
<p>This function is a base class for defining valve-specific behavior, such as linear, nonlinear, or custom displacement profiles. By extending this function, users can implement specific relationships between the opening position and the corresponding displacement.</p>
</html>"));
  end baseFunction;

  function linear
    "Linear opening characteristic"
    extends
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
  algorithm
    rp := pos;
    annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">linear</span> function defines a linear opening characteristic for a valve. It assumes a direct proportionality between the normalized valve position and its actual displacement.</p>
<h4>Use Case</h4>
<p>This function is suitable for valves with a linear displacement profile, where the flow rate or other responses scale linearly with the valve&apos;s opening position.</p>
</html>"));
  end linear;

  function quadratic
    "Quadratic opening char."
    extends
      MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
  algorithm
  rp := pos*pos;
    annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">quadratic</span> function defines a quadratic opening characteristic for a valve. The actual displacement is proportional to the square of the normalized valve position.</p>
<h4>Behavior</h4>
<p>Implements a quadratic relationship: <span style=\"font-family: Courier New;\">rp=pos^2</span> where:</p>
<p><span style=\"font-family: Courier New;\">pos</span> is the normalized valve position (<span style=\"font-family: Courier New;\">0</span> to <span style=\"font-family: Courier New;\">1</span>)</p>
<p><span style=\"font-family: Courier New;\">rp</span> is the actual displacement, increasing quadratically with <span style=\"font-family: Courier New;\">pos</span>.</p>
<h4>Use Case</h4>
<p>This function is suitable for valves where the flow rate or displacement increases nonlinearly with the valve&apos;s opening.</p>
</html>"));
  end quadratic;
end ValveCharacteristics;
