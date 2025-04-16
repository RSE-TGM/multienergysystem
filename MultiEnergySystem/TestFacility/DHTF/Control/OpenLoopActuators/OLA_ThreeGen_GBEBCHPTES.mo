within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_ThreeGen_GBEBCHPTES
  extends OLA_ThreeGen_GBEBCHP_II;
  Modelica.Blocks.Sources.IntegerExpression S200status(y= 1)   annotation (
    Placement(transformation(extent={{12,-176},{32,-156}})));
  Modelica.Blocks.Sources.RealExpression domegaP201_var(y=2*pi*30)   annotation (
    Placement(transformation(extent={{12,-192},{33,-171}})));
  Modelica.Blocks.Sources.RealExpression dthetaFCV201_var(y=1)   annotation (
    Placement(transformation(extent={{12,-206},{32,-186}})));
equation
  connect(S200status.y, controlSignalBus.statusS200) annotation (Line(points={{33,-166},{156,-166},{156,0},{160,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(domegaP201_var.y, controlSignalBus.omegaP201) annotation (Line(points={{34.05,-181.5},{160,-181.5},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dthetaFCV201_var.y, controlSignalBus.thetaFCV201)
    annotation (Line(points={{33,-196},{48,-196},{48,-198},{160,-198},{160,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end OLA_ThreeGen_GBEBCHPTES;
