within MultiEnergySystem.DistrictHeatingNetwork.Components.Fittings;
model SuddenAreaChange
  "Model a sudden area change in the fluid flow"
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import Modelica.Units.SI;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};

  // Parameters
  parameter SI.Length D_i = 0.1 "Input diameter";
  parameter SI.Length D_o = 0.05 "Output diameter";
  parameter SI.PerUnit beta_restriction = 0.5 "Attrition coefficient for a diameter restriction";
  parameter SI.PerUnit beta_increase = 1 "Attrition coefficient for a diameter increase";

  // Final parameters
  final parameter SI.Area A_i = Modelica.Constants.pi * (D_i / 2) ^ 2 "Input area";
  final parameter SI.Area A_o = Modelica.Constants.pi * (D_o / 2) ^ 2 "Output area";

  // Working variables
  SI.PerUnit beta;
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Pressure loss/gain
  if inlet.m_flow > 0 then
  // Based on flux direction and A_i A_o, the area change is a increase or a decrease
    beta = if A_i > A_o then beta_restriction else beta_increase;
    inlet.p - outlet.p = (beta / A_i ^ 2 + 1 / (2 * A_o ^ 2) - 1 / (2 * A_i ^ 2)) * inlet.m_flow ^ 2 / rho0;
  else
  // Based on flux direction and A_i A_o, the area change is a increase or a decrease
    beta = if A_o > A_i then beta_restriction else beta_increase;
    outlet.p - inlet.p = (beta / A_o ^ 2 + 1 / (2 * A_i ^ 2) - 1 / (2 * A_o ^ 2)) * outlet.m_flow ^ 2 / rho0;
  end if;
  // Energy balance
  inStream(inlet.h_out) = outlet.h_out;
  inStream(outlet.h_out) = inlet.h_out;
annotation (
    Icon(graphics={  Rectangle(origin = {-50, 0}, lineColor = {102, 102, 102}, fillColor={192,80,77},       fillPattern=
              FillPattern.Solid,                                                                                                                          extent = {{-50, 44}, {50, -44}}), Rectangle(origin={50,-1},                                 fillColor={192,80,
              77},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        extent = {{-50, 23}, {50, -23}},
          pattern=LinePattern.None,
          lineColor={0,0,0})}));
end SuddenAreaChange;
