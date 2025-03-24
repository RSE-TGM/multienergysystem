within MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes;
model BrazedPlateHeatExchanger "CounterCurrent Brazed Plate Heat Exchanger"
  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingcp constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel =
      DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;
  // General
  parameter Boolean thermalInertia = true "if true then account for metal thermal inertia";
  parameter Integer n = 3 "Number of volumes in the heat exchanger";
  parameter Integer nPlates = 18 "Number of plates in the BPHE";
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option";
  outer System system "system object for global defaults";
  // Hot side
  parameter Modelica.Units.SI.Length L_hot = 0.5 "Length of the tube hot side" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length h_hot = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length t_hot = 3e-3 "Thickness of the tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length Di_hot = 51e-3 "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.Area Stot_hot "Total surface of a single tube" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Integer nPipes_hot = 2 "Number of parallel pipes" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Modelica.Units.SI.PerUnit cf_hot = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Real k_hot(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Hot Side", group = "Pipe"));
  parameter Integer n_hot = n "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter Modelica.Units.SI.Velocity u_nom_hot = 1 "Nominal fluid velocity" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter Modelica.Units.SI.Density rho_nom_hot = 997 "Nominal density of the fluid" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype_hot = Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(tab = "Hot Side", group = "Fluid"));
  parameter Modelica.Units.SI.PerUnit kc_hot "Corrective factor for heat tranfer" annotation (
    Dialog(tab = "Hot Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_hot = 1500 "nominal heat transfer coefficient" annotation (
    Dialog(tab = "Hot Side", group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_hot = 0 "Exponent in the flow-dependency law" annotation (
    Dialog(tab = "Hot Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.Length tIns_hot = 0.15 "Insulation thickness" annotation (
    Dialog(tab = "Hot Side", group = "Insulation"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns_hot = 0.04 "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Hot Side", group = "Insulation"));
  parameter Modelica.Units.SI.SpecificHeatCapacity cpm_hot = 445 "Metal specific heat capacity" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.Density rhom_hot = 8000 "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.ThermalConductivity lambdam_hot = 45 "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Hot Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_start_hot "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start_hot "Pressure start value of in going fluid hot side" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start_hot "Pressure start value of outgoing fluid hot side" annotation (
    Dialog(group = "Initialisation"));
//   parameter Modelica.Units.SI.SpecificEnthalpy hin_start_hot "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
//     Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_hot "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_hot "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));

  // Cold side
  parameter Modelica.Units.SI.Length L_cold "Length of the tube hot side" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length h_cold = 0 "Height, positive if outlet is higher than inlet. = 0 ports at same hight" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length t_cold = 0.003 "Thickness of the tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Length Di_cold = 51e-3 "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.Area Stot_cold "Internal Diameter of a single tube" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Integer nPipes_cold = 2 "Number of parallel pipes" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Modelica.Units.SI.PerUnit cf_cold = 0.004 "Constant Fanning friction coefficient" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Real k_cold(unit = "Pa/(kg/s)") = 500 "Coefficient for the calculation of the pressure loss across the pipe" annotation (
    Dialog(tab = "Cold Side", group = "Pipe"));
  parameter Integer n_cold = n "Number of finite volumes in each pipe" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter Modelica.Units.SI.Velocity u_nom_cold = 1 "Nominal fluid velocity" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter Modelica.Units.SI.Density rho_nom_cold = 997 "Nominal density of the fluid" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype_cold = Choices.Pipe.HCtypes.Middle "Location of pressure state" annotation (
    Dialog(tab = "Cold Side", group = "Fluid"));
  parameter Modelica.Units.SI.PerUnit kc_cold "Corrective factor for heat tranfer" annotation (
    Dialog(tab = "Cold Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom_cold = 1500 "nominal heat transfer coeffcient" annotation (
    Dialog(tab = "Cold Side", group = "Heat Transfer Model"));
  parameter DistrictHeatingNetwork.Types.PerUnit alpha_cold = 0 "Exponent in the flow-dependency law" annotation (
    Dialog(tab = "Cold Side", group = "Heat Transfer Model"));
  parameter Modelica.Units.SI.Length tIns_cold = 0.15 "Insulation thickness" annotation (
    Dialog(tab = "Cold Side", group = "Insulation"));
  parameter Modelica.Units.SI.ThermalConductivity lambdaIns_cold = 0.04 "Thermal conductivity of the insulant material" annotation (
    Dialog(tab = "Cold Side", group = "Insulation"));
  parameter Modelica.Units.SI.SpecificHeatCapacity cpm_cold = 445 "Metal specific heat capacity" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.Density rhom_cold = 8000 "Metal density [g/cm^3], for steel = 8" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.ThermalConductivity lambdam_cold = 45 "Metal thermal conductivity; steel = 45" annotation (
    Dialog(tab = "Cold Side", group = "Metal Properties"));
  parameter Modelica.Units.SI.MassFlowRate m_flow_start_cold "Start value for mass flow rate" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pin_start_cold "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
  parameter Modelica.Units.SI.Pressure pout_start_cold "Pressure start value of outgoing fluid" annotation (
    Dialog(group = "Initialisation"));
//   parameter Modelica.Units.SI.SpecificEnthalpy hin_start_cold "Specific enthalpy start value at the inlet of the heat exchanger" annotation (
//     Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_cold "Temperature start value of fluid at the start of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_cold "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Initialisation"));
  // Wall
  parameter Boolean WallRes = false "Wall thermal resistance accounted for" annotation (
    Dialog(group = "Wall"));
  parameter SI.Mass MWall "Total mass of the wall in heat exchanger" annotation (
    Dialog(group = "Wall"));
  parameter Modelica.Units.SI.ThermalConductance UA_ext = 1500 "Equivalent thermal conductance of outer half-wall" annotation (
    Dialog(enable = WallRes));
  parameter Modelica.Units.SI.ThermalConductance UA_int = 0.1 "Equivalent thermal conductance of inner half-wall" annotation (
    Dialog(enable = WallRes));
  parameter SI.TemperatureDifference LMTD_nom = TestFacility.Data.BPHEData.E701.LMTD annotation (
    Dialog(group = "Wall"));
  final parameter SI.SpecificHeatCapacity cpWall = cpm_hot "Specific heat capacity of the wall";
  parameter DistrictHeatingNetwork.Types.Temperature T1_wall_start = 70 + 273.15 "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Wall"));
  parameter DistrictHeatingNetwork.Types.Temperature TN_wall_start = 50 + 273.15 "Temperature start value of fluid at the end of the heat exchanger" annotation (
    Dialog(group = "Wall"));


  Types.Temperature Tin_hot;
  Types.Temperature Tout_hot;
  Types.Temperature Tin_cold;
  Types.Temperature Tout_cold;
  Types.Pressure pin_hot;
  Types.Pressure pout_hot;
  Types.Pressure pin_cold;
  Types.Pressure pout_cold;
  //SI.TemperatureDifference LMTD(start = LMTD_nom);
  Types.Power Pt;
  Real dT2(start = Tout_start_hot - Tin_start_cold), dT1(start = Tin_start_hot - Tout_start_cold);
  //Types.CoefficientOfHeatTransfer gamma_real;
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet inhot "Inlet of the hot fluid" annotation (
    Placement(transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{10, 50}, {50, 90}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outhot "Outlet of the hot fluid" annotation (
    Placement(transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{10, -90}, {50, -50}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortOutlet outcold "Outlet of the cold fluid" annotation (
    Placement(transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-2, 2}, extent = {{-48, 48}, {-8, 88}})));
  MultiEnergySystem.DistrictHeatingNetwork.Interfaces.FluidPortInlet incold "Inlet of the cold fluid" annotation (
    Placement(transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-50, -90}, {-10, -50}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV hotside(
    redeclare model HeatTransferModel =
        HeatTransferModel,                                                                                                               redeclare model Medium = Medium, Di = Di_hot, L = L_hot, q_m3h_start = m_flow_start_hot*3600/980, initOpt = initOpt, Stot = Stot_hot, Tin_start = Tin_start_hot, Tout_start = Tout_start_hot, cf = cf_hot, cm = cpm_hot, tIns = tIns_hot, t = t_hot, gamma_nom = gamma_nom_hot, h = h_hot, hctype = hctype_hot, k = k_hot, kc = kc_hot, lambdaIns = lambdaIns_hot, lambdam = lambdam_hot, n = n, nPipes = nPipes_hot, pin_start = pin_start_hot, pout_start = pout_start_hot, rho_nom = rho_nom_hot, rhom = rhom_hot, thermalInertia = thermalInertia, u_nom = u_nom_hot,
    alpha=alpha_hot)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV coldside(redeclare model HeatTransferModel =
        HeatTransferModel,                                                                                                                redeclare model Medium = Medium, Di = Di_cold, L = L_cold, q_m3h_start = m_flow_start_cold*3600/995, initOpt = initOpt, Stot = Stot_cold, Tin_start = Tin_start_cold, Tout_start = Tout_start_cold, cf = cf_cold, cm = cpm_cold, tIns = tIns_cold, t = t_cold, gamma_nom = gamma_nom_cold, h = h_cold, hctype = hctype_cold, k = k_cold, kc = kc_cold, lambdaIns = lambdaIns_cold, lambdam = lambdam_cold, n = n, nPipes = nPipes_cold, pin_start = pin_start_cold, pout_start = pout_start_cold, rho_nom = rho_nom_cold, rhom = rhom_cold, thermalInertia = thermalInertia, u_nom = u_nom_cold,
    alpha=alpha_cold)                                                                                                                                                                                                         annotation (
    Placement(transformation(origin = {-70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.Wall.MetalWallFV wall(M = MWall, Nw = n, WallRes = WallRes, UA_ext = UA_ext, UA_int = UA_int,
    Tstart1=T1_wall_start,
    TstartN=TN_wall_start,
    Tstartbar=318.15,                                                                                                                                                                                                        cm = cpWall, initOpt = initOpt) annotation (
    Placement(transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Thermal.HeatExchangerTopologyFV topology(redeclare model HeatExchangerTopology =
        DistrictHeatingNetwork.Components.Thermal.HeatExchangerTopologies.CounterCurrentFlow,                                                                            Nw = n) annotation (
    Placement(transformation(origin = {-4, 0}, extent = {{-10, -26}, {10, -6}}, rotation = -90)));
equation
  dT2 = Tout_hot - Tin_cold;
  dT1 = Tin_hot - Tout_cold;
//   if noEvent(dT2>0 or dT2<0 or dT1>0 or dT1<0) then
//     LMTD = homotopy((dT1 - dT2)/log(abs(dT1/dT2)), (dT1-dT2) / log(abs((Tin_start_hot - Tout_start_cold)/(Tout_start_hot - Tin_start_cold))));
//     gamma_real = Pt/(hotside.Stot*LMTD);
//   else
//     LMTD = 0;
//     gamma_real = 0;
//   end if;

  Tin_hot = hotside.T[1];
  Tout_hot = hotside.T[hotside.n + 1];
  Tin_cold = coldside.T[1];
  Tout_cold = coldside.T[coldside.n + 1];
  pin_hot = hotside.inlet.p;
  pout_hot = hotside.outlet.p;
  pin_cold = coldside.inlet.p;
  pout_cold = coldside.outlet.p;
  //LMTD = ((Tin_hot - Tout_cold) - (Tout_hot - Tin_cold))/log(abs((Tin_hot - Tout_cold)/(Tout_hot - Tin_cold)));
  Pt = inhot.m_flow*(hotside.fluid[1].h - hotside.fluid[n + 1].h);
  //gamma_real = Pt/(hotside.Stot*LMTD);

  connect(coldside.outlet, outcold) annotation (Line(
      points={{-70,10},{-70,70}},
      color={140,56,54},
      thickness=0.5));
  connect(coldside.inlet, incold) annotation (Line(
      points={{-70,-10},{-70,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(hotside.outlet, outhot) annotation (Line(
      points={{70,-10},{70,-70}},
      color={140,56,54},
      thickness=0.5));
  connect(hotside.inlet, inhot) annotation (Line(
      points={{70,10},{70,70}},
      color={140,56,54},
      thickness=0.5));
  connect(coldside.wall, topology.side2) annotation (Line(
      points={{-65.9,-8.88178e-16},{-44.5,-8.88178e-16},{-44.5,4.21885e-15},{-23.1,4.21885e-15}},
      color={255,101,98},
      thickness=0.5));
  connect(topology.side1, wall.ext) annotation (Line(
      points={{-17,3.10862e-15},{-0.05,3.10862e-15},{-0.05,6.66134e-16},{16.9,6.66134e-16}},
      color={255,101,98},
      thickness=0.5));
  connect(wall.int, hotside.wall) annotation (Line(
      points={{23,-6.66134e-16},{44.45,-6.66134e-16},{44.45,0},{65.9,0}},
      color={255,101,98},
      thickness=0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-60, -100}, {60, 100}}), graphics={  Rectangle(lineColor = {140, 56, 54}, fillColor = {192, 80, 77}, fillPattern = FillPattern.Forward, lineThickness = 0.5, extent = {{-60, 100}, {60, -100}}, radius = 20), Text(textColor = {28, 108, 200}, extent = {{-60, -100}, {60, -140}}, textString = "%name"), Line(origin = {-66.58, -69.45}, points = {{8, 0}, {16, 0}}, color = {94, 82, 255}, pattern = LinePattern.Dash, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {-58.73, 70.36}, points = {{8, 0}, {0, 0}}, color = {57, 0, 172}, pattern = LinePattern.Dash, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {43.2, -68.29}, points = {{8, 0}, {16, 0}}, color = {255, 49, 52}, pattern = LinePattern.Dash, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {51.29, 69.9}, points = {{8, 0}, {0, 0}}, color = {255, 49, 52}, pattern = LinePattern.Dash, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {30.22, -8.08}, rotation = 90, points = {{-39.92, 0.22}, {-19.92, 0.22}, {-9.92, 20.22}, {10.08, -19.78}, {30.08, 20.22}, {40.08, 0.22}, {60.08, 0.22}}, color = {255, 49, 52}, pattern = LinePattern.Dash, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 20), Line(origin = {-29.78, -12.08}, rotation = 90, points = {{-39.92, 0.22}, {-19.92, 0.22}, {-9.92, 20.22}, {10.08, -19.78}, {30.08, 20.22}, {40.08, 0.22}, {60.08, 0.22}}, color = {76, 0, 227}, pattern = LinePattern.Dash, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 20)}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {1, 1})));
end BrazedPlateHeatExchanger;
