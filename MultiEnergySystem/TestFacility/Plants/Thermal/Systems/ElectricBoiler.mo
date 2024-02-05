within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model ElectricBoiler "System 400"
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  constant Real pi = Modelica.Constants.pi;

  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;

  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
  final parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Velocity u_nom = 5;
  parameter Real q_m3h_S4 = 5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV401theta[:,:] = [0, 1];
  parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,90},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,110},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={30,80},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
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
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTBoiler(T_start=Tin_start_S4, p_start=
        pin_start_S4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-16,64})));
  Modelica.Blocks.Interfaces.RealOutput m_flow annotation (Placement(transformation(extent={{60,30},
            {100,70}}), iconTransformation(extent={{60,30},{100,70}})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=333.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=300000,
    pout_start=290000,
    nR=3.5)            annotation (Placement(visible=true, transformation(
        origin={-2,-102},
        extent={{-44,-44},{44,44}},
        rotation=0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P401.a,
    b=DistrictHeatingNetwork.Data.PumpData.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P401.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P401.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P401.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P401.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P401.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P401.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start,
    headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={18,3})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV401(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,66})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL_S400_EB401_P401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,-26})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,-26})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL4_S401(
    L=L_S4_PL3,
    h=0.8,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,32})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,10})));
equation
  connect(FTBoiler.m_flow, m_flow)
    annotation (Line(points={{-10,57},{-10,32},{50,32},{50,50},{80,50}}, color={0,0,127}));
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-22,-36},{-22,-48.7},{-15.2,-48.7},{-15.2,-66.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL_S400_EB401_P401. inlet) annotation (Line(
      points={{11.2,-66.8},{12,-66.8},{12,-48},{18,-48},{18,-36}},
      color={140,56,54},
      thickness=0.5));
  connect(m_flow, m_flow) annotation (Line(points={{80,50},{80,50}}, color={0,0,127}));
  connect(Status, EB401.heat_on) annotation (Line(points={{80,0},{46,0},{46,-154},{-70,-154},{-70,-128.4},
          {-37.2,-128.4}}, color={255,0,255}));
  connect(Tout_SP, EB401.Tout_ref)
    annotation (Line(points={{-80,-50},{-56,-50},{-56,-102},{-37.2,-102}}, color={0,0,127}));
  connect(omega, P401.in_omega) annotation (Line(points={{-80,0},{-36,0},{-36,-8},{0,-8},{0,-1.8},{12,
          -1.8}}, color={0,0,127}));
  connect(PL2_S401.inlet, PL1_S401.outlet)
    annotation (Line(
      points={{-22,-16},{-22,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet, FTBoiler.outlet) annotation (Line(
      points={{-22,20},{-22,50},{-20,50},{-20,58}},
      color={140,56,54},
      thickness=0.5));
  connect(FTBoiler.inlet, inlet)
    annotation (Line(
      points={{-20,70},{-20,90}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.outlet, outlet) annotation (Line(
      points={{18,76},{18,96},{20,96},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.outlet, FCV401.inlet)
    annotation (Line(
      points={{18,42},{18,56}},
      color={140,56,54},
      thickness=0.5));
  connect(theta, FCV401.opening)
    annotation (Line(points={{-80,50},{38,50},{38,66},{26,66}}, color={0,0,127}));
  connect(PL_S400_EB401_P401.outlet, P401.inlet)
    annotation (Line(
      points={{18,-16},{18,-6.6}},
      color={140,56,54},
      thickness=0.5));
  connect(P401.outlet, PL4_S401.inlet)
    annotation (Line(
      points={{18,12.6},{18,22}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(                                             graphics={
                     Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Horizontal, points={{-21,-35},
              {-27,-3},{-21,-13},{-19,25},{-11,13},{1,37},{13,13},{19,25},{23,-15},{27,-5},{23,-35},
              {1,-43},{-21,-35}}),                                                                                                                                                                                                        Polygon(origin={-1,3},    lineColor = {255, 0, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points={{-15,-35},
              {-23,-13},{-15,-17},{-15,3},{-9,-1},{1,25},{9,-1},{15,3},{17,-17},{23,-13},{15,-37},{1,
              -43},{-15,-35}})}),                                Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}})));
end ElectricBoiler;
