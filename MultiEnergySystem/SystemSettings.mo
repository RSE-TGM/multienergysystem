within MultiEnergySystem;
model SystemSettings
  // Assumptions
  // Default media
  replaceable model Water = MultiEnergySystem.DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby MultiEnergySystem.DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance "Default water medium model" annotation(choicesAllMatching = true,Dialog(group="Standard conditions"));
  parameter Boolean allowFlowReversal=true "= false to restrict to design flow direction"  annotation (Evaluate=true,  Dialog(group="Simulation options"));
  parameter DistrictHeatingNetwork.Types.Density rho_nom = 995 "Nominal water density" annotation (Dialog(group="Standard conditions"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt=DistrictHeatingNetwork.Choices.Init.Options.steadyState  annotation (Dialog(group="Simulation options"));
  parameter DistrictHeatingNetwork.Types.Pressure p_amb = 101325 "Ambient pressure" annotation(Dialog(group="Ambient conditions"));
  parameter DistrictHeatingNetwork.Types.Temperature T_amb = 294.15 "Ambient Temperature (dry bulb)" annotation(Dialog(group="Ambient conditions"));
  parameter DistrictHeatingNetwork.Types.Temperature T_wb = 288.15 "Ambient temperature (wet bulb)" annotation(Dialog(group="Ambient conditions"));
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    missingInnerMessage="The System object is missing, please drag it on the top layer of your model",
    Icon(graphics={Polygon(
          points={{-100,100},{100,100},{100,-100},{-100,-100},{-100,100}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-80,40},{80,-40}},
          lineColor={0,0,255},
          textString="settings")}));

end SystemSettings;
