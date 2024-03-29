within MultiEnergySystem;
package DistrictHeatingNetwork "Components for District Heating and Cooling Systems"
  extends Icons.Water.Thermal;
  import      Modelica.Units.SI;
  import BPHE = MultiEnergySystem.DistrictHeatingNetwork.Data.BPHEData;
  import Pump = MultiEnergySystem.DistrictHeatingNetwork.Data.PumpData;
  import         MultiEnergySystem.DistrictHeatingNetwork.Types;
  import Pipe = MultiEnergySystem.DistrictHeatingNetwork.Data.PipelineData;
  import Valve = MultiEnergySystem.DistrictHeatingNetwork.Data.ValveData;
  import      Modelica.Constants.pi;

                                  annotation (
    Icon(graphics={                                                                                                                                                                                      Text(
        extent={{-78,80},{78,-80}},
        textColor={140,56,54},
        textStyle={TextStyle.Bold},
        fontName="Tahoma",
        textString="DH")}));
end DistrictHeatingNetwork;
