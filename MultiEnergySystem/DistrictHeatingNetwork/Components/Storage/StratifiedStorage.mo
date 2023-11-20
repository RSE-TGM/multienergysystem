within MultiEnergySystem.DistrictHeatingNetwork.Components.Storage;
model StratifiedStorage
  "Model a perfectly mixed thermal storage with insulation all around. Output temperature in Celsius [°C]"
  extends
    MultiEnergySystem.DistrictHeatingNetwork.Components.BaseClass.PartialLumpedVolume;
  import MultiEnergySystem.DistrictHeatingNetwork.Media.{cp,rho0};
  parameter Integer n = 3 "Number of volumes (min = 2)" annotation (
    Dialog(tab = "Data", group = "Fluid"));

  // Insulation parameters
  parameter SI.ThermalConductivity lambdaIns = 0.04 "Conductance of the insulation material";
  parameter SI.Length dIns = 0.15 "Insulation thickness";
  parameter SI.ThermalConductivity lambda_w = 0.4 "Water conductivity for heat exchange between volumes";


  final parameter Modelica.Units.SI.ThermalResistance R_lateral = log((D/2 + dIns)/(D/2))/(lambdaIns*2*Modelica.Constants.pi*H) "Thermal resistance [K/W] computed approximating the TES with a cylinder.";
  final parameter Modelica.Units.SI.ThermalResistance R_flat = dIns/(lambdaIns*Modelica.Constants.pi*(D/2)^2) "Flat Surface of the cylinder";
  final parameter SI.Area A = Modelica.Constants.pi*(D/2)^2 "Cross section area of the TES";

  //Variables
  //SI.Mass M(start = M_id) "Total mass in the tank";
  SI.Density rho[n+1] "Density of the fluid in the tank (at the outlet)";
  SI.MassFlowRate m_flow[n+1](each start = m_flow_start, each min = 0);
  SI.Pressure p[n+1](start = linspace(pin_start, pout_start, n+1));
  SI.Pressure ptilde[n](start = linspace(pin_start,pout_start,n));
  SI.Temperature T[n+1](start = linspace(T_start, T_start-1, n+1)) "Temperatue of the water inside the volume";
  SI.Temperature Ttilde[n](start = linspace(T_start, T_start-1,n),  each stateSelect = StateSelect.prefer) "Temperatue of the water inside the volume";
  SI.HeatFlowRate Q_amb[n](each start = (R_flat + R_lateral)/(R_flat*R_lateral)*(T_start - T_ext)) "Heat losses to ambient";
  SI.HeatFlowRate Q_cond[n] "Heat losses to other layers";
  SI.Mass M[n] "Mass of fluid in each finite volume";
  SI.Mass Mtot(start = M_id) "Total Mass in the pipe";

  //Medium fluidIn(T_start = T_start, p_start = pin_start), fluidOut(T_start = T_start, p_start = pin_start + 995*H*Modelica.Constants.g_n);
  Medium fluid[n+1](
    T_start = linspace(T_start, T_start - 1, n+1),
    p_start = linspace(pin_start, pout_start, n+1));
//   Medium fluid_temp(
//     T_start = T_start,
//     p_start = pin_start);
//  Medium fluidIn(T_start = T_start, p_start = pin_start), fluidOut(T_start = T_start, p_start = pin_start + 995*H*Modelica.Constants.g_n);

equation
// Fluid
  fluid.T = T;
  fluid.p = p;

//  {fluidIn.p, fluidIn.h} = {pin, inlet.h_out};
//  {fluidOut.p, fluidOut.T} = {pout, Tout};

  // Boundary equations
  inlet.m_flow = m_flow[1];
  outlet.m_flow = -m_flow[n+1];
  outlet.h_out = fluid[n+1].h;
  fluid[1].h = inStream(inlet.h_out);

  // State variables
  Ttilde = T[2:n+1];
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
  M = rho[2:n+1]*(V/n);

  // Energy balance
  for i in 1:n loop
    // Mass Balance
    m_flow[i] - m_flow[i+1] = (V/n)*(fluid[i+1].drho_dT*der(Ttilde[i]) + 1e-5*der(ptilde[i]));
    //0 = m_flow[i] - m_flow[i+1];
    // Volume energy balance
    //((V/n)*fluid[i+1].drho_dT*fluid[i+1].u + M[i]*fluid[i+1].cp)*der(Ttilde[i]) = m_flow[i]*fluid[i].h - m_flow[i+1]*fluid[i+1].h - Q_amb[i] - Q_cond[i];
    ((V/n)*fluid[i+1].drho_dT*fluid[i+1].u + M[i]*fluid[i+1].cp)*der(Ttilde[i]) = m_flow[i]*fluid[i+1].cp*(T[i]-T[i+1]) - Q_amb[i] - Q_cond[i];

    //Q_amb[i] = 0;
    //Q_cond[i] = 0;
    if i == 1 then
      // Heat exchange with the ambient from flat top face
      Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(Ttilde[i] - T_ext);
      // Heat exchange with 2nd volume
      Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i] - Ttilde[i+1]);
    elseif i == n then
      // Heat exchange with ambient
      Q_amb[i] = (R_flat + R_lateral)/(R_flat*R_lateral)*(Ttilde[i] - T_ext);
      // Heat exchange with N-1th volume
      Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i-1] - Ttilde[i]);
    else
      // Heat exchange with the ambient from lateral faces
      Q_amb[i] = 1/R_lateral*(Ttilde[i] - T_ext);
      // Heat exchange with layer above and below
      Q_cond[i] = lambda_w*A/(H/n)*(Ttilde[i+1] - 2*Ttilde[i] + Ttilde[i-1]);
    end if;

  end for;

  // Momentum Balance
  //pin - pout = rho[n+1]*H*g_n;
  p[1:n] - p[2:n+1] = rho[2:n+1]*(H/n)*g_n;


initial equation
  der(Ttilde) = zeros(n);
  der(ptilde) = zeros(n);
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
