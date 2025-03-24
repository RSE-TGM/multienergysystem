within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealAbsoluteTemperatureSensorFirstOrderDyn "Get absolute temperature (in Kelvin) of the attached port with a first dynamics time response"
  extends MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialAbsoluteSensor;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  Modelica.Blocks.Interfaces.RealOutput T annotation (
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,130},    extent = {{-10, -10}, {10, 10}}, rotation=90)));
  Types.Temperature T_meas;

  parameter Types.Temperature T_start = 80 + 273.15 "Start value temperature";
  parameter Types.Pressure p_start = 2.5e5 "Start valure pressure";
  parameter Real tau = 2 "First order response time constant";

  Medium fluid(T_start = T_start, p_start = p_start);

equation
  fluid.h = inStream(inlet.h_out);
  fluid.p = inlet.p;
  T = fluid.T;
  // First-order response for electric power
  tau * der(T) + T = T_meas;

initial equation
  der(T) = 0;

annotation (
    Icon(graphics={  Text(origin = {0, 60}, textColor = {140, 56, 54}, extent = {{-20, 20}, {20, -20}}, textString = "T")}));
end IdealAbsoluteTemperatureSensorFirstOrderDyn;
