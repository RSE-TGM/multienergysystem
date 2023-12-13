within MultiEnergySystem.DistrictHeatingNetwork.Sensors;
model IdealMassFlowSensor
  "Ideal Mass Flow Sensor"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Sensors.BaseClass.PartialIdealFlowSensor;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquid;
  parameter Types.Temperature T_start = 60 + 273.15;
  parameter Types.Pressure p_start = 2.5e5;
  Medium fluid(T_start = T_start, p_start = p_start);
  Modelica.Blocks.Interfaces.RealOutput m_flow "Mass flowrate in kg/s" annotation (Placement(
      visible=true,
      transformation(
        origin={0,72},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={70,60},
        extent={{-10,-10},{10,10}},
        rotation= 0)));
  Modelica.Blocks.Interfaces.RealOutput q_m3hr "Volumetric flowrate in m3/hr" annotation (Placement(
      visible=true,
      transformation(
        origin={0,56},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,130},
        extent={{-10,-10},{10,10}},
        rotation=90)));
equation
  // Fluid definition
  fluid.h = inStream(inlet.h_out);
  fluid.p = inlet.p;

  m_flow = inlet.m_flow;
  q_m3hr = (m_flow/fluid.rho)*3600;

annotation (
    Icon(graphics={  Text(origin = {0, 60}, textColor = {140, 56, 54}, extent = {{-20, 24}, {20, -24}}, textString = "F"),                               Line(points={{-10,0},
              {10,0}},                                                                                                                                                                       color = {140, 56, 54},
          origin={0,110},
          rotation=90)}));
end IdealMassFlowSensor;
