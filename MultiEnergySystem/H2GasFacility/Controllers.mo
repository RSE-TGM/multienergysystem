within MultiEnergySystem.H2GasFacility;
package Controllers
  "Package containing simple controls ready to be implemented"
  extends DistrictHeatingNetwork.Icons.Generic.Control;
  model Valve_controller
    "Proportional controller for the REMI station valve"
    parameter Real P_rng = (6-2.5)*10^5 "Tunable parameter to get the right valve opening";
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

  block MultiplMax "Pass through the signal with the largest absolute value."

  Real u[7] = {u1, u2, u3, u4, u5, u6, u7};
  Integer maxIndex;

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
  algorithm
    maxIndex := 1;
    for i in 2:7 loop
      if abs(u[i]) > abs(u[maxIndex]) then
        maxIndex := i;
      end if;
    end for;
    y := u[maxIndex];
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
        Placement(visible = true, transformation(origin={-130,40},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                       rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
          Placement(visible = true, transformation(origin={-130,-32},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,-40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                           rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
          Placement(visible = true, transformation(origin={118,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(visible = true, transformation(origin={-92,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    Modelica.Blocks.Math.Add3 add_PID
      annotation (Placement(transformation(extent={{24,30},{44,50}})));
    Modelica.Blocks.Math.Add add_AW_Integer(k2=-1)
      annotation (Placement(transformation(extent={{-38,-2},{-28,8}})));
    Modelica.Blocks.Math.Add add_AW(k1=-1) annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=270,
          origin={67,7})));
  equation
    connect(REF, feedback.u1) annotation (
          Line(points={{-130,40},{-100,40}},     color = {0, 0, 127}));
    connect(FeedBack, feedback.u2) annotation (
          Line(points={{-130,-32},{-92,-32},{-92,32}},        color = {0, 0, 127}));
    connect(limiter.y, controlAction) annotation (
          Line(points={{81,40},{118,40}},      color = {0, 0, 127}));
    connect(add_PID.y, limiter.u)
      annotation (Line(points={{45,40},{58,40}}, color={0,0,127}));
    connect(gain.y, add_PID.u2)
      annotation (Line(points={{1,40},{22,40}}, color={0,0,127}));
    connect(derivative.y, add_PID.u1) annotation (Line(points={{-1,100},{14,100},
            {14,48},{22,48}}, color={0,0,127}));
    connect(add_AW_Integer.y, firstOrder.u)
      annotation (Line(points={{-27.5,3},{-27.5,4},{-22,4}}, color={0,0,127}));
    connect(add_AW.u2, add_PID.y) annotation (Line(points={{64,13},{64,20},{52,
            20},{52,40},{45,40}}, color={0,0,127}));
    connect(add_AW.u1, limiter.y) annotation (Line(points={{70,13},{72,13},{72,
            20},{90,20},{90,40},{81,40}}, color={0,0,127}));
    connect(add_AW.y, add_AW_Integer.u2) annotation (Line(points={{67,1.5},{67,
            -24},{-44,-24},{-44,0},{-39,0}}, color={0,0,127}));
    connect(firstOrder.y, add_PID.u3) annotation (Line(points={{1,4},{16,4},{16,
            32},{22,32}}, color={0,0,127}));
    connect(feedback.y, gain.u)
      annotation (Line(points={{-83,40},{-22,40}}, color={0,0,127}));
    connect(add_AW_Integer.u1, feedback.y) annotation (Line(points={{-39,6},{
            -56,6},{-56,40},{-83,40}}, color={0,0,127}));
    connect(derivative.u, feedback.y) annotation (Line(points={{-24,100},{-42,
            100},{-42,102},{-54,102},{-54,40},{-83,40}}, color={0,0,127}));
    annotation (
        Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-100,100},{100,-100}},
            textColor={0,0,0},
            textString="PID
AW")}), Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
  end AWPIDContinuous;

  model AWPID_error_in "AWPID with error (ref-meas) as input"

    parameter Real Kp = 1 "Proportional gain";
    parameter Real Kd = 0 "Derivative gain";
    parameter Real Ki = 0 "Integer gain";
    parameter Real Ti = 1 "Integral Time";
    parameter Real Td = 1 "Derivative Time";
    parameter Real Umax = 1 "Maximum control action";
    parameter Real Umin = 0 "Minimum control action";
    parameter Real y_start = 1 "Nominal output";
    Modelica.Blocks.Interfaces.RealInput error annotation (Placement(
        visible=true,
        transformation(
          origin={-110,40},
          extent={{-20,-20},{20,20}},
          rotation=0),
        iconTransformation(
          origin={-80,40},
          extent={{-20,-20},{20,20}},
          rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
          Placement(visible = true, transformation(origin={118,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
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
    connect(limiter.y, controlAction) annotation (
          Line(points={{81,40},{118,40}},      color = {0, 0, 127}));
    connect(add3_1.y, limiter.u)
      annotation (Line(points={{45,40},{58,40}},         color={0,0,127}));
    connect(gain.y, add3_1.u2) annotation (Line(points={{1,40},{22,40}},
                    color={0,0,127}));
    connect(derivative.y, add3_1.u1) annotation (Line(points={{-1,100},{14,100},
            {14,48},{22,48}},
                         color={0,0,127}));
    connect(add.y, firstOrder.u)
      annotation (Line(points={{-27.5,3},{-27.5,4},{-22,4}}, color={0,0,127}));
    connect(add1.u2, add3_1.y) annotation (Line(points={{64,13},{64,20},{52,20},
            {52,40},{45,40}}, color={0,0,127}));
    connect(add1.u1, limiter.y) annotation (Line(points={{70,13},{72,13},{72,20},
            {90,20},{90,40},{81,40}}, color={0,0,127}));
    connect(add1.y, add.u2) annotation (Line(points={{67,1.5},{67,-24},{-44,-24},
            {-44,0},{-39,0}}, color={0,0,127}));
    connect(firstOrder.y, add3_1.u3) annotation (Line(points={{1,4},{16,4},{16,
            32},{22,32}}, color={0,0,127}));
    connect(error, gain.u)
      annotation (Line(points={{-110,40},{-22,40}}, color={0,0,127}));
    connect(add.u1, error) annotation (Line(points={{-39,6},{-46,6},{-46,40},{
            -110,40}}, color={0,0,127}));
    connect(derivative.u, error) annotation (Line(points={{-24,100},{-46,100},{
            -46,40},{-110,40}}, color={0,0,127}));
    annotation (
        Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-100,100},{100,-100}},
            textColor={0,0,0},
            textString="PID
AW")}), Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
  end AWPID_error_in;

  block deadzone
    "Dead-zone filter: passes P_ref inside band, outputs error outside band"

    // === Connectors ===
    Modelica.Blocks.Interfaces.RealInput P_meas
      "Measured outlet pressure [bar]"
      annotation (Placement(transformation(extent={{-110,-50},{-90,-30}}),
          iconTransformation(extent={{-110,-50},{-90,-30}})));

    Modelica.Blocks.Interfaces.RealInput P_ref
      "Reference pressure setpoint [bar]"
      annotation (Placement(transformation(extent={{-108,10},{-88,30}}),
          iconTransformation(extent={{-108,10},{-88,30}})));

    Modelica.Blocks.Interfaces.RealOutput P_filtered
      "Filtered (band-limited) output signal"
      annotation (Placement(transformation(extent={{92,-10},{112,10}}),
          iconTransformation(extent={{92,-10},{112,10}})));

    // === Parameters ===
    parameter Real L = 4 "Lower pressure limit [bar]"
    annotation (Dialog(group="Dead zone limits"));
    parameter Real U = 5 "Upper pressure limit [bar]"
    annotation (Dialog(group="Dead zone limits"));

  equation
    // Core logic
    if (P_meas >= L) and (P_meas <= U) then
      // Inside zone: output reference directly
      P_filtered = P_ref;
    else
      // Outside zone: output error
      P_filtered = P_ref - P_meas;
    end if;

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={
          Rectangle(extent={{-100,60},{100,-60}}, lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Text(extent={{-90,8},{90,-32}},
            textColor={0,0,0},
            textString="DeadZone
"),       Text(
            extent={{-116,46},{-80,34}},
            textColor={0,0,0},
            textString="P_ref"),
          Text(
            extent={{-116,-16},{-80,-28}},
            textColor={0,0,0},
            textString="P_meas"),
          Text(
            extent={{84,24},{120,12}},
            textColor={0,0,0},
            textString="P_filtered")}),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="
<p><b>Function:</b> Dead-zone pressure filter.</p>
<ul>
<li>If measured pressure is within [L, U], the block passes the reference signal unchanged (<code>P_filtered = P_ref</code>).</li>
<li>If measured pressure is outside the band, it outputs the signed error (<code>P_ref − P_meas</code>).</li>
</ul>
"));
  end deadzone;

  model AWPID_deadzone
    parameter Real Kp = 1 "Proportional gain";
    parameter Real Kd = 0 "Derivative gain";
    parameter Real Ki = 0 "Integer gain";
    parameter Real Ti = 1 "Integral Time";
    parameter Real Td = 1 "Derivative Time";
    parameter Real Umax = 1 "Maximum control action";
    parameter Real Umin = 0 "Minimum control action";
    parameter Real y_start = 1 "Nominal output";
    Modelica.Blocks.Interfaces.RealInput REF annotation (
        Placement(visible = true, transformation(origin={-128,100},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-100,40},   extent={{-20,-20},
              {20,20}},                                                                                                                                                                       rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
          Placement(visible = true, transformation(origin={-130,-80},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-100,-40},   extent={{-20,-20},
              {20,20}},                                                                                                                                                                           rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
          Placement(visible = true, transformation(origin={128,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(visible = true, transformation(origin={-92,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = Kp)  annotation (
          Placement(visible = true, transformation(origin={12,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Umax, uMin = Umin)  annotation (
          Placement(visible = true, transformation(origin={92,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti,
    initType=Modelica.Blocks.Types.Init.SteadyState,
      k=Ki,
      y_start=y_start)                                                                                                          annotation (
          Placement(visible = true, transformation(                    extent={{10,-10},
              {-10,10}},                                                                                rotation = 180,
          origin={22,-36})));
    Modelica.Blocks.Continuous.Derivative derivative(k=Kd,
                                                     T=Td)
      annotation (Placement(transformation(extent={{0,26},{20,46}})));
    Modelica.Blocks.Math.Add3 add3_1
      annotation (Placement(transformation(extent={{46,-10},{66,10}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-8,-42},{2,-32}})));
    Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(
          extent={{-5,-5},{5,5}},
          rotation=270,
          origin={89,-33})));
    deadzone deadzone1(L=4.7*10^5, U=5.1*10^5)
                                   annotation (Placement(transformation(
          extent={{-16,-14},{16,14}},
          rotation=90,
          origin={-92,-32})));
  equation
    connect(REF, feedback.u1) annotation (
          Line(points={{-128,100},{-110,100},{-110,0},{-100,0}},
                                                 color = {0, 0, 127}));
    connect(feedback.y, gain.u) annotation (
          Line(points={{-83,0},{0,0}},          color = {0, 0, 127}));
    connect(limiter.y, controlAction) annotation (
          Line(points={{103,0},{128,0}},       color = {0, 0, 127}));
    connect(feedback.y, derivative.u) annotation (Line(points={{-83,0},{-12,0},{-12,
            36},{-2,36}},                        color={0,0,127}));
    connect(add3_1.y, limiter.u)
      annotation (Line(points={{67,0},{80,0}},           color={0,0,127}));
    connect(gain.y, add3_1.u2) annotation (Line(points={{23,0},{44,0}},
                    color={0,0,127}));
    connect(derivative.y, add3_1.u1) annotation (Line(points={{21,36},{36,36},{36,
            8},{44,8}},  color={0,0,127}));
    connect(add.y, firstOrder.u)
      annotation (Line(points={{2.5,-37},{2.5,-36},{10,-36}},color={0,0,127}));
    connect(add.u1, feedback.y) annotation (Line(points={{-9,-34},{-12,-34},{-12,0},
            {-83,0}},      color={0,0,127}));
    connect(add1.u2, add3_1.y) annotation (Line(points={{86,-27},{86,-20},{74,-20},
            {74,0},{67,0}},   color={0,0,127}));
    connect(add1.u1, limiter.y) annotation (Line(points={{92,-27},{94,-27},{94,-20},
            {112,-20},{112,0},{103,0}},
                                      color={0,0,127}));
    connect(add1.y, add.u2) annotation (Line(points={{89,-38.5},{89,-64},{-12,-64},
            {-12,-40},{-9,-40}},
                              color={0,0,127}));
    connect(firstOrder.y, add3_1.u3) annotation (Line(points={{33,-36},{38,-36},{38,
            -8},{44,-8}}, color={0,0,127}));
    connect(controlAction, controlAction)
      annotation (Line(points={{128,0},{128,0}}, color={0,0,127}));
    connect(deadzone1.P_filtered, feedback.u2)
      annotation (Line(points={{-92,-15.68},{-92,-8}}, color={0,0,127}));
    connect(FeedBack, deadzone1.P_meas) annotation (Line(points={{-130,-80},{-84,-80},
            {-84,-48},{-86.4,-48}}, color={0,0,127}));
    connect(deadzone1.P_ref, REF) annotation (Line(points={{-94.8,-47.68},{-94.8,-56},
            {-128,-56},{-128,100}}, color={0,0,127}));
    annotation (
        Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-100,100},{100,-100}},
            textColor={0,0,0},
            textString="PID DZ")}),
        Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
  end AWPID_deadzone;

  model PID

    parameter Real Kp = 1 "Proportional gain";
    parameter Real Kd = 0 "Derivative gain";
    parameter Real Ki = 0 "Integer gain";
    parameter Real Ti = 1 "Integral Time";
    parameter Real Td = 1 "Derivative Time";
    //parameter Real Umax = 1 "Maximum control action";
    //parameter Real Umin = 0 "Minimum control action";
    parameter Real y_start = 1 "Nominal output";
    Modelica.Blocks.Interfaces.RealInput REF annotation (
        Placement(visible = true, transformation(origin={-130,40},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                       rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput FeedBack annotation (
          Placement(visible = true, transformation(origin={-130,-32},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-80,-40},    extent={{-20,-20},
              {20,20}},                                                                                                                                                                           rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput controlAction annotation (
          Placement(visible = true, transformation(origin={118,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,0},   extent={{-10,-10},{10,10}},      rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation (
          Placement(visible = true, transformation(origin={-92,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = Kp)  annotation (
          Placement(visible = true, transformation(origin={-10,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Ti,
    initType=Modelica.Blocks.Types.Init.SteadyState,
      k=Ki,
      y_start=y_start)                                                                                                          annotation (
          Placement(visible = true, transformation(origin={-10,4},     extent={{10,-10},
              {-10,10}},                                                                                rotation = 180)));
    Modelica.Blocks.Continuous.Derivative derivative(k=Kd,
                                                     T=Td)
      annotation (Placement(transformation(extent={{-22,90},{-2,110}})));
    Modelica.Blocks.Math.Add3 add_PID
      annotation (Placement(transformation(extent={{24,30},{44,50}})));
    Modelica.Blocks.Math.Gain feedback_correction(k=1)  annotation (Placement(
          visible=true, transformation(
          origin={-65,41},
          extent={{-5,-5},{5,5}},
          rotation=0)));
  equation
    connect(REF, feedback.u1) annotation (
          Line(points={{-130,40},{-100,40}},     color = {0, 0, 127}));
    connect(FeedBack, feedback.u2) annotation (
          Line(points={{-130,-32},{-92,-32},{-92,32}},        color = {0, 0, 127}));
    connect(gain.y, add_PID.u2)
      annotation (Line(points={{1,40},{22,40}}, color={0,0,127}));
    connect(derivative.y, add_PID.u1) annotation (Line(points={{-1,100},{14,100},{
            14,48},{22,48}}, color={0,0,127}));
    connect(firstOrder.y, add_PID.u3)
      annotation (Line(points={{1,4},{16,4},{16,32},{22,32}}, color={0,0,127}));
    connect(feedback.y, feedback_correction.u)
      annotation (Line(points={{-83,40},{-82,41},{-71,41}}, color={0,0,127}));
    connect(feedback_correction.y, gain.u) annotation (Line(points={{-59.5,41},{-30,
            41},{-30,40},{-22,40}}, color={0,0,127}));
    connect(derivative.u, feedback_correction.y) annotation (Line(points={{-24,100},
            {-48,100},{-48,41},{-59.5,41}}, color={0,0,127}));
    connect(add_PID.y, controlAction)
      annotation (Line(points={{45,40},{118,40}}, color={0,0,127}));
    connect(firstOrder.u, feedback_correction.y) annotation (Line(points={{-22,4},
            {-38,4},{-38,2},{-48,2},{-48,41},{-59.5,41}}, color={0,0,127}));
    annotation (
        Icon(graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-100,100},{100,-100}}),    Text(extent={{-54,62},
                {72,-66}},
            textColor={0,0,0},
            textString="PID")}),
        Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
  end PID;
end Controllers;
