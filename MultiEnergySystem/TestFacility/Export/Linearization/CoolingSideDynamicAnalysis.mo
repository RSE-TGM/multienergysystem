within MultiEnergySystem.TestFacility.Export.Linearization;
model CoolingSideDynamicAnalysis
  extends DHTF.Control.Tests.CentralizedControlPlant_III;
  Export.Interfaces.ControlSignalBus inputs
    annotation (Placement(
      visible=true,
      transformation(
        origin={-73,63},
        extent={{51,41},{-51,-41}},
        rotation=-90),
      iconTransformation(
        origin={-87,-1},
        extent={{31,33},{-31,-33}},
        rotation=-90)));
  Export.Interfaces.ControlSignalBus outputs
    annotation (Placement(
      visible=true,
      transformation(
        origin={98,81},
        extent={{-51,-42},{51,42}},
        rotation=-90),
      iconTransformation(
        origin={88,0},
        extent={{-30,-30},{30,30}},
        rotation=-90)));
equation
  connect(inputs, plant.controlSignalBus)
    annotation (Line(
      points={{-73,63},{4,63},{4,-0.38},{12.86,-0.38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(outputs, plant.processVariableBus)
    annotation (Line(
      points={{98,81},{86,81},{86,74},{70,74},{70,0},{51.36,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end CoolingSideDynamicAnalysis;
