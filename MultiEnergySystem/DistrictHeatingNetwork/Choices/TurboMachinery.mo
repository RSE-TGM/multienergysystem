within MultiEnergySystem.DistrictHeatingNetwork.Choices;
package TurboMachinery
  type TableTypes = enumeration(
      matrix "Explicitly supplied as parameter matrix table",
      file "Read from a file")
    "Type, constants and menu choices to select the representation of table matrix";
end TurboMachinery;
