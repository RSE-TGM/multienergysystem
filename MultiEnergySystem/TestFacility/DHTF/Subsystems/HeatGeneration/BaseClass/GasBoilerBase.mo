within MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration.BaseClass;
partial model GasBoilerBase "Partial System 100 - Gas Boiler Base model, including the main parameters"
  extends TestFacility.DHTF.Interfaces.SystemInterfaceBaseI(MultiPort(n=n));
  //extends DistrictHeatingNetwork.Icons.Water.ThermalModel;
  extends DistrictHeatingNetwork.Icons.Water.GasBoiler;
  import pipeData = MultiEnergySystem.TestFacility.Data.PipelineData.S100;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  constant Real pi = Modelica.Constants.pi;

  //-------------------------------
  // Initialization
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.Pressure pin_start = 1.695e5 "inlet pressure start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Pressure pout_start = 1.6e5 "outlet pressure start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start = 65 + 273.15 "inlet temperature start value" annotation (
    Dialog(group = "Initialization"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start = 80 + 273.15 "outlet temperature start value" annotation (
    Dialog(group = "Initialization"));
  parameter Real q_m3h_S1(unit = "m3/h") = 9 "volumetric flow rate start value" annotation (
    Dialog(group = "Initialization"));
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1*985/3600;

  //-------------------------------
  // Pipes
  //-------------------------------
  parameter Integer n = 3 "Number of volumes in each pipe" annotation (
    Dialog(group = "Pipe settings"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(group = "Pipe settings"));
  final parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3 "Internal diameter" annotation (
    Dialog(group = "Pipe settings"));
  final parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3 "Thickness" annotation (
    Dialog(group = "Pipe settings"));

  //-------------------------------
  // Valve parameters
  //-------------------------------
  parameter Real Kv(unit = "m3/h") = TestFacility.Data.ValveData.FCV101.Kv "Metric Flow Coefficient" annotation (
    Dialog(group = "Valve settings"));
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = TestFacility.Data.ValveData.FCV101.openingChar "opening characteristic" annotation (
    Dialog(group = "Valve settings"));

  //-------------------------------
  // Boiler parameters
  //-------------------------------
  parameter DistrictHeatingNetwork.Types.PerUnit eta_combustion = 0.92 "Combustion efficiency" annotation (
    Dialog(group = "Boiler settings"));
  parameter Modelica.Units.SI.Time tdelay = 10 "Rising time of heater from 0 to full power" annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pnom = 147.6e3 annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 147.6e3*0.8 annotation (
    Dialog(group = "Boiler settings"));
  parameter DistrictHeatingNetwork.Types.Power Pminnom = 147.6e3*0.2 annotation (
    Dialog(group = "Boiler settings"));
  final parameter DistrictHeatingNetwork.Types.Length h = 1.2*0.93 annotation (
    Dialog(group = "Boiler settings"));
  final parameter DistrictHeatingNetwork.Types.Length D = 0.64 annotation (
    Dialog(group = "Boiler settings"));

  Gas fuel(T_start = 15 + 273.15, p_start = 1.013e5) "Reference outlet fluid";

equation

//   fuel.h = inStream(inletFuel.h_out);
//   fuel.Xi = inStream(inletFuel.Xi);
//   fuel.p = 1.013e5;
//
//   inletFuel.h_out = 0 "Dummy equation considering not fuel flow reversal";
//   inletFuel.Xi = fuel.Xi_start "Dummy equation considering not fuel flow reversal";
//   inletFuel.p = GB.system.p_amb;



  annotation (                                                   Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}}, grid={0.5,0.5})), Documentation(info="<html>
<h3>GasBoilerBase</h3>
<p>
<strong>Summary:</strong><br>
This model includes the main parameters from system S100 in RSE's Test Facility. 
This base model is used to built two other main models to simulate system 100: <a href=\"modelica://MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration.GasBoiler\">GasBoiler</a> and 
<a href=\"modelica://MultiEnergySystem.TestFacility.DHTF.Subsystems.HeatGeneration.GasBoilerFC\">GasBoilerFC</a>. The main difference between these two models is that the pump 
is controlled by manipulating the rotational speed <code>omega</code> or by setting directly the mass flow rate <code>m_flow</code>, respectively, acting in connector input
<code>pumpset</code>.
</p>
</html>"));
end GasBoilerBase;
