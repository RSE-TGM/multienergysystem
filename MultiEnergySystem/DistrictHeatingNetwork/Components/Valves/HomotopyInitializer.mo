within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves;
model HomotopyInitializer
  extends DistrictHeatingNetwork.Icons.Water.SourceP;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid
    "Fluid model" annotation(choicesAllMatching = true);
  parameter Types.Pressure p_start "Initial value of pressure";
  parameter Types.Temperature T_start "Initial value of temperature";
  outer System system "System object";
  Types.SpecificEnthalpy h_start "Specific Enthalpy start value";
  Medium refFluid(
      p_start = p_start,
      T_start = T_start);
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet(m_flow(min = 0)) annotation (
    Placement(visible = true, transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet(m_flow(max = 0)) annotation (
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 1.9984e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  inlet.p = outlet.p;
  inlet.m_flow + outlet.m_flow = 0;
  h_start = refFluid.h;
  inlet.h_out = h_start;
  outlet.h_out = homotopy(inStream(inlet.h_out), h_start);

  //Fluid model equations
  refFluid.p = p_start;
  refFluid.T = T_start;

end HomotopyInitializer;
