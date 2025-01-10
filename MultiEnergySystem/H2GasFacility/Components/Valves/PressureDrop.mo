within MultiEnergySystem.H2GasFacility.Components.Valves;
model PressureDrop
  extends MultiEnergySystem.H2GasFacility.Components.Valves.BaseClass.PartialPressureDrop;
equation

  annotation (Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">PressureDrop</span> model calculates the pressure drop across a valve or component. It extends the <span style=\"font-family: Courier New;\">PartialPressureDrop</span> model to incorporate standard equations for mass flow and pressure dynamics.</p>
<h4>Use Case</h4>
<p>This model is used to represent the pressure loss through a component or valve.</p>
</html>"));
end PressureDrop;
