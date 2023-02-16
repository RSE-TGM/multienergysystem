within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PowerTransferTest "3 tests using Ideal Power Transfer component"
  extends Modelica.Icons.Example;
  DHN4Control.Components.ExpansionTank psink1 annotation (Placement(visible=
          true, transformation(
        origin={50,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource msource1 annotation (Placement(
        visible=true, transformation(
        origin={-90,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.BaseClass.PowerTransfer Pt1 annotation (Placement(
        visible=true, transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
  DHN4Control.Components.ExpansionTank psink2 annotation (Placement(visible=true,
        transformation(
        origin={50,-22},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.BaseClass.PowerTransfer Pt2 annotation (Placement(
        visible=true, transformation(
        origin={-20,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sources.IdealMassFlowSource msource2 annotation (Placement(
        visible=true, transformation(
        origin={-90,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor Tsens1 annotation (Placement(
        visible=true, transformation(
        origin={20,0},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor Tsens2 annotation (
    Placement(visible = true, transformation(origin={20,-40},    extent={{-6,-6},
            {6,6}},                                                                               rotation = 0)));
  DHN4Control.Sources.IdealMassFlowSource msink(mflownom=-1) annotation (
      Placement(visible=true, transformation(
        origin={-90,-80},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Components.ExpansionTank psource annotation (Placement(visible=true,
        transformation(
        origin={50,-62},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  DHN4Control.Sensors.IdealTemperatureSensor Tsens3 annotation (Placement(
        visible=true, transformation(
        origin={20,-80},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  DHN4Control.Components.BaseClass.PowerTransfer Pt3 annotation (Placement(
        visible=true, transformation(
        origin={-20,-80},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Sources.RealExpression Ptransfer1(y=4186*5)  annotation (Placement(transformation(extent={{-48,12},
            {-32,28}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer2(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-28},
            {-32,-12}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer3(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-68},
            {-32,-52}})));
equation
  connect(Pt1.outlet, Tsens1.inlet)
    annotation (Line(points={{-10,0},{14,0}}, color={168,168,168}));
  connect(Pt2.outlet, Tsens2.inlet)
    annotation (Line(points={{-10,-40},{14,-40}}, color={168,168,168}));
  connect(Ptransfer1.y, Pt1.Ptransfer)
    annotation (Line(points={{-31.2,20},{-20,20},{-20,8}}, color={0,0,127}));
  connect(Ptransfer2.y, Pt2.Ptransfer) annotation (Line(points={{-31.2,-20},{-20,
          -20},{-20,-32}}, color={0,0,127}));
  connect(Tsens2.outlet, psink2.inlet) annotation (Line(points={{26,-40},{50,-40},
          {50,-32}}, color={168,168,168}));
  connect(Tsens1.outlet, psink1.inlet)
    annotation (Line(points={{26,0},{50,0},{50,10}}, color={168,168,168}));
  connect(msource1.outlet, Pt1.inlet)
    annotation (Line(points={{-79.8,0},{-30,0}}, color={168,168,168}));
  connect(msource2.outlet, Pt2.inlet)
    annotation (Line(points={{-79.8,-40},{-30,-40}}, color={168,168,168}));
  connect(msink.outlet, Pt3.outlet)
    annotation (Line(points={{-79.8,-80},{-30,-80}}, color={168,168,168}));
  connect(Ptransfer3.y, Pt3.Ptransfer) annotation (Line(points={{-31.2,-60},{-20,
          -60},{-20,-72}}, color={0,0,127}));
  connect(Tsens3.inlet, psource.inlet) annotation (Line(points={{26,-80},{50,-80},
          {50,-72}}, color={168,168,168}));
  connect(Tsens3.outlet, Pt3.inlet)
    annotation (Line(points={{14,-80},{-10,-80}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, 40}, {100, -120}})));
end PowerTransferTest;
