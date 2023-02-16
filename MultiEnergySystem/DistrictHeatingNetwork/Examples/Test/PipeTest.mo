within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PipeTest "Test with 3 differente pipes"
  extends Modelica.Icons.Example;
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource(mflownom=5, Tnom=353.15)
                                                              annotation (
    Placement(visible = true, transformation(origin={-70,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank annotation (
    Placement(visible = true, transformation(origin={70,50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV oneSec(D = 0.0508, L = 50, N = 1, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, h = 10, lambdaIns = 0.04)  annotation (
    Placement(visible = true, transformation(origin={0,40},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySec(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, lambdaIns = 0.04) annotation (
    Placement(visible = true, transformation(                    extent={{-10,-10},
            {10,10}},                                                                             rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank1 annotation (
    Placement(visible = true, transformation(origin={70,10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource1(mflownom=5, Tnom=
       353.15)                                                 annotation (
    Placement(visible = true, transformation(origin={-70,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.pipeFV fiftySecNoTI(D = 0.0508, L = 50, N = 50, T_ext = 298.15, T_start(displayUnit = "degC") = 338.15, dIns = 0.1, dWall = 0.003, lambdaIns = 0.04, thermalInertia = false) annotation (
    Placement(visible = true, transformation(origin={0,-40},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.ExpansionTank expansionTank2 annotation (
    Placement(visible = true, transformation(origin={70,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Sources.IdealMassFlowSource idealMassFlowSource2(mflownom=5, Tnom=
       353.15)                                                 annotation (
    Placement(visible = true, transformation(origin={-70,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(oneSec.outlet, expansionTank.inlet) annotation (
    Line(points={{10,40},{70,40}}));
  connect(fiftySec.outlet, expansionTank1.inlet) annotation (
    Line(points={{10,0},{70,0}}));
  connect(fiftySecNoTI.outlet, expansionTank2.inlet) annotation (
    Line(points={{10,-40},{70,-40}}));
  connect(idealMassFlowSource.outlet, oneSec.inlet)
    annotation (Line(points={{-59.8,40},{-10,40}}, color={168,168,168}));
  connect(idealMassFlowSource1.outlet, fiftySec.inlet)
    annotation (Line(points={{-59.8,0},{-10,0}}, color={168,168,168}));
  connect(idealMassFlowSource2.outlet, fiftySecNoTI.inlet)
    annotation (Line(points={{-59.8,-40},{-10,-40}}, color={168,168,168}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Documentation(
        info="<html>
<p>The tests are the following:</p>
<p>1. The first test corresponds to a pipe with one finite volume only (lumped) and thermal inertia.</p>
<p>2. The second test corresponds to a pipe with 50 finite volumes and thermal inertia.</p>
<p>3. The third test corresponds to a pipe with 50 finite volumes without thermal inertia.</p>
</html>"));
end PipeTest;
