within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model Stratified1DStorage
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  import      Modelica.Units.SI;

  // Parameter
  parameter SI.Length h = 1 "Height of the TES";
  parameter SI.Length D = 1 "Diameter of the TES";
  parameter SI.ThermalConductivity lambda_w = 0.4 "Water conductivity for heat exchange between volumes";

  parameter SI.Temperature T_start = 298.15 "Starting temperature";
  parameter SI.Temperature T_ext = 288.15 "Ambient temperature";
  parameter SI.ThermalConductivity lambdaIns = 0.04 "Conductivity of the TES insulation";
  parameter SI.Length dIns = 0.15 "Insulation thickness";

  parameter Integer N = 5 "Number of volumes";

  // Final parameters
    final parameter SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*h) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2)  "Flat Surface of the cylinder";
  final parameter SI.Area A = Modelica.Constants.pi*(D/2)^2 "Cross section area of the TES";
  final parameter SI.Volume V = h*A "Volume of water inside the TES";
  final parameter SI.Mass M = V * rho0 "Mass of water inside the mixing volume";

  // Variables
  SI.MassFlowRate m_flow "Mass flow rate across the volume";
  SI.Temperature Ttilde[N](each start = T_start) "Temperatue of the water inside the volume";
  SI.Temperature T[N+1] "Temperatue of the water interfaces between volumes";
  SI.HeatFlowRate Q_amb[N] "Heat losses to ambient";
  SI.HeatFlowRate Q_cond[N] "Heat losses to ambient";

  // Outputs
  Modelica.Blocks.Interfaces.RealOutput tesHotT annotation (
    Placement(visible = true, transformation(origin = {-94, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealOutput tesColdT annotation (
    Placement(visible = true, transformation(origin = {-84, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;
  // Pressure at the bottom of the tank is increased as Stevino
  inlet.p - outlet.p = rho0 * h * Modelica.Constants.g_n;
  // Energy balance
  for k in 1:N loop
    // Volume energy balance
    M / N * cp * der(Ttilde[k]) = m_flow * cp * (T[k] - T[k + 1]) - Q_amb[k] - Q_cond[k];
    if k == 1 then
      // Heat exchange with the ambient from flat top face
      Q_amb[k] = (R_flat + R_lateral / R_flat * R_lateral) * (Ttilde[k] - T_ext);
      // Heat exchange with 2nd volume
      Q_cond[k] = lambda_w * A / (h / N) * (Ttilde[k] - Ttilde[k + 1]);
    elseif k == N then
      // Heat exchange with ambient
      Q_amb[k] = (R_flat + R_lateral / R_flat * R_lateral) * (Ttilde[k] - T_ext);
      // Heat exchange with N-1th volume
      Q_cond[k] = lambda_w * A / (h / N) * (Ttilde[k - 1] - Ttilde[k]);
    else
      // Heat exchange with the ambient from lateral faces
      Q_amb[k] = 1 / R_lateral * (Ttilde[k] - T_ext);
      // Heat exchange with layer above and below
      Q_cond[k] = lambda_w * A / (h / N) * (Ttilde[k + 1] - 2 * Ttilde[k] + Ttilde[k - 1]);
    end if;
  end for;
   // Boundary equations
  if not allowFlowReversal or m_flow > 0 then
    // Hot layer on top, inlet is at the top
    T[1] = inStream(inlet.h_out) / cp;
    T[2:end] = Ttilde;
  else
// Cold layer at the bottom
    T[1:end - 1] = Ttilde;
    T[end] = inStream(outlet.h_out) / cp;
  end if;
  inlet.h_out = T[1] * cp;
  outlet.h_out = T[end] * cp;
// Output temperature, temperature of the volumes
  tesHotT = Ttilde[1] - 273.15;
  tesColdT = Ttilde[N] - 273.15;
annotation (
    Diagram,
    Icon(graphics={  Polygon(lineColor = {131, 131, 131}, fillColor = {173, 173, 173}, fillPattern = FillPattern.VerticalCylinder, points = {{-100, 80}, {-40, 100}, {40, 100}, {100, 80}, {100, -60}, {40, -100}, {-40, -100}, {-100, -60}, {-100, -60}, {-100, 80}}), Rectangle(origin = {-97, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Rectangle(origin = {-75, 0}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin = {75, 0}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Text(origin = {3, 7}, extent = {{-61, 29}, {61, -29}}, textString = "TES"), Rectangle(origin = {97, -80}, fillColor = {140, 140, 140}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}})}));
end Stratified1DStorage;
