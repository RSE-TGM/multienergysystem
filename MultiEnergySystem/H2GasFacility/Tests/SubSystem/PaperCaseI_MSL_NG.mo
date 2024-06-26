within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_MSL_NG
  "PaperCaseI implemented using the Modelica Standard Library"
  extends PaperCaseI_MSL(redeclare package Medium =
        Modelica.Media.IdealGases.MixtureGases.SimpleNaturalGas);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>Used to simulate the S.S. of the network with MSL.</p>
</html>"));
end PaperCaseI_MSL_NG;
