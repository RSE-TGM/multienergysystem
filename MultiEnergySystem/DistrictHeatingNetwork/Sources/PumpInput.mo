within MultiEnergySystem.DistrictHeatingNetwork.Sources;
model PumpInput
  extends Modelica.Blocks.Interfaces.SignalSource;
    parameter Boolean useOmega = true;
    parameter Real omega[:,:] = [0, 2*3.141592654*50];
    parameter Real q_m3h[:,:] = [0, 4];

  Modelica.Blocks.Sources.TimeTable pump_omega(table=omega)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.TimeTable pump_q_m3h(table=q_m3h)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Logical.Switch switch
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.BooleanExpression selectInput(y=useOmega)
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
equation
  connect(selectInput.y, switch.u2)
    annotation (Line(points={{-7,0},{18,0}}, color={255,0,255}));
  connect(pump_omega.y, switch.u1)
    annotation (Line(points={{-39,50},{0,50},{0,8},{18,8}}, color={0,0,127}));
  connect(pump_q_m3h.y, switch.u3) annotation (Line(points={{-39,-50},{0,-50},{0,
          -8},{18,-8}}, color={0,0,127}));
  connect(switch.y, y)
    annotation (Line(points={{41,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
        Polygon(
          points={{90,-70},{68,-62},{68,-78},{90,-70}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-48,70},{2,-50}},
          lineColor={255,255,255},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},{52,
              -20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PumpInput;
