within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
package BaseClass
  extends Modelica.Icons.BasesPackage;

annotation (Documentation(info="<html>

  <h4>BaseClass – Valve Base Models and Characteristics</h4>

  <p>This package includes models and utility functions for modeling water valves in district heating networks. 
  It provides both partial valve components and mathematical descriptions of valve opening characteristics 
  used throughout the library.</p>

  <h5>Subpackages</h5>
  <ul>
    <li><b>ValveCharacteristics</b>: Set of reusable functions defining typical valve opening behavior (e.g., linear, quadratic, equal-percentage).</li>
  </ul>

  <h5>Partial Models</h5>
  <ul>
    <li><b>PartialValve</b>: Base class for standard 2-port control valves with dynamic pressure-flow relation and support for multiple opening laws.</li>
    <li><b>PartialThreeWayValve</b>: Base class for 3-port (mixing or diverting) valves composed of two embedded <code>PartialValve</code> components.</li>
  </ul>

</html>"));
end BaseClass;
