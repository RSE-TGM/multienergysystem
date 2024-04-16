within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledGasBoiler
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.BaseClass.PartialBoiler;
  parameter SI.MassFlowRate m_flow_fuel_nom = 0.004 "Nominal fuel (CH4) mass flow rate" annotation (
    Dialog(tab = "Boiler Data"));
  parameter Real HH(unit = "J/kg", nominal = 10e6) = 50e6 "Nominal fuel calorific power" annotation (
    Dialog(tab = "Boiler Data"));
  //parameter SI.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter SI.Time trise = 15 "Rising time of heater from 0 to full power";
  parameter SI.Time tdelay = 10 "Delay time to obtain 100% thermal power";
  parameter Real T_bandwidth = 2 "Temperature Bandwidth for the on/off temperature controller";

  // Variables
  //Boolean heat_on(fixed = true, start = true);
  SI.MassFlowRate m_flow_fuel "mass flowrate of the fuel";
  SI.Power Pheat_ref "Reference value for computed Heat Power required";
  SI.SpecificEnthalpy hout_ref "Reference required temperature";
  Medium fluidOut_ref(T_start = Tout_start, p_start = pout_start) "Reference outlet fluid";


  Modelica.Blocks.Interfaces.RealInput Tout_ref annotation (Placement(
        transformation(extent={{-80,-10},{-60,10}}),  iconTransformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.BooleanInput heat_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-80,-60},{-60,-40}})));
equation
  //inlet.p - outlet.p = homotopy(m_flow*(449.449473 + m_flow*(14.618729 + 2.739099*m_flow)), pin_start - pout_start)  "Momentum Balance";
  inlet.p - outlet.p = rho*9.81*h + (0.410603*m_flow - 0.359991)*1e5;
  fluidOut_ref.p = pout;
  fluidOut_ref.T = Tout_ref;
  hout_ref = fluidOut_ref.h;
  0 = inlet.m_flow*(-hout_ref + hin) + Pheat_ref;

  //Pheat = delay(if heat_on then min(Pheat_ref, Pmaxnom) else 0, tdelay);
  Pheat = if heat_on then max(min(Pheat_ref, Pmaxnom),0) else 0;
  //Pheat = min(Pheat_ref, Pmaxnom);

//   when Tout_ref - T_bandwidth > Tout and pre(heat_on)==false then
//     heat_on=  true;
//   elsewhen Tout_ref + T_bandwidth <= Tout and pre(heat_on)==true then
//     heat_on=  false;
//   end when;


  Pheat = m_flow_fuel*HH*etanom;
annotation (
    Icon(graphics={  Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points = {{-21, -37}, {-27, -3}, {-21, -13}, {-19, 25}, {-11, 13}, {1, 37}, {13, 13}, {19, 25}, {23, -15}, {27, -5}, {21, -37}, {1, -43}, {-21, -37}}), Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-15, -37}, {-23, -13}, {-15, -17}, {-15, 3}, {-9, -1}, {1, 25}, {9, -1}, {15, 3}, {17, -17}, {23, -13}, {15, -37}, {1, -43}, {-15, -37}})}));
end ControlledGasBoiler;
