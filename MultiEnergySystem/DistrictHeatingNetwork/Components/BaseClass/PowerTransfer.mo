within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
model PowerTransfer
  "Model a imposed power loss to the fluid, with no pressure loss"
  extends MultiEnergySystem.DistrictHeatingNetwork.Interfaces.PartialTwoPort;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  import MultiEnergySystem.DistrictHeatingNetwork.Types;

  parameter Types.MassFlowRate b = 0.001 "Regularization mass flow rate, avoid null division. Try to keep it low in accordance to the expected mass flow.";
  parameter Types.Temperature Tin_start = 36+273.15;
  parameter Types.Temperature Tout_start = 28+273.15;
  parameter Types.Pressure pin_start = 2.7e5;

  // Variables
  Types.Temperature Tin(start = Tin_start) "Inlet temperature";
  Types.Temperature Tout "Outlet temperature";
  Types.SpecificEnthalpy hin "Inlet specific enthalpy";
  Types.SpecificEnthalpy hout "Outlet specific enthalpy";
  Types.Pressure pin(start = pin_start) "inlet pressure";
  Types.Pressure pout "Outlet pressure";
  Types.MassFlowRate m_flow "Mass Flow Rate across the component";

  Modelica.Blocks.Interfaces.RealInput Ptransfer "if positive then power entering else power leaving the component/fluid." annotation (
    Placement(
      visible=true,
      transformation(
        origin={-90,60},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={0,80},
        extent={{-20,-20},{20,20}},
        rotation=-90)));
equation
  // Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  // Momentum balance
  inlet.p - outlet.p = 0;
  // Energy balance
  inStream(inlet.h_out) + Ptransfer/max(inlet.m_flow, b) = outlet.h_out;
  inlet.h_out =inStream(outlet.h_out) + Ptransfer/max(outlet.m_flow, b);

  //Definition of variables
  hin = inStream(inlet.h_out);
  hout = outlet.h_out;
  Tin = hin/cp;
  Tout = hout/cp;
  pin = inlet.p;
  pout = outlet.p;
  m_flow = inlet.m_flow;

annotation (
    Icon(graphics={  Rectangle(lineColor = {173, 173, 173}, lineThickness = 3, extent = {{-100, 80}, {100, -80}}), Line(origin = {0, -0.81}, points = {{-100, -0.102339}, {-52, -0.102339}, {-30, 39.8977}, {0, -40.1023}, {30, 39.8977}, {54, -0.102339}, {100, -0.102339}}, color = {0, 0, 255}, thickness = 1.75)}));
end PowerTransfer;
