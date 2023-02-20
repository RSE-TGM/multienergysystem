within MultiEnergySystem.DistrictHeatingNetwork.Choices;
package Pipe
  type FFtypes = enumeration(
      Kfnom "Kfnom friction factor",
      OpPoint "Friction factor defined by operating point",
      Cfnom "Cfnom friction factor",
      Colebrook "Colebrook's equation",
      NoFriction "No friction")
    "Type, constants and menu choices to select the friction factor";

  type HCtypes = enumeration(
      Middle "Middle of the pipe",
      Upstream "At the inlet",
      Downstream "At the outlet")
    "Type, constants and menu choices to select the location of the hydraulic capacitance";
end Pipe;
