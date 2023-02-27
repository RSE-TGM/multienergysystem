within MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass;
partial model PartialLumpedVolume
  "Partial model of a Lumped volume of water, operated at constant mass with losses to ambient"
  //extends DHN4Control.Interfaces.PartialTwoPort;
  import      Modelica.Units.SI;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp, rho0};

// Parameters
  parameter Boolean allowFlowReversal = true "= false prohibits flow reversal, simplify the equations";
  parameter SI.Length h "High of the lumped water tank";
  parameter SI.Length D "Diameter of the lumped water tank";
  parameter SI.Temperature T_start = 298.15 "Starting temperature";
  parameter SI.Temperature T_ext = 288.15 "Ambient temperature";

  final parameter SI.Volume V = Modelica.Constants.pi*h*(D/2)^2 "Volume of water inside the mixing volume";
  final parameter SI.Mass M = V * rho0 "Mass of water inside the mixing volume";

// Variables
  SI.MassFlowRate m_flow "Mass flow rate across the volume";
  SI.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  SI.Temperature Tin "Temperatue of the water entering/leaving the volume";
  SI.Temperature Tout "Temperatue of the water entering/leaving the volume";
  SI.HeatFlowRate Q_amb "Heat losses to ambient";

// Output
  Modelica.Blocks.Interfaces.RealOutput temperatureMixVolume annotation (
    Placement(visible = true, transformation(origin = {60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,-60},
        extent={{-20,-20},{20,20}},
        rotation=0)));
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
// Mass balance
  inlet.m_flow + outlet.m_flow = 0;
  m_flow = inlet.m_flow;
// Boundary equations
  if not allowFlowReversal or m_flow > 0 then
    Tin = inStream(inlet.h_out) / cp;
    Tout = Ttilde;
  else
    Tin = Ttilde;
    Tout = inStream(outlet.h_out) / cp;
  end if;
  inlet.h_out = Tin * cp;
  outlet.h_out = Tout * cp;
  temperatureMixVolume = Ttilde - 273.15;
// Energy balance
  M * cp * der(Ttilde) = m_flow * cp * (Tin - Tout) - Q_amb;
initial equation
  der(Ttilde) = 0;

  annotation (
    Icon(coordinateSystem(extent = {{-100, -140}, {100, 140}})));
end PartialLumpedVolume;
