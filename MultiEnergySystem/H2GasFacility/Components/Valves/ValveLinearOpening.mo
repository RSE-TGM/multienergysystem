within MultiEnergySystem.H2GasFacility.Components.Valves;
model ValveLinearOpening
  extends H2GasFacility.Components.Valves.BaseClass.PartialValve(
    final openingChar = Types.valveOpeningChar.Linear);
equation

  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">ValveLinearOpening</span> model represents a valve with a fixed linear opening characteristic. It extends the <span style=\"font-family: Courier New;\">PartialValve</span> class and is designed for systems where the mass flow rate is directly proportional to the valve&apos;s displacement (linear relationship).</p>
<h4>Usage</h4>
<p>This model is ideal for applications requiring linear valve behavior.</p>
<h4>Example</h4>
<p><span style=\"font-family: Courier New;\">ValveLinearOpening linearValve(nomOpening=0.8, Kv=10, minimumOpening=0.005);</span></p>
<p>This example creates a valve with 80&percnt; nominal opening, a flow coefficient of 10 m&sup3;/h, and a minimum opening area of 0.005.</p>
</html>"));
end ValveLinearOpening;
