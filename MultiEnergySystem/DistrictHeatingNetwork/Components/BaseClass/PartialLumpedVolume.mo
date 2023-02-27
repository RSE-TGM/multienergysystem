within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
partial model PartialLumpedVolume
  "Partial model of a Cylindrical lumped volume of water, operated ideally at constant mass with losses to ambient"
  //extends DHN4Control.Interfaces.PartialTwoPort;
  import      Modelica.Units.SI;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};
  outer System system "system object for global defaults";


// Parameters
  parameter Boolean allowFlowReversal = true "= false prohibits flow reversal, simplify the equations";
  parameter SI.Length h "High of the lumped water tank";
  parameter SI.Length D "Diameter of the lumped water tank";
  parameter SI.Temperature T_start = 298.15 "Starting temperature";
  parameter SI.Temperature T_ext = system.T_amb "Ambient temperature";
  parameter SI.Pressure pin_start = 5e5 "start pressure at lower part of the tank";

  final parameter SI.Volume V = Modelica.Constants.pi*h*(D/2)^2 "Volume of water inside the mixing volume";
  final parameter SI.Mass M_id = V * rho0 "Mass of water inside the mixing volume";

// Variables
  SI.MassFlowRate m_flow_in "Mass flow rate across the volume";
  SI.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  SI.Temperature Tin "Temperatue of the water entering/leaving the volume";
  SI.Temperature Tout "Temperatue of the water entering/leaving the volume";
  SI.HeatFlowRate Q_amb "Heat losses to ambient";
  SI.Pressure pin(start = pin_start) "Pressure in the lower part of the tank";
  SI.Pressure pout "Pressure in the high part of the tank";
  // Output
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (Placement(
      visible=true,
      transformation(
        origin={100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation
  
  // Definition of some variables
  m_flow_in = inlet.m_flow "Mass flow rate entering the fluid";  
  pout = outlet.p;
  pin = inlet.p;
  
  // Boundary Conditions
  inlet.h_out = inStream(inlet.h_out);

  annotation (
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 140}})));
end PartialLumpedVolume;
