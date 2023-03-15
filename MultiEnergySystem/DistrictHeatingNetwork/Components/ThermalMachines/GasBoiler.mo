within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;

model GasBoiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter SI.MassFlowRate m_flow_fuel_nom = 0.004
    "Nominal fuel (CH4) mass flow rate" annotation(
    Dialog(tab = "Boiler Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6
    "Nominal fuel calorific power" annotation(
    Dialog(tab = "Boiler Data"));

  SI.MassFlowRate m_flow_fuel
    "mass flowrate of the fuel";
  
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inletfuel annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  m_flow*(449.449473 + m_flow*(14.618729 + 2.739099*m_flow)) = inlet.p - outlet.p "Momentum Balance";
  inlet.p = inletfuel.p;
  Pheat = m_flow_fuel*HH*etanom;
  inletfuel.h_out = 0 "Dummy equation considering not fuel flow reversal";
  m_flow_fuel = inletfuel.m_flow;
annotation(
    Icon(graphics = {Polygon(lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end GasBoiler;
