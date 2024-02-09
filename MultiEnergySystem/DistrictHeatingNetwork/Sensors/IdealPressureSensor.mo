within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealPressureSensor
  "Ideal Mass Flow Sensor"
  extends MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialIdealFlowSensor;
  Modelica.Blocks.Interfaces.RealOutput p annotation (Placement(
      visible=true,
      transformation(
        origin={0,72},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={70,60},
        extent={{-10,-10},{10,10}},
        rotation= 0)));
equation
  p = inlet.p;
annotation (
    Icon(graphics={  Text(origin = {2, 60}, textColor = {140, 56, 54}, extent = {{-20, 24}, {20, -24}}, textString = "P")}));
end IdealPressureSensor;
