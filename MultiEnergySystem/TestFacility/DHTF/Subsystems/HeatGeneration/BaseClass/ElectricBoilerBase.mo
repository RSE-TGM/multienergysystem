within MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration.BaseClass;
model ElectricBoilerBase "Partial System 400 - Electric Boiler Base Model"
  extends TestFacility.DHTF.Interfaces.SystemInterfaceBaseI(MultiPort(n=n));
  extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
  import pipeData = MultiEnergySystem.TestFacility.Data.PipelineData.S400;
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity                        constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;

  constant Real pi = Modelica.Constants.pi;

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 1.695e5 "inlet pressure start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_start = 1.6e5 "outlet pressure start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start = 70 + 273.15 "inlet temperature start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start = 80 + 273.15 "outlet temperature start value" annotation (
    Dialog(group = "Initialization"));
  parameter Real q_m3h_S4(unit = "m3/h") = 5 annotation (
    Dialog(group = "Initialization"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

  //-------------------------------
  // Pipes
  //-------------------------------
  parameter Integer n = 3 "Number of volumes in each pipe" annotation (
    Dialog(group = "Pipe settings"));
  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3 "inlet diameter" annotation (
    Dialog(group = "Pipe settings"));
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3 "tickness" annotation (
    Dialog(group = "Pipe settings"));
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "Constant Fanning friction coefficient" annotation (
    Dialog(group = "Pipe settings"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(group = "Pipe settings"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_nom = 2.4 "nominal mass flow rate" annotation (
    Dialog(group = "Pipe settings"));

  //-------------------------------
  // Valve parameters
  //-------------------------------
  parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV401.Kv "Metric Flow Coefficient" annotation (
    Dialog(group = "Valve settings"));
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = TestFacility.Data.ValveData.FCV401.openingChar "opening characteristic" annotation (
    Dialog(group = "Valve settings"));

  //-------------------------------
  // Boiler parameters
  //-------------------------------
  parameter Real nR = 5 "Number of resistors" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Maximum thermal power per each resistor" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 50e3 "Maximum thermal power" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pminnom = 0 "Minimum thermal power" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Length h = 1.25 "Height boiler" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Length D = 0.4 "Diameter boiler" annotation (
    Dialog(group = "Boiler settings"));

equation

     annotation (
    Dialog(group = "Initialization"),                            Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}})), Icon(coordinateSystem(grid={
            1,1}),                                                          graphics={Bitmap(
          extent={{-42,-50},{45,52}},
          imageSource="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",
          fileName="modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/light2.png")}));
end ElectricBoilerBase;
