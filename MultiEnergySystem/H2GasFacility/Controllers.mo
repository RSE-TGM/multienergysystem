within MultiEnergySystem.H2GasFacility;
package Controllers
  "Package containing simple controls ready to be implemented"
  extends DistrictHeatingNetwork.Icons.Generic.Control;
  model Valve_controller
    "Proportional controller for the REMI station valve"
    parameter Real P_rng = (6-4.93)*10^5 "Tunable parameter to get the right valve opening";
    parameter Real P_max = 6.0e5 "Maximum pressure of the network";
    Real ACT_comp(start=1) "Computed valve actuation";

    Modelica.Blocks.Interfaces.RealInput P_meas  annotation (Placement(transformation(extent={{-128,-20},{-88,20}})));
    Modelica.Blocks.Interfaces.RealOutput ACT_x(start=1) annotation (Placement(
          transformation(extent={{92,-22},{136,22}}), iconTransformation(extent={{
              92,-22},{136,22}})));
  equation
    ACT_comp = (P_max - P_meas)/P_rng;

    if ACT_comp >= 1 then
      ACT_x = 1;
    elseif ((0 < ACT_comp) and (ACT_comp < 1)) then
      ACT_x = ACT_comp;
    else
      ACT_x = 0;
    end if;


    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,80},{100,-80}},
            lineColor={0,0,0},
            lineThickness=1,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
                              Text(
            extent={{-80,64},{86,-58}},
            textColor={0,0,0},
            textString="Valve
Controller")}),             Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Valve_controller;

  block MultiplMax "Pass through the largest signal."

    Modelica.Blocks.Interfaces.RealInput
              u1 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,76},{-86,102}}), iconTransformation(extent
            ={{-112,76},{-86,102}})));
    Modelica.Blocks.Interfaces.RealInput
              u2 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,48},{-86,74}}), iconTransformation(extent={
              {-112,48},{-86,74}})));
    Modelica.Blocks.Interfaces.RealOutput
               y "Connector of Real output signal" annotation (Placement(
          transformation(extent={{96,-10},{116,10}})));
    Modelica.Blocks.Interfaces.RealInput
              u3 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,20},{-86,46}}), iconTransformation(extent={
              {-112,20},{-86,46}})));
    Modelica.Blocks.Interfaces.RealInput
              u4 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,-12},{-86,14}}), iconTransformation(extent
            ={{-112,-12},{-86,14}})));
    Modelica.Blocks.Interfaces.RealInput
              u5 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,-40},{-86,-14}}), iconTransformation(
            extent={{-112,-40},{-86,-14}})));
    Modelica.Blocks.Interfaces.RealInput
              u6 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,-70},{-86,-44}}), iconTransformation(
            extent={{-112,-70},{-86,-44}})));
    Modelica.Blocks.Interfaces.RealInput
              u7 "Connector of Real input signal 1" annotation (Placement(
          transformation(extent={{-112,-100},{-86,-74}}), iconTransformation(
            extent={{-112,-100},{-86,-74}})));

  equation
    y = max([u1, u2, u3, u4, u5, u6, u7]);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
  end MultiplMax;

  model AWPIDContinuous

    parameter Real Kp = 1 "Proportional gain";
    parameter Real Kd = 0 "Derivative gain";
    parameter Real Ki = 0 "Integer gain";
    parameter Real Ti = 1 "Integral Time";
    parameter Real Td = 1 "Derivative Time";
    parameter Real Umax = 1 "Maximum control action";
    parameter Real Umin = 0 "Minimum control action";
    parameter Real y_start = 1 "Nominal output";
    Modelica.Blocks.Interfaces.RealInput REF annotation (
        Placement(visible = true, transformation(origin={-110,40},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                       rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
          Placement(visible = true, transformation(origin={-110,-32},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,-40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                           rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
          Placement(visible = true, transformation(origin={118,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(visible = true, transformation(origin={-60,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = Kp)  annotation (
          Placement(visible = true, transformation(origin={-10,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation (
          Placement(visible = true, transformation(origin={70,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti,
    initType=Modelica.Blocks.Types.Init.SteadyState,
      k=Ki,
      y_start=y_start)                                                                                                          annotation (
          Placement(visible = true, transformation(origin={-10,4},     extent={{10,-10},
              {-10,10}},                                                                                rotation = 180)));
    Modelica.Blocks.Continuous.Derivative derivative(k=Kd,
                                                     T=Td)
      annotation (Placement(transformation(extent={{-22,90},{-2,110}})));
    Modelica.Blocks.Math.Add3 add3_1
      annotation (Placement(transformation(extent={{24,30},{44,50}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-38,-2},{-28,8}})));
    Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=270,
          origin={67,7})));
  equation
    connect(REF, feedback.u1) annotation (
          Line(points={{-110,40},{-68,40}},      color = {0, 0, 127}));
    connect(FeedBack, feedback.u2) annotation (
          Line(points={{-110,-32},{-60,-32},{-60,32}},        color = {0, 0, 127}));
    connect(feedback.y, gain.u) annotation (
          Line(points={{-51,40},{-22,40}},      color = {0, 0, 127}));
    connect(limiter.y, controlAction) annotation (
          Line(points={{81,40},{118,40}},      color = {0, 0, 127}));
    connect(feedback.y, derivative.u) annotation (Line(points={{-51,40},{-44,40},
            {-44,100},{-24,100}},                color={0,0,127}));
    connect(add3_1.y, limiter.u)
      annotation (Line(points={{45,40},{58,40}},         color={0,0,127}));
    connect(gain.y, add3_1.u2) annotation (Line(points={{1,40},{22,40}},
                    color={0,0,127}));
    connect(derivative.y, add3_1.u1) annotation (Line(points={{-1,100},{14,100},
            {14,48},{22,48}},
                         color={0,0,127}));
    connect(add.y, firstOrder.u)
      annotation (Line(points={{-27.5,3},{-27.5,4},{-22,4}}, color={0,0,127}));
    connect(add.u1, feedback.y) annotation (Line(points={{-39,6},{-44,6},{-44,
            40},{-51,40}}, color={0,0,127}));
    connect(add1.u2, add3_1.y) annotation (Line(points={{64,13},{64,20},{52,20},
            {52,40},{45,40}}, color={0,0,127}));
    connect(add1.u1, limiter.y) annotation (Line(points={{70,13},{72,13},{72,20},
            {90,20},{90,40},{81,40}}, color={0,0,127}));
    connect(add1.y, add.u2) annotation (Line(points={{67,1.5},{67,-24},{-44,-24},
            {-44,0},{-39,0}}, color={0,0,127}));
    connect(firstOrder.y, add3_1.u3) annotation (Line(points={{1,4},{16,4},{16,
            32},{22,32}}, color={0,0,127}));
    annotation (
        Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-100,100},{100,-100}},
            textColor={0,0,0},
            textString="PID
AW")}), Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
  end AWPIDContinuous;
end Controllers;
