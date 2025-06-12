within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedPolimi
  extends CaseCentralisedBase(redeclare DHTF.Control.OpenLoopActuators.FMUActuator_I actuator);
  Modelica.Blocks.Interfaces.RealInput FCV101theta(start=theta_start)   annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-94,-23.5}),
                          iconTransformation(extent={{-110,-20},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealInput P101input annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-94,-16.5}),iconTransformation(extent={{-110,-10},{-100,0}})));
  Modelica.Blocks.Interfaces.RealInput GB101Tout_SP annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-94,-9.5}), iconTransformation(extent={{-110,0},{-100,10}})));
  Modelica.Blocks.Interfaces.BooleanInput GB101status annotation (Placement(transformation(extent={{-5,-5},{5,5}}, origin={-94,-31}), iconTransformation(extent={{-5,-5},{5,5}}, origin={-105,-25})));
equation
  connect(GB101Tout_SP, actuator.GB101Tout_SP) annotation (Line(points={{-94,
          -9.5},{-59,-9.5},{-59,63.2625},{-21.0125,63.2625}},                                                                     color={0,0,127}));
  connect(P101input,actuator.P101input)  annotation (Line(points={{-94,-16.5},{
          -56.5,-16.5},{-56.5,61.2375},{-21.0125,61.2375}},                                                                     color={0,0,127}));
  connect(FCV101theta, actuator.FCV101theta) annotation (Line(points={{-94,
          -23.5},{-54,-23.5},{-54,59.2125},{-21.0125,59.2125}},                                                                 color={0,0,127}));
  connect(GB101status, actuator.GB101_status) annotation (Line(points={{-94,-31},
          {-52.5,-31},{-52.5,57.1875},{-21.0125,57.1875}},                                                                       color={255,0,255}));
end CaseCentralisedPolimi;
