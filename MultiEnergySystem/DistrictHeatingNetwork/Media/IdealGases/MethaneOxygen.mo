within MultiEnergySystem.DistrictHeatingNetwork.Media.IdealGases;
package MethaneOxygen "Ideal Mixture of CH4 + H2 usin Modelica Standard Library"
  extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
     mediumName="MoistAir",
     data={Modelica.Media.IdealGases.Common.SingleGasesData.CH4, Modelica.Media.IdealGases.Common.SingleGasesData.H2},
    fluidConstants={Modelica.Media.IdealGases.Common.FluidData.CH4,
      Modelica.Media.IdealGases.Common.FluidData.H2},
     substanceNames = {"Methane","Oxygen"},
     reference_X={0.8,0.2});
  annotation (Documentation(info="<html>

</html>"));
end MethaneOxygen;
