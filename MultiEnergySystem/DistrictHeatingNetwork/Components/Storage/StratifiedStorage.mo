within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model StratifiedStorage
  "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume(redeclare
      model Medium =
        DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity);
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  import Modelica.Fluid.Utilities.regStep;

  parameter Integer n = 4 "Number of volumes (min = 2)" annotation (
    Dialog(tab = "Data", group = "Fluid"));
  parameter DistrictHeatingNetwork.Choices.Init.Options initOpt = system.initOpt "Initialisation option" annotation (
    Dialog(group = "Initialisation"));
  // Insulation parameters
  parameter SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter SI.Length dIns = 0.15 "Insulation thickness";
  parameter SI.ThermalConductivity lambda_w = 0.4 "Water conductivity for heat exchange between volumes";

  outer System system "system object for global defaults";
  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";
  final parameter Types.Area A = Modelica.Constants.pi*(D/2)^2 "Cross section area of the TES";
  parameter Types.MassFlowRate m_flow_nom = 2 "Nominal mass flow rate";
  parameter Types.SpecificEnthalpy hin_start = fluid[1].h_start;

  //Variables
  //SI.Mass M(start = M_id) "Total mass in the tank";
  Types.Density rho[n+1](each nominal = 1000) "Density of the fluid in the tank (at the outlet)";
  Types.MassFlowRate m_flow[n+1](each start = m_flow_start);
  Types.Pressure p[n+1](start = linspace(pin_start, pout_start, n+1));
  Types.Pressure ptilde[n](start = linspace(pin_start, pout_start, n));
  Types.Temperature T[n+1](start = linspace(Tin_start, Tout_start, n+1)) "Temperatue of the water inside the volume";
  Types.Temperature Ttilde[n](each stateSelect = StateSelect.prefer) "Temperatue of the water inside the volume";
  Types.HeatFlowRate Q_amb[n](each start = (R_flat + R_lateral)/(R_flat*R_lateral)*(T_start - T_ext)) "Heat losses to ambient";
  Types.HeatFlowRate Q_cond[n] "Heat losses to other layers";
  Types.Mass M[n] "Mass of fluid in each finite volume";
  Types.Mass Mtot(start = M_id) "Total Mass in the pipe";

  Medium fluid[n+1](
    T_start = linspace(T_start, T_start - 1, n+1),
    p_start = linspace(pin_start, pout_start, n+1),
    each computeTransport = true);
  Medium fluid_temp(T_start = Tin_start, p_start = pin_start);

  Modelica.Blocks.Interfaces.RealOutput T1 annotation (Placement(transformation(
          extent={{94,-100},{114,-80}}), iconTransformation(extent={{94,-100},{114,
            -80}})));
  Modelica.Blocks.Interfaces.RealOutput T2 annotation (Placement(transformation(
          extent={{92,-40},{112,-20}}), iconTransformation(extent={{92,-40},{112,
            -20}})));
  Modelica.Blocks.Interfaces.RealOutput T3 annotation (Placement(transformation(
          extent={{92,20},{112,40}}), iconTransformation(extent={{92,20},{112,40}})));
  Modelica.Blocks.Interfaces.RealOutput T4 annotation (Placement(transformation(
          extent={{92,80},{112,100}}), iconTransformation(extent={{92,80},{112,100}})));
equation
  // Fluid
  fluid.T = T;
  fluid.p = p;

  // Boundary equations
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n+1];
  inlet.h_out = fluid[1].h;
  outlet.h_out = fluid[n+1].h;

  // State variables
  Ttilde = regStep(inlet.m_flow, T[2:n+1], T[1:n], m_flow_nom*1e-4);
  ptilde = p[2:n+1];

  // Other variables
  rho = fluid.rho;
  Tin = fluid[1].T;
  Tout = fluid[n+1].T;
  pin = fluid[1].p;
  pout = fluid[n+1].p;

  Mtot = sum(M) "Total mass";

  // Mass Balance
  //inlet.m_flow + outlet.m_flow = 0;
  M = regStep(inlet.m_flow, rho[2:n+1], rho[1:n], m_flow_nom*1e-4)*(V/n);

  // Energy balance
  for i in 1:n loop
    // Mass Balance
    //m_flow[i] - m_flow[i+1] = (V/n)*(fluid[i+1].drho_dT*der(Ttilde[i]) + 1e-5*der(ptilde[i]));
    //m_flow[i] - m_flow[i+1] = 0;
    m_flow[i] - m_flow[i+1] = (V/n)*(regStep(inlet.m_flow, fluid[i+1].drho_dT, fluid[i].drho_dT, m_flow_nom*1e-4)*der(Ttilde[i]));
    // Volume energy balance
    //((V/n)*fluid[i+1].drho_dT*fluid[i+1].u + M[i]*fluid[i+1].cp)*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h - Q_amb[i] - Q_cond[i];
    //((V/n)*fluid[i+1].drho_dT*fluid[i+1].u + M[i]*fluid[i+1].cp)*der(Ttilde[i]) = m_flow[i]*fluid[i+1].cp*(T[i]-T[i+1]) - Q_amb[i] - Q_cond[i];
    //(M[i]*fluid[i+1].cp)*der(Ttilde[i]) = m_flow[i]*fluid[i+1].cp*(T[i]-T[i+1]) - Q_amb[i] - Q_cond[i];
    (M[i]*regStep(inlet.m_flow, fluid[i+1].cp, fluid[i].cp, m_flow_nom*1e-4))*der(Ttilde[i]) = m_flow[i]*regStep(inlet.m_flow, fluid[i+1].cp, fluid[i].cp, m_flow_nom*1e-4)*(T[i]-T[i+1]) - Q_amb[i] - Q_cond[i];

    if i == 1 then
      // Heat exchange with the ambient from flat top face
      Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(Ttilde[i] - T_ext);
      //Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(T[i] - T_ext);
      // Heat exchange with 2nd volume
      //Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i] - Ttilde[i+1]);
      //Q_cond[i] = fluid[1].kappa*A/(H/n)*(Ttilde[i] - Ttilde[i+1]);
      Q_cond[i] = fluid[i].kappa*A/(H/n)*(T[i] - T[i+1]);
    elseif i == n then
      // Heat exchange with ambient
      Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(Ttilde[i] - T_ext);
      //Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(T[i] - T_ext);
      // Heat exchange with N-1th volume
      //Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i-1] - Ttilde[i]);
      //Q_cond[i] = fluid[i-1].kappa*A/(H/n)*(Ttilde[i-1] - Ttilde[i]);
      Q_cond[i] = fluid[i].kappa*A/(H/n)*(T[i] - T[i+1]);
    else
      // Heat exchange with the ambient from lateral faces
      //Q_amb[i] = 1/R_lateral*(Ttilde[i] - T_ext);
      Q_amb[i] = 1/R_lateral*(T[i] - T_ext);
      // Heat exchange with layer above and below
      //Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i+1] - 2*Ttilde[i] + Ttilde[i-1]);
      //Q_cond[i] = fluid[i].kappa*A/(H/n)*(Ttilde[i+1] - 2*Ttilde[i] + Ttilde[i-1]);
      Q_cond[i] = fluid[i].kappa*A/(H/n)*(T[i] - T[i+1]);
    end if;

  end for;

  // Momentum Balance
  //pin - pout = rho[n+1]*H*g_n;
  p[1:n] - p[2:n+1] = rho[1:n]*(H/n)*g_n;

  if noEvent(inlet.m_flow > 0) then
    T[1] = fluid_temp.T;
  else
    T[end] = fluid_temp.T;
  end if;

  fluid_temp.p = homotopy(regStep(inlet.m_flow, inlet.p, outlet.p, m_flow_nom*1e-4), pin_start*1e-4);
  fluid_temp.h = homotopy(regStep(inlet.m_flow, inStream(inlet.h_out), inStream(outlet.h_out), m_flow_nom*1e-4), hin_start);


  T1 = (T[1]+T[2])/2;
  T2 = (T[2]+T[3])/2;
  T3 = (T[3]+T[4])/2;
  T4 = (T[4]+T[5])/2;

initial equation
  if initOpt == Choices.Init.Options.steadyState then
    der(Ttilde) = zeros(n);
  elseif initOpt == Choices.Init.Options.fixedState then
    Ttilde = linspace((Tout_start - Tin_start)/n + Tin_start, Tout_start, n);
  else
//No initial equations
  end if;
  annotation (
    Icon(graphics={  Rectangle(origin={76,-140},    fillColor={140,56,54},       fillPattern=
              FillPattern.Solid,                                                                                  extent = {{-4, 20}, {4, -20}}), Rectangle(origin={-76,-140},    fillColor={140,56,
              54},                                                                                                                                                                                             fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        extent = {{-4, 20}, {4, -20}}), Text(origin={0,-180},    extent = {{-100, 20}, {100, -20}},
          textString="%name",
          textColor={140,56,54}),                                                                                                                                                                                                        Rectangle(                  lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent={{-100,
              120},{100,-100}}),                                                                                                                                                                                                        Ellipse(origin={0,123},    lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        extent = {{-100, 37}, {100, -37}}), Ellipse(origin={0,-101},   lineColor={140,56,
              54},                                                                                                                                                                                                        fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 37}, {100, -37}}),                                                                                                                                                                          Rectangle(origin = {-71, 54}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Rectangle(origin = {-71, -60}, lineColor = {0, 0, 255}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-7, 20}, {7, -20}}), Polygon(origin={-61,-146},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-11, -14}, {1, 14}, {11, 12}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin={73,-146},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-11, -14}, {-21, 12}, {-13, 14}, {-1, -14}, {-1, -14}, {-11, -14}}), Polygon(origin={5,-146},    fillColor={140,56,
              54},                                                                                                                                                                                                        fillPattern=
              FillPattern.Solid,                                                                                                                                                                                                        points = {{-13, -14}, {-13, 22}, {3, 22}, {3, -14}, {3, -14}, {-13, -14}})}, coordinateSystem(extent={{-100,
            -160},{100,160}})));
end StratifiedStorage;
