within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;

model ControlledElectricBoiler
  extends MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialBoiler;
  parameter Integer nR = 5 "Total number of resistors";
  parameter SI.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";
  parameter SI.Temperature Tout_ref = 80 + 273.15 "Reference value for internal control";
  parameter SI.Time trise = 15;
  SI.Power Pheat_ref;
  SI.SpecificEnthalpy hout_ref "Reference required temperature";
  Medium.ThermodynamicState fluidOut_ref;
  DistrictHeatingNetwork.Actuators.MultipleDaisyChain actuator;
  Modelica.Blocks.Logical.Hysteresis hysteresis[nR](each uLow = 0.1, each uHigh = Pmaxres-0.1, each pre_y_start = true);
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid[nR](each amplitude = Pmaxres, each rising = trise);

equation
  fluidOut_ref = Medium.setState_pTX(pout, Tout_ref);
  hout_ref = Medium.specificEnthalpy(fluidOut_ref);
  0 = outlet.m_flow*(hout_ref - hin) + Pheat_ref - Q_amb;
  0 = outlet.p - inlet.p "Momentum Balance";
  actuator.U = Pheat_ref;
  sum(triggeredTrapezoid.y) = Pheat;
  
  connect(actuator.Yi, hysteresis.u);
  connect(hysteresis.y, triggeredTrapezoid.u);
  
annotation(
    Icon(graphics = {Polygon(origin = {0, -4}, lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ControlledElectricBoiler;
