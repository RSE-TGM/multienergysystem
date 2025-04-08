within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall;
model MetalWallFV
  extends DistrictHeatingNetwork.Icons.Generic.MetalWall;
  constant Real pi=Modelica.Constants.pi;
  parameter Integer Nw = 1
  "Number of volumes on the wall ports";
  parameter Types.Mass M "Mass of the metal wall";
  parameter Modelica.Units.SI.SpecificHeatCapacity cm "Specific heat capacity of metal wall";
  parameter Modelica.Units.SI.HeatCapacity Cm=M*cm "Heat capacity of the metal wall";
  parameter Boolean WallRes=false "Wall thermal resistance accounted for";
  parameter Modelica.Units.SI.ThermalConductance UA_ext=0 "Equivalent thermal conductance of outer half-wall" annotation (Dialog(enable=WallRes));
  parameter Modelica.Units.SI.ThermalConductance UA_int=UA_ext "Equivalent thermal conductance of inner half-wall" annotation (Dialog(enable=WallRes));
  parameter Types.Temperature Tstartbar "Average temperature" annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tstart1 "Temperature start value - first volume" annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature TstartN "Temperature start value - last volume" annotation (Dialog(tab="Initialisation"));
  parameter Types.Temperature Tvolstart[Nw]= Utilities.linspaceExt(Tstart1,TstartN, Nw)
    "Temperature start value for all volumes" annotation (Dialog(tab="Initialisation"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(tab="Initialisation"));

  outer MultiEnergySystem.System system "System wide properties";
  Types.Temperature Tvol[Nw](start=Tvolstart) "Volume temperatures";
  DistrictHeatingNetwork.Interfaces.MultiHeatPort int(final n=Nw, T(start=Tvolstart)) "Internal surface" annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=0)));
  DistrictHeatingNetwork.Interfaces.MultiHeatPort ext(final n=Nw, T(start=Tvolstart)) "External surface" annotation (Placement(transformation(extent={{-40,-42},{40,-20}}, rotation=0)));
equation
  (Cm/Nw)*der(Tvol) = int.Q_flow + ext.Q_flow "Energy balance";
  if WallRes then
    assert(UA_int > 0 and UA_ext > 0, "Assign positive values to UA_int, UA_ext");
    ext.Q_flow = (ext.T-Tvol)*UA_ext/Nw;
    int.Q_flow = (int.T-Tvol)*UA_int/Nw;
  else
    // No temperature gradients across the thickness
    ext.T = Tvol;
    int.T = Tvol;
  end if;
initial equation
  if initOpt == DistrictHeatingNetwork.Choices.Init.Options.noInit then
    // do nothing
  elseif initOpt == DistrictHeatingNetwork.Choices.Init.Options.fixedState then
    Tvol = Tvolstart;
  elseif initOpt == DistrictHeatingNetwork.Choices.Init.Options.steadyState then
    der(Tvol) = zeros(Nw);
  else
    assert(false, "Unsupported initialisation option");
  end if;
  annotation (
    Icon(graphics={
        Text(
          extent={{-100,60},{-40,20}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Forward,
          textString="Int"),
        Text(
          extent={{-100,-20},{-40,-60}},
          lineColor={0,0,0},
          fillColor={128,128,128},
          fillPattern=FillPattern.Forward,
          textString="Ext"),
        Text(
          extent={{-138,-60},{142,-100}},
          lineColor={191,95,0},
          textString="%name")}),
    Documentation(info = "<html>
<p>Finite volumes 1D model of a generic wall for 1D heat exchangers.</p>
<p>The heat capacity of the wall is accounted for, and lumped half-way between the inner and outer surfaces.</p>
<p>The thermal resistance of the wall is optionally accounted for by setting WallRes = true; in that case, the total heat conductance of the outer and inner half-layers of the wall must then be set. For a flat (or approximately flat) wall with surface S, thickness d and conductivity lambda, both parameters are equal to 2*S*lambda/d.</p>
<h4>Modelling options</h4>
<p>The following options are available: </p>
<ul>
<li><code>WallRes = false</code>: the thermal resistance of the wall is neglected. </li>
<li><code>WallRes = true</code>: the thermal resistance of the wall is accounted for. </li>
</ul>
</html>"),
    Diagram(graphics));
end MetalWallFV;
