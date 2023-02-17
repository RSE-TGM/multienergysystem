within MultiEnergySystem.DistrictHeatingNetwork.Examples.Test;
model PumpTestBase "Base test model for pumps' tests"
  Components.TurboMachines.Pump pump(
    Tin_start=293.15,
    Tout_start=291.15,
    pin_start=500000,
    pout_start=567600,
    wnom=1.6666,
    phicnom=0.8,
    rhonom(displayUnit="kg/m3") = 997,
    dpnom=66600,
    etamech=1,
    etaelec=1)
    annotation (Placement(transformation(extent={{-16,-20},{18,14}})));
  Components.ExpansionTank expansionTank(p=567600, T=333.15)
    annotation (Placement(transformation(extent={{44,14},{64,34}})));
  Sources.IdealMassFlowSource idealMassFlowSource(mflownom=1.666)
    annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
equation
  connect(pump.outlet, expansionTank.inlet) annotation (Line(points={{10.52,
          10.26},{54,10.26},{54,14}}, color={168,168,168}));
  connect(idealMassFlowSource.outlet, pump.inlet) annotation (Line(points={{
          -45.8,0},{-29.2,0},{-29.2,0.4},{-12.6,0.4}}, color={168,168,168}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PumpTestBase;
