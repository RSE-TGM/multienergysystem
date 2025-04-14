within MultiEnergySystem.DistrictHeatingNetwork.Choices.Storage;
type Status = enumeration(
    Loading "loading with hot water",
    Unloading "unloading using the hot water inside",
    Bypass "Not using the system")
  "Type, constants and menu choices to select the initialisation options";
