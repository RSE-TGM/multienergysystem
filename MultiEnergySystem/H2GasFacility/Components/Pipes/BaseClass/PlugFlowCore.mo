within MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass;
model PlugFlowCore
  extends MultiEnergySystem.H2GasFacility.Components.Pipes.BaseClass.PartialRoundTube(Di=Di);
  import Modelica.Fluid.Utilities.regSquare;

  // Parameter declaration
  parameter H2GasFacility.Types.PerUnit cf = 0.004 "Constant Fanning factor";
  parameter H2GasFacility.Types.Density rho_nom = fluidIn.rho_start "Nominal density";
  parameter H2GasFacility.Types.Velocity u_nom = 1 "Nominal fluid velocity";
  parameter H2GasFacility.Types.MassFlowRate m_flow_small = 0.001 "Small mass flow rate for regularization of zero flow";
  parameter H2GasFacility.Types.Temperature T_start=298.15        "Start value to be used for specific enthalpy initialization";

  // Final parameter computation
  final parameter Modelica.Units.SI.PressureDifference dp_nom = cf / 2 * rho_nom * omega * L / A * u_nom ^ 2 "Nominal pressure drop";
  final parameter H2GasFacility.Types.MassFlowRate m_flow_nom = rho_nom * A * u_nom "Nominal mass flow rate";

  //Variables
  H2GasFacility.Types.Length x "Spatial coordinate for spatialDistribution operator";
  H2GasFacility.Types.Velocity v "Flow velocity of medium in pipe";
  H2GasFacility.Types.VolumeFlowRate q "Volume flow rate at inflowing port (positive when flow from port_a to port_b)";

  Real[fluidIn.nXi]  inStreamIn;
  Real[fluidIn.nXi]  inStreamOut;

//protected
    parameter H2GasFacility.Types.SpecificEnthalpy h_ini_in = fluidIn.h_id_start "For initialization of spatialDistribution inlet";
    parameter H2GasFacility.Types.SpecificEnthalpy h_ini_out = fluidOut.h_id_start "For initialization of spatialDistribution outlet";
    parameter H2GasFacility.Types.MassFraction Xi_ini_in[fluidIn.nXi] = fluidIn.Xi_start "For initialization of spatialDistribution inlet";
    parameter H2GasFacility.Types.MassFraction Xi_ini_out[fluidOut.nXi] = fluidOut.Xi_start "For initialization of spatialDistribution outlet";
initial equation
  x = 0;
equation
  // Fluid definition
  fluidIn.p = inlet.p;
  fluidIn.h = inlet.h_out;
  fluidIn.Xi = inlet.Xi;

  fluidOut.p = outlet.p;
  fluidOut.h = outlet.h_out;
  fluidOut.Xi = outlet.Xi;

  // Pressure drop due to friction
  inlet.p - outlet.p = rho_nom * Modelica.Constants.g_n * H + homotopy(cf / 2 * rho_nom * omega * L / A * regSquare(v, u_nom * 0.05), dp_nom / m_flow_nom * q * rho_nom);
  // Mass balance (no storage)
  inlet.m_flow + outlet.m_flow = 0;
  der(x) = v;
  q = inlet.m_flow / fluidIn.rho;
  v = q / A;
  (inlet.h_out, outlet.h_out) = spatialDistribution(inStream(inlet.h_out), inStream(outlet.h_out), x / L, v >= 0, {0.0, 1.0}, {h_ini_in, h_ini_out});

  //
  // inStream() + Vector doesn't work in the spatialDistirbution function. For this reason it is necessary to use the for loop and
  // to assign the value of the inStream() function to the inStreamIn\Out variables.
  //
  for i in 1:fluidIn.nXi loop
    inStreamIn[i] = inStream(inlet.Xi[i]);
    inStreamOut[i] = inStream(outlet.Xi[i]);
    (inlet.Xi[i], outlet.Xi[i]) = spatialDistribution(inStream(inlet.Xi[i]), inStream(outlet.Xi[i]), x / L, v >= 0, {0.0, 1.0}, {Xi_ini_in[i], Xi_ini_out[i]});
  end for;

end PlugFlowCore;
