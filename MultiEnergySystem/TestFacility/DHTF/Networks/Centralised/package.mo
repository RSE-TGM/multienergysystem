within MultiEnergySystem.TestFacility.DHTF.Networks;
package Centralised
  extends DistrictHeatingNetwork.Icons.Generic.Centralised;

annotation (Documentation(info="<html>
<p>
  This package includes a collection of test models representing different centralized configurations of the District Heating Test Facility. All models are based on the same general layout, illustrated in the diagram below:
</p>

<p style=\"text-align: center;\">
  <img src=\"modelica://MultiEnergySystem/TestFacility/Resources/Images/CentralizedConfigurationScheme_Library.png\" alt=\"Centralized Configuration of the DHTF\" width=\"900\">
</p>

<p>
  This centralized configuration consists of a main supply pipeline that distributes thermal energy from one or more heat supply subsystems to the network of connected users. Although the core structure remains the same across models, some specific elements may vary depending on the test case, such as:
</p>

<ul>
  <li>The composition of the heat supply system:
    <ul>
      <li>Gas boiler only</li>
      <li>Gas boiler + electric boiler</li>
      <li>Gas boiler + electric boiler + CHP unit</li>
    </ul>
  </li>
  <li>The cooling system:
    <ul>
      <li>Ideal (simplified) cooling model</li>
      <li>Real cooling subsystem implementation</li>
    </ul>
  </li>
  <li>Control strategies and operational settings</li>
</ul>

<p>
  These test cases aim to support model validation, comparative analysis, and the development of control strategies for centralized district heating configurations.
</p>

</html>"));
end Centralised;
