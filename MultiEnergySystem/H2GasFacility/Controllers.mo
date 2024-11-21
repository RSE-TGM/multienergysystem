within MultiEnergySystem.H2GasFacility;
package Controllers
  "Package containing simple controls ready to be implemented"
  extends Modelica.Icons.Package;
  model Valve_controller
    "Proportional controller for the REMI station valve"
    parameter Real P_rng = 0.065e5 "Tunable parameter to get the right valve opening";
    parameter Real P_max = 5.0e5 "Maximum pressure of the network";
    Real ACT_comp(start=1) "Computed valve actuation";

    Modelica.Blocks.Interfaces.RealInput P_meas
      annotation (Placement(transformation(extent={{-128,-20},{-88,20}})));
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
end Controllers;
