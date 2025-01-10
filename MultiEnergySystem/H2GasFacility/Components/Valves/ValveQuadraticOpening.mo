within MultiEnergySystem.H2GasFacility.Components.Valves;
model ValveQuadraticOpening
  extends H2GasFacility.Components.Valves.BaseClass.PartialValve(
    final openingChar = Types.valveOpeningChar.Quadratic);
equation

  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">ValveQuadraticOpening</span> model defines a valve with a fixed quadratic opening characteristic. </p>
<h4>Use Case</h4>
<p>This model is suitable for applications where a quadratic relationship between the valve&apos;s displacement and the flow rate is required.</p>
<h4>Example</h4>
<p><span style=\"font-family: Courier New;\">ValveQuadraticOpening quadraticValve(nomOpening=0.9, Kv=15, minimumOpening=0.01);</span></p>
<p>This example creates a valve with 90&percnt; nominal opening, a flow coefficient of 15 m&sup3;/h, and a minimum opening area of 0.01.</p>
</html>"));
end ValveQuadraticOpening;
