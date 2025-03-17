within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model GasBoiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.BaseClass.PartialBoiler;

  replaceable model Gas = H2GasFacility.Media.IdealGases.CH4H2 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  parameter SI.MassFlowRate m_flow_fuel_nom = 0.004 "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 55.437316e6 "Nominal fuel calorific power" annotation (
    Dialog(tab = "Boiler Data"));
  parameter Real convf = 275 "experimental conversion factor";
  parameter SI.Time tdelay = 5 "Delay time to obtain 100% thermal power";

  DistrictHeatingNetwork.Types.MassFlowRate m_flow_fuel "mass flowrate of the fuel";
  DistrictHeatingNetwork.Types.Pressure ploss "Pressure loss through the boiler";

  Gas fuel(T_start = Tout_start, p_start = pout_start) "Reference outlet fluid";

  MultiEnergySystem.H2GasFacility.Interfaces.FluidPortInlet inletfuel(nXi=fuel.nXi)   annotation (
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-60,0},   extent={{-10,-10},
            {10,10}},                                                                                                                                                                 rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput heat_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-80,-60},{-60,-40}})));
equation
  fuel.h = inStream(inletfuel.h_out);
  fuel.Xi = inStream(inletfuel.Xi);
  fuel.p = 1.013e5;

  inlet.p - outlet.p = ploss;
  ploss = max((0.005482696604412 + m_flow*(0.004710088236134 + 0.141767086689464*m_flow))*1e5,0);
  inletfuel.p = system.p_amb;
  //Pheat = m_flow_fuel*abs(inStream(inletfuel.h_out))/convf;
  //Pheat = m_flow_fuel*fuel.HHV_mix*etanom;
  inletfuel.h_out = 0 "Dummy equation considering not fuel flow reversal";
  inletfuel.Xi = {1, 0} "Dummy equation considering not fuel flow reversal";
  m_flow_fuel = inletfuel.m_flow;
  Pheat = delay(if heat_on then max(min(m_flow_fuel*fuel.HHV_mix*etanom, Pmaxnom),0) else 0, tdelay);
annotation (
    Icon(graphics={  Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin = {-1, 1}, lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}})}));
end GasBoiler;
