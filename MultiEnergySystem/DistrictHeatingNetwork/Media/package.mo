within MultiEnergySystem.DistrictHeatingNetwork;
package Media "Package with medium models"
  extends Modelica.Icons.MaterialPropertiesPackage;

annotation (Documentation(info="<html>

  <h4>Media</h4>

  <p>This package contains liquid water models developed for use in the 
  <code>MultiEnergySystem.DistrictHeatingNetwork</code> library. The models are intended to support 
  dynamic simulations of district heating systems with varying degrees of complexity and accuracy.</p>

  <p>Each model is based on simplified or fitted thermophysical properties derived from the IF-97 formulation. 
  They are designed to provide a flexible balance between numerical performance and physical accuracy.</p>

  <h5>Available Models</h5>
  <ul>
    <li><b>WaterLiquidIdeal</b>: Constant <i>cp</i> and <i>rho</i>. Ideal for simple or control-oriented simulations.</li>
    <li><b>WaterLiquidVaryingcp</b>: Constant density and temperature-dependent specific heat capacity.</li>
    <li><b>WaterLiquidVaryingDensity</b>: Polynomial-based <i>cp</i> and <i>rho</i>, with compressibility effects.</li>
  </ul>

  <h5>Other Contents</h5>
  <ul>
    <li><b>BaseClasses</b>: Internal base models used to construct liquid water models.</li>
    <li><b>Utilities</b>: Models for computing polynomial coefficients for cp, rho, and other thermophysical properties using interpolation of Modelica.Media data.</li>
    <li><b>StandardWater</b>: Alias to <code>Modelica.Media.Water.StandardWater</code> for compatibility or reference purposes.</li>
  </ul>

  <h5>Usage Notes</h5>
  <p>The water models in this package are tailored for the temperature and pressure ranges typical of district heating 
  networks (e.g., 5–95 °C and 1–6 bar). Users can generate or adjust coefficients using the tools in the 
  <code>Utilities</code> subpackage.</p>

  <p><b>Disclaimer:</b> Entropy-related calculations are not supported and transport properties 
  are only computed if <code>computeTransport = true</code>.</p>

</html>"));
end Media;
