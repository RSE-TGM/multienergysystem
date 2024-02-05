within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model ControlledGasBoiler
  constant Real pi = Modelica.Constants.pi "pi";
  parameter Real Kp = 1e3 "Pump Proportional gain";
  parameter Real Ti = 5  "Pump integral time constant";
  parameter Real omegamin = 2*pi*30;
  parameter Real omegamax = 2*pi*50;
  GasBoiler boiler annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI(Kp=Kp, Ti=Ti,
    Umax=omegamax,
    Umin=omegamin,
    y_start=boiler.m_flow_S1)
    annotation (Placement(transformation(extent={{-48,66},{-28,46}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={18,88},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput theta "Opening valve of the valve's system" annotation (
      Placement(transformation(extent={{-80,30},{-60,50}}),  iconTransformation(extent={{-80,30},{
            -60,50}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_SP "Volumetric flow rate for circulation pump"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}}),  iconTransformation(extent={{-80,-10},
            {-60,10}})));
  Modelica.Blocks.Interfaces.RealInput Tout_SP "Outlet temperature set point" annotation (Placement(
        transformation(extent={{-80,-50},{-60,-30}}),  iconTransformation(extent={{-80,-50},{-60,
            -30}})));
  Modelica.Blocks.Interfaces.BooleanInput Status annotation (Placement(transformation(extent={{100,-20},
            {60,20}}),          iconTransformation(extent={{100,-20},{60,20}})));
equation
  connect(Status, boiler.Status) annotation (Line(points={{80,0},{32,0}}, color={255,0,255}));
  connect(Tout_SP, boiler.Tout_SP)
    annotation (Line(points={{-70,-40},{-48,-40},{-48,-20},{-32,-20}}, color={0,0,127}));
  connect(theta, boiler.theta)
    annotation (Line(points={{-70,40},{-60,40},{-60,20},{-32,20}}, color={0,0,127}));
  connect(boiler.inlet, inlet) annotation (Line(
      points={{-12,32},{-12,76},{-20,76},{-20,90}},
      color={140,56,54},
      thickness=0.5));
  connect(boiler.outlet, outlet) annotation (Line(
      points={{12,32},{12,60},{12,88},{18,88}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow_SP, PI.REF)
    annotation (Line(points={{-70,0},{-56,0},{-56,52},{-46,52}}, color={0,0,127}));
  connect(boiler.m_flow, PI.FeedBack) annotation (Line(points={{32,20},{42,20},{42,72},{-56,72},{-56,
          60},{-46,60}}, color={0,0,127}));
  connect(PI.controlAction, boiler.omega) annotation (Line(points={{-30,56},{-24,56},{-24,40},{-48,40},
          {-48,0},{-32,0}}, color={0,0,127}));
  annotation (Icon(                                             graphics={
                     Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Forward, extent={{-60,80},
              {60,-80}}),                                                                                                                                 Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-40,40},
              {40,-40}}),                                                                                                                                                                                                        Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-40,40},
              {40,-40}}),
                     Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points={{-21,-35},
              {-27,-3},{-21,-13},{-19,25},{-11,13},{1,37},{13,13},{19,25},{23,-15},{27,-5},{23,-35},
              {1,-43},{-21,-35}}),                                                                                                                                                                                                        Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points={{-15,-35},
              {-23,-13},{-15,-17},{-15,3},{-9,-1},{1,25},{9,-1},{15,3},{17,-17},{23,-13},{15,-37},{1,
              -43},{-15,-35}})}));
end ControlledGasBoiler;
