within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model GasBoiler "System 100"
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  constant Real pi = Modelica.Constants.pi;

  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 65 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Velocity u_nom = 5;

  final parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;

  final parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  final parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  final parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  final parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  final parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  final parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
  final parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
  final parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=12.25;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=10.85;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1*985/3600;

  parameter Real q_m3h_S1(unit = "m3/h") = 9;
  parameter Real P101omega[:,:] = [0, 2*pi*50; 100, 2*pi*50];
  parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:,:] = [0, 1];
  parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

  parameter DistrictHeatingNetwork.Types.Power Pnom = 147.6e3;
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 147.6e3*0.8;
  parameter DistrictHeatingNetwork.Types.Power Pminnom = 147.6e3*0.2;
  parameter DistrictHeatingNetwork.Types.Length h = 1.2*0.93;
  parameter DistrictHeatingNetwork.Types.Length D = 0.64;

  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,110},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P101.a,
    b=DistrictHeatingNetwork.Data.PumpData.P101.b,
    m_flow_start=m_flow_S1,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P101.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P101.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P101.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P101.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P101.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P101.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P101.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P101.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P101.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h,
    use_in_omega=true)                                                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={20,5})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,76})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB(
    h=h,
    D=D,
    Pmaxnom=Pmaxnom,
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Tout_start=Tout_start_S1,
    Pnimnom=Pminnom,
    Pnom=Pnom,
    HH=55.5e6) annotation (Placement(visible=true, transformation(
        origin={0,-84},
        extent={{-36,-36},{36,36}},
        rotation=0)));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_GB101_P101(
    L=L_GB101_P101,
    h=h_GB101_P101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,-24})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_FT101_GB101(
    L=L_FT101_GB101,
    h=h_FT101_GB101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-24})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_TT101_FT101(
    L=L_TT101_FT101,
    h=h_TT101_FT101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,6})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_P101_FCV101(
    L=L_P101_FCV101,
    h=h_P101_FCV101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,44})));
  Modelica.Blocks.Interfaces.RealInput theta "Opening valve of the valve's system" annotation (
      Placement(transformation(extent={{-100,30},{-60,70}}), iconTransformation(extent={{-100,30},{-60,
            70}})));
  Modelica.Blocks.Interfaces.RealInput omega "Rotational speed for circulation pump" annotation (
      Placement(transformation(extent={{-100,-20},{-60,20}}), iconTransformation(extent={{-100,-20},
            {-60,20}})));
  Modelica.Blocks.Interfaces.RealInput Tout_SP "Outlet temperature set point" annotation (Placement(
        transformation(extent={{-100,-70},{-60,-30}}), iconTransformation(extent={{-100,-70},{-60,-30}})));
  Modelica.Blocks.Interfaces.BooleanInput Status annotation (Placement(transformation(extent={{100,-20},
            {60,20}}),          iconTransformation(extent={{100,-20},{60,20}})));
equation
  connect(P101.inlet,PL_S100_GB101_P101. outlet) annotation (Line(
      points={{20,-4.6},{20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_FT101_GB101.outlet, GB.inlet) annotation (Line(
      points={{-20,-34},{-20,-42},{-10.8,-42},{-10.8,-55.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_GB101_P101.inlet, GB.outlet) annotation (Line(
      points={{20,-34},{20,-42},{10.8,-42},{10.8,-55.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet,P101. outlet) annotation (Line(
      points={{20,34},{20,14.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,PL_S100_P101_FCV101. outlet) annotation (Line(
      points={{20,66},{20,54}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.outlet, PL_S100_FT101_GB101.inlet)
    annotation (Line(
      points={{-20,-4},{-20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(Status, GB.heat_on) annotation (Line(points={{80,0},{40,0},{40,-130},{-48,-130},{-48,-105.6},
          {-28.8,-105.6}},                                                      color={255,0,255}));
  connect(Tout_SP, GB.Tout_ref)
    annotation (Line(points={{-80,-50},{-50,-50},{-50,-84},{-28.8,-84}}, color={0,0,127}));
  connect(theta, FCV101.opening) annotation (Line(points={{-80,50},{-34,50},{-34,76},{12,76}},
                                                                             color={0,0,127}));
  connect(omega, P101.in_omega)
    annotation (Line(points={{-80,0},{0,0},{0,0.2},{14,0.2}},     color={0,0,127}));
  connect(PL_S100_TT101_FT101.inlet, inlet)
    annotation (Line(
      points={{-20,16},{-20,90}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.outlet, outlet)
    annotation (Line(
      points={{20,86},{20,110}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(                                             graphics={
                     Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points={{-21,-35},
              {-27,-3},{-21,-13},{-19,25},{-11,13},{1,37},{13,13},{19,25},{23,-15},{27,-5},{23,-35},
              {1,-43},{-21,-35}}),                                                                                                                                                                                                        Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points={{-15,-35},
              {-23,-13},{-15,-17},{-15,3},{-9,-1},{1,25},{9,-1},{15,3},{17,-17},{23,-13},{15,-37},{1,
              -43},{-15,-35}})}),                                Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}})));
end GasBoiler;
