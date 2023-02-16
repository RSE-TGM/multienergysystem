within MultiEnergySystem.DistrictHeatingNetwork.Components;
model ExpansionTank
  "Model an ideal expansion tank, with infinite volume and constant temperature. Fix a pressure at the connected point, independently from the mass flow."
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialOnePort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  parameter Modelica.Units.SI.Pressure p = 2.5e5 "Imposed pressure";
  parameter Modelica.Units.SI.Temperature T = 338.15 "Temperature inside the expansion tank";
equation
  // Impose pressure
  inlet.p = p;
  // Inner temperature
  inlet.h_out = T*cp;
annotation (
    Icon(graphics={  Rectangle(origin = {77, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Rectangle(origin = {-77, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Polygon(origin = {0, -1}, fillColor = {171, 171, 171}, fillPattern = FillPattern.Solid, points = {{-80, 61}, {-60, 81}, {-40, 91}, {-20, 99}, {0, 101}, {20, 99}, {40, 91}, {60, 81}, {80, 61}, {80, -59}, {60, -79}, {40, -89}, {20, -97}, {0, -101}, {-20, -97}, {-40, -89}, {-60, -79}, {-80, -59}, {-80, -59}, {-80, 61}}), Text(origin={53,37},  extent={{-65,27},
              {65,-27}},                                                                                                                                                                                                        textString = "Exp.
Tank"), Text(
          extent={{-100,-40},{100,-80}},
          textColor={28,108,200},
          textString="%name")}));
end ExpansionTank;
