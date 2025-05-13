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
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet senthot(m_flow(max = 0)) annotation (Placement(transformation(extent={{26,272},{46,292}}), iconTransformation(extent={{90,-70},{110,-50}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet returncold(m_flow(min = 0)) annotation (Placement(transformation(extent={{-26,272},{-6,292}}), iconTransformation(extent={{90,50},{110,70}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas                    annotation (Placement(transformation(extent={{-10,-292},{10,-272}}), iconTransformation(extent={{-10,-110},{10,-90}})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(
    Kv=33,
    dp_nom=20000,
    q_m3h_nom=1,
    Tin_start(displayUnit="degC") = 338.15,
    pin_start=200000,
    q_m3h_start=1)                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={8.25,244.25},extent={{7.75,7.75},{-7.75,-7.75}},
                                                                                               rotation=180)));
  DistrictHeatingNetwork.Components.Fittings.Junction junction annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-16,244})));
  DistrictHeatingNetwork.Components.Fittings.Junction2 junction2_1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={36,244})));
equation
  connect(junction.inlet, returncold) annotation (Line(
      points={{-16,254},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2_1.inoutlet, FV933.outlet) annotation (Line(
      points={{26,244},{21,244},{21,244.25},{16,244.25}},
      color={140,56,54},
      thickness=0.5));
  connect(junction2_1.outlet, senthot) annotation (Line(
      points={{36,254},{36,282}},
      color={140,56,54},
      thickness=0.5));
  connect(FV933.inlet, junction.inoutlet) annotation (Line(
      points={{0.5,244.25},{-2.75,244.25},{-2.75,244},{-6,244}},
      color={140,56,54},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-300,-300},{300,300}})), Icon(coordinateSystem(grid={1,1})));
end BaseHeatGeneration;
