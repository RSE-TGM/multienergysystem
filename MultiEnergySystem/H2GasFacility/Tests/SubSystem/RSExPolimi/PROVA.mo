within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
partial model PROVA "Base network with no sources and reduced number of pipes"
  extends Modelica.Icons.Example;
  //extends DistrictHeatingNetwork.Icons.Generic.InProgress;
  // replaceable model Medium =
  //    MultiEnergySystem.H2GasFacility.Media.RealGases.NG6_H2_Papay constrainedby
  //  MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2;
  //MultiEnergySystem.H2GasFacility.Media.IdealGases.NG_4 constrainedby MultiEnergySystem.H2GasFacility.Media.BaseClasses.PartialMixture;
  parameter Boolean useEnergyDemand = false;
  parameter Boolean massFractionDynamicBalance = true;
  parameter Boolean constantFrictionFactor = false;
  parameter Real FrictionFactor = 0.009;
  parameter Boolean computeInertialTerm = false;
  parameter Integer n = 3 "Number of volumes in each pipeline";
  parameter Integer nX = 2 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {1, 0};
  //parameter Types.MassFraction X_start[nX] = {1, 0, 0, 0};
  parameter Types.MassFlowRate m_flow_H2_ref = 0.005;
  parameter Types.Density rho_nom = 0.657;
  parameter Types.Pressure p_nom = 4.93e5;
  parameter DistrictHeatingNetwork.Choices.Pipe.Momentum momentum = DistrictHeatingNetwork.Choices.Pipe.Momentum.MediumPressure;
  parameter Types.Length kappa = 0.045e-3;
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream;
  //parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle;
  parameter Integer nV = 3;
  H2GasFacility.Components.Pipes.Round1DFV s1(H = Data.PipelineData_2i.s1.h, cm = Data.PipelineData_2i.s1.cm, rhom = Data.PipelineData_2i.s1.rhom, lambdam = Data.PipelineData_2i.s1.lambdam, m_flow_start = Data.PipelineData_2i.s1.m_flow_start, pin_start = Data.PipelineData_2i.s1.pin_start, pout_start = Data.PipelineData_2i.s1.pout_start, redeclare
      model                                                                                                                                                                                                         Gas = Medium, pin_nom = Data.PipelineData_2i.s1.pin_start, rho_nom = Data.PipelineData_2i.s1.rho_nom, ff_nom = FrictionFactor, n = nV, kappa = Data.PipelineData_2i.s1.kappa, k = Data.PipelineData_2i.s1.k, L = Data.PipelineData_2i.s1.L, X_start = X_start, Di = Data.PipelineData_2i.s1.Di, massFractionDynamicBalance = massFractionDynamicBalance, constantFrictionFactor = constantFrictionFactor, computeInertialTerm = computeInertialTerm, hctype = hctype, momentum = momentum) annotation (
    Placement(transformation(origin = {-174, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  H2GasFacility.Components.Pipes.Round1DFV sds1(L = Data.PipelineData_2i.sds1.L, H = Data.PipelineData_2i.sds1.h, cm = Data.PipelineData_2i.sds1.cm, rhom = Data.PipelineData_2i.sds1.rhom, lambdam = Data.PipelineData_2i.sds1.lambdam, redeclare
      model                                                                                                                                                                                                         Gas = Medium, m_flow_start = Data.PipelineData_2i.sds1.m_flow_start, pin_start = Data.PipelineData_2i.sds1.pin_start, pout_start = Data.PipelineData_2i.sds1.pout_start, ff_nom = FrictionFactor, kappa = Data.PipelineData_2i.sds1.kappa, k = Data.PipelineData_2i.sds1.k, X_start = X_start, Di = Data.PipelineData_2i.sds1.Di, massFractionDynamicBalance = massFractionDynamicBalance, constantFrictionFactor = constantFrictionFactor, computeInertialTerm = computeInertialTerm, hctype = hctype, momentum = momentum, rho_nom = Data.PipelineData_2i.sds1.rho_nom, n = nV) annotation (
    Placement(transformation(origin = {-226, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner System system(T_amb = 288.15) annotation (
    Placement(transformation(origin = {-18, -202}, extent = {{-270, 264}, {-250, 284}})));
  MultiEnergySystem.H2GasFacility.Components.Valves.ValveLinearOpening valveLinearOpening(                                                 redeclare
      model                                                                                                                                                Medium = Medium, PressureDropLinear = false,
    Tin_start=288.15,
    Tout_start=288.15,                                                                                                                                                                                                        X_start = X_start, m_flow_nom = 0.4138,
    pin_start=6000000)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin = {-98, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Sources.SourcePressure sourcePressure(redeclare
      model                                                                             Medium = Medium, T0 = 288.15, X0 = X_start, p0 = 6000000) annotation (
    Placement(transformation(origin = {-66, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Sensors.IdealPressureSensor idealPressureSensor(redeclare
      model                                                                                       Medium = Medium, Tin_start = 288.15, Tout_start = 288.15, X_start = X_start, m_flow_start = 0.4110, pin_start = 493000, pout_start = 493000) annotation (
    Placement(transformation(origin = {-138, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  MultiEnergySystem.H2GasFacility.Controllers.Valve_controller valve_controller annotation (
    Placement(transformation(origin = {0, 2}, extent = {{-128, -10}, {-108, 10}})));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_4(redeclare
      model                                                                        Medium = Medium, X0 = X_start, m_flow0 = 0.021261, p0 = 463200) annotation (
    Placement(transformation(origin = {-86, -150}, extent = {{-212, 154}, {-168, 198}})));
equation
  connect(sourcePressure.outlet, valveLinearOpening.inlet) annotation (
    Line(points = {{-76, 26}, {-88, 26}}, color = {182, 109, 49}, thickness = 0.5));
  connect(idealPressureSensor.inlet, valveLinearOpening.outlet) annotation (
    Line(points = {{-128, 26}, {-108, 26}}, color = {182, 109, 49}, thickness = 0.5));
  connect(valve_controller.P_meas, idealPressureSensor.p_meas) annotation (
    Line(points={{-128.8,2},{-141.8,2},{-141.8,18.6}},  color = {0, 0, 127}));
  connect(valve_controller.ACT_x, valveLinearOpening.opening) annotation (
    Line(points = {{-106.6, 2}, {-98, 2}, {-98, 18}}, color = {0, 0, 127}));
  connect(s1.inlet, idealPressureSensor.outlet) annotation (
    Line(points = {{-164, 26}, {-148, 26}}, color = {182, 109, 49}));
  connect(sds1.outlet, GRM_4.inlet) annotation (
    Line(points = {{-236, 26}, {-276, 26}}, color = {182, 109, 49}));
  connect(sds1.inlet, s1.outlet) annotation (
    Line(points = {{-216, 26}, {-184, 26}}, color = {182, 109, 49}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-300, 80}, {-60, -20}})),
    experiment(StopTime = 100, Tolerance = 1e-05, __Dymola_Algorithm = "Dassl"),
    Documentation(info = "<html>
<p>Structure of the network with only pipes and connections. </p>
</html>"));
end PROVA;
