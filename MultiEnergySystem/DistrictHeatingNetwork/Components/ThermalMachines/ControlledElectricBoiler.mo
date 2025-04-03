within MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines;
model ControlledElectricBoiler
  extends DistrictHeatingNetwork.Components.ThermalMachines.BaseClass.PartialBoiler;
  parameter Real nR = 5 "Total number of resistors";
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter SI.Resistance R = 47.56 "Nominal resistance of each resistor";

  DistrictHeatingNetwork.Types.Power Pheat_ref "Reference value for computed Heat Power required";
  DistrictHeatingNetwork.Types.SpecificEnthalpy hout_ref "Reference required temperature";
  DistrictHeatingNetwork.Types.Pressure ploss "Pressure loss in boiler";

  Medium fluidOut_ref(T_start = Tout_start, p_start = pout_start) "Reference outlet fluid";

  Modelica.Blocks.Interfaces.RealInput Tout_ref annotation (Placement(transformation(
          extent={{-80,-10},{-60,10}}),  iconTransformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Interfaces.BooleanInput heat_on annotation (Placement(
        transformation(extent={{110,-10},{70,30}}), iconTransformation(extent={{-80,-60},{-60,-40}})));
  ElectricNetwork.Interfaces.ElectricPortInlet inletPower annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  fluidOut_ref.p = pin;
  fluidOut_ref.T = Tout_ref;
  hout_ref = fluidOut_ref.h;
  0 = inlet.m_flow*(-hout_ref + hin) + Pheat_ref "Ideal power/temperature control";
  inlet.p - outlet.p = ploss;
  ploss = 990*9.81*h*0 + (m_flow*(0.199135 + 0.290023*m_flow))*1e5;
  Pheat = if heat_on then max(min(Pheat_ref, Pmaxres*nR),0) else 0;

  inletPower.P = Pheat;
annotation (
    Icon(graphics={  Polygon( lineColor = {255, 170, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, lineThickness = 1, points = {{14, 30}, {-4, 30}, {-16, -4}, {-2, 0}, {-14, -30}, {16, 12}, {4, 8}, {4, 8}, {14, 30}})}),
      Documentation(info="<html>
<h2>ControlledElectricBoiler</h2>
<p>
The <code>ControlledElectricBoiler</code> model represents an electric boiler composed of multiple electric resistors, with an ideal outlet tempeature control.
The model calculates the required electric power to achieve the desired outlet fluid temperature and dynamically limits the heat output based on the number and rating of the installed resistors.
</p>

<h3>Key Features</h3>
<ul>
  <li>Extends the <a href=\"modelica://MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.BaseClass.PartialBoiler\">PartialBoiler</a> base class.</li>
  <li>Models heat generation through a set of <code>nR</code> identical resistors with rated power <code>Pmaxres</code> and nominal resistance <code>R</code>.</li>
  <li>Uses a Boolean input <code>heat_on</code> to control activation of the heating process.</li>
  <li>Takes a reference outlet temperature input <code>Tout_ref</code> to compute required heating power.</li>
  <li>Calculates the pressure drop through the component using a quadratic approximation as a function of mass flow rate.</li>
  <li>Connects to an electric network via the <code>inletPower</code> port, where the absorbed electric power equals the generated thermal power.</li>
</ul>

<h3>Parameters</h3>
<ul>
  <li><code>nR</code>: Total number of heating resistors.</li>
  <li><code>Pmaxres</code>: Electric power rating of each resistor [W].</li>
  <li><code>R</code>: Nominal resistance of each heating element [Ohm].</li>
</ul>

<h3>Connectors</h3>
<ul>
  <li><code>Tout_ref</code>: Real input signal specifying the reference outlet temperature [K].</li>
  <li><code>heat_on</code>: Boolean input signal to enable heating.</li>
  <li><code>inletPower</code>: Electric power inlet port (absorbs electrical energy equal to heat produced).</li>
</ul>

<h3>Internal Variables</h3>
<ul>
  <li><code>Pheat_ref</code>: Computed heating power required [W].</li>
  <li><code>hout_ref</code>: Reference fluid enthalpy at desired outlet temperature [J/kg].</li>
  <li><code>ploss</code>: Pressure drop across the boiler [Pa].</li>
  <li><code>fluidOut_ref</code>: Reference medium record to evaluate the outlet state.</li>
</ul>

<h3>Equations and Behavior</h3>
<ul>
  <li>The required heating power is calculated based on static fluid enthalpy balance and the reference outlet temperature.</li>
  <li>Heating is activated only when <code>heat_on</code> is true.</li>
  <li>The actual heating power is limited to the maximum available electrical power: <code>Pmaxres × nR</code>.</li>
  <li>The absorbed electric power (<code>inletPower.P</code>) equals the generated heating power (<code>Pheat</code>).</li>
  <li>The pressure loss is calculated using a quadratic fit as a function of mass flow rate.</li>
</ul>

<h3>Notes</h3>
<ul>
  <li>This model is suitable for control-oriented simulations of electric heating systems in district heating networks.</li>
  <li>It assumes that all resistors operate in parallel and switch on/off simultaneously.</li>
</ul>

</html>"));
end ControlledElectricBoiler;
