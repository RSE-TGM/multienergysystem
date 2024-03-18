within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Valves.Validation;
partial model TestBase
  extends Modelica.Icons.Example;
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity constrainedby
    DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";
  parameter Types.Density rhohotref = 985 "Reference hot water density";
  parameter Types.Density rhocoldref = 999 "Reference cold water density";
  parameter Types.Length L = 2.5 "Length of the tube";
  parameter Types.Length h = 2.0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight";
  parameter Types.Length t = 1.5e-3 "Thickness of the tube";
  parameter Types.Length Di = 32e-3 "Internal Diameter of a single tube";
  parameter Types.Pressure pmax = 6e5 "Maximum pressure that the component can support";
  parameter Types.Length tIns = 0.15 "Insulation thickness";
  parameter Types.ThermalConductivity lambdaIns = 0.04 "Thermal conductivity of the insulant material";
  parameter Types.PerUnit cf = 0.195 "Constant Fanning factor";
  parameter Real Kv =  12;
  parameter Real Q_nom(unit = "m3/h") = 5;
  parameter Real theta_ex = 0;


  parameter String MeasuredData = Modelica.Utilities.Files.loadResource("C:/Users/muro/OneDrive - RSE S.p.A/Modelli e Simulazione/RdS/Acquisizione dati - Test Facility/Test Dicembre 2023/0412_Test3/Temperatures.mat") "File name of matrix" annotation (
    Dialog(loadSelector(filter = "MATLAB MAT files (*.mat)", caption = "Open MATLAB MAT file")));

  parameter String matrixPTi = "PT702";
  parameter String matrixPTo = "PT701";
  parameter String matrixTTi = "TT701";
  parameter String matrixtheta = "theta_FCV701";
  parameter String matrixFT = "FT701";
  parameter String timenoscale = "time";

  Real Q_sim(unit = "m3/h");
  Real Q_meas(unit = "m3/h");
  Real Q_sim_norm, Q_meas_norm, dQ;

  MultiEnergySystem.DistrictHeatingNetwork.Sources.SourcePressure sourceP(redeclare model Medium = Medium, T0 = Valve.TCV701.Tin_start, p0 = Valve.TCV701.pin_start, use_in_p0 = true, use_in_T0 = true) annotation (
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve cvalve(redeclare
      model Medium =                                                                                              Medium,
    Kv=Kv,                                                                                                                                      Tin_start = Valve.FCV701.Tin_start, dp_nom = Valve.FCV701.dp_nom, pin_start = Valve.FCV701.pin_start, rho_nom = Valve.FCV701.rho_nom, q_m3h_start = Valve.FCV701.q_nom_m3h, rho_start = Valve.FCV701.rho_nom,
    openingChar=MultiEnergySystem.DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage)                                                                                                 annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}})));
  Sources.SinkPressure sinkP(redeclare model Medium = Medium, use_in_p0 = true)  annotation (
    Placement(transformation(origin={70,0},    extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable inp(table = [ts, PTi])  annotation (
    Placement(transformation(origin = {-88, 20}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable outp(table = [ts, PTo])  annotation (
    Placement(transformation(origin={90,20},    extent = {{4, -4}, {-4, 4}})));
  Modelica.Blocks.Sources.TimeTable theta(table = [ts, thetav])  annotation (
    Placement(transformation(origin={-18,20},    extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Sources.TimeTable inT(table = [ts, TTi])  annotation (
    Placement(transformation(origin = {-88, 32}, extent = {{-4, -4}, {4, 4}})));
  inner System system annotation (
    Placement(transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable qm3h_ref(table = [ts, FT]) annotation (
    Placement(transformation(origin = {-90, 10}, extent = {{100, 70}, {80, 90}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-78,20},{-72,26}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=980*9.81*h)
    annotation (Placement(transformation(extent={{-92,38},{-72,58}})));
  Modelica.Blocks.Math.Add add1
                               annotation (Placement(transformation(extent={{76,26},{70,32}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=980*9.81*(h - 0.2))
    annotation (Placement(transformation(extent={{58,36},{78,56}})));
  Modelica.Blocks.Math.Add add2
                               annotation (Placement(transformation(extent={{-10,18},{-4,24}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=theta_ex)
    annotation (Placement(transformation(extent={{-42,24},{-22,44}})));
  Modelica.Blocks.Math.Min minn annotation (Placement(transformation(extent={{6,26},{16,36}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=1)
    annotation (Placement(transformation(extent={{-20,32},{0,52}})));
protected
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(MeasuredData, matrixPTi) "dimension of matrix";
  final parameter Real ts[:, :] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, timenoscale, dim[1], dim[2]) "Matrix data";
  final parameter Real PTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTi, dim[1], dim[2]);
  final parameter Real PTo[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixPTo, dim[1], dim[2]);
  final parameter Real TTi[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixTTi, dim[1], dim[2]);
  final parameter Real thetav[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixtheta, dim[1], dim[2]);
  final parameter Real FT[dim[1], dim[2]] = Modelica.Utilities.Streams.readRealMatrix(MeasuredData, matrixFT, dim[1], dim[2]);
  final parameter Real m_flow_approx[dim[1], dim[2]] = FT*rhohotref/3600;
  final parameter Types.Temperature Tin_start = TTi[1,1];
  final parameter Types.Pressure pin_start = PTi[1,1];
equation
  Q_sim = cvalve.q_m3h;
  Q_meas = qm3h_ref.y;
  Q_sim_norm = abs((Q_sim - Q_nom)/Q_nom);
  Q_meas_norm = abs((Q_meas - Q_nom)/Q_nom);
  dQ = 100*abs(Q_sim_norm - Q_meas_norm);

  connect(inT.y, sourceP.in_T0) annotation (
    Line(points={{-83.6,32},{-66,32},{-66,8.4}},          color = {0, 0, 127}));
  connect(inp.y, add.u2)
    annotation (Line(points={{-83.6,20},{-82,20},{-82,21.2},{-78.6,21.2}}, color={0,0,127}));
  connect(add.y, sourceP.in_p0)
    annotation (Line(points={{-71.7,23},{-70,23},{-70,14},{-74,14},{-74,8.4}}, color={0,0,127}));
  connect(realExpression.y, add.u1) annotation (Line(points={{-71,48},{-66,48},{-66,46},{-62,46},{-62,
          28},{-82,28},{-82,24.8},{-78.6,24.8}}, color={0,0,127}));
  connect(outp.y, add1.u2)
    annotation (Line(points={{85.6,20},{80,20},{80,27.2},{76.6,27.2}}, color={0,0,127}));
  connect(add1.y, sinkP.in_p0)
    annotation (Line(points={{69.7,29},{66,29},{66,8.4}}, color={0,0,127}));
  connect(realExpression1.y, add1.u1)
    annotation (Line(points={{79,46},{86,46},{86,30.8},{76.6,30.8}}, color={0,0,127}));
  connect(theta.y, add2.u2)
    annotation (Line(points={{-13.6,20},{-12.1,20},{-12.1,19.2},{-10.6,19.2}}, color={0,0,127}));
  connect(realExpression2.y, add2.u1) annotation (Line(points={{-21,34},{-16,34},{-16,28},{-10.6,28},
          {-10.6,22.8}}, color={0,0,127}));
  connect(add2.y,minn. u2)
    annotation (Line(points={{-3.7,21},{6,21},{6,28},{5,28}}, color={0,0,127}));
  connect(realExpression3.y,minn. u1)
    annotation (Line(points={{1,42},{2,42},{2,34},{5,34}}, color={0,0,127}));
  connect(minn.y, cvalve.opening)
    annotation (Line(points={{16.5,31},{20,31},{20,12},{0,12},{0,6.4}}, color={0,0,127}));
  connect(sourceP.outlet, cvalve.inlet)
    annotation (Line(
      points={{-60,0},{-8,0}},
      color={140,56,54},
      thickness=0.5));
  connect(cvalve.outlet, sinkP.inlet)
    annotation (Line(
      points={{8,0},{60,0}},
      color={140,56,54},
      thickness=0.5));
end TestBase;
