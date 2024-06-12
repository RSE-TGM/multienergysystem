within MultiEnergySystem.H2GasFacility.Media.IdealGases;
package SimpleNaturalGas_H2 "Taken from the MSL. Simple natural gas mix with 6 components and H2"
  extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
  mediumName="SimpleNaturalGas_H2",
  data={Modelica.Media.IdealGases.Common.SingleGasesData.CH4,
      Modelica.Media.IdealGases.Common.SingleGasesData.C2H6,
      Modelica.Media.IdealGases.Common.SingleGasesData.C3H8,
      Modelica.Media.IdealGases.Common.SingleGasesData.C4H10_n_butane,
      Modelica.Media.IdealGases.Common.SingleGasesData.N2,
      Modelica.Media.IdealGases.Common.SingleGasesData.CO2,
      Modelica.Media.IdealGases.Common.SingleGasesData.H2},
  fluidConstants={Modelica.Media.IdealGases.Common.FluidData.CH4,
      Modelica.Media.IdealGases.Common.FluidData.C2H6,
      Modelica.Media.IdealGases.Common.FluidData.C3H8,
      Modelica.Media.IdealGases.Common.FluidData.C4H10_n_butane,
      Modelica.Media.IdealGases.Common.FluidData.N2,
      Modelica.Media.IdealGases.Common.FluidData.CO2,
      Modelica.Media.IdealGases.Common.FluidData.H2},
  substanceNames={"Methane","Ethane","Propane","N-Butane,","Nitrogen","Carbondioxide","Hydrogen"},
  reference_X={0.9,0.04,0.04,0.005,0.01,0.005,0});
  //reference_X={1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0});


  annotation (Documentation(info="<html>

</html>"));
end SimpleNaturalGas_H2;
