within MultiEnergySystem.H2GasFacility.Components.Storage;
model LumpedStorageConstantMass

  extends MultiEnergySystem.H2GasFacility.Components.BaseClass.PartialLumpedVolume;

  // To be changed
  // import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};

  // Insulation parameters
  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density";
  parameter H2GasFacility.Types.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter H2GasFacility.Types.Length dIns = 0.15 "Insulation thickness";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";

  // Variables
  Types.Temperature Ttilde(start = T_start) "Temperatue of the water inside the volume";
  Types.HeatFlowRate Q_amb "Heat losses to ambient";

  Modelica.Blocks.Interfaces.RealOutput temperatureMixVolume annotation (
    Placement(visible = true, transformation(origin = {60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));


equation
    // Fluid definition
    fluidIn.p = inlet.p;
    fluidIn.h = inlet.h_out;
    fluidIn.Xi = inlet.Xi;

    fluidOut.p = outlet.p;
    fluidOut.h = outlet.h_out;
    fluidOut.Xi = outlet.Xi;


    // Boundary Conditions
    inlet.h_out = inStream(inlet.h_out);

    // Mass Balance
    inlet.m_flow + outlet.m_flow = 0 "No mass dynamics";

    // Energy Balance
    M_id * fluidIn.cp * der(Ttilde) = m_flow_in * fluidIn.cp * (Tin - Tout) - Q_amb "Ideal perfectly mixed fluid";

    // Pressure at the bottom of the tank is increased as Stevino
    inlet.p - outlet.p = rho_nom*H*g_n;

    // Computation of heat loss to ambient
    Q_amb = 1/(R_lateral + 2*R_flat)*(Ttilde - T_ext) "Insulation all around";

    // Output variable
    temperatureMixVolume = Ttilde - 273.15;

    // Boundary equations
    outlet.h_out = Tout * fluidIn.cp;
    if not allowFlowReversal or m_flow_in > 0 then
      Tin = inStream(inlet.h_out) / fluidIn.cp;
      Tout = Ttilde;
    else
      Tin = Ttilde;
      Tout = inStream(outlet.h_out) / fluidIn.cp;
    end if;

initial equation
    der(Ttilde) = 0;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end LumpedStorageConstantMass;
