within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealMassFlowSensor
  "Ideal Mass Flow Sensor"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialIdealFlowSensor;
  extends Modelica.Icons.RoundSensor;
  Modelica.Blocks.Interfaces.RealOutput m_flow annotation (Placement(
      visible=true,
      transformation(
        origin={0,72},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,90},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  m_flow = inlet.m_flow;
annotation (
    Icon(graphics={  Line(origin = {-81.5714, -0.142857}, points = {{-10, 0}, {10, 0}}, color = {173, 173, 173}, thickness = 2), Line(origin = {81.4286, -0.428571}, points = {{-10, 0}, {10, 0}}, color = {173, 173, 173}, thickness = 2)}));
end IdealMassFlowSensor;
