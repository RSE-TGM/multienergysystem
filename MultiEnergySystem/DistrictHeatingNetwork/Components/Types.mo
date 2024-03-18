within MultiEnergySystem.DistrictHeatingNetwork.Components;
package Types
  extends Modelica.Icons.TypesPackage;

  type valveOpeningChar = enumeration(
      Linear "Linear opening characteristic",
      Quadratic "Quadratic opening characteristic",
      SquareRoot "Square root opening charecteristic",
      EqualPercentage "Equal percentage opening characteristic")
  "Enumeration to define the choice of valve flow coefficient";
end Types;
