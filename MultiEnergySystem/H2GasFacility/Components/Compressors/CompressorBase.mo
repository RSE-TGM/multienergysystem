within MultiEnergySystem.H2GasFacility.Components.Compressors;
partial model CompressorBase "Base class of a compressor"
  extends DistrictHeatingNetwork.Icons.Generic.InProgress;

  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.NG_4
      constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture
                                                                     "Medium model" annotation (
     choicesAllMatching = true);

  parameter H2GasFacility.Types.PerUnit eta_mech=0.98 "mechanical efficiency";
    parameter Types.Pressure pin_start "inlet start pressure"
    annotation (Dialog(tab="Initialisation"));
  parameter Types.Pressure pout_start "outlet start pressure"
    annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tdes_in "inlet design temperature";
  parameter Types.Temperature Tin_start=Tdes_in "inlet start temperature"
  annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tout_start "outlet start temperature"
  annotation (Dialog(tab="Initialisation"));
  parameter Types.MassFraction X_start[fluidIn.nX]
    "start gas composition" annotation (Dialog(tab="Initialisation"));
  parameter Types.MassFraction X0[fluidIn.nX] "Nominal mass fraction";
  parameter Types.MassFlowRate m_flow_nom = 0.38144106
    "Peak mass flow rate at full opening"; // A_v*dp_nom*dp_nom*1,



  Medium fluidIn(
    T_start = Tin_start,
    p_start = pin_start,
    X_start = X_start);
  Medium fluidOut(
    T_start = Tout_start,
    p_start = pout_start,
    X_start = X_start);

  Types.MassFraction X[fluidIn.nX] "Actual mass fraction";
  Types.MassFlowRate m_flow(start = m_flow_nom)
    "Mass flow rate through the valve";
  Types.SpecificEnthalpy hout_iso "Outlet isentropic enthalpy";
  Types.SpecificEnthalpy hout "Outlet enthaply";
  Types.SpecificEntropy s_in "Inlet specific entropy";
  Types.Pressure pout(start=pout_start) "Outlet pressure";

  Types.MassFlowRate w "Gas flow rate";
  H2GasFacility.Types.Angle phi "shaft rotation angle";
  H2GasFacility.Types.AngularVelocity omega "shaft angular velocity";
  H2GasFacility.Types.Torque tau "net torque acting on the compressor";

  H2GasFacility.Types.PerUnit eta "isentropic efficiency";
  H2GasFacility.Types.PerUnit PR "pressure ratio";

  Interfaces.FluidPortInlet inlet annotation (Placement(transformation(
          extent={{-120,40},{-80,80}}), iconTransformation(extent={{-120,40},{-80,
            80}})));
  Interfaces.FluidPortOutlet outlet annotation (Placement(
        transformation(extent={{80,40},{120,80}}), iconTransformation(extent={{80,
            40},{120,80}})));
  Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-70,
            -30},{-50,-10}}), iconTransformation(extent={{-70,-30},{-50,-10}})));
  Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{70,
            -30},{90,-10}}), iconTransformation(extent={{70,-30},{90,-10}})));

equation

  w = inlet.m_flow;
  assert(w >= 0, "The compressor model does not support flow reversal");
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;

  // Definition of fluids
  fluidIn.p = inlet.p;
  fluidIn.h = inStream(inlet.h_out);
  fluidIn.Xi = inStream(inlet.Xi);

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = fluidIn.Xi;

  // Set outlet gas properties
  // outlet.p = pout;
  // outlet.h_out = hout;
  // outlet.Xi = fluidIn.Xi;

  // Component mass balances
  fluidOut.Xi = fluidIn.Xi;

  if explicitIsentropicEnthalpy then
    hout_iso = Medium.isentropicEnthalpy(outlet.p, gas_in.state)
      "Approximated isentropic enthalpy";
    hout - gas_in.h = 1/eta*(hout_iso - gas_in.h);
    // dummy assignments
    s_in = 0;
    gas_iso.p = 1e5;
    gas_iso.T = 300;
  else
    // Properties of the gas after isentropic transformation
    gas_iso.p = pout;
    s_in = Medium.specificEntropy(gas_in.state);
    s_in = Medium.specificEntropy(gas_iso.state);
    hout - gas_in.h = 1/eta*(gas_iso.h - gas_in.h);
    // dummy assignment
    hout_iso = 0;
  end if;

  w*(hout - fluidIn.h) = tau*omega*eta_mech "Energy balance";
  PR = pout/fluidIn.p "Pressure ratio";

  // Mechanical boundary conditions
  shaft_a.phi = phi;
  shaft_b.phi = phi;
  shaft_a.tau + shaft_b.tau = tau;
  der(phi) = omega;




  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{-26,-88},{-26,32},{34,12},{34,-68},{-26,-88}},
          lineColor={244,125,35},
          lineThickness=1,
          fillColor={244,125,35},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-90,60},{-48,60},{-48,60},{-48,60},{-20,60},{-20,30}},
          color={244,125,35},
          thickness=1),
        Line(
          points={{20,16},{20,60},{60,60},{68,60},{90,60}},
          color={244,125,35},
          thickness=1),
        Rectangle(
          extent={{-54,-14},{-26,-26}},
          lineThickness=0.5,
          fillColor={120,120,120},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{34,-14},{72,-26}},
          lineThickness=0.5,
          fillColor={120,120,120},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}),                           Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CompressorBase;
