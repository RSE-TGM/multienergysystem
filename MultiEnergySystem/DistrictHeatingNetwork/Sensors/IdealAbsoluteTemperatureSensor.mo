within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealAbsoluteTemperatureSensor
  "Get absolute pressure of the attached port"
  extends MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialAbsoluteSensor;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp;
  parameter Types.Temperature T_start = 80 + 273.15;
  parameter Types.Pressure p_start = 2.5e5;

  Types.Temperature T_meas;
  Medium fluid(T_start = T_start, p_start = p_start);

  Modelica.Blocks.Interfaces.RealOutput T annotation (
    Placement(visible = true, transformation(origin = {6, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,130},    extent = {{-10, -10}, {10, 10}}, rotation=90)));

equation
  fluid.h = inStream(inlet.h_out);
  fluid.p = inlet.p;
  T = fluid.T;
  T_meas = T;
annotation (
    Icon(graphics={  Text(origin = {0, 60}, textColor = {140, 56, 54}, extent = {{-20, 20}, {20, -20}}, textString = "T")}));
end IdealAbsoluteTemperatureSensor;
