within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model IdealMassFlowSourceTest
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank sink annotation (Placement(visible=true,
        transformation(
        origin={30,20},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource source(mflownom=5) annotation (
      Placement(visible=true, transformation(
        origin={-30,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(source.outlet, sink.inlet)
    annotation (Line(points={{-19.8,0},{30,0},{30,10}}, color={168,168,168}));
end IdealMassFlowSourceTest;
