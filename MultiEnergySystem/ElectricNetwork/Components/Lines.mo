within MultiEnergySystem.ElectricNetwork.Components;
package Lines
  model SimpleLine
    "Line model that take in account only enrgy losses, no voltage drop"

    type LossCoefficient = Real(unit="1/m") "New type definition";

    // Parameters
    parameter LossCoefficient k = 1e-5 "Loss coefficient of the electric line";
    parameter Modelica.Units.SI.Length L = 1 "Lenght of the line";
    parameter Boolean useThermalPort = false "Enable thermal losses reporting";
    parameter Modelica.Units.SI.Power eps = 1e-6 "Regularization power";

    // Variables
    Modelica.Units.SI.Power P_loss "Accounts losses for Joule effect";

    Interfaces.ElectricPortInlet electricPortInlet annotation (
      Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
    Interfaces.ElectricPortOutlet electricPortOutlet annotation (
      Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
    DistrictHeatingNetwork.Interfaces.HeatPort thermalPort if useThermalPort annotation (
      Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));

  equation

    // Losses evaluation
    P_loss = k*L*smooth(1, sqrt(electricPortInlet.P^2 + eps));

    // Set power balance
    0 = electricPortInlet.P + electricPortOutlet.P + P_loss;

    // Set voltage bus as equipotential
    electricPortOutlet.v = electricPortInlet.v;

    // Set thermal losses
    if useThermalPort then
      thermalPort.Q_flow = -P_loss;
    end if;

  annotation (
      Icon(graphics={  Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189}, lineThickness = 1, extent = {{-60, 12}, {60, -12}}), Line(origin = {3, 0}, points = {{-93, 0}, {-63, 0}, {93, 0}}, thickness = 0.5)}));
  end SimpleLine;

  model ResistiveLine
    "Physical line model with Joule losses and voltage drop (with symmetric equivalent current)"

    // Parameters
    parameter Modelica.Units.SI.Length L = 0.1 "Length of the line";
    parameter Modelica.Units.SI.Area A = 0.1 "Section of the line";
    parameter Modelica.Units.SI.Resistivity rho
      "Electrical resistivity of the conductor";

    final parameter Modelica.Units.SI.Resistance R = rho * L / A
      "Line resistance";

    parameter Modelica.Units.SI.Power eps = 1e-6
      "Regularization term (avoid division by zero)";

    parameter Boolean useThermalPort = false
      "Enable thermal losses reporting";

    // Variables
    Modelica.Units.SI.Power P_loss "Joule losses";
    Modelica.Units.SI.Current I     "Equivalent current";

    Modelica.Units.SI.Power P_mean "Mean power";
    Modelica.Units.SI.Voltage V_mean "Mean voltage";

    // Ports
    MultiEnergySystem.DistrictHeatingNetwork.Interfaces.HeatPort
      thermalPort if useThermalPort annotation (
        Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}),
                  iconTransformation(origin = {1, 13}, extent = {{-5, -5}, {5, 5}})));

    Interfaces.ElectricPortInlet electricPortInlet annotation (
      Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}),
                iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));

    Interfaces.ElectricPortOutlet electricPortOutlet annotation (
      Placement(transformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}}),
                iconTransformation(origin = {100, -2}, extent = {{-10, -10}, {10, 10}})));

  equation

    // Mean quantities (symmetry)
    P_mean = (electricPortInlet.P - electricPortOutlet.P) / 2;
    V_mean = (electricPortInlet.v + electricPortOutlet.v) / 2;

    // Equivalent current (symmetric)
    I = P_mean / (abs(V_mean) + eps);

    // Joule losses (physical)
    P_loss = R * I^2;

    // Power balance
    electricPortInlet.P + electricPortOutlet.P - P_loss = 0;

    // Voltage drop (Ohm's law)
    electricPortInlet.v - electricPortOutlet.v = R * I;

    // Thermal port
    if useThermalPort then
      thermalPort.Q_flow = -P_loss;
    end if;

  annotation (
    Diagram(graphics),
    Icon(graphics={
      Rectangle(lineColor = {79, 129, 189}, fillColor = {79, 129, 189},
                lineThickness = 1, extent = {{-60, 12}, {60, -12}}),
      Line(points = {{-60, 0}, {-50, -12}, {-30, 12}, {-10, -12},
                     {10, 12}, {30, -12}, {50, 12}, {60, 0}},
           thickness = 0.5),
      Line(origin = {-75, 0}, points = {{-15, 0}, {15, 0}}, thickness = 0.5),
      Line(origin = {75, 0}, points = {{-15, 0}, {15, 0}}, thickness = 0.5)}));
  end ResistiveLine;

  model Resistor

    extends MultiEnergySystem.ElectricNetwork.Interfaces.PartialTwoPin;

    // Parameter
    parameter Modelica.Units.SI.Resistance R = 1;

    // Variables
    Modelica.Units.SI.Power P_loss;

    // Thermal port
    MultiEnergySystem.DistrictHeatingNetwork.Interfaces.HeatPort
      thermalPort if useThermalPort annotation (
        Placement(transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}),
                  iconTransformation(origin = {0, 40}, extent = {{-6, -6}, {6, 6}})));

    parameter Boolean useThermalPort = false;

  equation

    v = R * i;

    // Joule losses
    P_loss = v * i;

    // Thermal port
    if useThermalPort then
      thermalPort.Q_flow = -P_loss;
    end if;

  annotation (
      Icon(graphics={  Line(origin = {1, 0}, points = {{-91, 0}, {-61, 0}, {-51, 40}, {-31, -40}, {-11, 40}, {9, -40}, {29, 40}, {49, -40}, {59, 0}, {91, 0}})}));
  end Resistor;

  model ResistiveLine_i

    //Parameters
    parameter Modelica.Units.SI.Length L;
    parameter Modelica.Units.SI.Area A;
    parameter Modelica.Units.SI.Resistivity rho;

    extends Lines.Resistor(
  final R = rho * L / A);
      annotation (
      Icon(graphics={  Rectangle(lineThickness = 0.5, extent = {{-60, 40}, {60, -40}})}));

  end ResistiveLine_i;
end Lines;
