within MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass;
package ValveCharacteristics
  extends Modelica.Icons.FunctionsPackage;

  partial function baseFunction
    "Partial function that takes the position and returns the corresponding actual displacement"
    extends Modelica.Icons.Function;
    input Real pos(min=0, max=1)
        "Opening position (0: closed, 1: fully open)";
    output Real rp "Actual displacement (per unit)";
  end baseFunction;

  function linear
    "Linear opening characteristic"
    extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
  algorithm
    rp := pos;
  end linear;

  function quadratic
    "Quadratic opening char."
    extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
  algorithm
  rp := pos*pos;
  end quadratic;

  function squareRoot "Square opening char."
    extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
  algorithm
  rp := sqrt(pos+1e-3);
  end squareRoot;

  function equalPercentage "Square opening char."
    extends MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.BaseClass.ValveCharacteristics.baseFunction;
      input Real N(min = 0);
  algorithm
    rp := N^(pos-1);
    //rp := 14^(pos^3 -1); // gas boiler;
  end equalPercentage;
end ValveCharacteristics;
