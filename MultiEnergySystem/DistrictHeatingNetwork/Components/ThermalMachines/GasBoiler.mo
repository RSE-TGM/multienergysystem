within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model GasBoiler
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter SI.MassFlowRate m_flow_fuel_nom = 0.004 "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6 "Nominal fuel calorific power" annotation (
    Dialog(tab = "Boiler Data"));

  SI.MassFlowRate m_flow_fuel "mass flowrate of the fuel";

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inletfuel annotation (
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  inlet.p - outlet.p = homotopy(m_flow*(449.449473 + m_flow*(14.618729 + 2.739099*m_flow)), pin_start - pout_start)  "Momentum Balance";
  //0 = inlet.p-outlet.p;
  inlet.p = inletfuel.p;
  Pheat = m_flow_fuel*HH*etanom;
  inletfuel.h_out = 0 "Dummy equation considering not fuel flow reversal";
  m_flow_fuel = inletfuel.m_flow;
annotation (
    Icon(graphics={  Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}})}));
end GasBoiler;
