within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PowerTransferTest "3 tests using Ideal Power Transfer component"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psink1 annotation (Placement(visible=true,
        transformation(
        origin={50,32},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msource1 annotation (Placement(
        visible=true, transformation(
        origin={-90,12},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt1 annotation (Placement(
        visible=true, transformation(extent={{-30,2},{-10,22}},   rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psink2 annotation (Placement(visible=true,
        transformation(
        origin={50,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt2 annotation (Placement(
        visible=true, transformation(
        origin={-20,-28},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msource2 annotation (Placement(
        visible=true, transformation(
        origin={-90,-28},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens1 annotation (Placement(
        visible=true, transformation(
        origin={20,14},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens2 annotation (
    Placement(visible = true, transformation(origin={20,-26},    extent={{-6,-6},
            {6,6}},                                                                               rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource msink(mflownom=-1) annotation (
      Placement(visible=true, transformation(
        origin={-90,-68},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank psource annotation (Placement(visible=true,
        transformation(
        origin={50,-50},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sensors.IdealTemperatureSensor Tsens3 annotation (Placement(
        visible=true, transformation(
        origin={20,-66},
        extent={{6,-6},{-6,6}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PowerTransfer Pt3 annotation (Placement(
        visible=true, transformation(
        origin={-20,-68},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  Modelica.Blocks.Sources.RealExpression Ptransfer1(y=4186*5)  annotation (Placement(transformation(extent={{-48,24},
            {-32,40}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer2(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-16},
            {-32,0}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer3(y=-4186*5)  annotation (Placement(transformation(extent={{-48,-56},
            {-32,-40}})));
  Components.BaseClass.PowerTransfer                                          Pt4(pin_start=
       200000)                                                                    annotation (Placement(
        visible=true, transformation(
        origin={-20,-100},
        extent={{10,10},{-10,-10}},
        rotation=180)));
  Sources.SourceMassFlow sourceMassFlow(
    p0=200000,
    T0(displayUnit="K") = 36.7 + 273.15,
    m_flow0=9)
    annotation (Placement(transformation(extent={{-69,-110},{-49,-90}})));
  Sources.SinkPressure sinkPressure(p0=200000, T0(displayUnit="K") = 36 +
      273.15)
    annotation (Placement(transformation(extent={{11,-110},{31,-90}})));
  Modelica.Blocks.Sources.RealExpression Ptransfer4(y=-327159.72)
                                                                annotation (Placement(transformation(extent={{-47,-93},
            {-31,-77}})));
equation
  connect(Pt1.outlet, Tsens1.inlet)
    annotation (Line(points={{-10,12},{4,12},{4,11.6},{16.4,11.6}},
                                              color={168,168,168}));
  connect(Pt2.outlet, Tsens2.inlet)
    annotation (Line(points={{-10,-28},{4,-28},{4,-28.4},{16.4,-28.4}},
                                                  color={168,168,168}));
  connect(Ptransfer1.y, Pt1.Ptransfer)
    annotation (Line(points={{-31.2,32},{-20,32},{-20,20}},color={0,0,127}));
  connect(Ptransfer2.y, Pt2.Ptransfer) annotation (Line(points={{-31.2,-8},{-20,
          -8},{-20,-20}},  color={0,0,127}));
  connect(Tsens2.outlet, psink2.inlet) annotation (Line(points={{23.6,-28.4},{
          50,-28.4},{50,-20}},
                     color={168,168,168}));
  connect(Tsens1.outlet, psink1.inlet)
    annotation (Line(points={{23.6,11.6},{50,11.6},{50,22}},
                                                     color={168,168,168}));
  connect(msource1.outlet, Pt1.inlet)
    annotation (Line(points={{-79.8,12},{-30,12}},
                                                 color={168,168,168}));
  connect(msource2.outlet, Pt2.inlet)
    annotation (Line(points={{-79.8,-28},{-30,-28}}, color={168,168,168}));
  connect(msink.outlet, Pt3.outlet)
    annotation (Line(points={{-79.8,-68},{-30,-68}}, color={168,168,168}));
  connect(Ptransfer3.y, Pt3.Ptransfer) annotation (Line(points={{-31.2,-48},{
          -20,-48},{-20,-60}},
                           color={0,0,127}));
  connect(Tsens3.inlet, psource.inlet) annotation (Line(points={{23.6,-68.4},{
          50,-68.4},{50,-60}},
                     color={168,168,168}));
  connect(Tsens3.outlet, Pt3.inlet)
    annotation (Line(points={{16.4,-68.4},{4,-68.4},{4,-68},{-10,-68}},
                                                  color={168,168,168}));
  connect(Ptransfer4.y, Pt4.Ptransfer) annotation (Line(points={{-30.2,-85},{
          -20,-85},{-20,-92}}, color={0,0,127}));
  connect(sourceMassFlow.outlet, Pt4.inlet) annotation (Line(
      points={{-49,-100},{-30,-100}},
      color={140,56,54},
      thickness=0.5));
  connect(Pt4.outlet, sinkPressure.inlet) annotation (Line(
      points={{-10,-100},{11,-100}},
      color={140,56,54},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(extent={{-140,40},{100,-120}}, grid={1,1})), Icon(
        coordinateSystem(extent={{-140,40},{100,-120}}, grid={1,1})));
end PowerTransferTest;
