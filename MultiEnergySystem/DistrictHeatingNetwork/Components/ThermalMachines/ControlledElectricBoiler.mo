within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledElectricBoiler
  extends DistrictHeatingNetwork.Components.ThermalMachines.BaseClass.PartialBoiler;
  parameter Real nR = 5 "Total number of resistors";
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";
  parameter SI.Time trise = 15 "Rising time of heater from 0 to full power";
  parameter SI.Time tdelay = 10 "Delay time to obtain 100% thermal power";
  parameter Real T_bandwidth = 2 "Temperature Bandwidth for the on/off temperature controller";

  DistrictHeatingNetwork.Types.Power Pheat_ref "Reference value for computed Heat Power required";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_ref "Reference required temperature";
  DistrictHeatingNetwork.Types.Pressure ploss "Pressure loss in boiler";

  Medium fluidOut_ref(T_start = Tout_start, p_start = pout_start) "Reference outlet fluid";

  Modelica.Blocks.Interfaces.RealInput Tout_ref annotation (Placement(transformation(
          extent={{-80,-10},{-60,10}}),  iconTransformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.BooleanInput heat_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-80,-60},{-60,-40}})));
equation
  fluidOut_ref.p = pin;
  fluidOut_ref.T = Tout_ref;
  hout_ref = fluidOut_ref.h;
  0 = inlet.m_flow*(-hout_ref + hin) + Pheat_ref;
  //990*9.81*h = inlet.p - outlet.p "Momentum Balance";
  inlet.p - outlet.p = ploss;
  //ploss = max((0.093553176181407 + m_flow*(-0.060909664942311 + 0.107018894700363*m_flow))*1e5,0) "Momentum Balance";
  ploss = max((-0.001696730452948 + 0.038724546018764*m_flow + 0.083107463331985*m_flow.*m_flow)*1e5,0);
  Pheat = if heat_on then max(min(Pheat_ref, Pmaxres*nR),0) else 0;
annotation (
    Icon(graphics={  Polygon( lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}));
end ControlledElectricBoiler;
