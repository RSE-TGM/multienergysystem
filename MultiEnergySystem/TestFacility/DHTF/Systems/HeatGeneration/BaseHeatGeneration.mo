within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
partial model BaseHeatGeneration
  extends DistrictHeatingNetwork.Icons.Water.HeatGeneration;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp
    constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  //Constants
  constant Real pi = Modelica.Constants.pi;

  //-------------------------------
  // Pipe parameters
  //-------------------------------
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.PerUnit cf = 0.005 "friction factor for pipes";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";

  //-------------------------------
  // Gas parameters
  //-------------------------------
  parameter Integer nXi = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nXi] = {0.9553316, 0.0341105, 0.0105579, 0} "Gas composition";


  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-310,-22},{-270,18}}),
                                                                                                                         iconTransformation(extent={{-20,80},{20,120}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet senthot annotation (Placement(transformation(extent={{26,272},{46,292}}), iconTransformation(extent={{90,-70},{110,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet returncold annotation (Placement(transformation(extent={{-26,272},{-6,292}}), iconTransformation(extent={{90,50},{110,70}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas                    annotation (Placement(transformation(extent={{-10,-292},{10,-272}}), iconTransformation(extent={{-10,-110},{10,-90}})));
  annotation (Diagram(coordinateSystem(extent={{-300,-300},{300,300}})), Icon(coordinateSystem(grid={1,1})));
end BaseHeatGeneration;
