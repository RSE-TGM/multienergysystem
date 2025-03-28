within MultiEnergySystem.TestFacility.Export.FMU;
model S100 "Example of system S100 fmu test model"
  extends Modelica.Icons.Example;
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;
  constant Real pi = Modelica.Constants.pi;

  // Gas composition
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[4] = {0.9553316, 0.0341105, 0.0105579, 0};

  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter Real rho = 985 "Average density";
  // Temperatures and pressures
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 2e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 2.1e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 30 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 32 + 273.15;
  // Pipe Data
  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0; //0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 2*0;
  parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;

  parameter Real q_m3h(unit = "m3/h") = 6;

  DHTF.Subsystems.HeatGeneration.GasBoiler gasBoiler(n=n,
    Tout_start_S1=Tout_start_S1,
    h_FT101_GB101=h_FT101_GB101,
    h_GB101_P101=h_GB101_P101,
    L_P101_FCV101=L_P101_FCV101,
    h_P101_FCV101=h_P101_FCV101,
    q_m3h_S1=q_m3h,
    GB(initOpt=MultiEnergySystem.DistrictHeatingNetwork.Choices.Init.Options.fixedState))
                                                  annotation (Placement(transformation(extent={{-42,-44},{42,40}})));
  Modelica.Blocks.Interfaces.RealInput f annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(transformation(extent={{-120,0},{-80,40}}), iconTransformation(extent={{-120,0},{-80,40}})));
  Modelica.Blocks.Interfaces.RealInput ToutSP annotation (Placement(transformation(extent={{-120,-40},{-80,0}}), iconTransformation(extent={{-120,-40},{-80,0}})));
  Modelica.Blocks.Interfaces.RealOutput FT101 annotation (Placement(transformation(extent={{92,30},{112,50}}), iconTransformation(extent={{92,30},{112,50}})));
  Modelica.Blocks.Interfaces.RealOutput TT101 annotation (Placement(transformation(extent={{92,10},{112,30}}), iconTransformation(extent={{92,10},{112,30}})));
  Modelica.Blocks.Interfaces.RealOutput TT102 annotation (Placement(transformation(extent={{92,-10},{112,10}}), iconTransformation(extent={{92,-10},{112,10}})));
  Modelica.Blocks.Interfaces.RealOutput PT101 annotation (Placement(transformation(extent={{92,-30},{112,-10}}), iconTransformation(extent={{92,-30},{112,-10}})));
  Modelica.Blocks.Interfaces.RealOutput PT102 annotation (Placement(transformation(extent={{92,-50},{112,-30}}), iconTransformation(extent={{92,-50},{112,-30}})));
  Modelica.Blocks.Interfaces.BooleanInput status annotation (Placement(transformation(extent={{-120,-80},{-80,-40}}), iconTransformation(extent={{-120,-80},{-80,-40}})));
  Modelica.Blocks.Math.Gain gain(k=2*pi)
                                 annotation (Placement(transformation(extent={{-74,54},{-62,66}})));
  Modelica.Blocks.Math.Gain gain1(k=3600/rho)
                                 annotation (Placement(transformation(extent={{58,34},{70,46}})));
  DistrictHeatingNetwork.Sources.SourcePressure source(use_in_p0=true, use_in_T0=true,
    R=1e-3)                                                                            annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
  Modelica.Blocks.Interfaces.RealInput pin annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-30,100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-40,100})));
  Modelica.Blocks.Interfaces.RealInput Tin annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100})));
  DistrictHeatingNetwork.Sources.SinkPressure
                       sink(
    use_in_p0=true, R=1e-3)
                      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={34,60})));
  Modelica.Blocks.Interfaces.RealInput pout annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={30,100}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={40,100})));
  inner DistrictHeatingNetwork.System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  H2GasFacility.Sources.SourcePressure sourcePressure(redeclare model Medium = Gas,
    X0=X_gas,
    R=1e-3,
    computeEnergyVariables=true) annotation (Placement(transformation(extent={{-30,-90},{-10,-70}})));
equation
  connect(f, gain.u) annotation (Line(points={{-100,60},{-75.2,60}}, color={0,0,127}));
  connect(gain.y, gasBoiler.omega) annotation (Line(points={{-61.4,60},{-56,60},{-56,27.4},{-46.2,27.4}}, color={0,0,127}));
  connect(status, gasBoiler.status) annotation (Line(points={{-100,-60},{-68,-60},{-68,2.2},{-46.2,2.2}}, color={255,0,255}));
  connect(theta, gasBoiler.theta) annotation (Line(points={{-100,20},{-68,20},{-68,19},{-46.2,19}}, color={0,0,127}));
  connect(ToutSP, gasBoiler.Toutset) annotation (Line(points={{-100,-20},{-76,-20},{-76,10.6},{-46.2,10.6}},
                                                                                                         color={0,0,127}));
  connect(gasBoiler.m_flow_, gain1.u) annotation (Line(points={{46.2,27.4},{50,27.4},{50,40},{56.8,40}}, color={0,0,127}));
  connect(gain1.y, FT101) annotation (Line(points={{70.6,40},{80,40},{80,40},{102,40}},
                                                                       color={0,0,127}));
  connect(gasBoiler.TTin, TT101) annotation (Line(points={{46.2,19},{62,19},{62,20},{102,20}},color={0,0,127}));
  connect(gasBoiler.TTout, TT102) annotation (Line(points={{46.2,10.6},{67.1,10.6},{67.1,0},{102,0}},  color={0,0,127}));
  connect(gasBoiler.PTin, PT101) annotation (Line(points={{46.2,2.2},{62,2.2},{62,-20},{102,-20}},
                                                                                                color={0,0,127}));
  connect(gasBoiler.PTout, PT102) annotation (Line(points={{46.2,-6.2},{52,-6.2},{52,-6},{60,-6},{60,-40},{102,-40}},color={0,0,127}));
  connect(source.outlet, gasBoiler.inlet) annotation (Line(
      points={{-30,60},{-16.38,60},{-16.38,46.3}},
      color={140,56,54},
      thickness=0.5));
  connect(sink.inlet, gasBoiler.outlet) annotation (Line(
      points={{24,60},{17.22,60},{17.22,46.3}},
      color={140,56,54},
      thickness=0.5));
  connect(pout, sink.in_p0) annotation (Line(points={{30,100},{30,68.4}}, color={0,0,127}));
  connect(pin, source.in_p0) annotation (Line(points={{-30,100},{-30,76},{-44,76},{-44,68.4}}, color={0,0,127}));
  connect(Tin, source.in_T0) annotation (Line(points={{0,100},{0,74},{-36,74},{-36,68.4}},     color={0,0,127}));
  connect(sourcePressure.outlet, gasBoiler.inletFuel) annotation (Line(
      points={{-10,-80},{0,-80},{0,-50.72}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end S100;
