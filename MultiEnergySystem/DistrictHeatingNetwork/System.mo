within MultiEnergySystem.DistrictHeatingNetwork;
model System
  // Assumptions
  parameter Boolean allowFlowReversal=true "= false to restrict to design flow direction (flangeA -> flangeB)" annotation (
      Evaluate=true,
      Dialog(group="Simulation options"));

  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt=DistrictHeatingNetwork.Choices.Init.Options.steadyState
    annotation (Dialog(group="Simulation options"));
  // parameter ThermoPower.Choices.System.Dynamics Dynamics=ThermoPower.Choices.System.Dynamics.DynamicFreeInitial;
  parameter Modelica.Units.SI.Pressure p_amb = 101325 "Ambient pressure"
    annotation(Dialog(group="Ambient conditions"));
  parameter Modelica.Units.SI.Temperature T_amb = 294.15 "Ambient Temperature (dry bulb)"
    annotation(Dialog(group="Ambient conditions"));
  parameter Modelica.Units.SI.Temperature T_wb = 288.15 "Ambient temperature (wet bulb)"
    annotation(Dialog(group="Ambient conditions"));
  //parameter AllamCycle.Types.Fr fnom = 50 "Nominal grid frequency"
    //annotation(Dialog(group="Electrical system defaults"));
  Modelica.Blocks.Sources.RealExpression Amb_T(y=21 + 273.15)
    annotation (Placement(transformation(extent={{-32,18},{-12,38}})));
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="The System object is missing, please drag it on the top layer of your model",
    Icon(graphics={Polygon(
          points={{-100,60},{-60,100},{60,100},{100,60},{100,-60},{60,-100},{-60,
              -100},{-100,-60},{-100,60}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-80,40},{80,-20}},
          lineColor={0,0,255},
          textString="system")}));

end System;
