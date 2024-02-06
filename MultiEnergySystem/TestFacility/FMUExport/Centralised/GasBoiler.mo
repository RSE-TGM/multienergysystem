within MultiEnergySystem.TestFacility.FMUExport.Centralised;
model GasBoiler
  parameter Real q_m3h_S1(unit = "m3/h") = 9.25;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1/3600*985;
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5 - 0.09273e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 60 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*30; 300, 2*3.141592654*30];
  parameter Real FCV101theta[:,:] = [0, 1];

  Plants.Thermal.Systems.GasBoiler S100
    annotation (Placement(transformation(extent={{-32,-32},{32,32}})));
  Modelica.Blocks.Sources.BooleanTable GB101_Status(table={1e6}, startValue=true)
    "Input to decide whether or nor the gas boiler is working"
    annotation (Placement(transformation(extent={{74,-10},{54,10}})));
  inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  DistrictHeatingNetwork.Sources.SourcePressure
                         source(
    use_in_p0=false,
    use_in_T0=false,
    p0=pin_start_S1,
    T0=Tin_start_S1)
    annotation (Placement(transformation(extent={{-40,70},{-20,50}})));
  DistrictHeatingNetwork.Sources.SinkMassFlow
                       sink(
    use_in_m_flow=false,
    pin_start=pout_start_S1,
    p0=pout_start_S1,
    T0=Tout_start_S1,
    m_flow0=m_flow_S1,
    G=0)
    annotation (Placement(transformation(extent={{18,70},{38,50}})));
  Modelica.Blocks.Interfaces.RealInput theta "Opening valve of the valve's system" annotation (
      Placement(transformation(extent={{-106,2},{-66,42}}),  iconTransformation(extent={{-100,30},{-60,
            70}})));
  Modelica.Blocks.Interfaces.RealInput omega "Rotational speed for circulation pump" annotation (
      Placement(transformation(extent={{-106,-28},{-66,12}}), iconTransformation(extent={{-100,-20},
            {-60,20}})));
  Modelica.Blocks.Interfaces.RealInput Tout_SP "Outlet temperature set point" annotation (Placement(
        transformation(extent={{-106,-58},{-66,-18}}), iconTransformation(extent={{-100,-70},{-60,-30}})));
equation
  connect(GB101_Status.y, S100.Status)
    annotation (Line(points={{53,0},{25.6,0}}, color={255,0,255}));
  connect(source.outlet, S100.inlet) annotation (Line(
      points={{-20,60},{-9.6,60},{-9.6,25.6}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, S100.outlet) annotation (Line(
      points={{18,60},{9.6,60},{9.6,25.6}},
      color={140,56,54},
      thickness=0.5));
  connect(theta, S100.theta)
    annotation (Line(points={{-86,22},{-38,22},{-38,16},{-25.6,16}}, color={0,0,127}));
  connect(omega, S100.omega)
    annotation (Line(points={{-86,-8},{-38,-8},{-38,0},{-25.6,0}}, color={0,0,127}));
  connect(Tout_SP, S100.Tout_SP) annotation (Line(points={{-86,-38},{-66,-38},{-66,-40},{-34,-40},{
          -34,-16},{-25.6,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end GasBoiler;
