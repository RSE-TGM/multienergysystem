within MultiEnergySystem;
package H2GasFacility
  extends DistrictHeatingNetwork.Icons.Gas.Gas;
  import Pipe = MultiEnergySystem.H2GasFacility.Data.PipelineData;

  annotation (
    Icon(graphics={                                                                                                                                                                                        Text(
        extent={{-80,80},{80,-80}},
        textColor={232,232,232},
        textStyle={TextStyle.Bold},
        fontName="Tahoma",
          textString="NG")}),
    Documentation(info = "<html><head></head><body>Gas Facility package.<div><br></div><div>The objective of this library is to develop models for natural gas / biomethane &amp; hydrogen distribution modeling &amp; control.</div></body></html>"));
end H2GasFacility;
