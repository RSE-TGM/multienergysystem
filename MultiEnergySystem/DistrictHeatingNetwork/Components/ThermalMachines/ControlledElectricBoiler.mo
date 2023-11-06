within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledElectricBoiler
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter Integer nR = 5 "Total number of resistors";
  parameter SI.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";
  parameter SI.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter SI.Time trise = 15 "Rising time of heater from 0 to full power";
  parameter SI.Time tdelay = 10 "Delay time to obtain 100% thermal power";
  parameter Real T_bandwidth = 2 "Temperature Bandwidth for the on/off temperature controller";

  Boolean heat_on(fixed = true, start = true);
  SI.Power Pheat_ref "Reference value for computed Heat Power required";
  SI.SpecificEnthalpy hout_ref "Reference required temperature";

  Medium fluidOut_ref(T_start = Tout_start, p_start = pout_start) "Reference outlet fluid";

equation
  fluidOut_ref.p = pin;
  fluidOut_ref.T = Tout_ref;
  hout_ref = fluidOut_ref.h;
  0 = inlet.m_flow*(-hout_ref + hin) + Pheat_ref;
  0 = outlet.p - inlet.p "Momentum Balance";

  Pheat = delay(if heat_on then Pmaxres*nR else 0, tdelay);

  when Tout_ref - T_bandwidth > Tout and pre(heat_on)==false then
    heat_on=  true;
  elsewhen Tout_ref + T_bandwidth <= Tout and pre(heat_on)==true then
    heat_on=  false;
  end when;

annotation (
    Icon(graphics={  Polygon( lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ControlledElectricBoiler;
