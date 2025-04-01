within MultiEnergySystem.TestFacility.DHTF;
package Interfaces "Package including interfaces for DHTF subsystems and systems only"
  extends Modelica.Icons.InterfacesPackage;

annotation (Documentation(info="<html>
  <h4>Interfaces – Standardized Interfaces for DHTF Subsystems</h4>

  <p>This package defines standardized interface templates for thermal subsystems and component racks 
  used in the <b>District Heating Test Facility (DHTF)</b> models. These interfaces ensure consistency 
  in the connection of fluid, thermal, and control signals across subsystems, regardless of specific 
  configurations (e.g., generation or cooling unit types).</p>

  <p>The interfaces are structured to reflect the real connections and control signals of the physical 
  test facility.</p>

  <h5>Main Categories</h5>
  <ul>
    <li><b>SystemInterfaceBase*</b>: Partial models for connecting individual generation or load subsystems, with real and boolean inputs/outputs for control, state, and measurements.</li>
    <li><b>DHNConnectorBaseI</b>: Generic interface between the network and a thermal component with detailed inlet/outlet structure and additional flow measurements.</li>
    <li><b>DHNRackBaseI</b>: Similar to <code>DHNConnectorBaseI</code> but vectorized to connect multiple components in parallel (e.g., thermal racks).</li>
  </ul>

  <h5>Usage</h5>
  <p>These partial models should be extended when creating new DHTF components (e.g., electric boiler, gas boiler, chiller) to ensure a consistent and modular connection scheme.</p>
</html>"));
end Interfaces;
