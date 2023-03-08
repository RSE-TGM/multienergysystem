within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;

model ControlledElectricBoiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter Integer nR = 5 "Total number of resistors";
  parameter SI.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";
  parameter SI.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter SI.Time trise = 15 "Rising time of heater from 0 to full power";
  parameter Real bandwidth = 2 "Bandwidth for the on/off temperature controller";
  SI.Power Pheat_ref(start = 50e3) "Reference value for computed Heat Power required";
  SI.SpecificEnthalpy hout_ref "Reference required temperature";
  Medium.ThermodynamicState fluidOut_ref "Reference outlet fluid";
  DistrictHeatingNetwork.Actuators.MultipleDaisyChain actuator(n = nR) "Daisy Chain with n actuators";
  Modelica.Blocks.Logical.Greater comparison[nR] "Comparison component for nR outputs";
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid[nR](each amplitude = Pmaxres, each rising = trise);
  Modelica.Blocks.Logical.OnOffController onoff(bandwidth = bandwidth, pre_y_start = true) "On/Off controller";
  MultiEnergySystem.DistrictHeatingNetwork.Actuators.TriggerGenerator trigger "Trigger reference";
equation
  fluidOut_ref = Medium.setState_pTX(pout, Tout_ref);
  hout_ref = Medium.specificEnthalpy(fluidOut_ref);
  0 = outlet.m_flow*(hout_ref - hin) + Pheat_ref - Q_amb;
  0 = outlet.p - inlet.p "Momentum Balance";
  sum(triggeredTrapezoid.y) = Pheat "Sum of all real actuator outputs is equal to the full Heat Power";
  comparison.u2 = 0.1*ones(nR); 
  onoff.reference = Tout_ref "Reference outlet temperature";
  onoff.u = Tout "Real measure of outlet temperature";
  connect(onoff.y, trigger.u);
  trigger.amplitude = Pheat_ref "Total reference heat power required to keep Tout as Tout_ref";
  connect(trigger.y, actuator.U);
  connect(actuator.Yi, comparison.u1);  
  connect(comparison.y, triggeredTrapezoid.u);  
annotation(
    Icon(graphics = {Polygon(origin = {0, -4}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ControlledElectricBoiler;
